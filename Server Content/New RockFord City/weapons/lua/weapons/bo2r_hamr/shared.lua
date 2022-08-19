AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "HAMR"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	SWEP.SelectIcon = (surface.GetTextureID("vgui/hud/bo2r_hamr"))
	SWEP.IconLetter = "x"
	killicon.AddFont("bo2r_hamr", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
		killicon.Add( "bo2r_hamr", "vgui/hud/bo2r_hamr", Color(255, 80, 0, 150)) 
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.8
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.87
	
	SWEP.IronsightPos = Vector(-3.12, -0.63, 0)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	-- MP5SD variant ironsight pos
	SWEP.SDPos = Vector(2.032, -3.323, 0.759)
	SWEP.SDAng = Vector(0.338, -0.005, 0)
		
	-- MP5K variant ironsight pos
	SWEP.KPos = Vector(2.032, -3.323, 0.759)
	SWEP.KAng = Vector(0.187, -0.005, 0)

	SWEP.MicroT1Pos = Vector(-3.13, -2.901, 0.4)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
			
		
	SWEP.EoTechPos = Vector(-3.13, -2.901, 0.25)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-3.13, -2.901, 0.5)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.ACOGPos = Vector(-3.13, -2.901, 0.75)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(0.602, -2.211, 0.804)
	SWEP.SprintAng = Vector(-16.885, 23.92, -9.146)

	SWEP.CustomizePos = Vector(5.63, -3.971, -1.088)
	SWEP.CustomizeAng = Vector(4.818, 39.354, 0.972)
	
	SWEP.AlternativePos = Vector(0, 1.325, -0.801)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	

	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 2, roll = 1, forward = 1, pitch = 1}
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}

	SWEP.AttachmentModelsVM = {
		["bo2_reddot"] = {model = "models/weapons/bo2_attachments/bo2_reddot.mdl", bone = "j_gun", pos = Vector(1.5, 0, 4), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["bo2_acog"] = {model = "models/weapons/bo2_attachments/bo2_acog.mdl", bone = "j_gun", pos = Vector(1.5, 0, 4), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["bo2_mms"] = {model = "models/weapons/bo2_attachments/bo2_mms.mdl", bone = "j_gun", pos = Vector(1.5, 0, 4), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["bo2_grip"] = {model = "models/weapons/bo2_attachments/bo2_grip.mdl", bone = "j_gun", pos = Vector(12.8, 0, 0.8), angle = Angle(0, -90, 0), size = Vector(1.1, 1.1, 1.1)},
		["bo2_eotech"] = {model = "models/weapons/bo2_attachments/bo2_eotech.mdl", bone = "j_gun", pos = Vector(1.5, 0, 4), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_tundra9mm"] = {model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "j_gun", pos = Vector(40.209, 0, -0.3), angle = Angle(0, -90, 0), size = Vector(1.797, 1.797, 1.797)}
	}


	

	SWEP.LaserPosAdjust = {x = 1, y = 0, z = 0}
	SWEP.LaserAngAdjust = {p = 2, y = 180, r = 0}
	SWEP.SightWithRail = true
	SWEP.CustomizationMenuScale = 0.012
end
SWEP.SightBGs = {main = 1, none = 1}
SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {700, -400}, atts = {"bo2_reddot", "bo2_mms", "bo2_eotech", "bo2_acog"}},
[2] = {header = "Barrel", offset = {200, -400}, atts = {"md_tundra9mm"}},
[3] = {header = "Misc", offset = {-300, -200}, atts = {"bo2_rapidfire"}},
[4] = {header = "Handguard", offset = {200, -100}, atts = {"bo2_grip"}},
[5] = {header = "Body", offset = {200, 400}, atts = {"bo2_edrl", "bo2_siberia","bo2_bluetiger", "bo2_bloodshot", "bo2_kryptek", "bo2_blossom", "bo2_artwar", "bo2_ronin", "bo2_gold"}},
["+reload"] = {header = "Ammo", offset = {700, 0}, atts = {"bo2_fmj"}}}

SWEP.Animations = {fire = {"shoot"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0.0952, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.23, sound = "BO2_HAMR_START"},
	[2] = {time = 1.45, sound = "BO2_HAMR_MAGOUT"},
	[3] = {time = 2.1, sound = "BO2_HAMR_MAGIN"},
	[4] = {time = 2.4, sound = "BO2_HAMR_TAP"}},
	
	reload_grip = {[1] = {time = 0.23, sound = "BO2_HAMR_START"},
	[2] = {time = 1.45, sound = "BO2_HAMR_MAGOUT"},
	[3] = {time = 2.1, sound = "BO2_HAMR_MAGIN"},
	[4] = {time = 2.4, sound = "BO2_HAMR_TAP"}},
	
	reload_empty = {[1] = {time = 0.23, sound = "BO2_HAMR_START"},
	[2] = {time = 1.45, sound = "BO2_HAMR_MAGOUT"},
	[3] = {time = 2.1, sound = "BO2_HAMR_MAGIN"},
	[4] = {time = 2.4, sound = "BO2_HAMR_TAP"},
	[5] = {time = 2.8, sound = "BO2_HAMR_PULL"},
	[6] = {time = 3.1, sound = "BO2_HAMR_RELEASE"}},
	reload_empty_grip = {[1] = {time = 0.23, sound = "BO2_HAMR_START"},
	[2] = {time = 1.45, sound = "BO2_HAMR_MAGOUT"},
	[3] = {time = 2.1, sound = "BO2_HAMR_MAGIN"},
	[4] = {time = 2.4, sound = "BO2_HAMR_TAP"},
	[5] = {time = 2.8, sound = "BO2_HAMR_PULL"},
	[6] = {time = 3.1, sound = "BO2_HAMR_RELEASE"}}}
	

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
SWEP.AimViewModelFOV = 65
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_bo2r_hamr.mdl"
SWEP.WorldModel		= "models/weapons/w_bo2_hamr.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 75
SWEP.Primary.DefaultClip	= 375
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.ADSFireAnim = true
SWEP.FireDelay = 0.096
SWEP.FireSound = "BO2_HAMR_FIRE"
SWEP.FireSoundSuppressed = "BO2_HAMR_FIRE_SILENCED"
SWEP.Recoil = 0.45

SWEP.HipSpread = 0.07
SWEP.AimSpread = 0.004
SWEP.VelocitySensitivity = 1.5
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 30
SWEP.DeployTime = 0.8

SWEP.ReloadSpeed = 0.8
SWEP.ReloadTime = 2.1
SWEP.ReloadTime_Empty = 2.1
SWEP.ReloadHalt = 3.3
SWEP.ReloadHalt_Empty = 4

function SWEP:fireAnimFunc()
if self.dt.State == CW_AIMING then
self:sendWeaponAnim("shoot1")
else
self:playFireAnim()
end
end