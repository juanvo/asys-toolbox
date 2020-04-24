% E_t -- Calcula la energía de una señal aperiódica en el dominio temporal.
%
% Uso:
%   p = E_t( ft, dt)
%
% * Argumentos *
%    ft: señal aperíodica
%    dt: paso temporal.
%
% * Retorna *
%     e: Energía de la señal periódica.
function [e] = E_t(ft, dt)

e = sum(abs(ft).^2)*dt;

end

