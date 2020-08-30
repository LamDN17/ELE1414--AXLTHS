function [ y,character,sample] = main_funcrion(x,Fs)
clc;
th = 0.0005;
Nband = 500;
Nfilter = 50;
K=5;
sig = x(:,1)';
[sample,y,~] = sample_creater(sig,Fs,th,Nband,Nfilter);
%% detect sample
val =zeros(1,60);
distance = struct('id','value');
distance.id = val;
distance.value = val;
counter =1;
for i=0:9
    for j =1 :6
        name_read = ['sample_',num2str(i),'_',num2str(j),'.xlsx'];
        sample_ref = xlsread(name_read);
        distance.id(counter)= i;
        distance.value(counter)= sum((sample_ref -sample).^2);
        counter = counter +1;
    end
end
for i = 1:59
    for j =i+1 : 60
        if(distance.value(i) > distance.value(j))
            template1 = distance.id(i);
            distance.id(i) = distance.id(j);
            distance.id(j) = template1;
            template2 = distance.value(i);
            distance.value(i) = distance.value(j);
            distance.value(j) = template2;
        end
    end
end 
iden = distance.id(1:K);
% scores = randi(10,1,10);
% scores = scores -1;
% N1 = histc(scores,0:1:9);
% [detect,value] = max(N1);
character = iden(1);
end