local icons = require "icons"
local colors = require("colors").sections.calendar
local settings = require "settings"

local cal = sbar.add("item", {
  icon = {
    padding_left = 8,
    padding_right = 4,
    font = {
      family = settings.font.numbers,
      style = settings.font.style_map["Bold"],
    },
  },
  label = {
    color = colors.label,
    align = "left",
    padding_right = 8,
  },
  padding_left = 10,
  position = "right",
  update_freq = 30,
  click_script = "open -a 'Calendar'",
})

cal:subscribe("mouse.clicked", function()
  sbar.animate("tanh", 8, function()
    cal:set {
      background = {
        shadow = {
          distance = 0,
        },
      },
      y_offset = -4,
      padding_left = 14,
      padding_right = 0,
    }
    cal:set {
      background = {
        shadow = {
          distance = 4,
        },
      },
      y_offset = 0,
      padding_left = 10,
      padding_right = 4,
    }
  end)
end)

-- english date
cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
  local hour = os.date("%I") -- 12-hour format
  local minute = os.date("%M")
  local am_pm = os.date("%p") -- AM/PM
  local date = os.date("%m/%d") -- M/D format
  cal:set { 
    icon = hour .. ":" .. minute .. " " .. am_pm, 
    label = icons.separators.left .. " " .. date .. " " .. icons.calendar 
  }
end)
