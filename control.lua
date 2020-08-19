-- Copyright (c) 2020 Kirazy
-- Part of Arachnophobia
--
-- See LICENSE.md in the project directory for license information.

local function on_configuration_changed(data)
    -- Notify of changes when updated in a save we were already present in
    if data.mod_changes and data.mod_changes.arachnophobia and data.mod_changes.arachnophobia.old_version then
        if data.mod_changes.arachnophobia.old_version <= "1.0.2" then
            game.print("[Arachnophobia] New options are available in Startup settings")
        end
    end
end

script.on_configuration_changed(on_configuration_changed)