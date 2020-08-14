-- Copyright (c) 2020 Kirazy
-- Part of Arachnophobia
--     
-- See LICENSE.md in the project directory for license information.

local sprite_fields = {
    "upper_part",
    "lower_part",
    "upper_part_shadow",
    "lower_part_shadow",
    "upper_part_water_reflection",
    "lower_part_water_reflection",
    "joint",
    "joint_shadow",
}

local function sanitize_spidertron_legs(leg)
    -- Fetch the leg
    spider_leg = data.raw["spider-leg"]["spidertron-leg-"..leg]

    -- Iterate through the graphics set and eliminate the sprite fields
    for _, field in pairs(sprite_fields) do
        spider_leg.graphics_set[field] = nil
    end
end

-- Cleanup all the legs
for n = 1, 8 do
    sanitize_spidertron_legs(n)
end