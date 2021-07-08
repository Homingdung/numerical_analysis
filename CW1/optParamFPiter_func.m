function [c_opt,N_opt] = optParamFPiter_func(f,p0,p,TOL,Nmax)
% OPTPARAMFPITER_FUNC   optParamFPiter_func
%    [c_opt,N_opt] = optParamFPiter_func(f,p0,p,TOL,Nmax)
%    determine the optimal value of parameter c 
%    such that the fixed-point iteration method is the 
%    fastest to converge for the function f, given 
%    the tolerance TOL,maximum 
%    iteration, Nmax,initial value p0

set=linspace(0.001,1,1000);
iteration = [];


for i = 1:1000
    k = 1;
    p01 = p0;%relabel the initial point to make sure the same initial point 
    c = set(i);
    g = @(x)x - c.*f(x);
    while k <= Nmax
        p1 = g(p01);
        if abs(p1-p) < TOL
            break
        else
           p01 = p1;
        end
        
        k = k + 1;
    end
    iteration(1,i) = k;
    
end
c_opt=set(find(iteration == min(iteration)));
N_opt=iteration(find(iteration == min(iteration),1));
end
