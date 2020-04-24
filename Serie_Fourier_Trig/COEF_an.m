% coeff_an -- Calcula los coeficiences 'an' de la Serie Trigonométrica
%             de Fourier, para una señal periódica.
%
% Uso:
%   an = coeff_an( N, t, ft )
%
% * Argumentos *
%     N: cantidad de coeficientes a calcular.
%     t: vector de tiempo correspondiente a 1 ciclo de la señal.
%    ft: vector de valores de 1 ciclo de la señal.
%
% * Retorna *
%    an: coeficientes an
function an = coeff_an(N, t, F)
  
  T0 = t(end)-t(1);
  dt = t(2) - t(1);
  
  w0 = 2*pi/T0;
  
  for i=1:N
    an(i) =  ( 2 / T0 ) * sum( F .* cos(i*w0.*t) ) * dt;
  end
 
end