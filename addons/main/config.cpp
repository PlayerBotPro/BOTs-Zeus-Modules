// #include "script_component.hpp"

class CfgPatches
{
    //class ADDON
    class BOT_Module_loadInventory
    {
        // units[]={"BOT_Module_LoadInventory"};
        units[]={};
        requiredAddons[]={"zen_custom_modules"};
    };
};

// #include "CfgEventhandlers.hpp"
class Extended_PostInit_EventHandlers 
{
	// class ADDON
	class BOT_Module_loadInventory
	{
		// init= QUOTE(call COMPILE_FILE(XEH_postInit));
		init="call compile preprocessFileLineNumbers 'BOT_Module_loadInventory\XEH_postInit.sqf'";
	};
};

class cfgWaypoints {
    class BOT {
        displayName="BOT WPs";
        class BOT_Rush {
			displayName="BOT_Rush";
			displayNameDebug="BOT_Rush";
			tooltip="BOT_Rush with disableAI";
			icon="\a3\3DEN\Data\CfgWaypoints\Move_ca.paa";
			file="BOT_Module_loadInventory\fnc_wpRush.sqf";
			class Attributes
			{
			};
        };
         class BOT_RushLambs {
			displayName="BOT_RushLambs";
			displayNameDebug="BOT_RushLambs";
			tooltip="BOT_RushLambs with disableAI";
			icon="\a3\3DEN\Data\CfgWaypoints\Move_ca.paa";
			file="BOT_Module_loadInventory\fnc_wpRushLambs.sqf";
			class Attributes
			{
			};
        };
    };
};

class ZEN_WaypointTypes {
    class BOT_Rush {
        displayName = "BOT_Rush";
        type = "SCRIPTED";
        script = "BOT_Module_loadInventory\fnc_wpRush.sqf";
    };
    class BOT_RushLambs {
        displayName = "BOT_RushLambs";
        type = "SCRIPTED";
        script = "BOT_Module_loadInventory\fnc_wpRushLambs.sqf";
    };
};
