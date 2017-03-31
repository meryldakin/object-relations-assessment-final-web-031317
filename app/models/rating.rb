class Rating
  attr_accessor :score, :viewer, :movie

  ALL = []

  def initialize(score, movie_title, viewer)
    @score = score
    @movie = movie_title
    @viewer = viewer
    self.class.all << self
  end

  def self.all
    ALL
  end

end
