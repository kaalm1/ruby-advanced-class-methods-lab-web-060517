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
    @@all << self.new
    @@all.last
  end

  def self.new_by_name(song)
    new_song = self.new
    new_song.name = song
    new_song
  end

  def self.create_by_name(song)
    new_song = self.new_by_name(song)
    @@all << new_song
    new_song
  end

  def self.find_by_name(song)
    @@all.find do |each_song|
      each_song.name == song
    end
  end

  def self.find_or_create_by_name(song)
    self.find_by_name(song).nil? ? self.new_by_name(song) : self.find_by_name(song)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    new_song = self.new
    new_song.name = filename.split('-')[1].split('.')[0][1..-1]
    new_song.artist_name = filename.split('-')[0][0..-2]
    new_song
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end
end
