% Run this m-file to generate
% your answers based on the  
% function m-files that you 
% have written.
% You should not modify this file.

clc
close all
clear

%% lagrangePoly
funcStr = 'lagrangePoly';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    
    fprintf(['\n Trying to run your ' funcStr '.m\n'])
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 1
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    p = 5;
    x = linspace(1,5,p+1);
    n = 10;
    xhat = linspace(1,5,n);
    [L,errorFlag] = lagrangePoly(p,x,n,xhat);
    fprintf('\n Values of output p=5 for interval x=[1,5], uniform spacing:\n')
    disp("L = ")
    disp(L)
    disp("errorFlag = ")
    disp(errorFlag)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 2
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    p = 5;
    x = [1.5,1,5,3.3,4.4,4.7];
    n = 10;
    xhat = linspace(1,5,n);
    [L,errorFlag] = lagrangePoly(p,x,n,xhat);
    fprintf('\n Values of output p=5 for interval x=[1,5], nonuniform spacing:\n')
    disp("L = ")
    disp(L);
    disp("errorFlag = ")
    disp(errorFlag)
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 3
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    p = 5;
    eps = 1.0e-13;
    x = linspace(1,5,5);
    x = [x,x(3)-eps];
    n = 10;
    xhat = linspace(1,5,n);
    [L,errorFlag] = lagrangePoly(p,x,n,xhat);
    fprintf('\n Values of output p=5 for interval x=[1,5], non-distinct points:\n')
    disp("errorFlag = ")
    disp(errorFlag)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 4 - Help
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fprintf(['\n help ' funcStr '\n'])
    help lagrangePoly

catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end

%% polyInterpolation
funcStr = 'polyInterpolation';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    
    fprintf(['\n Trying to run your ' funcStr '.m\n'])
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 1
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    p = 4;
    a = -1.5;
    b = 1.5;
    n = 8;
    xhat = linspace(-1.5,1.5,n);
    f = @(x) exp(2*x)-sin(pi*x);
    
    interp = polyInterpolation(a,b,p,xhat,f);
    fprintf('\n Values of output for p=4 on interval [-1.5,1.5]:\n')
    disp("interp = ")
    disp(interp)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 2
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    p = 4;
    a = -1.5;
    b = 1.5;
    n = 100;
    xhat = linspace(-1.5,1.5,n);
    f = @(x) exp(2*x)-sin(pi*x);
    
    interp = polyInterpolation(a,b,p,xhat,f);
    fprintf('\n Plotting interpolant for p=4 on interval [-1.5,1.5]:\n')
    
    figure
    plot(xhat,f(xhat))
    hold on
    plot(xhat,interp,'r')
    hold off
    legend("f(x)","p_4(x)")
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 3 - Help
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fprintf(['\n help ' funcStr '\n'])
    help polyInterpolation
    
    
catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end
    
%% lagrangeErrors
funcStr = 'lagrangeErrors';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    
    fprintf(['\n Trying to run your ' funcStr '.m\n'])
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 1
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    P = 1:10;
    a = -1.5;
    b = 1.5;
    f = @(x) exp(2*x)-sin(pi*x);
    
    E = lagrangeErrors(a,b,P,f);
    fprintf('\n Error Values for P=1:10:\n')
    disp("E = ")
    disp(E)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 2 - Help
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fprintf(['\n help ' funcStr '\n'])
    help lagrangeErrors
    
    
catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end

