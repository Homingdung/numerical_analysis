function B = forwElimStop_func(A,r,s)
%FORWELIMSTOP_FUNC  Forward elimination method without pivoting
%   function B = FORWELIMSTOP_FUNC(A,r,s)
%   Solving the matrix and implementing forward elimination method. 
%   The additional argument (r,s) that prematurely stop the forward 
%   elimination, where the input A is any augmented matrix, r is the 
%   number of forward elimination rounds to be completed, s is the
%   number of row replacements to be done in the last round, and 
%   output B is the resulting matrix.  

%Get number of rows
n = size(A,1);
%Start forward elimination
for i = 1:r+1
    if i ~= r+1
        %Eliminate column i
        for j = i+1:n
            %Compute multiplier
            mij = A(j,i)/A(i,i);
            %Replace Ej by Ej-mij*Ei
            A(j,i) = 0;
            for k = i+1:n+1
                A(j,k) = A(j,k)-mij*A(i,k);
            end
        end
    else
        if s == 0
            break
        else
            for j = i+1:i+s
                mij = A(j,i)/A(i,i);
                %Replace Ej by Ej-mij*Ei
                A(j,i) = 0;
                for k = i+1:n+1 
                    A(j,k) = A(j,k)-mij*A(i,k);
                end
            end
        end
    end
end
    
B=A;%output the resulting matrix
end



