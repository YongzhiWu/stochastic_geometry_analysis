%% Reference: Andrews, Jeffrey & Baccelli, Fran?ois & Krishna Ganti, Radha. (2011). A Tractable Approach to Coverage and Rate in Cellular Networks. Communications, IEEE Transactions on. 59. 3122-3134. 10.1109/TCOMM.2011.100411.100541.
% Fig.4 No noise

clc, clear;
alpha = [2.5 4];
TdB = (-10:0.5:20);
T = 10.^(TdB./10);

p{1} = get_coverage(T, 0.01, alpha(1), 0, 1);
p{2} = get_coverage(T, 0.01, alpha(2), 10, 1);

