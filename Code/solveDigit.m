function solveDigit(Xtr,Y,K,KT,d)
% function that solve the digit problem and write the solution on a file
% called 'solution.csv'
%   Input:
%       - Xtr: train points
%       - Y:   train results
%       - K:   Gram matrix for the train points
%       - KT:  Gram matrix between the train point and the test points
%       - d:   number of classes for the digit problem
%
% Note that if we have n train points and m test point the dimension of the
% matrix K will be n x n while the dimension of matrix KT will be m x n


n = size(Xtr,1);
alpha = zeros(n,d);

for j=1:d
    alpha(:,j) = solveQP(K,Y(:,j));
end
% 

% once we have all the d alphas vector we use the One Vs All The Rest
% strategy
% Matrix Yte is the matrix of the prediction on the test points 
Yte = KT*alpha;

[~,I] = max(Yte,[],2);

I = I - 1;

save_solution(I,'solution.csv');

end