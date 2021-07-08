% Run this m-file to generate
% your answers based on the  
% function m-files that you 
% have written.
% You should not modify this file.

clc

%% bisection_func
funcStr = 'bisection_func';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    f=@(x) x.^3+x.^2-2*x-2;
    a=1;
    b=2;
    Nmax = 5;
    fprintf(['\n Trying to run your ' funcStr '.m'])
    p_vec = bisection_func(f,a,b,Nmax);
    sz = size(p_vec);
    fprintf('\n Size of p_vec:\n')
    fprintf('    [ %1.0f , %1.0f ]\n',sz(1),sz(2))
    fprintf('\n Values of p_vec:\n')
    disp(p_vec)
catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end



%% bisectionStop_func
funcStr = 'bisectionStop_func';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    f=@(x) x.^3+x.^2-2*x-2;
    a=1;
    b=2;
    Nmax = 50;
    TOL = 1e-4;
    fprintf(['\n Trying to run your ' funcStr '.m'])
    p_vec = bisectionStop_func(f,a,b,Nmax,TOL);
    sz = size(p_vec);
    fprintf('\n Size of p_vec:\n')
    fprintf('    [ %1.0f , %1.0f ]\n',sz(1),sz(2))
    fprintf('\n Values of p_vec:\n')
    disp(p_vec)
    fprintf(['\n help ' funcStr '\n'])
    help bisectionStop_func
catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end



%% fpiter_func
funcStr = 'fpiter_func';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    f=@(x) x.^3+x.^2-2*x-2;
    c=1/10;
    p0=1;
    Nmax = 5;
    fprintf(['\n Trying to run your ' funcStr '.m'])
    p_vec = fpiter_func(f,c,p0,Nmax);
    sz = size(p_vec);
    fprintf('\n Size of p_vec:\n')
    fprintf('    [ %1.0f , %1.0f ]\n',sz(1),sz(2))
    fprintf('\n Values of p_vec:\n')
    disp(p_vec)
    fprintf(['\n help ' funcStr '\n'])
    help fpiter_func
catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end

%% newton_func
funcStr = 'newton_func';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    f=@(x) x.^2 - 2;
    dfdx = @(x) 2*x;
    p0 = 1;
    Nmax = 5;
    fprintf(['\n Trying to run your ' funcStr '.m'])
    p_vec = newton_func(f,dfdx,p0,Nmax);
    sz = size(p_vec);
    fprintf('\n Size of p_vec:\n')
    fprintf('    [ %1.0f , %1.0f ]\n',sz(1),sz(2))
    fprintf('\n Values of p_vec:\n')
    disp(p_vec)
    fprintf(['\n help ' funcStr '\n'])
    help newton_func
catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end


%% optParamFPiter_func
funcStr = 'optParamFPiter_func';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    f = @(x) x.^3 + x.^2 - 2*x - 2;
    p0 = 1;
    p = sqrt (2);
    TOL = 10^( -6);
    Nmax = 20;
    fprintf(['\n Trying to run your ' funcStr '.m'])
    tStart = tic;
    [c_opt , N_opt ] = optParamFPiter_func(f,p0 ,p,TOL , Nmax );
    tElapsed = toc(tStart);
    fprintf('\n Value of c_opt:\n')
    disp(c_opt)
    fprintf('\n Value of N_opt:\n')
    disp(N_opt)
    fprintf('\n Execution time of optParamFPiter_func (in seconds):\n')
    disp(tElapsed)
catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end


%% 

fprintf('\nFINISHED! \n')