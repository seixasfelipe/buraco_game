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
  game.start
  game.player.should_not be_nil
end

Quando /^estou sem cartas na mao$/ do
  game.player.hand_cards.should be_empty
end

Entao /^eu deveria receber (\d+) cartas aleatorias removendo\-as do topo do deck$/ do |cards_quantity|
  count = game.deck.count
  game.give cards_quantity.to_i, :to => game.player
  game.player.hand_cards.should have_exactly(cards_quantity.to_i).cards
  game.deck.should have_exactly(count - cards_quantity.to_i).cards
end

Entao /^as cartas deveriam conter naipes e valores de A a K$/ do
  game.player.hand_cards.map do |c|
    c.suit.nil?.should be_false
    c.value.should >= 1
    c.value.should <= 13
  end
end

Quando /^o baralho nao estiver embaralhado$/ do
  game.deck.shuffled?.should be_false
end

Entao /^o jogo deveria embaralhar o baralho$/ do
  game.shuffle_deck
  game.deck.shuffled?.should be_true
end

