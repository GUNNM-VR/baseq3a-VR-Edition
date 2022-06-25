export SpawnTime
code
proc SpawnTime 32 0
file "..\..\..\..\code\game\g_items.c"
line 41
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:/*
;6:
;7:  Items are any object that a player can touch to gain some effect.
;8:
;9:  Pickup will return the number of seconds until they should respawn.
;10:
;11:  all items should pop when dropped in lava or slime
;12:
;13:  Respawnable items don't actually go away when picked up, they are
;14:  just made invisible and untouchable.  This allows them to ride
;15:  movers and respawn appropriately.
;16:*/
;17:
;18:// initial spawn times after warmup
;19:// in vq3 most of the items appears in one frame but we will delay that a bit
;20:// to reduce peak bandwidth and get some nice transition effects
;21:#define	SPAWN_WEAPONS		333
;22:#define	SPAWN_ARMOR			1200
;23:#define	SPAWN_HEALTH		900
;24:#define	SPAWN_AMMO			600
;25:#define	SPAWN_HOLDABLE		2500
;26:#define	SPAWN_MEGAHEALTH	10000
;27:#define	SPAWN_POWERUP		45000
;28:
;29:// periodic respawn times
;30:// g_weaponRespawn.integer || g_weaponTeamRespawn.integer
;31:#define	RESPAWN_ARMOR		25000
;32:#define	RESPAWN_HEALTH		35000
;33:#define	RESPAWN_AMMO		40000
;34:#define	RESPAWN_HOLDABLE	60000
;35:#define	RESPAWN_MEGAHEALTH	35000 //120000
;36:#define	RESPAWN_POWERUP		120000
;37:
;38://======================================================================
;39:
;40:int SpawnTime( gentity_t *ent, qboolean firstSpawn ) 
;41:{
line 42
;42:	if ( !ent->item )
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $55
line 43
;43:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $54
JUMPV
LABELV $55
line 45
;44:
;45:	switch( ent->item->giType ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $57
ADDRLP4 0
INDIRI4
CNSTI4 6
GTI4 $57
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $93-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $93
address $60
address $68
address $72
address $76
address $85
address $89
code
LABELV $60
line 47
;46:	case IT_WEAPON:
;47:		if ( firstSpawn )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $61
line 48
;48:			return SPAWN_WEAPONS;
CNSTI4 333
RETI4
ADDRGP4 $54
JUMPV
LABELV $61
line 49
;49:		if ( g_gametype.integer == GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $63
line 50
;50:			return g_weaponTeamRespawn.value * 1000;
ADDRGP4 g_weaponTeamRespawn+8
INDIRF4
CNSTF4 1148846080
MULF4
CVFI4 4
RETI4
ADDRGP4 $54
JUMPV
LABELV $63
line 52
;51:		else
;52:			return g_weaponRespawn.value * 1000 ;
ADDRGP4 g_weaponRespawn+8
INDIRF4
CNSTF4 1148846080
MULF4
CVFI4 4
RETI4
ADDRGP4 $54
JUMPV
LABELV $68
line 55
;53:
;54:	case IT_AMMO:
;55:		return firstSpawn ? SPAWN_AMMO : RESPAWN_AMMO;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $70
ADDRLP4 8
CNSTI4 600
ASGNI4
ADDRGP4 $71
JUMPV
LABELV $70
ADDRLP4 8
CNSTI4 40000
ASGNI4
LABELV $71
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $54
JUMPV
LABELV $72
line 58
;56:
;57:	case IT_ARMOR:
;58:		return firstSpawn ? SPAWN_ARMOR : RESPAWN_ARMOR;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $74
ADDRLP4 12
CNSTI4 1200
ASGNI4
ADDRGP4 $75
JUMPV
LABELV $74
ADDRLP4 12
CNSTI4 25000
ASGNI4
LABELV $75
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $54
JUMPV
LABELV $76
line 61
;59:
;60:	case IT_HEALTH:
;61:		if ( ent->item->quantity == 100 ) // mega health respawns slow
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 100
NEI4 $77
line 62
;62:			return firstSpawn ? SPAWN_MEGAHEALTH : RESPAWN_MEGAHEALTH;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $80
ADDRLP4 16
CNSTI4 10000
ASGNI4
ADDRGP4 $81
JUMPV
LABELV $80
ADDRLP4 16
CNSTI4 35000
ASGNI4
LABELV $81
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $54
JUMPV
LABELV $77
line 64
;63:		else
;64:			return firstSpawn ? SPAWN_HEALTH : RESPAWN_HEALTH;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $83
ADDRLP4 20
CNSTI4 900
ASGNI4
ADDRGP4 $84
JUMPV
LABELV $83
ADDRLP4 20
CNSTI4 35000
ASGNI4
LABELV $84
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $54
JUMPV
LABELV $85
line 67
;65:
;66:	case IT_POWERUP:
;67:		return firstSpawn ? SPAWN_POWERUP : RESPAWN_POWERUP;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $87
ADDRLP4 24
CNSTI4 45000
ASGNI4
ADDRGP4 $88
JUMPV
LABELV $87
ADDRLP4 24
CNSTI4 120000
ASGNI4
LABELV $88
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $54
JUMPV
LABELV $89
line 76
;68:
;69:#ifdef MISSIONPACK
;70:	case IT_PERSISTANT_POWERUP:
;71:		return -1;
;72:		break;
;73:#endif
;74:
;75:	case IT_HOLDABLE:
;76:		return firstSpawn ? SPAWN_HOLDABLE : RESPAWN_HOLDABLE;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $91
ADDRLP4 28
CNSTI4 2500
ASGNI4
ADDRGP4 $92
JUMPV
LABELV $91
ADDRLP4 28
CNSTI4 60000
ASGNI4
LABELV $92
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $54
JUMPV
LABELV $57
line 79
;77:
;78:	default: // IT_BAD and others
;79:		return 0;
CNSTI4 0
RETI4
LABELV $54
endproc SpawnTime 32 0
export Pickup_Powerup
proc Pickup_Powerup 116 28
line 84
;80:	}
;81:} 
;82:
;83:
;84:int Pickup_Powerup( gentity_t *ent, gentity_t *other ) {
line 89
;85:	int			quantity;
;86:	int			i;
;87:	gclient_t	*client;
;88:
;89:	if ( !other->client->ps.powerups[ent->item->giTag] ) {
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $96
line 91
;90:		// round timing to seconds to make multiple powerup timers count in sync
;91:		other->client->ps.powerups[ent->item->giTag] = level.time - ( level.time % 1000 );
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 92
;92:	}
LABELV $96
line 94
;93:
;94:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $100
line 95
;95:		quantity = ent->count;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
ASGNI4
line 96
;96:	} else {
ADDRGP4 $101
JUMPV
LABELV $100
line 97
;97:		quantity = ent->item->quantity;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 98
;98:	}
LABELV $101
line 100
;99:
;100:	other->client->ps.powerups[ent->item->giTag] += quantity * 1000;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 1000
MULI4
ADDI4
ASGNI4
line 103
;101:
;102:	// give any nearby players a "denied" anti-reward
;103:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $105
JUMPV
LABELV $102
line 109
;104:		vec3_t		delta;
;105:		float		len;
;106:		vec3_t		forward;
;107:		trace_t		tr;
;108:
;109:		client = &level.clients[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 110
;110:		if ( client == other->client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
NEU4 $107
line 111
;111:			continue;
ADDRGP4 $103
JUMPV
LABELV $107
line 113
;112:		}
;113:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 2
EQI4 $109
line 114
;114:			continue;
ADDRGP4 $103
JUMPV
LABELV $109
line 116
;115:		}
;116:		if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $111
line 117
;117:			continue;
ADDRGP4 $103
JUMPV
LABELV $111
line 122
;118:		}
;119:
;120:		// if same team in team game, no sound
;121:		// cannot use OnSameTeam as it expects to g_entities, not clients
;122:		if ( g_gametype.integer >= GT_TEAM && other->client->sess.sessionTeam == client->sess.sessionTeam  ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $113
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
NEI4 $113
line 123
;123:			continue;
ADDRGP4 $103
JUMPV
LABELV $113
line 127
;124:		}
;125:
;126:		// if too far away, no sound
;127:		VectorSubtract( ent->s.pos.trBase, client->ps.origin, delta );
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 100
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 100
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 128
;128:		len = VectorNormalize( delta );
ADDRLP4 16
ARGP4
ADDRLP4 108
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 108
INDIRF4
ASGNF4
line 129
;129:		if ( len > 192 ) {
ADDRLP4 40
INDIRF4
CNSTF4 1128267776
LEF4 $118
line 130
;130:			continue;
ADDRGP4 $103
JUMPV
LABELV $118
line 134
;131:		}
;132:
;133:		// if not facing, no sound
;134:		AngleVectors( client->ps.viewangles, forward, NULL, NULL );
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 28
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 135
;135:		if ( DotProduct( delta, forward ) < 0.4 ) {
ADDRLP4 16
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
MULF4
ADDF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
MULF4
ADDF4
CNSTF4 1053609165
GEF4 $120
line 136
;136:			continue;
ADDRGP4 $103
JUMPV
LABELV $120
line 140
;137:		}
;138:
;139:		// if not line of sight, no sound
;140:		trap_Trace( &tr, client->ps.origin, NULL, NULL, ent->s.pos.trBase, ENTITYNUM_NONE, CONTENTS_SOLID );
ADDRLP4 44
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 141
;141:		if ( tr.fraction != 1.0 ) {
ADDRLP4 44+8
INDIRF4
CNSTF4 1065353216
EQF4 $126
line 142
;142:			continue;
ADDRGP4 $103
JUMPV
LABELV $126
line 146
;143:		}
;144:
;145:		// anti-reward
;146:		client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_DENIEDREWARD;
ADDRLP4 112
ADDRLP4 0
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 147
;147:	}
LABELV $103
line 103
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $105
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $102
line 149
;148:
;149:	return SpawnTime( ent, qfalse ); // return RESPAWN_POWERUP;
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
LABELV $95
endproc Pickup_Powerup 116 28
export Pickup_Holdable
proc Pickup_Holdable 4 8
line 230
;150:}
;151:
;152:
;153://======================================================================
;154:
;155:#ifdef MISSIONPACK
;156:int Pickup_PersistantPowerup( gentity_t *ent, gentity_t *other ) {
;157:	int		clientNum;
;158:	char	userinfo[MAX_INFO_STRING];
;159:	float	handicap;
;160:	int		max;
;161:
;162:	other->client->ps.stats[STAT_PERSISTANT_POWERUP] = ent->item - bg_itemlist;
;163:	other->client->persistantPowerup = ent;
;164:
;165:	switch( ent->item->giTag ) {
;166:	case PW_GUARD:
;167:		clientNum = other->client->ps.clientNum;
;168:		trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
;169:		handicap = atof( Info_ValueForKey( userinfo, "handicap" ) );
;170:		if( handicap<=0.0f || handicap>100.0f) {
;171:			handicap = 100.0f;
;172:		}
;173:		max = (int)(2 *  handicap);
;174:
;175:		other->health = max;
;176:		other->client->ps.stats[STAT_HEALTH] = max;
;177:		other->client->ps.stats[STAT_MAX_HEALTH] = max;
;178:		other->client->ps.stats[STAT_ARMOR] = max;
;179:		other->client->pers.maxHealth = max;
;180:
;181:		break;
;182:
;183:	case PW_SCOUT:
;184:		clientNum = other->client->ps.clientNum;
;185:		trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
;186:		handicap = atof( Info_ValueForKey( userinfo, "handicap" ) );
;187:		if( handicap<=0.0f || handicap>100.0f) {
;188:			handicap = 100.0f;
;189:		}
;190:		other->client->pers.maxHealth = handicap;
;191:		other->client->ps.stats[STAT_ARMOR] = 0;
;192:		break;
;193:
;194:	case PW_DOUBLER:
;195:		clientNum = other->client->ps.clientNum;
;196:		trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
;197:		handicap = atof( Info_ValueForKey( userinfo, "handicap" ) );
;198:		if( handicap<=0.0f || handicap>100.0f) {
;199:			handicap = 100.0f;
;200:		}
;201:		other->client->pers.maxHealth = handicap;
;202:		break;
;203:	case PW_AMMOREGEN:
;204:		clientNum = other->client->ps.clientNum;
;205:		trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
;206:		handicap = atof( Info_ValueForKey( userinfo, "handicap" ) );
;207:		if( handicap<=0.0f || handicap>100.0f) {
;208:			handicap = 100.0f;
;209:		}
;210:		other->client->pers.maxHealth = handicap;
;211:		memset(other->client->ammoTimes, 0, sizeof(other->client->ammoTimes));
;212:		break;
;213:	default:
;214:		clientNum = other->client->ps.clientNum;
;215:		trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
;216:		handicap = atof( Info_ValueForKey( userinfo, "handicap" ) );
;217:		if( handicap<=0.0f || handicap>100.0f) {
;218:			handicap = 100.0f;
;219:		}
;220:		other->client->pers.maxHealth = handicap;
;221:		break;
;222:	}
;223:
;224:	return SpawnTime( ent, qfalse ); // return -1;
;225:}
;226:
;227://======================================================================
;228:#endif
;229:
;230:int Pickup_Holdable( gentity_t *ent, gentity_t *other ) {
line 232
;231:
;232:	other->client->ps.stats[STAT_HOLDABLE_ITEM] = ent->item - bg_itemlist;
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 240
;233:
;234:#ifdef MISSIONPACK	
;235:	if( ent->item->giTag == HI_KAMIKAZE ) {
;236:		other->client->ps.eFlags |= EF_KAMIKAZE;
;237:	}
;238:#endif
;239:
;240:	return SpawnTime( ent, qfalse ); // return RESPAWN_HOLDABLE;
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $129
endproc Pickup_Holdable 4 8
proc Add_Ammo 4 0
line 248
;241:}
;242:
;243:
;244://======================================================================
;245:
;246:
;247:static void Add_Ammo( gentity_t *ent, int weapon, int count )
;248:{
line 249
;249:	ent->client->ps.ammo[weapon] += count;
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
line 250
;250:	if ( ent->client->ps.ammo[weapon] > AMMO_HARD_LIMIT ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 200
LEI4 $131
line 251
;251:		ent->client->ps.ammo[weapon] = AMMO_HARD_LIMIT;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
CNSTI4 200
ASGNI4
line 252
;252:	}
LABELV $131
line 253
;253:}
LABELV $130
endproc Add_Ammo 4 0
proc Pickup_Ammo 8 12
line 257
;254:
;255:
;256:static int Pickup_Ammo( gentity_t *ent, gentity_t *other )
;257:{
line 260
;258:	int		quantity;
;259:
;260:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $134
line 261
;261:		quantity = ent->count;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
ASGNI4
line 262
;262:	} else {
ADDRGP4 $135
JUMPV
LABELV $134
line 263
;263:		quantity = ent->item->quantity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 264
;264:	}
LABELV $135
line 266
;265:
;266:	Add_Ammo( other, ent->item->giTag, quantity );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Add_Ammo
CALLV
pop
line 268
;267:
;268:	return SpawnTime( ent, qfalse ); // return RESPAWN_AMMO;
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $133
endproc Pickup_Ammo 8 12
proc Pickup_Weapon 12 12
line 274
;269:}
;270:
;271://======================================================================
;272:
;273:
;274:static int Pickup_Weapon( gentity_t *ent, gentity_t *other ) {
line 277
;275:	int		quantity;
;276:
;277:	if ( ent->count < 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
CNSTI4 0
GEI4 $137
line 278
;278:		quantity = 0; // None for you, sir!
ADDRLP4 0
CNSTI4 0
ASGNI4
line 279
;279:	} else {
ADDRGP4 $138
JUMPV
LABELV $137
line 280
;280:		if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $139
line 281
;281:			quantity = ent->count;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
ASGNI4
line 282
;282:		} else {
ADDRGP4 $140
JUMPV
LABELV $139
line 283
;283:			quantity = ent->item->quantity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 284
;284:		}
LABELV $140
line 287
;285:
;286:		// dropped items and teamplay weapons always have full ammo
;287:		if ( ! (ent->flags & FL_DROPPED_ITEM) && g_gametype.integer != GT_TEAM ) {
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $141
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $141
line 290
;288:			// respawning rules
;289:			// drop the quantity if the already have over the minimum
;290:			if ( other->client->ps.ammo[ ent->item->giTag ] < quantity ) {
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $144
line 291
;291:				quantity = quantity - other->client->ps.ammo[ ent->item->giTag ];
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 292
;292:			} else {
ADDRGP4 $145
JUMPV
LABELV $144
line 293
;293:				quantity = 1;		// only add a single shot
ADDRLP4 0
CNSTI4 1
ASGNI4
line 294
;294:			}
LABELV $145
line 295
;295:		}
LABELV $141
line 296
;296:	}
LABELV $138
line 299
;297:
;298:	// add the weapon
;299:	other->client->ps.stats[STAT_WEAPONS] |= ( 1 << ent->item->giTag );
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BORI4
ASGNI4
line 301
;300:
;301:	Add_Ammo( other, ent->item->giTag, quantity );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Add_Ammo
CALLV
pop
line 304
;302:
;303:#ifdef USE_GRAPPLING_HOOK
;304:	if (ent->item->giTag == WP_GRAPPLING_HOOK)
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 10
NEI4 $146
line 305
;305:		other->client->ps.ammo[ent->item->giTag] = -1; // unlimited ammo
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
CNSTI4 -1
ASGNI4
LABELV $146
line 314
;306:#endif
;307:
;308:	// team deathmatch has slow weapon respawns
;309:	//if ( g_gametype.integer == GT_TEAM ) {
;310:	//	return g_weaponTeamRespawn.integer;
;311:	//} else {
;312:	//	return g_weaponRespawn.integer;
;313:	//}
;314:	return SpawnTime( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $136
endproc Pickup_Weapon 12 12
proc Pickup_Health 24 8
line 320
;315:}
;316:
;317:
;318://======================================================================
;319:
;320:static int Pickup_Health( gentity_t *ent, gentity_t *other ) {
line 331
;321:	int			max;
;322:	int			quantity;
;323:
;324:	// small and mega healths will go over the max
;325:#ifdef MISSIONPACK
;326:	if( other->client && bg_itemlist[other->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;327:		max = other->client->ps.stats[STAT_MAX_HEALTH];
;328:	}
;329:	else
;330:#endif
;331:	if ( ent->item->quantity != 5 && ent->item->quantity != 100 ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 5
EQI4 $149
ADDRLP4 8
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 100
EQI4 $149
line 332
;332:		max = other->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 333
;333:	} else {
ADDRGP4 $150
JUMPV
LABELV $149
line 334
;334:		max = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 335
;335:	}
LABELV $150
line 337
;336:
;337:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $151
line 338
;338:		quantity = ent->count;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
ASGNI4
line 339
;339:	} else {
ADDRGP4 $152
JUMPV
LABELV $151
line 340
;340:		quantity = ent->item->quantity;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 341
;341:	}
LABELV $152
line 343
;342:
;343:	other->health += quantity;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 1228
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 345
;344:
;345:	if (other->health > max ) {
ADDRFP4 4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $153
line 346
;346:		other->health = max;
ADDRFP4 4
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 347
;347:	}
LABELV $153
line 348
;348:	other->client->ps.stats[STAT_HEALTH] = other->health;
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 355
;349:
;350:	//if ( ent->item->quantity == 100 ) { // mega health respawns slow
;351:	//	return RESPAWN_MEGAHEALTH;
;352:	//} else {
;353:	//	return RESPAWN_HEALTH;
;354:	//}
;355:	return SpawnTime( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
LABELV $148
endproc Pickup_Health 24 8
export Pickup_Armor
proc Pickup_Armor 12 8
line 361
;356:}
;357:
;358:
;359://======================================================================
;360:
;361:int Pickup_Armor( gentity_t *ent, gentity_t *other ) {
line 378
;362:#ifdef MISSIONPACK
;363:	int		upperBound;
;364:
;365:	other->client->ps.stats[STAT_ARMOR] += ent->item->quantity;
;366:
;367:	if( other->client && bg_itemlist[other->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;368:		upperBound = other->client->ps.stats[STAT_MAX_HEALTH];
;369:	}
;370:	else {
;371:		upperBound = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
;372:	}
;373:
;374:	if ( other->client->ps.stats[STAT_ARMOR] > upperBound ) {
;375:		other->client->ps.stats[STAT_ARMOR] = upperBound;
;376:	}
;377:#else
;378:	other->client->ps.stats[STAT_ARMOR] += ent->item->quantity;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDI4
ASGNI4
line 379
;379:	if ( other->client->ps.stats[STAT_ARMOR] > other->client->ps.stats[STAT_MAX_HEALTH] * 2 ) {
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LEI4 $156
line 380
;380:		other->client->ps.stats[STAT_ARMOR] = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 381
;381:	}
LABELV $156
line 384
;382:#endif
;383:
;384:	return SpawnTime( ent, qfalse ); // return RESPAWN_ARMOR;
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $155
endproc Pickup_Armor 12 8
export RespawnItem
proc RespawnItem 24 12
line 394
;385:}
;386:
;387://======================================================================
;388:
;389:/*
;390:===============
;391:RespawnItem
;392:===============
;393:*/
;394:void RespawnItem( gentity_t *ent ) {
line 396
;395:
;396:	if ( !ent ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $159
line 397
;397:		return;
ADDRGP4 $158
JUMPV
LABELV $159
line 401
;398:	}
;399:
;400:	// randomly select from teamed entities
;401:	if ( ent->team ) {
ADDRFP4 0
INDIRP4
CNSTI4 1152
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $161
line 406
;402:		gentity_t *master;
;403:		int	count;
;404:		int choice;
;405:
;406:		if ( !ent->teammaster ) {
ADDRFP4 0
INDIRP4
CNSTI4 1276
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $163
line 407
;407:			G_Error( "RespawnItem: bad teammaster" );
ADDRGP4 $165
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 408
;408:		}
LABELV $163
line 410
;409:
;410:		master = ent->teammaster;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1276
ADDP4
INDIRP4
ASGNP4
line 412
;411:
;412:		for ( count = 0, ent = master; ent; ent = ent->teamchain, count++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $169
JUMPV
LABELV $166
line 414
;413:			// reset spawn timers on all teamed entities
;414:			ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1184
ADDP4
CNSTI4 0
ASGNI4
line 415
;415:		}
LABELV $167
line 412
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1272
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $169
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $166
line 417
;416:
;417:		choice = rand() % count;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
MODI4
ASGNI4
line 419
;418:
;419:		for ( count = 0, ent = master; ent && count < choice; ent = ent->teamchain, count++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $173
JUMPV
LABELV $170
line 420
;420:			;
LABELV $171
line 419
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1272
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $173
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $174
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $170
LABELV $174
line 421
;421:	}
LABELV $161
line 423
;422:
;423:	if ( !ent ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $175
line 424
;424:		return;
ADDRGP4 $158
JUMPV
LABELV $175
line 427
;425:	}
;426:
;427:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 1073741824
ASGNI4
line 428
;428:	ent->s.eFlags &= ~EF_NODRAW;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 430
;429:#ifdef USE_ITEM_TIMERS
;430:	ent->s.eFlags &= ~EF_TIMER;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 432
;431:#endif
;432:	ent->r.svFlags &= ~SVF_NOCLIENT;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 433
;433:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 435
;434:
;435:	if ( ent->item->giType == IT_POWERUP ) {
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $177
line 440
;436:		// play powerup spawn sound to all clients
;437:		gentity_t	*te;
;438:
;439:		// if the powerup respawn sound should Not be global
;440:		if ( ent->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
INDIRF4
CNSTF4 0
EQF4 $179
line 441
;441:			te = G_TempEntity( ent->s.pos.trBase, EV_GENERAL_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 46
ARGI4
ADDRLP4 16
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 442
;442:		} else {
ADDRGP4 $180
JUMPV
LABELV $179
line 443
;443:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 16
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 444
;444:		}
LABELV $180
line 445
;445:		te->s.eventParm = G_SoundIndex( "sound/items/poweruprespawn.wav" );
ADDRGP4 $181
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 446
;446:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 920
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 447
;447:	}
LABELV $177
line 467
;448:
;449:#ifdef MISSIONPACK
;450:	if ( ent->item->giType == IT_HOLDABLE && ent->item->giTag == HI_KAMIKAZE ) {
;451:		// play powerup spawn sound to all clients
;452:		gentity_t	*te;
;453:
;454:		// if the powerup respawn sound should Not be global
;455:		if (ent->speed) {
;456:			te = G_TempEntity( ent->s.pos.trBase, EV_GENERAL_SOUND );
;457:		}
;458:		else {
;459:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_SOUND );
;460:		}
;461:		te->s.eventParm = G_SoundIndex( "sound/items/kamikazerespawn.wav" );
;462:		te->r.svFlags |= SVF_BROADCAST;
;463:	}
;464:#endif
;465:
;466:	// play the normal respawn sound only to nearby clients
;467:	G_AddEvent( ent, EV_ITEM_RESPAWN, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 41
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 469
;468:
;469:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1184
ADDP4
CNSTI4 0
ASGNI4
line 470
;470:}
LABELV $158
endproc RespawnItem 24 12
export Touch_Item
proc Touch_Item 52 12
line 478
;471:
;472:
;473:/*
;474:===============
;475:Touch_Item
;476:===============
;477:*/
;478:void Touch_Item (gentity_t *ent, gentity_t *other, trace_t *trace) {
line 482
;479:	int			respawn;
;480:	qboolean	predict;
;481:
;482:	if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $183
line 483
;483:		return;
ADDRGP4 $182
JUMPV
LABELV $183
line 484
;484:	if (other->health < 1)
ADDRFP4 4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 1
GEI4 $185
line 485
;485:		return;		// dead people can't pickup
ADDRGP4 $182
JUMPV
LABELV $185
line 488
;486:
;487:	// the same pickup rules are used for client side and server side
;488:	if ( !BG_CanItemBeGrabbed( g_gametype.integer, &ent->s, &other->client->ps ) ) {
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BG_CanItemBeGrabbed
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $187
line 489
;489:		return;
ADDRGP4 $182
JUMPV
LABELV $187
line 492
;490:	}
;491:
;492:	G_LogPrintf( "Item: %i %s\n", other->s.number, ent->item->classname );
ADDRGP4 $190
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 494
;493:
;494:	predict = other->client->pers.predictItemPickup;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 672
ADDP4
INDIRI4
ASGNI4
line 497
;495:
;496:	// call the item-specific pickup function
;497:	switch( ent->item->giType ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LTI4 $182
ADDRLP4 12
INDIRI4
CNSTI4 8
GTI4 $182
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $203-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $203
address $194
address $195
address $196
address $197
address $198
address $202
address $182
address $201
code
LABELV $194
line 499
;498:	case IT_WEAPON:
;499:		respawn = Pickup_Weapon(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Pickup_Weapon
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 500
;500:		break;
ADDRGP4 $192
JUMPV
LABELV $195
line 502
;501:	case IT_AMMO:
;502:		respawn = Pickup_Ammo(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Pickup_Ammo
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 503
;503:		break;
ADDRGP4 $192
JUMPV
LABELV $196
line 505
;504:	case IT_ARMOR:
;505:		respawn = Pickup_Armor(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Pickup_Armor
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
ASGNI4
line 506
;506:		break;
ADDRGP4 $192
JUMPV
LABELV $197
line 508
;507:	case IT_HEALTH:
;508:		respawn = Pickup_Health(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 Pickup_Health
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 32
INDIRI4
ASGNI4
line 509
;509:		break;
ADDRGP4 $192
JUMPV
LABELV $198
line 511
;510:	case IT_POWERUP:
;511:		respawn = Pickup_Powerup(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 Pickup_Powerup
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 36
INDIRI4
ASGNI4
line 513
;512:		// allow prediction for some powerups
;513:		if ( ent->item->giTag >= PW_QUAD && ent->item->giTag <= PW_FLIGHT )
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 1
LTI4 $199
ADDRLP4 40
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 6
GTI4 $199
line 514
;514:			predict = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $192
JUMPV
LABELV $199
line 516
;515:		else
;516:			predict = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 517
;517:		break;
ADDRGP4 $192
JUMPV
LABELV $201
line 524
;518:#ifdef MISSIONPACK
;519:	case IT_PERSISTANT_POWERUP:
;520:		respawn = Pickup_PersistantPowerup(ent, other);
;521:		break;
;522:#endif
;523:	case IT_TEAM:
;524:		respawn = Pickup_Team(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 Pickup_Team
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 44
INDIRI4
ASGNI4
line 525
;525:		break;
ADDRGP4 $192
JUMPV
LABELV $202
line 527
;526:	case IT_HOLDABLE:
;527:		respawn = Pickup_Holdable(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 Pickup_Holdable
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 48
INDIRI4
ASGNI4
line 528
;528:		break;
line 530
;529:	default:
;530:		return;
LABELV $192
line 533
;531:	}
;532:
;533:	if ( !respawn ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $205
line 534
;534:		return;
ADDRGP4 $182
JUMPV
LABELV $205
line 538
;535:	}
;536:
;537:	// play the normal pickup sound
;538:	if ( predict ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $207
line 539
;539:		G_AddPredictableEvent( other, EV_ITEM_PICKUP, ent->s.modelindex );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 19
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddPredictableEvent
CALLV
pop
line 540
;540:	} else {
ADDRGP4 $208
JUMPV
LABELV $207
line 541
;541:		G_AddEvent( other, EV_ITEM_PICKUP, ent->s.modelindex );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 19
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 542
;542:	}
LABELV $208
line 545
;543:
;544:	// powerup pickups are global broadcasts
;545:	if ( ent->item->giType == IT_POWERUP || ent->item->giType == IT_TEAM) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
EQI4 $211
ADDRLP4 20
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $209
LABELV $211
line 547
;546:		// if we want the global sound to play
;547:		if (!ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
INDIRF4
CNSTF4 0
NEF4 $212
line 550
;548:			gentity_t	*te;
;549:
;550:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_ITEM_PICKUP );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 20
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 28
INDIRP4
ASGNP4
line 551
;551:			te->s.eventParm = ent->s.modelindex;
ADDRLP4 24
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 552
;552:			te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 920
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 553
;553:		} else {
ADDRGP4 $213
JUMPV
LABELV $212
line 556
;554:			gentity_t	*te;
;555:
;556:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_ITEM_PICKUP );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 20
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 28
INDIRP4
ASGNP4
line 557
;557:			te->s.eventParm = ent->s.modelindex;
ADDRLP4 24
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 559
;558:			// only send this temp entity to a single client
;559:			te->r.svFlags |= SVF_SINGLECLIENT;
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 920
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 560
;560:			te->r.singleClient = other->s.number;
ADDRLP4 24
INDIRP4
CNSTI4 924
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 561
;561:		}
LABELV $213
line 562
;562:	}
LABELV $209
line 565
;563:
;564:	// fire item targets
;565:	G_UseTargets (ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 568
;566:
;567:	// wait of -1 will not respawn
;568:	if ( ent->wait == -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1292
ADDP4
INDIRF4
CNSTF4 3212836864
NEF4 $214
line 569
;569:		ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 570
;570:		ent->s.eFlags |= EF_NODRAW;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 571
;571:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 0
ASGNI4
line 572
;572:		ent->unlinkAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1056
ADDP4
CNSTI4 1
ASGNI4
line 573
;573:		return;
ADDRGP4 $182
JUMPV
LABELV $214
line 577
;574:	}
;575:
;576:	// non zero wait overrides respawn time
;577:	if ( ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 1292
ADDP4
INDIRF4
CNSTF4 0
EQF4 $216
line 578
;578:		respawn = ent->wait;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1292
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 579
;579:		respawn *= 1000;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1000
MULI4
ASGNI4
line 580
;580:	}
LABELV $216
line 583
;581:
;582:	// random can be used to vary the respawn time
;583:	if ( ent->random ) {
ADDRFP4 0
INDIRP4
CNSTI4 1296
ADDP4
INDIRF4
CNSTF4 0
EQF4 $218
line 584
;584:		respawn += (crandom() * ent->random) * 1000;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1073741824
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 1296
ADDP4
INDIRF4
MULF4
CNSTF4 1148846080
MULF4
ADDF4
CVFI4 4
ASGNI4
line 585
;585:		if ( respawn < 1000 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1000
GEI4 $220
line 586
;586:			respawn = 1000;
ADDRLP4 0
CNSTI4 1000
ASGNI4
line 587
;587:		}
LABELV $220
line 588
;588:	}
LABELV $218
line 591
;589:
;590:	// dropped items will not respawn
;591:	if ( ent->flags & FL_DROPPED_ITEM ) {
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $222
line 592
;592:		ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1052
ADDP4
CNSTI4 1
ASGNI4
line 593
;593:	}
LABELV $222
line 598
;594:
;595:	// picked up items still stay around, they just don't
;596:	// draw anything.  This allows respawnable items
;597:	// to be placed on movers.
;598:	ent->s.eFlags |= EF_NODRAW;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 599
;599:	ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 0
ASGNI4
line 605
;600:
;601:	// ZOID
;602:	// A negative respawn times means to never respawn this item (but don't 
;603:	// delete it).  This is used by items that are respawned by third party 
;604:	// events such as ctf flags
;605:	if ( respawn <= 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $224
line 606
;606:		ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1184
ADDP4
CNSTI4 0
ASGNI4
line 607
;607:		ent->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1188
ADDP4
CNSTP4 0
ASGNP4
line 609
;608:#ifdef USE_ITEM_TIMERS
;609:		ent->s.eFlags &= ~EF_TIMER;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 611
;610:#endif
;611:	} else {
ADDRGP4 $225
JUMPV
LABELV $224
line 612
;612:		ent->nextthink = level.time + respawn;
ADDRFP4 0
INDIRP4
CNSTI4 1184
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 613
;613:		ent->think = RespawnItem;
ADDRFP4 0
INDIRP4
CNSTI4 1188
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 615
;614:#ifdef USE_ITEM_TIMERS
;615:		if (g_itemTimer.integer && (
ADDRGP4 g_itemTimer+12
INDIRI4
CNSTI4 0
EQI4 $227
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 3
NEI4 $231
ADDRLP4 28
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 5
GTI4 $233
LABELV $231
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
EQI4 $233
ADDRLP4 32
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
EQI4 $233
ADDRLP4 32
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 7
NEI4 $227
LABELV $233
line 620
;616:			(ent->item->giType == IT_ARMOR && ent->item->quantity > 5) ||
;617:			(ent->item->giType == IT_POWERUP) ||
;618:			(ent->item->giType == IT_HOLDABLE) ||
;619:			(ent->item->giType == IT_PERSISTANT_POWERUP)
;620:			) ) {
line 621
;621:			ent->s.eFlags |= EF_TIMER;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 622
;622:			ent->s.time = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 623
;623:			ent->s.frame = respawn / 1000; // save bandwidth
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 624
;624:			ent->r.svFlags |= SVF_BROADCAST;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 625
;625:		}
ADDRGP4 $228
JUMPV
LABELV $227
line 628
;626:		else
;627:#endif
;628:		ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
LABELV $228
line 630
;629:
;630:	}
LABELV $225
line 632
;631:
;632:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 633
;633:}
LABELV $182
endproc Touch_Item 52 12
export LaunchItem
proc LaunchItem 12 8
line 645
;634:
;635:
;636://======================================================================
;637:
;638:/*
;639:================
;640:LaunchItem
;641:
;642:Spawns an item and tosses it forward
;643:================
;644:*/
;645:gentity_t *LaunchItem( gitem_t *item, vec3_t origin, vec3_t velocity ) {
line 648
;646:	gentity_t	*dropped;
;647:
;648:	dropped = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 650
;649:
;650:	dropped->s.eType = ET_ITEM;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 651
;651:	dropped->s.modelindex = item - bg_itemlist;	// store item number in modelindex
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 652
;652:	dropped->s.modelindex2 = 1; // This is non-zero is it's a dropped item
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 1
ASGNI4
line 655
;653:
;654:	// item scale-down
;655:	dropped->s.time = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 657
;656:
;657:	dropped->classname = item->classname;
ADDRLP4 0
INDIRP4
CNSTI4 1020
ADDP4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 658
;658:	dropped->item = item;
ADDRLP4 0
INDIRP4
CNSTI4 1300
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 659
;659:	VectorSet (dropped->r.mins, -ITEM_RADIUS, -ITEM_RADIUS, -ITEM_RADIUS);
ADDRLP4 0
INDIRP4
CNSTI4 932
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 936
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 940
ADDP4
CNSTF4 3245342720
ASGNF4
line 660
;660:	VectorSet (dropped->r.maxs, ITEM_RADIUS, ITEM_RADIUS, ITEM_RADIUS);
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 948
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 952
ADDP4
CNSTF4 1097859072
ASGNF4
line 661
;661:	dropped->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 1073741824
ASGNI4
line 663
;662:
;663:	dropped->touch = Touch_Item;
ADDRLP4 0
INDIRP4
CNSTI4 1200
ADDP4
ADDRGP4 Touch_Item
ASGNP4
line 665
;664:
;665:	G_SetOrigin( dropped, origin );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 666
;666:	dropped->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 667
;667:	dropped->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 668
;668:	VectorCopy( velocity, dropped->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 670
;669:
;670:	dropped->s.eFlags |= EF_BOUNCE_HALF;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 674
;671:#ifdef MISSIONPACK
;672:	if ((g_gametype.integer == GT_CTF || g_gametype.integer == GT_1FCTF)			&& item->giType == IT_TEAM) { // Special case for CTF flags
;673:#else
;674:	if (g_gametype.integer == GT_CTF && item->giType == IT_TEAM) { // Special case for CTF flags
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $238
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $238
line 676
;675:#endif
;676:		dropped->think = Team_DroppedFlagThink;
ADDRLP4 0
INDIRP4
CNSTI4 1188
ADDP4
ADDRGP4 Team_DroppedFlagThink
ASGNP4
line 677
;677:		dropped->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 1184
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 678
;678:		Team_CheckDroppedItem( dropped );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Team_CheckDroppedItem
CALLV
pop
line 679
;679:	} else { // auto-remove after 30 seconds
ADDRGP4 $239
JUMPV
LABELV $238
line 680
;680:		dropped->think = G_FreeEntity;
ADDRLP4 0
INDIRP4
CNSTI4 1188
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 681
;681:		dropped->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 1184
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 682
;682:	}
LABELV $239
line 684
;683:
;684:	dropped->flags = FL_DROPPED_ITEM;
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
CNSTI4 4096
ASGNI4
line 686
;685:
;686:	trap_LinkEntity (dropped);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 688
;687:
;688:	return dropped;
ADDRLP4 0
INDIRP4
RETP4
LABELV $235
endproc LaunchItem 12 8
export Drop_Item
proc Drop_Item 32 16
line 698
;689:}
;690:
;691:/*
;692:================
;693:Drop_Item
;694:
;695:Spawns an item and tosses it forward
;696:================
;697:*/
;698:gentity_t *Drop_Item( gentity_t *ent, gitem_t *item, float angle ) {
line 702
;699:	vec3_t	velocity;
;700:	vec3_t	angles;
;701:
;702:	VectorCopy( ent->s.apos.trBase, angles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 703
;703:	angles[YAW] += angle;
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ASGNF4
line 704
;704:	angles[PITCH] = 0;	// always forward
ADDRLP4 12
CNSTF4 0
ASGNF4
line 706
;705:
;706:	AngleVectors( angles, velocity, NULL, NULL );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 707
;707:	VectorScale( velocity, 150, velocity );
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1125515264
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1125515264
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1125515264
MULF4
ASGNF4
line 708
;708:	velocity[2] += 200 + crandom() * 50;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1120403456
MULF4
CNSTF4 1128792064
ADDF4
ADDF4
ASGNF4
line 710
;709:	
;710:	return LaunchItem( item, ent->s.pos.trBase, velocity );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 28
ADDRGP4 LaunchItem
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
RETP4
LABELV $243
endproc Drop_Item 32 16
export Use_Item
proc Use_Item 0 4
line 721
;711:}
;712:
;713:
;714:/*
;715:================
;716:Use_Item
;717:
;718:Respawn the item
;719:================
;720:*/
;721:void Use_Item( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 722
;722:	RespawnItem( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 RespawnItem
CALLV
pop
line 723
;723:}
LABELV $250
endproc Use_Item 0 4
export FinishSpawningItem
proc FinishSpawningItem 84 28
line 735
;724:
;725://======================================================================
;726:
;727:/*
;728:================
;729:FinishSpawningItem
;730:
;731:Traces down to find where an item should rest, instead of letting them
;732:free fall from their spawn points
;733:================
;734:*/
;735:void FinishSpawningItem( gentity_t *ent ) {
line 739
;736:	trace_t		tr;
;737:	vec3_t		dest;
;738:
;739:	VectorSet( ent->r.mins, -ITEM_RADIUS, -ITEM_RADIUS, -ITEM_RADIUS );
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
CNSTF4 3245342720
ASGNF4
line 740
;740:	VectorSet( ent->r.maxs, ITEM_RADIUS, ITEM_RADIUS, ITEM_RADIUS );
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 948
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
CNSTF4 1097859072
ASGNF4
line 742
;741:
;742:	ent->s.eType = ET_ITEM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 743
;743:	ent->s.modelindex = ent->item - bg_itemlist;		// store item number in modelindex
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 744
;744:	ent->s.modelindex2 = 0; // zero indicates this isn't a dropped item
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 0
ASGNI4
line 746
;745:
;746:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 1073741824
ASGNI4
line 747
;747:	ent->touch = Touch_Item;
ADDRFP4 0
INDIRP4
CNSTI4 1200
ADDP4
ADDRGP4 Touch_Item
ASGNP4
line 749
;748:	// using an item causes it to respawn
;749:	ent->use = Use_Item;
ADDRFP4 0
INDIRP4
CNSTI4 1204
ADDP4
ADDRGP4 Use_Item
ASGNP4
line 752
;750:
;751:	// for pickup prediction
;752:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $252
line 753
;753:		ent->s.time2 = ent->count;
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
ASGNI4
line 754
;754:	} else if ( ent->item ) {
ADDRGP4 $253
JUMPV
LABELV $252
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $254
line 755
;755:		ent->s.time2 = ent->item->quantity;	
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 756
;756:	}
LABELV $254
LABELV $253
line 758
;757:
;758:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $256
line 760
;759:		// suspended
;760:		G_SetOrigin( ent, ent->s.origin );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 761
;761:	} else {
ADDRGP4 $257
JUMPV
LABELV $256
line 763
;762:		// drop to floor
;763:		VectorSet( dest, ent->s.origin[0], ent->s.origin[1], ent->s.origin[2] - 4096 );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 72
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ASGNF4
ADDRLP4 56+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 764
;764:		trap_Trace( &tr, ent->s.origin, ent->r.mins, ent->r.maxs, dest, ent->s.number, MASK_SOLID );
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 932
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 944
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 76
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 765
;765:		if ( tr.startsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $260
line 766
;766:			G_Printf ("FinishSpawningItem: %s startsolid at %s\n", ent->classname, vtos(ent->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 80
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $263
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 767
;767:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 768
;768:			return;
ADDRGP4 $251
JUMPV
LABELV $260
line 772
;769:		}
;770:
;771:		// allow to ride movers
;772:		ent->s.groundEntityNum = tr.entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 774
;773:
;774:		G_SetOrigin( ent, tr.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 775
;775:	}
LABELV $257
line 778
;776:
;777:	// team slaves and targeted items aren't present at start
;778:	if ( ( ent->flags & FL_TEAMSLAVE ) || ent->targetname ) {
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $268
ADDRLP4 72
INDIRP4
CNSTI4 1148
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $266
LABELV $268
line 779
;779:		ent->s.eFlags |= EF_NODRAW;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 780
;780:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 0
ASGNI4
line 781
;781:		return;
ADDRGP4 $251
JUMPV
LABELV $266
line 784
;782:	}
;783:
;784:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 785
;785:}
LABELV $251
endproc FinishSpawningItem 84 28
export G_CheckTeamItems
proc G_CheckTeamItems 20 4
line 795
;786:
;787:
;788:qboolean	itemRegistered[MAX_ITEMS];
;789:
;790:/*
;791:==================
;792:G_CheckTeamItems
;793:==================
;794:*/
;795:void G_CheckTeamItems( void ) {
line 798
;796:
;797:	// Set up team stuff
;798:	Team_InitGame();
ADDRGP4 Team_InitGame
CALLV
pop
line 800
;799:
;800:	if( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $270
line 804
;801:		gitem_t	*item;
;802:
;803:		// check for the two flags
;804:		item = BG_FindItem( "Red Flag" );
ADDRGP4 $273
ARGP4
ADDRLP4 4
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 805
;805:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 8
INDIRU4
CNSTU4 0
EQU4 $276
ADDRLP4 8
INDIRU4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
NEI4 $274
LABELV $276
line 806
;806:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_redflag in map\n" );
ADDRGP4 $277
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 807
;807:		}
LABELV $274
line 808
;808:		item = BG_FindItem( "Blue Flag" );
ADDRGP4 $278
ARGP4
ADDRLP4 12
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 809
;809:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 16
INDIRU4
CNSTU4 0
EQU4 $281
ADDRLP4 16
INDIRU4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
NEI4 $279
LABELV $281
line 810
;810:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_blueflag in map\n" );
ADDRGP4 $282
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 811
;811:		}
LABELV $279
line 812
;812:	}
LABELV $270
line 872
;813:#ifdef MISSIONPACK
;814:	if( g_gametype.integer == GT_1FCTF ) {
;815:		gitem_t	*item;
;816:
;817:		// check for all three flags
;818:		item = BG_FindItem( "Red Flag" );
;819:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;820:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_redflag in map\n" );
;821:		}
;822:		item = BG_FindItem( "Blue Flag" );
;823:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;824:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_blueflag in map\n" );
;825:		}
;826:		item = BG_FindItem( "Neutral Flag" );
;827:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;828:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_neutralflag in map\n" );
;829:		}
;830:	}
;831:
;832:	if( g_gametype.integer == GT_OBELISK ) {
;833:		gentity_t	*ent;
;834:
;835:		// check for the two obelisks
;836:		ent = NULL;
;837:		ent = G_Find( ent, FOFS(classname), "team_redobelisk" );
;838:		if( !ent ) {
;839:			G_Printf( S_COLOR_YELLOW "WARNING: No team_redobelisk in map\n" );
;840:		}
;841:
;842:		ent = NULL;
;843:		ent = G_Find( ent, FOFS(classname), "team_blueobelisk" );
;844:		if( !ent ) {
;845:			G_Printf( S_COLOR_YELLOW "WARNING: No team_blueobelisk in map\n" );
;846:		}
;847:	}
;848:
;849:	if( g_gametype.integer == GT_HARVESTER ) {
;850:		gentity_t	*ent;
;851:
;852:		// check for all three obelisks
;853:		ent = NULL;
;854:		ent = G_Find( ent, FOFS(classname), "team_redobelisk" );
;855:		if( !ent ) {
;856:			G_Printf( S_COLOR_YELLOW "WARNING: No team_redobelisk in map\n" );
;857:		}
;858:
;859:		ent = NULL;
;860:		ent = G_Find( ent, FOFS(classname), "team_blueobelisk" );
;861:		if( !ent ) {
;862:			G_Printf( S_COLOR_YELLOW "WARNING: No team_blueobelisk in map\n" );
;863:		}
;864:
;865:		ent = NULL;
;866:		ent = G_Find( ent, FOFS(classname), "team_neutralobelisk" );
;867:		if( !ent ) {
;868:			G_Printf( S_COLOR_YELLOW "WARNING: No team_neutralobelisk in map\n" );
;869:		}
;870:	}
;871:#endif
;872:}
LABELV $269
endproc G_CheckTeamItems 20 4
export ClearRegisteredItems
proc ClearRegisteredItems 12 12
line 879
;873:
;874:/*
;875:==============
;876:ClearRegisteredItems
;877:==============
;878:*/
;879:void ClearRegisteredItems( void ) {
line 880
;880:	memset( itemRegistered, 0, sizeof( itemRegistered ) );
ADDRGP4 itemRegistered
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 883
;881:
;882:	// players always start with the base weapon
;883:	RegisterItem( BG_FindItemForWeapon( WP_MACHINEGUN ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 884
;884:	RegisterItem( BG_FindItemForWeapon( WP_GAUNTLET ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 893
;885:#ifdef MISSIONPACK
;886:	if( g_gametype.integer == GT_HARVESTER ) {
;887:		RegisterItem( BG_FindItem( "Red Cube" ) );
;888:		RegisterItem( BG_FindItem( "Blue Cube" ) );
;889:	}
;890:#endif
;891:#ifdef USE_GRAPPLING_HOOK
;892:	// load grappling hook on map startup
;893:	if( g_PureAllowHook.integer ) {
ADDRGP4 g_PureAllowHook+12
INDIRI4
CNSTI4 0
EQI4 $284
line 894
;894:		RegisterItem( BG_FindItemForWeapon( WP_GRAPPLING_HOOK ) );
CNSTI4 10
ARGI4
ADDRLP4 8
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 895
;895:	}
LABELV $284
line 897
;896:#endif
;897:}
LABELV $283
endproc ClearRegisteredItems 12 12
export RegisterItem
proc RegisterItem 0 4
line 906
;898:
;899:/*
;900:===============
;901:RegisterItem
;902:
;903:The item will be added to the precache list
;904:===============
;905:*/
;906:void RegisterItem( gitem_t *item ) {
line 907
;907:	if ( !item ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $288
line 908
;908:		G_Error( "RegisterItem: NULL" );
ADDRGP4 $290
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 909
;909:	}
LABELV $288
line 910
;910:	itemRegistered[ item - bg_itemlist ] = qtrue;
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
CNSTI4 1
ASGNI4
line 911
;911:}
LABELV $287
endproc RegisterItem 0 4
export SaveRegisteredItems
proc SaveRegisteredItems 268 8
line 922
;912:
;913:
;914:/*
;915:===============
;916:SaveRegisteredItems
;917:
;918:Write the needed items to a config string
;919:so the client will know which ones to precache
;920:===============
;921:*/
;922:void SaveRegisteredItems( void ) {
line 927
;923:	char	string[MAX_ITEMS+1];
;924:	int		i;
;925:	int		count;
;926:
;927:	count = 0;
ADDRLP4 264
CNSTI4 0
ASGNI4
line 928
;928:	for ( i = 0 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $295
JUMPV
LABELV $292
line 929
;929:		if ( itemRegistered[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
EQI4 $296
line 930
;930:			count++;
ADDRLP4 264
ADDRLP4 264
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 931
;931:			string[i] = '1';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 49
ASGNI1
line 932
;932:		} else {
ADDRGP4 $297
JUMPV
LABELV $296
line 933
;933:			string[i] = '0';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 48
ASGNI1
line 934
;934:		}
LABELV $297
line 935
;935:	}
LABELV $293
line 928
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $295
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $292
line 936
;936:	string[ bg_numItems ] = 0;
ADDRGP4 bg_numItems
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 938
;937:
;938:	G_Printf( "%i items registered\n", count );
ADDRGP4 $298
ARGP4
ADDRLP4 264
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 939
;939:	trap_SetConfigstring(CS_ITEMS, string);
CNSTI4 27
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 940
;940:}
LABELV $291
endproc SaveRegisteredItems 268 8
export G_ItemDisabled
proc G_ItemDisabled 132 16
line 947
;941:
;942:/*
;943:============
;944:G_ItemDisabled
;945:============
;946:*/
;947:int G_ItemDisabled( gitem_t *item ) {
line 951
;948:
;949:	char name[128];
;950:
;951:	Com_sprintf(name, sizeof(name), "disable_%s", item->classname);
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $300
ARGP4
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 952
;952:	return trap_Cvar_VariableIntegerValue( name );
ADDRLP4 0
ARGP4
ADDRLP4 128
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
RETI4
LABELV $299
endproc G_ItemDisabled 132 16
export G_SpawnItem
proc G_SpawnItem 4 12
line 965
;953:}
;954:
;955:/*
;956:============
;957:G_SpawnItem
;958:
;959:Sets the clipping size and plants the object on the floor.
;960:
;961:Items can't be immediately dropped to floor, because they might
;962:be on an entity that hasn't spawned yet.
;963:============
;964:*/
;965:void G_SpawnItem( gentity_t *ent, gitem_t *item ) {
line 967
;966:
;967:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $302
ARGP4
ADDRGP4 $303
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1296
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 968
;968:	G_SpawnFloat( "wait", "0", &ent->wait );
ADDRGP4 $304
ARGP4
ADDRGP4 $303
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1292
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 970
;969:
;970:	RegisterItem( item );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 972
;971:
;972:	if ( G_ItemDisabled( item ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 G_ItemDisabled
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $305
line 973
;973:		ent->tag = TAG_DONTSPAWN;
ADDRFP4 0
INDIRP4
CNSTI4 1308
ADDP4
CNSTI4 1
ASGNI4
line 974
;974:		return;
ADDRGP4 $301
JUMPV
LABELV $305
line 977
;975:	}
;976:
;977:	ent->item = item;
ADDRFP4 0
INDIRP4
CNSTI4 1300
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 980
;978:	// some movers spawn on the second frame, so delay item
;979:	// spawns until the third frame so they can ride trains
;980:	ent->nextthink = level.time + FRAMETIME * 2;
ADDRFP4 0
INDIRP4
CNSTI4 1184
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 981
;981:	ent->think = FinishSpawningItem;
ADDRFP4 0
INDIRP4
CNSTI4 1188
ADDP4
ADDRGP4 FinishSpawningItem
ASGNP4
line 983
;982:
;983:	ent->physicsBounce = 0.50;		// items are bouncy
ADDRFP4 0
INDIRP4
CNSTI4 1064
ADDP4
CNSTF4 1056964608
ASGNF4
line 985
;984:
;985:	if ( item->giType == IT_POWERUP ) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $308
line 986
;986:		G_SoundIndex( "sound/items/poweruprespawn.wav" );
ADDRGP4 $181
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 987
;987:		G_SpawnFloat( "noglobalsound", "0", &ent->speed);
ADDRGP4 $310
ARGP4
ADDRGP4 $303
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 988
;988:	}
LABELV $308
line 995
;989:
;990:#ifdef MISSIONPACK
;991:	if ( item->giType == IT_PERSISTANT_POWERUP ) {
;992:		ent->s.generic1 = ent->spawnflags;
;993:	}
;994:#endif
;995:}
LABELV $301
endproc G_SpawnItem 4 12
export G_BounceItem
proc G_BounceItem 52 12
line 1004
;996:
;997:
;998:/*
;999:================
;1000:G_BounceItem
;1001:
;1002:================
;1003:*/
;1004:void G_BounceItem( gentity_t *ent, trace_t *trace ) {
line 1010
;1005:	vec3_t	velocity;
;1006:	float	dot;
;1007:	int		hitTime;
;1008:
;1009:	// reflect the velocity on the trace plane
;1010:	hitTime = level.previousTime + ( level.time - level.previousTime ) * trace->fraction;
ADDRLP4 16
ADDRGP4 level+36
INDIRI4
CVIF4 4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
CVIF4 4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1011
;1011:	BG_EvaluateTrajectoryDelta( &ent->s.pos, hitTime, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 1012
;1012:	dot = DotProduct( velocity, trace->plane.normal );
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1013
;1013:	VectorMA( velocity, -2*dot, trace->plane.normal, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
line 1016
;1014:
;1015:	// cut the velocity to keep from bouncing forever
;1016:	VectorScale( ent->s.pos.trDelta, ent->physicsBounce, ent->s.pos.trDelta );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 1064
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 1064
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 1064
ADDP4
INDIRF4
MULF4
ASGNF4
line 1019
;1017:
;1018:	// check for stop
;1019:	if ( trace->plane.normal[2] > 0 && ent->s.pos.trDelta[2] < 40 ) {
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
LEF4 $319
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CNSTF4 1109393408
GEF4 $319
line 1020
;1020:		trace->endpos[2] += 1.0;	// make sure it is off ground
ADDRLP4 36
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1021
;1021:		SnapVector( trace->endpos );
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 48
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1022
;1022:		G_SetOrigin( ent, trace->endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1023
;1023:		ent->s.groundEntityNum = trace->entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
line 1024
;1024:		return;
ADDRGP4 $311
JUMPV
LABELV $319
line 1027
;1025:	}
;1026:
;1027:	VectorAdd( ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 984
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 984
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 988
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 988
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 992
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 992
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1028
;1028:	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 984
ADDP4
INDIRB
ASGNB 12
line 1029
;1029:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1030
;1030:}
LABELV $311
endproc G_BounceItem 52 12
export G_RunItem
proc G_RunItem 88 28
line 1039
;1031:
;1032:
;1033:/*
;1034:================
;1035:G_RunItem
;1036:
;1037:================
;1038:*/
;1039:void G_RunItem( gentity_t *ent ) {
line 1046
;1040:	vec3_t		origin;
;1041:	trace_t		tr;
;1042:	int			contents;
;1043:	int			mask;
;1044:
;1045:	// if its groundentity has been set to ENTITYNUM_NONE, it may have been pushed off an edge
;1046:	if ( ent->s.groundEntityNum == ENTITYNUM_NONE ) {
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $323
line 1047
;1047:		if ( ent->s.pos.trType != TR_GRAVITY ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 5
EQI4 $325
line 1048
;1048:			ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1049
;1049:			ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1050
;1050:		}
LABELV $325
line 1051
;1051:	}
LABELV $323
line 1053
;1052:
;1053:	if ( ent->s.pos.trType == TR_STATIONARY ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $328
line 1055
;1054:		// check think function
;1055:		G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1056
;1056:		return;
ADDRGP4 $322
JUMPV
LABELV $328
line 1060
;1057:	}
;1058:
;1059:	// get current position
;1060:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 56
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1063
;1061:
;1062:	// trace a line from the previous position to the current position
;1063:	if ( ent->clipmask ) {
ADDRFP4 0
INDIRP4
CNSTI4 1068
ADDP4
INDIRI4
CNSTI4 0
EQI4 $331
line 1064
;1064:		mask = ent->clipmask;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 1068
ADDP4
INDIRI4
ASGNI4
line 1065
;1065:	} else {
ADDRGP4 $332
JUMPV
LABELV $331
line 1066
;1066:		mask = MASK_PLAYERSOLID & ~CONTENTS_BODY;//MASK_SOLID;
ADDRLP4 72
CNSTI4 65537
ASGNI4
line 1067
;1067:	}
LABELV $332
line 1068
;1068:	trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, 
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 984
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 932
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 944
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1071
;1069:		ent->r.ownerNum, mask );
;1070:
;1071:	VectorCopy( tr.endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 984
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1073
;1072:
;1073:	if ( tr.startsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $334
line 1074
;1074:		tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1075
;1075:	}
LABELV $334
line 1077
;1076:
;1077:	trap_LinkEntity( ent );	// FIXME: avoid this for stationary?
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1080
;1078:
;1079:	// check think function
;1080:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1082
;1081:
;1082:	if ( tr.fraction == 1 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $338
line 1083
;1083:		return;
ADDRGP4 $322
JUMPV
LABELV $338
line 1087
;1084:	}
;1085:
;1086:	// if it is in a nodrop volume, remove it
;1087:	contents = trap_PointContents( ent->r.currentOrigin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 984
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 80
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 80
INDIRI4
ASGNI4
line 1088
;1088:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 68
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $341
line 1089
;1089:		if (ent->item && ent->item->giType == IT_TEAM) {
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $343
ADDRLP4 84
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $343
line 1090
;1090:			Team_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_FreeEntity
CALLV
pop
line 1091
;1091:		} else {
ADDRGP4 $322
JUMPV
LABELV $343
line 1092
;1092:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1093
;1093:		}
line 1094
;1094:		return;
ADDRGP4 $322
JUMPV
LABELV $341
line 1097
;1095:	}
;1096:
;1097:	G_BounceItem( ent, &tr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_BounceItem
CALLV
pop
line 1098
;1098:}
LABELV $322
endproc G_RunItem 88 28
bss
export itemRegistered
align 4
LABELV itemRegistered
skip 1024
import svf_self_portal2
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_TraceCapsule
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_RealTime
import trap_Milliseconds
import trap_Error
import trap_Print
import g_allowDeathCam
import g_itemTimer
import g_PureAllowHook
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_predictPVS
import g_unlagged
import g_rotation
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_autoJoin
import g_allowVote
import g_blood
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_dmflags
import g_maxGameClients
import g_cheats
import g_dedicated
import sv_fps
import g_mapname
import g_gametype
import g_entities
import level
import AddTeamScore
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import G_MapExist
import G_LoadMap
import ParseMapRotation
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import G_PredictPlayerMove
import G_UnTimeShiftClient
import G_UndoTimeShiftFor
import G_DoTimeShiftFor
import G_UnTimeShiftAllClients
import G_TimeShiftAllClients
import G_StoreHistory
import G_ResetHistory
import Svcmd_AbortPodium_f
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_ClearClientSessionData
import G_WriteClientSessionData
import G_ReadClientSessionData
import G_InitSessionData
import G_WriteSessionData
import G_InitWorldSession
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import Team_ResetFlags
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_BroadcastServerCommand
import G_Error
import G_Printf
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import MoveClientToIntermission
import DeathmatchScoreboardMessage
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SetClientVrControllerAngles
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamConnectedCount
import TeamCount
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import SnapVectorTowards
import LogAccuracyHit
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_grapple
import fire_bfg
import fire_rocket
import fire_grenade
import fire_plasma
import fire_blaster
import G_RunMissile
import TossClientCubes
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import ArmorIndex
import Think_Weapon
import SetRespawn
import PrecacheItem
import UseHoldableItem
import G_RevertVote
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import BigEndian
import replace1
import Q_stradd
import Q_strcpy
import BG_StripColor
import BG_CleanName
import DecodedString
import EncodedString
import strtok
import Q_stristr
import BG_sprintf
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import Com_Printf
import Com_Error
import Info_NextPair
import Info_ValidateKeyValue
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_ValueForKey
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import locase
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_ReadToken
import trap_PC_SourceFileAndLine
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import Com_Split
import COM_ParseSep
import Com_InitSeparators
import SkipTillSeparators
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import hex_to_color
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampFloat
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Hunk_Alloc
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import Q_sscanf
import ED_vsprintf
import atoi
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $310
byte 1 110
byte 1 111
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $304
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $303
byte 1 48
byte 1 0
align 1
LABELV $302
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $300
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $298
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $290
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $282
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 78
byte 1 111
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $278
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $277
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 78
byte 1 111
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $273
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $263
byte 1 70
byte 1 105
byte 1 110
byte 1 105
byte 1 115
byte 1 104
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $190
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $181
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $165
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
