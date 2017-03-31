class Viewer
  attr_reader :name

  ALL = []

  def self.all
    ALL
  end

  def initialize(name)
    @name = name
    ALL << self
  end

  def create_rating(score, movie_title)
    Rating.new(score, movie_title, self)
    Movie.find_or_create(movie_title)
  end

  def self.find_by_name(viewer_name)
    Viewer.all.find do |viewer|
      viewer_name == viewer.name
    end
  end



end
