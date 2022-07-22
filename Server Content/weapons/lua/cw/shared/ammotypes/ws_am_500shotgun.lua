local att = {}
att.name = "ws_am_500shotgun"
att.displayName = "12 Gauge"
att.displayNameShort = "12Gauge"

att.statModifiers = {
	DamageMult = 10,
	RecoilMult = 2,
	FireDelayMult = 0.5,
	AimSpreadMult = 5,
	HipSpreadMult = 5,
	OverallMouseSensMult = -0.15,
	ClumpSpreadMult = 10,
	SpreadPerShotMult = 10,
	MaxSpreadIncMult = 10,
	VelocitySensitivityMult = 10,
	ReloadSpeedMult = -0.005,
	DrawSpeedMult = -0.005
	}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/ws_am_500shotgun")
	att.description = {[1] = {t = "Loads 12 Gauge shotgun shells for a big boom", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.Shots = 10
	self:unloadWeapon()
	self.Primary.Ammo			= "12 Gauge"
	if CLIENT then
		if self.AttachmentModelsVM.ws_am_500shotgun1 then
			self.AttachmentModelsVM.ws_am_500shotgun1.active = true
		end
		if self.AttachmentModelsVM.ws_am_500shotgun2 then
			self.AttachmentModelsVM.ws_am_500shotgun2.active = true
		end
		if self.AttachmentModelsVM.ws_am_500shotgun3 then
			self.AttachmentModelsVM.ws_am_500shotgun3.active = true
		end
			if self.AttachmentModelsVM.ws_am_500shotgun4 then
			self.AttachmentModelsVM.ws_am_500shotgun4.active = true
		end
	end
end

function att:detachFunc()
	self.Shots = self.Shots_Orig
		if CLIENT then
		if self.AttachmentModelsVM.ws_am_500shotgun1 then
			self.AttachmentModelsVM.ws_am_500shotgun1.active = false
		end
		if self.AttachmentModelsVM.ws_am_500shotgun2 then
			self.AttachmentModelsVM.ws_am_500shotgun2.active = false
		end
		if self.AttachmentModelsVM.ws_am_500shotgun3 then
			self.AttachmentModelsVM.ws_am_500shotgun3.active = false
		end
			if self.AttachmentModelsVM.ws_am_500shotgun4 then
			self.AttachmentModelsVM.ws_am_500shotgun4.active = false
		end
	end
	self.Primary.Ammo			= ".500 Magnum"
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)