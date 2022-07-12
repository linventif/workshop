--By STEAM_0:1:57192962 https://steamcommunity.com/id/alexgarrysman

AdvToolgun = { Version = 0.6 }

if SERVER then
	local function LoadFolder(FolderPath)
		local PatchTab = file.Find( FolderPath .. "*", "MOD")
		for i, f in pairs(PatchTab) do
			resource.AddSingleFile(f)
		end
	end
	
	LoadFolder("materials/models/weapons/v_toolgun/")
	LoadFolder("materials/vgui/")
	LoadFolder("models/weapons/")
else 
	CreateClientConVar("adv_toolgun_anim", "1",true,false,_, 0, 1 )
	CreateClientConVar("adv_toolgun_theme", "0",true,false,_, 0, 1 )
	CreateClientConVar("adv_toolgun_emit_s", "1",true,false,_, 0, 1 )
	CreateClientConVar("adv_toolgun_scrollmode", "1",true,false,_, 0, 1 )
	CreateClientConVar("adv_toolgun_act_bind", "81",true,false)

	if !file.Exists( "advancedtoolgun", "DATA" ) then
		file.CreateDir("advancedtoolgun")
		file.Write( "advancedtoolgun/favorites.json", "[[\"Favorites\",0,0]]")
	end
	
	local toolgun
	
	local gstools = Material( "models/weapons/v_toolgun/gmod_stools" )
	local wstools = Material( "models/weapons/v_toolgun/wire_stools" )
	local fstools = Material( "models/weapons/v_toolgun/fav_stools" )
	local Screen2 = Material( "models/weapons/v_toolgun/screen2" )
	local currenticon = gstools
	
	local TabID , M3CD , FS = true , true , true
	local EmitSnd = GetConVar("adv_toolgun_emit_s"):GetInt() 
	local ScrollMode = GetConVar("adv_toolgun_scrollmode"):GetInt() 
	local ActBind = GetConVar("adv_toolgun_act_bind"):GetInt()
	local CurTheme = GetConVar("adv_toolgun_theme"):GetInt()+1
	
	local ColorThemes = {
		{
			Color(210, 210, 215),
			Color(86, 123, 166),
			Color(200, 200, 200),
			Color( 255, 255, 255),
			Color( 95, 95, 95),
			Color( 255, 255, 255),
			Color(225, 187, 0),
			Color(86, 123, 166)
		},
		{
			Color(110, 110, 110),
			Color(50, 50, 50),
			Color(120, 120, 120),
			Color( 235, 235, 235),
			Color( 235, 235, 235),
			Color( 255, 255, 255),
			Color(86, 123, 176),
			Color(50, 50, 50)
		}
	}

	surface.CreateFont( "ITG_Fnt1", {
		font = "DermaDefault", 
		size = 12,
		weight = 10, 
	} )
	
	surface.CreateFont( "ITG_Fnt2", {
		font = "DermaDefault", 
		size = 11,
		weight = 10,
	} )

	local ToolTable,WireTable,ToolTableF,TT = {} , {} , {} , {}
	local ID , Alpha , CT , LocalID = 2 , 0 , 0 ,1
	local WireTabID

	function ReadJT()
		local Json = file.Open("advancedtoolgun/favorites.json", "r", "DATA" )
		local JsonTab = util.JSONToTable(Json:ReadLine())
		Json:Close()
		return JsonTab
	end
	
	function WriteJT(S)
		local Json = file.Open("advancedtoolgun/favorites.json", "w", "DATA" )
			Json:Write(util.TableToJSON(S))
		Json:Close()
	end
	
	function Scroll(N)
		if FS then
			FS = false
			timer.Simple(0.001,function() FS = true end)
			if ScrollMode == 0 then
				local CTl = TT[LocalID-1+ID+N]
				if CTl then 
					if CTl[2] == 0 then
						N=N*2
					end
				end
				
				if LocalID == 1 and N < 0 or N > 0 and LocalID == 9 then
					ID = math.Clamp(ID + N ,2,#TT-LocalID+1) 
				elseif CTl then
					LocalID = math.Clamp(LocalID + N ,1,9)
				end
				
				if TT[ID+LocalID-1] then
					spawnmenu.ActivateTool(TT[ID+LocalID-1][2], false)
				end
			else
				LocalID = 1

				if TT[ID+N*2] then
					if TT[ID+N][2] == 0 then
						N=N*2
					end
				end
				ID = math.Clamp(ID + N ,2,#TT)
				spawnmenu.ActivateTool(TT[ID][2], false)
			end
			
			if GetConVar("adv_toolgun_emit_s"):GetBool() then
				LocalPlayer():EmitSound( "Weapon_AR2.Empty" )
			end
		end
	end
	 
	hook.Add("InitPostEntity","InitATG",function()
		toolgun=weapons.GetStored("gmod_tool")
		
		ToolTable = spawnmenu.GetTools()
		local ID2 = 1
			
		for i=1,#ToolTable do 
			if ToolTable[i].Name == "Wire" then
				WireTabID = i
			end
		end	
			
		local TTC = #ToolTable[1].Items		
		timer.Create("Tls", 0.1, TTC, function()
				table.ForceInsert(ToolTableF,{ToolTable[1].Items[ID2].Text,0,0})
			local TB = ToolTable[1].Items[ID2]
			for i=1,#TB do 
				if TB[i] then
					table.ForceInsert(ToolTableF,{TB[i].Text,TB[i].ItemName,TB.Text})
				end
			end	
			ID2 = ID2+1
			
			if ID2 == TTC+1 then
				TT = ToolTableF
				if WireTabID then
					ID2 = 2
					timer.Create("Tls2", 0.1, #ToolTable[WireTabID].Items-1, function()
						table.ForceInsert(WireTable,{ToolTable[WireTabID].Items[ID2].Text,0,0})
						TB = ToolTable[WireTabID].Items[ID2]
						for i=1,#TB do 
							if TB[i] then
								table.ForceInsert(WireTable,{TB[i].Text,TB[i].ItemName,TB.Text})
							end
						end
						ID2 = ID2+1 
					end)
				end
			end
		end)
		
		local X,Y = 178, 135 
		local RTText = GetRenderTarget( "screen2", 256, 256 )
		
		toolgun.Think = function(self)	
			
			if ( CLIENT && self.m_uHolsterFrame == FrameNumber() ) then return end

			local owner = self:GetOwner()
			if ( !owner:IsPlayer() ) then return end
			
			local curmode = owner:GetInfo( "gmod_toolmode" )
			self.Mode = curmode

			local tool = self:GetToolObject( curmode )
			if ( !tool ) then return end

			tool:CheckObjects()

			local lastmode = self.current_mode
			self.last_mode = lastmode
			self.current_mode = curmode

			if ( !tool:Allowed() ) then
				if ( lastmode ) then
					local lastmode_obj = self:GetToolObject( lastmode )

					if ( lastmode_obj ) then
						lastmode_obj:ReleaseGhostEntity()
					end
				end

				return
			end

			if ( lastmode && lastmode != curmode ) then
				local lastmode_obj = self:GetToolObject( lastmode )

				if ( lastmode_obj ) then
					lastmode_obj:Holster()
				end
			end

			self.Primary.Automatic = tool.LeftClickAutomatic || false
			self.Secondary.Automatic = tool.RightClickAutomatic || false
			self.RequiresTraceHit = tool.RequiresTraceHit || true

			tool:Think()

			if owner:InVehicle() or !TT[ID] then return end
			
			local Shift = 12
			local Sh = 24
			local Theme = ColorThemes[CurTheme]
			Screen2:SetTexture( "$basetexture", RTText )
				
			render.PushRenderTarget( RTText )
				cam.Start2D()  
						
					surface.SetDrawColor(Theme[1]:Unpack())
					surface.DrawRect(0, 0, 256, 256)

					if TT[ID][3] == 0 and ScrollMode == 0 then 
						Y = Y - 12.5
						Sh= Sh-12
					end
 
					surface.SetDrawColor(Theme[2]:Unpack())
					surface.DrawRect(X, Y, 256, 12)

					surface.SetDrawColor(Theme[3]:Unpack())
					local TC = #TT  
					for i = 1 ,math.Clamp((TC - ID)/2,0,4) do
						surface.DrawRect(X+Alpha, Y+Sh, 71, 12)
						Sh=Sh+24
					end
							
					if TC > 0 then 
						surface.SetDrawColor(Theme[7]:Unpack())
						surface.DrawRect(X+Alpha, 1+Y+12*LocalID, 71, 10) 
					end
						
					if TT[ID] then
						draw.DrawText(TT[ID][3],"ITG_Fnt1", X+3, Y,Theme[4],TEXT_ALIGN_LEFT )						
					end
								
					for i=ID,TC do
						if TT[ID] then 
							draw.DrawText(TT[i][1],"ITG_Fnt2", X+3+Alpha, Y+Shift,Theme[5],TEXT_ALIGN_LEFT )
							if TT[i][2] == 0 then
								surface.SetDrawColor(Theme[8]:Unpack())
								surface.DrawRect(X+Alpha, Y+Shift, 256, 12)
								draw.DrawText(TT[i][1],"ITG_Fnt1", X+3+Alpha, Y+Shift,Theme[6],TEXT_ALIGN_LEFT )
							end
						end
						Shift = Shift + 12
					end
								
					surface.SetDrawColor( 86, 123, 166, Alpha*2 )
					surface.DrawRect(0, 0, 256, 256)
					surface.SetDrawColor( 255, 255, 255, Alpha )
					surface.SetMaterial( currenticon )
					surface.DrawTexturedRect( X+6, Y+30, 60, 60 ) 
						
					if TT[ID][3] == 0 and ScrollMode == 0 then 
						Y = Y + 12.5
						Sh= Sh+12
					end
					
				cam.End2D()
			render.PopRenderTarget()
			Alpha = math.Clamp((CT-CurTime())*350,0,150)
				
			if input.IsKeyDown(ActBind) and input.IsMouseDown(MOUSE_MIDDLE) then
				if M3CD then
					M3CD = false
					if WireTabID then TabID = !TabID end
					if EmitSnd then
						owner:EmitSound( "ui/hint.wav" )
					end
								
					if TabID then
						TT = ToolTableF currenticon = gstools
					else
						TT = WireTable currenticon = wstools
					end
								
					CT = CurTime()+0.4
					
					if #TT <= 1 then ID = 1 else ID = 2 end
					LocalID = 1
					if TT[ID] then
						spawnmenu.ActivateTool(TT[ID][2], false)
					end
					timer.Simple(0.4,function() M3CD = true end)
				end
			end
				
			hook.Add( "PlayerBindPress", "Violence", function( ply, bind, pressed )
				if input.IsKeyDown(ActBind) and owner:GetActiveWeapon() == self then
					if bind == "invnext" then
						Scroll(1)
						return true
					elseif bind == "invprev" then
						Scroll(-1)
						return true
					end
				end
			end)
		end
	end)

	hook.Add( "CreateMove", "anim_cl", function()
		if input.WasMouseDoublePressed(MOUSE_MIDDLE) then
			timer.Simple(0.4,function()
				if EmitSnd then
					LocalPlayer():EmitSound( "ui/hint.wav" )
				end
				currenticon = fstools CT = CurTime()+0.4
				TT = ReadJT()
				if #TT <= 1 then ID = 1 else ID = 2 LocalID = 1 spawnmenu.ActivateTool(TT[ID][2], false) end
			end)
		end
		
		if !LocalPlayer():GetActiveWeapon():IsValid() then return end
		if LocalPlayer():GetActiveWeapon():GetClass() != "gmod_tool" then return end
		
		if GetConVar("adv_toolgun_anim"):GetBool() then
			TGVM = LocalPlayer():GetViewModel()
			if input.IsKeyDown(ActBind) then
				TGVM:ResetSequence("zoom1")
			end
			if input.WasKeyReleased(ActBind) then
				TGVM:ResetSequence("zoom2")
				TGVM:ResetSequence("fire01")
			end
		end
	end)
	
	
	local NS
	list.Set("DesktopWindows", "P_reg",
		{	
			title = "Adv.Toolgun",
			icon = "vgui/advtg.png",
			width = 376,height = 390,
			onewindow = true,
			init = function(wndw, stngs)
				
				local JsonTab = ReadJT()
				local Cur_sTool
			
				stngs:SetTitle( "Advanced Toolgun "..AdvToolgun.Version )
				stngs.Paint = function()
					draw.RoundedBox( 3, 0, 0, 1000, 25, Color(80,80,80,255))
					draw.RoundedBox( 3, 0, 0, 1000, 1000, Color(60,60,60,235))
				end
						
				local ABB = stngs:Add( "DImageButton" )
				ABB:SetPos( 8, 32 ) 
				ABB:SetSize( 150,27 )
				ABB:SetImage( "vgui/at_logo.png" )
				ABB.DoClick = function()
					gui.OpenURL( "https://steamcommunity.com/id/alexgarrysman" )
					stngs:Close()
				end
				
				local FavList = stngs:Add( "DListView" )
				FavList:SetSize(148, 235)
				FavList:SetPos(193, 76)
				FavList:SetMultiSelect( false )
				FavList:AddColumn( "Favorites" )
				 
				function UpdateJTList()
					TT = JsonTab
					FavList:Clear()
					for i=2, #JsonTab do FavList:AddLine( JsonTab[i][1] ) end
					if #TT <= 1 then ID = 1 else ID = 2 end
					LocalID = 1
				end
				UpdateJTList()
				
				local AddB = stngs:Add( "DImageButton" )
				AddB:SetPos( 183, 367 )
				AddB:SetSize( 148,20 )
				AddB:SetImage( "vgui/addct.png" )
				AddB.DoClick = function()
					if LocalPlayer():GetWeapon("gmod_tool"):IsValid() then
						local stool = LocalPlayer():GetWeapon("gmod_tool"):GetMode()
						JsonTab = ReadJT()
						
						for i , t in pairs(JsonTab) do
							if t[2] == stool then
								return
							end
						end
						
						table.ForceInsert(JsonTab,{"#tool."..stool..".name",stool,"Favorites"})
						WriteJT(JsonTab)
						
						UpdateJTList()
						FavList:SelectItem(FavList:GetLines()[#FavList:GetLines()])
					end  
				end

				local AddSB = stngs:Add( "DImageButton" )
				AddSB:SetPos( 183, 345 )
				AddSB:SetSize( 147,20 )
				AddSB:SetImage( "vgui/new_section.png" )
				AddSB.DoClick = function()
					if !IsValid(NS) then
						local Section_Name

						local NS = stngs:Add( "DTextEntry" ) 
						NS:SetPos(183, 345)
						NS:SetSize(147,20)
						NS:SetText("")
						NS:SetPlaceholderText("Enter Section Name")
						NS.OnChange = function( self )
							Section_Name = self:GetValue()
						end	
						
						NS.OnEnter = function( self )
							if Section_Name and Section_Name != "" then
								table.ForceInsert(JsonTab,{Section_Name,0,0})
								WriteJT(table.ClearKeys( JsonTab , false))
								UpdateJTList()
								FavList:SelectItem(FavList:GetLines()[#FavList:GetLines()])
								timer.Simple(0.5,function() NS:Remove() end)
							end
						end
					end
				end

				local RemB = stngs:Add( "DImageButton" )
				RemB:SetPos( 333, 345 )
				RemB:SetSize( 20,42 )
				RemB:SetImage( "vgui/remct.png" )
				RemB.DoClick = function()
					for k, stl in ipairs(JsonTab) do
						if stl[1] == Cur_sTool and k>1 then
							table.remove( JsonTab, k)
							WriteJT(JsonTab)
							UpdateJTList()
							FavList:SelectItem(FavList:GetLines()[k-2])
						end
					end
				end

				local EnAnimCb = stngs:Add( "DCheckBoxLabel" )
				EnAnimCb:SetPos( 10, 70 )
				EnAnimCb:SetText("\"Close-up\" Animation.")
				EnAnimCb:SetConVar("adv_toolgun_anim")

				local EmSndCb = stngs:Add( "DCheckBoxLabel" )
				EmSndCb:SetPos( 10, 130 )
				EmSndCb:SetText("Emit Sounds.")
				EmSndCb:SetConVar("adv_toolgun_emit_s")
				function EmSndCb:OnChange( val )
					EmitSnd = val
				end
				
				local hdr_bloom = stngs:Add( "DCheckBoxLabel" )
				hdr_bloom:SetPos( 10, 90 )
				hdr_bloom:SetText("Disable Bloom Effect.")
				hdr_bloom:SetConVar("mat_disable_bloom")

				local EnTheme = stngs:Add( "DCheckBoxLabel" )
				EnTheme:SetPos( 10, 150 )
				EnTheme:SetText("Dark Theme.")
				EnTheme:SetConVar("adv_toolgun_theme")
				function EnTheme:OnChange( val )
					CurTheme = val and 2 or 1
				end
				
				local Scrlmd = stngs:Add( "DCheckBoxLabel" )
				Scrlmd:SetPos( 10, 110 )
				Scrlmd:SetText("Static Selector.")
				Scrlmd:SetConVar("adv_toolgun_scrollmode") 
				function Scrlmd:OnChange( val )
					ScrollMode = GetConVar("adv_toolgun_scrollmode"):GetInt() 
				end

				local controls = stngs:Add( "DImage" )
				controls:SetPos(10, 250)
				controls:SetSize(135, 133)
				controls:SetImage("vgui/controls.png")	
				
				local binder = stngs:Add( "DBinder" )
				binder:SetSize( 90, 15 )
				binder:SetPos( 47, 274 )
				binder:SetValue(ActBind)
				function binder:OnChange( num )
					GetConVar("adv_toolgun_act_bind"):SetInt( num )
					ActBind = num
				end

				local dec = stngs:Add( "DImage" )
				dec:SetPos( 160, 26 ) 
				dec:SetSize( 221,316 )
				dec:SetImage( "vgui/advtg_ui.png" )

				
				--кусок говна
				
				local wwerhB = stngs:Add( "DImageButton" )
				wwerhB:SetPos( 215, 322 )
				wwerhB:SetSize( 48,12 )
				wwerhB:SetImage( "vgui/wwerhwniz.png" )
				wwerhB.DoClick = function()
					local stop = false
					for k, stl in ipairs(JsonTab) do 
						if stl[1] == Cur_sTool and k<#JsonTab and !stop then
							stop = true
							local Element = JsonTab[k+1]
							JsonTab[k+1]=JsonTab[k]
							JsonTab[k]=Element
							JsonTab = table.ClearKeys( JsonTab , false) 
							WriteJT(JsonTab)
							UpdateJTList()
							FavList:SelectItem(FavList:GetLines()[k])
						end
					end
				end

				local wnizB = stngs:Add( "DImageButton" )
				wnizB:SetPos( 268, 322 )
				wnizB:SetSize( 48,12 )
				wnizB:SetImage( "vgui/wwerhwniz.png" )
				wnizB.DoClick = function()
					local stop = false
					for k, stl in ipairs(JsonTab) do 
						if stl[1] == Cur_sTool and k>2 and !stop then
							stop = true
							local Element = JsonTab[k-1]
							JsonTab[k-1]=JsonTab[k]
							JsonTab[k]=Element
							JsonTab = table.ClearKeys( JsonTab , false) 
							WriteJT(JsonTab)
							UpdateJTList()
							FavList:SelectItem(FavList:GetLines()[k-2])
						end
					end
				end

				FavList.OnRowSelected = function( lst, index, row)
					Cur_sTool = row:GetValue( 1 )
				end																																																																																																																																																																		--By STEAM_0:1:57192962 https://steamcommunity.com/id/alexgarrysman																																																																																															
			end
		}
	)
end