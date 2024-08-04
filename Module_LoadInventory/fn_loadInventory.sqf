_tempUnit = (nearestObjects [curatorMouseOver select 1, ["CAManBase"], 0.3]) select 0;
_tempUnit allowDamage false;
_tempUnit disableAI "ALL";
[_tempUnit,
	["Load Target Inventory",
		{
            params ["_target", "_caller", "_actionId", "_arguments"];
			[_target, [localNamespace, "tempInventory"]] call BIS_fnc_saveInventory;
			[_caller, [localNamespace, "tempInventory"]] call BIS_fnc_loadInventory;
		}
	]
] remoteExec ["addAction",0,true];
systemchat format ["%1 success", _tempUnit];