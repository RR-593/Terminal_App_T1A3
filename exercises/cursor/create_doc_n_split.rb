require_relative './astrixs'
require_relative './doc'

def create_doc_n_split(num_para, num_astrix)
  doc = doc_create(prara_create, num_para)
  doc = insert_ran_astrixs(doc, num_astrix)

  doc.split("\n")
end
