require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    self.new_by_name(name)
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name ? song : false}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    songs_names = @@all.map {|song| song.name}.sort
    songs_names.collect {|name| self.find_by_name(name)}
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(".mp3")[0].split(" - ")
    song_name = filename_array[1]
    artist_name = filename_array[0]
    new_song = self.new_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all = []
  end

end
