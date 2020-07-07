% Simple PSO example

clc
close all
clear all

% PSO algorithm configuration
parametros = OptionsPSO('num',30,'chi',1,'w',0.729,'c1',1.494,'c2',1.494,'MaxIter',2000,'ShowIter',0);

% Search space limits
bounds = [-2*ones(10,1) 2*ones(10,1)];

% Optimization using PSOalg
[x,f,gen] = PSOalg(@Rastrigin,bounds,parametros)
