-- Copyright (c) 2020 Kirazy
-- Part of Arachnophobia
--
-- See LICENSE.md in the project directory for license information.

local function create_label_sprite(hue)
    data:extend({
        {
            type = "sprite",
            name = "arachnophobia-eyes-color-"..hue,
            layers = {
                {
                    filename = arachnophobia.directory.."/sprites/eyes-gui-icon-base.png",
                    size = 40,
                    mipmap_count = 2,
                    flags = {"gui-icon"}
                },
                {
                    filename = arachnophobia.directory.."/sprites/eyes-gui-icon-mask.png",
                    size = 40,
                    tint = arachnophobia.eye_colors[hue].mask,
                    mipmap_count = 2,
                    flags = {"gui-icon"}
                },
                {
                    filename = arachnophobia.directory.."/sprites/eyes-gui-icon-highlights.png",
                    size = 40,
                    tint = arachnophobia.eye_colors[hue].highlights,
                    blend_mode = "additive-soft",
                    mipmap_count = 2,
                    flags = {"gui-icon"}
                }
            },
            flags = {"gui-icon"}
        }
    })
end

local function create_description_sprite(name, num)
    data:extend({
        {
            type = "sprite",
            name = "arachnophobia-light-guide-"..name.."-"..num,
            filename = arachnophobia.directory.."/sprites/light-guides/"..name.."/"..num..".png",
            size = 40,
            mipmap_count = 2,
            flags = {"gui-icon"},
        }
    })
end

for k, _ in pairs(arachnophobia.eye_colors) do
    create_label_sprite(k)
end

local description_sprites = {
    "back",
    "primary",
    "secondary",
    "tertiary",
}

for _, v in pairs(description_sprites) do
    for n = 1, 9 do
        create_description_sprite(v, n)
    end
end