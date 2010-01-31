require 'spec_helper'

describe Beer do

  describe "associations" do
    it "belongs_to batch" do
      beer = Beer.make
      beer.batch.class.should == Batch
    end
  end

end
