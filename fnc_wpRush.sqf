params ["_group", "_position", "_target"];

{
    _x disableAI "AUTOCOMBAT";
    _x disableAI "AUTOTARGET";
    _x disableAI "FSM";
    _x disableAI "TARGET";

    _x doMove _position;

} count (units _group);

waitUntil {
    sleep 1;
    (leader _group) distance _position < 50
};

true