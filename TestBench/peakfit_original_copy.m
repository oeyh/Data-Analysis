function peak = peakfit(spectrumData, res, sWidth, fitting, fWidth)
%peakfit takes spectrum data and makes Lorentzian fit
%   spectrumData is a N-by-2 matrix containing wavelength and power data
%   res is estimated resonance position
%   fitting indicates applying fitting(t) or simply finding the minimum(f)
%   sWidth is the half range for searching minimum
%   fWidth is the fitting half range, +/- halfwidth
%   returns peak, wavelength of the minimum point
%   and peakFit, wavelength of the fitted minimum
    
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
    minSearch = res - sWidth;
    maxSearch = res + sWidth;
    searchRange = (lambda > minSearch) & ...
                    (lambda < maxSearch);
    M = spectrumData(searchRange, :);
    [~, I] = min(M(:, 2));
    peak = M(I, 1);

    % Check if local minimum is out of range because of bad data
    if (peak > upLimit) || (peak < lowLimit)
        peak = res;
        disp('peak at edge')
    end
    
    if fitting == true
        % apply Lorentzian fit around the above minimum
        fitRange = (lambda > peak - fWidth) & ...
                        (lambda < peak + fWidth);
        M2 = spectrumData(fitRange, :);
        x = M2(:, 1);
        y = M2(:, 2);
        [~, params , ~, ~] = lorentzfit(x,y);
        peak = params(2); % params(2) is the exact center of the fitting
    end

end

