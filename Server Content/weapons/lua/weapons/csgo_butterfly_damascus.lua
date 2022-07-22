if (SERVER) then

	SWEP.Weight				= 5
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false
end

if ( CLIENT ) then
	SWEP.PrintName			= "Butterfly Knife | Damascus Steel"
	SWEP.DrawAmmo 			= false
	SWEP.DrawCrosshair 		= true
	SWEP.ViewModelFOV		= 65
	SWEP.ViewModelFlip		= false
	SWEP.CSMuzzleFlashes	= true
	SWEP.UseHands			= true
	
	SWEP.Slot				= 2
	SWEP.SlotPos			= 0
	--SWEP.IconLetter			= "j"

	--killicon.AddFont("weapon_knife", "CSKillIcons", SWEP.IconLetter, Color( 255, 80, 0, 255 ))
	--surface.CreateFont("CSKillIcons", {font = "csd", size = ScreenScale(30), weight = 500, antialias = true, additive = true})
	--surface.CreateFont("CSSelectIcons", {font = "csd", size = ScreenScale(60), weight = 500, antialias = true, additive = true})
end

SWEP.Base = "csgo_baseknife"

SWEP.Category			= "CS:GO Knives"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.ViewModel 			= "models/weapons/v_csgo_butterfly.mdl"
SWEP.WorldModel 		= "models/weapons/w_csgo_butterfly.mdl" 

SWEP.DrawWeaponInfoBox  	= false

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
SWEP.Skin 					= "models/csgo_knife/knife_butterfly_dam.vmt"
SWEP.SkinIndex 				= 4