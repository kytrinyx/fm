module FM
  class Stream
    attr_reader :config
    def initialize(config)
      @config = config
    end

    def genre_enabled?(genre)
      true
    end
  end
end
