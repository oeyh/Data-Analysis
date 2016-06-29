function result = noisefilter( csvFile, para )
%NOISEFILTER filtering out certain frequency range and smoothen input data
%   inputs: 
%   csvFile: full path of csv data file containing spectrum data 
%   para: filter parameters
%
% Hai Yan
% 6/27/2016
% ver 1.0
% not completed


% read data
data = importdata(csvFile);

% filter the noise
x = data(:,1);  % Wavelength
y = data(:,2);  % Power
fY = fft(y);    % complex numbers
figure
plot(imag(fY))

% Method 1: get rid of certain frequency
% parse parameters
n = length(fY);
lowLimit = round(para(1)*n);
highLimit = round(n-para(2)*n);
window = ones(size(fY));
% window(lowLimit:highLimit,1) = 0;
window(11:500,1) = 0;
fY_filtered = fY.*window;

% % Method 2: remove the noise of low amplitude
% ampLimit = 500;
% fY_filtered2 = fix(fY_filtered/ampLimit)*ampLimit;

cy = real(ifft(fY_filtered));

result = zeros(size(data));
result(:,1) = x;
result(:,2) = cy;

% plot
figure
plot(x,y)
% axis([1560 1600 -105 -45]);
% axis([1570 1575 -70 -55]);
hold on;
% figure
plot(x,cy,'r');
% xlabel('Wavelength (nm)')
% ylabel('Power (dBm)')
[~,fileName,~] = fileparts(csvFile);
title(fileName)

% % write to file
% csv_name = strcat(num2str(voltage(i)),'V_f.csv');
% dlmwrite(csv_name,result,'precision',10);

end
    




