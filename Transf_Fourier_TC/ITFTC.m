function [x,t]=ITFTC(w,Xw,tmax,dt)

dw=w(2)-w(1);
t=-tmax:dt:(tmax);


centro = floor(length(t)/2)+1;% para negativos

x=zeros(size(t));
k=1;
for tt=t
x(k)=dw*sum(Xw.*exp(1i*tt*w)/(2*pi));
k=k+1;
end

x(centro)=sum(Xw)*dt;
x=real(x);
