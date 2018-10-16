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
    win_comb = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    if (win_comb.include?(@player1_plays.sort))
      "Victoire de #{@player1}"
   elsif (win_comb.include?(@player2_plays.sort))
      "Victoire de #{@player2}"
  else
    nil
  end
  end

  def valid_move
    check = @player1_plays & @player2_plays
    check1 = @player1_plays.uniq.length
    check2 = @player2_plays.uniq.length
    if (check.empty? == true && check1 == @player1_plays.length && check2 == @player2_plays.length)
      true
    else
      false
    end
  end

  def turn
  @player1_plays = []
  @player2_plays = []
  puts "Welcome to TicTacToe"
  puts  " 1 | 2 | 3 ","----------"," 4 | 5 | 6 ","----------"," 7 | 8 | 9 " 
  puts "Player 1 : name"
  print ">"
  @player1 = gets.chomp
  puts "Player 2 : name"
  print ">"
  @player2 = gets.chomp
  i = 0
  while (i < 9)
  plate = "#{board[0].value} | #{board[1].value} | #{board[2].value}","----------","#{board[3].value} | #{board[4].value} | #{board[5].value}","----------","#{board[6].value} | #{board[7].value} | #{board[8].value}" 
  puts plate
    if (i%2 == 0 && victory? == nil)
      puts "Your turn #{@player1}"
      print ">"
      input = gets.chomp.to_i
      @player1_plays << input
      @board[input].value = "X"
    elsif (i%2 != 0 && victory? == nil)
      puts "Your turn #{@player2}"
      print ">"
      input = gets.chomp.to_i
      @player2_plays << input
      @board[input].value = "O"
    elsif (i%2 != 0 || i%2 == 0 && victory? == true)
        puts victory?
    end
    break if valid_move == false
    i += 1
    end
    puts "ERROR - START AGAIN"
end
end

partie1 = Board.new
partie1.turn