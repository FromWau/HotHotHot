global function HotHotHotInit



void function HotHotHotInit()
{
    AddCallback_OnPlayerKilled ( onPlayerKilled )
}


void function onPlayerKilled( ObituaryCallbackParams inputParams )
{
    bool isPlayerVictim = inputParams.victim == GetLocalClientPlayer()
    //printt("victim: " + isPlayerVictim)

    if (isPlayerVictim) {
	string sourceDisplayName = DamageSourceIDToString(inputParams.damageSourceId)
	//printt("damage: " + sourceDisplayName)

	if (isSourceFire(sourceDisplayName)) {
	    GetLocalClientPlayer().ClientCommand("playvideo hothothot 1 1")
	}
    }
}


bool function isSourceFire( string sourceDisplayName )
{
    switch (sourceDisplayName) {
	case "mp_weapon_thermite_grenade":  // Firestar
	case "mp_titanweapon_meteor":	    // Thermite Launcher
        case "mp_titanweapon_flame_wall":   // Flame Wall
        case "mp_titanability_slow_trap":   // Incendiary Trap
        case "mp_titanweapon_heat_shield":  // Thermal Shield
	case "mp_titancore_flame_wave":	    // Flame Core
	    return true
    }

    return false
}
