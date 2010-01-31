require 'spec_helper'

describe Brewery do
  describe "validation" do

    it "makes a valid Brewery" do
      brewery = Brewery.make
      brewery.class.should == Brewery
    end

#     it_validates_presence_of :name
    it "validates presence of name" do
      lambda do
        invalid_model = Brewery.make(:name => nil)
      end.should raise_error(ActiveRecord::RecordInvalid, /#{:name.to_s.humanize} can't be blank/)
    end

    it "ensures a valid slug" do
      brewery = Brewery.make
      brewery.slug.should == Csb::Slug::generate(brewery.name, '-')
    end

    it "validates the format of slug" do
      lambda do
        invalid_model = Brewery.make(:slug => "INVALID")
      end.should raise_error(ActiveRecord::RecordInvalid, /#{:slug.to_s.humanize} is invalid/)
    end

  end
end
