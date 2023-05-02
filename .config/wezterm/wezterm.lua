local wezterm = require 'wezterm'
local config = {}

config.default_domain = 'WSL:Ubuntu'

config.font = wezterm.font 'JetBrains Mono'

config.color_scheme = 'Vs Code Dark+ (Gogh)'

config.keys = {
    {
        key = 'Enter',
        mods = 'CTRL',
        action = wezterm.action.SplitHorizontal{domain='DefaultDomain'},
    },
    {
        key = 'h',
        mods = 'CTRL',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
        key = 'l',
        mods = 'CTRL',
        action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
        key = 'k',
        mods = 'CTRL',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
        key = 'j',
        mods = 'CTRL',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },
}

return config
