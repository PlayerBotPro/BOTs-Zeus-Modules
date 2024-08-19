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
