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

#     it_validates_uniqueness_of :slug
    it "validates uniqueness of slug" do
      brewery = Brewery.make
      lambda do
        new_brewery = Brewery.make(:slug => brewery.slug)
      end.should raise_error(ActiveRecord::RecordInvalid, /#{:slug.to_s.humanize} has already been taken/)
    end

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
    it "has_many styles" do
      brewery = Brewery.make
      style = brewery.styles.make
      style.class.should == Style
    end
  end

end
