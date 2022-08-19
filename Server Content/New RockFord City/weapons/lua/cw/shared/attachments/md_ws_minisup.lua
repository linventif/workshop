local att = {}
att.name = "md_ws_minisup"
att.displayName = "Minigun Suppressor"
att.displayNameShort = "Mini Sup"
att.isSuppressor = true

att.statModifiers = {OverallMouseSensMult = -0.1,
RecoilMult = -0.15,
DamageMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/saker")
	att.description = {[1] = {t = "Decreases firing noise.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.dt.Suppressed = true
		if CLIENT then
		if self.AttachmentModelsVM.md_ws_minisup2 then
			self.AttachmentModelsVM.md_ws_minisup2.active = true
		end
		if self.AttachmentModelsVM.md_ws_minisup3 then
			self.AttachmentModelsVM.md_ws_minisup3.active = true
		end
		if self.AttachmentModelsVM.md_ws_minisup4 then
			self.AttachmentModelsVM.md_ws_minisup4.active = true
		end
			if self.AttachmentModelsVM.md_ws_minisup5 then
			self.AttachmentModelsVM.md_ws_minisup5.active = true
		end
		if self.AttachmentModelsVM.md_ws_minisup6 then
			self.AttachmentModelsVM.md_ws_minisup6.active = true
		end
	end
end

function att:detachFunc()
	self.dt.Suppressed = false
		if CLIENT then
		if self.AttachmentModelsVM.md_ws_minisup2 then
			self.AttachmentModelsVM.md_ws_minisup2.active = false
		end
		if self.AttachmentModelsVM.md_ws_minisup3 then
			self.AttachmentModelsVM.md_ws_minisup3.active = false
		end
		if self.AttachmentModelsVM.md_ws_minisup4 then
			self.AttachmentModelsVM.md_ws_minisup4.active = false
		end
			if self.AttachmentModelsVM.md_ws_minisup5 then
			self.AttachmentModelsVM.md_ws_minisup5.active = false
		end
		if self.AttachmentModelsVM.md_ws_minisup6 then
			self.AttachmentModelsVM.md_ws_minisup6.active = false
		end
	end
end

CustomizableWeaponry:registerAttachment(att)