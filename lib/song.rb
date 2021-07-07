require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    @@all.detect{|song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end
  
  def self.alphabetical
   Song.all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(filename)
    new_song = self.new
    data = filename.split(" - ")
    new_song.artist_name = data[0]
    new_song_ext = data[1].split(".")
    new_song.name = new_song_ext[0]
    new_song
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
  def self.destroy_all
    @@all = []
  end
end
