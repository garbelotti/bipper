# bipper
Projeto desenvolvido para a disciplina de PDS em 2015.

O projeto consiste de um sistema de transmicao de dados via beeps, utilizando 2 dispositivos é possivel criar uma comunicação via beeps.

Utilizando matlab é convertemos uma mensagem (string) em um vetor de bits, convertemos o vetor em um arquivo de audio e com a ajuda de filtros enviamos a mensagem a outro dispositivo. Utilizamos filtros (fft) para detectar inicio e fim da transmição e também para remoção de ruídos.
