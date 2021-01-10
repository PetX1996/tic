init()
{
	game["menu_quickcommands"] = "quickcommands";
	game["menu_quickstatements"] = "quickstatements";
	game["menu_quickresponses"] = "quickresponses";

	precacheMenu(game["menu_quickcommands"]);
	precacheMenu(game["menu_quickstatements"]);
	precacheMenu(game["menu_quickresponses"]);
	precacheHeadIcon("talkingicon");
	
	precacheShader("objpoint_tank");

	precacheString( &"QUICKMESSAGE_FOLLOW_ME" );
	precacheString( &"QUICKMESSAGE_MOVE_IN" );
	precacheString( &"QUICKMESSAGE_FALL_BACK" );
	precacheString( &"QUICKMESSAGE_SUPPRESSING_FIRE" );
	precacheString( &"QUICKMESSAGE_ATTACK_LEFT_FLANK" );
	precacheString( &"QUICKMESSAGE_ATTACK_RIGHT_FLANK" );
	precacheString( &"QUICKMESSAGE_HOLD_THIS_POSITION" );
	precacheString( &"QUICKMESSAGE_REGROUP" );
	precacheString( &"QUICKMESSAGE_ENEMY_SPOTTED" );
	precacheString( &"QUICKMESSAGE_ENEMIES_SPOTTED" );
	precacheString( &"QUICKMESSAGE_IM_IN_POSITION" );
	precacheString( &"QUICKMESSAGE_AREA_SECURE" );
	precacheString( &"QUICKMESSAGE_GRENADE" );
	precacheString( &"QUICKMESSAGE_SNIPER" );
	precacheString( &"QUICKMESSAGE_NEED_REINFORCEMENTS" );
	precacheString( &"QUICKMESSAGE_HOLD_YOUR_FIRE" );
	precacheString( &"QUICKMESSAGE_YES_SIR" );
	precacheString( &"QUICKMESSAGE_NO_SIR" );
	precacheString( &"QUICKMESSAGE_IM_ON_MY_WAY" );
	precacheString( &"QUICKMESSAGE_SORRY" );
	precacheString( &"QUICKMESSAGE_GREAT_SHOT" );
	precacheString( &"QUICKMESSAGE_TOOK_LONG_ENOUGH" );
	precacheString( &"QUICKMESSAGE_ARE_YOU_CRAZY" );	
	precacheString( &"QUICKMESSAGE_WATCH_SIX" );	
	precacheString( &"QUICKMESSAGE_COME_ON" );	
}

wm_quickmessage(response)
{
	self endon ( "disconnect" );
	switch(response)		
	{
		case"1":
		if(isDefined(self.traitor))
		{
			self openMenu(game["traitor"]);						
			break;
		}
	}
}

missing(response)
{
	self endon ("disconnect");
	switch(response)
	{
		case"missing": self thread maps\mp\gametypes\_scoreboardthink::updatePlayers();break;
	}
}

other(response)
{
	self endon ( "disconnect" );
	switch(response)
	{
		case"autoassign":
		self [[level.autoassign]]();
		break;
		case"defuse":
		chance = randomIntRange(0,3);
		if( chance == 1)
		{
			setDvar("bomb_defused", 1);
			wait 0.1;
		}
		else if( chance != 1)
		{
			setDvar("bomb_explode", 1);
		}
		break;
	}
	response = int(response);
	if(response >= 2 && response <= 120)
		self thread bomb(response);
}

bomb_trigger(trigger)
{
	level endon("restarting");
	level endon ("game_ended");
	level endon("remove_bomb_trigger");
	setDvar("bomb_defused", 0);
	for(;;)
	{		
		trigger waittill("trigger", player);
		player iprintln("^7Press ^3[{+frag}]^7 to get defuse the bomb.");
		while(player isTouching(trigger))
		{
			if(getDvarInt("bomb_defused") == 1)
			{
				break;
			}
			if(player fragButtonPressed())
			{
				player setClientDvar("menu_defuse", 1);
				player setClientDvar("menu_bomb", 0);
				player openMenu("other");
				wait 0.5;
			}
			wait 0.05;
		}
		wait 0.05;
		if(getDvarInt("bomb_defused") == 1)
		{
			break;			
		}
	}
	trigger delete();
}

