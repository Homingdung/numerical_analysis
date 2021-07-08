function x_mat = jacobi_func(A,b,x0,Nmax)
%JACOBI_FUNC  Jacobi method
%   function x_mat = JACOBI_FUNC(A,b,x0,Nmax)
%   Solving the linear system of equations Ax = b by jacobi method, where 
%   the input consists of an (n*n) matrix A, an (n*1) vector b, an (n*1)
%   vector x0 (a given initial approximation), and the total number of 
%   iterations Nmax to be performed by the method. The output x_mat is a
%   matrix of size n*(Nmax+1) that stores all approximation vectors x(k).
 
n = size(A,1);%Obtain the size of matrix A
D = diag(diag(A));%Obtain the diagonal matrix
L = -(tril(A)-D);
U = -(triu(A)-D);
Dinv = inv(D);%Inverse matrix
T = Dinv*(L + U);%Coefficient calculation 
c = Dinv*b;%Coefficient calculation
x = x0;%Initial value of x
x_mat = ones(n,Nmax+1);%Store the value
x_mat(:,1)=x0;
for k = 1:Nmax
    x = T*x+c;
    x_mat(:,k+1) = x;
    
end
end

       
        
