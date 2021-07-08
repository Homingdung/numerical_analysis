function [t,y,errorFlag] = thetaODESolver(a,b,f,N,y0,theta,df)
% THETAODESOLVER implements theta-shceme method for intial value problem
%
%   [t,y,errorFlag] = thetaODESolver(a,b,f,N,y0,theta,df) 
%   
%   Inputs: a,b - limits of interval for t
%           f - RHS of the differential equation for IVP
%           N - number of subintervals for [a,b]
%           y0 - initial point
%           theta - parameter of the theta-schemes
%           df - derivative of the function f
%
%   Outputs:t - vector containing the nodal points 
%           y - vector of approximate solutions
%           errorFlag - errorFlag =1 if the maximum number of iterations is
%   reached. Otherwise, errorFlag = 0
%
%   If df/dy is not provided, the natural fixed point iteration will be
%   used to solve the implicit equation at each time step.
%   
%   If df/dy is provided, Newton's method will be used to solve the
%   implicit equation at each time step.
%   
%   Time stop criteria: A tolerance of 10^(-12) between successive iterates
%   will be used to stop both method. A maximum of 1000 iterations will be
%   performed at each time-step.
%   
%   SUFFICIENT CONDITION FOR CONVERGENCE OF THE FIXED POINT ITERATIONS: by
%   theorem 2.4 (Fixed point theorem) from last semester, if the derivative
%   of function f satisfy:
%   (1-k)/[h*(1-theta)] <= df/dy <= (k+1)/[h*(1-theta)], where 0<k<1 is a
%   constant, then the fixed point iterations will converge.

h=(b-a)/N;
t=a:h:b;
y=y0;
p0=y0;

if ~exist('df','var')
    %fixedpoint method
    for i =1:length(t)-1
        t1 = t(i);
        t2 = t(i+1);
        N = @(x)x-(x-y0-h.*(theta.*f(t1,y0)+(1-theta).*f(t2,x)));  
        eps=1.0e-12;
        error = 1;
        k = 1;
        errorFlag = 0;
        while error >= eps
            if k >= 1000
                errorFlag = 1;
                break
            end
            p = N(p0);
            p0 = p;
            error = abs(p-y0);
            y0=p;
            k = k+1;
        end
        
        if errorFlag == 1
            break
        end
        y = [y,p];
        y0 = p;
    end
else
    %Newton's method
    for i = 1:length(t)-1
        t1 = t(i);
        t2 = t(i+1);
        N = @(x)x-y0-h.*(theta.*f(t1,y0)+(1-theta).*f(t2,x));
        dN = @(x)1-h.*(1-theta).*df(t2,x);
        R = @(x)x-N(x)./dN(x);
        eps=1.0e-12;
        error = 1;
        k = 1;
        errorFlag = 0;
        while error >= eps
            if k >= 1000
                errorFlag = 1;
                break
            end
            p = R(y0);
            error = abs(p-y0);
            y0=p;
            k = k+1;
        end
        if errorFlag == 1
            break
        end
        y = [y,p];
        y0 = p;
    end
end



               
        
            
        






