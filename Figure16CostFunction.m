classdef Figure16CostFunction
    
    % Figure16CostFunction Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function res = calculate_cost_fn(obj, X, Y)
           % cost function of z = -xy e^(-x^2 -y^2)
           res = -X .* Y .* exp(-X.^2-Y.^2);
        end
        function res = calculate_cost_fn_grad(obj, X, Y)
           % z = -x*y e^(-x^2 - y^2)
           % dz = -y( 1 * e^(-x^2 - y^2) + x*(-2x) e^(-x^2 - y^2) ) dx + 
           %      -x( 1 * e^(-x^2 - y^2) + y (-2y) e^(-x^2 - y^2) ) dy
           e_term = exp(-X.^2 - Y.^2);
           gx = -Y .* ( e_term - 2 * X.^2 .* e_term );
           gy = -X .* ( e_term - 2 * Y.^2 .* e_term );
           res = [gx, gy];
        end
    end
end

