-- Copyright (c) 2020 Kirazy
-- Part of Arachnophobia
--     
-- See LICENSE.md in the project directory for license information.

data:extend({
    {
        type = "string-setting",
        name = "arachnophobia-leg-visibility",
        setting_type = "startup",
        order = "a",
        default_value = "laser",
        allowed_values = {"hidden", "laser", "visible"}
    },
    {
        type = "int-setting",
        name = "arachnophobia-number-of-legs",
        setting_type = "startup",
        order = "b",
        default_value = 8,
        allowed_values = {2, 3, 4, 5, 6, 7, 8},
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
})