class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [2, 4, 6], [0, 4, 8]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    @index = input.to_i - 1
  end

  def move(index, char)
    @board[index] = char
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    elsif @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    end
  end

  def valid_move?(index)
    if !position_taken?(index) && 0 <= index && 8 >= index
      return true
    else
      return false
    end
  end

  def turn_count
    turns = 0
    @board.each do |position|
      if position == "X" || position == "O"
        turns += 1
      end
    end
    return turns
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    elsif turn_count % 2 == 1
      return "O"
    end
  end

  def turn
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    won = 0
    WIN_COMBINATIONS.each do |combination|
      if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X" || @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
        return combination
        won = 1
      end
    end
    if won == 0
      return false
    end
  end

  def full?
    filled = 0
    @board.each do |position|
      if position == "X" || position == "O"
        filled += 1
      elsif position == " " || position == ""
        filled += 0
      end
    end
    if filled == 9
      return true
    else
      return false
    end
  end

  def draw?
    if !won? and full?
      return true
    else
      return false
    end
  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  def winner
    if won?
    WIN_COMBINATIONS.each do |combination|
      if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X"
        return "X"
      elsif @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
        return "O"
      end
    end
  end
end

  def play
    puts "Please enter 1-9:"
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


end
