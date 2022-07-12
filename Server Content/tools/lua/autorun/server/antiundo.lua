antiundo = antiundo or {}

util.AddNetworkString("antiundo_ignore")
util.AddNetworkString("antiundo_remove")
util.AddNetworkString("antiundo_add")

function antiundo.FindEntry(ply, ent)
	local undos = antiundo.GetTable(ply)
	if not istable(undos) then return end

	for k, v in next, undos do
		if istable(v.Entities) and table.HasValue(v.Entities, ent) then
			return v, k
		end
	end
end

function antiundo.Ignore(ply, entry, id, ignore)
	entry.Ignore = ignore
	for k, v in next, entry.Entities do
		v:SetNWInt("antiundo", ignore and id or -1)
	end

	net.Start("antiundo_ignore")
	net.WriteInt(id, 16)
	net.WriteBool(entry.Ignore)
	net.Send(ply)
end

function antiundo.SetIgnore(ply, ent, ignore)
	local entry, id = antiundo.FindEntry(ply, ent)
	if not entry then return end

	antiundo.Ignore(ply, entry, id, ignore)
end

// networking
function antiundo.NetRemove(len, ply)
	if len == 0 then return end

	local undos = antiundo.GetTable(ply)
	if not istable(undos) then return end

	local nums = len / 16
	
	for i = 1, nums do
		local key = net.ReadInt(16)
		if istable(undos[key]) then
			antiundo.Ignore(ply, undos[key], key, true)
		end
	end
end
net.Receive("antiundo_remove", antiundo.NetRemove)

function antiundo.NetAdd(len, ply)
	if len == 0 then return end

	local undos = antiundo.GetTable(ply)
	if not istable(undos) then return end

	local nums = len / 16
	
	for i = 1, nums do
		local key = net.ReadInt(16)
		if istable(undos[key]) then
			antiundo.Ignore(ply, undos[key], key, false)
		end
	end
end
net.Receive("antiundo_add", antiundo.NetAdd)

// command stuff

function antiundo.HijackCommand(cmd, callback)
	local cmds = concommand.GetTable()
	cmds[string.lower(cmd)] = callback
end

// not the pretiest solution, but probably the easiest!
// hope this doesnt kill compatability!!!!

util.AddNetworkString("Undo_Undone")
function antiundo.CC_UndoLast(ply)
	local undos = antiundo.GetTable(ply)
	if not istable(undos) then return end

	local id, last
	for k, v in next, undos do
		if v.Ignore then
			continue
		end

		id = k
		last = v
	end

	if not last then return end
	
	last.Owner = ply

	local defer = hook.Run("CanUndo", ply, last, id) 
	if defer != nil and defer == false then return end

	local count = undo.Do_Undo(last)

	net.Start("Undo_Undone")
	net.WriteInt(id, 16)
	net.Send(ply)

	undos[id] = nil 
	if count == 0 then
		antiundo.CC_UndoLast(ply)
	end
end
antiundo.HijackCommand("undo", antiundo.CC_UndoLast)
antiundo.HijackCommand("gmod_undo", antiundo.CC_UndoLast)

// this is a fallback + compatibility hook for gmod_undonum and other related scripts
function antiundo.CanUndo(ply, entry)
	return not entry.Ignore
end
hook.Add("CanUndo", "antiundo", antiundo.CanUndo)