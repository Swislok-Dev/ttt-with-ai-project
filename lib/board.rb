require 'pry'
class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position)
    @cells[position.to_i - 1] 
  end

  def full?
    @cells.any?(" ") ? false : true
  end

  def turn_count
    count = 0
    @cells.each { |i| count += 1 if i != " " }
    count
  end

  def taken?(position)
    position(position) == " " ? false : true
  end


  def valid_move?(move)
    move = move.to_i
    if move < 1 || move > 9
      return false
    else
      taken?(move) ? false : true
    end
  end

  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end
    
end