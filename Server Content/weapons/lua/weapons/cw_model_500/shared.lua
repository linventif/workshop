AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")
//SCK Name: 500
//SHotgun shell name: 500shell
//Cover postion name: 500pos
if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "SAW Model .500"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "i"
	killicon.Add("cw_model_500", "vgui/kills/cw_model_500", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("vgui/kills/cw_model_500")
	
	SWEP.MuzzleEffect = "muzzleflash_pistol_rbull"
	SWEP.PosBasedMuz = true
	SWEP.MuzzlePosMod = {x = 0, y = 0, z = 0}
	SWEP.NoShells = true
	
	SWEP.BackupReflexPos = Vector(-2.84, 0, -0.201)
	SWEP.BackupReflexAng = Vector(0, 0, -45)
	
	SWEP.CoD4ReflexPos = Vector(-1.9, 0, -0.53)
	SWEP.CoD4ReflexAng = Vector(0.1, 0, 0)

	SWEP.CoD4TascoPos = Vector(-1.91, 0, -0.05)
	SWEP.CoD4TascoAng = Vector(0.1, 0, 0)
	
	SWEP.FAS2AimpointPos = Vector(-1.91, 0, -0.32)
	SWEP.FAS2AimpointAng = Vector(0.1, 0, 0)
	
	SWEP.LeupoldPos = Vector(-1.92, 0, -0.491)
	SWEP.LeupoldAng = Vector(0.1, 0, 0)
	SWEP.LeupoldAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.HoloPos = Vector(-1.91, 0, -0.47)
	SWEP.HoloAng = Vector(0.1, 0, 0)
	
	SWEP.ACOGPos = Vector(-1.951, 0, -0.75)
	SWEP.ACOGAng = Vector(0.1, 0, 0)
	
	SWEP.CoD4ACOGPos = Vector(-1.93, 0, -0.51)
	SWEP.CoD4ACOGAng = Vector(0.1, 0, 0)
	
	SWEP.CoD4ACOGAxisAlign = {right = -0.1, up = 180, forward = 0}

	SWEP.EoTech552Pos = Vector(-1.88, 0, -0.87)
	SWEP.EoTech552Ang = Vector(0.1, 0, 0)
	
	SWEP.EoTech553Pos = Vector(-1.89, 0, -0.88)
	SWEP.EoTech553Ang = Vector(0.1, 0, 0)
	
	SWEP.AimpointPos = Vector(-1.91, 0, -0.52)
	SWEP.AimpointAng = Vector(0.1, 0, 0)
	
	SWEP.EoTechPos = Vector(-1.88, 0, -0.75)
	SWEP.EoTechAng = Vector(0.1, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-1.93, 0, -0.35)
	SWEP.MicroT1Ang = Vector(0.1, 0, 0)
	
	SWEP.SprintPos = Vector(-0.721, -4.222, -2.481)
	SWEP.SprintAng = Vector(36.583, 0, 0)

	SWEP.CustomizePos = Vector(3.96, -2.01, -2.411)
	SWEP.CustomizeAng = Vector(19.697, 25.326, 5)

	SWEP.IronsightPos = Vector(-1.925, 0, 0.349)
	SWEP.IronsightAng = Vector(0.1, 0, 0)

	SWEP.SprintPos = Vector(0.256, 0.01, 1.2)
	SWEP.SprintAng = Vector(-17.778, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.281, 1.325, -0.52)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.DeltaPos = Vector(-1.93, 0, -0.11)
	SWEP.DeltaAng = Vector(0.1, 0, 0)

	SWEP.CantedPos = Vector(-3.161, 0, -0.04)
	SWEP.CantedAng = Vector(0.5, 0.3, -45)

	SWEP.RscopePos = Vector(-1.89, 0, -0.13)
	SWEP.RscopeAng = Vector(0.1, 0, 0)
	SWEP.BFRIFLEAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.thisISnothingPos = Vector(0, 0, 0)
	SWEP.thisISnothingAng = Vector(0, 0, 0)
	
	/*
	SWEP.MW3SPos = Vector(-1.91, 0, -0.911)
	SWEP.MW3SAng = Vector(0.1, 0, 0)
	SWEP.MW3SAxisAlign = {right = 0, up = -50, forward = 0}
	*/
	
	SWEP.CoyotePos = Vector(-1.92, 0, -0.461)
	SWEP.CoyoteAng = Vector(0.1, 0, 0)

	SWEP.BFReflexPos = Vector(-1.9, 0, -0.426)
	SWEP.BFReflexAng = Vector(0.1, 0, 0)

	SWEP.SightWithRail = true
	
	SWEP.ViewModelMovementScale = 0.8
	SWEP.FullAimViewmodelRecoil = true
	SWEP.HUD_MagText = "CYLINDER: "
	
	SWEP.BoltBone = "hammer"
	SWEP.BoltShootOffset = Vector(0, 0, -1)
	SWEP.HoldBoltWhileEmpty = false
	SWEP.DontHoldWhenReloading = true
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 1.5, roll = 3, forward = 1, pitch = 4}
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.AttachmentModelsVM = {
		["md_couldbewhat"] = { type = "Model", model = "models/rageattachments/cantedsightrear.mdl", bone = "Cylinder18", rel = "", pos = Vector(0, -2.25, 2.299), angle = Angle(0, 90, 0), size = Vector(0.899, 0.899, 0.899)},
		["md_cantedsights"] = { type = "Model", model = "models/rageattachments/cantedsightfront.mdl", bone = "Cylinder18", rel = "", pos = Vector(0.1, -7.5, 2.349), angle = Angle(0, 90, 0), size = Vector(0.899, 0.899, 0.899)},
		["md_backup_reflex"] = { type = "Model", model = "models/c_docter.mdl", bone = "Cylinder18", rel = "", pos = Vector(0.449, -7.801, 2.849), angle = Angle(0, 90, 45), size = Vector(0.698, 0.698, 0.698)},
		["md_backup_reflex_rail"] = { type = "Model", model = "models/c_angled_rails.mdl", bone = "Cylinder18", rel = "", pos = Vector(0, -7, 2.23), angle = Angle(0, 90, 0), size = Vector(1, 1, 1)},
		["md_fas2_eotech"] = { type = "Model", model = "models/c_fas2_eotech.mdl", bone = "Cylinder18", rel = "", pos = Vector(-0.015, -6.301, 2.2), angle = Angle(0, 90, 0), size = Vector(1.149, 1.149, 1.149), adjustment = {min = -9, max = -6.301, axis = "y", inverse = true}},
		["md_fas2_eotech_stencil"] = { type = "Model", model = "models/c_fas2_eotech_stencil.mdl", bone = "Cylinder18", rel = "", pos = Vector(-0.015, -6.301, 2.2), angle = Angle(0, 90, 0), size = Vector(1.149, 1.149, 1.149)},	
		["ws_am_500shotgun1"] = { type = "Model", model = "models/weapons/shotgun_shell.mdl", bone = "Bullets", rel = "", pos = Vector(0.449, -1.56, -0.101), angle = Angle(0, 90, 0), size = Vector(0.36, 0.36, 0.36)},
		["ws_am_500shotgun4"] = { type = "Model", model = "models/weapons/shotgun_shell.mdl", bone = "Bullets", rel = "", pos = Vector(0.009, -1.56, 0.2), angle = Angle(0, 90, 0), size = Vector(0.36, 0.36, 0.36)},
		["ws_am_500shotgun3"] = { type = "Model", model = "models/weapons/shotgun_shell.mdl", bone = "Bullets", rel = "", pos = Vector(-0.301, -1.56, -0.65), angle = Angle(0, 90, 0), size = Vector(0.36, 0.36, 0.36)},
		["ws_am_500shotgun2"] = { type = "Model", model = "models/weapons/shotgun_shell.mdl", bone = "Bullets", rel = "", pos = Vector(0.27, -1.56, -0.65), angle = Angle(0, 90, 0), size = Vector(0.36, 0.36, 0.36)},
		["ws_am_500shotgun"] = { type = "Model", model = "models/weapons/shotgun_shell.mdl", bone = "Bullets", rel = "", pos = Vector(-0.45, -1.56, -0.101), angle = Angle(0, 90, 0), size = Vector(0.36, 0.36, 0.36)},
		["md_cod4_eotech_v2"] = { type = "Model", model = "models/v_cod4_eotech.mdl", bone = "Cylinder18", rel = "", pos = Vector(-0.01, 1.149, -0.201), angle = Angle(0, -90, 0), size = Vector(0.899, 0.899, 0.899), adjustment = {min = -1.1, max = 1.149, axis = "y", inverse = true}},
		["md_fas2_leupold_mount"] = { type = "Model", model = "models/v_fas2_leupold_mounts.mdl", bone = "Cylinder18", rel = "", pos = Vector(0, -1.41, 3.635), angle = Angle(0, 90, 0), size = Vector(1.299, 1.299, 1.299)},
		["md_fas2_leupold"] = { type = "Model", model = "models/v_fas2_leupold.mdl", bone = "Cylinder18", rel = "", pos = Vector(0, -1.76, 3.635), angle = Angle(0, 90, 0), size = Vector(1.299, 1.299, 1.299)},
		//["md_acog"] = { type = "Model", model = "models/wystan/attachments/2cog.mdl", bone = "Cylinder18", rel = "", pos = Vector(0.349, 2.65, -2.5), angle = Angle(0, -180, 0), size = Vector(0.899, 0.899, 0.899), color = Color(255, 255, 255, 255)},
		["md_fas2_holo"] = { type = "Model", model = "models/v_holo_sight_kkrc.mdl", bone = "Cylinder18", rel = "", pos = Vector(0, 0, -0.65), angle = Angle(0, 90, 0), size = Vector(0.6, 0.6, 0.6), adjustment = {min = -5, max = 0, axis = "y", inverse = true}},
		["md_fas2_holo_aim"] = { type = "Model", model = "models/v_holo_sight_orig_hx.mdl", bone = "Cylinder18", rel = "", pos = Vector(0, 0, -0.65), angle = Angle(0, 90, 0), size = Vector(0.6, 0.6, 0.6), adjustment = {min = -5, max = 0, axis = "y", inverse = true}},
		["md_cod4_acog_v2"] = { type = "Model", model = "models/v_cod4_acog.mdl", bone = "Cylinder18", rel = "", pos = Vector(0, 0.5, 0.25), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8), adjustment = {min = -2.5, max = 0.5, axis = "y", inverse = true}},
		["md_fas2_aimpoint"] = { type = "Model", model = "models/c_fas2_aimpoint_rigged.mdl", bone = "Cylinder18", rel = "", pos = Vector(0, -4.75, 2.109), angle = Angle(0, 90, 0), size = Vector(0.899, 0.899, 0.899), color = Color(255, 255, 255, 255), adjustment = {min = -9, max = -4.75, axis = "y", inverse = true}},
		["md_cod4_aimpoint_v2"] = { type = "Model", model = "models/v_cod4_aimpoint.mdl", bone = "Cylinder18", rel = "", pos = Vector(0, 0.5, 0.75), angle = Angle(0, -90, 0), size = Vector(0.6, 0.6, 0.6), adjustment = {min = -3.2, max = 0.5, axis = "y", inverse = true}},
		["md_cod4_reflex"] = { type = "Model", model = "models/v_cod4_reflex.mdl", bone = "Cylinder18", rel = "", pos = Vector(0, 1.5, -0.101), angle = Angle(0, -90, 0), size = Vector(0.85, 0.85, 0.85), adjustment = {min = -2.3, max = 1.5, axis = "y", inverse = true}},
		["md_bfreflex"] = { type = "Model", model = "models/rageattachments/usareddot.mdl", bone = "Cylinder18", rel = "", pos = Vector(0.059, -2.6, 2.2), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8), adjustment = {min = -7, max = -2.6, axis = "y", inverse = true}},
		["md_cyotesight"] = { type = "Model", model = "models/rageattachments/cyotesight.mdl", bone = "Cylinder18", rel = "", pos = Vector(-0.01, -2.597, 2.299), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8), adjustment = {min = -7, max = -2.597, axis = "y", inverse = true}},
		//["md_mw3scope"] = { type = "Model", model = "models/rageattachments/v_msrscope.mdl", bone = "Cylinder18", rel = "", pos = Vector(-0.151, -3.5, 1.6), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8), adjustment = {min = -6, max = -3.5, axis = "y", inverse = true}},
		["md_bfriflescope"] = { type = "Model", model = "models/rageattachments/sniperscopesv.mdl", bone = "Cylinder18", rel = "", pos = Vector(0.009, -2.1, 2.46), angle = Angle(0, 0, 0), size = Vector(0.6, 0.6, 0.6), adjustment = {min = -6, max = -2.1, axis = "y", inverse = true}},
		["md_deltasight"] = { type = "Model", model = "models/rageattachments/deltasight.mdl", bone = "Cylinder18", rel = "", pos = Vector(0, -2, 2.299), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), adjustment = {min = -7.5, max = -2, axis = "y", inverse = true}},
		["md_aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "Cylinder18", rel = "", pos = Vector(0.2, 2.6, -1.8), angle = Angle(0, -180, 0), size = Vector(0.8, 0.8, 0.8), adjustment = {min = -1.25, max = 2.6, axis = "y", inverse = true}},
		["md_eotech"] = { type = "Model", model = "models/wystan/attachments/2otech557sight.mdl", bone = "Cylinder18", rel = "", pos = Vector(-0.301, 8.5, -8), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), adjustment = {min = 5, max = 8.5, axis = "y", inverse = true}},
		["md_microt1"] = { type = "Model", model = "models/cw2/attachments/microt1.mdl", bone = "Cylinder18", rel = "", pos = Vector(0, -2, 2.799), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), adjustment = {min = -6.8, max = -2, axis = "y", inverse = true}},
		["md_rail"] = { type = "Model", model = "models/wystan/attachments/rail.mdl", bone = "Cylinder18", rel = "", pos = Vector(-0.22, -5.5, 1.799), angle = Angle(0, -90, 0), size = Vector(1.1, 1, 0.497)},
		["md_lasersight"] = { type = "Model", model = "models/rageattachments/pistoltribeam.mdl", bone = "Cylinder18", rel = "", pos = Vector(0, -5.2, 0.15), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8), adjustment = {min = -9, max = -5.2, axis = "y", inverse = true}}
	}
	
	SWEP.CompM4SBoneMod = {}
	
	SWEP.LaserPosAdjust = Vector(0, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 0, 0) 
	
