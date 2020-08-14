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

local spidertron = data.raw["spider-vehicle"]["spidertron"]

-- Cleanup all the legs
for n = 1, 8 do
    -- Fetch the leg
    spider_leg = data.raw["spider-leg"]["spidertron-leg-"..n]

    -- Iterate through the graphics set and eliminate the sprite fields
    for _, field in pairs(sprite_fields) do
        spider_leg.graphics_set[field] = nil
    end

    -- Silence the legs
    spider_leg.working_sound = nil

    -- Hide footstep particles
    spidertron.spider_engine.legs[n].leg_hit_the_ground_trigger = nil
end