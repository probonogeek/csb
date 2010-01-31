require 'spec_helper'

describe Style do

  describe "validation" do

    it "makes a valid Style" do
      style = Style.make
      style.class.should == Style
    end

#     it_validates_presence_of :name
    it "validates presence of name" do
      lambda do
        invalid_model = Style.make(:name => nil)
      end.should raise_error(ActiveRecord::RecordInvalid, /#{:name.to_s.humanize} can't be blank/)
    end

    it "ensures a valid slug" do
      style = Style.make
      style.slug.should == Csb::Slug::generate(style.name, '-')
    end

    it "validates the format of slug" do
      lambda do
        invalid_model = Style.make(:slug => "INVALID")
      end.should raise_error(ActiveRecord::RecordInvalid, /#{:slug.to_s.humanize} is invalid/)
    end

  end

  describe "associations" do
    it "belongs_to brewery" do
      style = Style.make
      style.brewery.class.should == Brewery
    end

    it "has_many batches" do
      style = Style.make
      batch = style.batches.make
      batch.class.should == Batch
    end
  end

end
