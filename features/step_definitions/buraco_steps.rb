Dado /^que eu ainda nao estou jogando$/ do
end

Quando /^eu comecar um novo jogo$/ do
  Buraco::Game.new.start
end

Entao /^eu deveria ver "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Dado /^que eu comecei o jogo$/ do
  pending # express the regexp above with the code you wish you had
end

Quando /^estou sem cartas na mao$/ do
  pending # express the regexp above with the code you wish you had
end

Entao /^eu deveria receber (\d+) cartas aleatorias$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

