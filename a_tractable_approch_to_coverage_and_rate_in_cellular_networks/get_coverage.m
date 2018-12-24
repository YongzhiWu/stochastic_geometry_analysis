function [ p ] = get_coverage(T, lambda, alpha, SNR, mu, sigma)
%get_coverage get the coverage in the case that interference is Rayleigh
%Fading.
%   Input:
%   T, SINR Threshold
%   lambda, intensity of PPP
%   alpha, path loss exponent
%   SNR, no noise if SNR = 0 else other constants
%   SNR =  1 / ( mu * sigma)
%   Output:
%   p, coverage

if (alpha == 4)
    k = 1 + sqrt(T).*(pi/2 - atan(1./sqrt(T)));
    p = pi^(3/2) * lambda * exp((lambda * pi * k).^2 ./ (4*T/SNR)) .*  qfunc(lambda * pi * k ./ sqrt(2*T/SNR));
elseif SNR == 0 && alpha > 2
    syms u;
    rho = zeros(1, length(T));
    for i = 1:length(T)
        rho(i) = double(int(T(i)^(2/alpha)/(1+u^(alpha/2)), T(i)^(-2/alpha), inf));
    end
    p = 1 ./ (1 + rho);
else
    syms u;
    rho = zeros(1, length(T));
    p = zeros(1, length(T));
    for i = 1:length(T)
        rho(i) = double(int(T(i)^(2/alpha)/(1+u^(alpha/2)), T(i)^(-2/alpha), inf));
        p(i) = double(int(pi * lambda * exp( -pi * lambda * u * (1+rho(i)) - mu * T(i) * sigma^2 * u^(alpha/2))), 0, inf);
    end
end

end

