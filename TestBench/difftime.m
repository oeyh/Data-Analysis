function diffTime = difftime(currT, startT)
%DIFFTIME calculates the time difference in seconds
%   Given the currT and startT in the following format:
%   YYYY.MM.DD@HH.MM.SS
%   calculate the time elapsed in seconds from startT to currT

    % Parse time
%     startYear = startT(1:4);
%     startMon = startT(6:7);
    startDay = str2double(startT(9:10));
    startHour = str2double(startT(12:13));
    startMin = str2double(startT(15:16));
    startSec = str2double(startT(18:19));
    
%     currYear = currT(1:4);
%     currMon = currT(6:7);
    currDay = str2double(currT(9:10));
    currHour = str2double(currT(12:13));
    currMin = str2double(currT(15:16));
    currSec = str2double(currT(18:19));
    
    % Calculate difference
    diffTime = (currDay - startDay) * 24 * 3600 + ...
               (currHour - startHour) * 3600 + ...
               (currMin - startMin) * 60 + ...
               (currSec - startSec);


end

