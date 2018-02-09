
MAX_TIME = 50;
NUM_AGENTS = 10;


%initial_p = (rand(10,2)-0.5).*10 ; %[ [2 4]; [5 -5]; [-3 3]; ]
Px = (rand(NUM_AGENTS,1)-0.5).*10;
Py = (rand(NUM_AGENTS,1)-0.5).*10;
%p = initial_p;
%[m, n] = size(p);


% cost = EllipsoidCostFunction(0.4, 2);
cost = Figure16CostFunction();

x = linspace(-5, 5, 20);
y = linspace(-5, 5, 20);
[X, Y] = meshgrid(x,y);
Z = cost.calculate_cost_fn(X, Y);

% move step size each time step
% this would be analogous to something like the robots max speed
step_size = 0.1;

%Z = cost.calculate_cost_fn(XY)
%contourf(Z);

% control loop 
for i=0:MAX_TIME 
    clf('reset');
    hold on
    contour(X, Y, Z, 20);
    plot(Px, Py, 'or', 'MarkerSize', 5, 'MarkerFaceColor', 'r');
    grad = cost.calculate_cost_fn_grad(Px, Py);
    % update positions
    for j=1:NUM_AGENTS
        g = grad(j, :);
        g = g./norm(g);
        Px(j) = Px(j) - step_size * g(1);
        Py(j) = Py(j) - step_size * g(2);
    end 
    hold off
    pause(0.05);
end 
