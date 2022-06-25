export ScorePlum
code
proc ScorePlum 12 8
file "..\..\..\..\code\game\g_combat.c"
line 13
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_combat.c
;4:
;5:#include "g_local.h"
;6:
;7:
;8:/*
;9:============
;10:ScorePlum
;11:============
;12:*/
;13:void ScorePlum( gentity_t *ent, vec3_t origin, int score ) {
line 16
;14:	gentity_t *plum;
;15:
;16:	plum = G_TempEntity( origin, EV_SCOREPLUM );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 18
;17:	// only send this temp entity to a single client
;18:	plum->r.svFlags |= SVF_SINGLECLIENT;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 920
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 19
;19:	plum->r.singleClient = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 924
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 21
;20:	//
;21:	plum->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 22
;22:	plum->s.time = score;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 23
;23:}
LABELV $54
endproc ScorePlum 12 8
export AddScore
proc AddScore 4 12
line 32
;24:
;25:/*
;26:============
;27:AddScore
;28:
;29:Adds score to both the client and his team
;30:============
;31:*/
;32:void AddScore( gentity_t *ent, vec3_t origin, int score ) {
line 33
;33:	if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $56
line 34
;34:		return;
ADDRGP4 $55
JUMPV
LABELV $56
line 37
;35:	}
;36:	// no scoring during pre-match warmup
;37:	if ( level.warmupTime ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $58
line 38
;38:		return;
ADDRGP4 $55
JUMPV
LABELV $58
line 41
;39:	}
;40:	// show score plum
;41:	ScorePlum(ent, origin, score);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 ScorePlum
CALLV
pop
line 43
;42:	//
;43:	ent->client->ps.persistant[PERS_SCORE] += score;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 248
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
line 44
;44:	if ( g_gametype.integer == GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $61
line 45
;45:		AddTeamScore( origin, ent->client->ps.persistant[PERS_TEAM], score );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 AddTeamScore
CALLV
pop
line 46
;46:	}
LABELV $61
line 47
;47:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 48
;48:}
LABELV $55
endproc AddScore 4 12
export TossClientItems
proc TossClientItems 40 12
line 57
;49:
;50:/*
;51:=================
;52:TossClientItems
;53:
;54:Toss the weapon and powerups for the killed player
;55:=================
;56:*/
;57:void TossClientItems( gentity_t *self ) {
line 65
;58:	gitem_t		*item;
;59:	int			weapon;
;60:	float		angle;
;61:	int			i;
;62:	gentity_t	*drop;
;63:
;64:	// drop the weapon if not a gauntlet or machinegun
;65:	weapon = self->s.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 71
;66:
;67:	// make a special check to see if they are changing to a new
;68:	// weapon that isn't the mg or gauntlet.  Without this, a client
;69:	// can pick up a weapon, be killed, and not drop the weapon because
;70:	// their weapon change hasn't completed yet and they are still holding the MG.
;71:	if ( weapon == WP_MACHINEGUN 
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $67
ADDRLP4 12
INDIRI4
CNSTI4 10
NEI4 $65
LABELV $67
line 75
;72:#ifdef USE_GRAPPLING_HOOK
;73:		|| weapon == WP_GRAPPLING_HOOK
;74:#endif
;75:		) {
line 76
;76:		if ( self->client->ps.weaponstate == WEAPON_DROPPING ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $68
line 77
;77:			weapon = self->client->pers.cmd.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 660
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 78
;78:		}
LABELV $68
line 79
;79:		if ( !( self->client->ps.stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 12
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $70
line 80
;80:			weapon = WP_NONE;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 81
;81:		}
LABELV $70
line 82
;82:	}
LABELV $65
line 84
;83:
;84:	if ( weapon > WP_MACHINEGUN && 
ADDRLP4 12
INDIRI4
CNSTI4 2
LEI4 $72
ADDRLP4 12
INDIRI4
CNSTI4 10
EQI4 $72
ADDRLP4 12
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
CNSTI4 0
EQI4 $72
line 88
;85:#ifdef USE_GRAPPLING_HOOK
;86:		weapon != WP_GRAPPLING_HOOK && 
;87:#endif
;88:		self->client->ps.ammo[ weapon ] ) {
line 90
;89:		// find the item type for this weapon
;90:		item = BG_FindItemForWeapon( weapon );
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
ASGNP4
line 93
;91:
;92:		// spawn the item
;93:		drop = Drop_Item( self, item, 0 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 32
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 96
;94:
;95:		// for pickup prediction
;96:		drop->s.time2 = item->quantity;
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 97
;97:	}
LABELV $72
line 100
;98:
;99:	// drop all the powerups if not in teamplay
;100:	if ( g_gametype.integer != GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $74
line 101
;101:		angle = 45;
ADDRLP4 16
CNSTF4 1110704128
ASGNF4
line 102
;102:		for ( i = 1 ; i < PW_NUM_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $77
line 103
;103:			if ( self->client->ps.powerups[ i ] > level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $81
line 104
;104:				item = BG_FindItemForPowerup( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
ASGNP4
line 105
;105:				if ( !item ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $84
line 106
;106:					continue;
ADDRGP4 $78
JUMPV
LABELV $84
line 108
;107:				}
;108:				drop = Drop_Item( self, item, angle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 110
;109:				// decide how many seconds it has left
;110:				drop->count = ( self->client->ps.powerups[ i ] - level.time ) / 1000;
ADDRLP4 4
INDIRP4
CNSTI4 1256
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 111
;111:				if ( drop->count < 1 ) {
ADDRLP4 4
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
CNSTI4 1
GEI4 $87
line 112
;112:					drop->count = 1;
ADDRLP4 4
INDIRP4
CNSTI4 1256
ADDP4
CNSTI4 1
ASGNI4
line 113
;113:				}
LABELV $87
line 115
;114:				// for pickup prediction
;115:				drop->s.time2 = drop->count;
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
ASGNI4
line 116
;116:				angle += 45;
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1110704128
ADDF4
ASGNF4
line 117
;117:			}
LABELV $81
line 118
;118:		}
LABELV $78
line 102
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LTI4 $77
line 119
;119:	}
LABELV $74
line 120
;120:}
LABELV $64
endproc TossClientItems 40 12
export LookAtKiller
proc LookAtKiller 28 4
line 210
;121:
;122:
;123:#ifdef MISSIONPACK
;124:/*
;125:=================
;126:TossClientCubes
;127:=================
;128:*/
;129:extern gentity_t	*neutralObelisk;
;130:
;131:void TossClientCubes( gentity_t *self ) {
;132:	gitem_t		*item;
;133:	gentity_t	*drop;
;134:	vec3_t		velocity;
;135:	vec3_t		angles;
;136:	vec3_t		origin;
;137:
;138:	self->client->ps.generic1 = 0;
;139:
;140:	// this should never happen but we should never
;141:	// get the server to crash due to skull being spawned in
;142:	if (!G_EntitiesFree()) {
;143:		return;
;144:	}
;145:
;146:	if( self->client->sess.sessionTeam == TEAM_RED ) {
;147:		item = BG_FindItem( "Red Cube" );
;148:	}
;149:	else {
;150:		item = BG_FindItem( "Blue Cube" );
;151:	}
;152:
;153:	angles[YAW] = (float)(level.time % 360);
;154:	angles[PITCH] = 0;	// always forward
;155:	angles[ROLL] = 0;
;156:
;157:	AngleVectors( angles, velocity, NULL, NULL );
;158:	VectorScale( velocity, 150, velocity );
;159:	velocity[2] += 200 + crandom() * 50;
;160:
;161:	if( neutralObelisk ) {
;162:		VectorCopy( neutralObelisk->s.pos.trBase, origin );
;163:		origin[2] += 44;
;164:	} else {
;165:		VectorClear( origin ) ;
;166:	}
;167:
;168:	drop = LaunchItem( item, origin, velocity );
;169:
;170:	drop->nextthink = level.time + g_cubeTimeout.integer * 1000;
;171:	drop->think = G_FreeEntity;
;172:	drop->spawnflags = self->client->sess.sessionTeam;
;173:}
;174:
;175:
;176:/*
;177:=================
;178:TossClientPersistantPowerups
;179:=================
;180:*/
;181:void TossClientPersistantPowerups( gentity_t *ent ) {
;182:	gentity_t	*powerup;
;183:
;184:	if( !ent->client ) {
;185:		return;
;186:	}
;187:
;188:	if( !ent->client->persistantPowerup ) {
;189:		return;
;190:	}
;191:
;192:	powerup = ent->client->persistantPowerup;
;193:
;194:	powerup->r.svFlags &= ~SVF_NOCLIENT;
;195:	powerup->s.eFlags &= ~EF_NODRAW;
;196:	powerup->r.contents = CONTENTS_TRIGGER;
;197:	trap_LinkEntity( powerup );
;198:
;199:	ent->client->ps.stats[STAT_PERSISTANT_POWERUP] = 0;
;200:	ent->client->persistantPowerup = NULL;
;201:}
;202:#endif
;203:
;204:
;205:/*
;206:==================
;207:LookAtKiller
;208:==================
;209:*/
;210:void LookAtKiller( gentity_t *self, gentity_t *inflictor, gentity_t *attacker ) {
line 213
;211:	vec3_t		dir;
;212:
;213:	if ( attacker && attacker != self ) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 12
INDIRU4
CNSTU4 0
EQU4 $90
ADDRLP4 12
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $90
line 214
;214:		VectorSubtract (attacker->s.pos.trBase, self->s.pos.trBase, dir);
ADDRLP4 16
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 215
;215:	} else if ( inflictor && inflictor != self ) {
ADDRGP4 $91
JUMPV
LABELV $90
ADDRLP4 16
ADDRFP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 16
INDIRU4
CNSTU4 0
EQU4 $94
ADDRLP4 16
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $94
line 216
;216:		VectorSubtract (inflictor->s.pos.trBase, self->s.pos.trBase, dir);
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 217
;217:	} else {
ADDRGP4 $95
JUMPV
LABELV $94
line 218
;218:		self->client->ps.stats[STAT_DEAD_YAW] = self->s.angles[YAW];
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 219
;219:		return;
ADDRGP4 $89
JUMPV
LABELV $95
LABELV $91
line 222
;220:	}
;221:
;222:	self->client->ps.stats[STAT_DEAD_YAW] = vectoyaw ( dir );
ADDRLP4 0
ARGP4
ADDRLP4 20
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 223
;223:}
LABELV $89
endproc LookAtKiller 28 4
export GibEntity
proc GibEntity 0 12
line 230
;224:
;225:/*
;226:==================
;227:GibEntity
;228:==================
;229:*/
;230:void GibEntity( gentity_t *self, int killer ) {
line 252
;231:#ifdef MISSIONPACK
;232:	gentity_t *ent;
;233:	int i;
;234:
;235:	//if this entity still has kamikaze
;236:	if (self->s.eFlags & EF_KAMIKAZE) {
;237:		// check if there is a kamikaze timer around for this owner
;238:		for (i = 0; i < level.num_entities; i++) {
;239:			ent = &g_entities[i];
;240:			if (!ent->inuse)
;241:				continue;
;242:			if (ent->activator != self)
;243:				continue;
;244:			if (strcmp(ent->classname, "kamikaze timer"))
;245:				continue;
;246:			G_FreeEntity(ent);
;247:			break;
;248:		}
;249:	}
;250:#endif
;251:
;252:	G_AddEvent( self, EV_GIB_PLAYER, killer );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 65
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 253
;253:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1232
ADDP4
CNSTI4 0
ASGNI4
line 254
;254:	self->s.eType = ET_INVISIBLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 255
;255:	self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 0
ASGNI4
line 256
;256:}
LABELV $98
endproc GibEntity 0 12
export body_die
proc body_die 0 8
line 263
;257:
;258:/*
;259:==================
;260:body_die
;261:==================
;262:*/
;263:void body_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 264
;264:	if ( self->health > GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 -40
LEI4 $100
line 265
;265:		return;
ADDRGP4 $99
JUMPV
LABELV $100
line 267
;266:	}
;267:	if ( !g_blood.integer ) {
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
NEI4 $102
line 268
;268:		self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
CNSTI4 -39
ASGNI4
line 269
;269:		return;
ADDRGP4 $99
JUMPV
LABELV $102
line 272
;270:	}
;271:
;272:	GibEntity( self, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 273
;273:}
LABELV $99
endproc body_die 0 8
data
export modNames
align 4
LABELV modNames
address $105
address $106
address $107
address $108
address $109
address $110
address $111
address $112
address $113
address $114
address $115
address $116
address $117
address $118
address $119
address $120
address $121
address $122
address $123
address $124
address $125
address $126
address $127
address $128
export CheckAlmostCapture
code
proc CheckAlmostCapture 52 12
line 347
;274:
;275:
;276:// these are just for logging, the client prints its own messages
;277:char	*modNames[] = {
;278:	"MOD_UNKNOWN",
;279:	"MOD_SHOTGUN",
;280:	"MOD_GAUNTLET",
;281:	"MOD_MACHINEGUN",
;282:	"MOD_GRENADE",
;283:	"MOD_GRENADE_SPLASH",
;284:	"MOD_ROCKET",
;285:	"MOD_ROCKET_SPLASH",
;286:	"MOD_PLASMA",
;287:	"MOD_PLASMA_SPLASH",
;288:	"MOD_RAILGUN",
;289:	"MOD_LIGHTNING",
;290:	"MOD_BFG",
;291:	"MOD_BFG_SPLASH",
;292:	"MOD_WATER",
;293:	"MOD_SLIME",
;294:	"MOD_LAVA",
;295:	"MOD_CRUSH",
;296:	"MOD_TELEFRAG",
;297:	"MOD_FALLING",
;298:	"MOD_SUICIDE",
;299:	"MOD_TARGET_LASER",
;300:	"MOD_TRIGGER_HURT",
;301:#ifdef MISSIONPACK
;302:	"MOD_NAIL",
;303:	"MOD_CHAINGUN",
;304:	"MOD_PROXIMITY_MINE",
;305:	"MOD_KAMIKAZE",
;306:	"MOD_JUICED",
;307:#endif
;308:	"MOD_GRAPPLE"
;309:};
;310:
;311:#ifdef MISSIONPACK
;312:/*
;313:==================
;314:Kamikaze_DeathActivate
;315:==================
;316:*/
;317:void Kamikaze_DeathActivate( gentity_t *ent ) {
;318:	G_StartKamikaze(ent);
;319:	G_FreeEntity(ent);
;320:}
;321:
;322:/*
;323:==================
;324:Kamikaze_DeathTimer
;325:==================
;326:*/
;327:void Kamikaze_DeathTimer( gentity_t *self ) {
;328:	gentity_t *ent;
;329:
;330:	ent = G_Spawn();
;331:	ent->classname = "kamikaze timer";
;332:	VectorCopy(self->s.pos.trBase, ent->s.pos.trBase);
;333:	ent->r.svFlags |= SVF_NOCLIENT;
;334:	ent->think = Kamikaze_DeathActivate;
;335:	ent->nextthink = level.time + 5 * 1000;
;336:
;337:	ent->activator = self;
;338:}
;339:
;340:#endif
;341:
;342:/*
;343:==================
;344:CheckAlmostCapture
;345:==================
;346:*/
;347:void CheckAlmostCapture( gentity_t *self, gentity_t *attacker ) {
line 353
;348:	gentity_t	*ent;
;349:	vec3_t		dir;
;350:	char		*classname;
;351:
;352:	// if this player was carrying a flag
;353:	if ( self->client->ps.powerups[PW_REDFLAG] ||
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
NEI4 $133
ADDRLP4 20
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
NEI4 $133
ADDRLP4 20
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $130
LABELV $133
line 355
;354:		self->client->ps.powerups[PW_BLUEFLAG] ||
;355:		self->client->ps.powerups[PW_NEUTRALFLAG] ) {
line 357
;356:		// get the goal flag this player should have been going for
;357:		if ( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $134
line 358
;358:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 2
NEI4 $137
line 359
;359:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $139
ASGNP4
line 360
;360:			}
ADDRGP4 $135
JUMPV
LABELV $137
line 361
;361:			else {
line 362
;362:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $140
ASGNP4
line 363
;363:			}
line 364
;364:		}
ADDRGP4 $135
JUMPV
LABELV $134
line 365
;365:		else {
line 366
;366:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 2
NEI4 $141
line 367
;367:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $140
ASGNP4
line 368
;368:			}
ADDRGP4 $142
JUMPV
LABELV $141
line 369
;369:			else {
line 370
;370:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $139
ASGNP4
line 371
;371:			}
LABELV $142
line 372
;372:		}
LABELV $135
line 373
;373:		ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
LABELV $143
line 375
;374:		do
;375:		{
line 376
;376:			ent = G_Find(ent, FOFS(classname), classname);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1020
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 377
;377:		} while (ent && (ent->flags & FL_DROPPED_ITEM));
LABELV $144
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $146
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $143
LABELV $146
line 379
;378:		// if we found the destination flag and it's not picked up
;379:		if (ent && !(ent->r.svFlags & SVF_NOCLIENT) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $147
ADDRLP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $147
line 381
;380:			// if the player was *very* close
;381:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 32
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 382
;382:			if ( VectorLength(dir) < 200 ) {
ADDRLP4 8
ARGP4
ADDRLP4 40
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 1128792064
GEF4 $151
line 383
;383:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 384
;384:				if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $153
line 385
;385:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 386
;386:				}
LABELV $153
line 387
;387:			}
LABELV $151
line 388
;388:		}
LABELV $147
line 389
;389:	}
LABELV $130
line 390
;390:}
LABELV $129
endproc CheckAlmostCapture 52 12
export CheckAlmostScored
proc CheckAlmostScored 44 12
line 397
;391:
;392:/*
;393:==================
;394:CheckAlmostScored
;395:==================
;396:*/
;397:void CheckAlmostScored( gentity_t *self, gentity_t *attacker ) {
line 403
;398:	gentity_t	*ent;
;399:	vec3_t		dir;
;400:	char		*classname;
;401:
;402:	// if the player was carrying cubes
;403:	if ( self->client->ps.generic1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $156
line 404
;404:		if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 2
NEI4 $158
line 405
;405:			classname = "team_redobelisk";
ADDRLP4 16
ADDRGP4 $160
ASGNP4
line 406
;406:		}
ADDRGP4 $159
JUMPV
LABELV $158
line 407
;407:		else {
line 408
;408:			classname = "team_blueobelisk";
ADDRLP4 16
ADDRGP4 $161
ASGNP4
line 409
;409:		}
LABELV $159
line 410
;410:		ent = G_Find(NULL, FOFS(classname), classname);
CNSTP4 0
ARGP4
CNSTI4 1020
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 412
;411:		// if we found the destination obelisk
;412:		if ( ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $162
line 414
;413:			// if the player was *very* close
;414:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 415
;415:			if ( VectorLength(dir) < 200 ) {
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1128792064
GEF4 $166
line 416
;416:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 417
;417:				if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $168
line 418
;418:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 419
;419:				}
LABELV $168
line 420
;420:			}
LABELV $166
line 421
;421:		}
LABELV $162
line 422
;422:	}
LABELV $156
line 423
;423:}
LABELV $155
endproc CheckAlmostScored 44 12
bss
align 4
LABELV $236
skip 4
export player_die
code
proc player_die 80 28
line 430
;424:
;425:/*
;426:==================
;427:player_die
;428:==================
;429:*/
;430:void player_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 438
;431:	gentity_t	*ent;
;432:	int			anim;
;433:	int			contents;
;434:	int			killer;
;435:	int			i;
;436:	char		*killerName, *obit;
;437:
;438:	if ( self->client->ps.pm_type == PM_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $171
line 439
;439:		return;
ADDRGP4 $170
JUMPV
LABELV $171
line 442
;440:	}
;441:
;442:	if ( level.intermissiontime ) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $173
line 443
;443:		return;
ADDRGP4 $170
JUMPV
LABELV $173
line 447
;444:	}
;445:
;446:	//unlag the client
;447:	G_UnTimeShiftClient( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftClient
CALLV
pop
line 450
;448:
;449:	// check for an almost capture
;450:	CheckAlmostCapture( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostCapture
CALLV
pop
line 452
;451:	// check for a player that almost brought in cubes
;452:	CheckAlmostScored( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostScored
CALLV
pop
line 455
;453:
;454:#ifdef USE_GRAPPLING_HOOK
;455:	if (self->client && self->client->hook) {
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $176
ADDRLP4 28
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 936
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $176
line 456
;456:		Weapon_HookFree(self->client->hook);
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 936
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
line 457
;457:	}
LABELV $176
line 467
;458:#endif
;459:
;460:#ifdef MISSIONPACK
;461:	if ((self->client->ps.eFlags & EF_TICKING) && self->activator) {
;462:		self->client->ps.eFlags &= ~EF_TICKING;
;463:		self->activator->think = G_FreeEntity;
;464:		self->activator->nextthink = level.time;
;465:	}
;466:#endif
;467:	self->client->ps.pm_type = PM_DEAD;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 469
;468:
;469:	if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $178
line 470
;470:		killer = attacker->s.number;
ADDRLP4 4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 471
;471:		if ( attacker->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $180
line 472
;472:			killerName = attacker->client->pers.netname;
ADDRLP4 16
ADDRFP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 676
ADDP4
ASGNP4
line 473
;473:		} else {
ADDRGP4 $179
JUMPV
LABELV $180
line 474
;474:			killerName = "<non-client>";
ADDRLP4 16
ADDRGP4 $182
ASGNP4
line 475
;475:		}
line 476
;476:	} else {
ADDRGP4 $179
JUMPV
LABELV $178
line 477
;477:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 478
;478:		killerName = "<world>";
ADDRLP4 16
ADDRGP4 $183
ASGNP4
line 479
;479:	}
LABELV $179
line 481
;480:
;481:	if ( killer < 0 || killer >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $186
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $184
LABELV $186
line 482
;482:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 483
;483:		killerName = "<world>";
ADDRLP4 16
ADDRGP4 $183
ASGNP4
line 484
;484:	}
LABELV $184
line 486
;485:
;486:	if ( (unsigned)meansOfDeath >= ARRAY_LEN( modNames ) ) {
ADDRFP4 16
INDIRI4
CVIU4 4
CNSTU4 24
LTU4 $187
line 487
;487:		obit = "<bad obituary>";
ADDRLP4 20
ADDRGP4 $189
ASGNP4
line 488
;488:	} else {
ADDRGP4 $188
JUMPV
LABELV $187
line 489
;489:		obit = modNames[ meansOfDeath ];
ADDRLP4 20
ADDRFP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 modNames
ADDP4
INDIRP4
ASGNP4
line 490
;490:	}
LABELV $188
line 492
;491:
;492:	G_LogPrintf("Kill: %i %i %i: %s killed %s by %s\n", 
ADDRGP4 $190
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 497
;493:		killer, self->s.number, meansOfDeath, killerName, 
;494:		self->client->pers.netname, obit );
;495:
;496:	// broadcast the death event to everyone
;497:	ent = G_TempEntity( self->r.currentOrigin, EV_OBITUARY );
ADDRFP4 0
INDIRP4
CNSTI4 984
ADDP4
ARGP4
CNSTI4 61
ARGI4
ADDRLP4 40
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
ASGNP4
line 498
;498:	ent->s.eventParm = meansOfDeath;
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 499
;499:	ent->s.otherEntityNum = self - g_entities;
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1312
DIVI4
ASGNI4
line 500
;500:	ent->s.otherEntityNum2 = killer;
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 501
;501:	ent->r.svFlags = SVF_BROADCAST;	// send to everyone
ADDRLP4 8
INDIRP4
CNSTI4 920
ADDP4
CNSTI4 32
ASGNI4
line 503
;502:
;503:	self->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 1264
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 505
;504:
;505:	self->client->ps.persistant[PERS_KILLED]++;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 280
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 507
;506:
;507:	if (attacker && attacker->client) {
ADDRLP4 48
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $191
ADDRLP4 48
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $191
line 508
;508:		attacker->client->lastkilled_client = self->s.number;
ADDRFP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 896
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 510
;509:
;510:		if ( attacker == self || OnSameTeam (self, attacker ) ) {
ADDRLP4 52
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
ADDRLP4 56
INDIRP4
CVPU4 4
EQU4 $195
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $193
LABELV $195
line 511
;511:			AddScore( attacker, self->r.currentOrigin, -1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 984
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 512
;512:		} else {
ADDRGP4 $192
JUMPV
LABELV $193
line 513
;513:			AddScore( attacker, self->r.currentOrigin, 1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 984
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 515
;514:
;515:			if( meansOfDeath == MOD_GAUNTLET ) {
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $196
line 518
;516:				
;517:				// play humiliation on player
;518:				attacker->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 64
ADDRFP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 521
;519:
;520:				// add the sprite over the player's head
;521:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 68
ADDRFP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 522
;522:				attacker->client->ps.eFlags |= EF_AWARD_GAUNTLET;
ADDRLP4 72
ADDRFP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 523
;523:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 920
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 526
;524:
;525:				// also play humiliation on target
;526:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_GAUNTLETREWARD;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 527
;527:			}
LABELV $196
line 532
;528:			//GUNNM TODO: a reward when WEAPON_GRAPPLE_KILLS ? (cf. open arena)
;529:	
;530:			// check for two kills in a short amount of time
;531:			// if this is close enough to the last kill, give a reward sound
;532:			if ( level.time - attacker->client->lastKillTime < CARNAGE_REWARD_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 928
ADDP4
INDIRI4
SUBI4
CNSTI4 3000
GEI4 $199
line 534
;533:				// play excellent on player
;534:				attacker->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 64
ADDRFP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 288
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 537
;535:
;536:				// add the sprite over the player's head
;537:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 68
ADDRFP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 538
;538:				attacker->client->ps.eFlags |= EF_AWARD_EXCELLENT;
ADDRLP4 72
ADDRFP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 539
;539:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 920
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 540
;540:			}
LABELV $199
line 541
;541:			attacker->client->lastKillTime = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 928
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 543
;542:
;543:		}
line 544
;544:	} else {
ADDRGP4 $192
JUMPV
LABELV $191
line 545
;545:		AddScore( self, self->r.currentOrigin, -1 );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 984
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 546
;546:	}
LABELV $192
line 549
;547:
;548:	// Add team bonuses
;549:	Team_FragBonuses(self, inflictor, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_FragBonuses
CALLV
pop
line 552
;550:
;551:	// if I committed suicide, the flag does not fall, it returns.
;552:	if (meansOfDeath == MOD_SUICIDE) {
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $204
line 559
;553:#ifdef MISSIONPACK
;554:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
;555:			Team_ReturnFlag( TEAM_FREE );
;556:			self->client->ps.powerups[PW_NEUTRALFLAG] = 0;
;557:		} else 
;558:#endif
;559:		if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $206
line 560
;560:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 561
;561:			self->client->ps.powerups[PW_REDFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 562
;562:		}
ADDRGP4 $207
JUMPV
LABELV $206
line 563
;563:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $208
line 564
;564:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 565
;565:			self->client->ps.powerups[PW_BLUEFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 0
ASGNI4
line 566
;566:		}
LABELV $208
LABELV $207
line 567
;567:	}
LABELV $204
line 570
;568:
;569:	// if client is in a nodrop area, don't drop anything (but return CTF flags!)
;570:	contents = trap_PointContents( self->r.currentOrigin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 984
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 52
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 52
INDIRI4
ASGNI4
line 571
;571:	if ( !( contents & CONTENTS_NODROP )) {
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $210
line 572
;572:		TossClientItems( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 573
;573:	}
ADDRGP4 $211
JUMPV
LABELV $210
line 574
;574:	else {
line 575
;575:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $212
line 576
;576:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 577
;577:		}
ADDRGP4 $213
JUMPV
LABELV $212
line 578
;578:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $214
line 579
;579:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 580
;580:		}
ADDRGP4 $215
JUMPV
LABELV $214
line 581
;581:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $216
line 582
;582:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 583
;583:		}
LABELV $216
LABELV $215
LABELV $213
line 584
;584:	}
LABELV $211
line 592
;585:#ifdef MISSIONPACK
;586:	TossClientPersistantPowerups( self );
;587:	if( g_gametype.integer == GT_HARVESTER ) {
;588:		TossClientCubes( self );
;589:	}
;590:#endif
;591:
;592:	Cmd_Score_f( self );		// show scores
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 595
;593:	// send updated scores to any clients that are following this one,
;594:	// or they would get stale scoreboards
;595:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $218
line 598
;596:		gclient_t	*client;
;597:
;598:		client = &level.clients[i];
ADDRLP4 56
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 599
;599:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 56
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 2
EQI4 $223
line 600
;600:			continue;
ADDRGP4 $219
JUMPV
LABELV $223
line 602
;601:		}
;602:		if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 56
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
EQI4 $225
line 603
;603:			continue;
ADDRGP4 $219
JUMPV
LABELV $225
line 605
;604:		}
;605:		if ( client->sess.spectatorClient == self->s.number ) {
ADDRLP4 56
INDIRP4
CNSTI4 804
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $227
line 606
;606:			Cmd_Score_f( g_entities + i );
ADDRLP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 607
;607:		}
LABELV $227
line 608
;608:	}
LABELV $219
line 595
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $221
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $218
line 610
;609:
;610:	self->takedamage = qtrue;	// can still be gibbed
ADDRFP4 0
INDIRP4
CNSTI4 1232
ADDP4
CNSTI4 1
ASGNI4
line 612
;611:
;612:	self->s.weapon = WP_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 613
;613:	self->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 614
;614:	self->r.contents = CONTENTS_CORPSE;
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 67108864
ASGNI4
line 616
;615:
;616:	self->s.angles[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 0
ASGNF4
line 617
;617:	self->s.angles[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 0
ASGNF4
line 618
;618:	LookAtKiller (self, inflictor, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 LookAtKiller
CALLV
pop
line 620
;619:
;620:	VectorCopy( self->s.angles, self->client->ps.viewangles );
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 622
;621:
;622:	self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 624
;623:
;624:	self->r.maxs[2] = -8;
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
CNSTF4 3238002688
ASGNF4
line 628
;625:
;626:	// don't allow respawn until the death anim is done
;627:	// g_forcerespawn may force spawning at some later time
;628:	self->client->respawnTime = level.time + 1700;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 908
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1700
ADDI4
ASGNI4
line 631
;629:
;630:	// remove powerups
;631:	memset( self->client->ps.powerups, 0, sizeof(self->client->ps.powerups) );
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 634
;632:
;633:	// never gib in a nodrop
;634:	if ( (self->health <= GIB_HEALTH && !(contents & CONTENTS_NODROP) && g_blood.integer) || meansOfDeath == MOD_SUICIDE) {
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $235
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $235
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
NEI4 $233
LABELV $235
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $230
LABELV $233
line 636
;635:		// gib death
;636:		GibEntity( self, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 637
;637:	} else {
ADDRGP4 $231
JUMPV
LABELV $230
line 641
;638:		// normal death
;639:		static int i;
;640:
;641:		switch ( i ) {
ADDRLP4 60
ADDRGP4 $236
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $239
ADDRLP4 60
INDIRI4
CNSTI4 1
EQI4 $240
ADDRLP4 60
INDIRI4
CNSTI4 2
EQI4 $241
ADDRGP4 $237
JUMPV
LABELV $239
line 643
;642:		case 0:
;643:			anim = BOTH_DEATH1;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 644
;644:			break;
ADDRGP4 $238
JUMPV
LABELV $240
line 646
;645:		case 1:
;646:			anim = BOTH_DEATH2;
ADDRLP4 24
CNSTI4 2
ASGNI4
line 647
;647:			break;
ADDRGP4 $238
JUMPV
LABELV $241
LABELV $237
line 650
;648:		case 2:
;649:		default:
;650:			anim = BOTH_DEATH3;
ADDRLP4 24
CNSTI4 4
ASGNI4
line 651
;651:			break;
LABELV $238
line 656
;652:		}
;653:
;654:		// for the no-blood option, we need to prevent the health
;655:		// from going to gib level
;656:		if ( self->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $242
line 657
;657:			self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
CNSTI4 -39
ASGNI4
line 658
;658:		}
LABELV $242
line 660
;659:
;660:		self->client->ps.legsAnim = 
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 128
BXORI4
ADDRLP4 24
INDIRI4
BORI4
ASGNI4
line 662
;661:			( ( self->client->ps.legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;662:		self->client->ps.torsoAnim = 
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 128
BXORI4
ADDRLP4 24
INDIRI4
BORI4
ASGNI4
line 665
;663:			( ( self->client->ps.torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;664:
;665:		G_AddEvent( self, EV_DEATH1 + i, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $236
INDIRI4
CNSTI4 58
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 668
;666:
;667:		// the body can still be gibbed
;668:		self->die = body_die;
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
ADDRGP4 body_die
ASGNP4
line 671
;669:
;670:		// globally cycle through the different death animations
;671:		i = ( i + 1 ) % 3;
ADDRLP4 72
ADDRGP4 $236
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 3
MODI4
ASGNI4
line 678
;672:
;673:#ifdef MISSIONPACK
;674:		if (self->s.eFlags & EF_KAMIKAZE) {
;675:			Kamikaze_DeathTimer( self );
;676:		}
;677:#endif
;678:	}
LABELV $231
line 680
;679:
;680:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 682
;681:
;682:}
LABELV $170
endproc player_die 80 28
export CheckArmor
proc CheckArmor 20 4
line 691
;683:
;684:
;685:/*
;686:================
;687:CheckArmor
;688:================
;689:*/
;690:int CheckArmor (gentity_t *ent, int damage, int dflags)
;691:{
line 696
;692:	gclient_t	*client;
;693:	int			save;
;694:	int			count;
;695:
;696:	if (!damage)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $245
line 697
;697:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $244
JUMPV
LABELV $245
line 699
;698:
;699:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ASGNP4
line 701
;700:
;701:	if (!client)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $247
line 702
;702:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $244
JUMPV
LABELV $247
line 704
;703:
;704:	if (dflags & DAMAGE_NO_ARMOR)
ADDRFP4 8
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $249
line 705
;705:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $244
JUMPV
LABELV $249
line 708
;706:
;707:	// armor
;708:	count = client->ps.stats[STAT_ARMOR];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 709
;709:	save = ceil( damage * ARMOR_PROTECTION );
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1059648963
MULF4
ARGF4
ADDRLP4 12
ADDRGP4 ceil
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 710
;710:	if (save >= count)
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $251
line 711
;711:		save = count;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $251
line 713
;712:
;713:	if (!save)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $253
line 714
;714:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $244
JUMPV
LABELV $253
line 716
;715:
;716:	client->ps.stats[STAT_ARMOR] -= save;
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 718
;717:
;718:	return save;
ADDRLP4 0
INDIRI4
RETI4
LABELV $244
endproc CheckArmor 20 4
export RaySphereIntersections
proc RaySphereIntersections 56 4
line 726
;719:}
;720:
;721:/*
;722:================
;723:RaySphereIntersections
;724:================
;725:*/
;726:int RaySphereIntersections( vec3_t origin, float radius, vec3_t point, vec3_t dir, vec3_t intersections[2] ) {
line 735
;727:	float b, c, d, t;
;728:
;729:	//	| origin - (point + t * dir) | = radius
;730:	//	a = dir[0]^2 + dir[1]^2 + dir[2]^2;
;731:	//	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
;732:	//	c = (point[0] - origin[0])^2 + (point[1] - origin[1])^2 + (point[2] - origin[2])^2 - radius^2;
;733:
;734:	// normalize dir so a = 1
;735:	VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 736
;736:	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
ADDRLP4 16
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
INDIRF4
SUBF4
MULF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
CNSTF4 1073741824
MULF4
ASGNF4
line 737
;737:	c = (point[0] - origin[0]) * (point[0] - origin[0]) +
ADDRLP4 28
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 40
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
SUBF4
ASGNF4
line 742
;738:		(point[1] - origin[1]) * (point[1] - origin[1]) +
;739:		(point[2] - origin[2]) * (point[2] - origin[2]) -
;740:		radius * radius;
;741:
;742:	d = b * b - 4 * c;
ADDRLP4 8
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
CNSTF4 1082130432
MULF4
SUBF4
ASGNF4
line 743
;743:	if (d > 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $256
line 744
;744:		t = (- b + sqrt(d)) / 2;
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 48
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ASGNF4
line 745
;745:		VectorMA(point, t, dir, intersections[0]);
ADDRFP4 16
INDIRP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 746
;746:		t = (- b - sqrt(d)) / 2;
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 52
INDIRF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 747
;747:		VectorMA(point, t, dir, intersections[1]);
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 748
;748:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $255
JUMPV
LABELV $256
line 750
;749:	}
;750:	else if (d == 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $258
line 751
;751:		t = (- b ) / 2;
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
CNSTF4 1056964608
MULF4
ASGNF4
line 752
;752:		VectorMA(point, t, dir, intersections[0]);
ADDRFP4 16
INDIRP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 753
;753:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $255
JUMPV
LABELV $258
line 755
;754:	}
;755:	return 0;
CNSTI4 0
RETI4
LABELV $255
endproc RaySphereIntersections 56 4
export G_Damage
proc G_Damage 72 24
line 822
;756:}
;757:
;758:#ifdef MISSIONPACK
;759:/*
;760:================
;761:G_InvulnerabilityEffect
;762:================
;763:*/
;764:int G_InvulnerabilityEffect( gentity_t *targ, vec3_t dir, vec3_t point, vec3_t impactpoint, vec3_t bouncedir ) {
;765:	gentity_t	*impact;
;766:	vec3_t		intersections[2], vec;
;767:	int			n;
;768:
;769:	if ( !targ->client ) {
;770:		return qfalse;
;771:	}
;772:	VectorCopy(dir, vec);
;773:	VectorInverse(vec);
;774:	// sphere model radius = 42 units
;775:	n = RaySphereIntersections( targ->client->ps.origin, 42, point, vec, intersections);
;776:	if (n > 0) {
;777:		impact = G_TempEntity( targ->client->ps.origin, EV_INVUL_IMPACT );
;778:		VectorSubtract(intersections[0], targ->client->ps.origin, vec);
;779:		vectoangles(vec, impact->s.angles);
;780:		impact->s.angles[0] += 90;
;781:		if (impact->s.angles[0] > 360)
;782:			impact->s.angles[0] -= 360;
;783:		if ( impactpoint ) {
;784:			VectorCopy( intersections[0], impactpoint );
;785:		}
;786:		if ( bouncedir ) {
;787:			VectorCopy( vec, bouncedir );
;788:			VectorNormalize( bouncedir );
;789:		}
;790:		return qtrue;
;791:	}
;792:	else {
;793:		return qfalse;
;794:	}
;795:}
;796:#endif
;797:/*
;798:============
;799:G_Damage
;800:
;801:targ		entity that is being damaged
;802:inflictor	entity that is causing the damage
;803:attacker	entity that caused the inflictor to damage targ
;804:	example: targ=monster, inflictor=rocket, attacker=player
;805:
;806:dir			direction of the attack for knockback
;807:point		point at which the damage is being inflicted, used for headshots
;808:damage		amount of damage being inflicted
;809:knockback	force to be applied against targ as a result of the damage
;810:
;811:inflictor, attacker, dir, and point can be NULL for environmental effects
;812:
;813:dflags		these flags are used to control how T_Damage works
;814:	DAMAGE_RADIUS			damage was indirect (from a nearby explosion)
;815:	DAMAGE_NO_ARMOR			armor does not protect from this damage
;816:	DAMAGE_NO_KNOCKBACK		do not affect velocity, just view angles
;817:	DAMAGE_NO_PROTECTION	kills godmode, armor, everything
;818:============
;819:*/
;820:
;821:void G_Damage( gentity_t *targ, gentity_t *inflictor, gentity_t *attacker,
;822:			   vec3_t dir, vec3_t point, int damage, int dflags, int mod ) {
line 832
;823:	gclient_t	*client;
;824:	int			take;
;825:	int			asave;
;826:	int			knockback;
;827:	int			max;
;828:#ifdef MISSIONPACK
;829:	vec3_t		bouncedir, impactpoint;
;830:#endif
;831:
;832:	if (!targ->takedamage) {
ADDRFP4 0
INDIRP4
CNSTI4 1232
ADDP4
INDIRI4
CNSTI4 0
NEI4 $261
line 833
;833:		return;
ADDRGP4 $260
JUMPV
LABELV $261
line 838
;834:	}
;835:
;836:	// the intermission has already been qualified for, so don't
;837:	// allow any extra scoring
;838:	if ( level.intermissionQueued ) {
ADDRGP4 level+7600
INDIRI4
CNSTI4 0
EQI4 $263
line 839
;839:		return;
ADDRGP4 $260
JUMPV
LABELV $263
line 851
;840:	}
;841:#ifdef MISSIONPACK
;842:	if ( targ->client && mod != MOD_JUICED) {
;843:		if ( targ->client->invulnerabilityTime > level.time) {
;844:			if ( dir && point ) {
;845:				G_InvulnerabilityEffect( targ, dir, point, impactpoint, bouncedir );
;846:			}
;847:			return;
;848:		}
;849:	}
;850:#endif
;851:	if ( !inflictor ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $266
line 852
;852:		inflictor = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 4
ADDRGP4 g_entities+1340864
ASGNP4
line 853
;853:	}
LABELV $266
line 854
;854:	if ( !attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $269
line 855
;855:		attacker = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 8
ADDRGP4 g_entities+1340864
ASGNP4
line 856
;856:	}
LABELV $269
line 859
;857:
;858:	// shootable doors / buttons don't actually have any health
;859:	if ( targ->s.eType == ET_MOVER ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 4
NEI4 $272
line 860
;860:		if ( targ->use && targ->moverState == MOVER_POS1 ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1204
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $260
ADDRLP4 20
INDIRP4
CNSTI4 1072
ADDP4
INDIRI4
CNSTI4 0
NEI4 $260
line 861
;861:			targ->use( targ, inflictor, attacker );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 1204
ADDP4
INDIRP4
CALLV
pop
line 862
;862:		}
line 863
;863:		return;
ADDRGP4 $260
JUMPV
LABELV $272
line 872
;864:	}
;865:#ifdef MISSIONPACK
;866:	if( g_gametype.integer == GT_OBELISK && CheckObeliskAttack( targ, attacker ) ) {
;867:		return;
;868:	}
;869:#endif
;870:	// reduce damage by the attacker's handicap value
;871:	// unless they are rocket jumping
;872:	if ( attacker->client && attacker != targ ) {
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $276
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $276
line 873
;873:		max = attacker->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 16
ADDRFP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 879
;874:#ifdef MISSIONPACK
;875:		if( bg_itemlist[attacker->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;876:			max /= 2;
;877:		}
;878:#endif
;879:		damage = damage * max / 100;
ADDRFP4 20
ADDRFP4 20
INDIRI4
ADDRLP4 16
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 880
;880:	}
LABELV $276
line 882
;881:
;882:	client = targ->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ASGNP4
line 884
;883:
;884:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $278
line 885
;885:		if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
CNSTI4 0
EQI4 $280
line 886
;886:			return;
ADDRGP4 $260
JUMPV
LABELV $280
line 888
;887:		}
;888:	}
LABELV $278
line 890
;889:
;890:	if ( !dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $282
line 891
;891:		dflags |= DAMAGE_NO_KNOCKBACK;
ADDRFP4 24
ADDRFP4 24
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 892
;892:	} else {
ADDRGP4 $283
JUMPV
LABELV $282
line 893
;893:		VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 894
;894:	}
LABELV $283
line 896
;895:
;896:	knockback = damage;
ADDRLP4 4
ADDRFP4 20
INDIRI4
ASGNI4
line 897
;897:	if ( knockback > 200 ) {
ADDRLP4 4
INDIRI4
CNSTI4 200
LEI4 $284
line 898
;898:		knockback = 200;
ADDRLP4 4
CNSTI4 200
ASGNI4
line 899
;899:	}
LABELV $284
line 900
;900:	if ( targ->flags & FL_NO_KNOCKBACK ) {
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $286
line 901
;901:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 902
;902:	}
LABELV $286
line 903
;903:	if ( dflags & DAMAGE_NO_KNOCKBACK ) {
ADDRFP4 24
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $288
line 904
;904:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 905
;905:	}
LABELV $288
line 908
;906:
;907:	// figure momentum add, even if the damage won't be taken
;908:	if ( knockback && targ->client ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $290
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $290
line 912
;909:		vec3_t	kvel;
;910:		float	mass;
;911:
;912:		mass = 200;
ADDRLP4 36
CNSTF4 1128792064
ASGNF4
line 914
;913:
;914:		VectorScale (dir, g_knockback.value * (float)knockback / mass, kvel);
ADDRLP4 40
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 48
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 40
INDIRP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDRLP4 48
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDRLP4 48
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 24+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDRLP4 36
INDIRF4
DIVF4
MULF4
ASGNF4
line 915
;915:		VectorAdd (targ->client->ps.velocity, kvel, targ->client->ps.velocity);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDF4
ASGNF4
line 919
;916:
;917:		// set the timer so that the other client can't cancel
;918:		// out the movement immediately
;919:		if ( !targ->client->ps.pm_time ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $299
line 922
;920:			int		t;
;921:
;922:			t = knockback * 2;
ADDRLP4 64
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 923
;923:			if ( t < 50 ) {
ADDRLP4 64
INDIRI4
CNSTI4 50
GEI4 $301
line 924
;924:				t = 50;
ADDRLP4 64
CNSTI4 50
ASGNI4
line 925
;925:			}
LABELV $301
line 926
;926:			if ( t > 200 ) {
ADDRLP4 64
INDIRI4
CNSTI4 200
LEI4 $303
line 927
;927:				t = 200;
ADDRLP4 64
CNSTI4 200
ASGNI4
line 928
;928:			}
LABELV $303
line 929
;929:			targ->client->ps.pm_time = t;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 930
;930:			targ->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 931
;931:		}
LABELV $299
line 932
;932:	}
LABELV $290
line 935
;933:
;934:	// check for completely getting out of the damage
;935:	if ( !(dflags & DAMAGE_NO_PROTECTION) ) {
ADDRFP4 24
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $305
line 942
;936:
;937:		// if TF_NO_FRIENDLY_FIRE is set, don't do damage to the target
;938:		// if the attacker was on the same team
;939:#ifdef MISSIONPACK
;940:		if ( mod != MOD_JUICED && targ != attacker && !(dflags & DAMAGE_NO_TEAM_PROTECTION) && OnSameTeam (targ, attacker)  ) {
;941:#else	
;942:		if ( targ != attacker && OnSameTeam (targ, attacker)  ) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRP4
CVPU4 4
EQU4 $307
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $307
line 944
;943:#endif
;944:			if ( !g_friendlyFire.integer ) {
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $309
line 945
;945:				return;
ADDRGP4 $260
JUMPV
LABELV $309
line 947
;946:			}
;947:		}
LABELV $307
line 960
;948:#ifdef MISSIONPACK
;949:		if (mod == MOD_PROXIMITY_MINE) {
;950:			if (inflictor && inflictor->parent && OnSameTeam(targ, inflictor->parent)) {
;951:				return;
;952:			}
;953:			if (targ == attacker) {
;954:				return;
;955:			}
;956:		}
;957:#endif
;958:
;959:		// check for godmode
;960:		if ( targ->flags & FL_GODMODE ) {
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $312
line 961
;961:			return;
ADDRGP4 $260
JUMPV
LABELV $312
line 963
;962:		}
;963:	}
LABELV $305
line 967
;964:
;965:	// battlesuit protects from all radius damage (but takes knockback)
;966:	// and protects 50% against all damage
;967:	if ( client && client->ps.powerups[PW_BATTLESUIT] ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $314
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
CNSTI4 0
EQI4 $314
line 968
;968:		G_AddEvent( targ, EV_POWERUP_BATTLESUIT, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 63
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 969
;969:		if ( ( dflags & DAMAGE_RADIUS ) || ( mod == MOD_FALLING ) ) {
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $318
ADDRFP4 28
INDIRI4
CNSTI4 19
NEI4 $316
LABELV $318
line 970
;970:			return;
ADDRGP4 $260
JUMPV
LABELV $316
line 972
;971:		}
;972:		damage *= 0.5;
ADDRFP4 20
ADDRFP4 20
INDIRI4
CVIF4 4
CNSTF4 1056964608
MULF4
CVFI4 4
ASGNI4
line 973
;973:	}
LABELV $314
line 977
;974:
;975:	// always give half damage if hurting self
;976:	// calculated after knockback, so rocket jumping works
;977:	if ( targ == attacker) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $319
line 978
;978:		damage *= 0.5;
ADDRFP4 20
ADDRFP4 20
INDIRI4
CVIF4 4
CNSTF4 1056964608
MULF4
CVFI4 4
ASGNI4
line 979
;979:	}
LABELV $319
line 981
;980:
;981:	if ( damage < 1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
GEI4 $321
line 982
;982:		damage = 1;
ADDRFP4 20
CNSTI4 1
ASGNI4
line 983
;983:	}
LABELV $321
line 984
;984:	take = damage;
ADDRLP4 8
ADDRFP4 20
INDIRI4
ASGNI4
line 987
;985:
;986:	// save some from armor
;987:	asave = CheckArmor( targ, take, dflags );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 CheckArmor
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 989
;988:
;989:	take -= asave;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 991
;990:
;991:	if ( g_debugDamage.integer ) {
ADDRGP4 g_debugDamage+12
INDIRI4
CNSTI4 0
EQI4 $323
line 992
;992:		G_Printf( "%i: client:%i health:%i damage:%i armor:%i\n", level.time, targ->s.number,
ADDRGP4 $326
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 994
;993:			targ->health, take, asave );
;994:	}
LABELV $323
line 997
;995:
;996:	// add to the attacker's hit counter (if the target isn't a general entity like a prox mine)
;997:	if ( attacker->client && client && targ != attacker && targ->health > 0
ADDRLP4 32
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $328
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $328
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRP4
CVPU4 4
EQU4 $328
ADDRLP4 36
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 0
LEI4 $328
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $328
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $328
line 999
;998:			&& targ->s.eType != ET_MISSILE
;999:			&& targ->s.eType != ET_GENERAL) {
line 1010
;1000:#ifdef MISSIONPACK
;1001:		if ( OnSameTeam( targ, attacker ) ) {
;1002:			attacker->client->ps.persistant[PERS_HITS]--;
;1003:		} else {
;1004:			attacker->client->ps.persistant[PERS_HITS]++;
;1005:		}
;1006:		attacker->client->ps.persistant[PERS_ATTACKEE_ARMOR] = (targ->health<<8)|(client->ps.stats[STAT_ARMOR]);
;1007:#else
;1008:		// we may hit multiple targets from different teams
;1009:		// so usual PERS_HITS increments/decrements could result in ZERO delta
;1010:		if ( OnSameTeam( targ, attacker ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $330
line 1011
;1011:			attacker->client->damage.team++;
ADDRLP4 44
ADDRFP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 1724
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1012
;1012:		} else {
ADDRGP4 $331
JUMPV
LABELV $330
line 1013
;1013:			attacker->client->damage.enemy++;
ADDRLP4 44
ADDRFP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 1728
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1015
;1014:			// accumulate damage during server frame
;1015:			attacker->client->damage.amount += take + asave;
ADDRLP4 48
ADDRFP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 1732
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ADDI4
ASGNI4
line 1016
;1016:		}
LABELV $331
line 1018
;1017:#endif
;1018:	}
LABELV $328
line 1023
;1019:
;1020:	// add to the damage inflicted on a player this frame
;1021:	// the total will be turned into screen blends and view angle kicks
;1022:	// at the end of the frame
;1023:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $332
line 1024
;1024:		if ( attacker ) { // FIXME: always true?
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $334
line 1025
;1025:			client->ps.persistant[PERS_ATTACKER] = attacker->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1026
;1026:		} else {
ADDRGP4 $335
JUMPV
LABELV $334
line 1027
;1027:			client->ps.persistant[PERS_ATTACKER] = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 1022
ASGNI4
line 1028
;1028:		}
LABELV $335
line 1029
;1029:		client->damage_armor += asave;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 856
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 1030
;1030:		client->damage_blood += take;
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 860
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 1031
;1031:		client->damage_knockback += knockback;
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 864
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1032
;1032:		if ( dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $336
line 1033
;1033:			VectorCopy ( dir, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 1034
;1034:			client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 880
ADDP4
CNSTI4 0
ASGNI4
line 1035
;1035:		} else {
ADDRGP4 $337
JUMPV
LABELV $336
line 1036
;1036:			VectorCopy ( targ->r.currentOrigin, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 984
ADDP4
INDIRB
ASGNB 12
line 1037
;1037:			client->damage_fromWorld = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 880
ADDP4
CNSTI4 1
ASGNI4
line 1038
;1038:		}
LABELV $337
line 1039
;1039:	}
LABELV $332
line 1045
;1040:
;1041:	// See if it's the player hurting the emeny flag carrier
;1042:#ifdef MISSIONPACK
;1043:	if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_1FCTF ) {
;1044:#else	
;1045:	if( g_gametype.integer == GT_CTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $338
line 1047
;1046:#endif
;1047:		Team_CheckHurtCarrier(targ, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_CheckHurtCarrier
CALLV
pop
line 1048
;1048:	}
LABELV $338
line 1050
;1049:
;1050:	if (targ->client) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $341
line 1052
;1051:		// set the last client who damaged the target
;1052:		targ->client->lasthurt_client = attacker->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 900
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1053
;1053:		targ->client->lasthurt_mod = mod;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 904
ADDP4
ADDRFP4 28
INDIRI4
ASGNI4
line 1054
;1054:	}
LABELV $341
line 1057
;1055:
;1056:	// do the damage
;1057:	if (take) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $343
line 1058
;1058:		targ->health = targ->health - take;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1059
;1059:		if ( targ->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $345
line 1060
;1060:			targ->client->ps.stats[STAT_HEALTH] = targ->health;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 1061
;1061:		}
LABELV $345
line 1063
;1062:			
;1063:		if ( targ->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $347
line 1064
;1064:			if ( client )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $349
line 1065
;1065:				targ->flags |= FL_NO_KNOCKBACK;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
LABELV $349
line 1067
;1066:
;1067:			if (targ->health < -999)
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 -999
GEI4 $351
line 1068
;1068:				targ->health = -999;
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
CNSTI4 -999
ASGNI4
LABELV $351
line 1070
;1069:
;1070:			targ->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 1264
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1071
;1071:			targ->die (targ, inflictor, attacker, take, mod);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 1212
ADDP4
INDIRP4
CALLV
pop
line 1072
;1072:			return;
ADDRGP4 $260
JUMPV
LABELV $347
line 1073
;1073:		} else if ( targ->pain ) {
ADDRFP4 0
INDIRP4
CNSTI4 1208
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $353
line 1074
;1074:			targ->pain (targ, attacker, take);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 1208
ADDP4
INDIRP4
CALLV
pop
line 1075
;1075:		}
LABELV $353
line 1076
;1076:	}
LABELV $343
line 1078
;1077:
;1078:}
LABELV $260
endproc G_Damage 72 24
export CanDamage
proc CanDamage 144 28
line 1090
;1079:
;1080:
;1081:/*
;1082:============
;1083:CanDamage
;1084:
;1085:Returns qtrue if the inflictor can directly damage the target.  Used for
;1086:explosions and melee attacks.
;1087:============
;1088:*/
;1089:qboolean CanDamage( gentity_t *targ, vec3_t origin )
;1090:{
line 1098
;1091:	//we check if the attacker can damage the target, return qtrue if yes, qfalse if no
;1092:	vec3_t	dest;
;1093:	trace_t	tr;
;1094:	vec3_t	midpoint;
;1095:	vec3_t	size;
;1096:
;1097:	// use the midpoint of the bounds instead of the origin, because bmodels may have their origin 0,0,0
;1098:	VectorAdd (targ->r.absmin, targ->r.absmax, midpoint);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 92
INDIRP4
CNSTI4 960
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 972
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 80+4
ADDRLP4 92
INDIRP4
CNSTI4 964
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 976
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80+8
ADDRLP4 96
INDIRP4
CNSTI4 968
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 980
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1099
;1099:	VectorScale( midpoint, 0.5, dest );
ADDRLP4 0
ADDRLP4 80
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 80+4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 80+8
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1101
;1100:
;1101:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1102
;1102:	if (tr.fraction == 1.0 || tr.entityNum == targ->s.number)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
EQF4 $366
ADDRLP4 12+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $362
LABELV $366
line 1103
;1103:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $355
JUMPV
LABELV $362
line 1105
;1104:
;1105:	VectorSubtract( targ->r.absmax, targ->r.absmin, size );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 104
INDIRP4
CNSTI4 972
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
CNSTI4 960
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 104
INDIRP4
CNSTI4 976
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
CNSTI4 964
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68+8
ADDRLP4 108
INDIRP4
CNSTI4 980
ADDP4
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 968
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1111
;1106:	
;1107:	// top quad
;1108:
;1109:	// - +
;1110:	// - -
;1111:	VectorCopy( targ->r.absmax, dest );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 972
ADDP4
INDIRB
ASGNB 12
line 1112
;1112:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1113
;1113:	if (tr.fraction == 1.0)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $369
line 1114
;1114:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $355
JUMPV
LABELV $369
line 1118
;1115:
;1116:	// + -
;1117:	// - -
;1118:	dest[0] -= size[0];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 68
INDIRF4
SUBF4
ASGNF4
line 1119
;1119:	trap_Trace( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID );
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1120
;1120:	if ( tr.fraction == 1.0 )
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $372
line 1121
;1121:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $355
JUMPV
LABELV $372
line 1125
;1122:
;1123:	// - -
;1124:	// + -
;1125:	dest[1] -= size[1];
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 68+4
INDIRF4
SUBF4
ASGNF4
line 1126
;1126:	trap_Trace( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID );
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1127
;1127:	if ( tr.fraction == 1.0 )
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $377
line 1128
;1128:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $355
JUMPV
LABELV $377
line 1132
;1129:
;1130:	// - -
;1131:	// - +
;1132:	dest[0] += size[0];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 68
INDIRF4
ADDF4
ASGNF4
line 1133
;1133:	trap_Trace( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID );
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1134
;1134:	if ( tr.fraction == 1.0 )
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $380
line 1135
;1135:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $355
JUMPV
LABELV $380
line 1141
;1136:
;1137:	// bottom quad
;1138:
;1139:	// - -
;1140:	// + -
;1141:	VectorCopy( targ->r.absmin, dest );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 960
ADDP4
INDIRB
ASGNB 12
line 1142
;1142:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1143
;1143:	if (tr.fraction == 1.0)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $383
line 1144
;1144:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $355
JUMPV
LABELV $383
line 1148
;1145:
;1146:	// - -
;1147:	// - +
;1148:	dest[0] += size[0];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 68
INDIRF4
ADDF4
ASGNF4
line 1149
;1149:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1150
;1150:	if (tr.fraction == 1.0)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $386
line 1151
;1151:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $355
JUMPV
LABELV $386
line 1155
;1152:
;1153:	// - +
;1154:	// - -
;1155:	dest[1] += size[1];
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 68+4
INDIRF4
ADDF4
ASGNF4
line 1156
;1156:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1157
;1157:	if (tr.fraction == 1.0)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $391
line 1158
;1158:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $355
JUMPV
LABELV $391
line 1162
;1159:
;1160:	// + -
;1161:	// - -
;1162:	dest[0] -= size[0];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 68
INDIRF4
SUBF4
ASGNF4
line 1163
;1163:	trap_Trace( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID );
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1164
;1164:	if ( tr.fraction == 1.0 )
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $394
line 1165
;1165:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $355
JUMPV
LABELV $394
line 1167
;1166:
;1167:	return qfalse;
CNSTI4 0
RETI4
LABELV $355
endproc CanDamage 144 28
export G_RadiusDamage
proc G_RadiusDamage 4196 32
line 1177
;1168:}
;1169:
;1170:
;1171:/*
;1172:============
;1173:G_RadiusDamage
;1174:============
;1175:*/
;1176:qboolean G_RadiusDamage ( vec3_t origin, gentity_t *attacker, float damage, float radius,
;1177:					 gentity_t *ignore, int mod) {
line 1186
;1178:	float		points, dist;
;1179:	gentity_t	*ent;
;1180:	int			entityList[MAX_GENTITIES];
;1181:	int			numListedEntities;
;1182:	vec3_t		mins, maxs;
;1183:	vec3_t		v;
;1184:	vec3_t		dir;
;1185:	int			i, e;
;1186:	qboolean	hitClient = qfalse;
ADDRLP4 4168
CNSTI4 0
ASGNI4
line 1188
;1187:
;1188:	if ( radius < 1 ) {
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $398
line 1189
;1189:		radius = 1;
ADDRFP4 12
CNSTF4 1065353216
ASGNF4
line 1190
;1190:	}
LABELV $398
line 1192
;1191:
;1192:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $400
line 1193
;1193:		mins[i] = origin[i] - radius;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4144
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
SUBF4
ASGNF4
line 1194
;1194:		maxs[i] = origin[i] + radius;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4156
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ASGNF4
line 1195
;1195:	}
LABELV $401
line 1192
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $400
line 1197
;1196:
;1197:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
ADDRLP4 4144
ARGP4
ADDRLP4 4156
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4172
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4140
ADDRLP4 4172
INDIRI4
ASGNI4
line 1199
;1198:
;1199:	for ( e = 0 ; e < numListedEntities ; e++ ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $407
JUMPV
LABELV $404
line 1200
;1200:		ent = &g_entities[entityList[ e ]];
ADDRLP4 4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 44
ADDP4
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1202
;1201:
;1202:		if (ent == ignore)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 16
INDIRP4
CVPU4 4
NEU4 $408
line 1203
;1203:			continue;
ADDRGP4 $405
JUMPV
LABELV $408
line 1204
;1204:		if (!ent->takedamage)
ADDRLP4 4
INDIRP4
CNSTI4 1232
ADDP4
INDIRI4
CNSTI4 0
NEI4 $410
line 1205
;1205:			continue;
ADDRGP4 $405
JUMPV
LABELV $410
line 1208
;1206:
;1207:		// find the distance from the edge of the bounding box
;1208:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $412
line 1209
;1209:			if ( origin[i] < ent->r.absmin[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 960
ADDP4
ADDP4
INDIRF4
GEF4 $416
line 1210
;1210:				v[i] = ent->r.absmin[i] - origin[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 960
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1211
;1211:			} else if ( origin[i] > ent->r.absmax[i] ) {
ADDRGP4 $417
JUMPV
LABELV $416
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 972
ADDP4
ADDP4
INDIRF4
LEF4 $418
line 1212
;1212:				v[i] = origin[i] - ent->r.absmax[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 972
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1213
;1213:			} else {
ADDRGP4 $419
JUMPV
LABELV $418
line 1214
;1214:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 1215
;1215:			}
LABELV $419
LABELV $417
line 1216
;1216:		}
LABELV $413
line 1208
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $412
line 1218
;1217:
;1218:		dist = VectorLength( v );
ADDRLP4 8
ARGP4
ADDRLP4 4176
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 4176
INDIRF4
ASGNF4
line 1219
;1219:		if ( dist >= radius ) {
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
LTF4 $420
line 1220
;1220:			continue;
ADDRGP4 $405
JUMPV
LABELV $420
line 1223
;1221:		}
;1222:
;1223:		points = damage * ( 1.0 - dist / radius );
ADDRLP4 40
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
DIVF4
SUBF4
MULF4
ASGNF4
line 1225
;1224:
;1225:		if( CanDamage (ent, origin) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4180
ADDRGP4 CanDamage
CALLI4
ASGNI4
ADDRLP4 4180
INDIRI4
CNSTI4 0
EQI4 $422
line 1226
;1226:			if( LogAccuracyHit( ent, attacker ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4184
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 4184
INDIRI4
CNSTI4 0
EQI4 $424
line 1227
;1227:				hitClient = qtrue;
ADDRLP4 4168
CNSTI4 1
ASGNI4
line 1228
;1228:			}
LABELV $424
line 1229
;1229:			VectorSubtract (ent->r.currentOrigin, origin, dir);
ADDRLP4 4192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 4
INDIRP4
CNSTI4 984
ADDP4
INDIRF4
ADDRLP4 4192
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 4
INDIRP4
CNSTI4 988
ADDP4
INDIRF4
ADDRLP4 4192
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 4
INDIRP4
CNSTI4 992
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1232
;1230:			// push the center of mass higher than the origin so players
;1231:			// get knocked into the air more
;1232:			dir[2] += 24;
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 1233
;1233:			G_Damage (ent, NULL, attacker, dir, origin, (int)points, DAMAGE_RADIUS, mod);
ADDRLP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRF4
CVFI4 4
ARGI4
CNSTI4 1
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1234
;1234:		}
LABELV $422
line 1235
;1235:	}
LABELV $405
line 1199
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $407
ADDRLP4 20
INDIRI4
ADDRLP4 4140
INDIRI4
LTI4 $404
line 1237
;1236:
;1237:	return hitClient;
ADDRLP4 4168
INDIRI4
RETI4
LABELV $397
endproc G_RadiusDamage 4196 32
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
import G_InvulnerabilityEffect
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
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import SpawnTime
import RespawnItem
import G_RunItem
import G_CheckTeamItems
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
LABELV $326
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 58
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $190
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $189
byte 1 60
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 111
byte 1 98
byte 1 105
byte 1 116
byte 1 117
byte 1 97
byte 1 114
byte 1 121
byte 1 62
byte 1 0
align 1
LABELV $183
byte 1 60
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 62
byte 1 0
align 1
LABELV $182
byte 1 60
byte 1 110
byte 1 111
byte 1 110
byte 1 45
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 62
byte 1 0
align 1
LABELV $161
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $160
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $140
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
byte 1 0
align 1
LABELV $139
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
byte 1 0
align 1
LABELV $128
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 80
byte 1 76
byte 1 69
byte 1 0
align 1
LABELV $127
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 95
byte 1 72
byte 1 85
byte 1 82
byte 1 84
byte 1 0
align 1
LABELV $126
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 65
byte 1 82
byte 1 71
byte 1 69
byte 1 84
byte 1 95
byte 1 76
byte 1 65
byte 1 83
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $125
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 85
byte 1 73
byte 1 67
byte 1 73
byte 1 68
byte 1 69
byte 1 0
align 1
LABELV $124
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $123
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 70
byte 1 82
byte 1 65
byte 1 71
byte 1 0
align 1
LABELV $122
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 67
byte 1 82
byte 1 85
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $121
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 76
byte 1 65
byte 1 86
byte 1 65
byte 1 0
align 1
LABELV $120
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 76
byte 1 73
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $119
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $118
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 70
byte 1 71
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $117
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $116
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 76
byte 1 73
byte 1 71
byte 1 72
byte 1 84
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $115
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 65
byte 1 73
byte 1 76
byte 1 71
byte 1 85
byte 1 78
byte 1 0
align 1
LABELV $114
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 77
byte 1 65
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $113
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 77
byte 1 65
byte 1 0
align 1
LABELV $112
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $111
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 0
align 1
LABELV $110
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 68
byte 1 69
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $109
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 68
byte 1 69
byte 1 0
align 1
LABELV $108
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 77
byte 1 65
byte 1 67
byte 1 72
byte 1 73
byte 1 78
byte 1 69
byte 1 71
byte 1 85
byte 1 78
byte 1 0
align 1
LABELV $107
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 76
byte 1 69
byte 1 84
byte 1 0
align 1
LABELV $106
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 84
byte 1 71
byte 1 85
byte 1 78
byte 1 0
align 1
LABELV $105
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 85
byte 1 78
byte 1 75
byte 1 78
byte 1 79
byte 1 87
byte 1 78
byte 1 0
