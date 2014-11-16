module FM
  class Genres
    attr_reader :values
    def initialize(list)
      @values = list.to_s.split(/\s*,\s*/).map { |s| s.strip.to_sym }
    end

    def enabled?(genre)
      values.include?(genre.to_sym)
    end
  end

  class BlacklistedGenres < Genres
    def enabled?(genre)
      !values.include?(genre.to_sym)
    end
  end
end
