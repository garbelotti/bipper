function geraMsg = msg(dado, f1, f2,bitsA,Fs,duracao)
passo=1/Fs;
t = [passo:passo:duracao];
ang1 = (2*pi*f1*t);
ang2 = (2*pi*f2*t);
x1 = sin(ang1);
x2 = sin(ang2);
    binDado = wrev(de2bi(dado));
    umBit = Fs/bitsA;
    dadoModulado = zeros(1,umBit * length(binDado));
    
    for i = 1:length(binDado)
        for k=1:umBit
            if binDado(i) == 1
                dadoModulado(1,k+((i-1)*umBit)) = x1(k);
            else dadoModulado(1,k+((i-1)*umBit)) = x2(k);
            end;
        end;
    end;
   geraMsg = dadoModulado;