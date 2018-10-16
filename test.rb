#rr = [1,1 ,4,2]
#puts rr.uniq.sort[1]
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
    while (i < 10)
      @board << @board[i] = BoardCase.new(nil, i)
      i +=1
    end
  end

  def victory?
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
    @player1_plays.uniq.sort[@input] == @player2_plays.uniq.sort[@input]
  end

  def turn
  @player1_plays = []
  @player2_plays = []
  puts "Welcome to TicTacToe"
  puts "Player 1 : name"
  print ">"
  @player1 = gets.chomp
  puts "choisis si tu veux etre les croix ou les rond, met X ou O"
  signe_player1 = gets.chomp.upcase
  puts "Player 2 : name"
  print ">"
  @player2 = gets.chomp
  
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
      @input = gets.chomp.to_i
      @player1_plays << @input

        if (valid_move == false)# && player1_plays != nil)
        @board[@input].value = signe_player1
        else (valid_move == true)
        puts "déja pris"
        @input = gets.chomp.to_i
        @board[@input].value = signe_player1
        end
    
    else
      puts "Your turn #{@player2}"
      print ">"
      @input = gets.chomp.to_i
      @player2_plays << @input
      
      if (valid_move == false)# && @player1_plays != nil)
      @board[@input].value = signe_player2
      else (valid_move == true)
      puts "déja pris"
      @input = gets.chomp.to_i
      @board[@input].value = signe_player2
      end
    end
    i += 1
    puts victory?
    end
end
end

partie1 = Board.new
partie1.turn