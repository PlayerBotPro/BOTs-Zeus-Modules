class CfgPatches
{
    //class ADDON
    class BOT_Zeus_Modules_main
    {
        // units[]={"BOT_Module_LoadInventory"};
        units[]={};
        requiredAddons[]={"zen_custom_modules"};
        requiredVersion = 2.20;
        #include "..\script_version.hpp"
        versionAr[] = {MAJOR, MINOR, PATCH};
    };
};
