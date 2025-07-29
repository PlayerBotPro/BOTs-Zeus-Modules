_group=_this;

[_group, true, false] call lambs_wp_fnc_taskReset;
_group setBehaviourStrong "AWARE";

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

_group move [7000,7600,0];
