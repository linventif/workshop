local att = {}
att.name = "bg_gau_ammobelt"
att.displayName = "Extended Ammo Belt"
att.displayNameShort = "Ext Belt"
att.isBG = true

att.statModifiers = {
	ReloadSpeedMult = -0.3,
	OverallMouseSensMult = -0.1
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/gau_longammobelt")
	att.description = {[1] = {t = "Increases ammo size to 3000 rounds.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:unloadWeapon()
	
	self.Primary.ClipSize = 3000
	self.Primary.ClipSize_Orig = 3000
end

function att:detachFunc()
	self:unloadWeapon()
	self.ForegripOverride = false
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)