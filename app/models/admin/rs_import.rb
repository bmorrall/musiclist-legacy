require 'formtastic_faux_model'

class Admin::RsImport < FormtasticFauxModel
  attr_accessor :album, :artist, :order

  self.types = {
    :album => :string,
    :artist => :string,
    :order => :integer
  }
end