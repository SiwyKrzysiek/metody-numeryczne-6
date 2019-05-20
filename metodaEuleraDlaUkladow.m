function wyniki = metodaEuleraDlaUkladow(dxdt, dydt, h, x0, y0, t0, koniec)
%METODAEULERA Calkowanie numeryczne metoda Eulera
%   dfdx - funkcja wartosci pochodnej y, h - krok, x0,y0 - warunki
%   poczatkowe, koniec - ostatni punkt dla ktorego zosatnie policzony wynik
%   Pocz?tkiem przedzia?u jest x0
liczbaWynikow = length(t0:h:koniec);
wyniki = zeros(3, liczbaWynikow);

wyniki(:, 1) = [x0, y0, t0];

for i = 2:liczbaWynikow
   xp = wyniki(1, i-1);
   yp = wyniki(2, i-1);
   tp = wyniki(3, i-1);
   
   xn = xp + h*dxdt(xp, yp, tp);
   yn = yp + h*dydt(xp, yp, tp);
   tn = tp + h;
   
   %wyniki(1, i) = xn;
   %wyniki(2, i) = yn;
   %wyniki(3, i) = tn;
   wyniki(:, i) = [xn, yn, tn];
end


end

