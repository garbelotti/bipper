clc;clear;close all;
%duracao=1; %tempo em segundos (inteiro)

dado = 554563;
Fs = 8192; %frequencia de amostragem
f0 = 1500; %frequencia do bit start
f1 = 3500; %frequencia do bit alto (1) preferivel ser alta pois sempre comeca em 1, e eh bom ter uma diferenca do bit start
f2 = 2500; %frequencia do bit baixo (0)
bitsA = 16; %quantidade de bits por amostragem (Fs/bitsA) == inteiro
tf0 = 1; %tempo de bit start em segundos
minLevel=0.007;
nivelRuido=40;
tamanhoDado=nextpow2(dado)
duracao = tamanhoDado / bitsA ;
vetorDado = msg(dado,f1,f2,bitsA,Fs,duracao);
vetorFull = insereStart(vetorDado,tf0,f0,Fs);
durTotal =  length(vetorFull) / Fs;
audiowrite('teste1.wav',vetorFull,Fs);
disp('de o play no audio man !!!');
pause;
som=iniciaTrigger(duracao + 1,Fs,0.05,nivelRuido);
som2=transformaStart(som,f2-100,Fs);
numLido=separaBits(som2,bitsA,Fs,minLevel,duracao,f1-300);
disp(numLido);
