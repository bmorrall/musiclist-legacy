class MetaData < ActiveRecord::Base
  belongs_to :item, :polymorphic => true
  attr_accessible :data, :source

  serialize :data, Hash
end
