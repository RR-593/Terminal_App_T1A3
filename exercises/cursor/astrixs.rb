def get_ran_loactions(size, num)
  random_locations = []
  begin
    random_location = rand(size)
    random_locations << random_location
  end until random_locations.length == num
  random_locations
end

def insert_ran_astrixs(doc, num)
  random_locations = []
  random_locations = get_ran_loactions(doc.chomp.bytesize, num) while random_locations.length != num
  random_locations.each { |location| doc.insert(location, '*') }
  doc
end
