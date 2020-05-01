% E_TFTC_INT -- Calcula los índices del vector 'Fw' para los cuales
%     se verifica que energéticamente se obtiene el intervalo más
%     cercano a un porcenje determinado.
%
%   La función busca el intervalo que genera el contenido energético con menor
% error con respecto al porcentaje requerido.
%
%   Por lo tanto, nótese que este resultado puede estar tanto por arriba como por
% debajo del porcentaje requerido.
%
% * Uso: *
%  
% [interval_percent, interval_idx] = E_TFTC_INT( Fw, dw, energy_t, percent )
%
% * Argumentos *
%
%         Fw: vector de valores de la función transformada al dominio frecuencial.
%
%         dw: paso frecuencial con el cual se obtuvo el vector Fw (al usar TFTC()).
%
%   energy_t: Energía total de la señal. Generalmente, el resultado de calcular
%             la energía en el dominio temporal.
%
%    percent: Porcentaje energético requerido.
%
% * Retorna *
%                 
%   interval_percent: El porcentaje energético obtenido para el intervalo determinado por
%                     interval_idx.
%
%       interval_idx: Vector de 2 elementos que contiene los índice mínimo y máximo
%                     que sobre el vector 'Fw' especifican el intervalo que genera
%                     el requerido porcentaje energético.
%
% * Ejemplo Básico *
%
%    dt = 0.01; t = -5 : dt : 5;
%    ft = rampa(t) - rampa(t-1) - escalon(t-1);
%    energy_t = sum( abs(ft).^2 ) * dt;
%    dw = 0.01; WMAX = 2*pi*10;
%    [Fw, w]= TFTC(t, ft, WMAX, dw);
%    [percent, idx] = E_TFTC_INT(Fw, dw, energy_t, 95);
%    interv_freq = w(idx(1):idx(2))/(2*pi);
%    interv_Fw = Fw(idx(1):idx(2));
%    
%    subplot(311); plot(t, ft); grid on; axis tight; ylim([0 1.2]);
%    xlabel('t [s]', 'fontsize', 15); ylabel('f(t)', 'fontsize', 15);
%
%    subplot(312); plot(w/(2*pi),abs(Fw)); grid on; axis tight;
%    xlabel('f [Hz]', 'fontsize', 15); ylabel('|F(w)|', 'fontsize', 15);
%
%    subplot(313); plot(interv_freq,abs(interv_Fw)); grid on;
%    xlabel('f [Hz]', 'fontsize', 15); ylabel('|F(w)|', 'fontsize', 15);
%    xlim([w(1)/(2*pi), w(end)/(2*pi)]); ylim([0, max(abs(Fw))]);
%
function [interval_percent, interval_idx] = E_TFTC_INT(Fw, dw, energy_t, percent)
  
  idx_middle = ceil( length(Fw)/2 );
  idx = 0;
  obtained_percent_highBound = 0;
  while( idx_middle + idx <  length(Fw))
    energ = E_TFTC(Fw(idx_middle-idx: idx_middle+idx),dw);
    obtained_percent = 100*(energ/energy_t);
    if(obtained_percent >= percent)
      obtained_percent_highBound = obtained_percent;
      break
    end
    obtained_percent_lowBound = obtained_percent ;
    idx = idx+1;
  end
  
  % Caso: sin "armónicas" ya cumplí la meta porcentual
  if( idx == 0 )
    interval_percent = obtained_percent_highBound;
  else
    % chequeo cuál tiene menor error
    percent_errors = [abs(percent - obtained_percent_lowBound),...
                        abs(percent - obtained_percent_highBound)];
    min_error_percent = min(percent_errors);
    
    if( min_error_percent == percent_errors(1) )
      idx = idx - 1;
      interval_percent = obtained_percent_lowBound;
    else
      interval_percent = obtained_percent_highBound;
    end
  end
  
  interval_idx = [idx_middle-idx, idx_middle+idx];  
end
