-- Copyright (c) 2024 Kirazy
-- Part of Arachnophobia
--
-- See LICENSE.md in the project directory for license information.

local eye_colors = require("eye_colors")

--- Replaces the body sprite of a spidertron using the standard graphics set
--- with a tintable base sprite.
---@param spidertron data.SpiderVehicleGraphicsSet
local function replace_body_with_tintable_base(spidertron)
spidertron.animation = {
    layers = {
        -- Base
        {
            filename = "__arachnophobia__/graphics/spidertron-body.png",
            width = 132,
            height = 138,
            line_length = 8,
            direction_count = 64,
            shift = util.by_pixel(0, -19),
            scale = 0.5,
        },
    }
}
end

---comment
---@param spidertron data.SpiderVehicleGraphicsSet
---@param eyes_layer_name "all"|"front-primary"|"front-secondary"|"front-tertiary"|"back"
---@param eyes_hue SpiderEyeHue
local function insert_eye_layers(spidertron, eyes_layer_name, eyes_hue)
    -- Mask
    table.insert(spidertron.animation.layers, {
        filename = "__arachnophobia__/graphics/eyes/spidertron-eyes-" .. eyes_layer_name .. "-mask.png",
        width = 132,
        height = 138,
        line_length = 8,
        direction_count = 64,
        tint = eye_colors[eyes_hue].mask,
        shift = util.by_pixel(0, -19),
        scale = 0.5,
    })

    -- Highlights
    table.insert(spidertron.animation.layers, {
        filename = "__arachnophobia__/graphics/eyes/spidertron-eyes-" .. eyes_layer_name .. "-highlights.png",
        width = 132,
        height = 138,
        line_length = 8,
        direction_count = 64,
        tint = eye_colors[eyes_hue].highlights,
        blend_mode = "additive-soft",
        shift = util.by_pixel(0, -19),
        scale = 0.5,
    })
end

---comment
---@param spidertron data.SpiderVehicleGraphicsSet
---@param eyes_state SpiderEyeState
---@param eyes_hue SpiderEyeHue
local function adjust_spidertron_eyes_and_lights(spidertron, eyes_state, eyes_hue)
    if (eyes_state.primary and eyes_state.secondary and eyes_state.tertiary and eyes_state.back) then
    -- We want all the eyes, use the simple spritesheet
        insert_eye_layers(spidertron, "all", eyes_hue)
    else
        -- Primary
            if eyes_state.primary then
                insert_eye_layers(spidertron, "front-primary", eyes_hue)
        else
            -- Turn off the cone lights
            spidertron.light[2] = nil

            -- Turn off the light illumination6
            spidertron.light_positions[2] = nil
        end

        -- Secondary
            if eyes_state.secondary then
                insert_eye_layers(spidertron, "front-secondary", eyes_hue)
        else
            -- Turn off the cone lights
                if not eyes_state.tertiary then
                spidertron.light[3] = nil -- Shared with tertiary lights
            end
            spidertron.light[4] = nil

            -- Turn off the light illumination
            spidertron.light_positions[1] = nil
            spidertron.light_positions[9] = nil
        end

        -- Tertiary
            if eyes_state.tertiary then
                insert_eye_layers(spidertron, "front-tertiary", eyes_hue)
        else
            -- Turn off the cone lights
                if not eyes_state.secondary then
                spidertron.light[3] = nil -- Shared with secondary lights
            end
            spidertron.light[5] = nil

            -- Turn off the light illumination
            spidertron.light_positions[0] = nil
            spidertron.light_positions[7] = nil
            spidertron.light_positions[8] = nil
        end

        -- Back
            if eyes_state.back then
                insert_eye_layers(spidertron, "back", eyes_hue)
        else
            -- Turn off the light illumination
            spidertron.light_positions[3] = nil
            spidertron.light_positions[4] = nil
            spidertron.light_positions[5] = nil
            spidertron.light_positions[6] = nil
            spidertron.light_positions[10] = nil
        end
    end

    -- Reconstruct the light and light_positions tables
    local new_light = {}
    for _, value in pairs(spidertron.light) do
        table.insert(new_light, value)
    end
    spidertron.light = new_light

    local new_light_positions = {}
    for _, value in pairs(spidertron.light_positions) do
        table.insert(new_light_positions, value)
    end
    spidertron.light_positions = new_light_positions

    -- Insert the runtime mask
    table.insert(spidertron.animation.layers, {
        filename = "__base__/graphics/entity/spidertron/torso/spidertron-body-mask.png",
        width = 130,
        height = 100,
        line_length = 8,
        direction_count = 64,
        apply_runtime_tint = true,
        shift = util.by_pixel(0, -14),
        scale = 0.5,
    })
end


---@type SpiderEyeHue
local eyes_hue = settings.startup["arachnophobia-eyes-color"].value

---@type SpiderEyeState
local eyes_state = {
    primary = settings.startup["arachnophobia-eyes-primary"].value,
    secondary = settings.startup["arachnophobia-eyes-secondary"].value,
    tertiary = settings.startup["arachnophobia-eyes-tertiary"].value,
    back = settings.startup["arachnophobia-eyes-back"].value,
}

-- For all eyes and the color red, leave the Spidertron alone
if (eyes_state.primary and eyes_state.secondary and eyes_state.tertiary and eyes_state.back and eyes_hue == "0") then
    return
end

-- Reskin the spidertron torsos
local spidertrons = {
    "spidertron",
}

if mods["Constructron-Continued"] then
    table.insert(spidertrons, "constructron")
end

for _, name in pairs(spidertrons) do
    local entity = data.raw["spider-vehicle"][name]
    if entity then
        replace_body_with_tintable_base(entity.graphics_set)
        adjust_spidertron_eyes_and_lights(entity.graphics_set, eyes_state, eyes_hue)
    end
end
