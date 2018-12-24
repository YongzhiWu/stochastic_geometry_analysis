%% General Network Simulations
% Fig.3
clc, clear;
alphaL = 2;
alphaN = 4;
NL = 3;
NN = 2;
beta = 1 / 141.4;
Mt_dB = [10 20 10]; mt_dB = [-10 -10 -10]; thetat = [pi/6 pi/6 pi/4];
Mt = 10.^(Mt_dB / 10); mt = 10.^(mt_dB / 10);
Mr_dB = 10; mr_dB = -10; thetar = pi/2;
Mr = 10.^(Mr_dB / 10); mr = 10.^( mr_dB / 10);
lambda = 1/100;
c = 3e8;
f = 28e9;
CL = ((c/f) / (4 * pi))^2;
CN = ((c/f) / (4 * pi))^4;
T_dB = 10;
T = 10.^(T_dB / 10);
sigma = 1;

p = compute_coverage(T, lambda, beta, sigma, CL, CN, alphaL, alphaN, NL, NN, Mt(1), mt(1), thetat(1), Mr, mr, thetar);