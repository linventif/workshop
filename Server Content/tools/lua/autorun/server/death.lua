local playerladies = {
"models/player/group01/female_01.mdl",
"models/player/group01/female_02.mdl",
"models/player/group01/female_03.mdl",
"models/player/group01/female_04.mdl",
"models/player/group01/female_06.mdl",
"models/player/group03/female_01.mdl",
"models/player/group03/female_02.mdl",
"models/player/group03/female_03.mdl",
"models/player/group03/female_04.mdl",
"models/player/group03/female_06.mdl",
"models/player/group03m/female_01.mdl",
"models/player/group03m/female_02.mdl",
"models/player/group03m/female_03.mdl",
"models/player/group03m/female_04.mdl",
"models/player/group03m/female_05.mdl",
"models/player/mossman.mdl",
"models/player/p2_chell.mdl",
"models/player/mossman_arctic.mdl"
}

local npcladies = {
"models/humans/group01/female_01.mdl",
"models/humans/group01/female_02.mdl",
"models/humans/group01/female_03.mdl",
"models/humans/group01/female_04.mdl",
"models/humans/group01/female_05.mdl",
"models/humans/group01/female_06.mdl",
"models/humans/group01/female_07.mdl",
"models/humans/group02/female_01.mdl",
"models/humans/group02/female_02.mdl",
"models/humans/group02/female_03.mdl",
"models/humans/group02/female_04.mdl",
"models/humans/group02/female_05.mdl",
"models/humans/group02/female_06.mdl",
"models/humans/group02/female_07.mdl",
"models/humans/group03/female_01.mdl",
"models/humans/group03/female_02.mdl",
"models/humans/group03/female_03.mdl",
"models/humans/group03/female_04.mdl",
"models/humans/group03/female_05.mdl",
"models/humans/group03/female_06.mdl",
"models/humans/group03/female_07.mdl",
"models/humans/group03m/female_01.mdl",
"models/humans/group03m/female_02.mdl",
"models/humans/group03m/female_03.mdl",
"models/humans/group03m/female_04.mdl",
"models/humans/group03m/female_05.mdl",
"models/humans/group03m/female_06.mdl",
"models/humans/group03m/female_07.mdl"
 }

local function NPCBrutalDeathSounds(ent)
	if ent:GetClass() != "npc_citizen" then return end
	if table.HasValue(npcladies, string.lower(ent:GetModel())) then
	ent:EmitSound(Sound("death/death"..math.random(117,164)..".wav"),80)
	else
	ent:EmitSound(Sound("death/death"..math.random(1,116)..".wav"),80)
	end
end

hook.Add( "OnNPCKilled", "NPCBrutalDeathSounds", NPCBrutalDeathSounds )

local function PlayerBrutalDeathSounds(ent)
	if table.HasValue(playerladies, string.lower(ent:GetModel())) then
	ent:EmitSound(Sound("death/death"..math.random(117,164)..".wav"),80)
	else
	ent:EmitSound(Sound("death/death"..math.random(1,116)..".wav"),80)
	end
end

hook.Add( "PlayerDeath", "PlayerBrutalDeathSounds", PlayerBrutalDeathSounds )
hook.Add("PlayerDeathSound", "DeFlatline", function() return true end)