module FM
  class Stream
    attr_reader :config
    def initialize(config)
      @config = config
    end

    def genre_enabled?(genre)
      if !config.included_genres.empty?
        return config.included_genres.include?(genre)
      end
      !config.excluded_genres.include?(genre)
    end
  end
end
