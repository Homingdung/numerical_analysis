function B = forwElimPP_func(A)
%FORWELIMPP_FUNC  Forwarding elimination with partial pivoting strategy
%   function B = FORWELIMPP_FUNC(A)
%   Solving the matrix by forward elimination with the partial 
%   pivoting strategy. The input A is any augmented matrix, and 
%   the output B is the final matrix (in echelon form).


%Get number of rows
n = size(A,1);%obtain the size of matrix A
%Start the forward elimination
for i = 1:n-1
    %Partial pivoting strategy
    p = find(abs(A(i:end,i)) > max(abs(A(i:end,i)))-1,1);
    In = A(i,:);
    A(i,:) = A(p+i-1,:);
    A(p+i-1,:) = In;
    %Eliminate column i 
    for j=i+1:n
        %Compute the multiplier
        mij = A(j,i)/A(i,i);
        %Replace Ej by Ej-mij*Ei
        A(j,i) = 0;
        for k = i+1:n+1
            A(j,k) = A(j,k)-mij*A(i,k);
        end
    end
end
B=A
end

