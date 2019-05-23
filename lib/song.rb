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
    new_song = Song.new
    new_song.save
    new_song
  end
  
  def self.new_by_name(name)
    instance_by_name = self.new
    instance_by_name.name = name
    instance_by_name
  end
  
  def self.create_by_name(name)
    instance_by_name = self.new
    instance_by_name.name = name
    instance_by_name.save
    instance_by_name
  end
  
  def self.find_by_name(name)
    self.all.find do |song_instance|
      song_instance if song_instance.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by { |songs| [songs.name] }
  end
  
  def self.new_from_filename(filename)
    filename_formatted = filename.chomp(".mp3").split(" - ")
    name = filename_formatted[1]
    artist_name = filename_formatted[0]
    
    song_instance = self.new
    song_instance.name = name
    song_instance.artist_name = artist_name
    song_instance
  end
  
  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
