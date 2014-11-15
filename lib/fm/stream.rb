module FM
  class Stream
    attr_reader :config
    def initialize(config)
      @config = config
    end

    def genre_enabled?(genre)
      return true if config.included_genres.empty?

      config.included_genres.include?(genre)
    end
  end
end
