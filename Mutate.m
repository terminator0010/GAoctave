function y = Mutate(x, mu, sigma)
  flag = (rand(size(x)) < mu);

  y = x;
  r = rand(size(x));
  y(flag) = x(flag) + sigma*r(flag);

 end
