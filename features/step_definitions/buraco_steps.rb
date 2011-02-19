class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    @messages << message
  end
end

def output
  @output ||= Output.new
end


Dado /^que eu ainda nao estou jogando$/ do
end

Quando /^eu comecar um novo jogo$/ do
  game = Buraco::Game.new(output)
  game.start
end

Entao /^eu deveria ver "([^"]*)"$/ do |message|
  output.messages.should include(message)
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

