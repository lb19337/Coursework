% function [outputArg1,outputArg2] = myBisection(inputArg1,inputArg2)
% %MYBISECTION Question 1 Root finding
% %inputs : the function whose roots we want to find: f 
% %the bracket endpoints: a and b
% %the tolerance: tol
% %and outputs
% %the approximate root: m the final error: err
% %IVF required: f between f(a) and f(b) is continuous and f(a)/f(b) have
% %opposing signs -/+
% outputArg1 = inputArg1;
% outputArg2 = inputArg2;
% end
% 
% inputArg1 = a
% inputArg2 = b

% for m > 0 (a,m), for m < 0 (m,b), let m = ...
function [sol,err] = myBisection(f, a, b, tol)
%MYBISECTION Use the bisection method to find a root of the function f
%   bracketed within the interval [a, b].
%
%Inputs:
%   f = function handle to function whose root is to be found
%   a = one end of the bracket
%   b = other end of the bracket
%   tol = absolute error tolerance with which to find the root;
%Iteration terminates when the root is known to within +/- tol
%
%Usage:
%   [r,err] = bisect(f,a,b,tol)
%   returns the approximation to a root within [a, b], and the final
%   absolute error

% check whether f actually changes sign
if sign(f(a))==sign(f(b))
    error('f(a) and f(b) should have opposite sign');
end

% intialise variables
it = 0;                       % iteration counter
sol = (a+b)/2;                % current solution estimate
sol_old = Inf;                % previous solution estimate
err = abs(sol-sol_old);       % absolute error

% set up the output format
displayfmt = ' %3d  %20.14f  %20.14f\n';
fprintf('   n                   x_n         |x_n-x_{n-1}|\n');
fprintf(displayfmt,it,sol,err);

% bisection algorithm:
% at each iteration, find the half-interval that contains a sign change
% and relabel the endpoints appropriately
while err > tol
    
  it = it+1;
  sol_old = sol;
  mid = (a+b)/2;
  
  if f(mid)==0
    sol = mid;
    err = 0;
  elseif sign(f(a))~=sign(f(mid))
    b = mid;
    sol = (a+b)/2;
    err = abs(sol-sol_old);
  else
    a = mid;
    sol = (a+b)/2;
    err = abs(sol-sol_old);
  end
  
  fprintf(displayfmt,it,sol,err);
  
end

% print final summary
fprintf('\nConvergence after %d steps to a root at %-20.14g\n', it, sol);
fprintf('Final absolute error is %g\n\n', err);

end

