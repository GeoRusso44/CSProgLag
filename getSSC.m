function feats = getSSC(signalSet, varargin)
% getSSC Computes Slope Sign Changes (SSC) of signal.
%
%   The input is assumed to be a matrix where the columns are signals. The
%   function also requires a second argument as a numeric scalar specifying
%   the threshold value (DEFAULT = 0.1).
%
%   The output is a vector of SSC values (one value for each signal).

% See Phinyomark 2012 for details.

thresh = 0.1;  %Sets the default
if nargin>1,thresh= varargin{1};end  %Overides the default

forwardSlope = diff(signalSet(2 : end, :), 1, 1);
backwardSlope = diff(signalSet(1 : (end - 1), :), 1, 1);

slopeChanges = sign(forwardSlope .* backwardSlope) < 0;

thresholds = (abs(backwardSlope) >= thresh) |  ...
    (abs(forwardSlope) >= thresh);

ssc = sum(double(slopeChanges .* thresholds), 1);

feats = ssc;

