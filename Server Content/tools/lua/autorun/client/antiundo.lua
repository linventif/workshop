antiundo = antiundo or {}

function antiundo.GetContents()
	local undos = antiundo.GetTable()

	local normal = {}
	local ignored = {}

	for k, v in next, undos do
		if v.Ignore == true then
			ignored[k] = v
		else
			normal[k] = v
		end
	end

	return normal, ignored
end

function antiundo.InvalidateContents()
	local normal, ignored = antiundo.GetContents()

	antiundo.leftListView = vgui.Create("DListView", antiundo.left)
	antiundo.leftListView:AddColumn("Undo Table")
	antiundo.leftListView:Dock(FILL)
	for k, v in next, normal do
		antiundo.leftListView:AddLine(v.Name).Key = v.Key
	end

	antiundo.rightListView = vgui.Create("DListView", antiundo.right)
	antiundo.rightListView:AddColumn("Ignored")
	antiundo.rightListView:Dock(FILL)
	for k, v in next, ignored do
		antiundo.rightListView:AddLine(v.Name).Key = v.Key
	end
end

function antiundo.Menu()
	antiundo.frame = vgui.Create("DFrame")
	antiundo.frame:SetTitle("Anti Undo")
	antiundo.frame:SetSize(ScrW() * 0.25, ScrH() * 0.33)
	antiundo.frame:Center()
	antiundo.frame:MakePopup()

	antiundo.left = vgui.Create("DPanel", antiundo.frame)
	antiundo.left:SetWide((antiundo.frame:GetWide() - 10) * 0.5)
	antiundo.left:Dock(LEFT)
	antiundo.left.Paint = function() end

	antiundo.right = vgui.Create("DPanel", antiundo.frame)
	antiundo.right:Dock(FILL)
	antiundo.right.Paint = function() end

	antiundo.frame:InvalidateLayout(true)

	antiundo.leftButton = vgui.Create("DButton", antiundo.left)
	antiundo.leftButton:SetText("Ignore")
	antiundo.leftButton:SetTall(antiundo.left:GetTall() * 0.1)
	antiundo.leftButton:Dock(BOTTOM)
	antiundo.leftButton.DoClick = function(self)
		local selected = antiundo.leftListView:GetSelected()
		if #selected == 0 then return end
		
		net.Start("antiundo_remove")
		for k, v in next, selected do
			print("remove", v.Key)
			net.WriteInt(v.Key, 16)
		end
		net.SendToServer()
	end

	antiundo.rightButton = vgui.Create("DButton", antiundo.right)
	antiundo.rightButton:SetText("Restore")
	antiundo.rightButton:SetTall(antiundo.right:GetTall() * 0.1)
	antiundo.rightButton:Dock(BOTTOM)
	antiundo.rightButton.DoClick = function(self)
		local selected = antiundo.rightListView:GetSelected()
		if #selected == 0 then return end
		
		net.Start("antiundo_add")
		for k, v in next, selected do
			print("add", v.Key)
			net.WriteInt(v.Key, 16)
		end
		net.SendToServer()
	end

	antiundo.InvalidateContents()
end

concommand.Add("antiundo", function()
	antiundo.Menu()
end)

net.Receive("antiundo_ignore", function()
	local key = net.ReadInt(16)
	local ignore = net.ReadBool()

	for k, v in next, antiundo.GetTable() do
		if v.Key == key then
			v.Ignore = ignore
			break
		end
	end

	if antiundo.frame then
		antiundo.InvalidateContents()
	end
end)