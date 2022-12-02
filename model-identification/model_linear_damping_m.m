function [dx, y] = model_linear_damping(t, x, u, L, I, m, v, CG, CB, varargin)
    dx = []; % static model

    rpy = u(1, 1:3);
    lin_v = u(1, 4:6);
    ang_v = u(1, 7:9);
    tau = u(1, 10:15);

    I_t = buildInertiaTensor(I(1), I(2), I(3), 0, 0, 0);
    M_rb = buildMassMatrix(m, CG, I_t);
    C_rb = buildCoriolisMatrix(m, CG, I_t, lin_v.', ang_v.');
    D_lin = diag([L]);
    G = buildGravityMatrix(m, v, CG, CB, rpy.');

    y = (M_rb \ (tau.' - G - C_rb * [lin_v.'; ang_v.'] - D_lin * [lin_v.'; ang_v.'])).';
end

function [J, J1, J2] = buildEulerMatrix(n2)
    % Note: Due to the use of euler angle representation, J becomes
    % undefined when theta = +/- 90 degrees.
    % TODO: switch to a quaternion representation!
    phi = n2(1);
    theta = n2(2);
    psi = n2(3);
    
    cphi = cos(phi);
    sphi = sin(phi);
    cth = cos(theta);
    sth = sin(theta);
    tth = tan(theta);
    cpsi = cos(psi);
    spsi = sin(psi);
    
    % Prevent singularity condition
    %eps = 0.001;
    %cth = max(abs(cth), eps)*sign(cth);
    
    % Eq 4.17 (Chin 2013, p 136)
    J1 = [cpsi*cth, -spsi*cphi + cpsi*sth*sphi, spsi*sphi + cpsi*cphi*sth;
        spsi*cth, cpsi*cphi + sphi*sth*spsi, -cpsi*sphi + sth*spsi*cth;
        -sth, cth*sphi, cth*cphi];
    % J1 = eul2rotm([phi,theta,psi], 'yxz')';
    
    % NOTE: There is an error in Chin 2013. J2(2,2) = cphi, not sphi!
    J2 = [1, sphi*tth, cphi*tth;
        0, cphi, -sphi;
        0, sphi/cth, cphi/cth];
    
    J = [J1, zeros(3); zeros(3), J2];
end

function I = buildInertiaTensor(Ixx, Iyy, Izz, Ixy, Ixz, Iyz)
    % Eq 4.3b: (Chin 2013, p 132)
    I = [Ixx, -Ixy, -Ixz;
        -Ixy,  Iyy, -Iyz;
        -Ixz, -Iyz,  Izz];
end

function M_rb = buildMassMatrix(m, r_G, I)
    % Eq 4.6: (Chin 2013, p 132)
    M_rb = [m * eye(3), -m*skew(r_G);
            m * skew(r_G), I];
end

function C_rb = buildCoriolisMatrix(m, r_G, I, v1, v2)
    % Eq 4.10: (Chin 2013, p 134)
    C_rb = [zeros(3),   -m*skew(v1) - m*skew(v2)*skew(r_G);
            -m*skew(v1) + skew(r_G)*skew(v2),   -skew(I*v2)];
end

function [M_added, C_added] = buildAddedMassCoriolisMatrices(v, Ma_x, Ma_y, Ma_z, Ma_yaw, Ma_pitch, Ma_roll)
    % eq 4.32: (Chin 2013, p 143)
    M_added = -diag([Ma_x, Ma_y, Ma_z, Ma_yaw, Ma_pitch, Ma_roll]);
    
    % eq 4.33: (Chin 2013, p 143)
    % TODO: verify correctness!
    C_added = ...
        [0, 0, 0, 0, -Ma_z * v(3), Ma_y * v(2);
         0, 0, 0, Ma_z * v(3), 0, -Ma_x * v(1);
         0, 0, 0, -Ma_y * v(2), Ma_x * v(1), 0;
         0, -Ma_z * v(3), Ma_y * v(2), 0, -Ma_roll * v(6), Ma_pitch * v(5);
         Ma_z * v(3), 0, -Ma_x * v(1), Ma_roll * v(6), 0, -Ma_yaw * v(4);
         -Ma_y * v(2), Ma_x * v(1), 0, -Ma_pitch * v(5), Ma_yaw * v(4), 0];
end

function G = buildGravityMatrix(m, b, r_G, r_B, n2)
    g = 9.81;
    W = m*g;
    B = b*g;
    
    phi = n2(1);
    theta = n2(2);
    cph = cos(phi);
    sph = sin(phi);
    cth = cos(theta);
    sth = sin(theta);
    
    x_G = r_G(1);
    y_G = r_G(2);
    z_G = r_G(3);
    x_B = r_B(1);
    y_B = r_B(2);
    z_B = r_B(3);
    
    % Eq 4.54 (Chin 2013, p 180)
    G = [(W-B) * sth;
         -(W-B) * cth*sph;
         -(W-B) * cth*cph;
         -(y_G*W - y_B*B)*cth*cph + (z_G*W - z_B*B)*cth*sph;
         (z_G*W - z_B*B)*sth + (x_G*W - x_B*B)*cth*cph;
         -(x_G*W - x_B*B)*cth*sph - (y_G *W - y_B*B)*sth;];
end

function S = skew(x)
    % Chin 2013, p 133.
    % Defined as S(x)*y = cross(x,y)
    S = [0 -x(3) x(2) ; x(3) 0 -x(1) ; -x(2) x(1) 0 ];
end