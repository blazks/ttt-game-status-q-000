# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]


def won?(board)
  win_index=[]
  WIN_COMBINATIONS.each do |combo|
  if board[combo[0]]=="X" && board[combo[1]]=="X" && board[combo[2]]=="X"
      (win_index<<combo).flatten!
  elsif board[combo[0]]=="O" && board[combo[1]]=="O" && board[combo[2]]=="O"
      (win_index<<combo).flatten!
    end
  end
  if win_index == []
    false
  else win_index
  end
end

def full?(board)
  (
  board.select do |pieces|
    pieces == "X" || pieces == "O"
    end
  ).size == 9
end

def draw?(board)
  if full?(board)
    if won?(board)
      false
    else
      true
    end
  else
    false
  end
end

def over?(board)
  won?(board)||draw?(board)
end

def winner(board)
  if won?(board)
  board[(won?(board))[0]]
  else nil
  end
end
