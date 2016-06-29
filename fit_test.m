% Test the Lorentzian fit function

clear all

% import original spectrum data
raw_data=importdata('Test_data.txt');

% Major parameters
resonance_est = 1561;       % rough resonance position
lambda_initial = 1555;      % start wavelength of the raw data
lambda_interval = 0.005;    % spectrum resolution
search_range = 2;           % plus/minus range for searching minimum

% find minimum value in specific range 
range_start = (resonance_est-search_range-lambda_initial)/lambda_interval;
range_end = (resonance_est+search_range-lambda_initial)/lambda_interval;
range_start = round(range_start);
range_end = round(range_end);
M = raw_data(range_start:range_end, :);
[C, I] = min(M(:, 2));
lambda_min = M(I, 1);

% apply Lorentzian fit around the minimum above
fit_range = 0.20;
range_start = (lambda_min-fit_range-lambda_initial)/lambda_interval;
range_end = (lambda_min+fit_range-lambda_initial)/lambda_interval;
range_start = round(range_start);
range_end = round(range_end);
M2 = raw_data(range_start:range_end, :);
x = M2(:, 1);
y = M2(:, 2);
[yprime params resnorm residual] = lorentzfit(x,y);

center = params(2);
figure;
plot(x,y,'b.','LineWidth',2)
hold on 
plot(x,yprime,'r-','LineWidth',2)
error = center - lambda_min;
