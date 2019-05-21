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

%% Zadanie 2
clc;
clear;

dxdt = @(x, y, t) (y);
dydt = @(x, y, t) (-x);

x0 = 0;
y0 = 1;
t0 = 0;
t_max = 10;
h = [0.1; 0.01; 0.001];

% Wynik analityczny
f = @(t) (sin(t));


for i = 1:length(h)
    t = t0:h(i):t_max;
    x = arrayfun(f, t);
    
    wynikiEulera = metodaEuleraDlaUkladow(dxdt, dydt, h(i), x0, y0, t0, t_max);
    wynikiHeuna = metodaHeunaDlaUkladow(dxdt, dydt, h(i), x0, y0, t0, t_max);

    bledyEulera = abs(x - wynikiEulera(1, :));
    maksBladEulera = max(bledyEulera)
    
    bledyHeuna = abs(x - wynikiHeuna(1, :));
    maksBladHeuna = max(bledyHeuna)
end

plot(t, x, '-', 'DisplayName','Wynik analityczny');
hold on;
plot(wynikiEulera(3, :), wynikiEulera(1, :), 'x', 'DisplayName','Rozwiazania metoda Eulera');
plot(wynikiHeuna(3, :), wynikiHeuna(1, :), 'o', 'DisplayName','Rozwiazania metoda Heuna');


%plot(wynikiEulera(3, :), wynikiEulera(2, :), '-', 'DisplayName','Rozwiazania metoda Eulera');
%%
% h_array = [0.1; 0.01; 0.001];
% 
% for h = h_array
%     wynikiEulera = metodaEuleraDlaUkladow(dxdt, dydt, h, x0, y0, t0, t_max);
%     
%     % TODO metoda Heuna
%     % TODO policzy? b?edy
% end
% 
% plot(wynikiEulera(3, :), wynikiEulera(1, :), '-', 'DisplayName','Rozwiazania metoda Eulera');
% hold on;
% plot(wynikiEulera(3, :), wynikiEulera(2, :), '-', 'DisplayName','Rozwiazania metoda Eulera');

% TODO metoda analityczna

%% Zadanie 3
clc;
clear;

dxdt = @(x, y, t) (y);
dydt = @(x, y, t) (-x);

x0 = 0;
y0 = 1;
t0 = 0;
t_max = 10;
h = 0.001;

q = 1;

wyniki = metodaAdamsaBashforthaDlalUkladow(dxdt, dydt, h, x0, y0, t0, t_max, q);

plot(wyniki(3, :), wyniki(1, :))