bomb(time)
{
	self.traitorpoints -= 1;
	self setClientDvar("traitorpoints", self.traitorpoints);
	level.bomb = true;
	level.bomborigin = self.origin;
	level.bombowner = self;
	origin=self.origin;
	// Out of range reliableAcknowledge message from bot107 - cl->reliableSequence is 3590, reliableAcknowledge is 3455
	setDvar("bomb_explode", 0);
	for(i=0;i<level.players.size;i++)
	{
		player = level.players[i];
		if(isDefined(player.traitor))
		{
			player.bombwaypoint  		=newClientHudElem(self);
			player.bombwaypoint.x       =origin[0];
			player.bombwaypoint.y		=origin[1];
			player.bombwaypoint.z 		=origin[2];
			player.bombwaypoint.alpha 	=0.5;
			player.bombwaypoint.isShown	=true;
			player.bombwaypoint setShader("objpoint_tank", 10, 10);
			player.bombwaypoint setwaypoint(true);
		}
	}
	bomb = spawn( "script_model", origin );
	bomb setModel( "prop_suitcase_bomb" );
	bomb.angles = self getPlayerAngles();
	bomb thread bomb_trigger(spawn("trigger_radius",(self.origin),0, 60, 60));
	for(i=1;i<time;i++)
	{
		for(e=0;e<level.players.size;e++)
		{
			if( isDefined( level.players[e].traitor ) )
				level.players[e] setClientDvar("traitorbomb", "Bomb: " + ( time - i ) );
		}
		if(getDvarInt("bomb_explode") == 1)
			break;
		if(getDvarInt("bomb_defused") == 1)
			break;
		wait 1;
	}
	if(getDvarInt("bomb_defused") != 1)
	{
		level notify("remove_bomb_trigger");
		explosionEffect = spawnFx(loadFX("explosions/tanker_explosion"), origin + (20,20,20), (0,0,1), (1,1,0) );
		TriggerFx( explosionEffect );		
		
		for(i=0;i<level.players.size;i++)
		{
			level.players[i] playsound("artillery_explosion");
		}
		RadiusDamage( (origin[0], origin[1], origin[2] - 60), 500, 1000, 1000 ); 
		RadiusDamage( (origin[0], origin[1], origin[2] - 00), 500, 1000, 1000 ); 
		RadiusDamage( (origin[0], origin[1], origin[2] + 60), 500, 1000, 1000 ); 
		earthquake (2, 2, origin, 500); 
	}
	for(i=0;i<level.players.size;i++)
	{
		if(isDefined(level.players[i].bombwaypoint))
			level.players[i].bombwaypoint destroy();
	}
	bomb delete();
	wait 0.1;
	setDvar("bomb_defused", 0);
	level.bomborigin = undefined;
	level.bombowner = undefined;
	level.bomb = undefined;
	for(i=0;i<level.players.size;i++)
	{
		if( isDefined( level.players[i].traitor ) )
			level.players[i] setClientDvar("traitorbomb", "7. Bomb");
	}
}

identify(response)
{
	self endon ("disconnect");
	if(isDefined(self.bodyname))
	{
		switch(response)
		{
			case"identify":
			if(isDefined(self.bodytraitor))
			{
				self thread maps\mp\gametypes\_scoreboardthink::removeFromMissing(self.bodyname);
				self thread maps\mp\gametypes\_scoreboardthink::addToDead(self.bodyname + " (^1Traitor^7)");
							
				self thread maps\mp\gametypes\_rank::updateRankScoreHUD();
				iprintln("^7The body of^3 " + self.bodyname + "^7 has been found by " + self.name);
				iprintln("^7He was a ^1traitor");
				setDvar(("trigger" + self.bodyname), "1");
				self setClientDvar("identify", 0);
			}
			else if(!isDefined(self.bodytraitor))
			{
				self thread maps\mp\gametypes\_scoreboardthink::removeFromMissing(self.bodyname);
				self thread maps\mp\gametypes\_scoreboardthink::addToDead(self.bodyname + " (^2Innocent^7)");
					
				self thread maps\mp\gametypes\_rank::updateRankScoreHUD();
				iprintln("^7The body of^3 " + self.bodyname + "^7 has been found by " + self.name);
				iprintln("^7He was ^2innocent");
				setDvar(("trigger" + self.bodyname), "1");
				self setClientDvar("identify", 0);
			}
		}
	}
}

