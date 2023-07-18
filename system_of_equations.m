function dx = system_of_equations(t, x, A)
    n = length(x);
    dx = zeros(n, 1);
    for i = 1:n
        dx(i) = -x' * A{i} * x;
    end
end