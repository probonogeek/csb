module Csb
  module Slug
    class << self
      def generate(source, separator="-")
        source.to_s.blank? ? "" : source.to_s.gsub(/[-_\.]/, ' ').gsub(/[^a-zA-Z0-9\s]/, "").strip.gsub(/\s+/, separator).downcase
      end
    end
  end
end

