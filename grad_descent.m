


MAX_TIME = 100;
% control loop 

initial_p = (rand(10,2)-0.5).*10 ; %[ [2 4]; [5 -5]; [-3 3]; ]
p = initial_p;
[m, n] = size(p);

x = linspace(-5, 5, 20);
y = linspace(-5, 5, 20);
X, Y = meshgrid(x,y);


% move step size each time step
% this would be analogous to something like the robots max speed
step_size = 0.1;

cost = EllipsoidCostFunction(1, 1);

%Z = cost.calculate_cost_fn(XY)
%contourf(Z);

for i=0:MAX_TIME 
    for j=1:m     
        plot(p(j,1), p(j,2), 'or', 'MarkerSize', 5, 'MarkerFaceColor', 'r')
        axis([-5 5 -5 5]);
        hold on
        grad = cost.calculate_cost_fn_grad(p(j, :));
        p(j,1) = p(j,1) - step_size * grad(1)/norm(grad);
        p(j,2) = p(j,2) - step_size * grad(2)/norm(grad);
    end
    hold off
    pause(0.05);
end 
