/* set 1 rainy, some snow 
UPDATE game_weather SET 
spring_rain_chance=45, spring_snow_chance=5, spring_storm_chance=0,
fall_rain_chance=45, fall_snow_chance=10, fall_storm_chance=0,
winter_rain_chance=45, winter_snow_chance=35, winter_storm_chance=0
where `zone` IN ();*/

/* set 2 rainy, never snow */
/* set 3: rare rain, lots snow */
/* set 4: rain or sand */
/*-------------- Eastern Kingdoms ----------------------*/
/*eastern kingdoms*/
REPLACE INTO game_weather SET `zone`=0, 
spring_rain_chance=20, spring_snow_chance=0,  spring_storm_chance=0,
fall_rain_chance=20,   fall_snow_chance=0,   fall_storm_chance=0,
winter_rain_chance=20, winter_snow_chance=0, winter_storm_chance=0;
/*goldshire*/
REPLACE INTO game_weather SET `zone`=87, 
spring_rain_chance=30, spring_snow_chance=0,  spring_storm_chance=0,
fall_rain_chance=30,   fall_snow_chance=0,     fall_storm_chance=0,
winter_rain_chance=30, winter_snow_chance=5, winter_storm_chance=0;
/*stormwind*/
REPLACE INTO game_weather SET `zone`=723, 
spring_rain_chance=25, spring_snow_chance=5,  spring_storm_chance=0,
fall_rain_chance=25,   fall_snow_chance=10,     fall_storm_chance=0,
winter_rain_chance=25, winter_snow_chance=25, winter_storm_chance=0;
/*stormwind city*/
REPLACE INTO game_weather SET `zone`=1519, 
spring_rain_chance=25, spring_snow_chance=5,  spring_storm_chance=0,
fall_rain_chance=25,   fall_snow_chance=10,     fall_storm_chance=0,
winter_rain_chance=25, winter_snow_chance=25, winter_storm_chance=0;
/*westfall*/
REPLACE INTO game_weather SET `zone`=40, 
spring_rain_chance=15, spring_snow_chance=0,  spring_storm_chance=2,
fall_rain_chance=15,   fall_snow_chance=0,    fall_storm_chance=2,
winter_rain_chance=15, winter_snow_chance=2,  winter_storm_chance=2;
/*duskwood*/
REPLACE INTO game_weather SET `zone`=10, 
spring_rain_chance=28, spring_snow_chance=0,  spring_storm_chance=0,
fall_rain_chance=28,   fall_snow_chance=0,    fall_storm_chance=0,
winter_rain_chance=28, winter_snow_chance=0,  winter_storm_chance=0;
/*redridge*/
REPLACE INTO game_weather SET `zone`=44, 
spring_rain_chance=28, spring_snow_chance=0,  spring_storm_chance=0,
fall_rain_chance=28,   fall_snow_chance=0,    fall_storm_chance=0,
winter_rain_chance=28, winter_snow_chance=0,  winter_storm_chance=0;
/*dun morogh*/
REPLACE INTO game_weather SET `zone`=1, 
spring_rain_chance=8, spring_snow_chance=36,   spring_storm_chance=0,
fall_rain_chance=8,   fall_snow_chance=36,     fall_storm_chance=0,
winter_rain_chance=8, winter_snow_chance=36,   winter_storm_chance=0;
/*loch modan*/
REPLACE INTO game_weather SET `zone`=38, 
spring_rain_chance=25, spring_snow_chance=5,   spring_storm_chance=0,
fall_rain_chance=25,   fall_snow_chance=5,     fall_storm_chance=0,
winter_rain_chance=25, winter_snow_chance=5,   winter_storm_chance=0;
/*wetlands*/
REPLACE INTO game_weather SET `zone`=11,
spring_rain_chance=47, spring_snow_chance=0,   spring_storm_chance=0,
fall_rain_chance=47,   fall_snow_chance=0,     fall_storm_chance=0,
winter_rain_chance=47, winter_snow_chance=0,   winter_storm_chance=0;
/*hinterlands*/
REPLACE INTO game_weather SET `zone`=47, 
spring_rain_chance=10, spring_snow_chance=15,  spring_storm_chance=0,
fall_rain_chance=10,   fall_snow_chance=15,    fall_storm_chance=0,
winter_rain_chance=10, winter_snow_chance=15,  winter_storm_chance=0;

