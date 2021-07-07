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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(string)
    new_song = self.new
    new_song.name = string
    new_song
  end

  def self.create_by_name(string)
    new_song = self.new
    new_song.name = string
    new_song.save
    new_song
  end

  def self.find_by_name(string)
    self.all.find {|song| song.name == string}
  end

  def self.find_or_create_by_name(string)
    self.find_by_name(string) || self.create_by_name(string)
  end

  def self.alphabetical
    self.all.sort {|a,b| a.name <=> b.name }
  end

  def self.new_from_filename(string)
    song = self.new
    song.name = string.split(/\.|\s-\s/)[1]
    song.artist_name = string.split(/\.|\s-\s/)[0]
    song
  end

  def self.create_from_filename(string)
    song = self.new
    song.name = string.split(/\.|\s-\s/)[1]
    song.artist_name = string.split(/\.|\s-\s/)[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
