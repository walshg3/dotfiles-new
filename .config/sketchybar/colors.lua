local M = {}

local with_alpha = function(color, alpha)
  if alpha > 1.0 or alpha < 0.0 then
    return color
  end
  return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
end

local transparent = 0x00000000

local rp_moon = {
  base = 0xff232136,
  surface = 0xff2a273f,
  overlay = 0xff393552,
  muted = 0xff6e6a86,
  subtle = 0xff908caa,
  text = 0xffe0def4,
  love = 0xffeb6f92,
  gold = 0xfff6c177,
  rose = 0xffea9a97,
  iris = 0xffc4a7e7,
  pine = 0xff3e8fb0,
  foam = 0xff9ccfd8,
  highlight_low = 0xff21202e,
  highlight_med = 0xff44415a,
}

local rp = {
  base = 0xff191724,
  surface = 0xff1f1d2e,
  overlay = 0xff26233a,
  muted = 0xff6e6a86,
  subtle = 0xff908caa,
  text = 0xffe0def4,
  love = 0xffeb6f92,
  gold = 0xfff6c177,
  rose = 0xffebbcba,
  iris = 0xffc4a7e7,
  pine = 0xff31748f,
  foam = 0xff9ccfd8,
  highlight_low = 0xff21202e,
  highlight_med = 0xff403d52,
  highlight_high = 0xff524f67,
}

-- catppuccin
local rp_mocha = {
  base = 0xff1e1e2e,
  surface = 0xff74c7ec,
  overlay = 0xff313244,
  muted = 0xff6c7086,
  subtle = 0xff9399b2,
  text = 0xffcdd6f4,
  love = 0xfff38ba8,
  gold = 0xfff9e2af, -- closest match for gold
  rose = 0xfff5c2e7,
  iris = 0xffcba6f7,
  pine = 0xff94e2d5,
  foam = 0xff89dceb,
  highlight_low = 0xff11111b,
  highlight_med = 0xff585b70,
  highlight_high = 0xff737994,
}


local catppuccin_mocha = {
  rosewater = 0xfff5e0dc,
  flamingo  = 0xfff2cdcd,
  pink      = 0xfff5c2e7,
  mauve     = 0xffcba6f7,
  red       = 0xfff38ba8,
  maroon    = 0xffeba0ac,
  peach     = 0xfffab387,
  yellow    = 0xfff9e2af,
  green     = 0xffa6e3a1,
  teal      = 0xff94e2d5,
  sky       = 0xff89dceb,
  sapphire  = 0xff74c7ec,
  blue      = 0xff89b4fa,
  lavender  = 0xffb4befe,
  text      = 0xffcdd6f4,
  subtext1  = 0xffbac2de,
  subtext0  = 0xffa6adc8,
  overlay2  = 0xff9399b2,
  overlay1  = 0xff7f849c,
  overlay0  = 0xff6c7086,
  surface2  = 0xff585b70,
  surface1  = 0xff45475a,
  surface0  = 0xff313244,
  base      = 0xff1e1e2e,
  mantle    = 0xff181825,
  crust     = 0xff11111b,
}


local theme = rp_mocha

M.sections = {
  bar = {
    bg = with_alpha(theme.overlay, 0.6),
    border = with_alpha(theme.highlight_low, 0.6),
  },
  item = {
    bg = theme.overlay,
    border = theme.base,
    text = theme.text,
  },
  apple = theme.rose,
  spaces = {
    icon = {
      color = theme.subtle,
      highlight = theme.text,
    },
    label = {
      color = theme.subtle,
      highlight = theme.gold,
    },
    indicator = theme.iris,
  },
  media = {
    label = theme.subtle,
  },
  widgets = {
    battery = {
      low = theme.love,
      mid = theme.gold,
      high = theme.pine,
    },
    wifi = { icon = theme.rose },
    volume = {
      icon = theme.foam,
      popup = {
        item = theme.subtle,
        highlight = theme.text,
      },
      slider = {
        highlight = theme.foam,
        bg = theme.highlight_med,
        border = theme.highlight_low,
      },
    },
    messages = { icon = theme.love },
  },
  calendar = {
    label = theme.subtle,
  },
}

return M
