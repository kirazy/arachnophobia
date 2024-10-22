-- Copyright (c) 2024 Kirazy
-- Part of Arachnophobia
--
-- See LICENSE.md in the project directory for license information.

---@alias SpiderEyeHue
---| "0"
---| "30"
---| "60"
---| "90"
---| "120"
---| "150"
---| "180"
---| "210"
---| "240"
---| "270"
---| "300"
---| "330"
---| "white"

---@class SpiderEyeState
---@field primary boolean # When `true`, indicates the primary eyes should be included.
---@field secondary boolean # When `true`, indicates the secondary eyes should be included.
---@field tertiary boolean # When `true`, indicates the tertiary eyes should be included.
---@field back boolean # When `true`, indicates the rear eyes should be included.

---@class SpiderEyeColor
---@field mask data.Color
---@field highlights data.Color

-- Dictionary of spidertron sprite eye colors indexed by hue.
---@type { SpiderEyeHue: SpiderEyeColor }
local eye_colors = {
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

return eye_colors