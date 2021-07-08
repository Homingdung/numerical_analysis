function [A,b] = someMatrixAndVector_func(m)
% [A,b] = someMatrixAndVector_func(m)
%    For n=m^3, m being an integer at least 2, 
%    this generates some nxn matrix A
%    and some nx1 vector b.
        
% System size    
n = m^3;

% Matrix A
A =   6 * diag(ones(n    ,1)     ) ...
    - 1 * diag(ones(n-1  ,1), 1  ) ...
    - 1 * diag(ones(n-1  ,1),-1  ) ...
    - 1 * diag(ones(n-m  ,1), m  ) ...
    - 1 * diag(ones(n-m  ,1),-m  ) ...
    - 1 * diag(ones(n-m^2,1), m^2) ...
    - 1 * diag(ones(n-m^2,1),-m^2);

% Vector b
b = zeros(n,1);
b(1              ) = 9;
b(2:m            ) = 6;
b(m+1:m^2        ) = 3;
b(end-m^2+1:end-m) = 3;
b(end-m+1:end-1  ) = 6;
b(end            ) = 9;
