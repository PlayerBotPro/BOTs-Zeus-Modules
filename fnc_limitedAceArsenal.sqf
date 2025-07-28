/*
 * Author: Alganthe, johnb43
 * Add limited ACE arsenal to a box, available item is all items in the box
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Items <BOOL or ARRAY of STRINGs>
 * 2: Initialize globally <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_box, ["MyItem1", "MyItem2", "MyItemN"]] call ace_arsenal_fnc_initBox
 * [_box, true] call ace_arsenal_fnc_initBox
 *
 * Public: Yes
*/

// the item box
_box = cursorObject;
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

[_box, _tempCode] remoteExec ["call", 0, true];
