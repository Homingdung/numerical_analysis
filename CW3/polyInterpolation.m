function interp = polyInterpolation(a,b,p,xhat,f)
%POLYINTERPOLATION Evaluate the pth order polynomial interpolant
%   interp = polyInterpolation(a,b,p,xhat,f) will evaluate the pth 
%   order polynomial interpolant of a function f at set of poins xhat. 
%   Where the nodal interpolation poins are uniformly space over the 
%   interval [a,b]. The output interp is a vetor containing the values 
%   evaluated at correspoinding xhat.

y = [];%Store the value
x = linspace(a,b,p+1); 
n = length(xhat);
[L,errorFlag] = lagrangePoly(p,x,n,xhat);
for i = 1:p+1
    y(1,i) = f(x(i));
end
interp = y*L;
end


