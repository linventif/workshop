local att = {}
att.name = "bo2_acog_sniper"
att.displayName = "ACOG Scope"
att.displayNameShort = "ACOG"
att.aimPos = {"ACOGPos", "ACOGAng"}
att.FOVModifier = 25
att.isSight = true
att.isBG = true
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT
att.statModifiers = {OverallMouseSensMult = -0.07}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bo2_acog")
	att.description = {[1] = {t = "Provides a bright reticle to ease aiming.", c = CustomizableWeaponry.textColors.POSITIVE},
					   [2] = {t = "Increased weapon zoom.", c = CustomizableWeaponry.textColors.POSITIVE}}

	
	att.reticle = "bo2r/attachments/reticles/acog_reticule"
	att._reticleSize = 2.5
	
	function att:drawReticle()
		if not self:isAiming() or not self:isReticleActive() then
			return
		end
		
		diff = self:getDifferenceToAimPos(self.ACOGPos, self.ACOGAng, 1)
		
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
    function att:attachFunc()
        self:setBodygroup(self.SightBGs.main, self.SightBGs.none)
		self.AimOverlay = nil
		self.DrawBlackBarsOnAim = false
		self.AimBreathingEnabled = false
		self.FadeDuringAiming = false
		self.MoveWepAwayWhenAiming = false
        end
		
		    function att:detachFunc()
        self:setBodygroup(self.SightBGs.main, self.SightBGs.none)
		self.AimOverlay = (surface.GetTextureID("models/weapons/bo2r_svu/scope_overlay"))
		self.DrawBlackBarsOnAim = true
		self.AimBreathingEnabled = true
		self.FadeDuringAiming = true
		self.MoveWepAwayWhenAiming = true
        end
	end


		
		

CustomizableWeaponry:registerAttachment(att)