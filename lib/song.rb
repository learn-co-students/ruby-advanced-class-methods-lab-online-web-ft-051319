require "pry"

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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new #creates a new instance of Song
    song.name = name #uses attr_accessor :name to set song name = name being passed in
    song
  end

  def self.create_by_name(name)
    song = self.new #creates a new instance of Song
    song.name = name #uses attr_accessor :name to set song name = name being passed in
    @@all << song #adds name to @@all array
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    unless find_by_name(name) == nil
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name }
  end

  def self.new_from_filename(filename)
    file_arr = filename.split(/[\-\.]/)
    artist_name = file_arr[0].split(/\s\z/)[0]
    song_name = file_arr[1].split(/\A\s/)[1]
    song = self.new #creates a new instance of Song
    song.name = song_name #uses attr_accessor :name to set song name = name being passed in
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    file_arr = filename.split(/[\-\.]/)
    artist_name = file_arr[0].split(/\s\z/)[0]
    song_name = file_arr[1].split(/\A\s/)[1]
    song = self.new #creates a new instance of Song
    song.name = song_name #uses attr_accessor :name to set song name = name being passed in
    song.artist_name = artist_name
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
