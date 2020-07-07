function [X_Global,F_Global,iter,X,F]=PSOalg(evalFN,bounds,params)
% PSO algorithm
%
% Inputs:
% evalFN: objective function 
% bounds: search limits [Linf(D,1) Lsup(D,1)]
% params: PSO algorithm parameters
% num: number of particles (25)
% chi: restriction factor (1)
% w: inertia factor (0.6)
% c1: cognitive component weight (1.7)
% c2: weighting of social component (1.7)
% MaxIter: maximum number of iterations (1000)
% StartPopX: initial population ([])
% StartPopV: initial velocity ([])
% MaxIter: maximum number of iterations
% ShowIter: flag to show iterations
% TolFun: stop criteria
%
% Outputs:
% X_Global: best position found
% F_Global: best value found
% iter: number of iterations used 
% X: final swarm positions
% F: final swarm values
%
% Adapted version from: https://github.com/MatthewPeterKelly/ParticleSwarmOptimization
% Under The MIT License (MIT) 
% Original author: Matthew P. Kelly 2016

% Algorithm parameters
if nargin < 3
    params = OptionsPSO( );
else
    if isempty(params)
        params = OptionsPSO( );
    end
end

num = params.num;
chi = params.chi;
w = params.w;
c1 = params.c1;
c2 = params.c2;
MaxIter = params.MaxIter;
StartPopX = params.StartPopX;
StartPopV = params.StartPopV;
ShowIter = params.ShowIter;
TolFun = params.TolFun;

% Equivalence among variables
D=size(bounds,1);
xLow = bounds(:,1);
xUpp = bounds(:,2);
m = num;
n = D;

%%%% Initialize the population %%%
if isempty(StartPopX)
    % Sample two random points in the search space for each particle
    X1 = xLow*ones(1,m) + ((xUpp-xLow)*ones(1,m)).*rand(n,m);
    X2 = xLow*ones(1,m) + ((xUpp-xLow)*ones(1,m)).*rand(n,m);

    % Initialize population:
    X = X1;     % Initial position of the population
    V = X2-X1;  % Initial "velocity" of the population
else
    % User initialization
    X = StartPopX;
    V = StartPopV;
end

% Function value at each particle in the population
F = zeros(1,m);

for idx = 1:m   % Loop over particles
    F(1,idx) = evalFN(X(:,idx)');
end

X_Best = X;  % Best point, for each particle in the population
F_Best = F;  % Value of best point, for each particle in the population

[F_Global, I_Global] = min(F_Best); % Value of best point ever, over all points
X_Global = X(:,I_Global); % Best point ever, over all  points

%%%% MAIN LOOP:
for iter = 1:MaxIter
    
    % Random Values
    r1 = rand(n,m);
    r2 = rand(n,m);

    %%%%%%% Loop over particles  %%%%%%%%%%%%%%
    for idx = 1:m
        V(:,idx) =  ...   % Update equations
            chi*(w*V(:,idx) + ...    % Current search direction
            c2*r2(:,idx).*(X_Global-X(:,idx)) + ...  % Global direction
            c1*r1(:,idx).*(X_Best(:,idx)-X(:,idx)));    % Local best direction
        X(:,idx) = X(:,idx) + V(:,idx);  % Update position
        
        F(:,idx) = evalFN(X(:,idx)');   %Evaluate

        [F_Best(1,idx), iBest] = min([F(1,idx), F_Best(1,idx)]);
        if iBest == 1  % Then new point is better!
            X_Best(:,idx) = X(:,idx);
            [F_Global, iBest] = min([F_Best(1,idx), F_Global]);
            if iBest == 1 % Then new point is the global best!
                X_Global = X_Best(:,idx);
            end
        end

    end

    %%% Convergence:
    if TolFun ~= 0
        F_Var = var(F);
        if F_Var < TolFun
            if ShowIter == 1
                 fprintf('Optimization Converged. Exit: fVar < tolFun \n');
            end
            % Results in the required format
            X_Global = X_Global';
            X = X';
            break
        end
    end

    % Display iteration
    if ShowIter == 1
        disp(['Iteration: ',num2str(iter),'  Value: ',num2str(F_Global)]);
    end
end

% Results in the required format
X_Global = X_Global';
X = X';

return
