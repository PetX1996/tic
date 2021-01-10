stat_get(dataname)
{
	return self getstat( int(tablelookup( "mp/tictstats.csv", 1, dataname, 0 )) );
}

stat_set(dataname, value)
{
	self setstat( int(tablelookup( "mp/tictstats.csv", 1, dataname, 0 )), value );	
}

stat_add(dataname, value)
{	
	curvalue = self getstat( int(tablelookup( "mp/tictstats.csv", 1, dataname, 0 )) );
	self setstat( int(tablelookup( "mp/tictstats.csv", 1, dataname, 0 )), value + curvalue );
}