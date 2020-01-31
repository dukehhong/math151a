%                       newtonRoot.m
%
% A Matlab script that implements Newton's method for 
% finding the roots of the non-linear equation x^2 - 2.0
%
% This is not a robust code - there is no code that 
% terminates the iteration if too many iterates are taken. 
%

% fstring = 'sin(x/2) - 1';
% dfstring = '0.5*cos(x/2)';

% fstring = '(e^x) - tan(x)';      
% dfstring = '(e^x) - (sec(x))^2';    

fstring = '(x^3) - (12*(x^2)) + (3*x) + 1';
dfstring = '(3*(x^2)) - (24*x) + 3';

x0  = 1;                  % initial guess
eps = 1.0e-8;             % stopping tolerance
format long;              % print out in long format
format compact;           % suppress line feeds

xn  = x0;
iter = 0;

eval(['x = xn;',fstring,';']);     % evaluate f  at xn
fn = ans; 
eval(['x = xn;',dfstring,';']);    % evaluate f' at xn
dfn = ans; 

errEst = eps + 1; % start the loop
while(errEst > eps)    
   xn_1  = xn - fn/dfn;      % calculate next iteration
   % calculate estimated error bound
   errEst = abs(xn_1 - xn);
   xn = xn_1; 
   iter += 1; % increase iteration count
   
   % fprintf(['Iteration %d: Approximate root is %-15.10f\n'], iter, xn);
   
   eval(['x = xn;',fstring,';']);     % evaluate the f  at xn
   fn = ans; 
   eval(['x = xn;',dfstring,';']);    % evaluate the f' at xn
   dfn = ans; 
end

%
% Print out final results
%
disp(sprintf(['Approximate root of %s    : %-15.10f '],fstring,xn))
disp(sprintf(['Initial iterate           : %-15.10f '],x0))
disp(sprintf(['Residual                  : %-15.10e '], abs(fn))) % added absolute value
disp(sprintf(['Approximation error bound : %-15.10e'],errEst))
disp(sprintf(['Iterations required       : %-5d'],iter))