-- Copyright (c) 2024 Kirazy
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
    { leg = "-leg-1", mount_position = util.by_pixel(15, -22) },
    { leg = "-leg-2", mount_position = util.by_pixel(23, -10) },
    { leg = "-leg-3", mount_position = util.by_pixel(25, 4) },
    { leg = "-leg-4", mount_position = util.by_pixel(15, 17) },

    -- Left Side (Back to front)
    { leg = "-leg-5", mount_position = util.by_pixel(-15, -22) },
    { leg = "-leg-6", mount_position = util.by_pixel(-23, -10) },
    { leg = "-leg-7", mount_position = util.by_pixel(-25, 4) },
    { leg = "-leg-8", mount_position = util.by_pixel(-15, 17) },

    -- Center-line (Back to front)
    { leg = "-leg-5", mount_position = util.by_pixel(0, -24) },
}

local leg_configurations = {
    [2] = {
        {
            -- 3 (Right Fwd Middle)
            leg = leg_index[3].leg,
            ground_position = { 3, 0 },
            mount_position = leg_index[3].mount_position,
            walking_group = 1,
        },
        {
            -- 7 (Left Fwd Middle)
            leg = leg_index[7].leg,
            ground_position = { -3, 0 },
            mount_position = leg_index[7].mount_position,
            walking_group = 2,
        }
    },
    [3] = {
        {
            -- 3 (Right Fwd Middle)
            leg = leg_index[3].leg,
            ground_position = { 2.875, 1.625 },
            mount_position = leg_index[3].mount_position,
            walking_group = 1,
        },
        {
            -- 7 (Left Fwd Middle)
            leg = leg_index[7].leg,
            ground_position = { -2.875, 1.625 },
            mount_position = leg_index[7].mount_position,
            walking_group = 2,
        },
        {
            -- 9 (Rear Center)
            leg = leg_index[9].leg,
            ground_position = { 0, -3.25 },
            mount_position = leg_index[9].mount_position,
            walking_group = 1,
        },
    },
    [4] = {
        {
            -- 1 (Right Aft)
            leg = leg_index[1].leg,
            ground_position = { 2.625, -2 },
            mount_position = leg_index[1].mount_position,
            walking_group = 1,
        },
        {
            -- 4 (Right Fwd)
            leg = leg_index[4].leg,
            ground_position = { 2.625, 2 },
            mount_position = leg_index[4].mount_position,
            walking_group = 2,
        },
        {
            -- 5 (Left Aft)
            leg = leg_index[6].leg,
            ground_position = { -2.625, -2 },
            mount_position = leg_index[6].mount_position,
            walking_group = 2,
        },
        {
            -- 8 (Left Fwd)
            leg = leg_index[8].leg,
            ground_position = { -2.625, 2 },
            mount_position = leg_index[8].mount_position,
            walking_group = 1,
        },
    },
    [5] = {
        {
            -- 2 (Right Aft Middle)
            leg = leg_index[2].leg,
            ground_position = { 3, -1 },
            mount_position = leg_index[2].mount_position,
            walking_group = 1,
        },
        {
            -- 4 (Right Fwd)
            leg = leg_index[4].leg,
            ground_position = { 2, 2.75 },
            mount_position = leg_index[4].mount_position,
            walking_group = 2,
        },
        {
            -- 6 (Left Aft Middle)
            leg = leg_index[6].leg,
            ground_position = { -3, -1 },
            mount_position = leg_index[6].mount_position,
            walking_group = 2,
        },
        {
            -- 8 (Left Fwd)
            leg = leg_index[8].leg,
            ground_position = { -2, 2.75 },
            mount_position = leg_index[8].mount_position,
            walking_group = 1,
        },
        {
            -- 9 (Rear Center)
            leg = leg_index[9].leg,
            ground_position = { 0, -3.25 },
            mount_position = leg_index[9].mount_position,
            walking_group = 1,
        },
    },
    [6] = {
        {
            -- 2 (Right Aft Middle)
            leg = leg_index[2].leg,
            ground_position = { 2.25, -2.5 },
            mount_position = leg_index[2].mount_position,
            walking_group = 1,
        },
        {
            -- 3 (Right Fwd Middle)
            leg = leg_index[3].leg,
            ground_position = { 3.25, 0 },
            mount_position = leg_index[3].mount_position,
            walking_group = 2,
        },
        {
            -- 4 (Right Fwd)
            leg = leg_index[4].leg,
            ground_position = { 2.25, 2.5 },
            mount_position = leg_index[4].mount_position,
            walking_group = 1,
        },
        {
            -- 6 (Left Aft Middle)
            leg = leg_index[6].leg,
            ground_position = { -2.25, -2.5 },
            mount_position = leg_index[6].mount_position,
            walking_group = 2,
        },
        {
            -- 7 (Left Fwd Middle)
            leg = leg_index[7].leg,
            ground_position = { -3.25, 0 },
            mount_position = leg_index[7].mount_position,
            walking_group = 1,
        },
        {
            -- 8 (Left Fwd)
            leg = leg_index[8].leg,
            ground_position = { -2.25, 2.5 },
            mount_position = leg_index[8].mount_position,
            walking_group = 2,
        },
    },
    [7] = {
        {
            -- 2 (Right Aft Middle)
            leg = leg_index[2].leg,
            ground_position = { 2.625, -2 },
            mount_position = leg_index[2].mount_position,
            walking_group = 1,
        },
        {
            -- 3 (Right Fwd Middle)
            leg = leg_index[3].leg,
            ground_position = { 3, 0.75 },
            mount_position = leg_index[3].mount_position,
            walking_group = 2,
        },
        {
            -- 4 (Right Fwd)
            leg = leg_index[4].leg,
            ground_position = { 1.625, 3 },
            mount_position = leg_index[4].mount_position,
            walking_group = 1,
        },
        {
            -- 6 (Left Aft Middle)
            leg = leg_index[6].leg,
            ground_position = { -2.625, -2 },
            mount_position = leg_index[6].mount_position,
            walking_group = 2,
        },
        {
            -- 7 (Left Fwd Middle)
            leg = leg_index[7].leg,
            ground_position = { -3, 0.75 },
            mount_position = leg_index[7].mount_position,
            walking_group = 1,
        },
        {
            -- 8 (Left Fwd)
            leg = leg_index[8].leg,
            ground_position = { -1.625, 3 },
            mount_position = leg_index[8].mount_position,
            walking_group = 2,
        },
        {
            -- 9 (Rear Center)
            leg = leg_index[9].leg,
            ground_position = { 0, -3.25 },
            mount_position = leg_index[9].mount_position,
            walking_group = 3,
        },
    },
}