end

SWEP.BarrelBGs = {main = 1, regular = 1, long = 2, short = 0}
SWEP.LuaViewmodelRecoil = false
SWEP.CanRestOnObjects = false

if CustomizableWeaponry_KK_HK416 and CustomizableWeaponry_Fluffy_Zorua then
	SWEP.AttachmentDependencies = {
		["md_cantedsights"] = {"md_bfriflescope", "md_bfreflex", "md_cyotesight", "md_deltasight", "md_eotech", "md_fas2_leupold"},
		["md_backup_reflex"] = {"md_cod4_reflex","md_cod4_eotech_v2","md_cod4_aimpoint_v2","md_fas2_eotech","md_fas2_aimpoint", "md_aimpoint", "md_microt1", "md_fas2_holo", "md_cod4_acog_v2"}
	}
elseif CustomizableWeaponry_KK_HK416 then
	SWEP.AttachmentDependencies = {
		["md_backup_reflex"] = {"md_cod4_reflex","md_cod4_eotech_v2","md_cod4_aimpoint_v2","md_fas2_eotech","md_fas2_aimpoint", "md_aimpoint", "md_microt1", "md_fas2_holo", "md_cod4_acog_v2"}
	}
elseif CustomizableWeaponry_Fluffy_Zorua then
	SWEP.AttachmentDependencies = {	
		["md_cantedsights"] = {"md_deltasight", "md_bfreflex", "md_cyotesight", "md_microt1", "md_eotech", "md_aimpoint", "md_bfriflescope"}
	}
