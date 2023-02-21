require 'spec_helper'

describe ConnectFour do
  before(:each) do
    @connect_four = ConnectFour.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@connect_four).to be_a ConnectFour
    end

    it 'has a human player' do
      expect(@connect_four.human_player).to be_a Player
      expect(@connect_four.human_player.type).to eq(:human)
    end

    it 'has a computer player' do
      expect(@connect_four.computer_player).to be_a Player
      expect(@connect_four.computer_player.type).to eq(:computer)
    end

    it 'has a board that is nil by default' do
      expect(@connect_four.board).to eq(nil)
    end

    it 'has a game that is nil by default' do
      expect(@connect_four.game).to eq(nil)
    end

    it 'has a current player that starts as the human player' do
      expect(@connect_four.current_player).to be_a Player
      expect(@connect_four.current_player).to eq(@connect_four.human_player)
    end
  end

  describe '#create_players' do
    it 'creates players' do
      expect(@connect_four.create_players).to be_a Player
    end
  end

  describe '#set_current_player' do
    it 'sets the current player to human at the start of the game' do
      expect(@connect_four.current_player.type).to eq(:human)
    end

    it 'can change the current player to computer from human' do
      expect(@connect_four.current_player.type).to eq(:human)

      @connect_four.set_current_player

      expect(@connect_four.current_player.type).to eq(:computer)
      expect(@connect_four.current_player).to eq(@connect_four.computer_player)
    end

    it 'can change the current player back to human from computer' do
      @connect_four.set_current_player
      expect(@connect_four.current_player.type).to eq(:computer)

      @connect_four.set_current_player

      expect(@connect_four.current_player.type).to eq(:human)
      expect(@connect_four.current_player).to eq(@connect_four.human_player)
    end
  end

  describe '#create_new_game' do
    it 'creates a new game and passes attributes' do
      expect(@connect_four.create_new_game).to be_a Game
      expect(@connect_four.game.board).to eq(@connect_four.board)
      expect(@connect_four.game.human_player).to eq(@connect_four.human_player)
      expect(@connect_four.game.computer_player).to eq(@connect_four.computer_player)
    end
  end

  describe '#show_welcome_message' do
    it 'shows a welcome message to the user' do
      expect(@connect_four.show_welcome_message).to eq('Welcome to Connect Four!')
    end
  end

  describe '#show_main_menu' do
    it 'shows a main menu to the user' do
      expect(@connect_four.show_main_menu).to eq('Enter p to play or q to quit.')
    end
  end

  describe '#show_play_again_message' do
    it 'shows a message to the user asking if they want to play again' do
      expect(@connect_four.show_play_again_message).to eq('Want to play again?')
    end
  end

  describe '#show_goodbye_message' do
    it 'shows a goodble message to the user' do
      expect(@connect_four.show_goodbye_message).to eq('Thanks for playing. Goodbye!')
    end
  end

  describe '#turn_results' do
    before(:each) do
      @connect_four.create_new_game
    end

    it 'shows a winning message and ends the game if the human player wins' do
      expect(@connect_four.turn_results(:win)).to eq('You win!')
      expect(@connect_four.game.game_over).to be true
    end

    it 'shows a losing message and ends the game if the human player loses' do
      expect(@connect_four.turn_results(:loss)).to eq('You lose!')
      expect(@connect_four.game.game_over).to be true
    end

    it 'shows a draw message and ends the game if game is a draw' do
      expect(@connect_four.turn_results(:draw)).to eq('Game is a draw!')
      expect(@connect_four.game.game_over).to be true
    end

    it 'does nothing if no end condition is met' do
      @connect_four.turn_results(:keep_playing)

      expect(@connect_four.game.game_over).to be false
    end
  end
end
