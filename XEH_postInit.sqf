//#include "script_component.hpp"
// #include "XEH_PREP.hpp"
// ADDON = true;
BOT_Module_loadInventory_fnc_loadInventory = compile preProcessFileLineNumbers 'BOT_Module_loadInventory\fnc_loadInventory.sqf';
// if not a player we don't do anything
if (!hasInterface) exitWith {}; 

// zeus modules
private _moduleList = [
    //module display name, func
	// ["Save and Load Inventory Module",{_this call FUNC(loadInventory)}]
    ["Set Target Inventory Loadable",{_this call BOT_Module_loadInventory_fnc_loadInventory}]
];

{
    [   //category name
        "$str_a3_cfgfactionclasses_curator", 
		(_x select 0), 
		(_x select 1)
    ] call zen_custom_modules_fnc_register;
} forEach _moduleList;

//systemChat "success XEH_postInit";