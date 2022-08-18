// Do not change anything that is not marked to do so

    local isAdminMode = false
    local adminModel = "models/player/combine_super_soldier.mdl" // this can be changed to any valid model path
    local allowedGroups = {"admin", "superadmin"} // usergroups that can use this command
    
    hook.Add("PlayerSay", "toggleAdminMode", function(ply, text)
        if string.lower(text) == "!adminmode" then
            if isAllowedAdminMode(ply) then
                if isAdminMode == true then
                    ply:SetModel(ply:getJobTable()["model"][1])
                    ply:GodDisable()
                    isAdminMode = false
                elseif isAdminMode == false then
                    isAdminMode = true
                    ply:GodEnable()
                    ply:SetModel(adminModel)
                end
                ply:ChatPrint("Adminmode toggled")
            else
                ply:ChatPrint("You do not have access to this command")
            end
            return ""
        end
    end)
    
    function isAllowedAdminMode(ply)
        local doAllowAdminMode = false
        local groupCycleCount = 0
        for i,v in ipairs(allowedGroups) do
            if ply:GetUserGroup() == v then
                doAllowAdminMode = true
            end
            groupCycleCount = groupCycleCount + 1
        end
        return doAllowAdminMode
    end
    
    function tablelength(T)
        local count = 0
        for _ in pairs(T) do count = count + 1 end
        return count
    end
