function [peakData, peakCnt] = readpeakmat(fullPath)
%READPEAKMAT reads PeakTracking.mat and extract peak tracking data
%   Given file path and name, extract peak tracking data
%   and return it
    
    load(fullPath, 'peaksTrackData');
%     peakData = peaksTrackData{1,1};
    peakCnt = size(peaksTrackData{1,1},2);
    
    for i = 1:peakCnt
        peakData(:,i) = peaksTrackData{1,1}{1,i}';         
    end
    
end

