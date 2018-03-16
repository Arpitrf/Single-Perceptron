function [X_norm, mu, sigma] = featureNormalize(X)

X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));
nof = size(X,2);
k = size(X,1);

for i = 1:nof
	temp = X(:,i);
	p = mean (temp)*ones(k, 1);
	mu(i) = mean(temp);
	sd = std (temp);
	sigma(i) = sd;
	X_norm(:, i:i) = X_norm(:, i:i) - p;
	X_norm(:, i:i) = X_norm(:, i:i)/sd;
end;

end
