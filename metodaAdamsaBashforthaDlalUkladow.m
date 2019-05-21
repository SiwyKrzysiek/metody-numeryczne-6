function wyniki = metodaAdamsaBashforthaDlalUkladow(dxdt, dydt, h, x0, y0, t0, koniec, q)
%METODAADAMSABASHFORTHADLALUKLADOW Calkowanie numeryczne metoda
%Adamsa-Bashfortah
%   dfdx - funkcja wartosci pochodnej y, h - krok, x0,y0 - warunki
%   poczatkowe, koniec - ostatni punkt dla ktorego zosatnie policzony wynik
%   q - rzad metody
%   Poczatkiem przedzialu jest x0
if q < 0 || q > 4
    wyniki = NaN;
    return;
end

wspolczynniki = zeros(5, 5);
wspolczynniki(1, :) = [1 0 0 0 0];
wspolczynniki(2, :) = [3 -1 0 0 0] / 2;
wspolczynniki(3, :) = [23 -16 5 0 0] / 12;
wspolczynniki(4, :) = [55 -59 37 -9 0] / 24;
wspolczynniki(5, :) = [1901 -2774 2616 -1274 251] / 720;

liczbaWynikow = length(t0:h:koniec);
wyniki = zeros(3, liczbaWynikow);

koniecEulera = t0 + h * q;
punktyStartowe = metodaEuleraDlaUkladow(dxdt, dydt, h, x0, y0, t0, koniecEulera);

wyniki(:, 1:q+1) = punktyStartowe;

for i = q+2:liczbaWynikow
    p = i-1;
    
    xn = 0;
    for j = 0:q
       xn = xn + wspolczynniki(q+1, j+1) * dxdt(wyniki(1, p-j), wyniki(2, p-j), wyniki(3, p-j));
    end
    xn = xn * h + wyniki(1, p);
    
    yn = 0;
    for j = 0:q
       yn = yn + wspolczynniki(q+1, j+1) * dydt(wyniki(1, p-j), wyniki(2, p-j), wyniki(3, p-j));
    end
    yn = yn * h + wyniki(2, p);
    
    tn = wyniki(3, p) + h;
    
    wyniki(:, i) = [xn, yn, tn];
end
end