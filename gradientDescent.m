function [theta, J] = gradientDescent(X, y, theta, alpha, num_iters, lambda)
  m = length(y); % number of training examples
  t0 = theta(1);

  for iter = 1:num_iters
    theta = theta - (((X')*(sigmoid(X*theta) - y))*alpha)/m ;
    %theta = theta - (((X')*(sigmoid(X*theta) - y)  + lambda*theta)*alpha)/m;
  end
    
      
  theta(1) = t0;
  for iter = 1:num_iters
    theta(1) = theta(1) - (sum((sigmoid(X*theta) - y))*alpha)/m ;
  end
  
  J = costFunction(theta, X, y);

end
