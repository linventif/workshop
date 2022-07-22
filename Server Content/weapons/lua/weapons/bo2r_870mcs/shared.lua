AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Remington 870MCS"
	SWEP.CSMuzzleFlashes = false
	SWEP.ViewModelMovementScale = 1
	SWEP.SelectIcon = (surface.GetTextureID("vgui/hud/bo2r_870mcs"))
	SWEP.IconLetter = "x"
	killicon.AddFont("bo2r_870mcs", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	killicon.Add( "bo2r_870mcs", "vgui/hud/bo2r_870mcs", Color(255, 80, 0, 150)) 
	SWEP.MuzzleEffect = "muzzleflash_shotgun"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.Shell = "shotshell"
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2, y = 0, z = -3}
	SWEP.ShellDelay = 0.5

	
	SWEP.IronsightPos = Vector(-3.36, -0.805, 0.759)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	-- MP5SD variant ironsight pos
	SWEP.SDPos = Vector(2.032, -3.323, 0.759)
	SWEP.SDAng = Vector(0.338, -0.005, 0)
		
	-- MP5K variant ironsight pos
	SWEP.KPos = Vector(2.032, -3.323, 0.759)
	SWEP.KAng = Vector(0.187, -0.005, 0)

	SWEP.MicroT1Pos = Vector(-3.37, -6.529, -0.06)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
			
		
	SWEP.EoTechPos = Vector(-3.78, -3.161, 0.3)
	SWEP.EoTechAng = Vector(-0.141, 0, 0)
	
	SWEP.AimpointPos = Vector(-3.381, -4.238, 0.159)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.ACOGPos = Vector(-3.78, -3.161, 0.6)
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
		["bo2_reddot"] = {model = "models/weapons/bo2_attachments/bo2_reddot.mdl", bone = "j_gun", pos = Vector(9.202, 0, 4.289), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["bo2_mms"] = {model = "models/weapons/bo2_attachments/bo2_mms.mdl", bone = "j_gun", pos = Vector(9.482, 0, 4.354), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_tundra9mm"] = {model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "j_gun", pos = Vector(31.974, 0, 1.542), angle = Angle(0, -90, 0), size = Vector(1.5, 1.5, 1.5)}
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
[2] = {header = "Sight", offset = {700, -400}, atts = {"bo2_reddot", "bo2_mms"}},
[3] = {header = "Body", offset = {200, 400}, atts = {"bo2_edrl", "bo2_siberia","bo2_bluetiger", "bo2_bloodshot", "bo2_kryptek", "bo2_blossom", "bo2_artwar", "bo2_ronin", "bo2_gold"}}}


SWEP.Animations = {fire = {"shoot"},
	insert = "insert",
	reload_start = "reload_start",
	reload_end = "reload_end",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0.0952, sound = "CW_FOLEY_MEDIUM"}},

	shoot = {[1] = {time = 0.35, sound = "BO2_REM_PUMP"}},
	
	insert = {[1] = {time = 0.2, sound = "BO2_REM_SHELL"}},

	reload_end = {[1] = {time = 0.1, sound = "BO2_REM_PUMP"}},
	
	reload_start = {[1] = {time = 0, sound = "CW_FOLEY_MEDIUM"}}}

	


SWEP.SpeedDec = 7

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "shotgun"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"pump"}
SWEP.Base = "cw_base"
SWEP.Category = "Black Ops II Weapons Remastered"

SWEP.Author			= "Megadeth9811"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_bo2r_870mcs.mdl"
SWEP.WorldModel		= "models/weapons/w_bo2_870mcs.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.Primary.ClipSize		= 8
SWEP.Primary.DefaultClip	= 64
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "12 Gauge"
SWEP.ShotgunReload = true
SWEP.ReloadStartTime = 0.5
SWEP.InsertShellTime = 0.6
SWEP.ReloadFinishWait = 1
SWEP.ReticleInactivityPostFire = 0.9

SWEP.Chamberable = false
SWEP.FireDelay = 0.9
SWEP.FireSound = "BO2_REM_FIRE"
SWEP.FireSoundSuppressed = "BO2_REM_FIRE_SILENCED"
SWEP.Recoil = 2.5

SWEP.ClumpSpread = 0.03
SWEP.CanPenetrate = false
SWEP.Shots = 7
SWEP.ReloadViewBobEnabled = false
SWEP.ZoomAmount = 5
SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.05
SWEP.VelocitySensitivity = 1.5
SWEP.MaxSpreadInc = 0.1
SWEP.SpreadPerShot = 0.1
SWEP.SpreadCooldown = 0.13
SWEP.Damage = 14
SWEP.DeployTime = 0.8
SWEP.ADSFireAnim = true
SWEP.ReloadSpeed = 0.8
SWEP.ReloadTime = 1.3
SWEP.ReloadTime_Empty = 1.4
SWEP.ReloadHalt = 1.2
SWEP.ReloadHalt_Empty = 1.4
