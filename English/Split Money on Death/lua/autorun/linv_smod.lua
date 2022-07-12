print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
print(" - - - - - - - - -  Split Money on Death - - - - - - - - - ")
print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
print(" - - - - - - - - - Module by Linventif - - - - - - - - - - ")
print(" - - - - Join my discord : https://dsc.gg/linventif  - - - ")
print(" - - - -  Watch my website : https://linventif.org - - - - ")
print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")


hook.Add("PlayerDeath", "ChangeMoneyOnPlayerDeath", function(ply)
    local ply_money = ply:getDarkRPVar("money")
    if ply_money > 20000 then 
        local lose_money = ply:getDarkRPVar("money") / 2
        lose_money = math.ceil(lose_money)
        ply:setDarkRPVar("money", lose_money)
        ply:ChatPrint( "You died, you lost $" .. lose_money)
    elseif ply_money > 10000 and ply_money < 20000 then
        local lose_money = ply:getDarkRPVar("money") - 10000
        ply:setDarkRPVar("money", 10000)
        ply:ChatPrint( "You died, you lost $" .. lose_money)
    else
        ply:ChatPrint( "You are dead, but you have not lost any money because you are poor." )
    end
end)