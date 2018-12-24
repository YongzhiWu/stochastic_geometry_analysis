function [ p ] = get_cdf(R, gamma, C, Pt, x)
%get_cdf calculate the CDF of interference from a single node for the
%circularly shaped zone.
%   Input:
%   R, the radius of the zone
%   C, gamma, propagation-dependent constants for the path gain model L(r)=C*r(-gamma)
%   Pt, the emitted power
%   x, input of the CDF function
%   Output:
%   p, the probability that an interference is greater than x

y = x / ( C * Pt);
p = 1 - (R * y.^(1/gamma) + 1).^(-2);

end

