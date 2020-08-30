th = 0.0005;
Nband = 500;
Nfilter = 50;
for i = 0:9
    for j = 1:6
         name_read =['au_',num2str(i),'_',num2str(j),'.wav'];
         [x,Fs] = audioread(name_read);
         sig = (x(:,1))';
         [sample,~,~] = sample_creater(sig,Fs,th,Nband,Nfilter);
         name_write = ['sample_',num2str(i),'_',num2str(j),'.xlsx'];
         xlswrite(name_write,sample);
    end
end