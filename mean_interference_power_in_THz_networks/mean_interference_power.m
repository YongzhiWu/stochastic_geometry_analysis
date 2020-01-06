%% J. Kokkoniemi, J. Lehtomaki and M. Juntti, "Stochastic Geometry Analysis for Mean Interference Power and Outage Probability in THz Networks," in IEEE Transactions on Wireless Communications, vol. 16, no. 5, pp. 3017-3028, May 2017.
% Fig.3

clc, clear;

kaf = 10;

ds = [2 3];
dd = [2 3];

p = 1;
Pt = 1;
nodes = (50:250:5000);

% R = 0.1;

for i = 1:4
    s = ds(ceil(i/2));
    d = dd(2-mod(i, 2));
    if mod(s, 2) == 0
        cds = pi^(s/2) / factorial(s/2);
    else
        cds = pi^((s - 1) / 2) * 2^s * factorial((s - 1) / 2);
    end
    if mod(d, 2) == 0
        cdd = pi^(d/2) / factorial(d/2);
    else
        cdd = pi^((d - 1) / 2) * 2^d * factorial((d - 1) / 2);
    end
    if d == 2
        lambda = nodes * (99.5 - 1) / (5000 - 50);
    elseif d == 3
        lambda = nodes * (18.7 - 0.2) / (5000 - 50);
    end
    If{i} = get_mean_interference(Pt, p, lambda, cdd, d, cds, s, kaf);
end

If1_dB = 10 * log10(If{1});
plot(nodes, If1_dB);

hold on;

If2_dB = 10 * log10(If{2});
plot(nodes, If2_dB);

hold on;

If3_dB = 10 * log10(If{3});
plot(nodes, If3_dB);

hold on;

If4_dB = 10 * log10(If{4});
plot(nodes, If4_dB);


