function feats = getWL(signalSet)
% getWL Compute Waveform Length (WL) of signal.
%
%   The input is assumed to be a matrix where the columns are signals. 
%
%   The output is a vector of WL values (one value for each signal).

wl = sum(abs(diff(signalSet, 1, 1)), 1);
feats = wl;



