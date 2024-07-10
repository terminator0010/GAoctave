clc;
clear;
close all;

%% Problem Definition
problem.CostFunction = @(x) MinOne(x);
problem.nVar = 10;

%% GA Parameters
params.MaxIt = 50;
params.nPop = 20;
params.pC = 1;
params.mu = 0.02;


%% Run GA
out = RunGa(problem,params);

%% Results

