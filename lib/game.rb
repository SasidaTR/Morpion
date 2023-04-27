class Game
  def initialize
    puts "Morpion."
    print "Entrez le nom du joueur 1 : "
    name1 = gets.chomp
    print "Entrez le nom du joueur 2 : "
    name2 = gets.chomp
    @player1 = Player.new(name1, "X")
    @player2 = Player.new(name2, "O")
    @board = Board.new
  end

  def play
    loop do
      @board.display_board
      @player1.get_move(@board)
      break if game_over?

      @board.display_board
      @player2.get_move(@board)
      break if game_over?
    end
    @board.display_board

    if @board.winner?
      puts "#{winner.name} gagne la partie."
    else
      puts "Pas de gagnant."
    end
  end

  def game_over?
    @board.winner? || @board.tie?
  end

  def winner
    board_array = @board.instance_variable_get(:@board)
    if board_array.transpose.flatten.count("X") > board_array.transpose.flatten.count("O")
      return @player1
    else
      return @player2
    end
  end  
end