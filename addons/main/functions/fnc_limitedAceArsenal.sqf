/*
 * Author: PlayerBot
 * Add limited ACE arsenal to a box, available item is all items in the box
 *
 * Arguments:
 * 0: Position(not used) <ARRAY>
 * 1: Item box <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * _box call BOT_Zeus_Modules_fnc_limitedAceArsenal;
 *
 * Public: Yes
*/

params [
	["_position", [0, 0, 0]],
	["_attachedObject", objNull]
];

_fnc_temp = {
    params ["_box"];

    // the item box
    // _box = cursorObject;
    _items = [];

    // get all kinds of items in the box
    _items pushBack itemCargo _box;
    _items pushBack magazineCargo _box;
    _items pushBack weaponsItemsCargo _box;
    _items pushBack backpackCargo _box;

    // get all kinds of items in the containers(uniform, vest, backpack) in the box
    {
        _container = _x#1;
        _items pushBack itemCargo _container;
        _items pushBack magazineCargo _container;
        _items pushBack weaponsItemsCargo _container;
        _items pushBack backpackCargo _container;
    } forEach everyContainer _box;

    // flatten the array, remove duplicates, remove empty string and number
    _items = flatten _items;
    _items = _items arrayIntersect _items;
    _items = _items select {_x isEqualType "" && {_x != ""}};

    //_items

    // seperate with change line
    // _items joinString toString [10];

    // 
    [_box, []] call ace_arsenal_fnc_initBox;
    [_box, _items] call ace_arsenal_fnc_addVirtualItems;
};

[_attachedObject, _fnc_temp] remoteExec ["call", 0, true];
["Success", format ["%1 set as arsenal", typeOf _attachedObject], 0] call BIS_fnc_curatorHint;
