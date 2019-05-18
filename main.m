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

wynikEulera = metodaEulera(dydx, h, 0, 1, 10);
wynikHeuna = metodaHeuna(dydx, h, 0, 1, 10);

% Wynik analityczny
f = @(x) (exp(-x)*cos(2*pi*x));
x = 0:h:10;
y = arrayfun(f, x);

plot(x, y, '-', 'DisplayName','Wynik analityczny');
title("y = e\^(-x)*cos(2*pi*x) oraz wyniki rozwiazan metodami numerycznymi");
xlabel("x");
ylabel("y");
hold on;
grid on;

plot(wynikEulera(1, :), wynikEulera(2, :), 'o', 'DisplayName','Rozwiazania metoda Eulera');
plot(wynikHeuna(1, :), wynikHeuna(2, :), 'x', 'DisplayName','Rozwiazania metoda Heuena');

legend();

bledyEulera = abs(y - wynikEulera(2, :));
maksBladEulera = max(bledyEulera)

bledyHeuna = abs(y - wynikHeuna(2, :));
maksBladHeuna = max(bledyHeuna)

%%
h = 2;
b = 5
0:h:b
length(0:h:b)