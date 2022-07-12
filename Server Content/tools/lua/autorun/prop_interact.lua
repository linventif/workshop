AddCSLuaFile()

local netstring = "game_" .. engine.ActiveGamemode()

local prop_interact_maxdist = CreateConVar("prop_interact_maxdist", "108", FCVAR_CHEAT, "How far away a player can be to interact with a prop", 0)
local prop_interact_mindist = CreateConVar("prop_interact_mindist", "60", FCVAR_CHEAT, "How close by a player can be to interact with a prop", 0)
local prop_interact_angsense = CreateConVar("prop_interact_angsense", "1", FCVAR_CHEAT, "The sensitivity of prop rotation.", 0)
local prop_interact_throwpow = CreateConVar("prop_interact_throwpow", "1", FCVAR_CHEAT, "The throwing strength for props", 0)
local prop_interact_carrystrength = CreateConVar("prop_interact_carrystrength", "1", FCVAR_CHEAT, "The carry strength for props", 0)

--Checks if an entity is a physical prop
local function IsProp(ent)
    local cls = ent:GetClass()

    if cls == "prop_physics" or cls == "prop_physics_multiplayer" then
        return true
    end

    return false
end

if SERVER then
    util.AddNetworkString(netstring .. "#network")

    --= Prop Conditions =--

    local function IsSmallProp(prop)
        return prop:GetPhysicsObject():GetMass() <= 35
    end
    
    local function IsPropNear(ply)
        if ply.fProp_Dist < prop_interact_maxdist:GetFloat() then
            return true
        end

        return false
    end

    local function IsPropInRange(ply)
        local dist = ply.fProp_Dist

        if dist < prop_interact_maxdist:GetFloat() and dist >= prop_interact_mindist:GetFloat() then
            return true
        end

        return false
    end

    local function IsPropCarriable(ply, ent)
        local mass = 35 * prop_interact_carrystrength:GetFloat()

        if mass >= ent:GetPhysicsObject():GetMass() then
            return true
        else
            return false
        end

        return false
    end

    ------------------------

    --= Object Space Correction/Preservation =--

    local function CalcPreservedCarryAngles(ply, ent)
        local ang = ply:EyeAngles()
        local ea = ent:GetAngles()
        local a = Angle(ea[1], -ang[2] + ea[2], ea[3])
        a:RotateAroundAxis(Vector(0, -1, 0), ang[1])

        return a
    end

    local function CalcCarryPosition(ply, tr, dist)

    end

    ---------------------------------------------
    
    --= Player Prop Manipulation =--

    local function ThrowProp(ent, dir)
        ent:GetPhysicsObject():SetVelocity(dir * prop_interact_throwpow:GetFloat())
    end

    local function RotateProp(ang, x, y)
        local sense = 10 / prop_interact_angsense:GetFloat()

        ang:RotateAroundAxis(Vector(0, 0, 1), x / sense)
        ang:RotateAroundAxis(Vector(0, -1, 0), y / sense)
    end

    --------------------------------

    local function hook_prop_interact_usekey(ply)
        local tr = ply:GetEyeTraceNoCursor()

        if tr.Hit then
            local ent = tr.Entity

            if IsProp(ent) then
                if ply.bProp_Interact or ply.bProp_Interact_Physgun then return end

                ply.fProp_Dist = (tr.HitPos - ply:EyePos()):Length()                    
                if not IsPropNear(ply) then return end

                if IsPropCarriable(ply, ent) then
                    timer.Simple(0, function()
                        ply:PickupObject(ent)
                    end)
                end
            end
        end
    end

    local function hook_prop_interact_use(ply, item)
        if IsProp(item) then
            local tr = ply:GetEyeTraceNoCursor()
            if ply.bProp_Interact or ply.bProp_Interact_Physgun then return end

            ply.fProp_Dist = (tr.HitPos - ply:EyePos()):Length()   

            if IsPropNear(ply) then
                if not IsPropCarriable(ply, item) then
                    --TODO: Code for object nudging...
                end 
            end

            local phys = item:GetPhysicsObject()

            if 35 * prop_interact_carrystrength:GetFloat() > phys:GetMass()  or IsSmallProp(item) then
                return false
            end
        end
    end
    --= Server-Side Hooks =--

    hook.Add("KeyPress", netstring .. "#prop_interact_usekey", function(ply, key)
        if key == IN_USE then
            hook_prop_interact_usekey(ply)
        end
    end)

    hook.Add("PhysgunPickup", netstring .. "#prop_interact_physgunpickup", function(ply, item)
        ply.bProp_Interact_Physgun = true
    end)

    hook.Add("PhysgunDrop", netstring .. "#prop_interact_physgundrop", function(ply, item)
        ply.bProp_Interact_Physgun = false
    end)

    hook.Add("OnPlayerPhysicsPickup", netstring .. "#prop_interact_pickup", function(ply, item)
        ply.bProp_Interact = true
        ply.bProp_Interact_Physgun = false
        ply.angProp_Current = CalcPreservedCarryAngles(ply, item)

        net.Start(netstring .. "#network")
        net.WriteBool(true)
        net.WriteEntity(item)
        net.WriteVector(Vector())
        net.Send(ply)
    end)

    hook.Add("GetPreferredCarryAngles", netstring .. "#prop_interact_carry", function(item, ply)
        if not ply.bProp_Interact then return end
        local ucmd = ply:GetCurrentCommand()

        if ply:KeyDown(IN_RELOAD) then
            RotateProp(ply.angProp_Current, ucmd:GetMouseX(), ucmd:GetMouseY())

            ply:SetEyeAngles(ply.angPlayer_Current)
        else
            ply.angPlayer_Current = ply:EyeAngles()
        end

        return ply.angProp_Current
    end)

    hook.Add("OnPlayerPhysicsDrop", netstring .. "#prop_interact_drop", function(ply, item, thrown)
        ply.bProp_Interact = false

        net.Start(netstring .. "#network")
        net.WriteBool(false)
        net.Send(ply)

        if thrown then
            ThrowProp(item, ply:GetAimVector())
        end
    end)

    -------------------------

    --use fix
    timer.Simple(0, function()
        local useHooks = hook.GetTable().PlayerUse

        if useHooks then
            for name, call in pairs(useHooks) do
                local _call = call
                call = function(ply, ent)
                    timer.Simple(1, function() _call(ply, ent) end)
                    return hook_prop_interact_use(ply, ent)
                    
                end

                hook.Add("PlayerUse", name, call)
            end
        else
            hook.Add("PlayerUse", netstring .. "#prop_interact_use", function(ply, item)
                return hook_prop_interact_use(ply, item)
            end)
        end
    end)
