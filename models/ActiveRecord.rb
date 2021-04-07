# frozen_string_literal: true

require 'yaml'

class ActiveRecord
  def self.file_name
    "#{self}s.yml"
  end

  def self.db
    @db ||= begin
      YAML.safe_load(File.read(file_name))
    rescue StandardError
      []
    end
  end

  def self.all
    db
  end

  def self.find(name)
    all.detect { |obj| obj.name.downcase == name.downcase } if name.class == ''.class
  end

  def self.save(obj)
    all << obj
    File.open(file_name, 'w') { |file| file.write(all.to_yaml) }
  end

  def save
    self.class.save(self)
  end

  def self.delete(user)
    idx = all.index { |_name| user&.name == @name }
    all.delete_at(idx)
  end

  def delete
    return if @id.nil?

    self.class.delete(self)
    @id = nil
  end

  def self.delete_all
    (0..1).each do |_i|
      all.each_with_index { |_e, i| all.delete_at(i) }
    end
  end
end
