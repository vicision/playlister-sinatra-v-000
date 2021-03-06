class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.strip.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Artist.all.find do |a|
      a.slug == slug
    end
  end

end
