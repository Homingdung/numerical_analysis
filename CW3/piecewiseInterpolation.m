function p_interp = piecewiseInterpolation(a,b,p,n,xhat,f)
%PIECEWISEINTERPOLATION Piecewise Polynomial Interpolation
%   p_interp = piecewiseInterpolation(a,b,p,n,xhat,f) will compute the
%   piecewise polynomial approximation of order p of a function with n
%   uniformly spaced subintervals of width h, where [a,b] is a given 
%   interval, p is the order of a function f with n uniformly spaced 
%   subintervals of width h, xhat is a vector of points at which the
%   piecewise interpolant should be evaluated. The output p_interp should 
%   hold these interpolant values.

x = linspace(a,b,n+1);
I = [];%Store the final value
for i = 1:length(xhat)
    for j = 2:length(x)
        if (xhat(i) >= x(j-1)) && (xhat(i) <= x(j) )
            I(:,i) = polyInterpolation(x(j-1),x(j),p,xhat(i),f);
        else
            continue
        end
    end
end
p_interp = I;
end



