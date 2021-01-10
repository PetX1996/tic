setServerDvars()
{
	for(i=1;i<31;i++)
	{
		setDvar(("tic_missing" + i), "");
		setDvar(("tic_dead" +i), "");
	}
}

addToMissing(name, what)
{
	skip = undefined;
	for(i=1;i<31;i++)
	{
		if(getDvar("tic_missing" + i) == name)
		{
			skip = true;
			break;
		}
		if(getDvar("tic_missing" + i) == "")
		{
			setDvar(("tic_missing" + i), name);
			break;
		}
	}
	if(!isDefined(skip))
		for(e=0;e<level.players.size;e++)
			level.players[e] setClientDvar(("tic_missing" + i), name);
}

removeFromMissing(name)
{
	for(i=1;i<31;i++)
	{
		if(getDvar("tic_missing" + i) == name)
		{
			setDvar(("tic_missing" + i), "");
			moveDvars(i);
			break;
		}
	}
}	

addToDead(name)
{
	skip = undefined;
	for(i=1;i<31;i++)
	{
		if(getDvar("tic_dead" + i) == "name")
		{
			skip = true;;
			break;
		}
		if(getDvar("tic_dead" + i) == "")
		{
			setDvar(("tic_dead" + i), name);
			break;
		}
	}
	if(!isDefined(skip))
		for(e=0;e<level.players.size;e++)
			level.players[e] thread updateDeadDvar(i, name);
}

updateDeadDvar(value, text)
{
	self setClientDvar(("tic_dead" + value), text );
}

updatePlayers()
{
	self setClientDvar("played_rounds", ((game["roundsplayed"] + 1 )+ "/" + getDvarInt("tic_maxrounds")));
	self setClientDvar("tic_online", level.players.size);
	for(i=0;i<level.players.size;i++)
	{
		self setClientDvar(("tic_online" + (i + 1)), level.players[i].name);
	}
	for(i=i;i<31;i++)
	{
		self setClientDvar(("tic_online" + (i + 1)), "");
	}
}

moveDvars(i)
{
	if(i!=30)
	{
		setDvar("tic_missing31", "");
		for(i=i;i<31;i++)
		{
			nextdvar = GetDvar("tic_missing" + (i+1));
			setDvar(("tic_missing" + i), nextdvar);
			// wait 0.05;
		}
		wait 0.05;
		for(i=0;i<level.players.size;i++)
			level.players[i] thread updateMissing();
	}
}

updateMissing()
{
	for(i=1;i<32;i++)
	{
		self setClientDvar("tic_missing" + i, getDvar("tic_missing" + i));
	}
}