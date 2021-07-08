% Run this m-file to generate
% your answers based on the  
% function m-files that you 
% have written.
% You should not modify this file.

clc

%% forwElimStop_func
funcStr = 'forwElimStop_func';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    A = [2 3 4 2; 4 9 10 6; 6 15 20 12];
    fprintf(['\n Trying to run your ' funcStr '.m\n'])
    r = 0;
    s = 1;
    B = forwElimStop_func (A,r,s);
    fprintf('\n Values of output B for r=0, s=1:\n')
    disp(B)
    fprintf('\n Values of output B for r=2, s=0:\n')
    r = 2;
    s = 0;
    B = forwElimStop_func (A,r,s);
    disp(B)
    fprintf('\n Combining with backward substitution.\n Values of solution x:\n')
    A = [2 3 4 2; 4 9 10 6; 6 15 20 12];
    r = 2;
    s = 0;
    B = forwElimStop_func (A,r,s);
    x = backwSub_func (B);
    disp(x)
    fprintf(['\n help ' funcStr '\n'])
    help forwElimStop_func

catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end

%% forwElimPP_func
funcStr = 'forwElimPP_func';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    A = [2 3 4 2; 4 9 10 6; 6 15 20 12];
    fprintf(['\n Trying to run your ' funcStr '.m\n'])
    B = forwElimPP_func(A);
    fprintf('\n Values of output B:\n')
    disp(B)
    fprintf('\n Combining with backward substitution.\n Values of solution x:\n')
    A = [2 3 4 2; 4 9 10 6; 6 15 20 12];
    B = forwElimPP_func (A);
    x = backwSub_func (B);
    disp(x)
    fprintf(['\n help ' funcStr '\n'])
    help forwElimPP_func

catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end


%% forwElimLU_func
funcStr = 'forwElimLU_func';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    fprintf('\n Test using following matrix A:\n')
    A = [1 1 0; 2 1 -1; 0 -1 -1];
    disp(A);
    fprintf(['\n Trying to run your ' funcStr '.m\n'])
    [L,U] = forwElimLU_func (A);
    fprintf('\n Values of output L, U and L*U:\n')
    disp(L)
    disp(U)
    disp(L*U)
    %
    fprintf('\n Different A:\n')
    A = [1 1 0; 0 0 -1; 1 -1 -1];
    disp(A);
    fprintf(['\n Trying to run your ' funcStr '.m\n'])
    [L,U] = forwElimLU_func (A);
    fprintf('\n Values of output L, U and L*U:\n')
    disp(L)
    disp(U)
    disp(L*U)
    fprintf(['\n help ' funcStr '\n'])
    help forwElimLU_func

catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end



%% jacobi_func
funcStr = 'jacobi_func';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    A = [4 -1 0; -1 8 -1; 0 -1 4];
    b = [48 ; 12 ; 24];
    x0 = [1 ; 1 ; 1];
    Nmax = 10;
    fprintf(['\n Trying to run your ' funcStr '.m\n'])
    x_mat = jacobi_func (A,b,x0 , Nmax );
    fprintf('\n Values of x_mat:\n')
    disp(x_mat)
    %
    fprintf(['\n help ' funcStr '\n'])
    help jacobi_func

catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end


%% findSystemSizes_func
funcStr = 'findSystemSizes_func';
fprintf(['\nOutputs based on ' funcStr '.m'])
try
    Nmax = 200;
    TOL  = 10^( -2);
    mMax = 10;
    fprintf(['\n Trying to run your ' funcStr '.m'])
    tStart = tic;
    [m_vec , k_vec , p] = findSystemSizes_func (Nmax ,TOL , mMax );
    tElapsed = toc(tStart);
    fprintf('\n Values of m_vec:\n')
    disp(m_vec)
    fprintf('\n Values of k_vec:\n')
    disp(k_vec)
    fprintf('\n Value of p:\n')
    disp(p)
    fprintf('\n Execution time of findSystemSizes_func (in seconds):\n')
    disp(tElapsed)
catch ME
    fprintf('\n Failed to generate output.\n Error message:\n')
    fprintf(2,' %s\n',ME.message)
end



fprintf('\nFINISHED! (Q1, Q2, Q3, Q4, Q5, Q6) \n')