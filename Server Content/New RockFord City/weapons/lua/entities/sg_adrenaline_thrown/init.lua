AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/pg_props/pg_stargate/pg_shot.mdl") 
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_NONE)
	self:SetUseType(SIMPLE_USE)
	local phys = self:GetPhysicsObject()

	if phys and phys:IsValid() then
		phys:Wake()
	end
end

function ENT:SpawnFunction( ply, tr )
    if ( !tr.Hit ) then return end
	
    local ent = ents.Create("sg_adrenaline_thrown")
    ent:SetPos( tr.HitPos + tr.HitNormal * 16 ) 
    ent:Spawn()
    ent:Activate()
 
    return ent
end

function ENT:OnTakeDamage(dmginfo)
	self:GetPhysicsObject():AddVelocity(dmginfo:GetDamageForce() * 0.1)
end

function ENT:Use(activator, caller)
	if activator:IsPlayer() then
	if activator:HasWeapon("sg_adrenaline") then activator:ChatPrint("You already have one") return end
	activator:Give("sg_adrenaline")
	activator:EmitSound("items/gunpickup2.wav",100,100)
	self:Remove()
end
end

function ENT:OnRemove()
return false
end 