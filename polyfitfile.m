function result = polyfitfile( csvFile, n )
%POLYFITFILE use polyfit to smoothen input data
%   inputs: 
%   csvFile: full path of csv data file containing spectrum data 
%   n: fit to a polynomial of degree n
%   output:
%   a matrix containing the data after polyfit
%
% Hai Yan
% 6/27/2016
% ver 1.0


% read data
data = importdata(csvFile);

% filter the noise
x = data(:,1);  % Wavelength
y = data(:,2);  % Power
[p,~,mu] = polyfit(x,y,n);    % use centering and scaling to improve 
% numerical properties of the polyfit
f = polyval(p,x,[],mu);

figure
plot(x,y,x,f)
title(strcat({'Polynomial order is '}, num2str(n))) % use cell array to
% avoid trailing white spaces being ignored.

result = [x f];


% write to file
[pathstr,name,~] = fileparts(csvFile);
csvName = strcat(name,'-smooth','.csv');
csvPath = fullfile(pathstr, csvName);
dlmwrite(csvPath,result,'precision',10);

end
    




