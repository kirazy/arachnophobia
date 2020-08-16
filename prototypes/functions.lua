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

-- Index of standard legs and mount positions
local leg_index = {
    -- Right Side (Back to front)
    {leg = "spidertron-leg-1", mount_position = util.by_pixel(15, -22)},
    {leg = "spidertron-leg-2", mount_position = util.by_pixel(23, -10)},
    {leg = "spidertron-leg-3", mount_position = util.by_pixel(25, 4)},
    {leg = "spidertron-leg-4", mount_position = util.by_pixel(15, 17)},

    -- Left Side (Back to front)
    {leg = "spidertron-leg-5", mount_position = util.by_pixel(-15, -22)},
    {leg = "spidertron-leg-6", mount_position = util.by_pixel(-23, -10)},
    {leg = "spidertron-leg-7", mount_position = util.by_pixel(-25, 4)},
    {leg = "spidertron-leg-8", mount_position = util.by_pixel(-15, 17)},

    -- Center-line (Back to front)
    {leg = "spidertron-leg-5", mount_position = util.by_pixel(0, -24)}, -- Rear
    {leg = "spidertron-leg-8", mount_position = util.by_pixel(0, 0)}, -- Center
}

local leg_configurations = {
    ["leg-1"] = {
        { -- 10
            leg = leg_index[10].leg,
            blocking_legs = {1},
            ground_position = {0, 0},
            mount_position = leg_index[10].mount_position,
        }
    },
    ["leg-2"] = {
        { -- 3
            leg = leg_index[3].leg,
            ground_position = {3, 0}, 
            blocking_legs = {2},
            mount_position = leg_index[3].mount_position,
        },
        { -- 7
            leg = leg_index[7].leg,
            ground_position = {-3, 0},
            blocking_legs = {1},
            mount_position = leg_index[7].mount_position,

        }
    },
    ["leg-3"] = {
        { -- 3
            leg = leg_index[3].leg,
            ground_position = {2.875, 1.625},
            blocking_legs = {3},
            mount_position = leg_index[3].mount_position,
        },
        { -- 7
            leg = leg_index[7].leg,
            ground_position = {-2.875, 1.625},
            blocking_legs = {3},
            mount_position = leg_index[7].mount_position,
        },
        { -- 9
            leg = leg_index[9].leg,
            ground_position = {0, -3.25},
            blocking_legs = {1, 2},
            mount_position = leg_index[9].mount_position,
        },
    },
    ["leg-4"] = {
        { -- 1
            leg = leg_index[1].leg,
            ground_position = {2.625, -2},
            blocking_legs = {2},
            mount_position = leg_index[1].mount_position,
        },
        { -- 4
            leg = leg_index[4].leg,
            ground_position = {2.625, 2},
            blocking_legs = {1},
            mount_position = leg_index[4].mount_position,
        },
        { -- 5
            leg = leg_index[6].leg,
            ground_position = {-2.625, -2},
            blocking_legs = {4},
            mount_position = leg_index[6].mount_position,
        },
        { -- 8
            leg = leg_index[8].leg,
            ground_position = {-2.625, 2},
            blocking_legs = {3},
            mount_position = leg_index[8].mount_position,
        },
    },
    ["leg-5"] = {
        { -- 2
            leg = leg_index[2].leg,
            ground_position = {3, -1},
            blocking_legs = {5, 2},
            mount_position = leg_index[2].mount_position,
        },
        { -- 4
            leg = leg_index[4].leg,
            ground_position = {2, 2.75},
            blocking_legs = {1},
            mount_position = leg_index[4].mount_position,
        },
        { -- 6
            leg = leg_index[6].leg,
            ground_position = {-3, -1},
            blocking_legs = {5, 4},
            mount_position = leg_index[6].mount_position,
        },
        { -- 8
            leg = leg_index[8].leg,
            ground_position = {-2, 2.75},
            blocking_legs = {3},
            mount_position = leg_index[8].mount_position,
        },
        { -- 9
            leg = leg_index[9].leg,
            ground_position = {0, -3.25},
            blocking_legs = {1, 3},
            mount_position = leg_index[9].mount_position,
        },
    },
    ["leg-6"] = {
        { -- 2
            leg = leg_index[2].leg,
            ground_position = {2.25, -2.5},
            blocking_legs = {2},
            mount_position = leg_index[2].mount_position,
        },
        { -- 3
            leg = leg_index[3].leg,
            ground_position = {3.25, 0},
            blocking_legs = {1, 3},
            mount_position = leg_index[3].mount_position,
        },
        { -- 4
            leg = leg_index[4].leg,
            ground_position = {2.25, 2.5},
            blocking_legs = {2},
            mount_position = leg_index[4].mount_position,
        },
        { -- 6
            leg = leg_index[6].leg,
            ground_position = {-2.25, -2.5},
            blocking_legs = {5},
            mount_position = leg_index[6].mount_position,
        },
        { -- 7
            leg = leg_index[7].leg,
            ground_position = {-3.25, 0},
            blocking_legs = {4, 6},
            mount_position = leg_index[7].mount_position,
        },
        { -- 8
            leg = leg_index[8].leg,
            ground_position = {-2.25, 2.5},
            blocking_legs = {5},
            mount_position = leg_index[8].mount_position,
        },
    }, 
    ["leg-7"] = {
        { -- 2
            leg = leg_index[2].leg,
            ground_position = {2.625, -2},
            blocking_legs = {2},
            mount_position = leg_index[2].mount_position,
        },
        { -- 3
            leg = leg_index[3].leg,
            ground_position = {3, 0.75},
            blocking_legs = {1, 3},
            mount_position = leg_index[3].mount_position,
        },
        { -- 4
            leg = leg_index[4].leg,
            ground_position = {1.625, 3},
            blocking_legs = {2},
            mount_position = leg_index[4].mount_position,
        },
        { -- 6
            leg = leg_index[6].leg,
            ground_position = {-2.625, -2},
            blocking_legs = {5},
            mount_position = leg_index[6].mount_position,
        },
        { -- 7
            leg = leg_index[7].leg,
            ground_position = {-3, 0.75},
            blocking_legs = {4, 6},
            mount_position = leg_index[7].mount_position,
        },
        { -- 8
            leg = leg_index[8].leg,
            ground_position = {-1.625, 3},
            blocking_legs = {5},
            mount_position = leg_index[8].mount_position,
        },
        { -- 9
            leg = leg_index[9].leg,
            ground_position = {0, -3.25},
            blocking_legs = {1, 2},
            mount_position = leg_index[9].mount_position,
        },
    },
    ["leg-8"] = {
        { -- 1
            leg = leg_index[1].leg,
            ground_position = {2.25, -2.5},
            blocking_legs = {2},
            mount_position = leg_index[1].mount_position,
        },
        { -- 2
            leg = leg_index[2].leg,
            ground_position = {3, -1}, 
            blocking_legs = {1, 3},
            mount_position = leg_index[2].mount_position,
        },
        { -- 3
            leg = leg_index[3].leg,
            ground_position = {3, 1},
            blocking_legs = {2, 4},
            mount_position = leg_index[3].mount_position,
        },
        { -- 4
            leg = leg_index[4].leg,
            ground_position = {2.25, 2.5},
            blocking_legs = {3},
            mount_position = leg_index[4].mount_position,
        },
        { -- 5
            leg = leg_index[5].leg,
            ground_position = {-2.25, -2.5},
            blocking_legs = {6},
            mount_position = leg_index[5].mount_position,
        },
        { -- 6
            leg = leg_index[6].leg,
            ground_position = {-3, -1},
            blocking_legs = {5, 7}, 
            mount_position = leg_index[6].mount_position,
        },
        { -- 7
            leg = leg_index[7].leg,
            ground_position = {-3, 1},
            blocking_legs = {6, 8},
            mount_position = leg_index[7].mount_position,
        },
        { -- 8
            leg = leg_index[8].leg,
            ground_position = {-2.25, 2.5},
            blocking_legs = {7}, 
            mount_position = leg_index[8].mount_position,
        }
    }
}

