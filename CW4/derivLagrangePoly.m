function LDiff = derivLagrangePoly(p,x,n,xhat)
%DERIVLAGRANGEPOLY finds the p+1 derivative of Lagrange interpolating polynomials
%given a set of nodal points.
%
%   LDiff = derivLagrangePoly(p,x,n,xhat) 
%
%   Inputs: p - integer polynomial degree 
%           x - set of p+1 nodal points
%           n - number of points in evaluation vector
%           xhat - set of evaluation points
%   Outputs: LDiff - matrix containing the evaluated derivative of Lagrange polynomials

for i = 1:p+1
    for j = 1:n
        x1 = [x(1:i-1),x(i+1:p+1)]; %exclude the entry
        for k = 1:p
            x2 = [x1(1:k-1),x1(k+1:p)]; %exclude the entry
            pd(k) = prod(xhat(j)-x2); %part of the numerator
        end
        LDiff(i,j) = sum(pd)/prod(x(i)-x1);
    end
end
end



        


        