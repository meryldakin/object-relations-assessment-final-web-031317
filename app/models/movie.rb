require 'pry'

class Movie
  attr_accessor :title

  ALL = []
  def initialize(title)
    self.title = title
    self.class.all << self
  end

  def self.all
    ALL
  end

  def ratings
    Rating.all.select {|ratings| ratings.movie == self.title}
  end

  def viewers
    self.ratings.map {|rating| rating.viewer}
  end

  def self.find_by_title(title)
    self.all.find {|movie| movie.title == title}
  end

  def self.find_or_create(title)
    if self.all.any? {|movie| movie.title == title}
      title
    else
      Movie.new(title)
    end
  end

  def average_rating
    movie_ratings = Rating.all.select do |rating|
      rating.movie == self.title
    end
    scores = movie_ratings.map do |rating|
      rating.score
    end
    sum_scores = scores.reduce do |sum, score|
      sum + score
    end
    average = sum_scores / scores.length

  end

end