-- Fetch the spidertron
local spidertron_entity = data.raw["spider-vehicle"]["spidertron"]

-- Make adjustments to the legs
for n = 1, 8 do
    -- Fetch the leg
    spider_leg = data.raw["spider-leg"]["spidertron-leg-"..n]

    -- Hide the legs
    if settings.startup["arachnophobia-leg-visibility"].value ~= "visible" then
        -- Iterate through the graphics set and eliminate the sprite fields
        for _, field in pairs(sprite_fields) do
            spider_leg.graphics_set[field] = nil
        end
    end

    -- Display laser-pointers at the feet of each leg
    if settings.startup["arachnophobia-leg-visibility"].value == "laser" then
        spider_leg.graphics_set.lower_part = {
            bottom_end = {
                layers = {
                    {
                        filename = "__arachnophobia__/graphics/hr-spidertron-legs-lower-tip.png",
                        width = 34,
                        height = 112,
                        shift = util.by_pixel(0, -21),
                        scale = 0.75,
                    },
                    -- Illuminate the laser light, pending support in base game
                    -- {
                    --     filename = "__arachnophobia__/graphics/hr-spidertron-legs-lower-tip-light.png",
                    --     width = 34,
                    --     height = 112,
                    --     shift = util.by_pixel(0, -21),
                    --     draw_as_sprite = false,
                    --     draw_as_light = true,
                    --     scale = 0.75,
                    -- }
                }
            },
            bottom_end_length = 1,
            middle = util.empty_sprite(),
            middle_offset_from_bottom = 0,
            middle_offset_from_top = 0,
            top_end = util.empty_sprite(),
            top_end_length = 0
        }
    end

    -- Silence the legs
    if settings.startup["arachnophobia-mute-legs"].value == true then
        spider_leg.working_sound = nil
    end
