local wezterm = require 'wezterm'
local config = {}

config.default_domain = 'WSL:Ubuntu'

config.font = wezterm.font 'JetBrains Mono'

config.color_scheme = 'Vs Code Dark+ (Gogh)'

config.colors = {
    cursor_bg = '#808080',
}

config.keys = {
    {
        key = 'Enter',
        mods = 'CTRL',
        action = wezterm.action.SplitHorizontal{domain='DefaultDomain'},
    },
    {
        key = '{',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection 'Prev',
    },
    {
        key = '}',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection 'Next',
    },
    {
        key = 'h',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
        key = 'l',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
        key = 'k',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
        key = 'j',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },
}

return config
