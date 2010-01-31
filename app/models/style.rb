class Style < ActiveRecord::Base

  belongs_to :brewery
  has_many :batches

  validates_presence_of :name
  validates_format_of :slug, :with => /^[a-z0-9-]+$/
  before_validation :ensure_slug

  def ensure_slug
    self.slug = Csb::Slug::generate(name, '-') if slug.nil?
  end

end
