require 'spec_helper'

describe Batch do

  describe "associations" do
    it "belongs_to style" do
      batch = Batch.make
      batch.style.class.should == Style
    end

    it "has_many batches" do
      batch = Batch.make
      beer = batch.beers.make
      beer.class.should == Beer
    end
  end

end
