/*
Script to spawn several Weapons in a (custom) map.
This script is taken from the IW _oldschool.gsc.
dvardef() function taken from Wildcard's ACE - Thanks Marc!
createWaypoint(), deletewaypoint(), weapon_think() and weapon_spawn() taken from AWE4 - Thanks RGN Dev Team!
weaponarrays and randomize loadout on spawn are from OLD MAN WITH GUN - Thanks OMWG!

Modified by Nightwing.
Modified again by Treenix.
*/

main()
{
 	level.weapon_respawnTime=dvardef("weapon_respawn", 150, 10, 99999999999, "int");
	level.weapon_pickupFX=dvardef("weapon_pickupFX", 1, 0, 1, "int");
	level.weapon_soundFX=dvardef("weapon_soundFX", 1, 0, 1, "int");
	level.weapon_objpoints=dvardef("weapon_objpoints", 0, 0, 1, "int");
 	level.weapon_rotate=dvardef("weapon_rotate", 1, 0, 1, "int");
	level.weapon_random=dvardef("weapon_random", 1, 0, 1, "int");
}
 
weapon_names()
{
        level.weap_name=[];
        level.weap_name[0]=getWeaponName((getDvarInt("tic_weap1")));
        level.weap_name[1]=getWeaponName((getDvarInt("tic_weap2")));
        level.weap_name[2]=getWeaponName((getDvarInt("tic_weap3")));
        level.weap_name[3]=getWeaponName((getDvarInt("tic_weap4")));
        level.weap_name[4]=getWeaponName((getDvarInt("tic_weap5")));
        level.weap_name[5]=getWeaponName((getDvarInt("tic_weap6")));
        level.weap_name[6]=getWeaponName((getDvarInt("tic_weap7")));
        level.weap_name[7]=getWeaponName((getDvarInt("tic_weap8")));
        level.weap_name[8]=getWeaponName((getDvarInt("tic_weap9")));
}
 
getWeaponName(value)
{
        weapon_name = "";
 
        switch(value)
        {
            case 1: weapon_name = "uzi_mp"; break;
            case 2: weapon_name = "deserteaglegold_mp"; break;
            case 3: weapon_name = "m1014_mp"; break;
            case 4: weapon_name = "mp5_mp"; break;
            case 5: weapon_name = "ak74u_mp"; break;
            case 6: weapon_name = "remington700_mp"; break;
            case 7: weapon_name = "colt45_mp"; break;
            case 8: weapon_name = "g3_mp"; break;
            case 9: weapon_name = "skorpion_mp"; break;
            case 10: weapon_name = "g36c_mp"; break;
            case 11: weapon_name = "p90_mp"; break;       
        }
        return weapon_name;
}
weapon_setup()
{
	thread maps\_weapon_spawns::load_weapons_positions();
}  
 
weapon_think()
{	 
	wait .5;
	pickups= getentarray("weapon_pickup", "targetname");
 	for(i= 0; i < pickups.size; i++)
	{
		objID= i;
 		thread trackPickup(pickups[i], objID);
		wait 0.02;
	}
}
 
randomize()
{
	prefix = "weapon_";
	targetname= "weapon_pickup";
 
	if(level.weapon_random)
	{
		for(i= 0; i < level.weap_coordinates.size; i++)
		{
			weapon_spawn(prefix + level.weap_name[randomint((level.weap_name.size))], targetname, level.weap_coordinates[i]);
		}
	}
	else
	{
		for(i= 0; i < level.weap_coordinates.size; i++)
		{
			weapon_spawn(prefix + level.weap_name[i], targetname, level.weap_coordinates[i]);
		}
	}
}
 
weapon_spawn(classname, targetname, origin)
{
	if(!isdefined(classname) || !isdefined(targetname) || !isdefined(origin))
	return undefined;
 
	weapon=spawn(classname, origin+(0,0,45), 3);
	weapon.targetname= targetname;
	weapon.angles= (0, 0, 0);
 	 
	return weapon;
}
 
trackPickup(pickup, id)
{
	groundpoint= getPickupGroundpoint(pickup);
 
	classname= pickup.classname;
	origin = pickup.origin;
	angles = pickup.angles;
	spawnflags= pickup.spawnflags;
	model  = pickup.model;
 
	isWeapon= false;
	weapname= undefined;
	trig=undefined;
	respawnTime= undefined;
 
	if(issubstr(classname, "weapon_"))
	{
		isWeapon= true;
		weapname= pickup maps\mp\gametypes\_weapons::getItemWeaponName();
		respawnTime= level.weapon_respawnTime;
	}
 	while(true)
	{
		pickup thread spinPickup();
 		player= undefined;
		if(isWeapon)
		{
			pickup setPickupStartAmmo(weapname);
			while(true)
			{
				pickup waittill("trigger", player, dropped);
 				if(!isdefined(pickup))
				break;
				assert(!isdefined(dropped));
			}
			if(isdefined(dropped))
			{
				// dropDeleteTime= 99999999999;
				// if(dropDeleteTime > respawnTime)
				// dropDeleteTime= respawnTime;
				// dropped thread delayedDeletion(dropDeleteTime);
			}
		}
		if(isWeapon)
		{
			if(weaponInventoryType(weapname)== "item" && (!isdefined(player.inventoryWeapon) || weapname != player.inventoryWeapon))
			{
				player removeInventoryWeapon();
				player.inventoryWeapon= weapname;
				player SetActionSlot( 3, "weapon", weapname );
			}
		}
 
		level waittill("respawn_weapons");
		// wait respawnTime;
		
		pickup= spawn(classname, origin, spawnflags);
		pickup.angles= angles;
 
 		if(level.weapon_minimap)
		objective_state(id, "active");
	}
}
 
