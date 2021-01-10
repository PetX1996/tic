#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

main()
{
	maps\mp\gametypes\_globallogic::init();
	maps\mp\gametypes\_callbacksetup::SetupCallbacks();
	maps\mp\gametypes\_globallogic::SetupCallbacks();

	maps\mp\gametypes\_globallogic::registerNumLivesDvar( level.gameType, 0, 0, 10 );
	
	level.onStartGameType = ::onStartGameType;
	level.onSpawnPlayer = ::onSpawnPlayer;
	level.onPlayerKilled = ::onPlayerKilled;
}

onPlayerKilled(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration)
{
	if(isDefined(level.roundStarted))
	{	
		self setClientDvar("roundStarted", 0);
		self setClientDvar("self_heal", 0);
		level notify("disable_killfeed");
		if(sMeansOfDeath == "MOD_EXPLOSIVE" && isDefined(level.toxicnade))
		{
			if(distance(self.origin, level.toxicnadeorigin) <=300)
			{
				if(isDefined(level.toxicnadeowner.traitor) && !isDefined(self.traitor))
				{
					player = level.toxicnadeowner;
					player playLocalSound("killed");
					player iprintln("^2You killed an innocent");
					player iprintln("^2Your reward is 1 traitor Point");
					player.traitorpoints +=1;
					player setClientDvar("traitorpoints", player.traitorpoints);
					level.overtime=level.overtime + 15;
				}
				level thread maps\mp\gametypes\_main::dead(spawn("trigger_radius",(self.origin),0, 60, 60), self, "toxic grenade", sWeapon);
				self.skiptrigger = true;
			}
		}
		if(sMeansOfDeath == "MOD_EXPLOSIVE" && isDefined(level.plane))
		{
			if(distance(self.origin, level.planeorigin) <=400)
			{
				if(isDefined(level.planeowner.traitor) && !isDefined(self.traitor))
				{						
					player = level.planeowner;
					player playLocalSound("killed");
					player iprintln("^2You killed an innocent");
					player iprintln("^2Your reward is 1 traitor Point");
					player.traitorpoints +=1;
					player setClientDvar("traitorpoints", player.traitorpoints);
					level.overtime=level.overtime + 15;
				}
				level thread maps\mp\gametypes\_main::dead(spawn("trigger_radius",(self.origin),0, 60, 60), self, "Kamikaze", sWeapon);
				self.skiptrigger = true;
			}
		}
		if(sMeansOfDeath == "MOD_EXPLOSIVE" && isDefined(level.bomb))
		{
			if(distance(self.origin, level.bomborigin) <= 500)
			{
				if(isDefined(level.bombowner.traitor) && !isDefined(self.traitor))
				{
					player = level.bombowner;
					player playLocalSound("killed");
					player iprintln("^2You killed an innocent");
					player iprintln("^2Your reward is 1 traitor Point");
					player.traitorpoints +=1;
					player setClientDvar("traitorpoints", player.traitorpoints);
					level.overtime=level.overtime + 15;
				}
				level thread maps\mp\gametypes\_main::dead(spawn("trigger_radius",(self.origin),0, 60, 60), self, "Bomb", sWeapon);
				self.skiptrigger = true;

			}
		}
		self thread maps\mp\gametypes\_main::spectateHud();
		while(isDefined(self.traitorWaypoint))
		{
			self.traitorWaypoint destroy();
			wait 0.05;
		}
		
		while(isDefined(self.waypoint))
		{
			self.waypoint destroy();
			wait 0.05;
		}

		attacker thread maps\mp\gametypes\_main::kill(self);
		self notify("remove_Traitor_TP");
		
		self setClientDvar("cg_chattime", 12000);
		self setClientDvar("cg_scoreboardWidth", 500);
		self setClientDvar("cg_scoreboardHeight", 435);
		self setClientDvar("cg_scoreboardItemHeight", 18);	
		self setClientDvar("monkeytoy", 0);
		
		if(isDefined(attacker) && !isDefined(self.skipHUD))
		{
			if(RandomIntRange(1, 3)!=2)
				self thread maps\mp\gametypes\_scoreboardthink::addToMissing(self.name);
			if(!isDefined(self.skiptrigger))
				level thread maps\mp\gametypes\_main::dead(spawn("trigger_radius",(self.origin),0, 20, 20), self, sMeansOfDeath, sWeapon);
			self.skiptrigger = undefined;
			self.skipHUD = undefined;
			self.specate = true;
			self allowSpectateTeam( "allies", true );
			self allowSpectateTeam( "axis", true );
			self allowSpectateTeam( "freelook", true );
			self allowSpectateTeam( "none", true );
			self [[level.spectator]]();
		}
		else
		{
			self.skipHUD = undefined;
			self.specate = true;
			self allowSpectateTeam( "allies", true );
			self allowSpectateTeam( "axis", true );
			self allowSpectateTeam( "freelook", true );
			self allowSpectateTeam( "none", true );
			self [[level.spectator]]();

		}
	}
}
	
checkAllowSpectating()
{
	wait ( 0.05 );
	
	update = true;
	if ( update )
		maps\mp\gametypes\_spectating::updateSpectateSettings();
}

onStartGameType()
{
	level.spawnMins = ( 0, 0, 0 );
	level.spawnMaxs = ( 0, 0, 0 );
	maps\mp\gametypes\_spawnlogic::addSpawnPoints( "allies", "mp_dm_spawn" );
	maps\mp\gametypes\_spawnlogic::addSpawnPoints( "axis", "mp_dm_spawn" );
	level.mapCenter = maps\mp\gametypes\_spawnlogic::findBoxCenter( level.spawnMins, level.spawnMaxs );
	setMapCenter( level.mapCenter );
	
	allowed[0] = "tic";
	maps\mp\gametypes\_gameobjects::main(allowed);
	
	level.displayRoundEndText = false;
	level.QuickMessageToAll = true;
}

onSpawnPlayer()
{
	self hide();
	if(!isDefined(level.roundStarted))
	{
		self setClientDvar("roundstarted", 0);
	}
	if(isDefined(level.roundStarted))
	{
		self setClientDvar("roundstarted", 1);
	}
	if(isDefined(self.hud_rankscroreupdate))
		self.hud_rankscroreupdate.alpha = 0;
	if(getDvarInt("tic_antiBlock") == 1)
		self thread maps\mp\gametypes\_main::antiblock();
	self thread maps\mp\gametypes\_main::adminCheck();
	if(isDefined(self.spectateHud))
	{
		self.hud["spectate"] destroy();
		self.spectateHud = undefined;
	}
	self thread maps\mp\gametypes\_main::updateClientDvars();
	self.curClass = "specops";
	self thread maps\mp\gametypes\_main::antifun();
	spawnPoints = maps\mp\gametypes\_spawnlogic::getTeamSpawnPoints( self.pers["team"] );
	spawnPoint = maps\mp\gametypes\_spawnlogic::getSpawnpoint_DM( spawnPoints );
	self TakeAllWeapons();
	self giveWeapon("deserteaglegold_mp");
	self spawn( spawnPoint.origin, spawnPoint.angles );
	self setClientDvar("r_Blur", 0);
	self spawn( spawnPoint.origin, spawnPoint.angles );
	self show();
}


onEndGame( winningPlayer )
{
	if ( isDefined( winningPlayer ) )
		[[level._setPlayerScore]]( winningPlayer, winningPlayer [[level._getPlayerScore]]() + 1 );	
}