%                       newtonRoot.m
%
% A Matlab script that implements Newton's method for 
% finding the roots of the non-linear equation x^2 - 2.0
%
% This is not a robust code - there is no code that 
% terminates the iteration if too many iterates are taken. 
%
fstring = 'x^2 - 3';      % target function 
dfstring = '2.0*x';       % target functions derivative

x0  = 5;               % initial guess
eps = 1.0e-12;             % stopping tolerance
format long;              % print out in long format
format compact;           % suppress line feeds

xn  = x0;

eval(['x = xn;',fstring,';']);     % evaluate f  at xn
fn = ans; 
eval(['x = xn;',dfstring,';']);    % evaluate f' at xn
dfn = ans; 

% 2d array; first column = estimated root and second column = error
errors = [];

% outputs iteration number then error
while(abs(fn) > eps)    
   xn  = xn - fn/dfn;      % Newton iteration
   
   rootErr = abs(xn - sqrt(3.0));
   errors = [errors; [xn, rootErr]];

   eval(['x = xn;',fstring,';']);     % evaluate the f  at xn
   fn = ans; 

   % notes modified newton's method does not update dfn
end

% save errors into filename
filename = './outputs/modified_output.txt';
fid = fopen(filename, 'w'); % file descriptor

fprintf(fid, "Modified Newton's Method Error\n");
for i=1: size(errors, 1)
   fprintf(fid, '%-15.10e\n', errors(i,2));
end
fclose(fid);

% calculated convergence order estimate and save into file
filename = './outputs/newton_estimate_order.txt';
fid = fopen(filename, 'a'); % append option
fprintf(fid, 'Modified Newton Convergence Order Estimate\n');

for i=1: (size(errors, 1) - 2)
   e_3 = errors(i + 2,2);
   e_2 = errors(i + 1,2);
   e_1 = errors(i, 2);
   alpha = log(e_3/e_2)/log(e_2/e_1);
   fprintf(fid, '%-15.10e\n', alpha);
end
fprintf(fid, '\n');
fclose(fid);