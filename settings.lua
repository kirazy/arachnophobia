-- Copyright (c) 2020 Kirazy
-- Part of Arachnophobia
--
-- See LICENSE.md in the project directory for license information.

data:extend({
    -- Configure the number of legs
    {
        type = "int-setting",
        name = "arachnophobia-number-of-legs",
        setting_type = "startup",
        order = "ab",
        default_value = 8,
        allowed_values = {2, 3, 4, 5, 6, 7, 8},
    },

    -- Configure leg display properties
    {
        type = "string-setting",
        name = "arachnophobia-leg-visibility",
        setting_type = "startup",
        order = "b",
        default_value = "laser",
        allowed_values = {"hidden", "laser", "visible"}
    },
    {
        type = "bool-setting",
        name = "arachnophobia-display-dust-particles",
        setting_type = "startup",
        order = "c",
        default_value = false,
    },
    {
        type = "bool-setting",
        name = "arachnophobia-mute-legs",
        setting_type = "startup",
        order = "c",
        default_value = true,
    },
    {
        type = "bool-setting",
        name = "arachnophobia-mute-feet",
        setting_type = "startup",
        order = "c",
        default_value = true,
    },

    -- Configure eye properties
    {
        type = "string-setting",
        name = "arachnophobia-eyes-color",
        setting_type = "startup",
        order = "d",
        default_value = "0",
        allowed_values = {"0", "30", "60", "90", "120", "150", "180", "210", "240", "270", "300", "330", "white"}
    },
    {
        type = "bool-setting",
        name = "arachnophobia-eyes-primary",
        setting_type = "startup",
        order = "da",
        default_value = true,
    },
    {
        type = "bool-setting",
        name = "arachnophobia-eyes-secondary",
        setting_type = "startup",
        order = "db",
        default_value = true,
    },
    {
        type = "bool-setting",
        name = "arachnophobia-eyes-tertiary",
        setting_type = "startup",
        order = "dc",
        default_value = true,
    },
    {
        type = "bool-setting",
        name = "arachnophobia-eyes-back",
        setting_type = "startup",
        order = "dd",
        default_value = true,
    },

    -- Icon settings
    {
        type = "bool-setting",
        name = "arachnophobia-replace-icons",
        setting_type = "startup",
        order = "e",
        default_value = false,
    },
})