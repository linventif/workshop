AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "B23R"
	SWEP.CSMuzzleFlashes = false
	SWEP.ViewModelMovementScale = 1
	SWEP.SelectIcon = (surface.GetTextureID("vgui/hud/bo2r_b23r"))
	SWEP.IconLetter = "x"
	killicon.AddFont("bo2r_b23r", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
		killicon.Add( "bo2r_b23r", "vgui/hud/bo2r_b23r", Color(255, 80, 0, 150)) 
	SWEP.MuzzleEffect = "muzzleflash_smg"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2, y = 0, z = -3}

	
	SWEP.IronsightPos = Vector(-3.201, -1.369, 0.519)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
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
	
	SWEP.SprintPos = Vector(-0.695, 0, 3.039)
	SWEP.SprintAng = Vector(-17.83, 0, 0)

	SWEP.CustomizePos = Vector(5.63, -3.971, -1.088)
	SWEP.CustomizeAng = Vector(4.818, 39.354, 0.972)
	
	SWEP.AlternativePos = Vector(0, 1.325, -0.801)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	

	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 2, roll = 1, forward = 1, pitch = 1}
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}

	SWEP.AttachmentModelsVM = {
		["bo2_reddot"] = {model = "models/weapons/bo2_attachments/bo2_reddot.mdl", bone = "j_gun", pos = Vector(2.7, 0, 4.52), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_tundra9mm"] = {model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "j_gun", pos = Vector(13.628, 0, 0.544), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)}
	}


	

	SWEP.LaserPosAdjust = {x = 1, y = 0, z = 0}
	SWEP.LaserAngAdjust = {p = 2, y = 180, r = 0}
	SWEP.SightWithRail = false
	SWEP.CustomizationMenuScale = 0.012
end
SWEP.SightBGs = {main = 1, none = 1}
SWEP.HandguardBGs = {main = 2, grip = 1, grip2 = 0}
SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Barrel", offset = {200, -400}, atts = {"md_tundra9mm"}},
[2] = {header = "Body", offset = {200, 400}, atts = {"bo2_edrl", "bo2_siberia","bo2_bluetiger", "bo2_bloodshot", "bo2_kryptek", "bo2_blossom", "bo2_artwar", "bo2_ronin", "bo2_gold"}},
["+reload"] = {header = "Ammo", offset = {700, 0}, atts = {"bo2_fmj"}}}

SWEP.Animations = {fire = {"shoot1"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0.0952, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.4, sound = "BO2_B23R_MAGOUT"},
	[2] = {time = 0.85, sound = "BO2_B23R_MAGIN"}},
	
	
	reload_empty = {[1] = {time = 0.4, sound = "BO2_B23R_MAGOUT"},
	[2] = {time = 0.85, sound = "BO2_B23R_MAGIN"},
	[3] = {time = 1.25, sound = "BO2_B23R_SLIDE"}}}
	


SWEP.SpeedDec = 15

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"3burst"}
SWEP.Base = "cw_base"
SWEP.Category = "Black Ops II Weapons Remastered"

SWEP.Author			= "Megadeth9811"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_bo2r_b23r.mdl"
SWEP.WorldModel		= "models/weapons/w_bo2_b23r.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 15
SWEP.Primary.DefaultClip	= 120
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.048
SWEP.FireSound = "BO2_B23R_FIRE"
SWEP.FireSoundSuppressed = "BO2_B23R_FIRE_SILENCED"
SWEP.Recoil = 0.35

SWEP.ZoomAmount = 5
SWEP.HipSpread = 0.04
SWEP.AimSpread = 0.007
SWEP.VelocitySensitivity = 1.5
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 26
SWEP.DeployTime = 0.8
SWEP.ADSFireAnim = true
SWEP.ReloadSpeed = 0.8
SWEP.ReloadTime = 1.3
SWEP.ReloadTime_Empty = 1.4
SWEP.ReloadHalt = 1.2
SWEP.ReloadHalt_Empty = 1.4
