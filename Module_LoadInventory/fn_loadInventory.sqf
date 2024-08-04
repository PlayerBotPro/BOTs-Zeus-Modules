// https// community.bistudio.com/wiki/Modules
params [
	["_logic", objNull, [objNull]],		// Argument 0 is module logic
	["_units", [], [[]]],				// Argument 1 is a list of affected units (affected by value selected in the 'class Units' argument))
	["_activated", true, [true]]		// True when the module was activated, false when it is deactivated (i.e., synced triggers are no longer active)
];

// curatorMouseOver==2 always true because the placed _logic module is considered a object
_tempUnit = (nearestObjects [curatorMouseOver select 1, ["CAManBase"], 1]) select 0;
if (!isNil"_tempUnit") then {
	_tempUnit allowDamage false;
	_tempUnit disableAI "ALL";
	[_tempUnit,
		["Load Target Inventory",
			{
				params ["_target", "_caller", "_actionId", "_arguments"];
				[_target, [localNamespace, "tempInventory"]] call BIS_fnc_saveInventory;
				[_caller, [localNamespace, "tempInventory"]] call BIS_fnc_loadInventory;
			}
		]
	] remoteExec ["addAction", 0, true];
	systemchat format ["%1 success", _tempUnit];
	deleteVehicle _logic;
} else {
	playSound ["beep", 1];
	systemchat "ERROR";
	deleteVehicle _logic;
};