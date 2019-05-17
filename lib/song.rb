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
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
  end

  def self.find_by_name(song_name)
    self.all.find {|x| x.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) == nil ? self.create_by_name(song_name) : self.find_by_name(song_name)
  end

  def self.alphabetical 
    self.all.sort! {|x, y| x.name <=> y.name}
  end

  def self.new_from_filename(filename)
    parsed = filename.split(/[-.]/)
    song = self.create_by_name(parsed[1].lstrip)
    song.artist_name = parsed[0].lstrip.chop
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all = []
  end
end