local function adjust_spidertron_legs(spidertron_name)
    -- Make adjustments to the legs
    for n = 1, 8 do
        local spider_leg = data.raw["spider-leg"][spidertron_name .. "-leg-" .. n]
        if not spider_leg then goto continue end

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
                            filename = "__arachnophobia__/graphics/spidertron-legs-lower-tip.png",
                            width = 34,
                            height = 112,
                            shift = util.by_pixel(0, -21),
                            draw_as_glow = true,
                            direction_count = 1,
                            scale = 0.75,
                        },
                    }
                },
                bottom_end_length = 1,
                middle = util.merge({ util.empty_sprite(), { direction_count = 1 } }),
                middle_offset_from_bottom = 0,
                middle_offset_from_top = 0,
                top_end = util.merge({ util.empty_sprite(), { direction_count = 1 } }),
                top_end_length = 0
            }
        end

        -- Silence the legs
        if settings.startup["arachnophobia-mute-legs"].value == true then
            spider_leg.working_sound = nil
        end

        -- Silence the feet
        if settings.startup["arachnophobia-mute-feet"].value == true then
            spider_leg.walking_sound_volume_modifier = 0
        end

        ::continue::
    end
end

-- Fetch the spidertron
local function adjust_footstep_particles(spidertron_name)
    local spidertron_entity = data.raw["spider-vehicle"][spidertron_name]
    if not spidertron_entity then return end

    -- Hide footstep particles
    if settings.startup["arachnophobia-display-dust-particles"].value == false then
        for leg, _ in pairs(spidertron_entity.spider_engine.legs) do
            spidertron_entity.spider_engine.legs[leg].leg_hit_the_ground_trigger = nil
        end
    end
