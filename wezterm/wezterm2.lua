local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = '3024 Day'

config.font = wezterm.font('JetBrainsMono Nerd Font Mono')
config.font_size = 20
-- https://wezfurlong.org/wezterm/config/lua/config/freetype_load_target.html
config.freetype_load_target = 'Normal'

-- Tab Bar
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.colors = { tab_bar = {
    background = '#eae5e3',
    inactive_tab_edge = '#ddd7d5',
    active_tab = { bg_color = '#f6f1ed', fg_color = '#433e3d', intensity = 'Normal', underline = 'Single', italic = false, strikethrough = false, },
    inactive_tab = { bg_color = '#eae5e3', fg_color = '#5e5756', },
    inactive_tab_hover = { bg_color = '#f6f1ed', fg_color = '#46413f', italic = true, },
    new_tab = { bg_color = '#faf4f3', fg_color = '#5e5756', },
    new_tab_hover = { bg_color = '#ece7e5', fg_color = '#5e5756', italic = true, },
} }

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

config.keys = {
    { mods = 'CMD', key = '[', action = act.SendKey { mods = 'ALT', key = '[', } },
    { mods = 'CMD', key = '1', action = act.SendKey { mods = 'ALT', key = '1', } },
    { mods = 'LEADER', key = '1', action = act.ActivateTab(0) }
}

config.leader = { key = 'Escape', timeout_milliseconds = 1000 }
config.keys = {
    { mods = 'LEADER', key = '1', action = act.ActivateTab(0) },
    { mods = 'LEADER', key = '2', action = act.ActivateTab(1) },
    { mods = 'LEADER', key = '3', action = act.ActivateTab(2) },
    { mods = 'LEADER', key = '4', action = act.ActivateTab(3) },
    { mods = 'LEADER', key = '5', action = act.ActivateTab(4) },
    { mods = 'LEADER', key = '6', action = act.ActivateTab(5) },
    { mods = 'LEADER', key = '7', action = act.ActivateTab(6) },
    { mods = 'LEADER', key = '8', action = act.ActivateTab(7) },
    { mods = 'LEADER', key = '9', action = act.ActivateTab(8) },
    {
        key = 'a',
        mods = 'LEADER|CTRL',
        action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
    },
}

--config.debug_key_events = true

return config