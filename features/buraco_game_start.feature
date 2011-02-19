# language: pt

Funcionalidade: o jogador comeca o jogo de Buraco

  Como um jogador
  Eu quero comecar um jogo de Buraco
  Entao eu posso ganhar e fazer muitos pontos

Cenario: comecar o jogo
  Dado que eu ainda nao estou jogando
  Quando eu comecar um novo jogo
  Entao eu deveria ver "Bem vindo ao jogo de Buraco!"
  E eu deveria ver "Jogador, digite o seu nome:"
