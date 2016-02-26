function save_solution(v,filename)
%%
% Function that given a vector v of lenght n generate a csv file named
% solution.csv in which stores the vector v in the following format:
% 
% Id,Prediction
% 1,v(1)
% 2,v(2)
% 3,v(3)
% ...
% n,v(n)
%

n = length(v);
header = 'Id,Prediction';
% opening file
fid =fopen(filename,'wt');
% writing header
fwrite( fid, sprintf('%s\n', header ) );
for i=1:n
    % writing the vector
    fwrite( fid, sprintf('%g,%g\n', i,v(i) ) );
end

fclose(fid);

end