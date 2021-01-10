//take a look at /maps/_weapon_spawns if you dont know what to do
load_custom_weapons_positions()
{
	if (getDvar("mapname") == "mp_yourmap")
	{
		level.weap_coordinates		= [];
		level.weap_coordinates[0]	= (1696, -1039, 125 - 60);//-60 because /viewpos is taken from the players eye level and the ground is 60 units below
		level.weap_coordinates[1]	= (12354, -342, 24 - 60);
		level.weap_coordinates[3]	= (15334, 3552, 175 - 60);	
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}
	else if(getDvar("mapname") == "mp_yourmap2")
	{		
		level.weap_coordinates		= [];
		level.weap_coordinates[0]	= (1696, -1039, 125 - 60);
		level.weap_coordinates[1]	= (12354, -342, 24 - 60);
		level.weap_coordinates[3]	= (15334, 3552, 175 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}






	else//this has to be at the end of this file
	{
		thread maps\mp\gametypes\_main::errorMsg("weaponSpawn");
	}
}