module FM
  class Config
    def included_genres
      @included_genres ||= tokenize(ENV['FM_GENRE_WHITELIST'])
    end

    def excluded_genres
      @excluded_genres ||= tokenize(ENV['FM_GENRE_BLACKLIST'])
    end

    private

    def tokenize(s)
      s.to_s.split(/\s*,\s*/).map { |s| s.strip.to_sym }
    end
  end
end
