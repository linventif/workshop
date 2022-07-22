AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "MG 42"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.Add("cw_kks_doi_mg42", "vgui/kill_icon/cw_kks_doi_mg42", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("vgui/kill_icon/cw_kks_doi_mg42")
	
	SWEP.MuzzleEffect = "muzzleflash_ak74"
	SWEP.MuzzleAttachmentName = "muzzle"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
	//SWEP.NoShells = true
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0
	
	SWEP.CustomizePos = Vector(6.488, -1.627, -2.821)
	SWEP.CustomizeAng = Vector(17.009, 29.971, 16.669)

	SWEP.IronsightPos = Vector(-2.3595, -2, 0.952)
	SWEP.IronsightAng = Vector(-0.0747, 0.0156, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.AttachmentModelsVM = {}
	
	function SWEP:getMuzzlePosition()
		return self.CW_VM:GetAttachment(self.CW_VM:LookupAttachment(self.MuzzleAttachmentName))
	end

	SWEP.ForegripOverride = true
	SWEP.ForegripParent = "Hands"
	SWEP.ForegripOverridePos = {
		["Hands"] = {["(null)"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -90, 0) }}
	}

	SWEP.ReloadViewBobEnabled = true

end

SWEP.SightBGs = {main = 4, carryhandle = 0, foldsight = 1, none = 2}
SWEP.BarrelBGs = {main = 3, longris = 4, long = 3, magpul = 2, ris = 1, regular = 0}
SWEP.StockBGs = {main = 2, regular = 0, heavy = 1, sturdy = 2}
SWEP.MagBGs = {main = 5, regular = 0, round60 = 1}

SWEP.BipodInstalled = true
SWEP.LuaViewmodelRecoil = false
SWEP.ADSFireAnim  = true

SWEP.Attachments = {
	["+reload"] = {header = "Ammo", offset = {1150, 0}, atts = {"am_magnum", "am_matchgrade"}}}
	
SWEP.Animations = {fire = {"base_fire_1","base_fire_2"},
	reload = "base_reload",
	idle = "base_idle",

	deployed_in = "deployed_in",
	deployed_out = "deployed_out",

	dryfire = "base_dryfire",
	//draw = "base_draw",
	draw = "base_ready",
	reload_empty = "base_reload_empty",
	holster = "base_holster",
	}
	
SWEP.Sounds = {
	
	base_ready = {
		[1] = {time = 0, sound = "CW_KKs_DOI_MG42_FOLEY"},
		[2] = {time = 30/34.2, sound = "CW_KKs_DOI_MG42_BOLTBACK"},
		[3] = {time = 42/34.2, sound = "CW_KKs_DOI_MG42_BOLTRELEASE"},
		[4] = {time = 65/34.2, sound = "CW_KKs_DOI_MG42_RATTLE"},
	},

	base_draw = {{time = 0, sound = "CW_KKs_DOI_MG42_FOLEY"}},

	base_reload = {
		[1] = {time = 18/33.5, sound = "CW_KKs_DOI_MG42_FOLEY"},
		[2] = {time = 35/33.5, sound = "CW_KKs_DOI_MG42_LIDOPEN"},
		[3] = {time = 75/33.5, sound = "CW_KKs_DOI_MG42_LINKRATTLE"},
		[4] = {time = 81/33.5, sound = "CW_KKKs_DOI_MG42_FETCHMAG"},
		[5] = {time = 140/33.5, sound = "CW_KKs_DOI_MG42_BELTJINGLE"},
		[6] = {time = 150/33.5, sound = "CW_KKs_DOI_MG42_BELTALIGN"},
		[7] = {time = 203/33.5, sound = "CW_KKs_DOI_MG42_LIDCLOSE"},
		[8] = {time = 238/33.5, sound = "CW_KKs_DOI_MG42_RATTLE"},
		[9] = {time = 264/33.5, sound = "CW_KKs_DOI_MG42_SHOULDER"},
	},

	base_reload_empty = {
		[1] = {time = 1/33.5, sound = "CW_KKs_DOI_MG42_FOLEY"},
		[2] = {time = 33/33.5, sound = "CW_KKs_DOI_MG42_BOLTBACK"},
		[3] = {time = 43/33.5, sound = "CW_KKs_DOI_MG42_BOLTRELEASE"},
		[4] = {time = 67/33.5, sound = "CW_KKs_DOI_MG42_RATTLE"},
		[5] = {time = 95/33.5, sound = "CW_KKs_DOI_MG42_LIDOPEN"},
		[6] = {time = 100/33.5, sound = "CW_KKs_DOI_MG42_FETCHMAG"},
		[7] = {time = 164/33.5, sound = "CW_KKs_DOI_MG42_BELTJINGLE"},
		[8] = {time = 176/33.5, sound = "CW_KKs_DOI_MG42_BELTALIGN"},
		// reload time = 150 ""},
		[9] = {time = 229/33.5, sound = "CW_KKs_DOI_MG42_LIDCLOSE"},
		[10] = {time = 264/33.5, sound = "CW_KKs_DOI_MG42_RATTLE"},
		[11] = {time = 284/33.5, sound = "CW_KKs_DOI_MG42_SHOULDER"},
	},

	deployed_in = {
		[1] = {time = 1/32.5, sound = "CW_KKs_DOI_MG42_FOLEY"},
		[2] = {time = 19/32.5, sound = "CW_KKs_DOI_MG42_DEPLOYGROUNDHIT"},
		[3] = {time = 46/32.5, sound = "CW_KKs_DOI_MG42_RATTLE"},
		[4] = {time = 65/32.5, sound = "CW_KKs_DOI_MG42_SHOULDER"},
	},

	deployed_out = {
		[1] = {time = 1/33, sound = "CW_KKs_DOI_MG42_FOLEY"},
		[2] = {time = 25/33, sound = "CW_KKs_DOI_MG42_RATTLE"},
		[3] = {time = 39/33, sound = "CW_KKs_DOI_MG42_SHOULDER"},
	},

	deployed_reload = {
		{time = 13/34.5, sound = "CW_KKs_DOI_MG42_FOLEY"},
		{time = 35/34.5, sound = "CW_KKs_DOI_MG42_LIDOPEN"},
		{time = 75/34.5, sound = "CW_KKs_DOI_MG42_LINKRATTLE"},
		{time = 81/34.5, sound = "CW_KKs_DOI_MG42_FETCHMAG"},
		// reload time = 110 ""},
		{time = 140/34.5, sound = "CW_KKs_DOI_MG42_BELTJINGLE"},
		{time = 150/34.5, sound = "CW_KKs_DOI_MG42_BELTALIGN"},
		{time = 203/34.5, sound = "CW_KKs_DOI_MG42_LIDCLOSE"},
		{time = 230/34.5, sound = "CW_KKs_DOI_MG42_RATTLE"},
		{time = 255/34.5, sound = "CW_KKs_DOI_MG42_SHOULDER"},
	},

	deployed_reload_empty = {
		{time = 13/33.5, sound = "CW_KKs_DOI_MG42_FOLEY"},
		{time = 33/33.5, sound = "CW_KKs_DOI_MG42_BOLTBACK"},
		{time = 43/33.5, sound = "CW_KKs_DOI_MG42_BOLTRELEASE"},
		{time = 67/33.5, sound = "CW_KKs_DOI_MG42_RATTLE"},
		{time = 95/33.5, sound = "CW_KKs_DOI_MG42_LIDOPEN"},
		{time = 100/33.5, sound = "CW_KKs_DOI_MG42_FETCHMAG"},
		{time = 164/33.5, sound = "CW_KKs_DOI_MG42_BELTJINGLE"},
		{time = 176/33.5, sound = "CW_KKs_DOI_MG42_BELTALIGN"},
		// reload time = 150 ""},
		{time = 229/33.5, sound = "CW_KKs_DOI_MG42_LIDCLOSE"},
		{time = 251/33.5, sound = "CW_KKs_DOI_MG42_RATTLE"},
		{time = 284/33.5, sound = "CW_KKs_DOI_MG42_SHOULDER"},
	},

}

	
SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto"}
SWEP.Base = "cw_base"
//SWEP.Category = "CW 2.0 Commissions"
SWEP.Category = "CW 2.0 White Snow"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= false
SWEP.ViewModel = "models/weapons/cw2/v_kks_mg42.mdl"
SWEP.WorldModel		= "models/weapons/cw2/w_kks_mg42.mdl"
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/cw2/w_kks_mg42.mdl"
SWEP.WMPos = Vector(0, 13, 2)
SWEP.WMAng = Vector(-5, 0, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 250
SWEP.Primary.DefaultClip	= 250
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.92×57mm Mauser" //"7.92x57MM"

SWEP.FireDelay = 60/1200
SWEP.FireSound = "CW_KKs_DOI_MG42_FIRE"
SWEP.FireSoundSuppressed = "CW_AR15_FIRE_SUPPRESSED"
SWEP.Recoil = 1.1

SWEP.HipSpread = 0.065
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 2.4
SWEP.MaxSpreadInc = 0.035 //0.04
SWEP.SpreadPerShot = 0.002 //0.007
SWEP.SpreadCooldown = 0.15
SWEP.Shots = 1
SWEP.Damage = 60
SWEP.BipodFireAnim = true
//SWEP.DeployTime = 0.6
SWEP.DeployTime = 2.45

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 4.2
SWEP.ReloadTime_Empty = 4.94
SWEP.ReloadHalt = 8.21
SWEP.ReloadHalt_Empty = 8.96

SWEP.BipodDeployTime = 1.58 //2.18
SWEP.BipodUndeployTime = 1.33 //1.73

SWEP.FirstDeployTime = 3.1
SWEP.DeployTime = 0.9
SWEP.HolsterTime = 0.6

SWEP.Chamberable = false
SWEP.WeaponLength = 26

SWEP.Trivia = {text = "Accurate aimed fire is not possible without the use of a bipod with this weapon.", x = -500, y = -360, textFormatFunc = function(self, wep) if wep.ActiveAttachments.md_bipod then return "" else return self.text end end}

function SWEP:IndividualThink()
	mag = self:Clip1()
	ammo = self:Ammo1()

	if mag <= 18 then
		self:setBodygroup(1, mag)
	else
		self:setBodygroup(1, 18)
	end

	local is = self.dt.BipodDeployed	
	local was = self.BipodWasDeployed

	if self.Animations.draw == "base_draw" then
	if is != was then
		if is then
			self:sendWeaponAnim("deployed_in", 1)
			self.Animations.fire = {"deployed_fire_1", "deployed_fire_2"}
			self.Animations.idle = "deployed_iron_idle"
			self.Animations.reload_empty = "deployed_reload_empty"
			self.Animations.reload = "deployed_reload"
		else
			self:sendWeaponAnim("deployed_out", 1)
			self.Animations.idle = "base_idle"
			self.Animations.fire = {"base_fire_1","base_fire_2"}
			self.Animations.reload_empty = "base_reload_empty"
			self.Animations.reload = "base_reload"
		end	
	end
	end

self.BipodWasDeployed = is

	self.Animations.draw = "base_draw"
	if self.Animations.draw == "base_draw" then
		self.DeployTime = 0.6
	end
end

function SWEP:buildBoneTable()
local vm = self.CW_VM

for i = 0, vm:GetBoneCount() - 1 do
local boneName = vm:GetBoneName(i)
local bone

if boneName then
bone = vm:LookupBone(boneName)
end

-- some ins models have [__INVALIDBONE__]s so to prevent nilpointerexceptions bone = 1
self.vmBones[i + 1] = {boneName = boneName, bone = i, curPos = Vector(0, 0, 0), curAng = Angle(0, 0, 0), targetPos = Vector(0, 0, 0), targetAng = Angle(0, 0, 0)}
end
end