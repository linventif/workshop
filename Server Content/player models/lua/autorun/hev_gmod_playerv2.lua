local function AddPlayerModel( name, model, arms )

	list.Set( "PlayerOptionsModel", name, model )
	player_manager.AddValidModel( name, model )
	player_manager.AddValidHands(name, arms, 0, "0100000")
	
end


AddPlayerModel( "HEV Garry:D", "models/player/portal/garry.mdl", "models/weapons/c_gmod_hev.mdl" )

AddPlayerModel( "V2 HEVGmod1", "models/player/portal/male_02HVE.mdl", "models/weapons/c_gmod_hev.mdl" )

AddPlayerModel( "V2 HEVGmod2", "models/player/portal/male_03HVE.mdl", "models/weapons/c_gmod_hev.mdl" )

AddPlayerModel( "V2 HEVGmod3", "models/player/portal/male_04HVE.mdl", "models/weapons/c_gmod_hev.mdl" )

AddPlayerModel( "V2 HEVGmod4", "models/player/portal/male_05HVE.mdl", "models/weapons/c_gmod_hev.mdl" )

AddPlayerModel( "V2 HEVGmod5", "models/player/portal/male_06HVE.mdl", "models/weapons/c_gmod_hev.mdl" )

AddPlayerModel( "V2HEVGmod6", "models/player/portal/male_07HVE.mdl", "models/weapons/c_gmod_hev.mdl" )

AddPlayerModel( "V2 HEVGmod7", "models/player/portal/male_08HVE.mdl", "models/weapons/c_gmod_hev.mdl" )

AddPlayerModel( "V2 HEVGmod8", "models/player/portal/male_09HVE.mdl", "models/weapons/c_gmod_hev.mdl" )



