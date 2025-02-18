params ["_group", "_position", "_target"];

//start

[_group, false, true] call lambs_wp_fnc_taskReset;

_group setBehaviourStrong "CARELESS";
_group setCombatMode "BLUE";
_group enableAttack false;
_group setSpeedMode "FULL";
_group allowFleeing 0;

_group setVariable ["lambs_danger_disableGroupAI", true];
_group setVariable ["lambs_danger_tactics", true];

{
    _x doWatch objNull;

    _x setVariable ["lambs_danger_disableAI", true];
    _x setVariable ["lambs_danger_forceMove", true];

    _x disableAI "TARGET";
    _x disableAI "AUTOTARGET";
    _x disableAI "AUTOCOMBAT";
    _x disableAI "COVER";
    _x disableAI "SUPPRESSION";

    _x setUnitPos "UP";
    _x enableStamina false;

} count (units _group);

_group setBehaviourStrong "AWARE";

_group move _position;



//quit when close
waitUntil {
    sleep 1;
    (leader _group) distance _position < 50
};


_group setBehaviourStrong "AWARE";
_group setCombatMode "WHITE";
_group enableAttack true;
_group setSpeedMode "NORMAL";

_group setVariable ["lambs_danger_disableGroupAI", false];
_group setVariable ["lambs_danger_tactics", false];

{
    _x doWatch objNull;

    _x setVariable ["lambs_danger_disableAI", false];
    _x setVariable ["lambs_danger_forceMove", false];

    _x enableAI "TARGET";
    _x enableAI "AUTOTARGET";
    _x enableAI "AUTOCOMBAT";
    _x enableAI "COVER";
    _x enableAI "SUPPRESSION";

    _x setUnitPos "AUTO";
    _x enableStamina true;

} count (units _group);

_group setBehaviourStrong "AWARE";


true