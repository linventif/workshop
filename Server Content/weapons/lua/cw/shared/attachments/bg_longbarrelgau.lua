local att = {}
att.name = "bg_longbarrelgau"
att.displayName = "Minigun Long Barrel"
att.displayNameShort = "Mini LNGRNG"
att.isBG = true

att.statModifiers = {DamageMult = 0.1,
AimSpreadMult = -0.1,
RecoilMult = 0.1,
OverallMouseSensMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15longbarrel")
	att.description = {[1] = {t = "A barrel for long range engagements.", c = CustomizableWeaponry.textColors.REGULAR}}
end

function att:attachFunc()
	self:updateSoundTo("CW_GAUMINIGUN_FIRE", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self:updateSoundTo("CW_G3A3_FIRE_SUPPRESSED", CustomizableWeaponry.sounds.SUPPRESSED)
	if CLIENT then
		if self.AttachmentModelsVM.bg_longbarrelgau1 then
			self.AttachmentModelsVM.bg_longbarrelgau1.active = true
		end
		if self.AttachmentModelsVM.bg_longbarrelgau2 then
			self.AttachmentModelsVM.bg_longbarrelgau2.active = true
		end
		if self.AttachmentModelsVM.bg_longbarrelgau3 then
			self.AttachmentModelsVM.bg_longbarrelgau3.active = true
		end
			if self.AttachmentModelsVM.bg_longbarrelgau4 then
			self.AttachmentModelsVM.bg_longbarrelgau4.active = true
		end
		if self.AttachmentModelsVM.bg_longbarrelgau5 then
			self.AttachmentModelsVM.bg_longbarrelgau5.active = true
		end
		if self.AttachmentModelsVM.bg_longbarrelgau6 then
			self.AttachmentModelsVM.bg_longbarrelgau6.active = true
		end
		if self.AttachmentModelsVM.bg_longbarrelgau7 then
			self.AttachmentModelsVM.bg_longbarrelgau7.active = true
		end
	end
end

function att:detachFunc()
	self:restoreSound()
		if CLIENT then
		if self.AttachmentModelsVM.bg_longbarrelgau1 then
			self.AttachmentModelsVM.bg_longbarrelgau1.active = false
		end
		if self.AttachmentModelsVM.bg_longbarrelgau2 then
			self.AttachmentModelsVM.bg_longbarrelgau2.active = false
		end
		if self.AttachmentModelsVM.bg_longbarrelgau3 then
			self.AttachmentModelsVM.bg_longbarrelgau3.active = false
		end
			if self.AttachmentModelsVM.bg_longbarrelgau4 then
			self.AttachmentModelsVM.bg_longbarrelgau4.active = false
		end
		if self.AttachmentModelsVM.bg_longbarrelgau5 then
			self.AttachmentModelsVM.bg_longbarrelgau5.active = false
		end
		if self.AttachmentModelsVM.bg_longbarrelgau6 then
			self.AttachmentModelsVM.bg_longbarrelgau6.active = false
		end
		if self.AttachmentModelsVM.bg_longbarrelgau7 then
			self.AttachmentModelsVM.bg_longbarrelgau7.active = false
		end
	end
end

CustomizableWeaponry:registerAttachment(att)