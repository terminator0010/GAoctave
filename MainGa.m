clc;
clear;
close all;

%% Problem Definition
problem.CostFunction = @(x) MinOne(x);
problem.nVar = 10;

%% GA Parameters
params.MaxIt = 100;
params.nPop = 20;

%% Run GA
out = RunGA(problem,params);

%% Results

