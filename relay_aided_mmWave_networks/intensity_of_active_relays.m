%% Relay Aided mmWave Networks
% Fig.3

rd = 200;
lambda_s = 0.001;
pL = 0.12; pN = 1 - pL;
Gmax_dB = 18; Gmax = 10.^(Gmax_dB / 10);
alphaL = 2; alphaN = 4;
P = 1;
rSD = 35;
B = 2e9;
N0 = 10^(-17.4) * B * 10;
gammaR = 10^( 5 / 10 );

ps = rd^2 / 4 * (( pL * ( - exp(2*(alphaL*muc+sigmac^2) / alphaL^2) * (gammaR * rd^alphaL / (P * Gmax^2))^(-2/alphaL) * erf( (alphaL * muc - alpha * log(gammaR * rd^alphaL / (P * Gmax^2) ) + 2*sigmac^2 ) / (sqrt(2) * alphaL * sigmac) ) + erf( (muc - log(gammaR * rd^alphaL / (P * Gmax^2) )) / (sqrt(2) * sigmac ) ) ) + ( pN * ( - exp(2*(alphaN*muc+sigmac^2) / alphaN^2) * (gammaR * rd^alphaN / (P * Gmax^2))^(-2/alphaN) * erf( (alphaN * muc - alpha * log(gammaR * rd^alphaN / (P * Gmax^2) ) + 2*sigmac^2 ) / (sqrt(2) * alphaN * sigmac) ) + erf( (muc - log(gammaR * rd^alphaN / (P * Gmax^2) )) / (sqrt(2) * sigmac ) ) ))));

pR = ( 1 - exp(- N * ps)) / (N * Ps);

lambda_Ra = lambdaR * pR;