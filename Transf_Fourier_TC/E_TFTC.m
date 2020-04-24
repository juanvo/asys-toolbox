function [p]=E_TFTC(Xw, dw)
% psv -- Calcula la energía del espectro Xw de la transformada de Fourier.
%
%        Al ser la identidad de Parseval, también es válida para el espectro
%   de la TFTD. Como dicho espectro es periódico, debe tenerse en cuenta
%   la cantidad de ciclos obtenidos en Xw al llamar a tftd().
%
% Uso:
%      p = E_TFTC(Xw, dw)
%
% * Argumentos *
%      Xw: vector de la transformada.
%      dw: paso frecuencial.
%
% * Retorna *
%       p: energía del espectro.
%
% * Ejemplo básico *
% t = -5 : 0.01 : 5;
% ft = escalon(t+2) - escalon(t-2);
% [Fw, w] = TFTC(t,ft, 2*pi*10, 0.01);
% p = E_TFTC(Fw, 0.01);
%
% subplot(311); plot(t, ft); grid on; axis tight; ylim([0 1.2]);
% xlabel('t [seg]', 'fontsize', 17); ylabel('f(t)', 'fontsize', 17);
%
% subplot(312); plot(w/(2*pi),abs(Fw)); grid on; axis tight;
% xlabel('f [Hz]', 'fontsize', 17); ylabel('| F(w) |', 'fontsize', 17);
%
% subplot(313); stem(p, 'filled'); grid on; axis tight;
% xlabel('Energía', 'fontsize', 17);
% p
p=sum(abs(Xw).^2)*dw/(2*pi);
end