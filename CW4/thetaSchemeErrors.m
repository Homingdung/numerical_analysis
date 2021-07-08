function E = thetaSchemeErrors(a,b,f,true_y,y0,N,T)
% THETASCHEMEERRORS Calculate the error of theta-scheme function
%   
%   E = thetaSchemeErrors(a,b,f,true_y,y0,N,T) 
%   
%   Inputs: a,b - limits of interval for t
%           f - RHS of the differential equation
%           true_y - exact solution for IVP
%           y0 - initial value for IVP
%           N - set of N values, which is the number of subintervals for [a,b]
%           T - set of theta values
%   
%   Outputs:E - matrix containing the error of between the approximation
%   the exact solutions.
%   The function will plot the error against the N values with a
%   logarithmic scale on both axes.
%   
%   Comment on 
%   T=[0,0.25,0.5,0.75,1],N=[4,8,16,32,64,128,256] 
%   f=@(t,y)cos(t)/(3*y^2),a=0,b=pi/2,y0=1
%   
%   In all cases, the error reduces as N increases.Considering the straight 
%   lines on log-log plot indicate O(h^L) convergence for some L, we could 
%   found that if theta=0.5, the slop indicates the biggest power L of h for 
%   O(h^L) while for cases with theta!=0.5, the slopes indicate almost same 
%   power L of h for O(h^l) since the lines are almost parallel. Specifically, 
%   for theta=0 and theta=1, the lines on the plot almost overlap each other, 
%   as well as for theta=0.25 and theta=0.75. 
%
%   We could do some mathematical analysis for errors to account for
%   above observations.
%   
%   Firstly, we rewrite the theta scheme equation as:
%   y_n+1-y_n-h*[theta*f(y_n)+(1-theta)*f(y_n+1)]=0, and then apply Taylor
%   expansion for this equation and do some algebra. (Notice that when we use 
%   the Taylor expansion, we should control the power of h considering the 
%   additional h out of the bracket in above equation).
%   Considering the local truncation error, we could find that:
%   
%   theta=0.5, O(h^3);Considering O(h^p+1),then, p=2.(2nd order) 
%   theta!=0.5,O(h^2);Considering O(h^p+1),then, p=1.(1st order)
%   
%   The above result is the reason why we found the straight line with theta=0.5
%   has the biggest power (could be seen by the slope as well) and other lines 
%   with theta!=0.5 are parallel.
% 
%   Secondly, more specifically, the error term is:
%   (incomplete step from above, just for showing)
%   
%   -(1/12)*h^3*y'''(t_n)+O(h^4), if theta=0.5,
%   (theta-0.5)*h^2*y'''(t_n)+O(h^3), if theta!=0.5, which is symmetric about
%   0.5
%   So we found that the error term is symmetric about 0.5 for cases with theta!=0.5
%
%   The above result is the reason why we found that for theta=0 and theta=1, the lines 
%   on the plot almost overlap each other, as well as for theta=0.25 and
%   theta=0.75.(Notice that they might not be exactly the same, but very
%   close to each other).
% 
%   In summary, we explain this plot both qualitatively and
%   quantitatively.


Err=[];
for i = 1:length(T)
    for j = 1:length(N)
        [t,y,errorFlag] = thetaODESolver(a,b,f,N(j),y0,T(i));
        Err(i,j)=abs(true_y(t(end))-y(end));
    end
end
E=Err;

figure
legend_array=cell(1,length(T));
for k=1:length(T)
    loglog(N,Err(k,:),"--*");
    legend_array(k)={"theta="+num2str(T(k))};
    hold on  
end
title('Error plot')
xlabel('N-values');
ylabel('Error')
legend(legend_array,'Location','northwest');
end


