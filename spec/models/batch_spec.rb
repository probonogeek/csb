require 'spec_helper'

describe Batch do

  describe "validation" do

    it_makes_valid Batch
    it_validates_presence_of :volume, Batch
    it_validates_presence_of :brewed_at, Batch
    it_validates_presence_of :style, Batch

  end

  describe "associations" do
    it_belongs_to :style, Batch
    it_has_many :beers, Batch
    it_has_one_through :brewery, :style, Batch
  end

end
