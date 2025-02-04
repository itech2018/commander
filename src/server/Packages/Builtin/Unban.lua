local module = {
	Name = "Unban",
	Description = "Unbans a player",
	Location = "Player",
}

local DataStoreService
local dataStore

module.Execute = function(Client, Type, Attachment)
	if Type == "command" then
		local player = module.API.getUserIdWithName(Attachment)
		if typeof(player) == "number" then
			pcall(dataStore.RemoveAsync, dataStore, player)
			return true
		end
		return false
	elseif Type == "firstrun" then
		DataStoreService = module.Services.DataStoreService
		dataStore = DataStoreService:GetDataStore(module.Settings.Misc.DataStoresKey.Ban or "commander.bans")
	end
end

return module