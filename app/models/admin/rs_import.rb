require 'formtastic_faux_model'

class Admin::RsImport < FormtasticFauxModel
  attr_accessor :album, :artist, :order

  validates_presence_of :album
  validates_presence_of :artist
  validates_presence_of :order
  validates :order, :numericality => { :only_integer => true }

  def clean_artist
    artist.downcase.gsub(/\b\w/){$&.upcase}.split(',', 2).reverse.join(' ')
  end

  def clean_album
    album.downcase.gsub(/\b\w/){$&.upcase}.split(',', 2).reverse.join(' ')
  end

  def create_album!
    Album.new
  end

  self.types = {
    :album => :string,
    :artist => :string,
    :order => :integer
  }
end