// https// community.bistudio.com/wiki/Modules
params [
	["_logic", objNull, [objNull]],		// Argument 0 is module logic
	["_units", [], [[]]],				// Argument 1 is a list of affected units (affected by value selected in the 'class Units' argument))
	["_activated", true, [true]]		// True when the module was activated, false when it is deactivated (i.e., synced triggers are no longer active)
];

private _unit=attachedTo _logic;
deleteVehicle _logic;

//when not placed on unit
if (isNull _unit) exitWith {
	[objNull, "ERROR: please place on soldier"] call BIS_fnc_showCuratorFeedbackMessage;
};

//error when placed on player
/***
	is man+is player=error
	is man+not player=success
	not man+is player=error
	not man+not player=error
***/
if !(_unit isKindOf "CAManBase" && !(isPlayer _unit)) exitWith {
	[objNull, "ERROR: Player cant be target"] call BIS_fnc_showCuratorFeedbackMessage;
};

//when already set the action
/***
	Work In Progress
***/


_unit allowDamage false;
_unit disableAI "ALL";
[
	_unit,						//object
	[
		"Load Target Inventory",//title
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			[_target, [localNamespace, "tempInventory"]] call BIS_fnc_saveInventory;
			[_caller, [localNamespace, "tempInventory"]] call BIS_fnc_loadInventory;
		},						//script
		nil,					//arguments
		1.5,					//priority
		true,					//showWindow
		true,					//hideOnUse
		"",						//shortcut
		"true",					//condition
		5						//radius
	]
] remoteExec ["addAction", 0, true];
["Title", format ["%1 success", _unit], 0] call BIS_fnc_curatorHint;