/*dead scar*/
REPLACE INTO game_weather SET `zone`=3482, 
spring_rain_chance=15, spring_snow_chance=0,  spring_storm_chance=0,
fall_rain_chance=15,   fall_snow_chance=0,    fall_storm_chance=0,
winter_rain_chance=15, winter_snow_chance=0,  winter_storm_chance=0;


/* eversong woods */
REPLACE INTO game_weather SET `zone`=3430, 
spring_rain_chance=22, spring_snow_chance=2,  spring_storm_chance=0,
fall_rain_chance=22,   fall_snow_chance=2,    fall_storm_chance=0,
winter_rain_chance=22, winter_snow_chance=2,  winter_storm_chance=0;

/*alterac mountains*/
REPLACE INTO game_weather SET `zone`=36, 
spring_rain_chance=9, spring_snow_chance=18,  spring_storm_chance=0,
fall_rain_chance=9,   fall_snow_chance=18,    fall_storm_chance=0,
winter_rain_chance=9, winter_snow_chance=18,  winter_storm_chance=0;
/*arathi highlands*/
REPLACE INTO game_weather SET `zone`=36, 
spring_rain_chance=24, spring_snow_chance=8,  spring_storm_chance=0,
fall_rain_chance=24,   fall_snow_chance=8,    fall_storm_chance=0,
winter_rain_chance=24, winter_snow_chance=8,  winter_storm_chance=0;
/*western plaguelands*/
REPLACE INTO game_weather SET `zone`=28, 
spring_rain_chance=28, spring_snow_chance=2,  spring_storm_chance=0,
fall_rain_chance=28,   fall_snow_chance=2,    fall_storm_chance=0,
winter_rain_chance=28, winter_snow_chance=2,  winter_storm_chance=0;
/*eastern plaguelands*/
REPLACE INTO game_weather SET `zone`=139, 
spring_rain_chance=28, spring_snow_chance=2,  spring_storm_chance=0,
fall_rain_chance=28,   fall_snow_chance=2,    fall_storm_chance=0,
winter_rain_chance=28, winter_snow_chance=2,  winter_storm_chance=0;
/*DK starter zone: scarlet enclave*/
REPLACE INTO game_weather SET `zone`=4298, 
spring_rain_chance=28, spring_snow_chance=2,  spring_storm_chance=0,
fall_rain_chance=28,   fall_snow_chance=2,    fall_storm_chance=0,
winter_rain_chance=28, winter_snow_chance=2,  winter_storm_chance=0;
/*ruins of scarlet enclave*/
REPLACE INTO game_weather SET `zone`=4546, 
spring_rain_chance=86, spring_snow_chance=2,  spring_storm_chance=0,
fall_rain_chance=86,   fall_snow_chance=2,    fall_storm_chance=0,
winter_rain_chance=86, winter_snow_chance=2,  winter_storm_chance=0;




/*badlands*/
REPLACE INTO game_weather SET `zone`=3, 
spring_rain_chance=18, spring_snow_chance=0,   spring_storm_chance=28,
fall_rain_chance=18,   fall_snow_chance=0,     fall_storm_chance=28,
winter_rain_chance=18, winter_snow_chance=0,   winter_storm_chance=28;
/*searing gorge*/
REPLACE INTO game_weather SET `zone`=51, 
spring_rain_chance=45, spring_snow_chance=0,  spring_storm_chance=15,
fall_rain_chance=45,   fall_snow_chance=0,    fall_storm_chance=15,
winter_rain_chance=45, winter_snow_chance=0,  winter_storm_chance=15;
/*burning steppes*/
REPLACE INTO game_weather SET `zone`=46, 
spring_rain_chance=45, spring_snow_chance=0,  spring_storm_chance=15,
fall_rain_chance=45,   fall_snow_chance=0,    fall_storm_chance=15,
winter_rain_chance=45, winter_snow_chance=0,  winter_storm_chance=15;
/*deadwind pass*/
REPLACE INTO game_weather SET `zone`=41, 
spring_rain_chance=15, spring_snow_chance=0,  spring_storm_chance=4,
fall_rain_chance=15,   fall_snow_chance=0,    fall_storm_chance=4,
winter_rain_chance=15, winter_snow_chance=0,  winter_storm_chance=4;
/*badlands*/
REPLACE INTO game_weather SET `zone`=3, 
spring_rain_chance=18, spring_snow_chance=0,   spring_storm_chance=28,
fall_rain_chance=18,   fall_snow_chance=0,     fall_storm_chance=28,
winter_rain_chance=18, winter_snow_chance=0,   winter_storm_chance=28;


