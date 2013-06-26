module PaletteTown
  class Rule
    def [] key
      @keys[key]
    end
    def each &block
      @keys.each(&block)
    end
    def initialize rule
      # TODO: Need to find nearest console color
      # TODO: Create PaletteTown::TermColor class
      @keys = {}
      @keys[:guifg] = PaletteTown::Color.new(rule[:fg]) if rule[:fg]
      @keys[:ctermfg] = rule[:fg_term] if rule[:fg_term]
      @keys[:guibg] = PaletteTown::Color.new(rule[:bg]) if rule[:bg]
      @keys[:ctermbg] = rule[:bg_term] if rule[:bg_term]
      @keys[:gui] = rule[:style] if rule[:style]
      @keys[:cterm] = rule[:style_term] if rule[:style_term]
    end
  end
end