spawnPickupFX(groundpoint, fx)
{
	if(!level.weapon_pickupFX)
	return;
	
	effect= spawnFx(fx, groundpoint, (0, 0, 1), (1, 0, 0));
	triggerFx(effect);
 
	return effect;
}
 
getPickupGroundpoint(pickup)
{
	if(isDefined(pickup.origin))
	{
		trace  = bullettrace(pickup.origin, pickup.origin + (0, 0, -128), false, pickup);
		groundpoint= trace["position"];
 
		finalz= groundpoint[2];
	 
		for (radiusCounter= 1; radiusCounter <= 3; radiusCounter++)
		{
			radius= radiusCounter / 3.0 * 50;
			for (angleCounter= 0; angleCounter < 10; angleCounter++)
			{
				angle= angleCounter / 10.0 * 360.0;
				pos= pickup.origin + (cos(angle), sin(angle), 0) * radius;
	 
				trace= bullettrace( pos, pos + (0, 0, -128), false, pickup );
				hitpos= trace["position"];
	 
				if (hitpos[2] > finalz && hitpos[2] < groundpoint[2] + 15)
				finalz= hitpos[2];
			}
		}
		return (groundpoint[0], groundpoint[1], finalz);
	}
}
 
spinPickup()
{
	if(!level.weapon_rotate)
	return;
 
	if(self.spawnflags & 2 || self.classname== "script_model")
	{
		self endon("death");
 
		org= spawn("script_origin", self.origin);
		org endon("death");
 
		self linkto(org);
		self thread deleteOnDeath(org);
		
		while(true)
		{
 			org rotateyaw(360, 3, 0, 0);
			wait 2.9;
		}
	}
}
 
setPickupStartAmmo(weapname)
{
	curweapname= weapname;
	altindex= 0;
 
	while(altindex== 0 || (curweapname != weapname && curweapname != "none"))
	{
		if(weapname== "frag_grenade_mp")
		{
			allammo= 2;
			clipammo= 2;
			reserveammo= 0;
		}
		else if(weapname== "remington700_mp")
		{
			allammo= 4;
			clipammo= 4;
			reserveammo= 2;
		}
		else
		{
			allammo= weaponClipSize(curweapname);
			clipammo= weaponClipSize(curweapname);
 			reserveammo= 0;
		}
 		if(clipammo >= allammo)
		{
			clipammo= allammo;
		}
		else
		{
			reserveammo= allammo - clipammo;
		}
 		self itemWeaponSetAmmo(clipammo, reserveammo, altindex);
		curweapname= weaponAltWeaponName(curweapname);
		altindex++;
	}
}
 
removeInventoryWeapon()
{
	if(isDefined(self.inventoryWeapon))
	self takeWeapon(self.inventoryWeapon);
	self.inventoryWeapon= undefined;
}
 
deleteOnDeath(ent)
{
	ent endon("death");
	self waittill("death");
	ent delete();
}
 
 
delayedDeletion(delay)
{	
	self thread delayedDeletionOnSwappedWeapons(delay);
 
	wait delay;
	
	if(isDefined(self))
	{
		self notify("death");
		self delete();
	}
}
 
delayedDeletionOnSwappedWeapons(delay)
{
	self endon("death");
 
	while(true)
	{
 		self waittill("trigger", player, dropped);
		if(isdefined(dropped))
		break;
	}
	dropped thread delayedDeletion(delay);
}
 
dvardef(varname, vardefault, min, max, type)
{
	mapname= getdvar("mapname");
	gametype= getdvar("g_gametype");
	multigtmap= gametype + "_" + mapname;
 
	tempvar= varname + "_" + gametype;
	if(getdvar(tempvar) != "") varname= tempvar;
 
	tempvar= varname + "_" + mapname;
	if(getdvar(tempvar) != "") varname= tempvar;
 
	tempvar= varname + "_" + multigtmap;
	if(getdvar(tempvar) != "") varname= tempvar;
 
	switch(type)
	{
		case "int":
		if(getdvar(varname)== "") definition= vardefault;
		else definition= getdvarint(varname);
		break;
 
		case "float":
		if(getdvar(varname)== "") definition= vardefault;
		else definition= getdvarfloat(varname);
		break;
 
		case "string":
		default:
		if(getdvar(varname)== "") definition= vardefault;
		else definition= getdvar(varname);
		break;
	}
 
		if(type != "string")
	{
 		if(min != 0 && definition < min) definition= min;
		else if(max != 0 && definition > max) definition= max;
	}
 
	return definition;
}