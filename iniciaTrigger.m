function inicioEspera = iniciaTrigger(tempoG, Fs, tempoEspera, nivelRuido)
nBits=16;
nChannels = 1;
recObj =  audiorecorder(Fs,nBits,nChannels);
disp('Em escuta')
sair=0;
tempo = tempoEspera;
times=3;
while sair == 0
    if tempo > tempoEspera
        disp('INICIADO')
        sair=1;
    end;
    recordblocking(recObj, tempo);
    myRecording = getaudiodata(recObj);
    sum=0;
    for i=1:length(myRecording)
        sum = sum + abs(myRecording(i));
    end;
    times = times - 1;
    if (tempo == tempoEspera&&times<0)
        %sum=norm(sum);
        disp(sum);
        %0.08 palma
        %0.04 voz baixa
        if (sum > nivelRuido)
            tempo = tempoG;
        end;
    end;
    
end;
inicioEspera = myRecording;
disp('Gravacao finalizada');
audiowrite('tester2.wav',myRecording,Fs)
disp('Som original armazenado');
