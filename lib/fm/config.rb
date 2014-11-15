module FM
  class Config
    def included_genres
      @included_genres ||= ENV['FM_GENRE_WHITELIST'].to_s.split(/\s*,\s*/).map { |s| s.strip.to_sym }
    end

    def excluded_genres
      @excluded_genres ||= ENV['FM_GENRE_BLACKLIST'].to_s.split(/\s*,\s*/).map { |s| s.strip.to_sym }
    end
  end
end
