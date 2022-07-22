AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "GAU-2/A"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "z"
	killicon.Add("cw_gau_minigun", "vgui/kills/cw_gau_minigun", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("vgui/kills/cw_gau_minigun")
	
	SWEP.MuzzleEffect = "muzzleflash_g3"
	SWEP.PosBasedMuz = true
	SWEP.MuzzlePosMod = {x = 0, y = -10, z = 0}
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 4, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 0.6
	SWEP.InvertShellEjectAngle = true
		
	SWEP.CustomizePos = Vector(1.205, -2.211, -2.01)
	SWEP.CustomizeAng = Vector(11.96, 23.215, 0)

	//SWEP.IronsightPos = Vector(-11.641, 0, 1.600)
	//SWEP.IronsightAng = Vector(9.145, 0, 0)
	SWEP.IronsightPos = Vector(-11.681, -4.824, 4.4)
	SWEP.IronsightAng = Vector(2.4, 0, 0)
	
	SWEP.EoTechPos = Vector(-10.681, 0, 3.119)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-10.641, 0, 2.519)
	SWEP.AimpointAng = Vector(0, 0, 0)

	SWEP.MicroT1Pos = Vector(-10.561, 0, 3.72)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
		
	SWEP.SprintPos = Vector(-4.444, -1, 0.082)
	SWEP.SprintAng = Vector(-12.849, 20.23, 0)

	SWEP.SightWithRail = false
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.LaserPosAdjust = Vector(0, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	/*
	SWEP.ACOGPos = Vector(-10.7, -4.412, 3.799)
	SWEP.ACOGAng = Vector(0, 0, 0)
	SWEP.ACOGAxisAlign = {right = 90, up = 0, forward = 180}
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-10.695, -2.412, 2.813), [2] = Vector(0, 0, 0)}}
	*/
	
	SWEP.AttachmentModelsVM = {
	
		["bg_longbarrelgau2"] = { type = "Model", model = "models/props_phx/construct/metal_plate_pipe.mdl", bone = "barrels", rel = "", pos = Vector(-0.801, 22.337, 0.518), angle = Angle(0, 0, 95), size = Vector(0.019, 0.019, 1.2)},
		["bg_longbarrelgau1"] = { type = "Model", model = "models/props_phx/construct/metal_plate_pipe.mdl", bone = "barrels", rel = "", pos = Vector(-0.519, 21.6, -4), angle = Angle(0, 0, 95), size = Vector(0.019, 0.019, 1.2)},
		["bg_longbarrelgau3"] = { type = "Model", model = "models/props_phx/construct/metal_plate_pipe.mdl", bone = "barrels", rel = "", pos = Vector(1.6, 22.337, 0.518), angle = Angle(0, 0, 95), size = Vector(0.019, 0.019, 1.2)},
		["bg_longbarrelgau4"] = { type = "Model", model = "models/props_phx/construct/metal_plate_pipe.mdl", bone = "barrels", rel = "", pos = Vector(2.75, 22.337, -1.8), angle = Angle(0, 0, 95), size = Vector(0.019, 0.019, 1.2)},
		["bg_longbarrelgau5"] = { type = "Model", model = "models/props_phx/construct/metal_plate_pipe.mdl", bone = "barrels", rel = "", pos = Vector(-1.8, 22.337, -1.8), angle = Angle(0, 0, 95), size = Vector(0.019, 0.019, 1.2)},
		["bg_longbarrelgau6"] = { type = "Model", model = "models/props_phx/construct/metal_plate_pipe.mdl", bone = "barrels", rel = "", pos = Vector(1.799, 45.194, -3.75), angle = Angle(0, 0, 95), size = Vector(0.075, 0.075, 0.432)},
		["bg_longbarrelgau7"] = { type = "Model", model = "models/props_phx/construct/metal_plate_pipe.mdl", bone = "barrels", rel = "", pos = Vector(1.557, 21.6, -4), angle = Angle(0, 0, 95), size = Vector(0.019, 0.019, 1.2)},
	
	
		["md_ws_minisup"] = { type = "Model", model = "models/cw2/attachments/556suppressor.mdl", bone = "barrels", rel = "", pos = Vector(1.25, 12.706, -1.101), angle = Angle(0, 0, 4), size = Vector(0.699, 0.699, 0.699)},
		["md_ws_minisup2"] = { type = "Model", model = "models/cw2/attachments/556suppressor.mdl", bone = "barrels", rel = "", pos = Vector(2.352, 12.706, -3.294), angle = Angle(0, 0, 4), size = Vector(0.699, 0.699, 0.699)},
		["md_ws_minisup3"] = { type = "Model", model = "models/cw2/attachments/556suppressor.mdl", bone = "barrels", rel = "", pos = Vector(-1.3, 12.706, -1.101), angle = Angle(0, 0, 4), size = Vector(0.699, 0.699, 0.699)},
		["md_ws_minisup4"] = { type = "Model", model = "models/cw2/attachments/556suppressor.mdl", bone = "barrels", rel = "", pos = Vector(-2.353, 12.706, -3.294), angle = Angle(0, 0, 4), size = Vector(0.699, 0.699, 0.699)},
		["md_ws_minisup5"] = { type = "Model", model = "models/cw2/attachments/556suppressor.mdl", bone = "barrels", rel = "", pos = Vector(1.399, 12.706, -5.301), angle = Angle(0, 0, 4), size = Vector(0.699, 0.699, 0.699)},
		["md_ws_minisup6"] = { type = "Model", model = "models/cw2/attachments/556suppressor.mdl", bone = "barrels", rel = "", pos = Vector(-1.201, 12.706, -5.301), angle = Angle(0, 0, 4), size = Vector(0.699, 0.699, 0.699)},

	
		["md_anpeq15"] = { type = "Model", model = "models/cw2/attachments/anpeq15.mdl", bone = "DrawCall_0041", rel = "", pos = Vector(5.4, -24.417, -7.5), angle = Angle(0, -90, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "DrawCall_0041", rel = "", pos = Vector(8.199, -6.7, -18.951), angle = Angle(0, -180, 0), size = Vector(2.378, 2.378, 2.378)},
		["md_eotech"] = { type = "Model", model = "models/wystan/attachments/2otech557sight.mdl", bone = "DrawCall_0041", rel = "", pos = Vector(7.099, 0, -25.455), angle = Angle(0, 90, 0), size = Vector(1.858, 1.858, 1.858)},
		["md_microt1"] = { type = "Model", model = "models/cw2/attachments/microt1.mdl", bone = "DrawCall_0041", rel = "", pos = Vector(7.5, -21, -5.5), angle = Angle(0, 0, 0), size = Vector(0.754, 0.754, 0.754)},
		["bg_bipod"] = { type = "Model", model = "models/cw2/attachments/microt1.mdl", bone = "DrawCall_0041", rel = "", pos = Vector(0, -4.597, 24.416), angle = Angle(106.363, 43.247, 0), size = Vector(0.1, 0.699, 0.699)},
		//["md_acog"] = { type = "Model", model = "models/wystan/attachments/2cog.mdl", bone = "DrawCall_0041", rel = "", pos = Vector(8, -15, -10.5), angle = Angle(0, 180, 0), size = Vector(0.898, 0.898, 0.898)}

	}

	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 1, roll = 1, forward = 0.5, pitch = 0.5}
	SWEP.CustomizationMenuScale = 0.025
end

SWEP.RailBGs = {main = 0, on = 0, off = 0}
SWEP.BipodBGs = {main = 0, on = 0, off = 0}
SWEP.SightBGs = {main = 0, sg1 = 0, none = 0}
SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {600, -300},  atts = {"md_microt1", "md_eotech", "md_aimpoint"}},
	[2] = {header = "Handguard", offset = {-400, 150}, atts = {"bg_bipod"}},
	[3] = {header = "Barrel", offset = {600, -700}, atts = {"md_ws_minisup", "bg_longbarrelgau"}},
	[4] = {header = "Base", offset = {-400, -700}, atts = {"md_anpeq15"}},
	[5] = {header = "Ammo Belt", offset = {-400, -250}, atts = {"bg_gau_ammobelt", "bg_gau_ammobackpack"}},
	["+reload"] = {header = "Ammo", offset = {600, 100}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload = "reload",
	idle = "idle1",
	draw = "draw"}
	
	SWEP.BipodFireAnim = true
	
