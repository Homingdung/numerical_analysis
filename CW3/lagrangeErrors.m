function E = lagrangeErrors(a,b,P,f)
%LAGRANGEERRORS Lagrange Interpolation Errors
%   E = lagrangeErrors(a,b,P,f) will computes (an approximation to) 
%   the error for a range of polynomial degrees P.
%   The output will be a vector E of length l input f 
%   is a function mapping from [a,b] to R, P is the 
%   order of polynomial interpolation.
%Comment on
%   f = @(x)exp(2.*x); [a,b] = [0,1]; P = [1,2,3,...,10];
%   the output E is an error vector corresponding to the different degrees. 
%   The error decreases as the polynomial degree increases and the error is 
%   very closed to 0 when the degree is 10.
%
%   If we do some analysis for the error term of lagrange Interpolation
%   formula, it is consistent that the error will decrease as the
%   polynomial degree increases, which means that the lagrange
%   interpolation performs very well for this function.
%
%Comment on
%   f = @(x)1./(1+25.*x^2); [a,b] = [-5,5]; P = [1,2,3,...,10];
%   the output E is an error vector corresponding to the different degrees.
%   Overall, the error shows oscillation at the edges of an interval when 
%   using polynomial interpolation with polynomials of high degree over a 
%   set of equally-spaced interpolation points. It could give us insight 
%   that the error is not always decreasing as the polynomial degrees 
%   increases, which means that the high polynomial degree could not always 
%   improve the accuracy. 
%
%   Specifically, the error remains in a small range around 0~1 for the polynomial 
%   degree from 1-7, but after that, the error increases dramatically and then drop 
%   down to a relatively low level at P=9. Finally, the error reaches its maximum at P=10. 
%
%   If we do some analysis for this function, the reason perhaps lies in the 
%   sensitivity, which means the magnitude of the n-th order derivatives of 
%   this particular function grows quickly when n increases.

xhat = linspace(a,b,2000);
for i = 1:length(P)
    M = polyInterpolation(a,b,P(i),xhat,f);
    error = abs(M-f(xhat));
    E(1,i) = max(error); %take the maximum value among the 2000 values
end

figure
semilogy(P,E,'--o','MarkerFaceColor','b');
xlabel("polynomial degree");
ylabel("Error");
title("Errors against degrees (semilogy)");
legend("Errors")
legend('Location','northeast')

end



