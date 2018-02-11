MAX_TIME = 50;
NUM_AGENTS = 10;

Px = (rand(NUM_AGENTS,1)-0.5).*10;
Py = (rand(NUM_AGENTS,1)-0.5).*10;
cost = EllipsoidCostFunction(1,2);

% Create n agents 
agents = [];
for i=1:NUM_AGENTS
    a = MyAgent(Px(i), Py(i), 0);
    agents = cat(1, agents, a);
end

for i=1:NUM_AGENTS
    other_agents = agents(1:end ~= i);
    agents(i).cost_function = PotentialFieldHerdingCostFunction(other_agents);
end

% visualize the cost function 
x = linspace(-5, 5, 20);
y = linspace(-5, 5, 20);
[X, Y] = meshgrid(x,y);
% Z = cost.calculate_cost_fn(X, Y);

% control loop 
for i=0:MAX_TIME 
    clf('reset');
    hold on
    % contour(X, Y, Z, 20);
    for j=1:NUM_AGENTS
        agents(j).plt();
        agents(j).act();
    end 
    hold off
    pause(0.05);
end 
