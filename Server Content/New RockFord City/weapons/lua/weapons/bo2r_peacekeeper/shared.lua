AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Peacekeeper"
	SWEP.CSMuzzleFlashes = false
	SWEP.ViewModelMovementScale = 1
	
	SWEP.SelectIcon = (surface.GetTextureID("vgui/hud/bo2r_peacekeeper"))
	SWEP.IconLetter = "x"
	killicon.AddFont("bo2r_peacekeeper", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	killicon.Add( "bo2r_peacekeeper", "vgui/hud/bo2r_peacekeeper", Color(255, 80, 0, 150)) 
	SWEP.MuzzleEffect = "muzzleflash_smg"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2, y = 0, z = -3}

	
	SWEP.IronsightPos = Vector(-3.78, -3.161, 0.615)
	SWEP.IronsightAng = Vector(-0.141, 0, 0)
	
	-- MP5SD variant ironsight pos
	SWEP.SDPos = Vector(2.032, -3.323, 0.759)
	SWEP.SDAng = Vector(0.338, -0.005, 0)
		
	-- MP5K variant ironsight pos
	SWEP.KPos = Vector(2.032, -3.323, 0.759)
	SWEP.KAng = Vector(0.187, -0.005, 0)

	SWEP.MicroT1Pos = Vector(-3.78, -3.161, 0.48)
	SWEP.MicroT1Ang = Vector(-0.141, 0, 0)
			
		
	SWEP.EoTechPos = Vector(-3.78, -3.161, 0.3)
	SWEP.EoTechAng = Vector(-0.141, 0, 0)
	
	SWEP.AimpointPos = Vector(-3.78, -3.161, 0.615)
	SWEP.AimpointAng = Vector(-0.141, 0, 0)
	
	SWEP.ACOGPos = Vector(-3.78, -3.161, 0.6)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(-0.04, -0.16, 1.519)
	SWEP.SprintAng = Vector(-17.9, 24.799, -6.7)

	SWEP.CustomizePos = Vector(5.63, -3.971, -1.088)
	SWEP.CustomizeAng = Vector(4.818, 39.354, 0.972)
	
	SWEP.AlternativePos = Vector(0, 1.325, -0.801)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	

	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 2, roll = 1, forward = 1, pitch = 1}
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}

	SWEP.AttachmentModelsVM = {
		["bo2_reddot"] = {model = "models/weapons/bo2_attachments/bo2_reddot.mdl", bone = "j_gun", pos = Vector(2.7, 0, 4.52), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["bo2_eotech"] = {model = "models/weapons/bo2_attachments/bo2_eotech.mdl", bone = "j_gun", pos = Vector(2.7, 0, 4.52), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["bo2_mms"] = {model = "models/weapons/bo2_attachments/bo2_mms.mdl", bone = "j_gun", pos = Vector(2.7, 0, 4.52), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_tundra9mm"] = {model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "j_gun", pos = Vector(23, 0, 1.45), angle = Angle(0, -90, 0), size = Vector(1.5, 1.5, 1.5)}
	}


	

	SWEP.LaserPosAdjust = {x = 1, y = 0, z = 0}
	SWEP.LaserAngAdjust = {p = 2, y = 180, r = 0}
	SWEP.SightWithRail = false
	SWEP.CustomizationMenuScale = 0.012
end
SWEP.SightBGs = {main = 1, none = 1}
SWEP.HandguardBGs = {main = 2, grip = 1, grip2 = 0}
SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {700, -400}, atts = {"bo2_reddot", "bo2_mms", "bo2_eotech"}},
[2] = {header = "Barrel", offset = {200, -400}, atts = {"md_tundra9mm"}},
[3] = {header = "Misc", offset = {-300, -200}, atts = {"bo2_rapidfire"}},
[4] = {header = "Handguard", offset = {200, -100}, atts = {"bo2_grip_peace"}},
[5] = {header = "Body", offset = {200, 400}, atts = {"bo2_edrl", "bo2_siberia","bo2_bluetiger", "bo2_bloodshot", "bo2_kryptek", "bo2_blossom", "bo2_artwar", "bo2_ronin", "bo2_gold"}},
["+reload"] = {header = "Ammo", offset = {700, 0}, atts = {"bo2_fmj"}}}

SWEP.Animations = {fire = {"shoot"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0.0952, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.4, sound = "BO2_PEACE_MAGOUT"},
	[2] = {time = 1.2, sound = "BO2_PEACE_MAGIN"}},
	
	reload_grip = {[1] = {time = 0.4, sound = "BO2_PEACE_MAGOUT"},
	[2] = {time = 1.2, sound = "BO2_PEACE_MAGIN"}},
	
	reload_empty = {[1] = {time = 0.4, sound = "BO2_PEACE_MAGOUT"},
	[2] = {time = 1.2, sound = "BO2_PEACE_MAGIN"},
	[3] = {time = 1.75, sound = "BO2_PEACE_CHARGE"}},
	
	reload_empty_grip = {[1] = {time = 0.4, sound = "BO2_PEACE_MAGOUT"},
	[2] = {time = 1.2, sound = "BO2_PEACE_MAGIN"},
	[3] = {time = 1.75, sound = "BO2_PEACE_CHARGE"}}}

SWEP.SpeedDec = 15

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst"}
SWEP.Base = "cw_base"
SWEP.Category = "Black Ops II Weapons Remastered"

SWEP.Author			= "Megadeth9811"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_bo2r_peacekeeper.mdl"
SWEP.WorldModel		= "models/weapons/w_bo2_peacekeeper.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 120
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.083
SWEP.FireSound = "BO2_PEACE_FIRE"
SWEP.FireSoundSuppressed = "BO2_PEACE_FIRE_SILENCED"
SWEP.Recoil = 0.4

SWEP.HipSpread = 0.035
SWEP.AimSpread = 0.008
SWEP.VelocitySensitivity = 1.5
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 28
SWEP.DeployTime = 0.8

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 1.3
SWEP.ReloadTime_Empty = 1.4
SWEP.ReloadHalt = 2.1
SWEP.ReloadHalt_Empty = 2.6

function SWEP:fireAnimFunc()
if self.dt.State == CW_AIMING then
self:sendWeaponAnim("shoot1")
else
self:playFireAnim()
end
end
