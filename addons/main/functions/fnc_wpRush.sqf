params ["_group", "_position", "_target"];

//start
{
    _x doWatch objNull;

    _x disableAI "AUTOCOMBAT";
    _x disableAI "AUTOTARGET";
    _x disableAI "TARGET";

} count (units _group);

_group move _position;



//quit when close
waitUntil {
    sleep 1;
    (leader _group) distance _position < 50
};

{
    _x doWatch objNull;
    
    _x enableAI "AUTOCOMBAT";
    _x enableAI "AUTOTARGET";
    _x enableAI "TARGET";

} count (units _group);

true
