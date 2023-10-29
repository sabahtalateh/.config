local wezterm = require('wezterm')
local act = wezterm.action

local font_size = 15.0
local font = wezterm.font('JetBrainsMono Nerd Font Mono')

local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.front_end = "OpenGL"

config.initial_rows = 40
config.initial_cols = 150
config.scrollback_lines = 3500

config.hide_mouse_cursor_when_typing = true

config.font = font
config.font_size = font_size
-- https://wezfurlong.org/wezterm/config/lua/config/freetype_load_target.html
config.freetype_load_target = 'Normal'
config.line_height = 0.9

config.color_scheme = '3024 Night'

config.force_reverse_video_cursor = true

-- Tab Bar
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 20
config.window_frame = { font = font, font_size = font_size - 1 }

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = { left = 0, right = 0, top = '0.25cell', bottom = 0 }
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20

config.keys = {
    -- Cmd + R: Clear screen
    { key = 'r', mods = 'CMD', action = act.ClearScrollback('ScrollbackAndViewport') },
}

--config.keys = {
--    { mods = 'CMD', key = '[', action = act.SendKey { mods = 'ALT', key = '[', } },
--    { mods = 'CMD', key = '1', action = act.SendKey { mods = 'ALT', key = '1', } },
--    { mods = 'LEADER', key = '1', action = act.ActivateTab(0) }
--}

--config.leader = { key = 'Escape', timeout_milliseconds = 1000 }
--config.keys = {
--    { mods = 'LEADER', key = '1', action = act.ActivateTab(0) },
--    { mods = 'LEADER', key = '2', action = act.ActivateTab(1) },
--    { mods = 'LEADER', key = '3', action = act.ActivateTab(2) },
--    { mods = 'LEADER', key = '4', action = act.ActivateTab(3) },
--    { mods = 'LEADER', key = '5', action = act.ActivateTab(4) },
--    { mods = 'LEADER', key = '6', action = act.ActivateTab(5) },
--    { mods = 'LEADER', key = '7', action = act.ActivateTab(6) },
--    { mods = 'LEADER', key = '8', action = act.ActivateTab(7) },
--    { mods = 'LEADER', key = '9', action = act.ActivateTab(8) },
--    {
--        key = 'a',
--        mods = 'LEADER|CTRL',
--        action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
--    },
--}

return config