else
	SWEP.AttachmentDependencies = {}
end


if CustomizableWeaponry_KK_HK416 and CustomizableWeaponry_Fluffy_Zorua then
	SWEP.Attachments = {
		[1] = {header = "Sight", offset = {-650, -400},  atts = {"md_deltasight", "md_bfreflex", "md_cyotesight", "md_cod4_reflex", "md_microt1", "md_eotech", "md_cod4_eotech_v2", "md_fas2_eotech", "md_aimpoint", "md_cod4_aimpoint_v2","md_fas2_aimpoint","md_cod4_acog_v2","md_fas2_holo", "md_fas2_leupold", "md_bfriflescope"}},
		[2] = {header = "Barrel", offset = {-600, 150}, atts = {"md_lasersight"}},
		[3] = {header = "Hybrid Sights", offset = {0, 600}, atts = {"md_backup_reflex", "md_cantedsights"}},
		["+reload"] = {header = "Ammo", offset = {-600, 600}, atts = {"am_matchgrade", "ws_am_500shotgun"}},
		["impulse 100"] = {header = "Skins", offset = {800, 300}, atts = {"bg_wsmodel500_paint1", "bg_wsmodel500_paint2"}},
		["+attack2"] = {header = "Perks", offset = {800, -100}, atts = {"pk_sleightofhand", "pk_light"}}
	}
