function p_vec = newton_func(f,dfdx,p0,Nmax)
%NEWTON_FUNC   Newton's Method 
%    p_vec = NEWTON_FUNC(f,dfdx,po,Nmax)
%    computes the vector of approximations p_vec
%    obtained by the Newton's Method 
%    applied to function f, 
%    using Nmax iterations,
%    start from p0

i = 1;%count the iterations
p_vec =[];%initialize the vector
while i <= Nmax
    p = @(x)x-f(x)/dfdx(x);%Newton function
    p = p(p0);
    p0 = p;
    p_vec(i,1) = p;
    i = i + 1;%count the iterations
    
end

end

