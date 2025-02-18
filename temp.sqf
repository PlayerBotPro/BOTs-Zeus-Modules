_this setBehaviourStrong "CARELESS";
_this setCombatMode "BLUE";
_this enableAttack false;
_this setSpeedMode "FULL";
_this allowFleeing 0;

_this setVariable ["lambs_danger_disableGroupAI", true];
_this setVariable ["lambs_danger_tactics", true];

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

} count (units _this);

_this setBehaviourStrong "AWARE";