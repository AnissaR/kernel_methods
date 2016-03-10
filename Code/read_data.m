function X = read_data(filename)

path = '/Data/';
fullpath = strcat(pwd,strcat(path,filename));

X = csvread(fullpath);

end