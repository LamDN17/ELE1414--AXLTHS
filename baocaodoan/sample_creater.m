function [ sample,y2,div_E ] = sample_creater( x,Fs,th,Nband,Nfilter )
x = x*1/max(abs(x));
fpass = 16/Fs*2;
fstop = 500/Fs*2;
h = fir1(Nfilter-1,[fpass fstop],rectwin(Nfilter));
y = filter(h,1,x);
E = y.^2;
v=1;
u=1;
for i = 1: length(E)
    if (E(i)> th)
        u =i;
        break;
    else
        u=1;
    end;
end
for i = length(E):-1: 1
    if (E(i)> th)
        v =i;
        break;
    else
        v=1;
    end;
end
y2= y(u:v);
%phan bang tin hieu va tinh nang luong
N2 = Nfilter;
for i=1:Nband
    pass = ((i-1)*(3400-16)/Nband+16);
    stop = (pass+(3400-16)/Nband);
    h1 = fir1(Nfilter-1,[pass/Fs*2 stop/Fs*2],rectwin(Nfilter));
    tmp =filter(h1,1,y2);
    clc;
    div_E(i)= sum(tmp.^2);
end
sample =  div_E;
end