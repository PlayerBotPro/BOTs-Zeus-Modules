//https://github.com/zen-mod/ZEN/blob/75f210c10c1c5d2d94185cad8db92f9a999ecc39/addons/custom_modules/functions/fnc_init.sqf#L30
params [
	["_position", [0, 0, 0]],
	["_attachedObject", objNull]
];

_unit=_attachedObject;
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
	[objNull, "ERROR: Only AI can be target"] call BIS_fnc_showCuratorFeedbackMessage;
};

//when already set the action
/***
	Work In Progress
***/

_tempCode={
	params ["_unit"];

	_unit allowDamage false;
	_unit disableAI "ALL";
	_unit enableSimulation false;
	_unit setCaptive true;

	//lock backpack from opening
	backpackContainer _unit lockInventory true;

	_unit addAction[
			format ["Load %1 Inventory", name _unit],//title
			{										 //script start
				params ["_target", "_caller", "_actionId", "_arguments"];
				_caller setUnitLoadout getUnitLoadout _target;
			},										 //script end
			nil,									 //arguments
			1.5,									 //priority
			true,									 //showWindow
			true,									 //hideOnUse
			"",										 //shortcut
			"true",									 //condition
			5										 //radius
	];
};

[_unit, _tempCode] remoteExec ["call", 0, true];
["Success", format ["%1 set", name _unit], 0] call BIS_fnc_curatorHint;
