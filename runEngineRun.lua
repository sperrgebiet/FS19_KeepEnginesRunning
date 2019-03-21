runEngine = {}

runEngine.ModName = g_currentModName
runEngine.ModDirectory = g_currentModDirectory
runEngine.Version = "0.0.0.1"

runEngine.debug = fileExists(runEngine.ModDirectory ..'debug')

-- Set default to 1 week, which is pretty insane anyways
runEngine.Runtime = 604800

addModEventListener(runEngine)

function runEngine.prerequisitesPresent(specializations)
    return true;
end

function runEngine.registerEventListeners(vehicleType)
	local functionNames = {	"onPostLoad" }
	
	for _, functionName in ipairs(functionNames) do
		SpecializationUtil.registerEventListener(vehicleType, functionName, runEngine)
	end
end

function runEngine:onPostLoad(savegame)
	if self.spec_runEngineRun ~= nil then
		self.spec_motorized.motorStopTimerDuration = runEngine.Runtime
		self.spec_motorized.motorStopTimer = runEngine.Runtime
		self.spec_motorized.stopMotorOnLeave = false
	end
end