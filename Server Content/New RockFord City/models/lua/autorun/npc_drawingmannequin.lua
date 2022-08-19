/*
	//Addon by Patryk "Ghost" Brzezinski	
*/


--Add Playermodel
player_manager.AddValidModel( "Drawing Mannequin", "models/DrawingMannequin/drawingmannequin.mdl" )


--Add NPC
local NPC =
{
	Name = "Drawing Mannequin",
	Class = "npc_citizen",
	KeyValues = { citizentype = 4 },
	Model = "models/DrawingMannequin/drawingmannequin.mdl",
	Category = "Drawing Mannequin"
}

list.Set( "NPC", "npc_drawingmannequin", NPC )


-- Send this to clients automatically so server hosts don't have to
if SERVER then
	resource.AddWorkshop("439849859")
end