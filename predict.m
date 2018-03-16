function p = predict(theta, X)

m = size(X, 1); % Number of training examples
p = zeros(m, 1);
p = X*theta;
p = sigmoid(p);
p = p + 0.50000;
p = floor(p);


end
