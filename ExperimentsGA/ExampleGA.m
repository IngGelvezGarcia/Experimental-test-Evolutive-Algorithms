% Simple GA example

clc
close all
clear all

% GA algorithm configuration
parametros = OptionsGA('tolerance',1e-10,'popSize',40,'generationsNum',1000,'crossProb',0.9,'mutateProb',0.1,'ShowIter',0);

% Search space limits
bounds = [-2*ones(10,1) 2*ones(10,1)];

% Optimization using GAalg
[x,fmin] = GAalg(@Rastrigin,bounds,parametros)