end

-- Make adjustments to the number of legs and associated mount points
local num_legs = settings.startup["arachnophobia-number-of-legs"].value

-- Clear the legs table
spidertron_entity.spider_engine.legs = {}

for _, leg_details in pairs(leg_configurations["leg-"..num_legs]) do
    local leg = {
        leg = leg_details.leg,
        mount_position = leg_details.mount_position,
        ground_position = leg_details.ground_position,
        blocking_legs = leg_details.blocking_legs,
        leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
    }

    table.insert(spidertron_entity.spider_engine.legs, leg)
end

-- Hide footstep particles
if settings.startup["arachnophobia-display-dust-particles"].value == false then
    for leg, _ in pairs(spidertron_entity.spider_engine.legs) do
        spidertron_entity.spider_engine.legs[leg].leg_hit_the_ground_trigger = nil
    end
end

-- Fetch the rest of the spidertron prototypes
local spidertron_item = data.raw["item"]["spidertron"]
local spidertron_explosion = data.raw["explosion"]["spidertron-explosion"]
local spidertron_remnant = data.raw["corpse"]["spidertron-remnant"]
local spidertron_technology = data.raw["technology"]["spidertron"]

-- Figure out what icon we need to use
local icon_base = "__arachnophobia__/graphics/icons/spidertron-icon-"
local technology_icon_base = "__arachnophobia__/graphics/technology/spidertron-technology-"
local spidertron_icon_path, spidertron_technology_icon_path

if settings.startup["arachnophobia-leg-visibility"].value == "hidden" then
    spidertron_icon_path = icon_base.."hidden.png"
    spidertron_technology_icon_path = technology_icon_base.."hidden.png"
elseif settings.startup["arachnophobia-leg-visibility"].value == "laser" then
    spidertron_icon_path = icon_base.."laser-pointer-"..num_legs..".png"
    spidertron_technology_icon_path = technology_icon_base.."laser-pointer-"..num_legs..".png"
elseif settings.startup["arachnophobia-leg-visibility"].value == "visible" then
    spidertron_icon_path = icon_base.."visible-"..num_legs..".png"
    spidertron_technology_icon_path = technology_icon_base.."visible-"..num_legs..".png"
else
    return -- We should never get here, but on the off chance we do, don't do anything more.
end

-- Assign the icons
-- spidertron_item.icon = spidertron_icon_path
-- spidertron_item.icons = nil
-- spidertron_item.icon_size = 64
-- spidertron_item.icon_mipmaps = 4

-- spidertron_explosion.icon = spidertron_icon_path
-- spidertron_explosion.icons = nil
-- spidertron_explosion.icon_size = 64
-- spidertron_explosion.icon_mipmaps = 4

-- spidertron_remnant.icon = spidertron_icon_path
-- spidertron_remnant.icons = nil
-- spidertron_remnant.icon_size = 64
-- spidertron_remnant.icon_mipmaps = 4

-- spidertron_technology.icon = spidertron_technology_icon_path
-- spidertron_technology.icons = nil
-- spidertron_technology.icon_size = 128
-- spidertron_technology.icon_mipmaps = nil