traitor(response)
{
	self endon ( "disconnect" );
	if(isDefined(self.traitor))
	{
		switch(response)		
		{
			case "0":
			if(self.traitorpoints > 0)
			{
				self.traitorpoints -= 1;
				self setClientDvar("traitorpoints", self.traitorpoints);
				self thread invisible();
			}
			else if(self.traitorpoints <= 0)
			{
				self iprintln("^1You dont have enough traitor points!");
			}
			break;
			case"2":
			if(self.traitorpoints > 0)
			{
				self.traitorpoints -= 1;
				self setClientDvar("traitorpoints", self.traitorpoints);
				self.resetheal = true;
			}
			else if(self.traitorpoints <= 0)
			{
				self iprintln("^1You dont have enough traitor points!");
			}
			break;
			case"3":
			if(self.traitorpoints > 0)
			{
				self.traitorpoints -= 1;
				self setClientDvar("traitorpoints", self.traitorpoints);
				self thread maps\mp\gametypes\_main::playerPositionWaypoints();
			}
			else if(self.traitorpoints <= 0)
			{
				self iprintln("^1You dont have enough traitor points!");
			}
			break;
			
			case"4":
			if(self.traitorpoints > 0)
			{
				self.traitorpoints -= 1;
				self setClientDvar("traitorpoints", self.traitorpoints);
				self thread toxic_nade();
			}
			else if(self.traitorpoints <= 0)
			{
				self iprintln("^1You dont have enough traitor points!");
			}
			break;
			case"5":
			if(self.traitorpoints > 0)
			{	
				for(;;)
				{
					player = level.players[randomIntRange(0, level.players.size)];
					if(!isDefined(player.traitor) && player.sessionstate == "playing")
					{
						player.swap = true;
						self.swap = true;
						wait 0.05;
						org1 = self.origin;
						angle1 = self getPlayerAngles();
						org2 = player.origin;
						angle2 = player getPlayerAngles();
						self setOrigin(org2);
						self setPlayerAngles(angle2);
						player setOrigin(org1);
						player setPlayerAngles(angle1);
						wait 0.05;
						player.swap = undefined;
						self.swap = undefined;
						break;
					}
					wait 0.05;
				}		
				self.traitorpoints -= 1;
				self setClientDvar("traitorpoints", self.traitorpoints);
			}
			else if(self.traitorpoints <= 0)
			{
				self iprintln("^1You dont have enough traitor points!");
			}
			break;
			case"6":
			if(self.traitorpoints > 0)
			{

				self.traitorpoints -= 1;
				self setClientDvar("traitorpoints", self.traitorpoints);
				self thread kamikaze();
			}
			else if(self.traitorpoints <= 0)
			{
				self iprintln("^1You dont have enough traitor points!");
			}
			break;
			case"7":
			if(self.traitorpoints > 0)
			{
				if(!isDefined( level.bomb ))
				{
					self setClientDvar("menu_bomb", 1);
					self setClientDvar("menu_defuse", 0);
					self openMenu("other");	
				}
			}
			else if( self.traitorpoints <= 0)
			{
				self iprintln("^1You dont have enough traitor points!");
			}
		}
	}
}

invisible()
{
	self iprintln("^2You are now invisible for 7 seconds!");
	self disableWeapons();
	self hide();
	wait 7;
	self show();
	self iprintln("^2You are visible again!");
	self enableWeapons();
}