elseif CustomizableWeaponry_KK_HK416 then
	SWEP.Attachments = {
		[1] = {header = "Sight", offset = {-650, -400},  atts = {"md_cod4_reflex", "md_microt1", "md_eotech", "md_cod4_eotech_v2", "md_fas2_eotech", "md_aimpoint", "md_cod4_aimpoint_v2","md_fas2_aimpoint","md_cod4_acog_v2","md_fas2_holo", "md_fas2_leupold"}},
		[2] = {header = "Hybrid Sights", offset = {0, 600}, atts = {"md_backup_reflex"}},
		["+reload"] = {header = "Ammo", offset = {-600, 600}, atts = {"am_matchgrade", "ws_am_500shotgun"}},
		["impulse 100"] = {header = "Skins", offset = {800, 300}, atts = {"bg_wsmodel500_paint1", "bg_wsmodel500_paint2"}}
	}
elseif CustomizableWeaponry_Fluffy_Zorua then
	SWEP.Attachments = {
		[1] = {header = "Sight", offset = {-650, -400},  atts = {"md_deltasight", "md_bfreflex", "md_cyotesight", "md_microt1", "md_eotech", "md_aimpoint", "md_bfriflescope"}},
		[2] = {header = "Barrel", offset = {-600, 150}, atts = {"md_lasersight"}},
		[3] = {header = "Hybrid Sights", offset = {0, 600}, atts = {"md_cantedsights"}},
		["+reload"] = {header = "Ammo", offset = {-600, 600}, atts = {"am_matchgrade", "ws_am_500shotgun"}},
		["impulse 100"] = {header = "Skins", offset = {800, 300}, atts = {"bg_wsmodel500_paint1", "bg_wsmodel500_paint2"}},
		["+attack2"] = {header = "Perks", offset = {800, -100}, atts = {"pk_sleightofhand", "pk_light"}}
	}
