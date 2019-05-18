function wyniki = metodaHeuna(dfdx, h, x0, y0, koniec)
%METODAHEUNA Calkowanie numeryczne metoda Heuna
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
   
   fi = (dfdx(xp, yp) + dfdx(xp+h, yp+h*dfdx(xp, yp)))/2;
   yn = yp + h*fi;
   
   wyniki(:, i) = [xn, yn];
end


end

