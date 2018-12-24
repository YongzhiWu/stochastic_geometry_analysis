%% Reference: V. Petrov, D. Moltchanov, P. Kustarev, J. M. Jornet and Y. Koucheryavy, "On the Use of Integral Geometry for Interference Modeling and Analysis in Wireless Networks," in IEEE Communications Letters, vol. 20, no. 12, pp. 2530-2533, Dec. 2016.
% Show the mean aggregated interference for different number of interferers. (Fig2.b)
% E[I] = -d(L(s))/ds with s = 0

syms s;
R = 30;
N = [1 10 20];
L(s) = R^(-4)*s*exp(-s*R^(-2))*(R^2-2*s)*(cosh(s*R^(-2))-pi*erf(s*R^(-1)+sinh(s*R^(-2))-log(R^(-2))-2*log(R)))+R*(R^3+2*R*s-2*sqrt(pi)*s^(3/2));
NL(s) = (L(s)).^N;
dNL = diff(NL(s));
mean = subs(-dNL, s, 0);