kamikaze()
{
	self iprintln("^2Shoot to set the location of the plane");
	self waittill( "begin_firing" );
	vec = anglestoforward(self getPlayerAngles());
	end = (vec[0] * 200000, vec[1] * 200000, (vec[2] * 200000) - 10000);
	end = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+end, 0, self)[ "position" ];
	start = (end[0], end[1],end[2] + 10000);
	plane = spawn( "script_model", start );
	plane setModel( "vehicle_mig29_desert" );
	angle = self getPlayerAngles();
	plane.angles = (90, angle[1], angle[2]);
	time = (distance(start, end)/7000);
	plane.move = undefined;
	for(i=(-180);i<=160;i+=11.5)
	{
		if(!isDefined(plane.move))
		{
			plane moveTo( end, time);
			plane.move = true;
		}
		wait 0.05;
		plane.angles = (90, i, angle[2]);		
	}
	level.plane = true;
	level.planeowner = self;
	level.planeorigin = plane.origin;				
	explosionEffect = spawnFx(loadFX("explosions/tanker_explosion"), end + (20,20,20), (0,0,1), (1,1,0) );
	TriggerFx( explosionEffect );		
	
	for(i=0;i<level.players.size;i++)
	{
		level.players[i] playsound("artillery_explosion");
	}
	RadiusDamage( (end[0], end[1], end[2] - 60), 400, 1000, 1000 ); 
	RadiusDamage( (end[0], end[1], end[2] - 00), 400, 1000, 1000 ); 
	RadiusDamage( (end[0], end[1], end[2] + 60), 400, 1000, 1000 ); 

	earthquake (2, 2, end, 500); 	
	plane moveTo( (plane.origin[0], plane.origin[1], plane.origin[2] - 1000), 5);
	level.plane = undefined;
	level.planeowner = undefined;
	level.planeorigin = undefined;
	wait 0.1;
	wait 4.9;
	plane moveTo( (plane.origin[0], plane.origin[1], plane.origin[2] - 10000), 1.5);
	wait 1.5;
	plane delete();		
}

toxic_nade()
{
	self endon ( "disconnect" );
	self endon ( "death" );
	self giveWeapon("smoke_grenade_mp");
	self iPrintln("Press ^2[{+smoke}]^7 to throw a toxic nade");
	self.toxic = true;
	self waittill("grenade_fire", grenade, weaponName);	
	if(weaponName == "smoke_grenade_mp")
	{	
		self.toxic = undefined;
		nade = spawn("script_model", grenade.origin);
		nade setModel("projectile_us_smoke_grenade");
		nade Linkto(grenade);
		wait 2;
		for(i=0;i < 10; i++)
		{
			level.toxicnade = true;
			level.toxicnadeowner = self;
			level.toxicnadeorigin = nade.origin;
			RadiusDamage(nade.origin,300,51,51);
			wait 1;	
		}
		level.toxicnade = undefined;
		nade delete();
	}
} 
	
quickcommands(response)
{
	self endon ( "disconnect" );
	
	if(!isdefined(self.pers["team"]) || self.pers["team"] == "spectator" || isdefined(self.spamdelay))
		return;

	self.spamdelay = true;
	
	switch(response)		
	{
		case "1":
			soundalias = "mp_cmd_followme";
			saytext = &"QUICKMESSAGE_FOLLOW_ME";
			//saytext = "Follow Me!";
			break;

		case "2":
			soundalias = "mp_cmd_movein";
			saytext = &"QUICKMESSAGE_MOVE_IN";
			//saytext = "Move in!";
			break;

		case "3":
			soundalias = "mp_cmd_fallback";
			saytext = &"QUICKMESSAGE_FALL_BACK";
			//saytext = "Fall back!";
			break;

		case "4":
			soundalias = "mp_cmd_suppressfire";
			saytext = &"QUICKMESSAGE_SUPPRESSING_FIRE";
			//saytext = "Suppressing fire!";
			break;

		case "5":
			soundalias = "mp_cmd_attackleftflank";
			saytext = &"QUICKMESSAGE_ATTACK_LEFT_FLANK";
			//saytext = "Attack left flank!";
			break;

		case "6":
			soundalias = "mp_cmd_attackrightflank";
			saytext = &"QUICKMESSAGE_ATTACK_RIGHT_FLANK";
			//saytext = "Attack right flank!";
			break;

		case "7":
			soundalias = "mp_cmd_holdposition";
			saytext = &"QUICKMESSAGE_HOLD_THIS_POSITION";
			//saytext = "Hold this position!";
			break;

		default:
			assert(response == "8");
			soundalias = "mp_cmd_regroup";
			saytext = &"QUICKMESSAGE_REGROUP";
			//saytext = "Regroup!";
			break;
	}

	self saveHeadIcon();
	self doQuickMessage(soundalias, saytext);

	wait 2;
	self.spamdelay = undefined;
	self restoreHeadIcon();	
}

