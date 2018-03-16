clear ; close all; clc
fprintf('Running Gradient Descent algorithm................\n');
% Data loading and Normalization
data = load('ex2data1.txt');
X = data(:, [1, 2]); y = data(:, 3);
[X mu sigma] = featureNormalize(X);

% m = number of input samples
% n = number of features in each input sample
[m, n] = size(X);

% Add intercept term to x and X_test
X = [ones(m, 1) X];

% Initialize weights
initial_theta = zeros(n + 1, 1);

%Running Gradient Descent Algorithm
[theta, cost] = gradientDescent(X, y, initial_theta, 0.1, 1000, 10);

%Prediction on Random values
n1 = (45-mu(1))/sigma(1);
n2 = (85-mu(2))/sigma(2);
prob = sigmoid([1 n1 n2] * theta);
fprintf(['For a student with scores 45 and 85, we predict an admission probability of %f\n'], prob);

% Compute accuracy on our training set
p = predict(theta, X);
fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('\n');

%saving parameters for future use
save('parameters.mat', 'theta');


