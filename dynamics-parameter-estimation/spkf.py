import numpy as np
import scipy as sp
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib as mpl
from math import sqrt

from dynamics import get_acceleration

class SPKFParameterEstimator:

    def __init__(self, est_params):
        self._dim_wrench = 6
        self._dim_accel = 6
        self._dim_params = 32
        self._dim_state = 9
        self._dim_aug_params = self._dim_params + self._dim_accel

        self._h = sqrt(3)

        self._alpha_0_m = (self._h ** 2 - self._dim_aug_params) / (self._h ** 2)
        self._alpha_k_m = 1 / (2 * (self._h ** 2))
        self._alpha_0_c = self._alpha_0_m
        self._alpha_k_c = self._alpha_k_m

        self._cov_process = 1e-4 * np.identity(self._dim_params)
        self._cov_accel = 1 * np.identity(self._dim_accel)

        self._est_params = est_params
        self._cov_est_params = 1e-12 * np.identity(self._dim_params)

        # self._est_aug_params = np.concatenate((
        #     est_params,
        #     np.zeros(self._dim_accel),
        # ))
        #
        # self._cov_est_aug_params = np.identity(self._dim_params + self._dim_accel)

    def update(self, state: np.array, wrench: np.array, accel: np.array):
        est_params = self._est_params
        cov_est_params = self._cov_est_params

        est_aug_params = np.concatenate((
            est_params,
            np.zeros(self._dim_accel)
        ))

        cov_est_params = cov_est_params + self._cov_process

        cov_est_aug_params = sp.linalg.block_diag(
            cov_est_params,
            self._cov_accel
        )

        # est_aug_params = self._est_aug_params
        # cov_est_aug_params = self._cov_est_aug_params

        sqrt_cov_est_aug_params = np.linalg.cholesky(cov_est_aug_params)

        sigma_points = np.transpose(
            est_aug_params + self._h * np.transpose(
                np.hstack((
                    np.zeros((self._dim_aug_params, 1)),
                    sqrt_cov_est_aug_params,
                    -sqrt_cov_est_aug_params
                ))
            )
        )
        # sigma_points[0, :] = np.clip(sigma_points[0, :], 0, 100)
        # sigma_points[1, :] = np.clip(sigma_points[1, :], 0, 100)
        # sigma_points[8:32, :] = np.clip(sigma_points[8:32, :], 0, 100)

        sigma_point_accels = np.zeros((6, sigma_points.shape[1]))

        for i in range(sigma_points.shape[1]):
            sigma_point_params = sigma_points[0:32, i]
            sigma_point_err = sigma_points[32:38, i]

            sigma_point_accel = get_acceleration(sigma_point_params, state, wrench) + sigma_point_err

            sigma_point_accels[:, i] = sigma_point_accel

        est_accel = np.zeros(self._dim_accel)
        est_accel += self._alpha_0_m * sigma_point_accels[:, 0]
        for i in range(1, sigma_point_accels.shape[1]):
            est_accel += self._alpha_k_m * sigma_point_accels[:, i]

        cov_err_accel = np.zeros((self._dim_accel, self._dim_accel))
        cov_err_accel += self._alpha_0_c * \
             np.outer(sigma_point_accels[:, 0] - est_accel, sigma_point_accels[:, 0] - est_accel)
        for i in range(1, sigma_point_accels.shape[1]):
            cov_err_accel += self._alpha_k_c * \
                             np.outer(sigma_point_accels[:, i] - est_accel, sigma_point_accels[:, i] - est_accel)

        cov_err_params_err_accel = np.zeros((self._dim_params, self._dim_accel))
        cov_err_params_err_accel += self._alpha_0_c * \
                                   np.outer(sigma_points[0:self._dim_params, 0] - est_params, sigma_point_accels[:, 0] - est_accel)
        for i in range(1, sigma_point_accels.shape[1]):
            cov_err_params_err_accel += self._alpha_k_c * \
                             np.outer(sigma_points[0:self._dim_params, i] - est_params, sigma_point_accels[:, i] - est_accel)

        gain = cov_err_params_err_accel @ np.linalg.inv(cov_err_accel)

        est_params = est_params + gain @ np.transpose(accel - est_accel)
        cov_est_params = cov_est_params - gain @ cov_err_accel @ np.transpose(gain)

        # est_aug_params = est_aug_params + gain @ np.transpose(accel - est_accel)
        # cov_est_aug_params = cov_est_aug_params - gain @ cov_err_accel @ np.transpose(gain)

        # self._cov_est_aug_params = cov_est_aug_params
        # self._est_aug_params = est_aug_params

        self._est_params = est_params
        self._cov_est_params = cov_est_params

    def get_est_params(self) -> np.array:
        return self._est_params

