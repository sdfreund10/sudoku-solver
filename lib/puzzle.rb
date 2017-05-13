# frozen_string_literal: true
class Puzzle
  def initialize(array)
    @board = array.map { |row| row.map { |val| Cell.new(val) } }
    @loop_count = 0
    @solveable = true
  end

  def solve_board
    while incomplete && @solveable
      solve
      print_board
      print "\n"
      sleep 1
    end
    if incomplete || !@solveable
      puts "complete?: #{!incomplete}", "solveable?: #{@solveable}"
    else
      puts "Board Solved"
    end
  end

  def solve
    @solveable = false
    @board.each_with_index do |row, rnum|
      row.each_with_index do |cell, cnum|
        unless cell.solved?
          cell.solve(row(rnum), col(cnum), square(rnum, cnum))
          @solveable = true if cell.solved?
        end
      end
    end
  end

  def row(row_num)
    @board[row_num].map(&:val)
  end

  def col(col_num)
    @board.map { |row| row[col_num] }.map(&:val)
  end

  def square(rnum, cnum)
    rstart = (rnum/3).floor * 3
    cstart = (cnum/3).floor * 3
    @board[rstart..(rstart + 2)].map do |row|
      row[cstart..(cstart + 2)]
    end.flatten.map(&:val)
  end

  def incomplete
    @board.map { |row| row.map(&:solved?) }.flatten.uniq.include? false
  end

  def print_board
    system("clear")
    arr = @board.map do |row|
      row.map(&:val).map(&:to_s).map { |str| str.empty? ? " " : str }
    end
    arr.each_with_index do |row, rnum|
      row.each_slice(3) { |sqr| print sqr.join(" "), "|" }
      print "\n"
      print "-" * 18, "\n" if [2,5].include? rnum
    end
  end
end
