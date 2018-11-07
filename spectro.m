[y,fs]=audioread('melody.wav');
win=128;
hop=win/2;
nfft=win;
spectrogram(y,win,hop,nfft,fs,'yaxis')
