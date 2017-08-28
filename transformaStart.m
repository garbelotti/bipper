function startBit = transformaStart(audio,f0,Fs)
%n = length(audio);
%f = Fs*(0:n/2-1)/n;
%flimit=(n-1)/2;

%passa alta para retirar o bit start
N=8; 
fc=(2*f0)/Fs;
Rp=10;

%t = (0:length(audio)-1)/Fs;
bhi=fir1(N,fc,'high',chebwin(N+1,Rp));
startBit=filter(bhi,1,audio);
startBit=startBit/norm(startBit);
% Wp=(2*(f0+200))/Fs;
% Ws=(2*(f0))/Fs;
% Rp = 4; 
% [N,wc] = cheb1ord(Wp,Ws,Rp,Rs);
% [P,Q] = cheby1(N,Rp,wc,'high');
% startBit = filter(P,Q,audio);
% startBit = startBit / norm(startBit);
% Fa=abs(fft(startBit)) / n;
%bar(f(1:flimit),Fa(1:flimit));
