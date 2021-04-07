# frozen_string_literal: true

require_relative './ActiveRecord'

class Page < ActiveRecord
  attr_reader :selections, :name, :content
  attr_accessor :cursor, :content

  def initialize(name, content, selections, cursor = 0)
    @name = name
    @content = content
    @selections = selections
    @cursor = cursor
  end
end
