function [ data, num ] = readneff( filePath )
%readneff read a neff.dat file and return the data arrays
%   In the returned data array, the first column is 
%   wave vector ka/2*pi
%   the rest columns are
%   eigen frequencies a/lambda
%   num represents the number of calculated bands

    % data array starts from the second row
    data = dlmread(filePath,'',1,0);
    
    num = size(data,2)-1;

end



