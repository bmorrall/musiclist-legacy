class Artist < ActiveRecord::Base
  has_many :albums
  validates_presence_of :name

  def display_name
    name.split('&').map{ |n| n.split(',', 2).reverse.join(' ') }.join(' & ').squeeze(' ')
  end
end
