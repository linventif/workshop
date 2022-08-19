local att = {}
att.name = "bo2_rapidfire"
att.displayName = "Rapid Fire"
att.displayNameShort = "RapidFire"
att.statModifiers = {AimSpreadMult = 2.3, RecoilMult = 0.24}



if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bo2_rapidfire")
att.description = {[1] = {t = "Increases Rate Of Fire", c = CustomizableWeaponry.textColors.POSITIVE},
    [2] = {t = "Greatly decreases overall accuracy", c = CustomizableWeaponry.textColors.VNEGATIVE}}
end

		function att:attachFunc()
		self.FireDelay = self.FireDelay + -0.016
    end
	
			function att:detachFunc()
	self.FireDelay = self.FireDelay_Orig
    end

CustomizableWeaponry:registerAttachment(att)