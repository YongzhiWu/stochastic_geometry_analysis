%% Reference: V. Petrov, D. Moltchanov, P. Kustarev, J. M. Jornet and Y. Koucheryavy, "On the Use of Integral Geometry for Interference Modeling and Analysis in Wireless Networks," in IEEE Communications Letters, vol. 20, no. 12, pp. 2530-2533, Dec. 2016.
% Show the CDFs of the interference obtained using equation (15) and
% simulations for 1W of emitted power.(Fig.2a)
clc, clear;
f = [2.4e9 5.1e9];
R = [10 50];
Pt = 1;
x = 10.^(-10:0.5:-4);
for i=1:4
    [C, gamma] = free_space_model(f(ceil(i/2)));
    r = R(2-mod(i, 2));
    p{i} = get_cdf(r, gamma, C, Pt, x);
end

semilogx(x, p{1}, x, p{2}, x, p{3}, x, p{4});
grid on;
xlabel('x');
ylabel('P(I{\leq}x)');
title('CDF of interference from a single node');
legend1 = legend('f=2.4GHz, R=10', 'f=2.4GHz, R=50', 'f=5.1GHz, R=10', 'f=5.1GHz, R=50');
set(legend1,...
    'Position',[0.654761909391908 0.17896825850956 0.228571423941425 0.165476185934884]);