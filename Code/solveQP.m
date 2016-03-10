function [alpha] = solveQP(K,y)
%% Function that given a Gram matrix K and a vector of realizations y solve:
%   
%   min 1/2 sum( csi ) + 1/2 alpha^T*K*alpha
%   subject to:
%       y(i)*alpha*K + csi - 1 >= 0,
%       csi >= 0
%
% reducing it to the following Qudratic problem
%
%   min 1/2*x^T*H*x + g^T*x
%   subject to:
%       A*x <= b
%
% Input:
%   K - gram matrix
%   y - realization vector
%
% Output:
%   alpha - coefficients of f predictor
%

n = size(K,1);

% defining the variables for the quadratic problem
H = zeros(2*n);

A = zeros(2*n);

g = zeros(2*n,1);

b = zeros(2*n,1);

H(1:n,1:n) = K;

A(1:n,1:n) = -diag(y)*K;

A(1:n,n+1:2*n) = -eye(n);

A(n+1:2*n,n+1:2*n) = -eye(n);

g(n+1:2*n) = 1/n*ones(n,1);

b(1:n) = -ones(n,1);

x = quadprog(H,g,A,b);

alpha = x(1:n);

end