end

if CLIENT then
    local shmovement_fovadd = GetConVar("cl_luc_fovadd")

    local angCamera_Current = Angle()
    local angPlayer_Current = Angle()
    local vecProp_Position = Vector()
    
    local bProp_Interact = false

    local eCurrent_Prop = {}
    local plyLocal = {}

    net.Receive(netstring .. "#network", function()        
        bProp_Interact = net.ReadBool()
        plyLocal = LocalPlayer()

        if bProp_Interact then
            eCurrent_Prop = net.ReadEntity()
            vecProp_Current = net.ReadVector()
        else 
            eCurrent_Prop = nil
        end
    end)

    --Main function to determine the rendering of prop interaction
    local function hook_prop_interact_render(ang)        
        if not bProp_Interact then return end
        local B = false

        --Do prop rotation rendering
        --Minimal due to rotation occuring on the server
        if plyLocal:KeyDown(IN_RELOAD) then
            B = true
        end
        
        --Do prop position rendering for each axis
        if input.IsKeyDown(KEY_1) then
            B = true
        end
        if input.IsKeyDown(KEY_2) then
            B = true
        end
        if input.IsKeyDown(KEY_3) then
            B = true
        end
        
        --Update when not manipulating prop
        if not B then
            angPlayer_Current = plyLocal:EyeAngles()
            angCamera_Current = ang
        end

        return B
    end

    local function hook_prop_interact_config(pnl)
        pnl:ClearControls()
        
        pnl:NumSlider("Rotation Sensitivity", "prop_interact_angsense", 0, 100, 2)
        pnl:NumSlider("Throw Power", "prop_interact_throwpow", 0, 2000, 2)
        pnl:NumSlider("Carry Strength", "prop_interact_carrystrength", 0, 100, 2)
        pnl:NumSlider("Maximum Pickup Distance", "prop_interact_maxdist", 30, 2000, 2)
    end

    --= Client-Side Hooks =--

    hook.Add("CalcView", netstring .. "#prop_interact_render", function(ply, ori, ang)
        local interact = hook_prop_interact_render(ang)
        
        if interact then
            plyLocal:SetEyeAngles(angPlayer_Current)            
            return {angles = angCamera_Current}
        end
    end)

    hook.Add("PopulateToolMenu", netstring .. "prop_interact#config", function()
        spawnmenu.AddToolMenuOption("Utilities", "Admin", "prop_interact", "Prop Interaction", "", "", hook_prop_interact_config)
    end)

    -------------------------
end