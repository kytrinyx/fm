module FM
  class Genres
    attr_reader :values, :mode
    def initialize(list, mode)
      @values = list.to_s.split(/\s*,\s*/).map { |s| s.strip.to_sym }
      @mode = mode
    end

    def enabled?(genre)
      if mode == :whitelist
        values.include?(genre.to_sym)
      else
        !values.include?(genre.to_sym)
      end
    end
  end
end
