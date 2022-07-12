antiundo = antiundo or {}

function antiundo.GetTable(ply)
	return CLIENT and undo.GetTable() or undo.GetTable()[ply:UniqueID()]
end

function antiundo.Filter(ply, ent, property)
	if not ent 
		or not IsValid(ent)
		or ent:IsPlayer()
		or not gamemode.Call("CanProperty", ply, property, ent) then 
		return false
	end

	return true
end

properties.Add("remove_undo", {
	MenuLabel = "Remove from undo list",
	Order = 9999,
	MenuIcon = "icon16/link_break.png",

	Filter = function(self, ent, ply)
		if not antiundo.Filter(ply, ent, self.InternalName) then return false end
		if ent:GetNWInt("antiundo", -1) != -1 then return false end

		return true
	end,
	Action = function(self, ent)
		self:MsgStart()
		net.WriteEntity(ent)
		self:MsgEnd()
	end,
	Receive = function(self, len, ply)
		local ent = net.ReadEntity()

		if not properties.CanBeTargeted(ent, ply) then return end
		if not self:Filter(ent, ply) then return end

		antiundo.SetIgnore(ply, ent, true)
	end
})

properties.Add("add_undo", {
	MenuLabel = "Add to undo list",
	Order = 9999,
	MenuIcon = "icon16/link_add.png",

	Filter = function(self, ent, ply)
		if not antiundo.Filter(ply, ent, self.InternalName) then return false end
		if ent:GetNWInt("antiundo", -1) == -1 then return false end

		return true
	end,
	Action = function(self, ent)
		self:MsgStart()
		net.WriteEntity(ent)
		self:MsgEnd()
	end,
	Receive = function(self, _, ply)
		local ent = net.ReadEntity()

		if not properties.CanBeTargeted(ent, ply) then return end
		if not self:Filter(ent, ply) then return end

		antiundo.SetIgnore(ply, ent, false)
	end
})