% cuadrada -- Genera señal cuadrada y su vector de tiempo correspondiente.
% ========
%
%		ft = cuadrada( T0, ciclos, dt )
%		ft = cuadrada( T0, ciclos, dt, start )
%
% El usuario especifica el período de la señal, la cantidad de ciclos de ella, y
% el paso temporal a utilizar.
%
% Además, con el 4to argumento (opcional) puede elegirse que la señal comienze en t=0 (default)
% o que comienze en tiempos negativos.
%
% Si la cantidad de ciclos especificada es un número entero, entonces en t=0 siempre se dará el
% comienzo de un nuevo ciclo, sin importar que opción se haya elegido respecto a tiempos positivos
% o negativos.
%
% Si la cantidad de ciclos especificada no es un número entero, entonces ya no necesariamente
% en t=0 comenzará un ciclo.
%
% Argumentos
% ==========
%
%	T0: período deseado de la señal generada.
%
%	ciclos: ciclos deseados de la señal generada.
%
%	dt: paso temporal para el vector de tiempos
%
%	start:
%		'cero' (default): señal y vector de tiempo comienzan en t=0.
%
%		'neg+': señal y tiempo comenzarán en valores negativos.
%		si ciclos es impar, habrá un ciclo más en tiempos positivos.
%
%		'neg-': señal y tiempo comenzarán en valores negativos.
%		si ciclos es impar, habrá un ciclo más en tiempos negativos.
%
% Retorna
% =======
%
%	xt: vector de valores de la señal generada.
%
%	t: vector temporal generado.
%
function [xt, t] = cuadrada(T0,ciclos,dt,start)

if nargin == 3
	start = 'cero';
end

if !strcmp(start,'cero')
	ciclos_der = floor(ciclos/2);
	ciclos_izq = ciclos_der + mod(ciclos,2);
	if start(end)=='+'
		aux = ciclos_izq;
		ciclos_izq = ciclos_der;
		ciclos_der = aux;
	end
	nizq = -ciclos_izq;
	nder = ciclos_der;
	t = -ciclos_izq*T0 : dt : ciclos_der*T0 - dt;
else
	t = 0 : dt : (ciclos*T0) - dt;
	nizq = 0;
	nder = ciclos;
end

xt = 0;
for n = nizq:nder;
	xt = xt + escalon(t-n*T0) - 2*escalon(t-(n+1/2)*T0) + escalon(t-(n+1)*T0);
end

end
