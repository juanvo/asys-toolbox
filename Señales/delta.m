%---------------------------------------------------------------
%Funcion: delta.m
%Acción: Genera la función impulso: d(x)= 1/dx si x=0, 0 si x<>0
%Entrada: x-> vector temporal (t) o discreto (d)
%Salida: d-> vector temporal d(t) o discreto d(n)
%---------------------------------------------------------------
function d=delta(x)
if(length(x)==1)
  %Condición para un sólo dato (no puede calcular dx)
  d=(x==0);
else
  %Condicón para vector de datos  
  dx=abs(x(2)-x(1));
  d=(1/dx).*(x<dx).*(x>-dx);
end