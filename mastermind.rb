

=begin

 game class
  play method
  number of players
  gameloop
  turns counter 
  game_over?


player class
  initiate secret_code
  get_move method


human class
  inherit from player

computer class
  inherit from player

 board class

  generate_code
  render(drawing)
  feedback algo
  win?
  lose?

 peg class
  color

  secret_code class
=end

class Game

  attr_accessor :player_guess, :secret_code 

  def initialize
    @board = Board.new
    @secret_code = @board.generate_code
    @turns = 0
    @player1 = Player.new
    $COLORS = %w[orange green red blue purple yellow]
    @player_guess = []
  end
  
  def play
    until over?
      increase_turns
      @board.render
      @player_guess = @player1.get_move
      render
    end
  end


  def increase_turns 
    @turns += 1
  end

  def over?
    @turns == 12 || @player_guess == @secret_code
  end

end




class Board
  def initialize

  end

  def generate_code
    #orange, green, red, blue, purple, yellow
    arr = $COLORS
    code = []
    code = 4.times {code << arr.sample}
    #

  end

  def current_board
    # contains an array of the current placed colored pegs
    # gets passed the player move
    Game.player_guess 
  end

  def feedback
    absolute_correct_moves = 0
    Game.secret_code.each do |item|
      if current_board.include?(item)
        somewhat_correct_moves += 1
      end
    end
    Game.secret_code.each_with_index do |item1, index1|
      if current_board[index1] == item1
          absolute_correct_moves += 1
          somewhat_correct_moves -= 1
      end
    end
    if current_board.include? ()
    somewhat_correct_moves = 0

  end 


  def render 
    current_board
    feedback
  end


end




class Player

  def initilzie
    @move_holder = ""
  end

  def get_move
    puts "Please type the color of pegs you want to place."
    puts "For example: 'red, green, blue, blue' "
    move = gets.chomp.downcase
    valid_move?(move) ? @move_holder = move : get_move
  end

  def valid_move?(move)
    # valid move will after being split at every comma and space be an array
    # where each item a color.
    move_array = move.split(", ")
    move_array.length == 4 && move_array.all?{ |x|$COLORS.include?(x) }

  end

end