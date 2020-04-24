% coeff_a0 -- Calcula los coeficiences 'a0' de la Serie Trigonométrica
%             de Fourier, para una señal periódica.
%
% Uso:
%   a0 = coeff_a0( N, t, ft )
%
% * Argumentos *
%     t: vector de tiempo correspondiente a 1 ciclo de la señal.
%    ft: vector de valores de 1 ciclo de la señal.
%
% * Retorna *
%    a0: coeficientes an
function a0 = coeff_a0(t, F)
  
  T0 = t(end)-t(1);
  
  dt = t(2)-t(1);
  
  a0 =  ( 2 / T0 ) * sum( F ) * dt ;

end