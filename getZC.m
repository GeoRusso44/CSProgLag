function feats = getZC(signalSet, varargin)
% getZC Compute Zero Crossings (ZC) of signal.
%
%   The input is assumed to be a matrix where the columns are signals. The
%   function also requires a second argument as a numeric scalar specifying
%   the threshold value (DEFAULT = 0.1).
%
%   The output is a vector of ZC values (one value for each signal).

% See Phinyomark 2012 for details.

thresh = 0.1;  %Sets the default
if nargin>1,thresh= varargin{1};end  %Overides the default

crossings = sign(signalSet(1 : (end - 1), :) .* ...
    signalSet(2 : end, :)) < 0;

thresholds = abs(diff(signalSet, 1, 1)) >= thresh;

zc = sum(double(crossings .* thresholds), 1);

feats = zc;

