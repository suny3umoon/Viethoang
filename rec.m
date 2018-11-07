%audio recording
x=audiorecorder;
disp('start speaking');
recordblocking(x,12);
disp('stop speaking');
y=getaudiodata(x,'double');
sound(y);
filename = 'orig_input.wav';
audiowrite(filename,y,8500);
%creating melody
fs = 44100; 
t = 0 : 1/fs : 5;
f1 = 440; 
f2 = 2 * f1;
f3 = 3 * f1;
f4 = 4 * f1;
A1 = .3; A2 = A1/2; A3 = A1/3; A4 = A1/4;
w = 0; 

y1 = A1 * sin( 2 * pi * f1 * t + w );
y2 = A2 * sin( 2 * pi * f2 * t + w );
y3 = A3 * sin( 2 * pi * f3 * t + w );
y4 = A4 * sin( 2 * pi * f4 * t + w );
y_melody = [y1 y2 y3 y4];
sound( y_melody, 70000, 16 ); 
%mix melody
y=y';
y=imresize(y,[1,882004]);
y_mix=y+y_melody;
filename1 = 'melody.wav';
audiowrite(filename1,y_mix,85000);
%FFT
Y_mix=fft(y_mix);
plot(abs(Y_mix));
%Spectrogram
[y,fs]=audioread('melody.wav');
win=128;
hop=win/2;
nfft=win;
spectrogram(y,win,hop,nfft,fs,'yaxis')

