class Style < ActiveRecord::Base

  belongs_to :brewery
  has_many :batches
  has_many :beers, :through => :batches

  validates_presence_of :name, :slug
  validates_format_of :slug, :with => /^[a-z0-9-]+$/
  before_validation :ensure_slug

  def ensure_slug
    self.slug = Csb::Slug::generate(name, '-') if slug.nil?
  end

  def label
    "#{brewery.name}: #{name}"
  end

  def self.find_by_brewery_style_label( brewery_style_label )
    (brewery_name, style_name) = brewery_style_label.split(': ')
    Brewery.find_by_name( brewery_name ).styles.find_by_name( style_name )
  end

end
