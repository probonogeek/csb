class Batch < ActiveRecord::Base

  belongs_to :style
  has_many :beers


end
