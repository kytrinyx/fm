module FM
  class Config
    def genres
      genres ||= if !!ENV['FM_GENRE_WHITELIST']
        Genres.new(ENV['FM_GENRE_WHITELIST'])
      else
        BlacklistedGenres.new(ENV['FM_GENRE_BLACKLIST'])
      end
    end
  end
end
