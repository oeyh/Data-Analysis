function [spectrumData,time] = readmat(fullPath)
%READMAT reads ScanX.mat and extract spectrum data
%   Given file path and name, extract spectrum data
%   and return it
    
    load(fullPath, 'scanResults', 'timeStamp');
    spectrumData = scanResults.Data;
    time = timeStamp;
end