/*stranglethorn vale*/
REPLACE INTO game_weather SET `zone`=33, 
spring_rain_chance=26, spring_snow_chance=0,   spring_storm_chance=0,
fall_rain_chance=26,   fall_snow_chance=0,     fall_storm_chance=0,
winter_rain_chance=26, winter_snow_chance=0,   winter_storm_chance=0;
/*blasted lands*/
REPLACE INTO game_weather SET `zone`=4, 
spring_rain_chance=18, spring_snow_chance=0,   spring_storm_chance=8,
fall_rain_chance=18,   fall_snow_chance=0,     fall_storm_chance=8,
winter_rain_chance=18, winter_snow_chance=0,   winter_storm_chance=8;


/*-------------- Kalimdor         ----------------------*/
/*darnassus*/
REPLACE INTO game_weather SET `zone`=1657, 
spring_rain_chance=23, spring_snow_chance=2, spring_storm_chance=0,
fall_rain_chance=23,   fall_snow_chance=2,   fall_storm_chance=0,
winter_rain_chance=23, winter_snow_chance=2, winter_storm_chance=0;

/* durotar */
REPLACE INTO game_weather SET `zone`=14, 
spring_rain_chance=24, spring_snow_chance=2, spring_storm_chance=8,
fall_rain_chance=24,   fall_snow_chance=2,   fall_storm_chance=8,
winter_rain_chance=24, winter_snow_chance=2, winter_storm_chance=8;


/*the barrens*/
REPLACE INTO game_weather SET `zone`=17, 
spring_rain_chance=24, spring_snow_chance=2, spring_storm_chance=8,
fall_rain_chance=24,   fall_snow_chance=2,   fall_storm_chance=8,
winter_rain_chance=24, winter_snow_chance=2, winter_storm_chance=8;

/*south barrens*/
REPLACE INTO game_weather SET `zone`=1156, 
spring_rain_chance=24, spring_snow_chance=2, spring_storm_chance=8,
fall_rain_chance=24,   fall_snow_chance=2,   fall_storm_chance=8,
winter_rain_chance=24, winter_snow_chance=2, winter_storm_chance=8;

/* azuremyst isle */
REPLACE INTO game_weather SET `zone`=3524, 
spring_rain_chance=24, spring_snow_chance=0, spring_storm_chance=0,
fall_rain_chance=24,   fall_snow_chance=0,   fall_storm_chance=0,
winter_rain_chance=24, winter_snow_chance=0, winter_storm_chance=0;
/* the exodar */
REPLACE INTO game_weather SET `zone`=3557, 
spring_rain_chance=24, spring_snow_chance=0, spring_storm_chance=0,
fall_rain_chance=24,   fall_snow_chance=0,   fall_storm_chance=0,
winter_rain_chance=24, winter_snow_chance=0, winter_storm_chance=0;
/* the veiled sea */
REPLACE INTO game_weather SET `zone`=457, 
spring_rain_chance=24, spring_snow_chance=0, spring_storm_chance=0,
fall_rain_chance=24,   fall_snow_chance=0,   fall_storm_chance=0,
winter_rain_chance=24, winter_snow_chance=0, winter_storm_chance=0;
/* bloodmyst isle */
REPLACE INTO game_weather SET `zone`=3525, 
spring_rain_chance=18, spring_snow_chance=0, spring_storm_chance=0,
fall_rain_chance=18,   fall_snow_chance=0,   fall_storm_chance=0,
winter_rain_chance=18, winter_snow_chance=0, winter_storm_chance=0;
/* bloodcurse isle */
REPLACE INTO game_weather SET `zone`=3612, 
spring_rain_chance=18, spring_snow_chance=0, spring_storm_chance=0,
fall_rain_chance=18,   fall_snow_chance=0,   fall_storm_chance=0,
winter_rain_chance=18, winter_snow_chance=0, winter_storm_chance=0;
/* wyrmscar island */
REPLACE INTO game_weather SET `zone`=3598, 
spring_rain_chance=18, spring_snow_chance=0, spring_storm_chance=0,
fall_rain_chance=18,   fall_snow_chance=0,   fall_storm_chance=0,
winter_rain_chance=18, winter_snow_chance=0, winter_storm_chance=0;



