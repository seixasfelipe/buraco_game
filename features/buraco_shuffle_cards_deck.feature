# language: pt

@release_01
Funcionalidade: o jogo embaralha as cartas do baralho

  Para se jogar Buraco, devemos ter 2 baralhos completos, sem as cartas Joker contendo 4 nipes cada um.
  Cada nipe devera conter as cartas A, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K.

  O jogo sempre que for iniciado, deve embaralhar os 2 baralhos aleatoriamente.
 
Cenario: embaralhar o baralho
  Dado que eu comecei o jogo
  Quando o baralho nao estiver embaralhado
  Entao o jogo deveria embaralhar o baralho

