% Run this m-file to generate
% your answers based on the  
% function m-files that you 
% have written.
% You should not modify this file.

clc
close all
clear

    
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

%% thetaODESolver

funcStr = 'thetaODESolver';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    fprintf(['\n Trying to run your ' funcStr '.m\n'])
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 1
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    a = 0;
    b = 2;
    N = 10;
    y0 = 0;
    theta = 0.75;
    f = @(t,y) y+sin(pi*t);
    fprintf('\n thetaODEsolver using fixed point iteration, theta=0.75:\n')
    [t,y,errorFlag] = thetaODESolver(a,b,f,N,y0,theta);
    disp("t = ")
    disp(t)
    disp("y = ")
    disp(y)
    disp("errorFlag = ")
    disp(errorFlag)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 2
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    a = 0;
    b = 2;
    N = 10;
    y0 = 0;
    theta = 0.75;
    f = @(t,y) y+sin(pi*t);
    df = @(t,y) ones(size(t));
    fprintf('\n thetaODEsolver using Newton iteration, theta=0.75:\n')
    [t,y,errorFlag] = thetaODESolver(a,b,f,N,y0,theta,df);
    disp("t = ")
    disp(t)
    disp("y = ")
    disp(y)
    disp("errorFlag = ")
    disp(errorFlag)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 3
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    a = 0;
    b = 2;
    N = 10;
    y0 = 0;
    theta = 0.75;
    f = @(t,y) 20*y+sin(pi*t);
    fprintf('\n thetaODEsolver using fixed point iteration, theta=0.75, non-convergence:\n')
    [t,y,errorFlag] = thetaODESolver(a,b,f,N,y0,theta);
    disp("errorFlag = ")
    disp(errorFlag)
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 4 - Help
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fprintf(['\n help ' funcStr '\n'])
    help thetaODESolver
    
catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end

%% thetaSchemeErrors

funcStr = 'thetaSchemeErrors';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    fprintf(['\n Trying to run your ' funcStr '.m\n'])

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 1
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    a = 0; b = 2;
    N = [4, 8, 16, 32, 64, 128, 256];
    T = [0.3, 0.6, 0.9];
    f = @(t,y) y-t.^2+1;
    true_y = @(t) (t+1).^2-exp(t)/2; 
    y0 = 0.5;
    fprintf('\n thetaSchemeErrors, theta = [0.3,0.6,0.9] :\n')
    E = thetaSchemeErrors(a,b,f,true_y,y0,N,T);
    disp("E = ")
    disp(E)
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 4 - Help
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fprintf(['\n help ' funcStr '\n'])
    help thetaSchemeErrors
    
catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end
    
%% rungeKutta

funcStr = 'rungeKutta';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    fprintf(['\n Trying to run your ' funcStr '.m\n'])
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 1
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    a = 0;
    b = 2;
    N = 10;
    m = 1;
    method = 4;
    y0 = 0;
    f = @(t,y) y+sin(pi*t);
    fprintf('\n rungeKutta using m=1, method 4:\n')
    [t,y] = rungeKutta(a,b,f,N,y0,m,method);
    disp("t = ")
    disp(t)
    disp("y = ")
    disp(y)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 2
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    a = 0;
    b = 2;
    N = 10;
    m = 2;
    method = 1;
    y0 = [0;1];
    f = @(t,y) [y(1)+y(2);-y(1)+y(2)-t^3];
    fprintf('\n rungeKutta using m=2, method 1:\n')
    [t,y] = rungeKutta(a,b,f,N,y0,m,method);
    disp("t = ")
    disp(t)
    disp("y = ")
    disp(y)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 3
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    a = 0;
    b = 2;
    N = 10;
    m = 3;
    method = 2;
    y0 = [0;1;1];
    f = @(t,y) [y(1)+y(3);-y(1)+y(2)-t^3;y(1)*y(2)-y(3)];
    fprintf('\n rungeKutta using m=3, method 2:\n')
    [t,y] = rungeKutta(a,b,f,N,y0,m,method);
    disp("t = ")
    disp(t)
    disp("y = ")
    disp(y)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Test 4 - Help
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fprintf(['\n help ' funcStr '\n'])
    help rungeKutta
    
catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end


fprintf('\n FINISHED! (Q1, Q2, Q3, Q4, Q5, Q6) \n')