/*-------------- Outland          ----------------------*/
/*outland not sure if this overrides or what*/
REPLACE INTO game_weather SET `zone`=530, 
spring_rain_chance=15, spring_snow_chance=3, spring_storm_chance=3,
fall_rain_chance=15,   fall_snow_chance=3,   fall_storm_chance=3,
winter_rain_chance=15, winter_snow_chance=3, winter_storm_chance=3;

/*hellfire peninsula*/
REPLACE INTO game_weather SET `zone`=3483, 
spring_rain_chance=15, spring_snow_chance=3, spring_storm_chance=3,
fall_rain_chance=15,   fall_snow_chance=3,   fall_storm_chance=3,
winter_rain_chance=15, winter_snow_chance=3, winter_storm_chance=3;

/*nagrand*/
REPLACE INTO game_weather SET `zone`=3518, 
spring_rain_chance=35, spring_snow_chance=0, spring_storm_chance=0,
fall_rain_chance=35,   fall_snow_chance=0,   fall_storm_chance=0,
winter_rain_chance=35, winter_snow_chance=0, winter_storm_chance=0;
/*terokkar forest*/
REPLACE INTO game_weather SET `zone`=3519, 
spring_rain_chance=35, spring_snow_chance=0, spring_storm_chance=0,
fall_rain_chance=35,   fall_snow_chance=0,   fall_storm_chance=0,
winter_rain_chance=35, winter_snow_chance=0, winter_storm_chance=0;
/*blade's edge mts*/
REPLACE INTO game_weather SET `zone`=3522, 
spring_rain_chance=5, spring_snow_chance=0, spring_storm_chance=15,
fall_rain_chance=5,   fall_snow_chance=0,   fall_storm_chance=15,
winter_rain_chance=5, winter_snow_chance=0, winter_storm_chance=15;

/*netherstorm*/
REPLACE INTO game_weather SET `zone`=3523, 
spring_rain_chance=12, spring_snow_chance=6, spring_storm_chance=2,
fall_rain_chance=12,   fall_snow_chance=6,   fall_storm_chance=2,
winter_rain_chance=12, winter_snow_chance=6,  winter_storm_chance=2;

/*shadowmoon valley*/
REPLACE INTO game_weather SET `zone`=3520, 
spring_rain_chance=23, spring_snow_chance=0, spring_storm_chance=0,
fall_rain_chance=23,   fall_snow_chance=0,   fall_storm_chance=0,
winter_rain_chance=23, winter_snow_chance=0,  winter_storm_chance=0;




/*-------------- Northrend        ----------------------*/
/*northrend*/
REPLACE INTO game_weather SET `zone`=571, 
spring_rain_chance=3, spring_snow_chance=45, spring_storm_chance=0,
fall_rain_chance=3,   fall_snow_chance=45,   fall_storm_chance=0,
winter_rain_chance=3, winter_snow_chance=45,  winter_storm_chance=0;