else
	SWEP.Attachments = {
		[1] = {header = "Sight", offset = {-650, -400},  atts = {"md_microt1", "md_eotech", "md_aimpoint"}},
		["+reload"] = {header = "Ammo", offset = {-600, 600}, atts = {"am_matchgrade", "ws_am_500shotgun"}},
		["impulse 100"] = {header = "Skins", offset = {800, 300}, atts = {"bg_wsmodel500_paint1", "bg_wsmodel500_paint2"}}
	}
end

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload = "reload",
	idle = "idle1",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_WS_MODEL500_DRAW"}},

	reload = {[1] = {time = 0.2, sound = "CW_WS_MODEL500_CLIPOUT"},
			[2] = {time = 0.6, sound = "CW_WS_MODEL500_CLIPIN"},
			[3] = {time = 1, sound = "CW_WS_MODEL500_SLIDEBACK"}}
	}

SWEP.SpeedDec = 10

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "revolver"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"double"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 White Snow"

SWEP.Author			= "White Snow"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.AimViewModelFOV = 50
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/Model 500/v_pist_SWM500.mdl"
SWEP.WorldModel		= "models/weapons/Model 500/w_pist_SWM500.mdl"
SWEP.ADSFireAnim = false
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/Model 500/w_pist_SWM500.mdl"
SWEP.WMPos = Vector(-0.5, 0, -0.2)
SWEP.WMAng = Vector(-3,1,180)
SWEP.CustomizationMenuScale = 0.01
	
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 5
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".500 Magnum"

SWEP.FireDelay = 0.25
SWEP.FireSound = "CW_WS_MODEL500_FIRE"
SWEP.Recoil = 3.5

SWEP.HipSpread = 0.019
SWEP.AimSpread = 0.007
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 0.25
SWEP.Shots = 1
SWEP.Damage = 80
SWEP.DeployTime = 1
SWEP.Chamberable = false
SWEP.ClumpSpread = 0.001 //0.001

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 1
SWEP.ReloadHalt = 2

SWEP.ReloadTime_Empty = 1
SWEP.ReloadHalt_Empty = 2