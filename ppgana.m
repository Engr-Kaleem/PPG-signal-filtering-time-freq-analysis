close all;
clear all
%% loading data  fs =1000
%%
ppg=load('10_2.txt');
fs=1000;
t=0:1/fs:(length(ppg)/fs);

%% PPG  filtering  1 20 hz 
%%

[A,B,C,D] = cheby2(5,20,[1 20]/500);

[filter_SOS,g] = ss2sos(A,B,C,D);

x = filtfilt(filter_SOS,g,ppg);


%% for time  anaylsis
%%

plot(t(1:length(ppg)),x)
hold on
plot(t(1:length(ppg)),ppg)
title(' raw signal(upper) vs filtered signal (lower)')
xlabel('time)')
figure;
%% for frequencey anaylsis FFT of  PPG signal 
%%
Fs=fs;
L=length(ppg);
NFFT = 2^nextpow2(L);% Next power of 2 from length of y
Y = fft(ppg,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
% Plot single-sided amplitude spectrum.
plot(f,2*abs(Y(1:NFFT/2+1))),grid on
title('Single-Sided Amplitude Spectrum of raw signal')
xlabel('Frequency (Hz)')
figure;


Fs=fs;
L=length(x);
NFFT = 2^nextpow2(L);% Next power of 2 from length of y
Y = fft(x,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
% Plot single-sided amplitude spectrum.

plot(f,2*abs(Y(1:NFFT/2+1))),grid on
title('Single-Sided Amplitude Spectrum of filtered signal')
xlabel('Frequency (Hz)')

%% for time vs frequencey spectrogram
%%
figure;
spectrogram(ppg,800,600,1000,Fs,'yaxis');
view(-70,30);
shading interp;

figure;
spectrogram(x,800,600,1000,Fs,'yaxis');
view(-70,30);
shading interp;

%% lets do same  for differnt ppg signal
%%
%% loading data  fs =1000
%%
ppg=load('11_2.txt');
fs=1000;
t=0:1/fs:(length(ppg)/fs);

%% PPG  filtering  1 20 hz 
%%

[A,B,C,D] = cheby2(5,20,[1 20]/500);

[filter_SOS,g] = ss2sos(A,B,C,D);

x = filtfilt(filter_SOS,g,ppg);


%% for time  anaylsis
%%

plot(t(1:length(ppg)),x);
hold on;
plot(t(1:length(ppg)),ppg);
title(' raw signal(upper) vs filtered signal (lower)')
xlabel('time)');
figure;
%% for frequencey anaylsis FFT of  PPG signal 
%%
Fs=fs;
L=length(ppg);
NFFT = 2^nextpow2(L);% Next power of 2 from length of y
Y = fft(ppg,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
% Plot single-sided amplitude spectrum.
plot(f,2*abs(Y(1:NFFT/2+1))),grid on
title('Single-Sided Amplitude Spectrum of raw signal')
xlabel('Frequency (Hz)')
figure;


Fs=fs;
L=length(x);
NFFT = 2^nextpow2(L);% Next power of 2 from length of y
Y = fft(x,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
% Plot single-sided amplitude spectrum.

plot(f,2*abs(Y(1:NFFT/2+1))),grid on
title('Single-Sided Amplitude Spectrum of filtered signal')
xlabel('Frequency (Hz)')

%% for time vs frequencey spectrogram
%%
figure;
spectrogram(ppg,800,600,1000,Fs,'yaxis');
view(-70,30);
shading interp;

figure;
spectrogram(x,800,600,1000,Fs,'yaxis');
view(-70,30);
shading interp;

