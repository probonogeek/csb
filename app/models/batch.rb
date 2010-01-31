class Batch < ActiveRecord::Base

  belongs_to :style
  has_many :beers
  has_one :brewery, :through => :style

  validates_presence_of :volume, :brewed_at, :style

end
