local att = {}
att.name = "bo2_mms"
att.displayName = "Millimeter Scanner"
att.displayNameShort = "MMS"
att.aimPos = {"MicroT1Pos", "MicroT1Ang"}
att.FOVModifier = 25
att.isSight = true
att.isBG = true
att.statModifiers = {OverallMouseSensMult = -0.07}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bo2_mms")
	att.description = {[1] = {t = "Provides a bright reticle to ease aiming.", c = CustomizableWeaponry.textColors.POSITIVE},
						[2] = {t = "Increased weapon zoom.", c = CustomizableWeaponry.textColors.POSITIVE}}
					  
					   


	
	att.reticle = "bo2r/attachments/reticles/mms_reticle"
	att._reticleSize = 2.4
	

end

    function att:attachFunc()
        self:setBodygroup(self.SightBGs.main, self.SightBGs.none)
        end

CustomizableWeaponry:registerAttachment(att)