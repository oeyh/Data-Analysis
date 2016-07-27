% script to find the neff at 1550nm in a SWG waveguide


p = ['C:\Users\Hai\Dropbox\UT\Bench work\'...
    'Simulation\SWG for sensing\neff vs thickness'];
eigsFile=fullfile(p,'scanProteinThickness_0_eigs.dat');
neffFile=fullfile(p,'scanProteinThickness_0_neff.dat');
period = 0.2;   % um
lambda = 1.55;  % um

neff = findneff(eigsFile, neffFile, period, lambda);