function [m_vec,k_vec,p] = findSystemSizes_func(Nmax,TOL,mMax)
%FINDSYSTEMSIZES_FUNC  Find solvable system sizes
%   [m_vec,k_vec,p] = FINDSYSTEMSIZES_FUNC(Nmax,TOL,mMax)
%   Compute all possible values of m>=2 for which the Jacobi method
%   approximates the exact solution in at most Nmax iterations up to a
%   certian tolerance TOL, abs(x-x(k))_2 <=TOL for some k<=Nmax. The output
%   m_vec is the vector of all valid values of m in increasing order, the
%   output k_vec is the corresponding vector fo smallest iteration indices
%   k for which the above criterion is satisfied. The output p is the
%   estimate for the power in the observed relationship k approximates
%   C*n^p, where n=m^3.


k=1;%initialize the k
k_vec=[];%Store the value k
m_vec=[];%Store the value m
for m = 2:mMax
    n = m^3;
    x_s = 3*ones(n,1);
    x0=ones(n,1);
    [A,b] = someMatrixAndVector_func(m);
    x_mat = jacobi_func(A,b,x0,Nmax);
    while k<Nmax
         if norm(abs(x_s-x_mat(:,k)))<=TOL
           k_vec=[k_vec,k-1];
           m_vec=[m_vec,m];
           break
         end
        
         k=k+1;
    end
end
k_vec%output the value
m_vec%output the value
%approximate value of p
%polyfit 
%take the logrithmn for both side and transfer them to linear polyfit
%log(k)=log(c)+p*log(n)
n = m_vec.^3;
xdata=n;
ydata=k_vec;
fun=@(x,xdata)x(1).*n.^x(2);
x_in=[10,1];%initial value for fitting
x=lsqcurvefit(fun,x_in,xdata,ydata);
p=x(2);
end
