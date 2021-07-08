function E = piecewiseErrors(a,b,P,N,f)
%PIECEWISEERRORS Piecewise Polynomial Interpolation Errors
%   E = piecewiseErrors(a,b,P,N,f) will compute (an approximate to) the
%   error for a range of polynomial degrees P and number of subintervals N.
%   Given an interval [a,b], P is the order of polynomial interpolation, N is
%   the number of subintervals. f is a function mapping from [a,b] to R. The
%   output E is a matrix of size m*l, where m is the length of vector N and l
%   is the length of vector P. 
%   The function will plot for each polynomial
%   degree p_j the errors E_{ij} against h_i with a log-log scale.
%
%Comment on 
%   P = [1,2,3,4,5,6]; N = [4,8,16,32,64,128,256];
%   f = @(x)exp(2.*x); [a,b] = [0,1];
%   The output is a matrix filled with errors
%   Overall, for the same length of subinterval, the error appears smaller as 
%   for the larger polynomial degree p. 
%
%   Specifically, for individual polynomial degree p, the error decreases as 
%   the length of subinterval decreases. Special case could be found when the 
%   polynomial degree is 5 and 6, since there exists an intersection of these 
%   two lines, which means that, to some degree, the error is not strictly 
%   decreasing as the length of subinterval decreases for some certain polynomial degrees.
%   Perhaps, there will be some oscillations if we use small length of
%   subinterval.
%
%   If we do some analysis for this function and the error, it is
%   consistent that the piecewise polynomial interpolation performs very
%   well for some certain length of the subinterval, however, if we
%   continue decrease the length of the subinterval, there might be some
%   oscillations, but the error is roughly small.
%Comment on
%   P = [1,2,3,4,5,6]; N = [4,8,16,32,64,128,256];
%   f = @(x)1./(1+25.*x.^2); [a,b] = [-5.5];
%   The output is a matrix filled with errors
%   Considering the previous question, obviously, it shows that the oscillation 
%   phenomenon could be improved by using the piecewise polynomial interpolation 
%   very well. The error will decrease as the polynomial degree increases when
%   up to an suitable length of subinterval.
%   
%   Specifically, for individual polynomial degree, the error decreases as 
%   the length of subinterval decreases. However, there exits some oscillation 
%   at some certain h, which could tell us that the error will be large for some large
%   h. 
%   
%   If we do some analysis for the error term and the function, we could
%   draw a conclusion that in order to avoid the oscillation, piecewise
%   polynomial interpolation is a good choice.

xhat = linspace(a,b,2000);
F = f(xhat);
E = [];
h = [];
for i = 1:length(N)
    for j = 1:length(P)
        p_interp = piecewiseInterpolation(a,b,P(j),N(i),xhat,f);
        error = abs(p_interp-F);
        E(i,j) = max(error);
    end
    h(i) = (b-a)/N(i);
end

%plot the error
figure
legend_array = cell(1,length(P));
for k = 1:length(P)
    loglog(h,E(:,k));
    legend_array(k) = {"P="+num2str(P(k))};
    hold on
end
title('Error plot')
xlabel('length of subinterval');
ylabel('Error')
legend(legend_array,'Location','northwest');
end