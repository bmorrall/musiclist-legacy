class Artist < ActiveRecord::Base
  has_many :albums, :dependent => :nullify
  default_scope :order => 'sort_name asc, name asc'

  # name:string
  attr_accessible :name
  validates_presence_of :name

  # sort_name:string
  attr_accessible :sort_name

  def display_name
    display_name = name.split('&').map{ |n| n.split(',', 2).reverse.join(' ') }.join(' & ')
    display_name.squeeze(' ').strip
  end

  def to_s
    name
  end

end
