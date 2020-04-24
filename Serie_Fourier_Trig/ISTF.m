% inversa_fourier -- Calcula la Serie de Fourier de la señal periódica 'ft'.
%
% Uso:
%   serie = inversa_fourier( N, t, a0, an, bn, T0 )
%
% * Argumentos *
%     N: cantidad de coeficientes a calcular.
%     t: vector de tiempos correspondiente al tiempo que querramos
%        reconstruír de la señal.
%    a0, an, bn:  coeficientes obtenidos de las funciones:
%                'coeff_a0', 'coeff_an', 'coeff_bn'
%    T0: período de la señal original.
%
% * Retorna *
%    serie: vector de valores de la Serie Trigonométrica de Fourier
function serie = inversa_fourier( N, t, a0, an, bn, T0)
  
%  T0 = t(end)-t(1);
  
  w0 = 2*pi/T0;
  
  serie = zeros( size(t) );

  for i=1:N
    serie = serie + an(i) .* cos(i*w0*t) + bn(i) .* sin(i*w0*t);
  end

  serie = serie + a0/2;

end
