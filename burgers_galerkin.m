function burgers_galerkin(N, T)

    L = pi;
    dx = 2*L/(1000*N);
    x = -L:dx:L;

    % Basis functions and their derivatives
    phi = @(i, x) sqrt(1/L) * sin(i*x); % basis functions
    dphi = @(i, x) sqrt(1/L) * i*cos(i*x); % derivatives of basis functions


    % Initial condition
    u0 = @(x) -sin(x);
    a0 = zeros(N, 1);
    for i = 1:N
        fun = @(x) u0(x) .* phi(i, x);
        a0(i) = integral(fun, -L, L);
    end
    
    % compute the matrix for right-hand side of ODE system
    M = cell(N, 1);
    for j = 1:N
        for i = 1:N
            for k = 1:N
                fun = @(x) phi(i,x) .* phi(j, x) .* dphi(k, x);
                M{j}(i,k) = integral(fun, -L, L);
            end
        end
    end

    % define the right-hand side function for the ODE system
    rhs = @(t, a) system_of_equations(t, a, M);
    
    % solve the ODE system using ode45
    options = odeset('OutputFcn',@odeplot);
    [t, a] = ode45(rhs, [0 T], a0, options);
    
    % reconstruct the solution u(x, t)
    nx = length(x);
    nt = length(t);

    for i = 1:nt
        for j = 1:nx
            value = 0;
            for k = 1:N
                value = value + a(i, k)*phi(k, x(j));
            end
            u(j, i) = value;
        end
    end

    % plot the solution at each time step
    figure;
    for i = 1:length(t)
        plot(x, u(:, i), 'LineStyle', '--', 'Color', [0, 0.5, 0], 'LineWidth', 1);
        xlabel('x');
        ylabel('u');
        title(['Solution at t = ', num2str(t(i))]);
        drawnow;
        pause(0.2);
    end

end
