class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end

class Input
  def messages
    @messages ||= []
  end

  def gets
    "<nome>"
  end
end

def input
  @input ||= Input.new
end

def game
  @game ||= Buraco::Game.new(output, input)
end


Dado /^que eu ainda nao estou jogando$/ do
end

Quando /^eu comecar um novo jogo$/ do
  game.start
end

Entao /^eu deveria ver "([^"]*)"$/ do |message|
  output.messages.should include(message)
end

Entao /^eu deveria digitar "([^"]*)"$/ do |name|
end

Dado /^que eu comecei o jogo$/ do
  pending
end

Quando /^estou sem cartas na mao$/ do
  pending # express the regexp above with the code you wish you had
end

Entao /^eu deveria receber (\d+) cartas aleatorias$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

