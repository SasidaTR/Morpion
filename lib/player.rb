class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def get_move(board)
    puts "#{@name}, à toi de jouer (#{@symbol})."
    loop do
      print "Définis des coordonnées (ex : A1) : "
      position = gets.chomp.upcase
      unless ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"].include?(position)
        print "Coordonnées invalides. Veuillez réessayer : "
        next
      end
      if board.valid_move?(position)
        board.place_move(position, @symbol)
        break
      else
        puts "Coordonnées déjà prises. Veuillez réessayer."
      end
    end
  end
end