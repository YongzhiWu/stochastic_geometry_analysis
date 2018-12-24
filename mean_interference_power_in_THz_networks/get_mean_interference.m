function [ I ] = get_mean_interference( Pt, p, lambda, cdd, dd, cds, ds, kaf, R )
%get_mean_interference return the mean of interference power in THz
%networks
%   Input:
%   Pt, transmit power
%   p, all nodes transmit randomly with a probability p
%   lambda, the density of the network
%   cdd, dd, for the node drop space
%   cds, ds, for the propagation space
%   kaf, absorption, coefficient

syms r;
I = Pt * p * lambda * cdd * dd / (cds * ds)^2 * double(int( r^(dd - 2 * ds + 1) * exp(- 2 * kaf * r) , r, 0, inf));

end

