function [ C, gamma ] = free_space_model( f )
%free_space_model get propagation-dependent constants for free-space
%propagation model. L(r) = (lambda / (4*pi*r))^2  => L(r) = C*r^(-gamma)
%   Input:
%   f, propagation frequency
%   Output:
%   C, gamma, propagation-dependent constants

c = 3e8;
lambda = c / f;
gamma = 2;
C = (lambda / (4 * pi))^2;

end

