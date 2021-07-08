function [t,y]=rungeKutta(a,b,f,N,y0,m,method)
% RUNGEKUTTA Solving ODE system by Runge-Kutta methods
%   [t,y]=rungeKutta(a,b,f,N,y0,m,method) 
%   
%   Inputs:a,b - limits of interval
%          f - RHS of the differential equation systems
%          N - number of subintervals for [a,b]
%          y0 - initial value for IVP
%          m - length of the ODE system
%          method - method = 1 Forward Euler Method
%                   method = 2 Modified Euler Method
%                   method = 4 The RK4 method
%   Outputs:t - vector containing the nodal points 
%           y - matrix containing the approximations corresponding to all
%           time points


y = [];%initialize the matrix y
y(:,1) = y0;
h = (b-a)/N;%step
t=a:h:b;

if method == 1 %use Forward Euler method
    for i = 1:N
        y(:,i+1) = y(:,i)+h*f(t(i),y(:,i));
    end
elseif method == 2 %use modified Euler method
    for i = 1:N
        Y = y(:,i)+h*f(t(i),y(:,i));
        y(:,i+1) = y(:,i) + (h/2)*(f(t(i),y(:,i))+f(t(i+1),Y));
    end
elseif method == 4 %use RK4 method
    for i = 1:N
        K1=f(t(i),y(:,i));
        K2=f(t(i)+h/2,y(:,i)+h/2*K1);
        K3=f(t(i)+h/2,y(:,i)+h/2*K2);
        K4=f(t(i)+h,y(:,i)+h*K3);
        y(:,i+1)=y(:,i)+(h/6)*(K1+2*K2+2*K3+K4);
    end
end
end
     
    






