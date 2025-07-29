class Extended_PostInit_EventHandlers 
{
	// class ADDON
	class BOT_Module_loadInventory
	{
		// init= QUOTE(call COMPILE_FILE(XEH_postInit));
		init="call compile preprocessFileLineNumbers 'BOT\BOT_Zeus_Modules\addons\main\XEH_postInit.sqf'";
	};
};
