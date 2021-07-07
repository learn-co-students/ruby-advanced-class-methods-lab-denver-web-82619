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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name (song_name)
    new = self.create
    new.name = song_name
    new
  end

  def self.new_by_song_artist (song_name, artist)
    new = self.create
    new.name = song_name
    new.artist_name = artist
    new
  end

  def self.create_by_name (song_name)
    self.new_by_name(song_name)
  end

  def self.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}
  end


  def self.find_or_create_by_name(song_name)
    if self.find_by_name (song_name)
      self.find_by_name (song_name)
    else
      self.create_by_name (song_name)
    end
  end


  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename (file_name)
    p file = file_name.split(" - ")
    p file_artist = file[0]
    p file_song = file[1].split(".").first
    self.new_by_song_artist(file_song, file_artist)
  end

  def self.create_from_filename (file_name)
    self.new_from_filename(file_name)
  end

  def self.destroy_all
    self.all.clear
  end

end

#thriller = Song.new_by_song_artist("Thriller", "MJ")

