local Category = "The Evil Within" 

local NPC = { Name = "Sebastian Castellanos - Friendly", 
Class = "npc_citizen", 
Model = "models/players/mj_tew_seb.mdl", 
Health = "100", 
KeyValues = { citizentype = 4 }, 
Category = Category} 

list.Set( "NPC", "tew_seb_ally", NPC ) 

local Category = "The Evil Within"
 
local NPC = {   Name = "Sebastian Castellanos - Hostile", 
                Class = "npc_combine",
                Model = "models/players/mj_tew_seb_combine.mdl",
                Health = "100", 
                Category = Category }
                               
list.Set( "NPC", "tew_seb_enemy", NPC )

local Category = "The Evil Within" 

local NPC = { Name = "Sebastian Castellanos (Alt) - Friendly", 
Class = "npc_citizen", 
Model = "models/players/mj_tew_seb_y.mdl", 
Health = "100", 
KeyValues = { citizentype = 4 }, 
Category = Category} 

list.Set( "NPC", "tew_seb_y_ally", NPC ) 

local Category = "The Evil Within"
 
local NPC = {   Name = "Sebastian Castellanos (Alt) - Hostile", 
                Class = "npc_combine",
                Model = "models/players/mj_tew_seb_y_combine.mdl",
                Health = "100", 
                Category = Category }
                               
list.Set( "NPC", "tew_seb_y_enemy", NPC )