function out = RunGa(problem, params)
  %% Problem
  CostFunction = problem.CostFunction;
  nVar = problem.nVar;

  %% Params
  MaxIt = params.MaxIt;
  nPop = params.nPop;
  pC = params.pC;
  nC = round(pC*nPop/2)*2;
  mu = params.mu;

  %% Template for Empty Indiviuals
  empty_individual.Position = [];
  empty_individual.Cost = [];

  % Best Solution Ever Found
  bestsol.Cost = inf;


  % Initialization
  pop = repmat(empty_individual, nPop, 1)
    for i = 1:nPop
      pop(i).Position = randi([0, 1], 1, nVar);
      pop(i).Cost = CostFunction(pop(i).Position);

        if pop(i).Cost < bestsol.Cost
          bestsol = pop(i);
        end

  end



  % Best Cost of Iterations
  bestcost = nan(MaxIt, 1);

  % Main Loop
  for it = 1:MaxIt

    % Initialize Offsprings Population
    popc = repmat(empty_individual, nC/2, 2);

    % Crossover
    for k = 1:nC/2

      % Select Parents
      q = randperm(nPop);
      p1 = pop(q(1));
      p2 = pop(q(2));

	  % Perform Crossover
	  [popc(k, 1).Position, popc(k, 2).Position]= ...
			SinglePointCrossover(p1.Position, p2.Position);


    end
  end
    % Convert popc to Single-Column Matrix
      popc = popc(:);

    % Mutation
    for l = 1:nC

      % Perform mutation
        popc(l).Position = Mutate(popc(l).Position, mu);

      % Evaluate
        popc(l).Cost = CostFunction(popc(l).Position);

      % Compare solution
        if popc(l).Cost < bestsol.Cost
            bestsol = popc(l);
        end

  end

    % Merge and Sort Populations
    pop = SortPopulation([pop; popc]);

    %Remove Extra Indiviuals
     pop = pop(1:nPop);

    % Update Best Cost of Iterations
    bestcost(it) = bestsol.Cost;

    % Display Iteration Information
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(bestcost(it))]);


  % Results
    out.pop = pop;
    out.bestsol = bestsol;
    out.bestcost = bestcost;

end
