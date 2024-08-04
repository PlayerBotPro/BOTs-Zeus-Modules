class CfgPatches
{
    class BOT_Module_LoadInventory
    {
        units[]={"BOT_Module_LoadInventory"};
    };
};

class CfgVehicles
{
	class Module_F;
    class BOT_Module_LoadInventory: Module_F
    {
        scopeCurator=2;
        category = "Curator";
        displayName = "Set Unit Inventory Loadable";
        function = "BOT_fnc_loadInventory";
    };
};

