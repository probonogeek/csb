require 'spec_helper'

describe Beer do

  describe "validation" do

    it_makes_valid Beer
    it_validates_presence_of :name, Beer

    it "ensures a valid slug" do
      beer = Beer.make
      beer.slug.should == Csb::Slug::generate(beer.name, '-')
    end

    it "generates a unique slug for non-unique names" do
      beer = Beer.make
      lambda do
        Beer.make( :name => beer.name )
      end.should_not raise_error(ActiveRecord::RecordInvalid, /#{:slug.to_s.humanize} has already been taken/)
    end

    it "validates the format of slug" do
      lambda do
        invalid_model = Beer.make(:slug => "INVALID")
      end.should raise_error(ActiveRecord::RecordInvalid, /#{:slug.to_s.humanize} is invalid/)
    end

  end

  describe "associations" do
    it_belongs_to :batch, Beer
    it_has_one_through :style, :batch, Beer
  end

end
