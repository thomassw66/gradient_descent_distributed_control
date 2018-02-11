classdef PotentialFieldHerdingCostFunction
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        other_agents
    end
    
    methods
        function obj = PotentialFieldHerdingCostFunction(other_agents)
            obj.other_agents = other_agents;
        end
        function grad = calculate_cost_fn_grad(obj, x, y)
            sum = 0;
            for i=1:length(obj.other_agents)
                p = obj.other_agents(i,:);
                d = [p.x, p.y] -  [x, y];
                l2_norm = norm(d);
                sum = sum + (l2_norm.^-2.0 - 1/3 * l2_norm.^-3.0) * d ./ l2_norm;
            end
            grad = sum;
        end
    end
end

