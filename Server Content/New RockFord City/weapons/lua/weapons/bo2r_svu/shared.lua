AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "SVU-AS"
	SWEP.CSMuzzleFlashes = false
	SWEP.ViewModelMovementScale = 1
	SWEP.SelectIcon = (surface.GetTextureID("vgui/hud/bo2r_svu"))
	SWEP.IconLetter = "x"
	killicon.AddFont("bo2r_b23r", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	killicon.Add( "bo2r_svu", "vgui/hud/bo2r_svu", Color(255, 80, 0, 150)) 
	SWEP.MuzzleEffect = "muzzleflash_g3"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.Shell = "mainshell"
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2, y = 0, z = -3}
	SWEP.AimOverlay = (surface.GetTextureID("models/weapons/bo2r_svu/scope_overlay"))
	SWEP.DrawBlackBarsOnAim = true
	SWEP.FadeDuringAiming = true
	SWEP.MoveWepAwayWhenAiming = true
	
	SWEP.IronsightPos = Vector(-4.424, -13.266, 0.239)
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
	
	SWEP.ACOGPos = Vector(-4.461, -6.5, 0.56)
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
		["bo2_reddot"] = {model = "models/weapons/bo2_attachments/bo2_reddot.mdl", bone = "j_gun", pos = Vector(2.7, 0, 4.52), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["bo2_acog_sniper"] = {model = "models/weapons/bo2_attachments/bo2_acog.mdl", bone = "j_gun", pos = Vector(1.685, 0, 5.348), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_tundra9mm"] = {model = "models/weapons/bo2_attachments/bo2_svu_silencer.mdl", bone = "j_gun", pos = Vector(25.829, 0, 2.67), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)}
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
[2] = {header = "Sight", offset = {700, -400}, atts = {"bo2_acog_sniper"}},
[3] = {header = "Body", offset = {200, 400}, atts = {"bo2_edrl", "bo2_siberia","bo2_bluetiger", "bo2_bloodshot", "bo2_kryptek", "bo2_blossom", "bo2_artwar", "bo2_ronin", "bo2_gold"}},
["+reload"] = {header = "Ammo", offset = {700, 0}, atts = {"bo2_fmj"}}}

SWEP.Animations = {fire = {"shoot"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0.0952, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.45, sound = "BO2_SVU_MAGOUT"},
	[2] = {time = 1.95, sound = "BO2_SVU_MAGIN"}},
	
	
	reload_empty = {[1] = {time = 0.45, sound = "BO2_SVU_MAGOUT"},
	[2] = {time = 1.95, sound = "BO2_SVU_MAGIN"},
	[3] = {time = 2.7, sound = "BO2_SVU_CHARGE"}}}
	


SWEP.SpeedDec = 15

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "Black Ops II Weapons Remastered"

SWEP.Author			= "Megadeth9811"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_bo2r_svu.mdl"
SWEP.WorldModel		= "models/weapons/w_bo2_svu.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 12
SWEP.Primary.DefaultClip	= 96
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 0.144
SWEP.FireSound = "BO2_SVU_FIRE"
SWEP.FireSoundSuppressed = "BO2_SVU_FIRE_SILENCED"
SWEP.Recoil = 1.6

SWEP.AimBreathingIntensity = 1.2
SWEP.AimBreathingEnabled = true
SWEP.ZoomAmount = 50
SWEP.HipSpread = 1.5
SWEP.AimSpread = 0.007
SWEP.VelocitySensitivity = 1.5
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 90
SWEP.DeployTime = 0.8
SWEP.ADSFireAnim = false
SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 3
SWEP.ReloadTime_Empty = 3.9
SWEP.ReloadHalt = 3
SWEP.ReloadHalt_Empty = 3.9
