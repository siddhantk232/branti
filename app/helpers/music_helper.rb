module MusicHelper
  def hex_color_to_rgba(hex, opacity)
    rgb = rgb_from_hex(hex)

    "rgba(#{rgb.join(", ")}, #{opacity})"
  end

  def text_color_from_bg(hex)
    rgb = rgb_from_hex(hex)
    red = rgb[0]
    green = rgb[1]
    blue = rgb[2]

    if (red*0.299 + green*0.587 + blue*0.114) > 186 
      return "#000000"
    else 
      return "#ffffff"
    end
  end

  private

  def rgb_from_hex(hex)
    hex.match(/^#(..)(..)(..)$/).captures.map(&:hex)
  end
end
