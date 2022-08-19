local att = {}
att.name = "bo2_reddot"
att.displayName = "Reflex Sight"
att.displayNameShort = "Reflex"
att.aimPos = {"AimpointPos", "AimpointAng"}
att.FOVModifier = 15
att.isSight = true
att.isBG = true
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bo2_reddot")
	att.description = {[1] = {t = "Provides a bright reticle to ease aiming.", c = CustomizableWeaponry.textColors.POSITIVE}}


	
	att.reticle = "bo2r/attachments/reticles/reddot_reticule"
	att._reticleSize = 5
	
	function att:drawReticle()
		if not self:isAiming() or not self:isReticleActive() then
			return
		end
		
		diff = self:getDifferenceToAimPos(self.AimpointPos, self.AimpointAng, 1)
		
		-- draw the reticle only when it's close to center of the aiming position
		if diff > 0.9 and diff < 1.1 then
			cam.IgnoreZ(true)
				render.SetMaterial(att._reticle)
				dist = math.Clamp(math.Distance(1, 1, diff, diff), 0, 0.13)
				
				local EA = self.Owner:EyeAngles() + self.Owner:GetPunchAngle()
				
				local renderColor = self:getSightColor(att.name)
				renderColor.a = (0.13 - dist) / 0.13 * 255
				
				local pos = EyePos() + EA:Forward() * 100
				
				for i = 1, 2 do
					render.DrawSprite(pos, att._reticleSize, att._reticleSize, renderColor)
				end
			cam.IgnoreZ(false)
		end
	end
end

    function att:attachFunc()
        self:setBodygroup(self.SightBGs.main, self.SightBGs.none)
        end

CustomizableWeaponry:registerAttachment(att)