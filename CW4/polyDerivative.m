function dInterp = polyDerivative(x,p,h,k,f)
%POLYDERIVATIVE finds the derivative of the pth order polynomial
%interpolant of a function f at a point x
%   
%   dInterp = polyDerivative(x,p,h,k,f) 
%
%   Inputs: x - evaluation point 
%           p - integer polynomial degree 
%           h - width of the interval be separated
%           k - additional input to make x_k = x
%           f - handle of function to be evaluated
%   Outputs:dInterp - a single value containing the approximation to the
%   derivative at x

xhat = x;
x = x-k*h:h:x+(p-k)*h;
n = length(k);
y = [];
LDiff = derivLagrangePoly(p,x,n,xhat);
for i = 1:length(x)
    y(i,:) = f(x(i));
end

dInterp = LDiff'*y;
end


