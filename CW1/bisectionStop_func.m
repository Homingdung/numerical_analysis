function p_vec = bisectionStop_func (f,a,b,Nmax,TOL)
%BISECTIONSTOP_FUNC   Bisection Method 
%    p_vec = BISECTION_FUNC(f,a,b,Nmax,TOL)
%    computes the vector of approximations p_vec
%    obtained by the bisection method
%    applied to function f, 
%    using Nmax iterations,
%    and interval [a,b] with the tolerance.

i = 1;%count the iterations
FA = f(a);
p_vec = [];%intialize the vector
prev = (a + b)/2+2*TOL;%to make sure the process can continue, which could solve some special case such as a=-1,b=1
while i <= Nmax
    p = a + (b - a)./2;
    FP = f(p);
    p_vec(i,1) = p;

    if FP == 0 || abs(p-prev) < TOL 
        break
    else
        i = i + 1;
        if FA*FP > 0
           a = p;
           FA = FP;
        else
           b = p;
        end
    end
    prev = p;%to make sure the last two p could be used
end
end



