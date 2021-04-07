require 'yaml'

class ActiveRecord

    def self.file_name
        "#{self}s.yml"
    end

    def self.db
        @db ||= begin
            YAML.load(File.read(file_name))
        rescue
            []
        end
    end

    def self.all
        db
    end

    def self.find(name)
        if name.class == ''.class
            all.detect { |obj| obj.name.downcase == name.downcase }
        end
    end

    def self.save(obj)
        all << obj
        File.open(file_name, 'w') {|file| file.write(all.to_yaml) }
    end

    def save
        self.class.save(self)
    end

    def self.delete(user)
        idx = all.index { |name| user&.name == @name}
        all.delete_at(idx)
    end

    def delete
        return if @id.nil?
        self.class.delete(self)
        @id = nil
    end

    def self.delete_all
        for i in 0..1
            all.each_with_index{ |e,i| all.delete_at(i)}
        end
    end
end