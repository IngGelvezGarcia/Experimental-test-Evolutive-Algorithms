% Simple DE example

clc
close all
clear all

% Search space limits
FVrminbound = [-10 -10 -10 -10 -10 -10 -10 -10 -10 -10];
FVrmaxbound = [ 10  10  10  10  10  10  10  10  10  10];
FVrbound = [FVrminbound' FVrmaxbound'];

% DE algorithm options
parametros = OptionsDE('I_NP',20,'F_CR',0.95,'F_weight',0.8,'I_itermax',2000','I_strategy',1,'I_refresh',10,'ShowIter',0);

% Optimization using PDEalg
[FVr_x,FVr_oa,I_iter] = DEalg(@Rastrigin,FVrbound,parametros)
