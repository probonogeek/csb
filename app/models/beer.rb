class Beer < ActiveRecord::Base

  belongs_to :batch
  has_one :style, :through => :batch

  validates_presence_of :name, :slug
  validates_format_of :slug, :with => /^[a-z0-9-]+$/
  validates_uniqueness_of :slug
  before_validation :ensure_slug

  def ensure_slug
    self.slug = generate_slug if slug.nil?
  end

  def generate_slug( count = 0 )
    generated_slug = Csb::Slug::generate(name, '-')
    generated_slug += "-#{count}" if count > 0
    generated_slug = generate_slug( count + 1 ) if Beer.find_by_slug( generated_slug )
    generated_slug
  end


end
