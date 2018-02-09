classdef EllipsoidCostFunction
    %ELLIPSOIDCOSTFUNCTION Summary of this class goes here
    %   Detailed explanation goes here

     properties
         a 
         b
     end

     methods
         function obj = EllipsoidCostFunction(a,b)
            % obj = obj@AbstractCostFunction()
            obj.a = a;
            obj.b = b;
         end
         function res = calculate_cost_fn(obj, x, y)
            res = ((1/obj.a^2)*x.^2) + ((1/obj.b^2)*y.^2);
         end
         function res = calculate_cost_fn_grad(obj, x, y)
            % grad = (1/a^2) 2x dx + (1/b^2) 2y dy = dz 
             gx = x.*(1/obj.a^2)*2;
             gy = y.*(1/obj.b^2)*2;
             res = [gx, gy]
         end
     end

end
