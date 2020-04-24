% POT_SEF -- Calcula la potencia promedio de una señal, en el dominio frecuencial,
%	     aplicando el Teorema de Parseval a los coeficientes de una
%	     Serie Exponencial de Fourier.
%
% Uso:
%   p = POT_SEF( Cn )
%
% * Argumentos *
%    Cn: Coeficientes de la serie exponencial de fourier.
%	 Generalmente, obtenidos por la función SEF.
%
% * Retorna *
%     p: Potencia promedio de la señal periódica.
function [p] = POT_SEF(Cn)

p=sum(abs(Cn).^2);

end

