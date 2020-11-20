class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select{ |song| song.artist == self}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create_by_name(name)
    end

    def self.find_by_name(name)
        self.all.find{ |artist| artist.name == name }
    end

    def self.create_by_name(name)
        artist = self.new(name)
        artist
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end
end
