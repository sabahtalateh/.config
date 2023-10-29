local config = require('common')
local wezterm = require('wezterm')
local act = wezterm.action

config.color_scheme = 'Spring'

config.window_decorations = 'RESIZE'
config.window_background_opacity = 1.0

config.use_fancy_tab_bar = false

config.colors = {
    tab_bar = {
        background = '#fdf8f4',
        active_tab = { bg_color = '#fdf8f4', fg_color = '#494441', underline = 'None', },
        inactive_tab = { bg_color = '#d6c9c2', fg_color = '#494441' },
        inactive_tab_hover = { bg_color = '#fdf8f4', fg_color = '#494441' },
        new_tab = { bg_color = '#fdf8f4', fg_color = '#494441' },
        new_tab_hover = { bg_color = '#fdf8f4', fg_color = '#494441' },
    }
}

table.insert(config.keys, { mods = 'CMD', key = '1', action = act.SendKey { mods = 'ALT', key = '1', } })
table.insert(config.keys, { mods = 'CMD', key = '/', action = act.SendKey { mods = 'ALT', key = '/', } })

return config