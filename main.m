%% Przykladowe zadanie 1
% Dana funkcja
% y' + y = -2*pi*e^(-x)*sin(2*pi*x)
% y' = -2*pi*e^(-x)*sin(2*pi*x) - y
% Warunki poczatkowe
% x0 = 0, y0 = y(x0) = 1
% Dodatkowe dane
% Policzy? w przedziale <0, 10>
% h = 0,001
% Wynik analityczny = y(x)=e^(-x)*cos(2*pi*x)
clc;
clear;

dydx = @(x, y) (-2*pi*exp(-x)*sin(2*pi*x) - y);
h = 0.001;

w = metodaEulera(dydx, h, 0, 1, 10)

plot(w(1, :), w(2, :))

%%
h = 2;
b = 5
0:h:b
length(0:h:b)