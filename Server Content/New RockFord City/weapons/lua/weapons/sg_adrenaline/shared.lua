SWEP.PrintName 		= "Adrenaline Shot"
SWEP.Author 		= "Gmod4phun, Progsys\n(Less messy code/icons - LordiAnders)" 
SWEP.Purpose		= "Heal yourself during a battle."
SWEP.Instructions	= "Left click to heal yourself."
SWEP.AdminSpawnable = true
SWEP.Spawnable 		= true
SWEP.ViewModelFOV 	= 64
SWEP.ViewModel 		= "models/pg_props/pg_weapons/pg_shot_v.mdl"
SWEP.WorldModel 	= "models/pg_props/pg_stargate/pg_shot.mdl"
SWEP.Slot 			= 4 
SWEP.SlotPos = 1
SWEP.HoldType = "normal" 
SWEP.FiresUnderwater = true
SWEP.Weight = 5
SWEP.DrawCrosshair = false
SWEP.Category = "CAP Misc Weapons"
SWEP.DrawAmmo = false

SWEP.base = "weapon_base"

SWEP.Primary.ClipSize = -1
SWEP.Primary.Ammo = "none" 
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false 

SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false 
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.ClipSize = -1

SWEP.CanHolster = true

if CLIENT then
SWEP.WepSelectIcon = surface.GetTextureID("vgui/entities/sg_adrenaline")
SWEP.BounceWeaponIcon = false
end

function SWEP:Initialize()
	self:SetWeaponHoldType( self.HoldType )
end 

local function SG_IsActive(self)
	if not IsValid(self) then return false end
	if not self.Owner or not IsValid(self.Owner) then return false end
	if not IsValid(self.Owner:GetActiveWeapon()) then return false end
	if self.Owner:GetActiveWeapon() != self then return false end
	return true
end

function SWEP:Deploy()
self:SetNextPrimaryFire(CurTime()+0.6)
self:SetNetworkedBool("CanHolster",false)
self:SendWeaponAnim( ACT_VM_DRAW )

timer.Simple(self.Owner:GetViewModel():SequenceDuration(), function()
	if SG_IsActive(self) then
	self:SendWeaponAnim(ACT_VM_IDLE)
	end
end)

end

function SWEP:PrimaryAttack()
	--if self.Owner:Health() >= 100 then if SERVER then self.Owner:ChatPrint("You dont need this yet") end return end
	self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
	self:SetNextPrimaryFire(CurTime()+3.4)

	self.CanHolster = false

	timer.Simple(1.6, function()
		if not SG_IsActive(self) then return end
		self.Owner:SetHealth(100)
	end)

	timer.Simple(0.6, function()
		if not SG_IsActive(self) then return end
		if SERVER then
			self:EmitSound("weapons/ak47/ak47_clipout.wav", 40, 170)
		end
	end)

	timer.Simple(1.5, function()
		if not SG_IsActive(self) then return end
		if SERVER then
			self:EmitSound("weapons/slam/mine_mode.wav", 100, 100)
		end
	end)

	timer.Simple(self.Owner:GetViewModel():SequenceDuration(), function()
		if not SG_IsActive(self) then return end
		self.Owner:ConCommand("lastinv")
		if SERVER then 
			self.Owner:StripWeapon(self:GetClass())
		end
	end)


end

function SWEP:SecondaryAttack() end

function SWEP:Holster()

	return self.CanHolster
end