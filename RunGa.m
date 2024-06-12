function out = RunGA(problem, params)
  % Problem
  CostFunc = problem.CostFunc;
  nVar = problem.nVar;

  % Params
  MaxIt = params.MaxIt;
  nPop = params.nPop;

  % Template for Empty Indiviuals
  empty_individual.Position = [];
  empty_individual.Cot = [];

  % Best Solution Ever Found
  bestsol.Cost - inf;


  % Initialization
  pop = repmat(empty_individual, nPop, 1)
    for i = 1:nPop
      pop(i).Position = randi([0, 1], 1, nVar);
      pop(i).Cost = CostFunc(pop(i).Position);

        if pop(i).Cost < bestsol.Cost
          bestsol = pop(i);
        end
    end

    out.pop = pop;

end