quickstatements(response)
{
	if(!isdefined(self.pers["team"]) || self.pers["team"] == "spectator" || isdefined(self.spamdelay))
		return;

	self.spamdelay = true;
	
	switch(response)		
	{
		case "1":
			soundalias = "mp_stm_enemyspotted";
			saytext = &"QUICKMESSAGE_ENEMY_SPOTTED";
			//saytext = "Enemy spotted!";
			break;

		case "2":
			soundalias = "mp_stm_enemiesspotted";
			saytext = &"QUICKMESSAGE_ENEMIES_SPOTTED";
			//saytext = "Enemy down!";
			break;

		case "3":
			soundalias = "mp_stm_iminposition";
			saytext = &"QUICKMESSAGE_IM_IN_POSITION";
			//saytext = "I'm in position.";
			break;

		case "4":
			soundalias = "mp_stm_areasecure";
			saytext = &"QUICKMESSAGE_AREA_SECURE";
			//saytext = "Area secure!";
			break;

		case "5":
			soundalias = "mp_stm_watchsix";
			saytext = &"QUICKMESSAGE_WATCH_SIX";
			//saytext = "Grenade!";
			break;

		case "6":
			soundalias = "mp_stm_sniper";
			saytext = &"QUICKMESSAGE_SNIPER";
			//saytext = "Sniper!";
			break;

		default:
			assert(response == "7");
			soundalias = "mp_stm_needreinforcements";
			saytext = &"QUICKMESSAGE_NEED_REINFORCEMENTS";
			//saytext = "Need reinforcements!";
			break;
	}

	self saveHeadIcon();
	self doQuickMessage(soundalias, saytext);

	wait 2;
	self.spamdelay = undefined;
	self restoreHeadIcon();
}

quickresponses(response)
{
	if(!isdefined(self.pers["team"]) || self.pers["team"] == "spectator" || isdefined(self.spamdelay))
		return;

	self.spamdelay = true;

	switch(response)		
	{
		case "1":
			soundalias = "mp_rsp_yessir";
			saytext = &"QUICKMESSAGE_YES_SIR";
			//saytext = "Yes Sir!";
			break;

		case "2":
			soundalias = "mp_rsp_nosir";
			saytext = &"QUICKMESSAGE_NO_SIR";
			//saytext = "No Sir!";
			break;

		case "3":
			soundalias = "mp_rsp_onmyway";
			saytext = &"QUICKMESSAGE_IM_ON_MY_WAY";
			//saytext = "On my way.";
			break;

		case "4":
			soundalias = "mp_rsp_sorry";
			saytext = &"QUICKMESSAGE_SORRY";
			//saytext = "Sorry.";
			break;

		case "5":
			soundalias = "mp_rsp_greatshot";
			saytext = &"QUICKMESSAGE_GREAT_SHOT";
			//saytext = "Great shot!";
			break;

		default:
			assert(response == "6");
			soundalias = "mp_rsp_comeon";
			saytext = &"QUICKMESSAGE_COME_ON";
			//saytext = "Took long enough!";
			break;
	}

	self saveHeadIcon();
	self doQuickMessage(soundalias, saytext);

	wait 2;
	self.spamdelay = undefined;
	self restoreHeadIcon();
}

doQuickMessage( soundalias, saytext )
{
	if(self.sessionstate != "playing")
		return;

	if ( self.pers["team"] == "allies" )
	{
		if ( game["allies"] == "sas" )
			prefix = "UK_";
		else
			prefix = "US_";
	}
	else
	{
		if ( game["axis"] == "russian" )
			prefix = "RU_";
		else
			prefix = "AB_";
	}

	if(isdefined(level.QuickMessageToAll) && level.QuickMessageToAll)
	{
		self.headiconteam = "none";
		self.headicon = "talkingicon";

		self playSound( prefix+soundalias );
		self sayAll(saytext);
	}
	else
	{
		if(self.sessionteam == "allies")
			self.headiconteam = "allies";
		else if(self.sessionteam == "axis")
			self.headiconteam = "axis";
		
		self.headicon = "talkingicon";

		self playSound( prefix+soundalias );
		self sayTeam( saytext );
		self pingPlayer();
	}
}

saveHeadIcon()
{
	if(isdefined(self.headicon))
		self.oldheadicon = self.headicon;

	if(isdefined(self.headiconteam))
		self.oldheadiconteam = self.headiconteam;
}

restoreHeadIcon()
{
	if(isdefined(self.oldheadicon))
		self.headicon = self.oldheadicon;

	if(isdefined(self.oldheadiconteam))
		self.headiconteam = self.oldheadiconteam;
}