# frozen_string_literal: true
class Cell
  attr_accessor :value
  def initialize(entry)
    entry ||= 1..9
    @value = Array(entry)
  end
    
  def solve(row, col, square)
    @value -= row | col | square
    solved?
  end

  def val
    solved? ? @value.first : nil
  end

  def solved?
    @value.count == 1
  end
end