SWEP.Sounds = {
	//draw = {[1] = {time = 0, sound = "CW_GAU_SPIN"}},
	//shoot1 = {[1] = {time = 0, sound = "CW_GAU_SPIN"}},
	shoot2 = {[1] = {time = 0, sound = "CW_GAU_SPIN"}},
	
	reload = {
	[1] = {time = 0.70, sound = "CW_GAUMINIGUN_RELOAD"},
	[2] = {time = 3, sound = "CW_GAU_SPIN"}}}
	
	
SWEP.SpeedDec = 40

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "shotgun"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 White Snow"

SWEP.Author			= "White Snow"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.AimViewModelFOV = 70
SWEP.ViewModelFOV	= 75
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_deat_m249para.mdl"
SWEP.WorldModel		= "models/weapons/w_blopsminigun.mdl"
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/w_blopsminigun.mdl"
SWEP.WMPos = Vector(0,6,-32)
SWEP.WMAng = Vector(-10,1,90)
SWEP.ADSFireAnim = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 1500
SWEP.Primary.DefaultClip	= 1500
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 0
SWEP.FireSound = "CW_GAUMINIGUN_FIRE"
SWEP.FireSoundSuppressed = "CW_G3A3_FIRE_SUPPRESSED"
SWEP.Recoil = 0.05

SWEP.HipSpread = 0.03
SWEP.AimSpread = 0.001
SWEP.VelocitySensitivity = 2
SWEP.MaxSpreadInc = 0.02
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 70
SWEP.DeployTime = 1

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2
SWEP.ReloadTime_Empty = 2
SWEP.ReloadHalt = 4.85
SWEP.ReloadHalt_Empty = 4.85
SWEP.Chamberable = false