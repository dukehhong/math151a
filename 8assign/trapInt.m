%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                Math 151A       trapInt.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  This function returns the result of applying the composite
%  trapezoidal rule to a function over the interval [a,b] using n panels.
%
%  On entry : F        = Function handle for function being integrated  
%             a        = left integration endpoint
%             b        = right integration endpoint
%             n        = number of panels to use in the integration formula
%
%  Returned : the approximate value of the integral. 
%
%  2/21/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
function [y] = trapInt(F, a, b, n)

h   = (b-a)/n;
sum = (h/2)*F(a) + (h/2)*F(b);

for i = 1:n-1
   x_i = i*h;
   sum = sum + F(x_i)*h;
end



y = sum;