def test_constructed_data():
    params = np.concatenate((
        np.array([30]),
        np.array([0.03]),
        np.zeros(3),
        np.zeros(3),
        10 * np.ones(6),
        np.ones(6),
        np.ones(6),
        np.ones(6)
    ))

    initial_est_params = np.concatenate((
        np.clip(np.array([30]) + np.random.normal(scale=1, size=1), 0, np.inf),
        np.clip(np.array([0.03]) + np.random.normal(scale=1e-2, size=1), 0, np.inf),
        np.zeros(3) + np.random.normal(scale=1e-2, size=3),
        np.zeros(3) + np.random.normal(scale=1e-2, size=3),
        np.clip(10 * np.ones(6) + np.random.normal(scale=1, size=6), 0, np.inf),
        np.clip(np.ones(6) + np.random.normal(scale=1, size=6), 0, np.inf),
        np.clip(np.ones(6) + np.random.normal(scale=1, size=6), 0, np.inf),
        np.clip(np.ones(6) + np.random.normal(scale=1, size=6), 0, np.inf)
    ))

    s = SPKFParameterEstimator(initial_est_params)

    n_iterations = 1000

    intermediate_params = np.zeros((n_iterations, 32))

    for i in range(n_iterations):
        state = np.concatenate((
            np.random.uniform(-np.pi, np.pi, size=3),
            np.random.normal(scale=1, size=6)
        ))
        wrench = np.random.normal(scale=50, size=6)
        accel = get_acceleration(params, state, wrench)

        noisy_accel = accel + np.random.normal(scale=1e-2, size=6)

        s.update(state, wrench, noisy_accel)

        intermediate_params[i] = s.get_est_params()

    final_est_params = s.get_est_params()
    print(final_est_params)

    print("initial error:", params - initial_est_params)
    print("final error:", params - final_est_params)

    params_fig, params_axs = plt.subplots(8, figsize=(8, 16))
    params_fig.suptitle("Parameter Evolution", fontsize=18)

    plot_params(params_axs[0], intermediate_params[:,0], np.array([params[0]]), ["m"], "Mass")
    plot_params(params_axs[1], intermediate_params[:,1], np.array([params[1]]), ["v"], "Volume")
    plot_params(params_axs[2], intermediate_params[:,2:5], params[2:5], ["gx", "gy", "gz"], "Center of Gravity")
    plot_params(params_axs[3], intermediate_params[:,5:8], params[5:8], ["bx", "by", "bz"], "Center of Buoyancy")
    plot_params(params_axs[4], intermediate_params[:,8:14], params[8:14], ["Ixx", "Ixy", "Ixz", "Iyy", "Iyz", "Izz"], "Inertia")
    plot_params(params_axs[5], intermediate_params[:,14:20], params[14:20], ["du", "dv", "dw", "dp", "dq", "dr"], "Linear Damping")
    plot_params(params_axs[6], intermediate_params[:,20:26], params[20:26], ["ddu", "ddv", "ddw", "ddp", "ddq", "ddr"], "Quadratic Damping")
    plot_params(params_axs[7], intermediate_params[:,26:32], params[26:32], ["au", "av", "aw", "ap", "aq", "ar"], "Added Mass")

    params_fig.tight_layout()

    intermediate_errors = params - intermediate_params

    errors_fig, errors_axs = plt.subplots(8, figsize=(8, 16))
    errors_fig.suptitle("Error Evolution", fontsize=18)

    plot_errors(errors_axs[0], intermediate_errors[:,0], ["m"], "Mass")
    plot_errors(errors_axs[1], intermediate_errors[:,1], ["v"], "Volume")
    plot_errors(errors_axs[2], intermediate_errors[:,2:5], ["gx", "gy", "gz"], "Center of Gravity")
    plot_errors(errors_axs[3], intermediate_errors[:,5:8], ["bx", "by", "bz"], "Center of Buoyancy")
    plot_errors(errors_axs[4], intermediate_errors[:,8:14], ["Ixx", "Ixy", "Ixz", "Iyy", "Iyz", "Izz"], "Inertia")
    plot_errors(errors_axs[5], intermediate_errors[:,14:20], ["du", "dv", "dw", "dp", "dq", "dr"], "Linear Damping")
    plot_errors(errors_axs[6], intermediate_errors[:,20:26], ["ddu", "ddv", "ddw", "ddp", "ddq", "ddr"], "Quadratic Damping")
    plot_errors(errors_axs[7], intermediate_errors[:,26:32], ["au", "av", "aw", "ap", "aq", "ar"], "Added Mass")

    errors_fig.tight_layout()

    plt.show()

