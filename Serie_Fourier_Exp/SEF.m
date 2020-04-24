% SEF -- Calcula los coeficientes Cn y C0 de la Serie Exponencial de Fourier,
%	 para una señal periódica.
%
% El valor medio C0 se encuentra en el elemento C(N).
%
% Uso:
%   Cn = SEF( t, ft, T0, N )
%
% * Argumentos *
%     t: vector de tiempo correspondiente a 1 ciclo de la señal.
%    ft: vector de valores de 1 ciclo de la señal.
%    T0: Periódo de la señal.
%     N: Cantidad (Armónicas + Fundamental) a calcular.
%
% * Retorna *
%    Cn: Coeficientes de la serie exponencial de fourier.
%
function [Cn]=SEF(t,ft,T0,N)
w0=2*pi/T0;
dt=t(2)-t(1);
Cn=zeros(1,2*N-1);
for n=-(N-1):(N-1)
Cn(n+N)=(1/T0)*sum(ft.*exp(-1i*w0*n*t))*dt;
end
Cn(N)=(1/T0)*sum(ft)*dt;