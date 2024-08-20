params [
	["_position", [0, 0, 0]],
	["_unit", objNull]
];

//error when placed on !player
/***
	is man+is player=success
	is man+not player=error
	not man+is player=error
	not man+not player=error
***/
if !(_unit isKindOf "CAManBase" && (isPlayer _unit)) exitWith {
	[objNull, "ERROR: please place on player"] call BIS_fnc_showCuratorFeedbackMessage;
};

_action = [
    "Open Spectator",//Action name
    "Open ACE Spectator",//Name of the action shown in the menu
    "",//Icon
    {[true, false , false] call ace_spectator_fnc_setSpectator;},//Statement
    {true}//Condition
] call ace_interact_menu_fnc_createAction;

[_unit, 1, ["ACE_SelfActions"],_action] remoteExec ["ace_interact_menu_fnc_addActionToObject", _unit];
["Success", format ["%1 spectator set", name _unit], 0] call BIS_fnc_curatorHint;
