% POT_t -- Calcula la potencia promedio de una señal periódica en el dominio temporal.
%
% Uso:
%   p = POT_t( ft, T0, dt )
%
% * Argumentos *
%    ft: vector de valores de 1 ciclo de la señal.
%    T0: Periódo de la señal.
%    dt: paso temporal.
%
% * Retorna *
%     p: Potencia promedio de la señal periódica.
function [p] = POT_t(ft,T0,dt)

p = (1/T0)*sum(abs(ft).^2)*dt;

end