/*borean tundra*/
REPLACE INTO game_weather SET `zone`=3537, 
spring_rain_chance=3, spring_snow_chance=38, spring_storm_chance=0,
fall_rain_chance=3,   fall_snow_chance=38,   fall_storm_chance=0,
winter_rain_chance=3, winter_snow_chance=38,  winter_storm_chance=0;

/* dalaran */
REPLACE INTO game_weather SET `zone`=4395, 
spring_rain_chance=14, spring_snow_chance=18, spring_storm_chance=0,
fall_rain_chance=14,   fall_snow_chance=18,   fall_storm_chance=0,
winter_rain_chance=14, winter_snow_chance=18,  winter_storm_chance=0;
REPLACE INTO game_weather SET `zone`=4613, 
spring_rain_chance=14, spring_snow_chance=18, spring_storm_chance=0,
fall_rain_chance=14,   fall_snow_chance=18,   fall_storm_chance=0,
winter_rain_chance=14, winter_snow_chance=18,  winter_storm_chance=0;

/* crystalsong forest */
REPLACE INTO game_weather SET `zone`=2817,
spring_rain_chance=14, spring_snow_chance=18, spring_storm_chance=0,
fall_rain_chance=14,   fall_snow_chance=18,   fall_storm_chance=0,
winter_rain_chance=14, winter_snow_chance=18,  winter_storm_chance=0;

/* dragonblight */
REPLACE INTO game_weather SET `zone`=65,
spring_rain_chance=3, spring_snow_chance=38, spring_storm_chance=0,
fall_rain_chance=3,   fall_snow_chance=38,   fall_storm_chance=0,
winter_rain_chance=3, winter_snow_chance=38,  winter_storm_chance=0;

/* grizzly hills */
REPLACE INTO game_weather SET `zone`=394,
spring_rain_chance=14, spring_snow_chance=14, spring_storm_chance=0,
fall_rain_chance=14,   fall_snow_chance=14,   fall_storm_chance=0,
winter_rain_chance=14, winter_snow_chance=14,  winter_storm_chance=0;

/* howling fjord */
REPLACE INTO game_weather SET `zone`=495,
spring_rain_chance=14, spring_snow_chance=18, spring_storm_chance=0,
fall_rain_chance=14,   fall_snow_chance=18,   fall_storm_chance=0,
winter_rain_chance=14, winter_snow_chance=18,  winter_storm_chance=0;

/* sholazar basin */
REPLACE INTO game_weather SET `zone`=3711,
spring_rain_chance=28, spring_snow_chance=1, spring_storm_chance=0,
fall_rain_chance=28,   fall_snow_chance=1,   fall_storm_chance=0,
winter_rain_chance=28, winter_snow_chance=1,  winter_storm_chance=0;

/* zul'drak */
REPLACE INTO game_weather SET `zone`=66,
spring_rain_chance=14, spring_snow_chance=18, spring_storm_chance=0,
fall_rain_chance=14,   fall_snow_chance=18,   fall_storm_chance=0,
winter_rain_chance=14, winter_snow_chance=18,  winter_storm_chance=0;

/* storm peaks */
REPLACE INTO game_weather SET `zone`=67,
spring_rain_chance=14, spring_snow_chance=18, spring_storm_chance=0,
fall_rain_chance=14,   fall_snow_chance=18,   fall_storm_chance=0,
winter_rain_chance=14, winter_snow_chance=18,  winter_storm_chance=0;

/* icecrown */
REPLACE INTO game_weather SET `zone`=210,
spring_rain_chance=3, spring_snow_chance=38, spring_storm_chance=0,
fall_rain_chance=3,   fall_snow_chance=38,   fall_storm_chance=0,
winter_rain_chance=3, winter_snow_chance=38,  winter_storm_chance=0;
REPLACE INTO game_weather SET `zone`=4522,
spring_rain_chance=3, spring_snow_chance=38, spring_storm_chance=0,
fall_rain_chance=3,   fall_snow_chance=38,   fall_storm_chance=0,
winter_rain_chance=3, winter_snow_chance=38,  winter_storm_chance=0;
REPLACE INTO game_weather SET `zone`=4812,
spring_rain_chance=3, spring_snow_chance=38, spring_storm_chance=0,
fall_rain_chance=3,   fall_snow_chance=38,   fall_storm_chance=0,
winter_rain_chance=3, winter_snow_chance=38,  winter_storm_chance=0;
REPLACE INTO game_weather SET `zone`=4523,
spring_rain_chance=3, spring_snow_chance=38, spring_storm_chance=0,
fall_rain_chance=3,   fall_snow_chance=38,   fall_storm_chance=0,
winter_rain_chance=3, winter_snow_chance=38,  winter_storm_chance=0;