def test_real_data():
    navigation_state_df = pd.read_csv("data/bags-12-01-22/navigation_state.csv")
    navigation_state_df.rename({
        "%time": "time",
        "field.header.seq": "seq",
        "field.header.stamp": "stamp",
        "field.header.frame_id": "frame_id",
        "field.position.x": "position_x",
        "field.position.y": "position_y",
        "field.position.z": "position_z",
        "field.velocity.x": "velocity_x",
        "field.velocity.y": "velocity_y",
        "field.velocity.z": "velocity_z",
        "field.acceleration.x": "acceleration_x",
        "field.acceleration.y": "acceleration_y",
        "field.acceleration.z": "acceleration_z",
        "field.orientation.x": "orientation_r",
        "field.orientation.y": "orientation_p",
        "field.orientation.z": "orientation_y",
        "field.angular_velocity.x": "angular_velocity_r",
        "field.angular_velocity.y": "angular_velocity_p",
        "field.angular_velocity.z": "angular_velocity_y"
    }, axis=1, inplace=True)
    wrench_df = pd.read_csv("data/bags-12-01-22/wrench.csv")
    wrench_df.rename({
       "%time": "time",
       "field.force.x": "force_x",
       "field.force.y": "force_y",
       "field.force.z": "force_z",
       "field.torque.x": "torque_x",
       "field.torque.y": "torque_y",
       "field.torque.z": "torque_z"
    }, axis=1, inplace=True)

    navigation_state_df.index = navigation_state_df["stamp"]
    wrench_df.index = wrench_df["time"]

    navigation_state_df.sort_index(inplace=True)
    wrench_df.sort_index(inplace=True)

    merged_df = pd.merge_asof(navigation_state_df, wrench_df, left_index=True, right_index=True, direction="backward")
    merged_df.rename({"time_x": "time"}, axis=1, inplace=True)
    merged_df["time"] = merged_df["stamp"] / 1e9
    merged_df["a_x"] = (merged_df["velocity_x"].shift(-1) - merged_df["velocity_x"]) / (merged_df["time"].shift(-1) - merged_df["time"])
    merged_df["a_y"] = (merged_df["velocity_y"].shift(-1) - merged_df["velocity_y"]) / (merged_df["time"].shift(-1) - merged_df["time"])
    merged_df["a_z"] = (merged_df["velocity_z"].shift(-1) - merged_df["velocity_z"]) / (merged_df["time"].shift(-1) - merged_df["time"])
    merged_df["v_roll"] = (merged_df["orientation_r"].shift(-1) - merged_df["orientation_r"]) / (merged_df["time"].shift(-1) - merged_df["time"])
    merged_df["v_pitch"] = (merged_df["orientation_p"].shift(-1) - merged_df["orientation_p"]) / (merged_df["time"].shift(-1) - merged_df["time"])
    merged_df["v_yaw"] = (merged_df["orientation_y"].shift(-1) - merged_df["orientation_y"]) / (merged_df["time"].shift(-1) - merged_df["time"])
    merged_df["a_roll"] = (merged_df["v_roll"].shift(-1) - merged_df["v_roll"]) / (merged_df["time"].shift(-1) - merged_df["time"])
    merged_df["a_pitch"] = (merged_df["v_pitch"].shift(-1) - merged_df["v_pitch"]) / (merged_df["time"].shift(-1) - merged_df["time"])
    merged_df["a_yaw"] = (merged_df["v_yaw"].shift(-1) - merged_df["v_yaw"]) / (merged_df["time"].shift(-1) - merged_df["time"])
    merged_df.drop(["time_y", "frame_id"], axis=1, inplace=True)
    merged_df.dropna(inplace=True)
    print(merged_df)

    data_fig, data_axs = plt.subplots(6)
    data_axs[0].plot(merged_df["time"], np.transpose([merged_df["velocity_x"], merged_df["velocity_y"], merged_df["velocity_z"]]))
    data_axs[1].plot(merged_df["time"], np.transpose([merged_df["a_x"], merged_df["a_y"], merged_df["a_z"]]))
    data_axs[2].plot(merged_df["time"], np.transpose([merged_df["force_x"], merged_df["force_y"], merged_df["force_z"]]))
    data_axs[3].plot(merged_df["time"], np.transpose([merged_df["v_roll"], merged_df["v_pitch"], merged_df["v_yaw"]]))
    data_axs[4].plot(merged_df["time"], np.transpose([merged_df["a_roll"], merged_df["a_pitch"], merged_df["a_yaw"]]))
    data_axs[5].plot(merged_df["time"], np.transpose([merged_df["torque_x"], merged_df["torque_y"], merged_df["torque_z"]]))
    plt.show()

    initial_est_params = np.concatenate((
        np.array([30]),
        np.array([0.03]),
        np.zeros(3),
        np.zeros(3),
        10 * np.ones(6),
        np.ones(6),
        np.ones(6),
        np.ones(6)
    ))

    s = SPKFParameterEstimator(initial_est_params)

    intermediate_params = np.zeros((100, 32))

    i = 0
    for _, row in merged_df.iterrows():
        state = np.array([
            row["orientation_r"],
            row["orientation_p"],
            row["orientation_y"],
            row["velocity_x"],
            row["velocity_y"],
            row["velocity_z"],
            row["v_roll"],
            row["v_pitch"],
            row["v_yaw"],
        ])
        # Do vroll, vpitch, vyaw need to be translated into body coordinates?
        wrench = np.array([
            row["force_x"],
            row["force_y"],
            row["force_z"],
            row["torque_x"],
            row["torque_y"],
            row["torque_z"],
        ])
        acceleration = np.array([
            row["a_x"],
            row["a_y"],
            row["a_z"],
            row["a_roll"],
            row["a_pitch"],
            row["a_yaw"],
        ])
        s.update(state, wrench, acceleration)

        intermediate_params[i, :] = s.get_est_params()

        if i % 100 == 0:
            print(s.get_est_params())
            plt.figure()
            plt.plot(intermediate_params)
            plt.show()
            intermediate_params = np.resize(intermediate_params, (intermediate_params.shape[0] + 100, 32))

        i += 1

    print(s.get_est_params())


def plot_params(ax, intermediate_params, params, legend, title):
    ax.plot(intermediate_params)
    for (i, param) in enumerate(params):
        ax.axhline(param, linestyle='--')
    ax.grid()
    ax.legend(legend, ncol=len(legend), loc="upper center")
    ax.set_title(title)

def plot_errors(ax, intermediate_errors, legend, title):
    ax.plot(intermediate_errors)
    ax.grid()
    ax.legend(legend, ncol=len(legend), loc="upper center")
    ax.set_title(title)

if __name__ == '__main__':
    # test_constructed_data()
    test_real_data()