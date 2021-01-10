//feel free to change the spawns to your liking
load_weapons_positions()
{
	if (getDvar("mapname") == "mp_crash")
	{
		level.weap_coordinates= [];
		level.ladders= true;	 
		level.weap_coordinates[0]=(1696, -1039, 125 - 60);
		level.weap_coordinates[1]=(1357, -1986, 126 - 60);
		level.weap_coordinates[2]=(1511, -1747, 286 - 60);
		level.weap_coordinates[3]=(330, -780, 468 - 60);
		level.weap_coordinates[4]=(215, -625, 332 - 60);
		level.weap_coordinates[5]=(-40, -719, 196 - 60);
		level.weap_coordinates[6]=(1262, -10, 212 - 60);
		level.weap_coordinates[7]=(1780, 731, 200 - 60);
		level.weap_coordinates[8]=(1785, 854, 192 - 60);
		level.weap_coordinates[9]=(1236, 1347, 194 - 60);
		level.weap_coordinates[10]=(740, 1131, 333 - 60);
		level.weap_coordinates[11]=(460, 470, 207 - 60);
		level.weap_coordinates[12]=(-3, 936, 196 - 60);
		level.weap_coordinates[13]=(-40, 2310, 296 - 60);
		level.weap_coordinates[14]=(-891, 1891, 450 - 60);
		level.weap_coordinates[15]=(-576, 1813, 478 - 60);
		level.weap_coordinates[16]=(-772, 1195, 309 - 60);
		level.weap_coordinates[17]=(-174, 516, 288 - 60);
		level.weap_coordinates[18]=(740, -1754, 213 - 60);
		level.weap_coordinates[19]=(1732, 305, 205 - 60);
		level.weap_coordinates[20]=(1410, 450, 368 - 60);
		level.weap_coordinates[21]=(1792, 753, 640 - 60);
		level.weap_coordinates[22]=(833, 146, 212 - 60);
		level.weap_coordinates[23]=(343, -1426, 126 - 60);
		level.weap_coordinates[24]=(402, -855, 137 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}
	
	else if (getDvar("mapname") == "mp_vacant")
	{
		level.weap_coordinates=[];
		level.ladders= undefined;
		level.weap_coordinates[0]=(1334, -282, 72 - 60);
		level.weap_coordinates[1]=(886, 207, 12 - 60);
		level.weap_coordinates[2]=(1010, 1213, 12 - 60);
		level.weap_coordinates[3]=(1007, 722, 12 - 60);
		level.weap_coordinates[4]=(492, 984, 20 - 60);
		level.weap_coordinates[5]=(-270, 1578, 27 - 60);
		level.weap_coordinates[6]=(694, 1282, -48 - 60);
		level.weap_coordinates[7]=(457, 1540, -51 - 60);
		level.weap_coordinates[8]=(-16, 1770, -50 - 60);
		level.weap_coordinates[9]=(-882, -1472, -51 - 60);
		level.weap_coordinates[10]=(-1637, 1001, -35 - 60);
		level.weap_coordinates[11]=(-2074, 1399, -47 - 60);
		level.weap_coordinates[12]=(-1783, 548, -42 - 60);
		level.weap_coordinates[13]=(-1427, 400, -42 - 60);
		level.weap_coordinates[14]=(-1697, -320, -46 - 60);
		level.weap_coordinates[15]=(-1178, -396, -43 - 60);
		level.weap_coordinates[16]=(-815, -1392, -42 - 60);
		level.weap_coordinates[17]=(-77, -1376, -5 - 60);
		level.weap_coordinates[18]=(256, -811, 12 - 60);
		level.weap_coordinates[19]=(-21, -824, 12 - 60);
		level.weap_coordinates[20]=(-427, -611, 12 - 60);
		level.weap_coordinates[21]=(496, -313, 12 - 60);
		level.weap_coordinates[22]=(812, -236, 12 - 60);
		level.weap_coordinates[23]=(611, 285, 12 - 60);
		level.weap_coordinates[24]=(553, 210, 12 - 60);
		level.weap_coordinates[25]=(276, 305, 62 - 60);
		level.weap_coordinates[26]=(-498, 346, 52 - 60);
		level.weap_coordinates[27]=(-24, -56, 12 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}
	
	else if (getDvar("mapname") == "mp_strike")
	{
		level.weap_coordinates=[];
		level.ladders= undefined;
		level.weap_coordinates[0]=(-1762, -1276, 68 - 60);
		level.weap_coordinates[1]=(-2210, -824, 86 - 60);
		level.weap_coordinates[2]=(-2306, -830, 86 - 60);
		level.weap_coordinates[3]=(-2489, 365, 76 - 60);
		level.weap_coordinates[4]=(-1284, 55, 103 - 60);
		level.weap_coordinates[5]=(-1062, 450, 79 - 60);
		level.weap_coordinates[6]=(-1132, 294, 247 - 60);
		level.weap_coordinates[7]=(-1687, 1174, 140 - 60);
		level.weap_coordinates[8]=(-1457, 647, 140 - 60);
		level.weap_coordinates[9]=(-1303, 1487, 84 - 60);
		level.weap_coordinates[10]=(-119, 1880, 76 - 60);
		level.weap_coordinates[11]=(53, 885, 76 - 60);
		level.weap_coordinates[12]=(763, 1600, 126 - 60);
		level.weap_coordinates[13]=(1337, 1488, 83 - 60);
		level.weap_coordinates[14]=(2080, 2817, 80 - 60);
		level.weap_coordinates[15]=(3300, 2222, 84 - 60);
		level.weap_coordinates[16]=(2242, 1449, 76 - 60);
		level.weap_coordinates[17]=(1256, 1009, 76 - 60);
		level.weap_coordinates[18]=(1876, -527, 84 - 60);
		level.weap_coordinates[19]=(1355, -338, 76 - 60);
		level.weap_coordinates[20]=(2296, -569, 80 - 60);
		level.weap_coordinates[21]=(1459, 780, 218 - 60);
		level.weap_coordinates[22]=(924, -1160, 256 - 60);
		level.weap_coordinates[23]=(1354, -1578, 256 - 60);
		level.weap_coordinates[24]=(725, -1548, 80 - 60);
		level.weap_coordinates[25]=(-431, -1263, 324 - 60);
		level.weap_coordinates[26]=(-1542, -3013, 272 - 60);
		level.weap_coordinates[27]=(-808, -820, 84 - 60);
		level.weap_coordinates[28]=(-53, -615, 84 - 60);
		level.weap_coordinates[29]=(-172, 533, 80 - 60);
		level.weap_coordinates[30]=(902, 189, 76 - 60);
		level.weap_coordinates[31]=(1125, -244, 84 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}
	
	else if (getDvar("mapname") == "mp_crash_snow")
	{
		level.weap_coordinates=[];
		level.ladders= true;
		level.weap_coordinates[0]=(1696, -1039, 125 - 60);
		level.weap_coordinates[1]=(1357, -1986, 126 - 60);
		level.weap_coordinates[2]=(1511, -1747, 286 - 60);
		level.weap_coordinates[3]=(330, -780, 468 - 60);
		level.weap_coordinates[4]=(215, -625, 332 - 60);
		level.weap_coordinates[5]=(-40, -719, 196 - 60);
		level.weap_coordinates[6]=(1262, -10, 212 - 60);
		level.weap_coordinates[7]=(1780, 731, 200 - 60);
		level.weap_coordinates[8]=(1785, 854, 192 - 60);
		level.weap_coordinates[9]=(1236, 1347, 194 - 60);
		level.weap_coordinates[10]=(740, 1131, 333 - 60);
		level.weap_coordinates[11]=(460, 470, 207 - 60);
		level.weap_coordinates[12]=(-3, 936, 196 - 60);
		level.weap_coordinates[13]=(-40, 2310, 296 - 60);
		level.weap_coordinates[14]=(-891, 1891, 450 - 60);
		level.weap_coordinates[15]=(-576, 1813, 478 - 60);
		level.weap_coordinates[16]=(-772, 1195, 309 - 60);
		level.weap_coordinates[17]=(-174, 516, 288 - 60);
		level.weap_coordinates[18]=(740, -1754, 213 - 60);
		level.weap_coordinates[19]=(1732, 305, 205 - 60);
		level.weap_coordinates[20]=(1410, 450, 368 - 60);
		level.weap_coordinates[21]=(1792, 753, 640 - 60);
		level.weap_coordinates[22]=(833, 146, 212 - 60);
		level.weap_coordinates[23]=(343, -1426, 126 - 60);
		level.weap_coordinates[24]=(402, -855, 137 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}
	
	else if (getDvar("mapname") == "mp_backlot")
	{
		level.weap_coordinates=[];
		level.ladders= true;
		level.weap_coordinates[0]=(419, -397, 512 - 60);
		level.weap_coordinates[1]=(802, -1353, 268 - 60);
		level.weap_coordinates[2]=(437, 333, 258 - 60);
		level.weap_coordinates[3]=(246, 1672, 292 - 60);
		level.weap_coordinates[4]=(-900, -4, 318 - 60);
		level.weap_coordinates[5]=(-843, -0, 14 - 60);
		level.weap_coordinates[6]=(512, -380, 264 - 60);
		level.weap_coordinates[7]=(119, 565, 129 - 60);
		level.weap_coordinates[8]=(1002, 1226, 124 - 60);
		level.weap_coordinates[9]=(1495, 471, 300 - 60);
		level.weap_coordinates[10]=(1393, -875, 125 - 60);
		level.weap_coordinates[11]=(479, -1106, 260 - 60);
		level.weap_coordinates[12]=(123, -1747, 133 - 60);
		level.weap_coordinates[13]=(398, -198, 120 - 60);
		level.weap_coordinates[14]=(198, 959, 128 - 60);
		level.weap_coordinates[15]=(1558, 1049, 124 - 60);
		level.weap_coordinates[16]=(-53, 1298, 256 - 60);
		level.weap_coordinates[17]=(-110, 277, 120 - 60);
		level.weap_coordinates[18]=(765, -515, 169 - 60);
		level.weap_coordinates[19]=(636, -1037, 420 - 60);
		level.weap_coordinates[20]=(1413, -149, 238 - 60);
		level.weap_coordinates[21]=(-94, 295, 369 - 60);
		level.weap_coordinates[22]=(-471, -1575, 125 - 60);
		level.weap_coordinates[23]=(627, 262, 148 - 60);
		level.weap_coordinates[24]=(1357, 281, 300 - 60);
		level.weap_coordinates[25]=(502, -378, 170 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}
	
	else if (getDvar("mapname") == "mp_citystreets")
	{
		level.weap_coordinates=[];
		level.ladders= undefined;
		level.weap_coordinates[0]=(3608, -368, 212 - 60);
		level.weap_coordinates[1]=(4336, 112, 236 - 60);
		level.weap_coordinates[2]=(5294, 488, 68 - 60);
		level.weap_coordinates[3]=(6121, -1632, 60 - 60);
		level.weap_coordinates[4]=(5085, -2688, 58 - 60);
		level.weap_coordinates[5]=(3250, -162, -35 - 60);
		level.weap_coordinates[6]=(4770, 145, 204 - 60);
		level.weap_coordinates[7]=(5531, -279, -75 - 60);
		level.weap_coordinates[8]=(4408, -589, -67 - 60);
		level.weap_coordinates[9]=(2223, 341, 12 - 60);
		level.weap_coordinates[10]=(1982, 578, 196 - 60);
		level.weap_coordinates[11]=(5250, 273, -67 - 60);
		level.weap_coordinates[12]=(5618, 1546, 60 - 60);
		level.weap_coordinates[13]=(4512, -1565, 52 - 60);
		level.weap_coordinates[14]=(4396, 352, 68 - 60);
		level.weap_coordinates[15]=(4098, -1840, 88 - 60);
		level.weap_coordinates[16]=(3369, -1214, 55 - 60);
		level.weap_coordinates[17]=(6123, 1236, 44 - 60);
		level.weap_coordinates[18]=(3759, -180, -67 - 60);
		level.weap_coordinates[19]=(3701, -649, 56 - 60);
		level.weap_coordinates[20]=(2700, -1563, -36 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}
	
	else if (getDvar("mapname") == "mp_killhouse")
	{
		level.weap_coordinates=[];
		level.ladders= true;
		level.weap_coordinates[0]=(687, 552, 216 - 60);
		level.weap_coordinates[1]=(613, 1446, 320 - 60);
		level.weap_coordinates[2]=(1188, 1487, 224 - 60);
		level.weap_coordinates[3]=(740, 2190, 216 - 60);
		level.weap_coordinates[4]=(160, 1875, 88 - 60);
		level.weap_coordinates[5]=(599, 684, 88 - 60);
		level.weap_coordinates[6]=(985, 139, 140 - 60);
		level.weap_coordinates[7]=(182, 2399, 164 - 60);
		level.weap_coordinates[8]=(1086, 1299, 88 - 60);
		level.weap_coordinates[9]=(140, 1120, 88 - 60);
		level.weap_coordinates[10]=(534, 2140, 88 - 60);
		level.weap_coordinates[11]=(908, 691, 88 - 60);
		level.weap_coordinates[12]=(126, 1594, 195 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}	
	
	else if (getDvar("mapname") == "mp_crossfire")
	{
		level.weap_coordinates=[];
		level.ladders= true;
		level.weap_coordinates[0]=(4766, -1875, 220 - 60);
		level.weap_coordinates[1]=(4466, -2828, 132 - 60);
		level.weap_coordinates[2]=(5979, -2585, 88 - 60);
		level.weap_coordinates[3]=(5886, -1649, 220 - 60);
		level.weap_coordinates[4]=(6423, -1318, 241 - 60);
		level.weap_coordinates[5]=(5716, -3110, -10 - 60);
		level.weap_coordinates[6]=(4045, -3440, 75 - 60);
		level.weap_coordinates[7]=(3400, -3199, 52 - 60);
		level.weap_coordinates[8]=(3711, -3936, 52 - 60);
		level.weap_coordinates[9]=(4115, -4555, 84 - 60);
		level.weap_coordinates[10]=(6414, -4519, 108 - 60);
		level.weap_coordinates[11]=(5175, -3349, -11 - 60);
		level.weap_coordinates[12]=(3229, -3328, -83 - 60);
		level.weap_coordinates[13]=(4550, -4663, -25 - 60);
		level.weap_coordinates[14]=(4105, -1881, 82 - 60);
		level.weap_coordinates[15]=(3734, -4241, 40 - 60);
		level.weap_coordinates[16]=(4744, -3898, -78 - 60);
		level.weap_coordinates[17]=(5514, -2885, 88 - 60);
		level.weap_coordinates[18]=(4066, -318, 60 - 60);
		level.weap_coordinates[19]=(4050, -3405, -68 - 60);
		level.weap_coordinates[20]=(5769, -1806, 84 - 60);
		level.weap_coordinates[21]=(5028, -2313, 40 - 60);
		level.weap_coordinates[22]=(4117, -3974, -84 - 60);
		level.weap_coordinates[23]=(5395, -2391, 188 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}	
	
	else if (getDvar("mapname") == "mp_pipeline")
	{
		level.weap_coordinates=[];
		level.ladders= true;
		level.weap_coordinates[0]=(-1083, -695, 324 - 60);
		level.weap_coordinates[1]=(1024, -657, 302 - 60);
		level.weap_coordinates[2]=(1292, 614, 328 - 60);
		level.weap_coordinates[3]=(774, 1745, 458 - 60);
		level.weap_coordinates[4]=(867, 1858, 318 - 60);
		level.weap_coordinates[5]=(780, 3115, -11 - 60);
		level.weap_coordinates[6]=(-131, 2866, 220 - 60);
		level.weap_coordinates[7]=(100, 3382, 123 - 60);
		level.weap_coordinates[8]=(-76, 1657, 272 - 60);
		level.weap_coordinates[9]=(434, 1077, -59 - 60);
		level.weap_coordinates[10]=(1408, -45, 3 - 60);
		level.weap_coordinates[11]=(1161, 75, 108 - 60);
		level.weap_coordinates[12]=(640, 1113, 425 - 60);
		level.weap_coordinates[13]=(-1582, 2408, 61 - 60);
		level.weap_coordinates[14]=(-1593, 671, 52 - 60);
		level.weap_coordinates[15]=(-1190, 1482, 63 - 60);
		level.weap_coordinates[16]=(1651, 3106, 179 - 60);
		level.weap_coordinates[17]=(2007, 2938, 112 - 60); 
		level.weap_coordinates[18]=(1391, 3293, 20 - 60);
		level.weap_coordinates[19]=(-150, -1016, 383 - 60);
		level.weap_coordinates[20]=(1734, -770, 306 - 60);
		level.weap_coordinates[21]=(1758, 20, 270 - 60);
		level.weap_coordinates[22]=(69, 1966, 61 - 60);
		level.weap_coordinates[23]=(-105, 811, 268 - 60);
		level.weap_coordinates[24]=(-127, 1139, 268 - 60);
		level.weap_coordinates[25]=(603, 3176, 59 - 60);
		level.weap_coordinates[26]=(-456, 744, 64 - 60);
		level.weap_coordinates[27]=(581, 1750, 64 - 60);
		level.weap_coordinates[28]=(1121, 1024, 64 - 60);
		level.weap_coordinates[29]=(919, 547, 458 - 60);
		level.weap_coordinates[30]=(602, 485, 62 - 60);
		level.weap_coordinates[31]=(1768, 719, 223 - 60);
		level.weap_coordinates[32]=(1507, 1330, 75 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}
	
	else if (getDvar("mapname") == "mp_cargoship")
	{
		level.weap_coordinates=[];
		level.ladders= undefined;
		level.weap_coordinates[0]=(-2402, 32, 284 - 60);
		level.weap_coordinates[1]=(-3381, -17, 124 - 60);
		level.weap_coordinates[2]=(-2309, 6, 124 - 60);
		level.weap_coordinates[3]=(-3405, 13, 284 - 60);
		level.weap_coordinates[4]=(-1669, 32, 85 - 60);
		level.weap_coordinates[5]=(-610, 0, 236 - 60); 
		level.weap_coordinates[6]=(-867, 627, 290 - 60);
 		level.weap_coordinates[7]=(-1152, -419, 289 - 60);
		level.weap_coordinates[8]=(187, -388, 189 - 60);
		level.weap_coordinates[9]=(536, 566, 288 - 60);
		level.weap_coordinates[10]=(-385, 26, 76 - 60);
		level.weap_coordinates[11]=(984, -22, 236 - 60);
		level.weap_coordinates[12]=(1207, 544, 289 - 60);
		level.weap_coordinates[13]=(1507, -407, 289 - 60);
		level.weap_coordinates[14]=(1138, 89, 76 - 60);
		level.weap_coordinates[15]=(2069, 453, 182 - 60);
		level.weap_coordinates[16]=(1992, -0, 86 - 60);
		level.weap_coordinates[17]=(2712, -83, 396 - 60);
		level.weap_coordinates[18]=(3406, -9, 396 - 60);
		level.weap_coordinates[19]=(3974, -0, 287 - 60); 
		level.weap_coordinates[20]=(2855, -100, 236 - 60);
		level.weap_coordinates[21]=(2005, -42, 184 - 60);
		level.weap_coordinates[22]=(-2695, -440, 124 - 60);
		level.weap_coordinates[23]=(171, -523, 76 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}
	
	else if (getDvar("mapname") == "mp_shipment")
	{
		level.weap_coordinates=[];
		level.ladders= undefined;
		level.weap_coordinates[0]=(-710, 679, 253 - 60);
		level.weap_coordinates[1]=(-557, -464, 251 - 60);
		level.weap_coordinates[2]=(693, -507, 252 - 60);
		level.weap_coordinates[3]=(630, 720, 252 - 60);
		level.weap_coordinates[4]=(223, 178, 261 - 60);
		level.weap_coordinates[5]=(-3, 518, 359 - 60); 
		level.weap_coordinates[6]=(-707, 71, 359 - 60);
 		level.weap_coordinates[7]=(172, -107, 359 - 60);
		level.weap_coordinates[8]=(16, -517, 358 - 60);
		level.weap_coordinates[9]=(-10, 49, 252 - 60);
		level.weap_coordinates[10]=(358, 289, 252 - 60);
		level.weap_coordinates[11]=(-357, -122, 252 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}
	
	else if (getDvar("mapname") == "mp_bloc")
	{
		level.weap_coordinates=[];
		level.ladders= undefined;
		level.weap_coordinates[0]=(-2052, -4617, 119 - 60);
		level.weap_coordinates[1]=(-2579, -4158, -99 - 60);
		level.weap_coordinates[2]=(-1859, -5526, 95 - 60); 
		level.weap_coordinates[3]=(-339, -5159, 64 - 60);
		level.weap_coordinates[4]=(92, -5632, 37 - 60);
		level.weap_coordinates[5]=(245, -6570, 50 - 60);
		level.weap_coordinates[6]=(2965, -5829, 68 - 60);
		level.weap_coordinates[7]=(380, -5070, 208 - 60);
		level.weap_coordinates[8]=(-68, -4151, 60 - 60);
		level.weap_coordinates[9]=(1265, -4869, 208 - 60);
		level.weap_coordinates[10]=(1153, -5836, 36 - 60);
		level.weap_coordinates[11]=(1953, -6566, 46 - 60);
		level.weap_coordinates[12]=(1631, -5264, 36 - 60);
		level.weap_coordinates[13]=(2537, -5179, 196 - 60);
		level.weap_coordinates[14]=(-69, -6517, 188 - 60);
		level.weap_coordinates[15]=(3020, -5021, 64 - 60);
		level.weap_coordinates[16]=(3029, -7475, 68 - 60);
		level.weap_coordinates[17]=(4214, -6582, 60 - 60);
		level.weap_coordinates[18]=(1453, -6600, 212 - 60);
		level.weap_coordinates[19]=(590, -6798, 204 - 60);
		level.weap_coordinates[20]=(901, -6876, 204 - 60);
		level.weap_coordinates[21]=(711, -6609, 76 - 60);
		level.weap_coordinates[22]=(1620, -4858, -72 - 60);
		level.weap_coordinates[23]=(-396, -6036, 64 - 60);
		level.weap_coordinates[24]=(2097, -6093, 36 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}
	
	else if (getDvar("mapname") == "mp_bog")
	{
		level.weap_coordinates=[];
		level.ladders= undefined;
		level.weap_coordinates[0]=(2759, 174, 155 - 60);
		level.weap_coordinates[1]=(1999, 721, 53 - 60);
		level.weap_coordinates[2]=(2996, 1327, 130 - 60);
		level.weap_coordinates[3]=(3754, -45, 54 - 60); 
		level.weap_coordinates[4]=(3474, 1161, 88 - 60);
		level.weap_coordinates[5]=(2735, 2137, 56 - 60);
		level.weap_coordinates[6]=(1695, 1274, 58 - 60);
		level.weap_coordinates[7]=(4339, 1843, 155 - 60);
		level.weap_coordinates[8]=(4472, 1369, 148 - 60);
		level.weap_coordinates[9]=(4209, 553, 62 - 60);
		level.weap_coordinates[10]=(4114, 450, 54 - 60);
		level.weap_coordinates[11]=(5529, -310, 71 - 60);
		level.weap_coordinates[12]=(5890, 274, 95 - 60);
		level.weap_coordinates[13]=(4893, 2114, 44 - 60);
		level.weap_coordinates[14]=(3845, 1784, 38 - 60);
		level.weap_coordinates[15]=(4381, 67, 78 - 60);
		level.weap_coordinates[16]=(6304, 1358, 104 - 60);
		level.weap_coordinates[17]=(6018, 2377, 107 - 60);
		level.weap_coordinates[18]=(3223, -187, 56 - 60);
		level.weap_coordinates[19]=(2653, -475, 49 - 60);
		level.weap_coordinates[20]=(5317, 671, 72 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}
	
	else if (getDvar("mapname") == "mp_showdown")
	{
		level.weap_coordinates=[];
		level.ladders= undefined;
		level.weap_coordinates[0]=(404, -1980, 76 - 60);
		level.weap_coordinates[1]=(788, -1045, 141 - 60);
		level.weap_coordinates[2]=(-1112, -1408, 205 - 60);
		level.weap_coordinates[3]=(-1072, 54, 156 - 60);
		level.weap_coordinates[4]=(-93, -506, 252 - 60);
		level.weap_coordinates[5]=(-758, 253, 252 - 60);
		level.weap_coordinates[6]=(758, -3, 252 - 60);
		level.weap_coordinates[7]=(666, -402, 96 - 60);
		level.weap_coordinates[8]=(-646, -493, 76 - 60);
		level.weap_coordinates[9]=(-846, 599, 248 - 60);
		level.weap_coordinates[10]=(411, 1436, 224 - 60);
		level.weap_coordinates[11]=(373, 2000, 61 - 60);
		level.weap_coordinates[12]=(-1007, 1359, 64 - 60);
		level.weap_coordinates[13]=(-287, 486, 60 - 60);
		level.weap_coordinates[14]=(588, 286, 60 - 60);
		level.weap_coordinates[15]=(-199, 87, 60 - 60);
		level.weap_coordinates[16]=(1134, -228, 244 - 60);
		level.weap_coordinates[17]=(3, 689, 252 - 60);
		level.weap_coordinates[18]=(736, 252, 76 - 60);
		level.weap_coordinates[19]=(-563, -300, 189 - 60);
		level.weap_coordinates[20]=(-624, 690, 75 - 60);
		level.weap_coordinates[21]=(-481, -770, 205 - 60);
		level.weap_coordinates[22]=(42, -696, 76 - 60);
		level.weap_coordinates[23]=(96, 699, 162 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	
	}
	
	else if (getDvar("mapname") == "mp_convoy")
	{
		level.weap_coordinates=[];
		level.ladders= undefined;
		level.weap_coordinates[0]=(-697, -217, -3 - 60);
		level.weap_coordinates[1]=(-945, -722, 140 - 60);
		level.weap_coordinates[2]=(-1642, 28, -4 - 60);
		level.weap_coordinates[3]=(-2777, -373, 164 - 60);
 		level.weap_coordinates[4]=(-2608, 297, -5 - 60);
 		level.weap_coordinates[5]=(-937, 796, 268 - 60);
		level.weap_coordinates[6]=(-1278, 11, -3 - 60);
		level.weap_coordinates[7]=(660, 982, 0 - 60);
		level.weap_coordinates[8]=(-2137, 836, 114 - 60);
		level.weap_coordinates[9]=(-532, 21, 180 - 60);
		level.weap_coordinates[10]=(-911, 1018, 151 - 60);
		level.weap_coordinates[11]=(-51, 1713, 45 - 60);
		level.weap_coordinates[12]=(-1696, 1814, 74 - 60);
		level.weap_coordinates[13]=(96, 916, -67 - 60);
		level.weap_coordinates[14]=(51, -333, -67 - 60);
		level.weap_coordinates[15]=(11, -1216, 60 - 60);
		level.weap_coordinates[16]=(728, -284, 4 - 60);
		level.weap_coordinates[17]=(468, 1713, 43 - 60);
		level.weap_coordinates[18]=(735, -66, 144 - 60); 
		level.weap_coordinates[19]=(1061, -997, 192 - 60);
 		level.weap_coordinates[20]=(1643, -450, 141 - 60);
		level.weap_coordinates[21]=(1840, 239, 19 - 60);
		level.weap_coordinates[22]=(755, 717, 148 - 60);
		level.weap_coordinates[23]=(1636, 739, 149 - 60);
		level.weap_coordinates[24]=(1244, 1245, 140 - 60);
		level.weap_coordinates[25]=(2436, 1275, -3 - 60);
		level.weap_coordinates[26]=(3190, 1171, 164 - 60);
		level.weap_coordinates[27]=(2428, 576, -11 - 60);
		level.weap_coordinates[28]=(1713, -936, 19 - 60);
		level.weap_coordinates[29]=(2337, 275, 148 - 60);
		level.weap_coordinates[30]=(-638, 775, 140 - 60);
		level.weap_coordinates[31]=(2058, 796, 6 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	
	}
	
	else if (getDvar("mapname") == "mp_broadcast")
	{
		level.weap_coordinates=[];
		level.ladders= true;
		level.weap_coordinates[0]=(77, -826, 8 - 60);
		level.weap_coordinates[1]=(715, -1191, 28 - 60);
		level.weap_coordinates[2]=(824, 1415, 196 - 60);
		level.weap_coordinates[3]=(-416, 1654, 196 - 60);
		level.weap_coordinates[4]=(-457, 1249, 48 - 60);
		level.weap_coordinates[5]=(-819, 986, 10 - 60);
		level.weap_coordinates[6]=(-1734, 1322, 91 - 60);
		level.weap_coordinates[7]=(-1026, 2371, 185 - 60);
		level.weap_coordinates[8]=(-1474, 3342, 38 - 60);
		level.weap_coordinates[9]=(-1289, 3044, 206 - 60);
		level.weap_coordinates[10]=(-226, 2602, 20 - 60);
		level.weap_coordinates[11]=(-1759, 2133, -2 - 60);
		level.weap_coordinates[12]=(-1728, 1847, 140 - 60);
		level.weap_coordinates[13]=(-1442, 245, 131 - 60);
		level.weap_coordinates[14]=(-986, 969, 196 - 60);
		level.weap_coordinates[15]=(-350, 364, 196 - 60);
		level.weap_coordinates[16]=(32, 229, 28 - 60);
		level.weap_coordinates[17]=(-489, -586, 28 - 60);
		level.weap_coordinates[18]=(79, -287, 28 - 60);
		level.weap_coordinates[19]=(591, 1992, 28 - 60);
		level.weap_coordinates[20]=(-796, 1402, 20 - 60);
		level.weap_coordinates[21]=(-116, -961, 244 - 60);
		level.weap_coordinates[22]=(-912, -21, 28 - 60);
		level.weap_coordinates[23]=(-546, -616, 28 - 60);
		level.weap_coordinates[24]=(-90, -931, 63 - 60);
		level.weap_coordinates[25]=(-1735, 1668, 22 - 60);
		level.weap_coordinates[26]=(-1024, 3551, 185 - 60);
 		level.weap_coordinates[27]=(-2337, 3294, -6 - 60);
		level.weap_coordinates[28]=(169, 1056, 28 - 60);
		level.weap_coordinates[29]=(1222, -74, 188 - 60);
		level.weap_coordinates[30]=(-319, 761, 28 - 60);
		level.weap_coordinates[31]=(-1913, 2117, 140 - 60);
		level.weap_coordinates[32]=(1020, 1260, 2 - 60);
		level.weap_coordinates[33]=(-1260, 1475, 271 - 60);
		level.weap_coordinates[34]=(-1610, 2644, 26 - 60);
		level.weap_coordinates[35]=(-628, 3114, 20 - 60); 
		thread maps\mp\gametypes\_spawn_weapons::randomize();	
	}
	
	else if (getDvar("mapname") == "mp_countdown")
	{
		level.weap_coordinates=[];
		level.ladders= true;
		level.weap_coordinates[0]=(1242, -1435, 173 - 60);
		level.weap_coordinates[1]=(719, -1807, 100 - 60);
		level.weap_coordinates[2]=(-791, -1808, 106 - 60);
		level.weap_coordinates[3]=(-545, -990, 5 - 60);
		level.weap_coordinates[4]=(-1727, -299, 100 - 60);
		level.weap_coordinates[5]=(-2374, 253, 44 - 60);
		level.weap_coordinates[6]=(-2357, 553, 40 - 60);
		level.weap_coordinates[7]=(-2254, 1339, 44 - 60);
		level.weap_coordinates[8]=(-1564, -2027, 44 - 60);
		level.weap_coordinates[9]=(-783, 2133, 36 - 60);
		level.weap_coordinates[10]=(-491, 1872, 163 - 60);
		level.weap_coordinates[11]=(-29, 2363, 16 - 60);
		level.weap_coordinates[12]=(2317, 508, 52 - 60);
		level.weap_coordinates[13]=(2210, 128, 53 - 60);
		level.weap_coordinates[14]=(2069, -946, 75 - 60);
		level.weap_coordinates[15]=(466, -1034, 17 - 60);
		level.weap_coordinates[16]=(846, 100, 171 - 60);
		level.weap_coordinates[17]=(-926, 1040, 171 - 60);
		level.weap_coordinates[18]=(-434, 25, 21 - 60);
		level.weap_coordinates[19]=(553, 795, 25 - 60);
		level.weap_coordinates[20]=(-143, 1474, 58 - 60);
		level.weap_coordinates[21]=(53, -390, 58 - 60);
		level.weap_coordinates[22]=(-45, 126, 36 - 60);
		level.weap_coordinates[23]=(1388, 251, 36 - 60);
		level.weap_coordinates[24]=(-1904, -1207, 53 - 60);
		level.weap_coordinates[25]=(1369, -198, 89 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}
	
	else if (getDvar("mapname") == "mp_creek")
	{
		level.weap_coordinates=[];
		level.ladders= true;
		level.weap_coordinates[0]=(-3525, 7993, 256 - 60);
		level.weap_coordinates[1]=(-4613, 7251, 229 - 60);
		level.weap_coordinates[2]=(-3996, 6066, 244 - 60);
		level.weap_coordinates[3]=(-2973, 7228, 232 - 60);
		level.weap_coordinates[4]=(-2869, 6809, 648 - 60);
		level.weap_coordinates[5]=(-2580, 7516, 294 - 60);
		level.weap_coordinates[6]=(-3744, 6148, 244 - 60);
		level.weap_coordinates[7]=(-3692, 5666, 244 - 60);
		level.weap_coordinates[8]=(-3315, 5787, 18 - 60);
		level.weap_coordinates[9]=(-3144, 7411, 471 - 60);
		level.weap_coordinates[10]=(-2184, 7814, 262 - 60);
		level.weap_coordinates[11]=(-3828, 7764, 256 - 60);
 		level.weap_coordinates[12]=(296, 5880, 111 - 60);
		level.weap_coordinates[13]=(-395, 6609, 32 - 60);
		level.weap_coordinates[14]=(-1849, 5943, -55 - 60);
 		level.weap_coordinates[15]=(-2057, 5919, 178 - 60);
		level.weap_coordinates[16]=(-2107, 6276, 115 - 60);
		level.weap_coordinates[17]=(-3356, 5278, -70 - 60);
		level.weap_coordinates[18]=(-1106, 5717, 398 - 60);
		level.weap_coordinates[19]=(-537, 5291, 361 - 60);
		level.weap_coordinates[20]=(451, 4986, 293 - 60);
		level.weap_coordinates[21]=(-582, 5128, 198 - 60);
		level.weap_coordinates[22]=(560, 3808, 90 - 60);
		level.weap_coordinates[23]=(663, 4072, 188 - 60);
		level.weap_coordinates[24]=(483, 4832, 85 - 60);
		level.weap_coordinates[25]=(-4148, 5525, 231 - 60);
		level.weap_coordinates[26]=(1328, 6385, 135 - 60);
		level.weap_coordinates[27]=(678, 6864, 207 - 60);
		level.weap_coordinates[28]=(-1546, 7172, 185 - 60);
		level.weap_coordinates[29]=(-3883, 6160, 224 - 60);
		level.weap_coordinates[30]=(-1868, 5784, 388 - 60);
		level.weap_coordinates[31]=(-96, 6941, -1 - 60);
		level.weap_coordinates[32]=(-1004, 7991, 227 - 60);
		level.weap_coordinates[33]=(-5390, 6018, 227 - 60);
		level.weap_coordinates[34]=(-1440, 6070, 163 - 60);
		level.weap_coordinates[35]=(-471, 4054, 128 - 60);
		level.weap_coordinates[36]=(-993, 5210, 243 - 60);
		level.weap_coordinates[37]=(-186, 6115, 351 - 60); 
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}
	
	else if (getDvar("mapname") == "mp_carentan")
	{
		level.weap_coordinates=[];
		level.ladders= undefined;
		level.weap_coordinates[0]=(-11, 692, 204 - 60);
		level.weap_coordinates[1]=(239, 686, 204 - 60);
		level.weap_coordinates[2]=(267, 523, 40 - 60);
		level.weap_coordinates[3]=(-124, -336, 164 - 60);
		level.weap_coordinates[4]=(533, -480, 143 - 60);
		level.weap_coordinates[5]=(1586, -128, 44 - 60);
		level.weap_coordinates[6]=(1138, 1718, 52 - 60);
		level.weap_coordinates[7]=(1185, 1743, 204 - 60);
		level.weap_coordinates[8]=(1711, 2202, 36 - 60);
		level.weap_coordinates[9]=(700, 3119, 36 - 60);
		level.weap_coordinates[10]=(697, 3004, 36 - 60);
		level.weap_coordinates[11]=(-598, 2647, 36 - 60);
		level.weap_coordinates[12]=(-939, 2129, 52 - 60);
		level.weap_coordinates[13]=(-536, 1326, 60 - 60);
		level.weap_coordinates[14]=(-457, 1002, 60 - 60);
		level.weap_coordinates[15]=(918, 1135, 212 - 60);
		level.weap_coordinates[16]=(460, 1225, 240 - 60);
		level.weap_coordinates[17]=(494, 1431, 60 - 60);
		level.weap_coordinates[18]=(731, 1857, 220 - 60);
		level.weap_coordinates[19]=(1, 1990, 220 - 60);
		level.weap_coordinates[20]=(-320, 1787, 203 - 60);
		level.weap_coordinates[21]=(1241, 685, 220 - 60);
		level.weap_coordinates[22]=(903, 431, 364 - 60);
		level.weap_coordinates[23]=(-720, 1789, 204 - 60);
		level.weap_coordinates[24]=(-907, 1921, 204 - 60);
		level.weap_coordinates[25]=(46, 2213, 36 - 60);
		level.weap_coordinates[26]=(686, 1836, 68 - 60);
		level.weap_coordinates[27]=(422, 2154, -83 - 60);
		level.weap_coordinates[28]=(1365, 2609, 36 - 60);
		level.weap_coordinates[29]=(949, 1635, 187 - 60);
		level.weap_coordinates[30]=(1312, 658, 41 - 60);
		level.weap_coordinates[31]=(898, 1123, 60 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}

	else if (getDvar("mapname") == "mp_overgrown")
	{
		level.weap_coordinates=[];
		level.ladders= true;
		level.weap_coordinates[0]=(-728, -3382, 88 - 60);
		level.weap_coordinates[1]=(-630, -3360, 88 - 60);
		level.weap_coordinates[2]=(-1766, -2982, -102 - 60);
		level.weap_coordinates[3]=(-906, -3017, -99 - 60);
		level.weap_coordinates[4]=(-510, -2174, 60 - 60);
		level.weap_coordinates[5]=(-440, -1745, 60 - 60);
		level.weap_coordinates[6]=(-933, -617, -123 - 60);
		level.weap_coordinates[7]=(-396, 721, -107 - 60);
		level.weap_coordinates[8]=(976, 347, -248 - 60);
		level.weap_coordinates[9]=(1160, -879, -283 - 60);
		level.weap_coordinates[10]=(1034, -2154, -123 - 60);
		level.weap_coordinates[11]=(839, -3056, -129 - 60);
		level.weap_coordinates[12]=(533, -3544, -111 - 60);
		level.weap_coordinates[13]=(1768, -4462, -67 - 60);
 		level.weap_coordinates[14]=(2896, -3627, -59 - 60);
		level.weap_coordinates[15]=(2455, -2776, -94 - 60);
		level.weap_coordinates[16]=(2631, -1063, -96 - 60);
		level.weap_coordinates[17]=(1201, -2041, -123 - 60);
		level.weap_coordinates[18]=(1359, -2321, 52 - 60);
		level.weap_coordinates[19]=(1014, -2899, 28 - 60);
		level.weap_coordinates[20]=(1246, -2241, 111 - 60);
		level.weap_coordinates[21]=(1668, -1524, 88 - 60);
		level.weap_coordinates[22]=(476, -1605, 116 - 60);
		level.weap_coordinates[23]=(208, -3850, 58 - 60);
		level.weap_coordinates[24]=(-730, -5214, 120 - 60);
		level.weap_coordinates[25]=(-1667, -5128, -105 - 60);
		level.weap_coordinates[26]=(-109, -3985, -228 - 60);
		level.weap_coordinates[27]=(172, -2771, -284 - 60);
		level.weap_coordinates[28]=(546, -1460, -100 - 60);
		level.weap_coordinates[29]=(-217, -2107, -141 - 60);
		level.weap_coordinates[30]=(1759, -3231, -130 - 60);
		level.weap_coordinates[31]=(583, -4237, -83 - 60);
		level.weap_coordinates[32]=(1173, -2637, 63 - 60);
		level.weap_coordinates[33]=(-522, -3795, -5 - 60);
		level.weap_coordinates[34]=(141, -5265, -244 - 60);
		level.weap_coordinates[35]=(777, -1552, -265 - 60);
		level.weap_coordinates[36]=(1884, -1579, -147 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}
	
	else if (getDvar("mapname") == "mp_farm")
	{
		level.weap_coordinates=[];
		level.ladders= true;
		level.weap_coordinates[0]=(-914, -1651, 356 - 60);
		level.weap_coordinates[1]=(-1113, -1765, 211 - 60);
		level.weap_coordinates[2]=(-347, -1672, 198 - 60);
		level.weap_coordinates[3]=(-105, -770, 352 - 60);
		level.weap_coordinates[4]=(357, -1064, 195 - 60);
		level.weap_coordinates[5]=(1256, -286, 187 - 60);
		level.weap_coordinates[6]=(693, 312, 254 - 60);
		level.weap_coordinates[7]=(171, 307, 255 - 60);
		level.weap_coordinates[8]=(-681, 1190, 306 - 60);
		level.weap_coordinates[9]=(464, 1514, 276 - 60);
		level.weap_coordinates[10]=(2535, 1629, 274 - 60);
		level.weap_coordinates[11]=(2350, 2093, 277 - 60);
		level.weap_coordinates[12]=(488, 2350, 277 - 60);
		level.weap_coordinates[13]=(-442, 3084, 276 - 60);
		level.weap_coordinates[14]=(-118, 3725, 280 - 60);
		level.weap_coordinates[15]=(807, 2736, 429 - 60);
		level.weap_coordinates[16]=(1616, 2054, 276 - 60);
		level.weap_coordinates[17]=(1754, 913, 276 - 60);
		level.weap_coordinates[18]=(331, 1399, 445 - 60);
		level.weap_coordinates[19]=(1251, 1150, 281 - 60);
		level.weap_coordinates[20]=(334, 1033, 277 - 60);
		level.weap_coordinates[21]=(396, 2583, 277 - 60);
		level.weap_coordinates[22]=(379, -256, 205 - 60);
		level.weap_coordinates[23]=(98, -1666, 196 - 60);
		level.weap_coordinates[24]=(-291, 677, 301 - 60);
		level.weap_coordinates[25]=(-484, 1708, 308 - 60);
		level.weap_coordinates[26]=(1309, 1992, 455 - 60);
		level.weap_coordinates[27]=(-195, 4587, 291 - 60);
		level.weap_coordinates[28]=(1641, 2802, 276 - 60);
		level.weap_coordinates[29]=(1111, 3551, 278 - 60);
		level.weap_coordinates[30]=(448, 3250, 279 - 60);
		level.weap_coordinates[31]=(509, 820, 424 - 60);
		level.weap_coordinates[32]=(444, 139, 250 - 60);
		thread maps\mp\gametypes\_spawn_weapons::randomize();
	}
	else
	{
		thread maps\_custom_weapon_spawns::load_custom_weapons_positions();
	}
}