local att = {}
att.name = "bo2_grip_peace"
att.displayName = "Foregrip"
att.displayNameShort = "Grip"
att.statModifiers = {AimSpreadMult = -2, RecoilMult = -0.3}
att.isBG = true


if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bo2_grip")
att.description = {[1] = {t = "Increases Accuracy", c = CustomizableWeaponry.textColors.POSITIVE}}

end

		function att:attachFunc()
		self:setBodygroup(self.HandguardBGs.main, self.HandguardBGs.grip)
		self.Animations = {fire = {"shoot_grip"},
	reload = "reload_grip",
	reload_empty = "reload_empty_grip",
	idle = "idle_grip",
	draw = "draw_grip"}
	self:sendWeaponAnim("idle")
end
	
			function att:detachFunc()
			self:setBodygroup(self.HandguardBGs.main, self.HandguardBGs.grip2)
		self.Animations = {fire = {"shoot"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	self:sendWeaponAnim("idle")
end

CustomizableWeaponry:registerAttachment(att)