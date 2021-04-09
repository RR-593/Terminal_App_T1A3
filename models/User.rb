require_relative './ActiveRecord'

class User < ActiveRecord
  attr_accessor :name, :colour, :time

  def initialize(name, colour)
    @id = object_id
    @name = name
    @colour = colour
    @time = ["--no score--","--no score--","--no score--"]
  end

  def print_id
    puts object_id
  end
end
