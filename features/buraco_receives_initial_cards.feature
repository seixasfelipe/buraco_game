# language: pt

@release_01
Funcionalidade: o jogador recebe 11 cartas

  O jogador recebe 11 cartas iniciais providos por 2 baralhos.
  As cartas são sempre embaralhadas antes da distribuicao das cartas, ou seja, sao cartas aleatorias.

Cenario: distribuir cartas iniciais
  Dado que eu comecei o jogo
  Quando estou sem cartas na mao
  Entao eu deveria receber 11 cartas aleatorias removendo-as do topo do deck
  E as cartas deveriam conter naipes e valores de A a K
