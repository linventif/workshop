/*
	Created by Heox (STEAM_0:1:8901195)
*/

if !SERVER then return end

local function CheckIfPlayerStuck()
	for k,v in pairs(player.GetAll()) do
		if IsValid(v) and v:IsPlayer() and v:Alive() then
			if !v:InVehicle() then
				local Offset = Vector(5, 5, 5)
				local Stuck = false
				
				if v.Stuck == nil then
					v.Stuck = false
				end
				
				if v.Stuck then
					Offset = Vector(2, 2, 2) //This is because we don't want the script to enable when the players touch, only when they are inside eachother. So, we make the box a little smaller when they aren't stuck.
				end

				for _,ent in pairs(ents.FindInBox(v:GetPos() + v:OBBMins() + Offset, v:GetPos() + v:OBBMaxs() - Offset)) do
					if IsValid(ent) and ent != v and ent:IsPlayer() and ent:Alive() then
					
						v:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
						v:SetVelocity(Vector(-10, -10, 0) * 20)
						
						ent:SetVelocity(Vector(10, 10, 0) * 20)
						
						Stuck = true
					end
				end
			   
				if !Stuck then
					v.Stuck = false
					v:SetCollisionGroup(COLLISION_GROUP_PLAYER)
				end
			else
				v:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			end	
		end
	end
end
timer.Create("CheckIfPlayerStuck", 0.1, 0, CheckIfPlayerStuck)


 