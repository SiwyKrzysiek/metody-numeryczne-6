function wyniki = metodaHeunaDlaUkladow(dxdt, dydt, h, x0, y0, t0, koniec)
%METODAHEUNA Calkowanie numeryczne metoda Heuna
%   dfdx - funkcja wartosci pochodnej y, h - krok, x0,y0 - warunki
%   poczatkowe, koniec - ostatni punkt dla ktorego zosatnie policzony wynik
%   Pocz?tkiem przedzia?u jest x0
liczbaWynikow = length(t0:h:koniec);
wyniki = zeros(3, liczbaWynikow);

wyniki(:, 1) = [x0; y0; t0];

for i = 2:liczbaWynikow
   xp = wyniki(1, i-1);
   yp = wyniki(2, i-1);
   tp = wyniki(3, i-1);
   
   fi_x = (dxdt(xp, yp, tp) + dxdt(xp+h, yp+h*dxdt(xp, yp, tp)))/2;
   fi_y = (dydt(xp, yp, tp) + dydt(xp+h, yp+h*dydt(xp, yp, tp)))/2;
   xn = xp + h*fi_x;
   yn = yp + h*fi_y;
   tn = tp + h;
   
   wyniki(:, i) = [xn; yn; tn];
end


end

