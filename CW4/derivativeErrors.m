function E = derivativeErrors(x,P,H,f,fdiff)
%DERIVATIVEERRORS finds the error of the derivative of polynomial interpolant
%
%   E = derivativeErrors(x,P,H,f,fdiff) 
%   Inputs:x - evaluation point
%          P - set of even polynomial degrees
%          H - set of widths
%          f - handle of function to be evaluated
%          fdiff - derivative of the given function
%   Outpus:E - matrix containing the error for the approximation
%   The function will plot error against width for each degree of
%   polynomial with a logarithmic scale on both axies
%
%Comment on 
%   P=[2,4,6,8];H=[1/4,1/8,1/16,1/32,1/64,1/128,1/256];
%   f=@(x)exp(2.*x);x=1;
%
%   In all cases, reducing h here leads to a reduction in error.
%   Straight lines on log-log plot indicate O(h^l) convergence for some l. 
%   Actually, it should be that l = p+1 in all cases here, which is amazing
%   since we observed O(h^2) convergence for piecewise linear
%   interpolation.
%
%   For p = 8, the plot becomes flat when reaching some h and the tailling off of the 
%   error for p = 8 is due to floating point precision and round-off errors dominating.
%
%   If we do some mathematical analysis for the error term, we could find
%   that our result is consistent with the theoretical inference, as well as the plot.


F=fdiff(x);
E=[];
h=[];
for i = 1:length(P)
    for j = 1:length(H)
        dInterp = polyDerivative(x,P(i),H(j),P(i)./2,f);
        error=abs(dInterp-F);
        E(i,j)=error;
    end
end

figure
legend_array=cell(1,length(P));
for k=1:length(P)
    loglog(H,E(k,:),"--*");
    legend_array(k)={"P="+num2str(P(k))};
    hold on  
end
title('Error plot')
xlabel('width');
ylabel('Error')
legend(legend_array,'Location','northwest');
end
