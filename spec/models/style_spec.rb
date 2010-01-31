require 'spec_helper'

describe Style do

  describe "validation" do

    it_makes_valid Style
    it_validates_presence_of :name, Style

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
    it_belongs_to :brewery, Style
    it_has_many :batches, Style
    it_has_many_through :beers, :batches, Style
  end

end
