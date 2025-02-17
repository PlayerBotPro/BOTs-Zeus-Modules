params ["_group", "_position", "_target"];

//start
{
    if !(_x getVariable ["lambs_danger_disableAI", false]) then {
        _x setVariable ["lambs_danger_disableAI", true, true];
    };

    _x doWatch objNull;

    _x disableAI "AUTOCOMBAT";
    _x disableAI "AUTOTARGET";
    _x disableAI "TARGET";

} count (units _this);

_group move _position;



//quit when close
waitUntil {
    sleep 1;
    (leader _group) distance _position < 50
};

{
    if (_x getVariable ["lambs_danger_disableAI", false]) then {
        _x setVariable ["lambs_danger_disableAI", false, true];
    };

    _x enableAI "AUTOCOMBAT";
    _x enableAI "AUTOTARGET";
    _x enableAI "TARGET";

} count (units _group);

true