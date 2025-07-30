//#include "script_component.hpp"
// #include "XEH_PREP.hpp"
// ADDON = true;
BOT_Zeus_Modules_fnc_loadInventory = compile preprocessFileLineNumbers 'BOT\BOT_Zeus_Modules\addons\main\functions\fnc_loadInventory.sqf';
BOT_Zeus_Modules_fnc_addSpectatorAction = compile preprocessFileLineNumbers 'BOT\BOT_Zeus_Modules\addons\main\functions\fnc_addSpectatorAction.sqf';
BOT_Zeus_Modules_fnc_fireSupport = compile preprocessFileLineNumbers 'BOT\BOT_Zeus_Modules\addons\main\functions\fnc_fireSupport.sqf';
BOT_Zeus_Modules_fnc_limitedAceArsenal = compile preprocessFileLineNumbers 'BOT\BOT_Zeus_Modules\addons\main\functions\fnc_limitedAceArsenal.sqf';
// if not a player we don't do anything
if (!hasInterface) exitWith {}; 

// zeus modules
// Using BI way to create modules will need server + all clients load this addon
// https://community.bistudio.com/wiki/Modules
private _moduleList = [
    //module display name, func
	// ["Save and Load Inventory Module",{_this call FUNC(loadInventory)}]
    ["Set Target Inventory Loadable",{_this call BOT_Zeus_Modules_fnc_loadInventory}],
    ["Set Target ACE Spectator",{_this call BOT_Zeus_Modules_fnc_addSpectatorAction}],
    ["Fire Artillery at",{_this call BOT_Zeus_Modules_fnc_fireSupport}],
    ["Limited ACE Arsenal",{_this call BOT_Zeus_Modules_fnc_limitedAceArsenal}]
];

{
    [   //category name
        "BOTs", 
		(_x select 0), 
		(_x select 1)
    ] call zen_custom_modules_fnc_register;
} forEach _moduleList;

//systemChat "success XEH_postInit";