end

-- Make adjustments to the number of legs and associated mount points
local function adjust_number_of_legs(spidertron_name)
    local spidertron_entity = data.raw["spider-vehicle"][spidertron_name]
    if not spidertron_entity then return end

    local num_legs = settings.startup["arachnophobia-number-of-legs"].value

    if num_legs == 8 then
        -- Make no changes
    else
        local legs = {}

        for _, leg_details in pairs(leg_configurations[num_legs]) do
            ---@type data.SpiderLegSpecification
            local leg = {
                leg = spidertron_name .. leg_details.leg,
                mount_position = leg_details.mount_position,
                ground_position = leg_details.ground_position,
                walking_group = leg_details.walking_group,
                leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger(),
            }

            table.insert(legs, leg)
        end

        spidertron_entity.spider_engine.legs = legs
    end
end

local function adjust_spidertron_icons(spidertron_name)
    -- Fetch the rest of the spidertron prototypes
    local spidertron_item = data.raw["item-with-entity-data"][spidertron_name]
    local spidertron_entity = data.raw["spider-vehicle"][spidertron_name]
    local spidertron_explosion = data.raw["explosion"][spidertron_name .. "-explosion"]
    local spidertron_remnant = data.raw["corpse"][spidertron_name .. "-remnants"]
    local spidertron_technology = data.raw["technology"][spidertron_name]

    -- Set icon path
    local spidertron_icon_path = "__arachnophobia__/graphics/icons/temporary-icon.png"
    local spidertron_technology_icon_path = "__arachnophobia__/graphics/technology/temporary-tech-icon.png"

    -- Assign the icons
    if spidertron_entity then
        spidertron_entity.icon = spidertron_icon_path
        spidertron_entity.icons = nil
        spidertron_entity.icon_size = 64
    end

    if spidertron_item then
        spidertron_item.icon = spidertron_icon_path
        spidertron_item.icons = nil
        spidertron_item.icon_size = 64
    end

    if spidertron_explosion then
        spidertron_explosion.icon = spidertron_icon_path
        spidertron_explosion.icons = nil
        spidertron_explosion.icon_size = 64
    end

    if spidertron_remnant then
        spidertron_remnant.icon = spidertron_icon_path
        spidertron_remnant.icons = nil
        spidertron_remnant.icon_size = 64
    end

    if spidertron_technology then
        spidertron_technology.icon = spidertron_technology_icon_path
        spidertron_technology.icons = nil
        spidertron_technology.icon_size = 128
    end
end

local spidertron_names = {
    "spidertron",
    "constructron",
}

for _, spidertron_name in pairs(spidertron_names) do
    adjust_spidertron_legs(spidertron_name)
    adjust_footstep_particles(spidertron_name)
    adjust_number_of_legs(spidertron_name)

    if settings.startup["arachnophobia-replace-icons"].value == true then
        adjust_spidertron_icons(spidertron_name)
    end
end

-- -- Figure out what icon we need to use
-- local icon_base = "__arachnophobia__/graphics/icons/spidertron-icon-"
-- local technology_icon_base = "__arachnophobia__/graphics/technology/spidertron-technology-"
-- local spidertron_icon_path, spidertron_technology_icon_path

-- if settings.startup["arachnophobia-leg-visibility"].value == "hidden" then
--     spidertron_icon_path = icon_base.."hidden.png"
--     spidertron_technology_icon_path = technology_icon_base.."hidden.png"
-- elseif settings.startup["arachnophobia-leg-visibility"].value == "laser" then
--     spidertron_icon_path = icon_base.."laser-pointer-"..num_legs..".png"
--     spidertron_technology_icon_path = technology_icon_base.."laser-pointer-"..num_legs..".png"
-- elseif settings.startup["arachnophobia-leg-visibility"].value == "visible" then
--     spidertron_icon_path = icon_base.."visible-"..num_legs..".png"
--     spidertron_technology_icon_path = technology_icon_base.."visible-"..num_legs..".png"
-- else
--     return -- We should never get here, but on the off chance we do, don't do anything more.
-- end
