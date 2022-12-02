function [dx, y] = model_linear_damping(t, x, u, L, varargin)
    dx = []; % static model

    mass = 30;

    rpy = u(1, 1:3);
    lin_v = u(1, 4:6);
    ang_v = u(1, 7:9);
    tau = u(1, 10:15);

    tau_damping = [
        L(1:3).' .* lin_v, L(4:6).' .* ang_v
    ];

    y = (tau - tau_damping) / mass; % accelerations
end