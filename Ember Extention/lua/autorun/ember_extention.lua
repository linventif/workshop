if SERVER then
    util.AddNetworkString("ember_purchase")
else
    hook.Add( "OnPlayerChat", "dzfr", function( ply, strText, bTeam, bDead ) 
        if (ply != LocalPlayer()) then return end
    
        strText = string.lower(strText) -- make the string lower case
    
        if (strText == "/sound_linventif") then
            surface.PlaySound("linventif/cash-register.wav")
        end
    end )
    net.Receive("ember_purchase", function()
        surface.PlaySound( "npc/overwatch/radiovoice/rewardnotice.wav" )
    end)
end