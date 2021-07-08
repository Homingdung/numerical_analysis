function p_vec = fpiter_func(f,c,p0,Nmax)
%FPITER_FUNC   Fixed Point Iteration
%    p_vec = FPITER_FUNC(f,c,p0,Nmax)
%    computes the vector of approximations p_vec
%    obtained by Fixed Point Iteration
%    applied to function f, 
%    using Nmax iterations,
%    and the initial point p0.

g = @(x) x- c.*f(x);%initialization
i = 1;%count the iterations
p_vec = [];%initialize the vector
while i <= Nmax
    p = g(p0);%calculate p1
    p0 = p;
    p_vec(i,1) = p;
    i = i + 1;
end
end
