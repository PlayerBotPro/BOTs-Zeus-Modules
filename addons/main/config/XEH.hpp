class Extended_PostInit_EventHandlers 
{
	// class ADDON
	class BOT_Module_loadInventory
	{
		// init= QUOTE(call COMPILE_FILE(XEH_postInit));
		init="call compile preprocessFileLineNumbers 'BOT_Module_loadInventory\XEH_postInit.sqf'";
	};
};
