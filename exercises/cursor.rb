require "BetterLorem"
require "rainbow"
require_relative "../controllers/VimControls"
require_relative "../views/cls"
require_relative "../views/exercises/cursor"

def prara_create
  vim_para_words = BetterLorem.p(1,true).split(' ')

  word_length_total = 0

  vim_para_words.each {|word| 
    word.concat(word_length_total >= 51 ? "\n" : " ") 
    word_length_total = word_length_total < 51 ? word_length_total + word.bytesize : 0
    }
  vim_para_words.join('')
end

def doc_create(para, num)
  num -= 2
  doc = prara_create
  for i in 0..num
    doc << "\n\n" + prara_create
  end
  doc
end

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
    random_locations.each {|location| doc.insert(location, "*")}
    doc
end

doc = doc_create(prara_create, 1)
doc = insert_ran_astrixs(doc, 2)
doc_lines = doc.split("\n")

#cursor [chr, line]
cursor = [0,0]
begin
   
  cls
  Views::Exercises.print_doc(cursor,doc_lines)
  cursor, non_alpha_chr = vicont(cursor)

end until non_alpha_chr == true && cursor[1] == 99