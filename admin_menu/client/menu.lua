ESX = nil
TriggerEvent(Config.Menu.getESX, function(obj) ESX = obj end)

menuState = FlagServerAsPrivate

local main_menu = RageUI.CreateMenu("MidNight", "Intéraction")

main_menu.Closed = function()
    menuState = false

end

function OpenMenu()
    if menuState then
        menuState = false
        RageUI.Visible(main_menu, false)
    else
        menuState = true
        RageUI.Visible(main_menu, true)
    end

    CreateThread(function()
        while menuState do
            Wait(1)

            RageUI.IsVisible(main_menu, function()

                RageUI.Separator("~g~Votre nom : ~b~"..GetPlayerName(PlayerId()))

            end)        
        end
    end)
end

Keys.Register(Config.Menu.Key, "Menu", "Ouvrir le menu", function()
    OpenMenu()
end)