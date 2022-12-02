function [] = model_identification()
raw_nav = readmatrix('data/bags-12-01-22/navigation_state.csv');
nav_t = raw_nav(:, 1);
nav = raw_nav(:, [14, 15, 16, 8, 9, 10, 17, 18, 19]);

raw_wrench = readmatrix('data/bags-12-01-22/wrench.csv');
wrench_t = raw_wrench(:, 1);
wrench = interp1(wrench_t, raw_wrench(:, 2:7), nav_t);
wrench = wrench + 0.01 * rand(size(wrench));

wrench = smoothdata(wrench, 'gaussian', 10);
lin_accel = cat(1, diff(raw_nav(:, [8, 9, 10])) / 0.05, [0, 0, 0]);
lin_accel = smoothdata(lin_accel, 'gaussian', 10);
ang_vel = cat(1, diff(raw_nav(:, [14, 15, 16])) / 0.05, [0, 0, 0]);
ang_accel = cat(1, diff(ang_vel) / 0.05, [0, 0, 0]);
ang_accel = smoothdata(ang_accel, 'gaussian', 10);
y = horzcat(lin_accel, ang_accel);
u = horzcat(nav, wrench);

y(isnan(y)) = 0;
u(isnan(u)) = 0;
y(isinf(y)) = 0;
u(isinf(u)) = 0;

% sync wrench to navigation state

plot(u);
figure();
plot(y);
figure();

ModelFile = 'model_linear_damping_m';
Order = [6, 15, 0];
linear_damping = [
    10; 10; 10; 10; 10; 10
];
Parameters = {linear_damping};
InitialStates = [];
Ts = 0;

nlgr = idnlgrey(ModelFile, Order, Parameters, InitialStates, Ts);

z = iddata(y, u, 0.05, 'Name', 'Sub');
compare(z, nlgr);

opt = nlgreyestOptions(Display='on');
nlgr_est = nlgreyest(z, nlgr, opt);
figure();
compare(z, nlgr_est);
end