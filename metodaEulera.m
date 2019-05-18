function wyniki = metodaEulera(dfdx, h, x0, y0, koniec)
%METODAEULERA Calkowanie numeryczne metoda Eulera
%   dfdx - funkcja wartosci pochodnej y, h - krok, x0,y0 - warunki
%   poczatkowe, koniec - ostatni punkt dla ktorego zosatnie policzony wynik
%   Pocz?tkiem przedzia?u jest x0
liczbaWynikow = length(x0:h:koniec);
wyniki = zeros(2, liczbaWynikow);

wyniki(:, 1) = [x0; y0];

for i = 2:liczbaWynikow
   xp = wyniki(1, i-1);
   yp = wyniki(2, i-1);
   
   xn = xp + h;
   yn = yp + h*dfdx(xp, yp);
   
   wyniki(:, i) = [xn, yn];
end


end

