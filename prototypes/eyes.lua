-- Copyright (c) 2023 Kirazy
-- Part of Arachnophobia
--
-- See LICENSE.md in the project directory for license information.

-- Index of eye colors
arachnophobia.eye_colors = {
    ["0"] = { mask = util.color("ff0000"), highlights = util.color("ff8080") },
    ["30"] = { mask = util.color("ff8000"), highlights = util.color("ffbf80") },
    ["60"] = { mask = util.color("ffff00"), highlights = util.color("ffff80") },
    ["90"] = { mask = util.color("80ff00"), highlights = util.color("bfff80") },
    ["120"] = { mask = util.color("00ff00"), highlights = util.color("80ff80") },
    ["150"] = { mask = util.color("00ff80"), highlights = util.color("80ffbf") },
    ["180"] = { mask = util.color("00ffff"), highlights = util.color("80ffff") },
    ["210"] = { mask = util.color("0080ff"), highlights = util.color("80bfff") },
    ["240"] = { mask = util.color("0000ff"), highlights = util.color("8080ff") },
    ["270"] = { mask = util.color("8000ff"), highlights = util.color("bf80ff") },
    ["300"] = { mask = util.color("ff00ff"), highlights = util.color("ff80ff") },
    ["330"] = { mask = util.color("ff0080"), highlights = util.color("ff80bf") },
    ["white"] = { mask = util.color("ffffff"), highlights = util.color("ffffff00") },
}

-- Fetch the spidertron and current eye color
local hue = settings.startup["arachnophobia-eyes-color"].value
local spidertron = data.raw["spider-vehicle"]["spidertron"].graphics_set

-- Fetch settings
local eyes = {
    ["primary"] = settings.startup["arachnophobia-eyes-primary"].value,
    ["secondary"] = settings.startup["arachnophobia-eyes-secondary"].value,
    ["tertiary"] = settings.startup["arachnophobia-eyes-tertiary"].value,
    ["back"] = settings.startup["arachnophobia-eyes-back"].value,
}

-- For all eyes and the color red, leave the Spidertron alone
if (eyes.primary and eyes.secondary and eyes.tertiary and eyes.back and hue == "0") then return end

-- Reskin the torso
spidertron.animation = {
    layers = {
        -- Base
        {
            filename = arachnophobia.directory .. "/spidertron-body.png",
            width = 66,
            height = 70,
            line_length = 8,
            direction_count = 64,
            shift = util.by_pixel(0, -19),
            hr_version = {
                filename = arachnophobia.directory .. "/hr-spidertron-body.png",
                width = 132,
                height = 138,
                line_length = 8,
                direction_count = 64,
                shift = util.by_pixel(0, -19),
                scale = 0.5,
            }
        },
    }
}

local function insert_eye_layers(name)
    -- Mask
    table.insert(spidertron.animation.layers, {
        filename = arachnophobia.directory .. "/eyes/spidertron-eyes-" .. name .. "-mask.png",
        width = 66,
        height = 70,
        line_length = 8,
        direction_count = 64,
        tint = arachnophobia.eye_colors[hue].mask,
        shift = util.by_pixel(0, -19),
        hr_version = {
            filename = arachnophobia.directory .. "/eyes/hr-spidertron-eyes-" .. name .. "-mask.png",
            width = 132,
            height = 138,
            line_length = 8,
            direction_count = 64,
            tint = arachnophobia.eye_colors[hue].mask,
            shift = util.by_pixel(0, -19),
            scale = 0.5,
        }
    })

    -- Highlights
    table.insert(spidertron.animation.layers, {
        filename = arachnophobia.directory .. "/eyes/spidertron-eyes-" .. name .. "-highlights.png",
        width = 66,
        height = 70,
        line_length = 8,
        direction_count = 64,
        tint = arachnophobia.eye_colors[hue].highlights,
        blend_mode = "additive-soft",
        shift = util.by_pixel(0, -19),
        hr_version = {
            filename = arachnophobia.directory .. "/eyes/hr-spidertron-eyes-" .. name .. "-highlights.png",
            width = 132,
            height = 138,
            line_length = 8,
            direction_count = 64,
            tint = arachnophobia.eye_colors[hue].highlights,
            blend_mode = "additive-soft",
            shift = util.by_pixel(0, -19),
            scale = 0.5,
        }
    })
end

-- Setup the eye colors
if (eyes.primary and eyes.secondary and eyes.tertiary and eyes.back) then
    -- We want all the eyes, use the simple spritesheet
    insert_eye_layers("all")
else
    -- Primary
    if eyes.primary then
        insert_eye_layers("front-primary")
    else
        -- Turn off the cone lights
        spidertron.light[2] = nil

        -- Turn off the light illumination6
        spidertron.light_positions[2] = nil
    end

    -- Secondary
    if eyes.secondary then
        insert_eye_layers("front-secondary")
    else
        -- Turn off the cone lights
        if not eyes.tertiary then
            spidertron.light[3] = nil -- Shared with tertiary lights
        end
        spidertron.light[4] = nil

        -- Turn off the light illumination
        spidertron.light_positions[1] = nil
        spidertron.light_positions[9] = nil
    end

    -- Tertiary
    if eyes.tertiary then
        insert_eye_layers("front-tertiary")
    else
        -- Turn off the cone lights
        if not eyes.secondary then
            spidertron.light[3] = nil -- Shared with secondary lights
        end
        spidertron.light[5] = nil

        -- Turn off the light illumination
        spidertron.light_positions[0] = nil
        spidertron.light_positions[7] = nil
        spidertron.light_positions[8] = nil
    end

    -- Back
    if eyes.back then
        insert_eye_layers("back")
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
    width = 66,
    height = 50,
    line_length = 8,
    direction_count = 64,
    apply_runtime_tint = true,
    shift = util.by_pixel(0, -14),
    hr_version = {
        filename = "__base__/graphics/entity/spidertron/torso/hr-spidertron-body-mask.png",
        width = 130,
        height = 100,
        line_length = 8,
        direction_count = 64,
        apply_runtime_tint = true,
        shift = util.by_pixel(0, -14),
        scale = 0.5,
    }
})
