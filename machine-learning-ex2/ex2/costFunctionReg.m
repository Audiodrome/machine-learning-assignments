function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


hypothesis = sigmoid(X * theta);

% a = -y .* log(hypothesis);
% b = (1 - y) .* log(1 - hypothesis);

cost = sum(-y .* log(hypothesis) - (1 - y) .* log(1 - hypothesis)) / m;
regularization = sum(theta(2:end).^2) * (lambda / (2 * m));

J = cost + regularization;

grad(1) = sum((hypothesis - y) .* X(:, 1)) / m;

for i = 2:length(grad)
    cost = sum((hypothesis - y) .* X(:, i)) / m;
    grad(i) = cost + (lambda * theta(i) / m);
end



% =============================================================

end
