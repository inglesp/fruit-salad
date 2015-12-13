module Game
  extend self 
  PLAYERS = ["X", "O"]
  DOT = "."
  EMPTY_BOARD = DOT * 9
  WINNING_LINES = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]


  def play
    playing_board = EMPTY_BOARD
    winning_player = nil

    display(playing_board)

    9.times do |turn|
      position = free_positions(playing_board).sample
      player = PLAYERS[turn % 2]
      playing_board = update_board(playing_board, position, player)
      display(playing_board)
      if check_winner(playing_board, player)
        winning_player = player
        break
      end
    end

    if winning_player
      puts "Player #{winning_player} wins"
    else
      puts "It is a draw"
    end
  end


  def display(playing_board)
    puts "#{playing_board[0]} | #{playing_board[1]} | #{playing_board[2]}"
    puts "--+---+--"
    puts "#{playing_board[3]} | #{playing_board[4]} | #{playing_board[5]}"
    puts "--+---+--"
    puts "#{playing_board[6]} | #{playing_board[7]} | #{playing_board[8]}"
    puts
  end


  def update_board(playing_board, position, player)
    raise "Invalid position: #{position}" if position < 0 || position >= 9
    raise "Position is full: #{position}" if playing_board[position] != DOT
    playing_board[0...position] + player + playing_board[position+1..-1]
  end


  def free_positions(playing_board)
    playing_board.split("").each_index.select {|ix| playing_board[ix] == DOT}
  end


  def check_winner(playing_board, player)
    WINNING_LINES.each do |line|
      return true if line.all? {|p| playing_board[p] == player}
    end

    false
  end
end


if __FILE__ == $0
  Game.play
end
