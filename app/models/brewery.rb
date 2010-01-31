class Brewery < ActiveRecord::Base

  has_many :styles
  has_many :batches, :through => :styles

  validates_presence_of :name
  validates_presence_of :slug
  validates_format_of :slug, :with => /^[a-z0-9-]+$/
  validates_uniqueness_of :slug
  before_validation :ensure_slug

  def ensure_slug
    self.slug = generate_slug if slug.nil?
  end

  def generate_slug( count = 0 )
    generated_slug = Csb::Slug::generate(name, '-')
    generated_slug += "-#{count}" if count > 0
    generated_slug = generate_slug( count + 1 ) if Brewery.find_by_slug( generated_slug )
    generated_slug
  end

end
