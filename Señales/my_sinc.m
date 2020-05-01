% my_sinc -- Devuelve función sinc con frecuencia angular requerida.
%
%   Notar que en el límite t -> 0 resulta f(t) = 1.
%
% * Uso: *
%  
%             ft = my_sinc( t, w )
%
% * Argumentos *
%
%         t: vector de valores del dominio temporal.
%
%         w: frecuencia angular requerida para la sinc.
%
% * Retorna *
%
%        ft: vector de valores de la función sinc requerida
%
function ft = my_sinc(t, w)
  ft = sin(w*t)./(w*t);
  inx_nan = find(isnan(ft));
  ft(inx_nan) = 1;
end
