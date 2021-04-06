require "BetterLorem"

def prara_create
  vim_para_words = BetterLorem.w(54,true).split(' ')
  
  word_length_total = 0
  
  para_cut = 43

  vim_para_words.each {|word| 
    word.concat(word_length_total >= para_cut ? "\n" : " ") 
    word_length_total = word_length_total < para_cut ? word_length_total + word.bytesize : 0
    }
  vim_para_words.join('')
end
  
def doc_create(para, num)
  num -= 2
  doc = prara_create
  for i in 0..num
    doc << "\n \n" + prara_create
  end
  doc
end