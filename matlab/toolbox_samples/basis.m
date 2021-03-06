%% Weyl-Heisenberg Bases Toolbox
% Script "basis.m"
%% Description:
% Implements the construction of bases: Gabor and Weyl-Heisenberg, and also 
% plots graphs of the frequency response and the impulse response.
%
%% Notation:
% As a matrix of the Weyl-Heisenberg optimal basis can also be used one 
% of various other products methods of orthogonalization (eigenvalue 
% decomposition, Gram-Schmidt process, fast algorithm).
% 
% Rectangular complex matrices: "gabor", "weylhz", "weylhzf", "weylhzg".
% Square real matrices: "gaborr", "weylhzr".
% Square complex matrices: "gaborc", "weylhzc".
%
%% Input
M     = input('Number of frequency shifts M = ');
L     = input('Number of time shifts L = ');
a     = input('Alfa-parameter = ');
sigma = input('Standard deviation = ');

%% Bases construction
% Construction of the Gabor basis:
G = gabor(M, L, a, sigma); % Gabor matrix

% Construction of the Weyl-Heisenberg basis:
W = weylhzf(M, L, a, sigma); % W-H matrix

%% Plotting
figure(1);
set(0,'DefaultTextFontSize',11,'DefaultTextFontName','Times New Roman'); 
set(0,'DefaultAxesFontSize',11,'DefaultAxesFontName','Times New Roman'); 

% Time domain
TP0 = abs(G);
TP1 = abs(W);
subplot(2,1,1);
hold on;
plot(TP0(:,1),'k--','linewidth',2);
plot(TP1(:,1),'r-','linewidth',2);
grid on;
title('Time domain');
ylabel('Amplitude');
xlabel('Samples, n');
legend('Gabor basis', ' WH-basis');
hold off;

% Frequency domain
SP0 = abs(fft(G));
SP1 = abs(fft(W));
subplot(2,1,2);
hold on;
plot(SP0(:,fix(M/2)+1),'k--','linewidth',2);
plot(SP1(:,fix(M/2)+1),'r-','linewidth',2);
legend('Gabor basis', ' WH-basis');
grid on;
title('Frequency domain');
ylabel('Amplitude');
xlabel('Samples, n');
hold off;