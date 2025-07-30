/*
 * Author: PlayerBot
 * Spawns a infinite white smoke grenade
 *
 * Arguments:
 * 0: Position <ARRAY>
 * 1: Attached Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [getPosATL player] call BOT_Zeus_Modules_fnc_infiniteSmoke_White;
 *
 * Public: Yes
*/

params [
	["_position", [0, 0, 0]],
	["_attachedObject", objNull]
];

// modules_f\Effects\functions\fn_moduleGrenade.sqf
"ModuleSmokeWhite_F" createUnit [
	_position,
	(groups sideLogic)#0,
	"this setVariable ['BIS_fnc_initModules_disableAutoActivation', false];
	this setVariable ['type', 'SmokeShell_Infinite'];
	bot_temp_module = this;"
];

// [getAssignedCuratorLogic player, [bot_temp_module], false] remoteExec ["addCuratorEditableObjects", 2];
[getAssignedCuratorLogic player, [[bot_temp_module], false]] remoteExec ["addCuratorEditableObjects", 2]; 
