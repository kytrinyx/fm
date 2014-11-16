module FM
  class Config
    def genres
      genres ||= Genres.new(genre_list, mode)
    end

    private

    def mode
      if ENV['FM_GENRE_WHITELIST'].to_s.empty?
        :blacklist
      else
        :whitelist
      end
    end

    def genre_list
      ENV['FM_GENRE_WHITELIST'] || ENV['FM_GENRE_BLACKLIST']
    end
  end
end
