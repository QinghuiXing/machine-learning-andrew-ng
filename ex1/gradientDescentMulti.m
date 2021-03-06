function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %

dim = size(X,2);
features = X(:,1:dim);
output = features*theta;
diff = output-y;

grads = zeros(dim,1);
grads(1,1) = sum(diff)/m;
    for idx = 2:dim
        newdiff = diff.*X(:,idx);
        grads(idx,1) = sum(newdiff)/m;
    end

    for idx = 1:dim
        theta(idx,1) = theta(idx,1)-alpha*grads(idx,1);
    end

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
