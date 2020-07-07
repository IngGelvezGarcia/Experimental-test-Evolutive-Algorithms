function params = OptionsGA(varargin)
% GA algorithm parameters:
% tolerance: the tolerance during calculation, e.g. 1e-4
% popSize: the size of population, must be a positive even integer, e.g. 30 (even number)
% generationsNum: the number of generations, the terminal criteria, e.g. 1000
% crossProb: the probability of crossing over, e.g. 0.9
% mutateProb: the probability of mutation, e.g. 0.1
% ShowFlag: Flag to show iterations (Yes: 1, No: 0) (0)
%
% Adapted version from: https://gist.github.com/shenbennwdsl/a2aa06de6f841e98e187
% Under GitHub Open Source Applications Terms and Conditions
% Original author: shenbennwdsl

% Default parameters
tolerance = 1e-4;
popSize = 30;
generationsNum = 1000;
crossProb = 0.9;
mutateProb = 0.1;
ShowIter = 0;

% Adding all parameters in the structure
params = struct('tolerance',tolerance,'popSize',popSize,'generationsNum',generationsNum,'crossProb',crossProb,'mutateProb',mutateProb,'ShowIter',ShowIter);

% Set of new parameters
if ~isempty(varargin)
    for i = 1:2:nargin
        params = setfield(params,varargin{i},varargin{i+1});
    end
end
