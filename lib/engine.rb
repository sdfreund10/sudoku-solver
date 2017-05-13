# frozen_string_literal: true
def play_sudoku
  puzzles = File.read("./lib/puzzles.txt").split(/Grid\s\d\d\n/).reject { |s| s.empty? }
  board = puzzles.sample.split("\n").map do |row| 
    row.split("").map(&:to_i).map { |i| i.zero? ? nil : i }
  end
  print board
  Puzzle.new(board).solve_board
end

