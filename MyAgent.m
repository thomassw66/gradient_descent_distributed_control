classdef MyAgent < handle
    % Agent Summary of this class goes here
    %   general gradient descent agent controller class 
    
    properties
        cost_function
        x
        y
        step_size
    end
    
    methods
        function obj = MyAgent(x, y, cost_fn)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            obj.cost_function = cost_fn;
            obj.x = x;
            obj.y = y;
            obj.step_size = 0.1;
        end
        function plt(obj)
            plot(obj.x, obj.y, 'or', 'MarkerSize', 5, 'MarkerFaceColor', 'r');
        end
        function p = act(obj)
            % Agent.act() agent will act in the environment i.e. move
            %   agent will follow a simple gradient descent controller
            %   each time act is called, the agent will update its position
            %   in the direction of the negative gradient of magnitude 
            %   step_size 
            
            g = obj.cost_function.calculate_cost_fn_grad(obj.x, obj.y);
            g=g./norm(g); % normalize gradient to get a unit vector
            obj.x = obj.x - obj.step_size * g(1);
            obj.y = obj.y - obj.step_size * g(2);
            p = [obj.x, obj.y];
        end
        
        function p = getLocation(obj)
            p = [obj.x, obj.y];
        end
    end
end

