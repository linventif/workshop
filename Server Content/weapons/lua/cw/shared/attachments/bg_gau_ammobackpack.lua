local att = {}
att.name = "bg_gau_ammobackpack"
att.displayName = "Ammo Backpack"
att.displayNameShort = "Ammo BP"
att.isBG = true

att.statModifiers = {
	ReloadSpeedMult = -0.4,
	OverallMouseSensMult = -0.2
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/gau_ammobackpack")
	att.description = {[1] = {t = "Increases ammo size to 6000 rounds.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:unloadWeapon()
	
	self.Primary.ClipSize = 6000
	self.Primary.ClipSize_Orig = 6000
end

function att:detachFunc()
	self:unloadWeapon()
	self.ForegripOverride = false
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)