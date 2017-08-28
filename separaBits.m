function bitsF = separaBits(som, qtdBits, Fs, minruido,tempo,freqHi)
passo = (1/Fs);
t = [0:passo:0.01*qtdBits];
f = [0:1:Fs];
tDado=Fs/qtdBits;
vet=zeros(tDado,qtdBits);
k=1000; %inicia numa amostra razoavel para remover o ruido inicial
j=1;
while (abs(som(k)) + abs(som(k+1)) + abs(som(k+2)))/3<(minruido)
    j=j+1;
    k=k+1;
end;
%display(k);
vetff=0;
for i=k:Fs*tempo+k
    vetff(i-k+1)=som(i);
end;
%passa alta para separar os bits
N=8; 
fc=(2*freqHi)/Fs;
Rp=10;

%t = (0:length(audio)-1)/Fs;
bhi=fir1(N,fc,'high',chebwin(N+1,Rp));
filtradoalta=filter(bhi,1,vetff);
vetff=filtradoalta/norm(filtradoalta);



vetS=zeros(round(qtdBits*tempo),1);
%vetff=vetff/max(vetff);
for i=1:tDado
     for j=1:qtdBits*tempo
     vet(i,j)=vetff(i+(j-1)*tDado);
     vetS(j)=vetS(j)+abs(vetff(i+(j-1)*tDado));
     end;
 end;
 vetB=zeros(length(vetS),1);
 %vetS=vetS / norm(vetS);
 vetS=vetS/max(vetS);
for i=1:length(vetS)
  if vetS(i) > 0.75
     vetB(i)=1;
  else
     vetB(i)=0;
  end;
end;
vetS
bitsF=bi2de(vetB','left-msb')
%bitsF=vetS