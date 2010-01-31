require 'spec_helper'

describe Brewery do
  describe "validation" do
    it "creates a valid Brewery" do
      brewery = Brewery.make
      puts brewery.name
      brewery.class.should == Brewery
    end
  end
end
