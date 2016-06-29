function mat2csv(folderPath, num)
%MAT2CSV read scan data and convert to csv files
%   Given folder path and number, read scan data in .mat files, 
%   extract spectrum data
%   and save the spectrum data in csv format with the same name in the same
%   foler

    fileName = strcat('Scan', num2str(num), '.mat');
    fullPath = fullfile(folderPath, fileName);
    
    % import data
    load(fullPath, 'scanResults');
    spectrumData = scanResults.Data;
    
    % export to csv
    csvName = strcat('Scan', num2str(num), '.csv');
    csvPath = fullfile(folderPath, csvName);
    dlmwrite(csvPath, spectrumData, 'precision', 10);


end

