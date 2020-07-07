function params = OptionsPSO(varargin)
% PSO algorithm parameters:
% num: Number of particles (25)
% chi: Restriction factor (1)
% w: Inertia factor (0.6)
% c1: Cognitive component weight (1.7)
% c2: Weighting of social component (1.7)
% MaxIter: maximum number of iterations (1000)
% StartPopX: initial population ([])
% StartPopV: initial velocity ([])
% MaxIter: maximum number of iterations
% ShowIter: Flag to show iterations
% TolFun: stop criteria
%
% Adapted version from: https://github.com/MatthewPeterKelly/ParticleSwarmOptimization
% Under The MIT License (MIT) 
% Original author: Matthew P. Kelly 2016

% Default parameters
num = 25;
chi = 1;
w = 0.600;
c1 = 1.700;
c2 = 1.700;
MaxIter = 1000;
StartPopX = [];
StartPopV = [];
ShowIter = 0;
TolFun = 0;

% Adding all parameters in the structure
params = struct('num',num,'chi',chi,'w',w,'c1',c1,'c2',c2,'MaxIter',MaxIter,'StartPopX',StartPopX,'StartPopV',StartPopV,'ShowIter',ShowIter,'TolFun',TolFun);

% Set of new parameters
if ~isempty(varargin)
    for i = 1:2:nargin
        params = setfield(params,varargin{i},varargin{i+1});
    end
end
