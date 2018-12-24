function [ p ] = compute_coverage(T, lambda, beta, sigma, CL, CN, alphaL, alphaN, NL, NN, Mt, mt, thetat, Mr, mr, thetar)
%compute_coverage compute the coverage in general cases


syms x;
syms r;
pr = exp(- beta * r); px = exp(- beta * x); % LOS probability function

BL = 1 - exp(-2 * pi * lambda * int(r*pr, r, 0, inf));
BN = 1 - exp(-2 * pi * lambda * int(r*(1-pr), r, 0, inf));

fLx = 2 * pi * lambda * x * px * exp(-2*pi*lambda*int(r*pr, r, 0, x)) / BL;
fNx = 2 * pi * lambda * x * (1 - px) * exp(-2*pi*lambda*int(r*(1-pr), r, 0, x)) /  BN;

psiLx = ( CN / CL )^(1 / alphaN) * x^(alphaL / alphaN); 
psiNx = ( CL / CN )^(1 / alphaL) * x^(alphaN / alphaL);

AL = BL * int(exp(-2 * pi * lambda * int((1 - pr)*r, r, 0, psiLx)) * fLx, x, 0, inf);
AN = 1 - AL;

ffLx = BL * fLx * exp(-2 * pi * lambda * int((1-pr)*r, r, 0, psiLx)) / AL;
ffNx = BN * fNx * exp(-2 * pi * lambda * int(pr*r, r, 0, psiNx)) / AN;

a = [Mr*Mt, Mr*mt, mr*Mt, mr*mt];
cr = thetar / (2*pi);
ct = thetat / (2*pi);
b = [cr*ct, cr*(1-ct), (1-cr)*ct, (1-cr)*(1-ct)];

syms n;
syms k;
Qnx = 2*pi*lambda*symsum(b(k) * int((1 - 1/(1 + n * (NL * (factorial(NL))^(-1/NL)) * (a(k)/(Mt*Mr)) * T * x^alphaL / (NL * r^alphaL))^NL) * pr * r, r, x, inf), k, 1, 4);
Vnx = 2*pi*lambda*symsum(b(k) * int((1 - 1/(1 + n * CN * (NL * (factorial(NL))^(-1/NL)) * (a(k)/(Mt*Mr)) * T * x^alphaL / (CL * NN * r^alphaN))^NN) * (1 - pr) * r, r, psiLx, inf), k, 1, 4);
Wnx = 2*pi*lambda*symsum(b(k) * int((1 - 1/(1 + n * CL * (NN * (factorial(NN))^(-1/NN)) * (a(k)/(Mt*Mr)) * T * x^alphaN / (CN * NL * r^alphaL))^NL) * pr * r, r, psiNx, inf), k, 1, 4);
Znx = 2*pi*lambda*symsum(b(k) * int((1 - 1/(1 + n * (NN * (factorial(NN))^(-1/NN)) * (a(k)/(Mt*Mr)) * T * x^alphaN / (NN * r^alphaN))^NN) * (1 - pr) * r, r, x, inf), k, 1, 4);

PcLT = symsum((-1)^n+1 * nchoosek(NL, n) * int(exp(- n * (NL * (factorial(NL))^(-1/NL)) * x^alphaL * T * sigma^2 / (CL * Mr * Mt) - Qnx - Vnx) * ffLx, x, 0, inf), n, 1, NL);
PcNT = symsum((-1)^n+1 * nchoosek(NN, n) * int(exp(- n * (NN * (factorial(NN))^(-1/NN)) * x^alphaN * T * sigma^2 / (CN * Mr * Mt) - Wnx - Znx) * ffNx, x, 0, inf), n, 1, NN);

p = AL * PcLT + AN * PcNT;

end