/*-----------------------Cata+--------------------------*/
/*northshire burning*/
REPLACE INTO game_weather SET `zone`=6170, 
spring_rain_chance=30, spring_snow_chance=0,  spring_storm_chance=0,
fall_rain_chance=30,   fall_snow_chance=0,     fall_storm_chance=0,
winter_rain_chance=30, winter_snow_chance=5, winter_storm_chance=0;

/*cape of stranglethorn*/
/* there is also 1577 if this doesn't work*/
REPLACE INTO game_weather SET `zone`=5287, 
spring_rain_chance=33, spring_snow_chance=0,  spring_storm_chance=0,
fall_rain_chance=33,   fall_snow_chance=0,     fall_storm_chance=0,
winter_rain_chance=33, winter_snow_chance=5, winter_storm_chance=0;

/*sunstrider isle*/
REPLACE INTO game_weather SET `zone`=3431, 
spring_rain_chance=21, spring_snow_chance=1, spring_storm_chance=0,
fall_rain_chance=21,   fall_snow_chance=1,   fall_storm_chance=0,
winter_rain_chance=21, winter_snow_chance=1,  winter_storm_chance=0;
/* sunstrider isle start? */
REPLACE INTO game_weather SET `zone`=6455, 
spring_rain_chance=21, spring_snow_chance=1, spring_storm_chance=0,
fall_rain_chance=21,   fall_snow_chance=1,   fall_storm_chance=0,
winter_rain_chance=21, winter_snow_chance=1,  winter_storm_chance=0;

/*mardum dh start zone*/
REPLACE INTO game_weather SET `zone`=7705, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;

/* jade forest */
REPLACE INTO game_weather SET `zone`=5785, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;
REPLACE INTO game_weather SET `zone`=6647, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;
REPLACE INTO game_weather SET `zone`=6209,
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;

/* valley of the four winds */
REPLACE INTO game_weather SET `zone`=5805, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;
REPLACE INTO game_weather SET `zone`=6649, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;

/* townlong steppes ?? */
REPLACE INTO game_weather SET `zone`=5842, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;

/* vale of eternal blossoms */
REPLACE INTO game_weather SET `zone`=5840, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;
REPLACE INTO game_weather SET `zone`=6651, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;
REPLACE INTO game_weather SET `zone`=6733, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;

/* kun-lai summit */
REPLACE INTO game_weather SET `zone`=5841, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;
REPLACE INTO game_weather SET `zone`=6650, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;


/* ashran */
REPLACE INTO game_weather SET `zone`=6941, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;
REPLACE INTO game_weather SET `zone`=7088, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;
REPLACE INTO game_weather SET `zone`=7099, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;

/* tanaan jungle */
REPLACE INTO game_weather SET `zone`=6723, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;

/* gorgrond */
REPLACE INTO game_weather SET `zone`=6721, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;

/* shadowmoon valley au */
REPLACE INTO game_weather SET `zone`=6719, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;

/* nagrand au */
REPLACE INTO game_weather SET `zone`=6755, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;

/* talador */
REPLACE INTO game_weather SET `zone`=6662, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;

/* spires of arak */
REPLACE INTO game_weather SET `zone`=6722, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;

/* frostfire ridge */
REPLACE INTO game_weather SET `zone`=6960, 
spring_rain_chance=17, spring_snow_chance=1, spring_storm_chance=3,
fall_rain_chance=17,   fall_snow_chance=1,   fall_storm_chance=3,
winter_rain_chance=17, winter_snow_chance=1,  winter_storm_chance=3;

/* stormheim 7541 */

