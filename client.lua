local showIDS = false

-- Funny, questionable messages to show when the player is checking an ID. Change this as you wish. 
local meMessages = {
    "adjusts their shirt collar for no apparent reason",
    "scratches their head in confusion",
    "checks their watch even though it’s probably broken",
    "mumbles something under their breath",
    "stares off into the distance briefly",
    "cracks their knuckles quietly",
    "lets out a small sigh",
    "shifts their weight from one foot to the other",
    "glances around aimlessly",
    "fixes their posture suddenly",
    "wipes imaginary dust off their clothes",
    "blinks a few times like they forgot something",
    "takes a deep breath and exhales slowly",
    "tilts their head slightly in thought",
    "taps their foot impatiently"
}

-- Register the keybind for toggling the ID check display. Change "U" to whatever key you prefer. Or allow players to change it in the FiveM Keybinds.
RegisterKeyMapping('toggleids', 'Toggle Nearby Player IDs', 'keyboard', 'U')

-- Command that is triggered by using the keybind. 
RegisterKeyMapping('toggleids', 'Toggle Nearby Player IDs', 'keyboard', 'U')

-- Command triggered by keybind
RegisterCommand('toggleids', function()
    showIDs = not showIDs

    -- Pick a random /me message
    local randomMessage = meMessages[math.random(#meMessages)]

    -- Send /me message
    ExecuteCommand("me " .. randomMessage)
end, false)

-- This places the ID in Draw 3D text above the player's head. 
function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextCentre(true)

        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandDisplayText(_x, _y)
    end
end

-- Man, this is the main loopy part. It checks every frame for nearby players and displays their IDs. IDK man I just work here. 
CreateThread(function()
    while true do
        Wait(0)

        if showIDs then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, player in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(player)

                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < 15.0 then
                        local serverId = GetPlayerServerId(player)
                        DrawText3D(targetCoords.x, targetCoords.y, targetCoords.z + 1.0, "ID: " .. serverId)
                    end
                end
            end
        end
    end
end)