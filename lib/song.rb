class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        formatted = filename.split(/[-.]/).map(&:strip)
        song = Song.new(formatted[1])
        song.artist_name = formatted[0]
        song
    end

    def self.new_by_name(name)
        song = self.new(name)
        song
    end

    def artist_name=(name)
        if Artist.find_by_name(name)
            self.artist = Artist.find_by_name(name)
        else  
            artist = Artist.new(name)
            artist.add_song(self)
        end
    end
    
end