%% piecewiseInterpolation
funcStr = 'piecewiseInterpolation';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    
    fprintf(['\n Trying to run your ' funcStr '.m\n'])
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 1
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    p = 3;
    n = 7;
    a = -1.5;
    b = 1.5;
    xhat = linspace(a,b,10);
    f = @(x) exp(2*x)-sin(pi*x);
    
    p_interp = piecewiseInterpolation(a,b,p,n,xhat,f);
    fprintf('\n Piecewise interpolant with p=3, n=7:\n')
    disp("p_interp = ")
    disp(p_interp)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 2
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    p = 4;
    n = 5;
    a = -1.5;
    b = 1.5;
    xhat = [-0.33, 1.21, -1.17, 0.85];
    f = @(x) exp(2*x)-sin(pi*x);
    
    p_interp = piecewiseInterpolation(a,b,p,n,xhat,f);
    fprintf('\n Piecewise interpolant with p=4, n=5, non-sequential xhat:\n')
    disp("p_interp = ")
    disp(p_interp)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 3
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    p = 2;
    a = -1.5;
    b = 1.5;
    n = 100;
    xhat = linspace(-1.5,1.5,n);
    f = @(x) exp(2*x)-sin(pi*x);
    
    p_interp = piecewiseInterpolation(a,b,p,n,xhat,f);
    fprintf('\n Plotting piecewise interpolant for p=2 on interval [-1.5,1.5]:\n')
    
    figure
    plot(xhat,f(xhat))
    hold on
    plot(xhat,p_interp,'r')
    hold off
    legend("f(x)","p_2(x)")
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 4 - Help
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fprintf(['\n help ' funcStr '\n'])
    help piecewiseInterpolation
    

    
catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end

%% piecewiseErrors
funcStr = 'piecewiseErrors';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    
    fprintf(['\n Trying to run your ' funcStr '.m\n'])
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 1
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    P = 1:5;
    N = [5,10,15,20];
    a = -1.5;
    b = 1.5;
    f = @(x) exp(2*x)-sin(pi*x);
    
    E = piecewiseErrors(a,b,P,N,f);
    fprintf('\n Error Values for P=1:5, N=[5,10,15,20]:\n')
    disp("E = ")
    disp(E)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 2 - Help
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fprintf(['\n help ' funcStr '\n'])
    help piecewiseErrors
    
    catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end
    
%% derivLagrangePoly
funcStr = 'derivLagrangePoly';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    
    fprintf(['\n Trying to run your ' funcStr '.m\n'])
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 1
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    p = 5;
    x = linspace(1,5,p+1);
    n = 10;
    xhat = linspace(1,5,n);
    LDiff = derivLagrangePoly(p,x,n,xhat);
    fprintf('\n Values of output p=5 for interval x=[1,5], uniform spacing:\n')
    disp("LDiff = ")
    disp(LDiff)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 2
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    p = 5;
    x = [1.5,1,5,3.3,4.4,4.7];
    n = 10;
    xhat = linspace(1,5,n);
    LDiff = derivLagrangePoly(p,x,n,xhat);
    fprintf('\n Values of output p=5 for interval x=[1,5], nonuniform spacing:\n')
    disp("LDiff = ")
    disp(LDiff);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 3 - Help
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fprintf(['\n help ' funcStr '\n'])
    help derivLagrangePoly
    
catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end

%% polyDerivative
funcStr = 'polyDerivative';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    fprintf(['\n Trying to run your ' funcStr '.m\n'])
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 1 - Central Difference
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    p = 4;
    k = 2;
    h = 0.01;
    x = linspace(0,1,5);
    f = @(x) exp(2*x)-sin(pi*x);
    fprintf('\n Values for p=4, at a set of points x:\n\n')
    for m=1:5
        dInterp = polyDerivative(x(m),p,h,k,f);
        disp("dInterp = ")
        disp(dInterp)
    end


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 2 - All differences, p = 3
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    p = 3;
    K = [0,1,2,3];
    h = 0.01;
    x = 0;
    f = @(x) exp(2*x)-sin(pi*x);
    fprintf('\n Values for p=3, all possible differences:\n\n')
    for m=1:4
        dInterp = polyDerivative(x,p,h,K(m),f);
        disp("dInterp = ")
        disp(dInterp)
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 3 - Help
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fprintf(['\n help ' funcStr '\n'])
    help polyDerivative
    
catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end

%% derivativeError
funcStr = 'derivativeErrors';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    fprintf(['\n Trying to run your ' funcStr '.m\n'])
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 1
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    P = [2,4,6,8];
    H = [1/4,1/8,1/16,1/32];
    x = 0;
    f = @(x) exp(2*x)-sin(pi*x);
    fdiff = @(x) 2*exp(2*x)-pi*cos(pi*x);
    fprintf('\n Error test:\n\n')
    E = derivativeErrors(x,P,H,f,fdiff);
    disp("E = ")
    disp(E)

    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 2 - Help
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fprintf(['\n help ' funcStr '\n'])
    help derivativeErrors
    
catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end

fprintf('\n FINISHED! (Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8) \n')