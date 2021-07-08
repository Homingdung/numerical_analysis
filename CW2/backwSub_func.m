function x = backwSub_func(A)
%BACKWSUB_FUNC    Backward Substitution
%   x = BACKWSUB_FUNC(A) performs the backward- 
%   substitution step of Gaussian elimination. 
%   Input:  n x n+1 matrix A (in echelon form)
%   Output: n x 1   vector x

% Initialise
n = size(A,1);
x = zeros(n,1);

% Last solution 
x(n) = A(n,n+1)/A(n,n);

% Loop backwards
for i=(n-1:-1:1)
    x(i) = A(i,n+1);
    for j=i+1:n
        x(i) = x(i) - A(i,j)*x(j);
    end
    x(i) = x(i)/A(i,i);
end

