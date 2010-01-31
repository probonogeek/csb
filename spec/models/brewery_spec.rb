require 'spec_helper'

describe Brewery do

  describe "validation" do

    it_makes_valid Brewery
    it_validates_presence_of :name, Brewery
    it_validates_uniqueness_of :slug, Brewery

    it "ensures a valid slug" do
      brewery = Brewery.make
      brewery.slug.should == Csb::Slug::generate(brewery.name, '-')
    end

    it "generates a unique slug for non-unique names" do
      brewery = Brewery.make
      lambda do
        Brewery.make( :name => brewery.name )
      end.should_not raise_error(ActiveRecord::RecordInvalid, /#{:slug.to_s.humanize} has already been taken/)
    end

    it "validates the format of slug" do
      lambda do
        invalid_model = Brewery.make(:slug => "INVALID")
      end.should raise_error(ActiveRecord::RecordInvalid, /#{:slug.to_s.humanize} is invalid/)
    end

  end

  describe "associations" do
    it_has_many :styles, Brewery
    it_has_many_through :batches, :styles, Brewery
  end

end
