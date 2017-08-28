function vecStart = insereStart(vecDado, tf0, f0,Fs)
    passo=1/Fs;
    t = [passo:passo:tf0];
    ang0 = (2*pi*f0*t);
    x0 = sin(ang0);
    vecStart = [x0 vecDado];
    
  