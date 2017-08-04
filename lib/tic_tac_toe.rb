class TicTacToe
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  def initialize()
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board()
    puts (" #{@board[0]} | #{@board[1]} | #{@board[2]} ")
    puts ("-----------")
    puts (" #{@board[3]} | #{@board[4]} | #{@board[5]} ")
    puts ("-----------")
    puts (" #{@board[6]} | #{@board[7]} | #{@board[8]} ")
  end

  def input_to_index(str)
    return str.to_i-1
  end

  def move(idx, letter)
    @board[idx] = letter
  end

  def position_taken?(idx)
    if(@board[idx] == " ")
      return false
    else
      return true
    end
  end

  def valid_move?(pos)
    if pos > 8 or pos < 0
      return false
    end
    if position_taken?(pos)
      return false
    else
      return true
    end
  end

  def turn
    input = gets
    pos = input_to_index(input)
    until valid_move?(pos)
      input = gets
      pos = input_to_index(input)
    end
    move(pos, current_player)
    display_board
  end

  def turn_count
    i = 0
    turn_count = 0
    while i < @board.size
      if @board[i] == " "
      else
        turn_count = turn_count + 1
      end
      i = i + 1
    end
    return turn_count
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    i = 0
    while i < WIN_COMBINATIONS.size
      if(@board[WIN_COMBINATIONS[i][0]] != " " and @board[WIN_COMBINATIONS[i][0]] == @board[WIN_COMBINATIONS[i][1]] and @board[WIN_COMBINATIONS[i][1]] == @board[WIN_COMBINATIONS[i][2]])
        return WIN_COMBINATIONS[i]
      end
      i = i + 1
    end
    return false
  end

  def full?
    i = 0
    while i < @board.size
      if @board[i] == " "
        return false
      end
      i = i + 1
    end
    return true
  end

  def draw?
    if full?
      if won? == false
        return true
      end
    end
    return false
  end

  def over?
    if draw? or won?
      return true
    end
    return false
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end

  def play
    until over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
