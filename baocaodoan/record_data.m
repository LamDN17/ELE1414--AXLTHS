Fs =44100;
% pause(0.15);
fprintf('\n Microphone is run now')
fprintf('\n Start after 4 seconds')
record = audiorecorder(Fs,16,1);
pause(1);
recordblocking(record,5);
data = getaudiodata(record);
fprintf('\n Finish')
soundsc(data,Fs)
pause(1)
c = 'Input file parameter of file name';
fprintf('\n %s',c);
fprintf('\n x: number, range [0:9]');
fprintf('\n y: id of sample in x, range [1: ....]');
fprintf('\n x:');
x = input('');
fprintf('\n y:');
y = input('');
name =['au_',num2str(x),'_',num2str(y),'.wav'];
audiowrite(name,data,Fs);
fprintf('\n THE END')
clc;