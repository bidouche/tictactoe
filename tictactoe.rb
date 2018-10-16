class BoardCase
  attr_accessor :value, :pos
  def initialize(value, pos)
    @value = value
    @pos = pos
  end
end

class Board
  attr_accessor :board
  def initialize
    @board = []
    i = 0
    #je crée mes instance de BordCase
    while (i < 10)
      @board << @board[i] = BoardCase.new(nil, i)
      i +=1
    end
  end

  def victory?
    #dans win_comb je rentre toute les possibilité de gagné
    win_comb = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    if (win_comb.include?(@player1_plays.sort))
      "Victoire de #{@player1}"
   elsif (win_comb.include?(@player2_plays.sort))
      "Victoire de #{@player2}"
  else
    nil
  end
  end

  def valid_move
    #ebauche de invalide move
    @player1_plays.sort == @player2_plays.sort
  end

  def turn
  @player1_plays = []
  @player2_plays = []
  puts "Welcome to TicTacToe"
  puts  " 1 | 2 | 3 ","----------"," 4 | 5 | 6 ","----------"," 7 | 8 | 9 "
  puts "Player 1 : name"
  print ">"
  @player1 = gets.chomp
  puts "choisis si tu veux etre les croix ou les rond, met X ou O"
  signe_player1 = gets.chomp.upcase
  puts "Player 2 : name"
  print ">"
  @player2 = gets.chomp
  #puts "Dans ce jeu vous choisirez vos cases avec des chiffres de 1 à 9, 1 étant la case en haut a gauche et 9 la case en bas a droite"
  if (signe_player1 == "X") then signe_player2 = "O"
  end
  if (signe_player1 == "O") then signe_player2 = "X"
  end
  i = 0
  while (victory? == nil && i < 9)
  plate = "#{board[1].value} | #{board[2].value} | #{board[3].value}","----------","#{board[4].value} | #{board[5].value} | #{board[6].value}","----------","#{board[7].value} | #{board[8].value} | #{board[9].value}" 
  puts plate 
    if (i%2 == 0)
      puts "Your turn #{@player1}"
      print ">"
      input = gets.chomp.to_i
      @player1_plays << input # je pousse les réponse du joueur dans un array pour le comparer a mon array de la méthode victory?
      @board[input].value = signe_player1 # je rentre la nouvelle valeur dans mon plate
    else
      puts "Your turn #{@player2}"
      print ">"
      input = gets.chomp.to_i
      @player2_plays << input
      @board[input].value = signe_player2
    end
    i += 1
    puts victory?
    end
end
end

partie1 = Board.new
partie1.turn