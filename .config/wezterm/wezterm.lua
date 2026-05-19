local wezterm = require 'wezterm'
local config = {}

-- config.default_prog = { "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe" }
config.default_domain = 'WSL:Ubuntu'

config.font = wezterm.font 'JetBrains Mono'
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.color_scheme = 'Vs Code Dark+ (Gogh)'

config.colors = {
    cursor_bg = '#808080',
}

config.default_cwd = "C:/Users/forded/Documents/sioux/projects"

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
    {
        key = 'p',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SpawnCommandInNewTab {
            args = { "powershell.exe" },
            domain = { DomainName = "local" },
    	},
    },
}

return config
