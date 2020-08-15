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

    -- Optionally display laser feet
    if settings.startup["arachnophobia-display-laser-feet"].value == true then
        spider_leg.graphics_set.lower_part = {
            bottom_end = {
                layers = {
                    {
                        filename = "__arachnophobia__/graphics/spidertron-legs-lower-tip.png",
                        width = 18,
                        height = 56,
                        shift = util.by_pixel(0, -21),
                        hr_version = {
                            filename = "__arachnophobia__/graphics/hr-spidertron-legs-lower-tip.png",
                            width = 34,
                            height = 112,
                            shift = util.by_pixel(0, -21),
                        }
                    },
                    -- Illuminate the laser light, pending support in base game
                    -- {
                    --     filename = "__arachnophobia__/graphics/spidertron-legs-lower-tip-light.png",
                    --     width = 18,
                    --     height = 56,
                    --     shift = util.by_pixel(0, -21),
                    --     draw_as_sprite = false,
                    --     draw_as_light = true,
                    --     hr_version = {
                    --         filename = "__arachnophobia__/graphics/hr-spidertron-legs-lower-tip-light.png",
                    --         width = 34,
                    --         height = 112,
                    --         shift = util.by_pixel(0, -21),
                    --         draw_as_sprite = false,
                    --         draw_as_light = true,
                    --     }
                    -- }
                }
            },
            bottom_end_length = 1,
            middle = util.empty_sprite(),
            middle_offset_from_bottom = 0.65,
            middle_offset_from_top = 0.45,
            top_end = util.empty_sprite(),
            top_end_length = 1
        }
    else
        -- Hide footstep particles and sounds
        spidertron.spider_engine.legs[n].leg_hit_the_ground_trigger = nil
        
    end

    -- Silence the legs
    spider_leg.working_sound = nil
end