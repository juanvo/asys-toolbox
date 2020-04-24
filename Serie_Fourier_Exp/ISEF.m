% ISEF -- Reconstruye una señal en el dominio temporal a partir de los
%	  coeficientes Cn de su Serie Exponencial de Fourier.
%
% Uso:
%   ft = ISEF( t, Cn, T0 )
%
% * Argumentos *
%     t: vector de tiempo correspondiente a 1 ciclo de la señal.
%    Cn: Coeficientes de la serie exponencial de fourier. Generalmente,
%	 obtenidos por la función SEF.
%    T0: Periódo de la señal.
%
% * Retorna *
%    ft: vector de valores de la señal reconstruída en el dominio temporal.
function [ft]=ISEF(t,Cn,T0)
w0=2*pi/T0;
N=floor(length(Cn)/2)+1;
ft=zeros(size(t));
for n=-(N-1):(N-1)
ft=ft+Cn(n+N).*exp(1i*w0*n*t);
end
ft=real(ft);