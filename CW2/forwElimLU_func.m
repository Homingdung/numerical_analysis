function [L,U] = forwElimLU_func(A)
%FORWELIMLU_FUNC  LU factorisation
%   [L,U] = FORWELIMLU_FUNC(A)
%   Compute the LU factorisation of a given A. The input A is any square matrix, 
%   the output U is the final echelon form (an upper triangular matrix) as obtained
%   by forward elimination(without row exchanges),L is the corresponding lower-triangular
%   matrix as defined in Theorem 6.19. In particular, the elimination must stop 
%   when abs(aii)<1e-8.


n = size(A,1);%obtain the size of matrix A
L_d = diag(diag(ones(3,3)));%initialize a diagonal matrix for later use
for i = 1:n
    %Eliminate column i
    for j = i+1:n
        %Stop criteria
        if abs(A(i,i))<10^(-8)
            break
        else
            %Compute multiplier
            mij = A(j,i)/A(i,i);
            %
            L_d(j,i) = mij;
            %Replace Ej by Ej-mij*Ei
            A(j,i) = 0;
            for k = i+1:n
                A(j,k) = A(j,k)-mij*A(i,k);
            end 
        end
     end
end
L=tril(L_d)%output the lower-triangular matrix 
U=A%output the upper triangular matrix

end




