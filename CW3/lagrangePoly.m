function [L,errorFlag] = lagrangePoly(p,x,n,xhat)
% LAGRANGEPOLY Lagrange Polynomial Interpolation
%   [L,errorFlag] = lagrangePoly(p,x,n,xhat) will first perform
%   the distinctiveness check: the output errorFlag will be 0 if x is 
%   distinct, otherwise will be 1. Then the function will compute the
%   value of lagrange interpolating polynomials, where x is the 
%   given set of p+1 distinct nodal points and xhat is the given set
%   of n evaluation points. The output L will be a (p+1)*n matrix, where 
%   the ijth entry of the matrix is L_{i-1}(xhat_j). 

L=[];
errorFlag=0;%initialize the value
%Caculate the matrix l for xhat
for i = 1:p+1
    t = ones(1,length(xhat));%initialization
    for j = 1:p+1
        if j~=i
            t = t.*(xhat-x(j))/(x(i)-x(j));%Lagrange polynomial interpolation formula
            if abs(x(i)-x(j))<0.001 %Check the distinctiveness
                errorFlag = 1;
            end
            L(i,:) = t;
        end
    end
end
end






