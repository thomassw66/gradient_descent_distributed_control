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
         function res = calculate_cost_fn(obj, p)
            res = (1/obj.a^2)*p(1)^2 + (1/obj.b^2)*p(2)^2 ;
         end
         function res = calculate_cost_fn_grad(obj, p)
            % grad = (1/a^2) 2x dx + (1/b^2) 2y dy = dz 
             gx = (1/obj.a^2)*2*p(1);
             gy = (1/obj.b^2)*2*p(2);
             res = [gx, gy];
         end
     end

end
