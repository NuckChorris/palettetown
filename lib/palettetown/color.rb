class PaletteTown::Color
  attr_accessor :hue, :sat, :lum
  def initialize color
    if color.is_a? String
      color = self.class.from_hex(color)
    elsif color.is_a? PaletteTown::Color
      color = color.to_h
    elsif color.is_a? Hash
      if color[:hue].nil? or color[:sat].nil? or color[:lum].nil?
        raise ArgumentError
      end
    end
    @hue = color[:hue].to_f
    @sat = color[:sat].to_f
    @lum = color[:lum].to_f
  end
  def to_rgb
    if @sat == 0
      r = g = b = @lum
    else
      y = if @lum < 0.5
        @lum * (@sat + 1.0)
      else
        @lum + @sat - (@lum * @sat)
      end
      x = @lum * 2.0 - y
      r = self.class.hue_to_rgb(x, y, @hue + 1.0/3.0)
      g = self.class.hue_to_rgb(x, y, @hue)
      b = self.class.hue_to_rgb(x, y, @hue - 1.0/3.0)
    end
    return {
      :r => (r * 255).to_i,
      :g => (g * 255).to_i,
      :b => (b * 255).to_i
    }
  end
  def to_hex
    "%<r>02x%<g>02x%<b>02x" % to_rgb
  end
  def to_h
    return {
      :hue => @hue,
      :sat => @sat,
      :lum => @lum
    }
  end
  def to_s
    "##{to_hex}"
  end

  private
  def self.from_hex color
    color.shift if color[0] == '#'
    r = color[0...2].to_i 16
    g = color[2...4].to_i 16
    b = color[4...6].to_i 16

    from_rgb(r, g, b)
  end
  def self.from_rgb red, green, blue
    red /= 255.0
    green /= 255.0
    blue /= 255.0

    min = [red, green, blue].min
    max = [red, green, blue].max

    lum = (max + min) / 2

    if max == min
      hue = 0
      sat = 0
    else
      delta = max - min

      if lum > 0.5
        sat = delta / (2 - max - min)
      else
        sat = delta / (max + min)
      end

      case max
      when red
        hue  = (green - blue) / delta
        hue += 6 if green < blue
      when green
        hue  = (blue - red) / delta
        hue += 2
      when blue
        hue  = (red - green) / delta
        hue += 4
      end
      hue /= 6
    end
    return {hue: hue, sat: sat, lum: lum}
  end
  def self.hue_to_rgb x, y, z
    # Frankly I don't know what this all does
    # I just ported it from the W3C CSS spec
    z += 1 if (z < 0)
    z -= 1 if (z > 1)
    return x + (y - x) * z * 6 if z < 1.0 / 6.0
    return y if z < 1.0 / 2.0
    return x + (y - x) * (2.0 / 3.0 - z * 6) if z < 2.0 / 3.0
    return x
  end
end
