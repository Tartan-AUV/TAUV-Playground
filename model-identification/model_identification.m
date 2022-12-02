function [] = model_identification()
raw_nav = readmatrix('data/bags-12-01-22/navigation_state.csv');
nav_t = raw_nav(:, 1);
nav = raw_nav(:, [14, 15, 16, 8, 9, 10]);

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
u = horzcat(horzcat(nav, ang_vel), wrench);

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
inertias = [
  1; 1; 1;
];
mass = 30;
volume = 30;
center_of_gravity = [
  0; 0; 0  
];
center_of_buoyancy = [
    0; 0; 0
];
Parameters = {linear_damping, inertias, mass, volume, center_of_gravity, center_of_buoyancy};
InitialStates = [];
Ts = 0;

nlgr = idnlgrey(ModelFile, Order, Parameters, InitialStates, Ts);
nlgr.Parameters(3).Fixed = true;

z = iddata(y, u, 0.05, 'Name', 'Sub');
compare(z, nlgr);

opt = nlgreyestOptions('Display', 'full');
opt.SearchMethod = 'lsqnonlin';
opt.SearchOptions.Advanced.UseParallel = true;
nlgr_est = nlgreyest(z, nlgr, opt);
present(nlgr_est);
figure();
compare(z, nlgr_est);
end