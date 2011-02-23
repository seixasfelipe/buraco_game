# language: pt

Funcionalidade: o jogo separa o morto

  O baralho apos embaralhado eh separado em 2 montes, ou seja, 22 cartas sao separadas do topo do baralho para a distribuicao do morto.
  As demais cartas serao utilizadas para a distribuicao das cartas para os jogadores.
 
Cenario: separar o morto
  Dado que o baralho foi embaralhado  
  Quando o jogo separar 22 cartas do baralho
  Entao o jogo deveria distribuir o morto intercalando 2 montes de 11 cartas cada um
