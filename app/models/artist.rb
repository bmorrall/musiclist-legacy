class Artist < ActiveRecord::Base
  has_many :albums
  validates_presence_of :name

  def display_name
    name.split(',', 2).reverse.join(' ')
  end
end
