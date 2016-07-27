function peak = peakfit2(spectrumData, res, sWidth, fitting, fWidth)
%peakfit2 takes spectrum data and makes Lorentzian fit and find peaks
%   spectrumData is a N-by-2 matrix containing wavelength and power data
%   res is an array of estimated resonance position
%   fitting indicates applying fitting(t) or simply finding the minimum(f)
%   sWidth is the half range for searching minimum
%   fWidth is the fitting half range, +/- halfwidth
%   returns peak, an array of wavelength of the minimum point
    
    if nargin < 5
        fWidth = 0;
    end
    
    % read start and stop wavelength
    % set lower and upper limit
    lambdaInitial = spectrumData(1, 1);
    lambdaEnd = spectrumData(end, 1);
    lowLimit = lambdaInitial + fWidth + 0.1;
    upLimit = lambdaEnd - fWidth - 0.1;
    
    % find local minimum
    lambda = spectrumData(:,1);
    minSearch = res - sWidth;   % array
    maxSearch = res + sWidth;   % array
    n = length(res);
    peak = zeros(1,n);
    for i = 1:n
        searchRange = (lambda > minSearch(i)) & ...
                        (lambda < maxSearch(i));
        M = spectrumData(searchRange, :);
        [~, I] = min(M(:, 2));
        peak(i) = M(I, 1);

        % Check if local minimum is out of range because of bad data
        if (peak(i) > upLimit) || (peak(i) < lowLimit)
            peak(i) = res(i);
            disp('peak at edge')
        end

        if fitting == true
            % apply Lorentzian fit around the above minimum
            fitRange = (lambda > peak(i) - fWidth) & ...
                            (lambda < peak(i) + fWidth);
            M2 = spectrumData(fitRange, :);
            x = M2(:, 1);
            y = M2(:, 2);
            [~, params , ~, ~] = lorentzfit(x,y);
            peak(i) = params(2); % params(2) is the exact center of the fitting
        end
    end
end

