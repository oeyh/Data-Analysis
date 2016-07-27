function [ neff ] = findneff(eigsFile, neffFile, period, lambda)
%findneff find the neff at given wavelength
%   Inputs:
%   eigsFile: full path and filename of eigs file
%   neffFile: full path and filename of neff file
%   lambda: given wavelength
%   period: period, ie, lattice constant, period and lambda are in same
%   unit
%   Output:
%   neff: effective index at lambda
   
    fnorm = period / lambda;   % normalized freq

    [eigs,~] = readeigs(eigsFile);
    [neffdata,~] = readneff(neffFile);
    
    % use interpolation to find k
    k = eigs(:,1);
    f = eigs(:,2);
    kq = interp1(f,k,fnorm,'spline');   % find k corresponding to lambda
    
    % use the above k to find neff
    neffs = neffdata(:,2);
    neff = interp1(k,neffs,kq,'spline');
    
    


end

