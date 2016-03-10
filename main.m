%% loading files
addpath(genpath(pwd));

%% loading train data
Xtr = read_data('Xtr.csv');
Ytr = read_data('Ytr.csv');

%%loading test data
Xte = read_data('Xte.csv');

% number of train points
n = size(Xtr,1);
% number of different classes
d = 10;

%% defining the vector of observation
% Y has 10 columns (one per digit) and Y(i,j+1) = 1 if the digit Ytr(i) = j
Ytr = Ytr(:,2);
Y = -ones(n,10);

for i=1:n
    Y( i, Ytr(i)+1 ) = 1;
end

%% defining kernel matrix
sigma2 = 1;
KK = exponential_euclidean([Xtr;Xte],1);
K = KK(1:n,1:n);

% matrix of coordinates of prediction function
alpha = zeros(n,d);

for j=1:d
    alpha(:,j) = solveQP(K,Y(:,j));
end




