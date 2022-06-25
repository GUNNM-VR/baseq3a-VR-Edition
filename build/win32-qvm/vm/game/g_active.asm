export P_DamageFeedback
code
proc P_DamageFeedback 36 12
file "..\..\..\..\code\game\g_active.c"
line 17
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:
;6:
;7:/*
;8:===============
;9:G_DamageFeedback
;10:
;11:Called just before a snapshot is sent to the given player.
;12:Totals up all damage and generates both the player_state_t
;13:damage values to that client for pain blends and kicks, and
;14:global pain sound events for all clients.
;15:===============
;16:*/
;17:void P_DamageFeedback( gentity_t *player ) {
line 22
;18:	gclient_t	*client;
;19:	float	count;
;20:	vec3_t	angles;
;21:
;22:	client = player->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ASGNP4
line 23
;23:	if ( client->ps.pm_type == PM_DEAD ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $55
line 24
;24:		return;
ADDRGP4 $54
JUMPV
LABELV $55
line 28
;25:	}
;26:
;27:	// total points of damage shot at the player this frame
;28:	count = client->damage_blood + client->damage_armor;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 29
;29:	if ( count == 0 ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $57
line 30
;30:		return;		// didn't take any damage
ADDRGP4 $54
JUMPV
LABELV $57
line 33
;31:	}
;32:
;33:	if ( count > 255 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1132396544
LEF4 $59
line 34
;34:		count = 255;
ADDRLP4 4
CNSTF4 1132396544
ASGNF4
line 35
;35:	}
LABELV $59
line 41
;36:
;37:	// send the information to the client
;38:
;39:	// world damage (falling, slime, etc) uses a special code
;40:	// to make the blend blob centered instead of positional
;41:	if ( client->damage_fromWorld ) {
ADDRLP4 0
INDIRP4
CNSTI4 880
ADDP4
INDIRI4
CNSTI4 0
EQI4 $61
line 42
;42:		client->ps.damagePitch = 255;
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 255
ASGNI4
line 43
;43:		client->ps.damageYaw = 255;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTI4 255
ASGNI4
line 45
;44:
;45:		client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 880
ADDP4
CNSTI4 0
ASGNI4
line 46
;46:	} else {
ADDRGP4 $62
JUMPV
LABELV $61
line 47
;47:		vectoangles( client->damage_from, angles );
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 48
;48:		client->ps.damagePitch = angles[PITCH]/360.0 * 256;
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
ADDRLP4 8
INDIRF4
CNSTF4 1060506465
MULF4
CVFI4 4
ASGNI4
line 49
;49:		client->ps.damageYaw = angles[YAW]/360.0 * 256;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRLP4 8+4
INDIRF4
CNSTF4 1060506465
MULF4
CVFI4 4
ASGNI4
line 50
;50:	}
LABELV $62
line 53
;51:
;52:	// play an appropriate pain sound
;53:	if ( (level.time > player->pain_debounce_time) && !(player->flags & FL_GODMODE) ) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
LEI4 $64
ADDRLP4 24
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $64
line 54
;54:		player->pain_debounce_time = level.time + 700;
ADDRFP4 0
INDIRP4
CNSTI4 1216
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 700
ADDI4
ASGNI4
line 55
;55:		G_AddEvent( player, EV_PAIN, player->health );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 57
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 56
;56:		client->ps.damageEvent++;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 57
;57:	}
LABELV $64
line 60
;58:
;59:
;60:	client->ps.damageCount = count;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 65
;61:
;62:	//
;63:	// clear totals
;64:	//
;65:	client->damage_blood = 0;
ADDRLP4 0
INDIRP4
CNSTI4 860
ADDP4
CNSTI4 0
ASGNI4
line 66
;66:	client->damage_armor = 0;
ADDRLP4 0
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 0
ASGNI4
line 67
;67:	client->damage_knockback = 0;
ADDRLP4 0
INDIRP4
CNSTI4 864
ADDP4
CNSTI4 0
ASGNI4
line 68
;68:}
LABELV $54
endproc P_DamageFeedback 36 12
export P_WorldEffects
proc P_WorldEffects 24 32
line 79
;69:
;70:
;71:
;72:/*
;73:=============
;74:P_WorldEffects
;75:
;76:Check for lava / slime contents and drowning
;77:=============
;78:*/
;79:void P_WorldEffects( gentity_t *ent ) {
line 83
;80:	qboolean	envirosuit;
;81:	int			waterlevel;
;82:
;83:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
CNSTI4 0
EQI4 $69
line 84
;84:		ent->client->airOutTime = level.time + 12000;	// don't need air
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 924
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 85
;85:		return;
ADDRGP4 $68
JUMPV
LABELV $69
line 88
;86:	}
;87:
;88:	waterlevel = ent->waterlevel;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1284
ADDP4
INDIRI4
ASGNI4
line 90
;89:
;90:	envirosuit = ent->client->ps.powerups[PW_BATTLESUIT] > level.time;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $74
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $75
JUMPV
LABELV $74
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $75
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 95
;91:
;92:	//
;93:	// check for drowning
;94:	//
;95:	if ( waterlevel == 3 ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $76
line 97
;96:		// envirosuit give air
;97:		if ( envirosuit ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $78
line 98
;98:			ent->client->airOutTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 924
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 99
;99:		}
LABELV $78
line 102
;100:
;101:		// if out of air, start drowning
;102:		if ( ent->client->airOutTime < level.time) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 924
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $77
line 104
;103:			// drown!
;104:			ent->client->airOutTime += 1000;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 924
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 105
;105:			if ( ent->health > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 0
LEI4 $77
line 107
;106:				// take more damage the longer underwater
;107:				ent->damage += 2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 1236
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 108
;108:				if (ent->damage > 15)
ADDRFP4 0
INDIRP4
CNSTI4 1236
ADDP4
INDIRI4
CNSTI4 15
LEI4 $86
line 109
;109:					ent->damage = 15;
ADDRFP4 0
INDIRP4
CNSTI4 1236
ADDP4
CNSTI4 15
ASGNI4
LABELV $86
line 112
;110:
;111:				// don't play a normal pain sound
;112:				ent->pain_debounce_time = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 1216
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 114
;113:
;114:				G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 1236
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 14
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 116
;115:					ent->damage, DAMAGE_NO_ARMOR, MOD_WATER);
;116:			}
line 117
;117:		}
line 118
;118:	} else {
ADDRGP4 $77
JUMPV
LABELV $76
line 119
;119:		ent->client->airOutTime = level.time + 12000;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 924
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 120
;120:		ent->damage = 2;
ADDRFP4 0
INDIRP4
CNSTI4 1236
ADDP4
CNSTI4 2
ASGNI4
line 121
;121:	}
LABELV $77
line 126
;122:
;123:	//
;124:	// check for sizzle damage (move to pmove?)
;125:	//
;126:	if (waterlevel && 
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $90
ADDRFP4 0
INDIRP4
CNSTI4 1280
ADDP4
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
EQI4 $90
line 127
;127:		(ent->watertype&(CONTENTS_LAVA|CONTENTS_SLIME)) ) {
line 128
;128:		if (ent->health > 0
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 0
LEI4 $92
ADDRLP4 12
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GTI4 $92
line 129
;129:			&& ent->pain_debounce_time <= level.time	) {
line 131
;130:
;131:			if ( envirosuit ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $95
line 132
;132:				G_AddEvent( ent, EV_POWERUP_BATTLESUIT, 0 );
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
line 133
;133:			} else {
ADDRGP4 $96
JUMPV
LABELV $95
line 134
;134:				if (ent->watertype & CONTENTS_LAVA) {
ADDRFP4 0
INDIRP4
CNSTI4 1280
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $97
line 135
;135:					G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 30
MULI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 137
;136:						30*waterlevel, 0, MOD_LAVA);
;137:				}
LABELV $97
line 139
;138:
;139:				if (ent->watertype & CONTENTS_SLIME) {
ADDRFP4 0
INDIRP4
CNSTI4 1280
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $99
line 140
;140:					G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
MULI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 15
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 142
;141:						10*waterlevel, 0, MOD_SLIME);
;142:				}
LABELV $99
line 143
;143:			}
LABELV $96
line 144
;144:		}
LABELV $92
line 145
;145:	}
LABELV $90
line 146
;146:}
LABELV $68
endproc P_WorldEffects 24 32
export G_SetClientSound
proc G_SetClientSound 4 0
line 155
;147:
;148:
;149:
;150:/*
;151:===============
;152:G_SetClientSound
;153:===============
;154:*/
;155:void G_SetClientSound( gentity_t *ent ) {
line 162
;156:#ifdef MISSIONPACK
;157:	if( ent->s.eFlags & EF_TICKING ) {
;158:		ent->client->ps.loopSound = G_SoundIndex( "sound/weapons/proxmine/wstbtick.wav");
;159:	}
;160:	else
;161:#endif
;162:	if (ent->waterlevel && (ent->watertype&(CONTENTS_LAVA|CONTENTS_SLIME)) ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1284
ADDP4
INDIRI4
CNSTI4 0
EQI4 $102
ADDRLP4 0
INDIRP4
CNSTI4 1280
ADDP4
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
EQI4 $102
line 163
;163:		ent->client->ps.loopSound = level.snd_fry;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 level+352
INDIRI4
ASGNI4
line 164
;164:	} else {
ADDRGP4 $103
JUMPV
LABELV $102
line 165
;165:		ent->client->ps.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 444
ADDP4
CNSTI4 0
ASGNI4
line 166
;166:	}
LABELV $103
line 167
;167:}
LABELV $101
endproc G_SetClientSound 4 0
export ClientImpacts
proc ClientImpacts 76 12
line 178
;168:
;169:
;170:
;171://==============================================================
;172:
;173:/*
;174:==============
;175:ClientImpacts
;176:==============
;177:*/
;178:void ClientImpacts( gentity_t *ent, pmove_t *pm ) {
line 183
;179:	int		i, j;
;180:	trace_t	trace;
;181:	gentity_t	*other;
;182:
;183:	memset( &trace, 0, sizeof( trace ) );
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 184
;184:	for (i=0 ; i<pm->numtouch ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $109
JUMPV
LABELV $106
line 185
;185:		for (j=0 ; j<i ; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $113
JUMPV
LABELV $110
line 186
;186:			if (pm->touchents[j] == pm->touchents[i] ) {
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
INDIRP4
CNSTI4 124
ADDP4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
INDIRP4
CNSTI4 124
ADDP4
ADDP4
INDIRI4
NEI4 $114
line 187
;187:				break;
ADDRGP4 $112
JUMPV
LABELV $114
line 189
;188:			}
;189:		}
LABELV $111
line 185
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $113
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $110
LABELV $112
line 190
;190:		if (j != i) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $116
line 191
;191:			continue;	// duplicated
ADDRGP4 $107
JUMPV
LABELV $116
line 193
;192:		}
;193:		other = &g_entities[ pm->touchents[i] ];
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 124
ADDP4
ADDP4
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 195
;194:
;195:		if ( ( ent->r.svFlags & SVF_BOT ) && ( ent->touch ) ) {
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $118
ADDRLP4 68
INDIRP4
CNSTI4 1200
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $118
line 196
;196:			ent->touch( ent, other, &trace );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 1200
ADDP4
INDIRP4
CALLV
pop
line 197
;197:		}
LABELV $118
line 199
;198:
;199:		if ( !other->touch ) {
ADDRLP4 8
INDIRP4
CNSTI4 1200
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $120
line 200
;200:			continue;
ADDRGP4 $107
JUMPV
LABELV $120
line 203
;201:		}
;202:
;203:		other->touch( other, ent, &trace );
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1200
ADDP4
INDIRP4
CALLV
pop
line 204
;204:	}
LABELV $107
line 184
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $109
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
LTI4 $106
line 206
;205:
;206:}
LABELV $105
endproc ClientImpacts 76 12
data
align 4
LABELV $123
byte 4 1109393408
byte 4 1109393408
byte 4 1112539136
export G_TouchTriggers
code
proc G_TouchTriggers 4224 16
line 216
;207:
;208:/*
;209:============
;210:G_TouchTriggers
;211:
;212:Find all trigger entities that ent's current position touches.
;213:Spectators will only interact with teleporters.
;214:============
;215:*/
;216:void	G_TouchTriggers( gentity_t *ent ) {
line 224
;217:	int			i, num;
;218:	int			touch[MAX_GENTITIES];
;219:	gentity_t	*hit;
;220:	trace_t		trace;
;221:	vec3_t		mins, maxs;
;222:	static vec3_t	range = { 40, 40, 52 };
;223:
;224:	if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $124
line 225
;225:		return;
ADDRGP4 $122
JUMPV
LABELV $124
line 229
;226:	}
;227:
;228:	// dead clients don't activate triggers!
;229:	if ( ent->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $126
line 230
;230:		return;
ADDRGP4 $122
JUMPV
LABELV $126
line 233
;231:	}
;232:
;233:	VectorSubtract( ent->client->ps.origin, range, mins );
ADDRLP4 4188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 4188
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 $123
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 4188
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 $123+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+8
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 $123+8
INDIRF4
SUBF4
ASGNF4
line 234
;234:	VectorAdd( ent->client->ps.origin, range, maxs );
ADDRLP4 4192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
ADDRLP4 4192
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 $123
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 4192
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 $123+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+8
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 $123+8
INDIRF4
ADDF4
ASGNF4
line 236
;235:
;236:	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 64
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 92
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4196
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 4196
INDIRI4
ASGNI4
line 239
;237:
;238:	// can't use ent->absmin, because that has a one unit pad
;239:	VectorAdd( ent->client->ps.origin, ent->r.mins, mins );
ADDRLP4 4200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 4200
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4200
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 4200
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4200
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64+8
ADDRLP4 4204
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4204
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
ADDF4
ASGNF4
line 240
;240:	VectorAdd( ent->client->ps.origin, ent->r.maxs, maxs );
ADDRLP4 4208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
ADDRLP4 4208
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4208
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 4208
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4208
INDIRP4
CNSTI4 948
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76+8
ADDRLP4 4212
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4212
INDIRP4
CNSTI4 952
ADDP4
INDIRF4
ADDF4
ASGNF4
line 242
;241:
;242:	for ( i=0 ; i<num ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $143
JUMPV
LABELV $140
line 243
;243:		hit = &g_entities[touch[i]];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 92
ADDP4
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 245
;244:
;245:		if ( !hit->touch && !ent->touch ) {
ADDRLP4 0
INDIRP4
CNSTI4 1200
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $144
ADDRFP4 0
INDIRP4
CNSTI4 1200
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $144
line 246
;246:			continue;
ADDRGP4 $141
JUMPV
LABELV $144
line 248
;247:		}
;248:		if ( !( hit->r.contents & CONTENTS_TRIGGER ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1073741824
BANDI4
CNSTI4 0
NEI4 $146
line 249
;249:			continue;
ADDRGP4 $141
JUMPV
LABELV $146
line 253
;250:		}
;251:
;252:		// ignore most entities if a spectator
;253:		if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
NEI4 $148
line 254
;254:			if ( hit->s.eType != ET_TELEPORT_TRIGGER &&
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 9
EQI4 $150
ADDRLP4 0
INDIRP4
CNSTI4 1200
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 Touch_DoorTrigger
CVPU4 4
EQU4 $150
line 257
;255:				// this is ugly but adding a new ET_? type will
;256:				// most likely cause network incompatibilities
;257:				hit->touch != Touch_DoorTrigger) {
line 258
;258:				continue;
ADDRGP4 $141
JUMPV
LABELV $150
line 260
;259:			}
;260:		}
LABELV $148
line 264
;261:
;262:		// use separate code for determining if an item is picked up
;263:		// so you don't have to actually contact its bounding box
;264:		if ( hit->s.eType == ET_ITEM ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $152
line 265
;265:			if ( !BG_PlayerTouchesItem( &ent->client->ps, &hit->s, level.time ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 4216
ADDRGP4 BG_PlayerTouchesItem
CALLI4
ASGNI4
ADDRLP4 4216
INDIRI4
CNSTI4 0
NEI4 $153
line 266
;266:				continue;
ADDRGP4 $141
JUMPV
line 268
;267:			}
;268:		} else {
LABELV $152
line 269
;269:			if ( !trap_EntityContact( mins, maxs, hit ) ) {
ADDRLP4 64
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4216
ADDRGP4 trap_EntityContact
CALLI4
ASGNI4
ADDRLP4 4216
INDIRI4
CNSTI4 0
NEI4 $157
line 270
;270:				continue;
ADDRGP4 $141
JUMPV
LABELV $157
line 272
;271:			}
;272:		}
LABELV $153
line 274
;273:
;274:		memset( &trace, 0, sizeof(trace) );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 276
;275:
;276:		if ( hit->touch ) {
ADDRLP4 0
INDIRP4
CNSTI4 1200
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $159
line 277
;277:			hit->touch (hit, ent, &trace);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1200
ADDP4
INDIRP4
CALLV
pop
line 278
;278:		}
LABELV $159
line 280
;279:
;280:		if ( ( ent->r.svFlags & SVF_BOT ) && ( ent->touch ) ) {
ADDRLP4 4216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4216
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $161
ADDRLP4 4216
INDIRP4
CNSTI4 1200
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $161
line 281
;281:			ent->touch( ent, hit, &trace );
ADDRLP4 4220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4220
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 4220
INDIRP4
CNSTI4 1200
ADDP4
INDIRP4
CALLV
pop
line 282
;282:		}
LABELV $161
line 283
;283:	}
LABELV $141
line 242
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $143
ADDRLP4 4
INDIRI4
ADDRLP4 88
INDIRI4
LTI4 $140
line 286
;284:
;285:	// if we didn't touch a jump pad this pmove frame
;286:	if ( ent->client->ps.jumppad_frame != ent->client->ps.pmove_framecount ) {
ADDRLP4 4216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4216
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ADDRLP4 4216
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
EQI4 $163
line 287
;287:		ent->client->ps.jumppad_frame = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 288
;288:		ent->client->ps.jumppad_ent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 0
ASGNI4
line 289
;289:	}
LABELV $163
line 290
;290:}
LABELV $122
endproc G_TouchTriggers 4224 16
export SpectatorThink
proc SpectatorThink 312 12
line 297
;291:
;292:/*
;293:=================
;294:SpectatorThink
;295:=================
;296:*/
;297:void SpectatorThink( gentity_t *ent, usercmd_t *ucmd ) {
line 301
;298:	pmove_t	pm;
;299:	gclient_t	*client;
;300:
;301:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ASGNP4
line 303
;302:
;303:	if ( client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
CNSTI4 2
EQI4 $166
line 304
;304:		client->ps.pm_type = PM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 305
;305:		client->ps.speed = g_speed.value * 1.25f; // faster than normal
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 g_speed+8
INDIRF4
CNSTF4 1067450368
MULF4
CVFI4 4
ASGNI4
line 308
;306:
;307:		// set up for pmove
;308:		memset( &pm, 0, sizeof( pm ) );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 300
ARGI4
ADDRGP4 memset
CALLP4
pop
line 309
;309:		pm.ps = &client->ps;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 310
;310:		pm.cmd = *ucmd;
ADDRLP4 4+4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 100
line 311
;311:		if ( client->noclip )
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
CNSTI4 0
EQI4 $170
line 312
;312:			pm.tracemask = 0;
ADDRLP4 4+104
CNSTI4 0
ASGNI4
ADDRGP4 $171
JUMPV
LABELV $170
line 314
;313:		else
;314:			pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;	// spectators can fly through bodies
ADDRLP4 4+104
CNSTI4 65537
ASGNI4
LABELV $171
line 315
;315:		pm.trace = trap_Trace;
ADDRLP4 4+292
ADDRGP4 trap_Trace
ASGNP4
line 316
;316:		pm.pointcontents = trap_PointContents;
ADDRLP4 4+296
ADDRGP4 trap_PointContents
ASGNP4
line 320
;317:
;318:#ifdef USE_VR
;319:		// avoid backflip if VR player
;320:		if ( client->pers.localClient )
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
CNSTI4 0
EQI4 $176
line 322
;321:#ifdef USE_VR_QVM
;322:			if ( pm.ps->vr_controller_type )
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $178
line 324
;323:#endif
;324:			client->ps.pm_flags |= PMF_NO_JUMP_ANIM;
ADDRLP4 304
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 304
INDIRP4
ADDRLP4 304
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
LABELV $178
LABELV $176
line 328
;325:#endif
;326:
;327:		// perform a pmove
;328:		Pmove( &pm );
ADDRLP4 4
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 330
;329:		// save results of pmove
;330:		VectorCopy( client->ps.origin, ent->s.origin );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 332
;331:
;332:		G_TouchTriggers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 333
;333:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 334
;334:	}
LABELV $166
line 336
;335:
;336:	client->oldbuttons = client->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 836
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
ASGNI4
line 337
;337:	client->buttons = ucmd->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 340
;338:
;339:	// attack button cycles through spectators
;340:	if ( ( client->buttons & BUTTON_ATTACK ) && ! ( client->oldbuttons & BUTTON_ATTACK ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $180
ADDRLP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $180
line 341
;341:		Cmd_FollowCycle_f( ent, 1 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
line 342
;342:	}
LABELV $180
line 343
;343:}
LABELV $165
endproc SpectatorThink 312 12
export ClientInactivityTimer
proc ClientInactivityTimer 8 8
line 354
;344:
;345:
;346:
;347:/*
;348:=================
;349:ClientInactivityTimer
;350:
;351:Returns qfalse if the client is dropped
;352:=================
;353:*/
;354:qboolean ClientInactivityTimer( gclient_t *client ) {
line 355
;355:	if ( ! g_inactivity.integer ) {
ADDRGP4 g_inactivity+12
INDIRI4
CNSTI4 0
NEI4 $183
line 358
;356:		// give everyone some time, so if the operator sets g_inactivity during
;357:		// gameplay, everyone isn't kicked
;358:		client->inactivityTime = level.time + 60 * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 912
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 60000
ADDI4
ASGNI4
line 359
;359:		client->inactivityWarning = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 916
ADDP4
CNSTI4 0
ASGNI4
line 360
;360:	} else if ( client->pers.cmd.forwardmove || 
ADDRGP4 $184
JUMPV
LABELV $183
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 661
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $191
ADDRLP4 0
INDIRP4
CNSTI4 662
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $191
ADDRLP4 0
INDIRP4
CNSTI4 663
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $191
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $187
LABELV $191
line 363
;361:		client->pers.cmd.rightmove || 
;362:		client->pers.cmd.upmove ||
;363:		(client->pers.cmd.buttons & BUTTON_ATTACK) ) {
line 364
;364:		client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 912
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_inactivity+12
INDIRI4
CNSTI4 1000
MULI4
ADDI4
ASGNI4
line 365
;365:		client->inactivityWarning = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 916
ADDP4
CNSTI4 0
ASGNI4
line 366
;366:	} else if ( !client->pers.localClient ) {
ADDRGP4 $188
JUMPV
LABELV $187
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
CNSTI4 0
NEI4 $194
line 367
;367:		if ( level.time > client->inactivityTime ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 912
ADDP4
INDIRI4
LEI4 $196
line 368
;368:			trap_DropClient( client - level.clients, "Dropped due to inactivity" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1736
DIVI4
ARGI4
ADDRGP4 $199
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 369
;369:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $182
JUMPV
LABELV $196
line 371
;370:		}
;371:		if ( level.time > client->inactivityTime - 10000 && !client->inactivityWarning ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 912
ADDP4
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $200
ADDRLP4 4
INDIRP4
CNSTI4 916
ADDP4
INDIRI4
CNSTI4 0
NEI4 $200
line 372
;372:			client->inactivityWarning = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 916
ADDP4
CNSTI4 1
ASGNI4
line 373
;373:			trap_SendServerCommand( client - level.clients, "cp \"Ten seconds until inactivity drop!\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1736
DIVI4
ARGI4
ADDRGP4 $203
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 374
;374:		}
LABELV $200
line 375
;375:	}
LABELV $194
LABELV $188
LABELV $184
line 376
;376:	return qtrue;
CNSTI4 1
RETI4
LABELV $182
endproc ClientInactivityTimer 8 8
export ClientTimerActions
proc ClientTimerActions 20 12
line 386
;377:}
;378:
;379:/*
;380:==================
;381:ClientTimerActions
;382:
;383:Actions that happen once a second
;384:==================
;385:*/
;386:void ClientTimerActions( gentity_t *ent, int msec ) {
line 392
;387:	gclient_t	*client;
;388:#ifdef MISSIONPACK
;389:	int			maxHealth;
;390:#endif
;391:
;392:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ASGNP4
line 393
;393:	client->timeResidual += msec;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $206
JUMPV
LABELV $205
line 395
;394:
;395:	while ( client->timeResidual >= 1000 ) {
line 396
;396:		client->timeResidual -= 1000;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 424
;397:
;398:		// regenerate
;399:#ifdef MISSIONPACK
;400:		if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;401:			maxHealth = client->ps.stats[STAT_MAX_HEALTH] / 2;
;402:		}
;403:		else if ( client->ps.powerups[PW_REGEN] ) {
;404:			maxHealth = client->ps.stats[STAT_MAX_HEALTH];
;405:		}
;406:		else {
;407:			maxHealth = 0;
;408:		}
;409:		if( maxHealth ) {
;410:			if ( ent->health < maxHealth ) {
;411:				ent->health += 15;
;412:				if ( ent->health > maxHealth * 1.1 ) {
;413:					ent->health = maxHealth * 1.1;
;414:				}
;415:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
;416:			} else if ( ent->health < maxHealth * 2) {
;417:				ent->health += 5;
;418:				if ( ent->health > maxHealth * 2 ) {
;419:					ent->health = maxHealth * 2;
;420:				}
;421:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
;422:			}
;423:#else
;424:		if ( client->ps.powerups[PW_REGEN] ) {
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $208
line 425
;425:			if ( ent->health < client->ps.stats[STAT_MAX_HEALTH]) {
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
GEI4 $210
line 426
;426:				ent->health += 15;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 15
ADDI4
ASGNI4
line 427
;427:				if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] * 1.1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1066192077
MULF4
LEF4 $212
line 428
;428:					ent->health = client->ps.stats[STAT_MAX_HEALTH] * 1.1;
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1066192077
MULF4
CVFI4 4
ASGNI4
line 429
;429:				}
LABELV $212
line 430
;430:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 431
;431:			} else if ( ent->health < client->ps.stats[STAT_MAX_HEALTH] * 2) {
ADDRGP4 $209
JUMPV
LABELV $210
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
GEI4 $209
line 432
;432:				ent->health += 5;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 433
;433:				if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] * 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LEI4 $216
line 434
;434:					ent->health = client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 435
;435:				}
LABELV $216
line 436
;436:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 437
;437:			}
line 439
;438:#endif
;439:		} else {
ADDRGP4 $209
JUMPV
LABELV $208
line 441
;440:			// count down health when over max
;441:			if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] ) {
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
LEI4 $218
line 442
;442:				ent->health--;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 443
;443:			}
LABELV $218
line 444
;444:		}
LABELV $209
line 447
;445:
;446:		// count down armor when over max
;447:		if ( client->ps.stats[STAT_ARMOR] > client->ps.stats[STAT_MAX_HEALTH] ) {
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
LEI4 $220
line 448
;448:			client->ps.stats[STAT_ARMOR]--;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 449
;449:		}
LABELV $220
line 450
;450:	}
LABELV $206
line 395
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 1000
GEI4 $205
line 489
;451:#ifdef MISSIONPACK
;452:	if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
;453:		int w, max, inc, t, i;
;454:    int weapList[]={WP_MACHINEGUN,WP_SHOTGUN,WP_GRENADE_LAUNCHER,WP_ROCKET_LAUNCHER,WP_LIGHTNING,WP_RAILGUN,WP_PLASMAGUN,WP_BFG,WP_NAILGUN,WP_PROX_LAUNCHER,WP_CHAINGUN};
;455:    int weapCount = ARRAY_LEN( weapList );
;456:		//
;457:    for (i = 0; i < weapCount; i++) {
;458:		  w = weapList[i];
;459:
;460:		  switch(w) {
;461:			  case WP_MACHINEGUN: max = 50; inc = 4; t = 1000; break;
;462:			  case WP_SHOTGUN: max = 10; inc = 1; t = 1500; break;
;463:			  case WP_GRENADE_LAUNCHER: max = 10; inc = 1; t = 2000; break;
;464:			  case WP_ROCKET_LAUNCHER: max = 10; inc = 1; t = 1750; break;
;465:			  case WP_LIGHTNING: max = 50; inc = 5; t = 1500; break;
;466:			  case WP_RAILGUN: max = 10; inc = 1; t = 1750; break;
;467:			  case WP_PLASMAGUN: max = 50; inc = 5; t = 1500; break;
;468:			  case WP_BFG: max = 10; inc = 1; t = 4000; break;
;469:			  case WP_NAILGUN: max = 10; inc = 1; t = 1250; break;
;470:			  case WP_PROX_LAUNCHER: max = 5; inc = 1; t = 2000; break;
;471:			  case WP_CHAINGUN: max = 100; inc = 5; t = 1000; break;
;472:			  default: max = 0; inc = 0; t = 1000; break;
;473:		  }
;474:		  client->ammoTimes[w] += msec;
;475:		  if ( client->ps.ammo[w] >= max ) {
;476:			  client->ammoTimes[w] = 0;
;477:		  }
;478:		  if ( client->ammoTimes[w] >= t ) {
;479:			  while ( client->ammoTimes[w] >= t )
;480:				  client->ammoTimes[w] -= t;
;481:			  client->ps.ammo[w] += inc;
;482:			  if ( client->ps.ammo[w] > max ) {
;483:				  client->ps.ammo[w] = max;
;484:			  }
;485:		  }
;486:    }
;487:	}
;488:#endif
;489:}
LABELV $204
endproc ClientTimerActions 20 12
export ClientIntermissionThink
proc ClientIntermissionThink 20 0
line 496
;490:
;491:/*
;492:====================
;493:ClientIntermissionThink
;494:====================
;495:*/
;496:void ClientIntermissionThink( gclient_t *client ) {
line 497
;497:	client->ps.eFlags &= ~EF_TALK;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 498
;498:	client->ps.eFlags &= ~EF_FIRING;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 503
;499:
;500:	// the level will exit when everyone wants to or after timeouts
;501:
;502:	// swap and latch button actions
;503:	client->oldbuttons = client->buttons;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 836
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
ASGNI4
line 504
;504:	client->buttons = client->pers.cmd.buttons;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 832
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
ASGNI4
line 505
;505:	if ( client->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) & ( client->oldbuttons ^ client->buttons ) ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 5
BANDI4
ADDRLP4 16
INDIRP4
CNSTI4 836
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
BXORI4
BANDI4
CNSTI4 0
EQI4 $223
line 507
;506:		// this used to be an ^1 but once a player says ready, it should stick
;507:		client->readyToExit = 1;
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
CNSTI4 1
ASGNI4
line 508
;508:	}
LABELV $223
line 509
;509:}
LABELV $222
endproc ClientIntermissionThink 20 0
export ClientEvents
proc ClientEvents 68 32
line 520
;510:
;511:
;512:/*
;513:================
;514:ClientEvents
;515:
;516:Events will be passed on to the clients for presentation,
;517:but any server game effects are handled here
;518:================
;519:*/
;520:void ClientEvents( gentity_t *ent, int oldEventSequence ) {
line 530
;521:	int		i, j;
;522:	int		event;
;523:	gclient_t *client;
;524:	int		damage;
;525:	vec3_t	origin, angles;
;526://	qboolean	fired;
;527:	gitem_t *item;
;528:	gentity_t *drop;
;529:
;530:	client = ent->client;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ASGNP4
line 532
;531:
;532:	if ( oldEventSequence < client->ps.eventSequence - MAX_PS_EVENTS ) {
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $226
line 533
;533:		oldEventSequence = client->ps.eventSequence - MAX_PS_EVENTS;
ADDRFP4 4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 534
;534:	}
LABELV $226
line 535
;535:	for ( i = oldEventSequence ; i < client->ps.eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $231
JUMPV
LABELV $228
line 536
;536:		event = client->ps.events[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
line 538
;537:
;538:		switch ( event ) {
ADDRLP4 4
INDIRI4
CNSTI4 11
EQI4 $234
ADDRLP4 4
INDIRI4
CNSTI4 12
EQI4 $234
ADDRLP4 4
INDIRI4
CNSTI4 11
LTI4 $233
LABELV $257
ADDRLP4 4
INDIRI4
CNSTI4 24
EQI4 $243
ADDRLP4 4
INDIRI4
CNSTI4 26
EQI4 $244
ADDRLP4 4
INDIRI4
CNSTI4 27
EQI4 $256
ADDRGP4 $233
JUMPV
LABELV $234
line 541
;539:		case EV_FALL_MEDIUM:
;540:		case EV_FALL_FAR:
;541:			if ( ent->s.eType != ET_PLAYER ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $235
line 542
;542:				break;		// not in the player model
ADDRGP4 $233
JUMPV
LABELV $235
line 544
;543:			}
;544:			if ( g_dmflags.integer & DF_NO_FALLING ) {
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $237
line 545
;545:				break;
ADDRGP4 $233
JUMPV
LABELV $237
line 547
;546:			}
;547:			if ( event == EV_FALL_FAR ) {
ADDRLP4 4
INDIRI4
CNSTI4 12
NEI4 $240
line 548
;548:				damage = 10;
ADDRLP4 24
CNSTI4 10
ASGNI4
line 549
;549:			} else {
ADDRGP4 $241
JUMPV
LABELV $240
line 550
;550:				damage = 5;
ADDRLP4 24
CNSTI4 5
ASGNI4
line 551
;551:			}
LABELV $241
line 552
;552:			ent->pain_debounce_time = level.time + 200;	// no normal pain sound
ADDRFP4 0
INDIRP4
CNSTI4 1216
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 553
;553:			G_Damage (ent, NULL, NULL, NULL, NULL, damage, 0, MOD_FALLING);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 19
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 554
;554:			break;
ADDRGP4 $233
JUMPV
LABELV $243
line 557
;555:
;556:		case EV_FIRE_WEAPON:
;557:			FireWeapon( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon
CALLV
pop
line 558
;558:			break;
ADDRGP4 $233
JUMPV
LABELV $244
line 562
;559:
;560:		case EV_USE_ITEM1:		// teleporter
;561:			// drop flags in CTF
;562:			item = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
line 563
;563:			j = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 565
;564:
;565:			if ( ent->client->ps.powerups[ PW_REDFLAG ] ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $245
line 566
;566:				item = BG_FindItemForPowerup( PW_REDFLAG );
CNSTI4 7
ARGI4
ADDRLP4 60
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 60
INDIRP4
ASGNP4
line 567
;567:				j = PW_REDFLAG;
ADDRLP4 16
CNSTI4 7
ASGNI4
line 568
;568:			} else if ( ent->client->ps.powerups[ PW_BLUEFLAG ] ) {
ADDRGP4 $246
JUMPV
LABELV $245
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $247
line 569
;569:				item = BG_FindItemForPowerup( PW_BLUEFLAG );
CNSTI4 8
ARGI4
ADDRLP4 60
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 60
INDIRP4
ASGNP4
line 570
;570:				j = PW_BLUEFLAG;
ADDRLP4 16
CNSTI4 8
ASGNI4
line 571
;571:			} else if ( ent->client->ps.powerups[ PW_NEUTRALFLAG ] ) {
ADDRGP4 $248
JUMPV
LABELV $247
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $249
line 572
;572:				item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
CNSTI4 9
ARGI4
ADDRLP4 60
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 60
INDIRP4
ASGNP4
line 573
;573:				j = PW_NEUTRALFLAG;
ADDRLP4 16
CNSTI4 9
ASGNI4
line 574
;574:			}
LABELV $249
LABELV $248
LABELV $246
line 576
;575:
;576:			if ( item ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $251
line 577
;577:				drop = Drop_Item( ent, item, 0 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 60
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 60
INDIRP4
ASGNP4
line 579
;578:				// decide how many seconds it has left
;579:				drop->count = ( ent->client->ps.powerups[ j ] - level.time ) / 1000;
ADDRLP4 20
INDIRP4
CNSTI4 1256
ADDP4
ADDRLP4 16
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
line 580
;580:				if ( drop->count < 1 ) {
ADDRLP4 20
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
CNSTI4 1
GEI4 $254
line 581
;581:					drop->count = 1;
ADDRLP4 20
INDIRP4
CNSTI4 1256
ADDP4
CNSTI4 1
ASGNI4
line 582
;582:				}
LABELV $254
line 584
;583:				// for pickup prediction
;584:				drop->s.time2 = drop->count;
ADDRLP4 64
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
ASGNI4
line 586
;585:
;586:				ent->client->ps.powerups[ j ] = 0;
ADDRLP4 16
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
CNSTI4 0
ASGNI4
line 587
;587:			}
LABELV $251
line 611
;588:
;589:#ifdef MISSIONPACK
;590:			if ( g_gametype.integer == GT_HARVESTER ) {
;591:				if ( ent->client->ps.generic1 > 0 ) {
;592:					if ( ent->client->sess.sessionTeam == TEAM_RED ) {
;593:						item = BG_FindItem( "Blue Cube" );
;594:					} else {
;595:						item = BG_FindItem( "Red Cube" );
;596:					}
;597:					if ( item ) {
;598:						for ( j = 0; j < ent->client->ps.generic1; j++ ) {
;599:							drop = Drop_Item( ent, item, 0 );
;600:							if ( ent->client->sess.sessionTeam == TEAM_RED ) {
;601:								drop->spawnflags = TEAM_BLUE;
;602:							} else {
;603:								drop->spawnflags = TEAM_RED;
;604:							}
;605:						}
;606:					}
;607:					ent->client->ps.generic1 = 0;
;608:				}
;609:			}
;610:#endif
;611:			SelectSpawnPoint( ent, ent->client->ps.origin, origin, angles );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 SelectSpawnPoint
CALLP4
pop
line 612
;612:			TeleportPlayer( ent, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 613
;613:			break;
ADDRGP4 $233
JUMPV
LABELV $256
line 616
;614:
;615:		case EV_USE_ITEM2:		// medkit
;616:			ent->health = ent->client->ps.stats[STAT_MAX_HEALTH] + 25;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
line 618
;617:
;618:			break;
line 642
;619:
;620:#ifdef MISSIONPACK
;621:		case EV_USE_ITEM3:		// kamikaze
;622:			// make sure the invulnerability is off
;623:			ent->client->invulnerabilityTime = 0;
;624:			// start the kamikze
;625:			G_StartKamikaze( ent );
;626:			break;
;627:
;628:		case EV_USE_ITEM4:		// portal
;629:			if( ent->client->portalID ) {
;630:				DropPortalSource( ent );
;631:			}
;632:			else {
;633:				DropPortalDestination( ent );
;634:			}
;635:			break;
;636:		case EV_USE_ITEM5:		// invulnerability
;637:			ent->client->invulnerabilityTime = level.time + 10000;
;638:			break;
;639:#endif
;640:
;641:		default:
;642:			break;
LABELV $233
line 644
;643:		}
;644:	}
LABELV $229
line 535
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $231
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $228
line 646
;645:
;646:}
LABELV $225
endproc ClientEvents 68 32
export SendPendingPredictableEvents
proc SendPendingPredictableEvents 40 12
line 698
;647:
;648:#ifdef MISSIONPACK
;649:/*
;650:==============
;651:StuckInOtherClient
;652:==============
;653:*/
;654:static int StuckInOtherClient(gentity_t *ent) {
;655:	int i;
;656:	gentity_t	*ent2;
;657:
;658:	ent2 = &g_entities[0];
;659:	for ( i = 0; i < MAX_CLIENTS; i++, ent2++ ) {
;660:		if ( ent2 == ent ) {
;661:			continue;
;662:		}
;663:		if ( !ent2->inuse ) {
;664:			continue;
;665:		}
;666:		if ( !ent2->client ) {
;667:			continue;
;668:		}
;669:		if ( ent2->health <= 0 ) {
;670:			continue;
;671:		}
;672:		//
;673:		if (ent2->r.absmin[0] > ent->r.absmax[0])
;674:			continue;
;675:		if (ent2->r.absmin[1] > ent->r.absmax[1])
;676:			continue;
;677:		if (ent2->r.absmin[2] > ent->r.absmax[2])
;678:			continue;
;679:		if (ent2->r.absmax[0] < ent->r.absmin[0])
;680:			continue;
;681:		if (ent2->r.absmax[1] < ent->r.absmin[1])
;682:			continue;
;683:		if (ent2->r.absmax[2] < ent->r.absmin[2])
;684:			continue;
;685:		return qtrue;
;686:	}
;687:	return qfalse;
;688:}
;689:#endif
;690:
;691:void BotTestSolid(vec3_t origin);
;692:
;693:/*
;694:==============
;695:SendPendingPredictableEvents
;696:==============
;697:*/
;698:void SendPendingPredictableEvents( playerState_t *ps ) {
line 704
;699:	gentity_t *t;
;700:	int event, seq;
;701:	int extEvent, number;
;702:
;703:	// if there are still events pending
;704:	if ( ps->entityEventSequence < ps->eventSequence ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
GEI4 $259
line 707
;705:		// create a temporary entity for this event which is sent to everyone
;706:		// except the client who generated the event
;707:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 708
;708:		event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 8
LSHI4
BORI4
ASGNI4
line 710
;709:		// set external event to zero before calling BG_PlayerStateToEntityState
;710:		extEvent = ps->externalEvent;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
line 711
;711:		ps->externalEvent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTI4 0
ASGNI4
line 713
;712:		// create temporary entity for event
;713:		t = G_TempEntity( ps->origin, event );
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 714
;714:		number = t->s.number;
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 715
;715:		BG_PlayerStateToEntityState( ps, &t->s, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 716
;716:		t->s.number = number;
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ASGNI4
line 717
;717:		t->s.eType = ET_EVENTS + event;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 13
ADDI4
ASGNI4
line 718
;718:		t->s.eFlags |= EF_PLAYER_EVENT;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 719
;719:		t->s.otherEntityNum = ps->clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 721
;720:		// send to everyone except the client who generated the event
;721:		t->r.svFlags |= SVF_NOTSINGLECLIENT;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 920
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 722
;722:		t->r.singleClient = ps->clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 924
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 724
;723:		// set back external event
;724:		ps->externalEvent = extEvent;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 725
;725:	}
LABELV $259
line 726
;726:}
LABELV $258
endproc SendPendingPredictableEvents 40 12
export ClientThink_real
proc ClientThink_real 368 12
line 739
;727:
;728:/*
;729:==============
;730:ClientThink
;731:
;732:This will be called once for each client frame, which will
;733:usually be a couple times for each server frame on fast clients.
;734:
;735:If "g_synchronousClients 1" is set, this will be called exactly
;736:once for each server frame, which makes for smooth demo recording.
;737:==============
;738:*/
;739:void ClientThink_real( gentity_t *ent ) {
line 746
;740:	gclient_t	*client;
;741:	pmove_t		pm;
;742:	int			oldEventSequence;
;743:	int			msec;
;744:	usercmd_t	*ucmd;
;745:
;746:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ASGNP4
line 749
;747:
;748:	// don't think if the client is not yet connected (and thus not yet spawned in)
;749:	if (client->pers.connected != CON_CONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 2
EQI4 $262
line 750
;750:		return;
ADDRGP4 $261
JUMPV
LABELV $262
line 753
;751:	}
;752:	// mark the time, so the connection sprite can be removed
;753:	ucmd = &ent->client->pers.cmd;
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 564
ADDP4
ASGNP4
line 756
;754:
;755:	// sanity check the command time to prevent speedup cheating
;756:	if ( ucmd->serverTime > level.time + 200 ) {
ADDRLP4 304
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
LEI4 $264
line 757
;757:		ucmd->serverTime = level.time + 200;
ADDRLP4 304
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 759
;758://		G_Printf("serverTime <<<<<\n" );
;759:	} else
ADDRGP4 $265
JUMPV
LABELV $264
line 760
;760:	if ( ucmd->serverTime < level.time - 1000 ) {
ADDRLP4 304
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
GEI4 $268
line 761
;761:		ucmd->serverTime = level.time - 1000;
ADDRLP4 304
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 763
;762://		G_Printf("serverTime >>>>>\n" );
;763:	}
LABELV $268
LABELV $265
line 766
;764:
;765:	// unlagged
;766:	client->frameOffset = trap_Milliseconds() - level.frameStartTime;
ADDRLP4 316
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1716
ADDP4
ADDRLP4 316
INDIRI4
ADDRGP4 level+11800
INDIRI4
SUBI4
ASGNI4
line 767
;767:	client->lastCmdTime = ucmd->serverTime;
ADDRLP4 0
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 304
INDIRP4
INDIRI4
ASGNI4
line 768
;768:	client->lastUpdateFrame = level.framenum;
ADDRLP4 0
INDIRP4
CNSTI4 1720
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 770
;769:
;770:	msec = ucmd->serverTime - client->ps.commandTime;
ADDRLP4 308
ADDRLP4 304
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 773
;771:	// following others may result in bad times, but we still want
;772:	// to check for follow toggles
;773:	if ( msec < 1 && client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 308
INDIRI4
CNSTI4 1
GEI4 $274
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
CNSTI4 2
EQI4 $274
line 774
;774:		return;
ADDRGP4 $261
JUMPV
LABELV $274
line 776
;775:	}
;776:	if ( msec > 200 ) {
ADDRLP4 308
INDIRI4
CNSTI4 200
LEI4 $276
line 777
;777:		msec = 200;
ADDRLP4 308
CNSTI4 200
ASGNI4
line 778
;778:	}
LABELV $276
line 780
;779:
;780:	if ( pmove_msec.integer < 8 ) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 8
GEI4 $278
line 781
;781:		trap_Cvar_Set( "pmove_msec", "8" );
ADDRGP4 $281
ARGP4
ADDRGP4 $282
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 782
;782:		trap_Cvar_Update( &pmove_msec );
ADDRGP4 pmove_msec
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 783
;783:	} else if ( pmove_msec.integer > 33 ) {
ADDRGP4 $279
JUMPV
LABELV $278
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 33
LEI4 $283
line 784
;784:		trap_Cvar_Set( "pmove_msec", "33" );
ADDRGP4 $281
ARGP4
ADDRGP4 $286
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 785
;785:		trap_Cvar_Update( &pmove_msec );
ADDRGP4 pmove_msec
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 786
;786:	}
LABELV $283
LABELV $279
line 788
;787:
;788:	if ( pmove_fixed.integer ) {
ADDRGP4 pmove_fixed+12
INDIRI4
CNSTI4 0
EQI4 $287
line 789
;789:		ucmd->serverTime = ((ucmd->serverTime + pmove_msec.integer-1) / pmove_msec.integer) * pmove_msec.integer;
ADDRLP4 304
INDIRP4
ADDRLP4 304
INDIRP4
INDIRI4
ADDRGP4 pmove_msec+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRGP4 pmove_msec+12
INDIRI4
DIVI4
ADDRGP4 pmove_msec+12
INDIRI4
MULI4
ASGNI4
line 792
;790:		//if (ucmd->serverTime - client->ps.commandTime <= 0)
;791:		//	return;
;792:	}
LABELV $287
line 797
;793:
;794:	//
;795:	// check for exiting intermission
;796:	//
;797:	if ( level.intermissiontime ) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $293
line 798
;798:		ClientIntermissionThink( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientIntermissionThink
CALLV
pop
line 799
;799:		return;
ADDRGP4 $261
JUMPV
LABELV $293
line 803
;800:	}
;801:
;802:	// spectators don't do much
;803:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
NEI4 $296
line 804
;804:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
CNSTI4 3
NEI4 $298
line 805
;805:			return;
ADDRGP4 $261
JUMPV
LABELV $298
line 807
;806:		}
;807:		SpectatorThink( ent, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 304
INDIRP4
ARGP4
ADDRGP4 SpectatorThink
CALLV
pop
line 808
;808:		return;
ADDRGP4 $261
JUMPV
LABELV $296
line 812
;809:	}
;810:
;811:	// check for inactivity timer, but never drop the local client of a non-dedicated server
;812:	if ( !ClientInactivityTimer( client ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 320
ADDRGP4 ClientInactivityTimer
CALLI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
NEI4 $300
line 813
;813:		return;
ADDRGP4 $261
JUMPV
LABELV $300
line 817
;814:	}
;815:
;816:	// clear the rewards if time
;817:	if ( level.time > client->rewardTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
LEI4 $302
line 818
;818:		client->ps.eFlags &= ~EF_AWARDS;
ADDRLP4 324
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 324
INDIRP4
ADDRLP4 324
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 819
;819:	}
LABELV $302
line 821
;820:
;821:	if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
CNSTI4 0
EQI4 $305
line 822
;822:		client->ps.pm_type = PM_NOCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 823
;823:	} else if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 $306
JUMPV
LABELV $305
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $307
line 824
;824:		client->ps.pm_type = PM_DEAD;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 825
;825:	} else {
ADDRGP4 $308
JUMPV
LABELV $307
line 826
;826:		client->ps.pm_type = PM_NORMAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 827
;827:	}
LABELV $308
LABELV $306
line 829
;828:
;829:	client->ps.gravity = g_gravity.value;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 g_gravity+8
INDIRF4
CVFI4 4
ASGNI4
line 832
;830:
;831:	// set speed
;832:	client->ps.speed = g_speed.value;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 g_speed+8
INDIRF4
CVFI4 4
ASGNI4
line 840
;833:
;834:#ifdef MISSIONPACK
;835:	if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
;836:		client->ps.speed *= 1.5;
;837:	}
;838:	else
;839:#endif
;840:	if ( client->ps.powerups[PW_HASTE] ) {
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CNSTI4 0
EQI4 $311
line 841
;841:		client->ps.speed *= 1.3;
ADDRLP4 324
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 324
INDIRP4
ADDRLP4 324
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1067869798
MULF4
CVFI4 4
ASGNI4
line 842
;842:	}
LABELV $311
line 846
;843:
;844:#ifdef USE_GRAPPLING_HOOK
;845:	// Let go of the hook if we aren't firing
;846:	if ( client->ps.weapon == WP_GRAPPLING_HOOK &&
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 10
NEI4 $313
ADDRLP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $313
ADDRLP4 304
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $313
line 847
;847:		client->hook && !( ucmd->buttons & BUTTON_ATTACK ) ) {
line 848
;848:		Weapon_HookFree(client->hook);
ADDRLP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
line 849
;849:	}
LABELV $313
line 853
;850:#endif
;851:
;852:	// set up for pmove
;853:	oldEventSequence = client->ps.eventSequence;
ADDRLP4 312
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 855
;854:
;855:	memset (&pm, 0, sizeof(pm));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 300
ARGI4
ADDRGP4 memset
CALLP4
pop
line 859
;856:
;857:	// check for the hit-scan gauntlet, don't let the action
;858:	// go through as an attack unless it actually hits something
;859:	if ( client->ps.weapon == WP_GAUNTLET && !( ucmd->buttons & BUTTON_TALK ) &&
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $315
ADDRLP4 304
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $315
ADDRLP4 304
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $315
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $315
line 860
;860:		( ucmd->buttons & BUTTON_ATTACK ) && client->ps.weaponTime <= 0 ) {
line 861
;861:		pm.gauntletHit = CheckGauntletAttack( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 336
ADDRGP4 CheckGauntletAttack
CALLI4
ASGNI4
ADDRLP4 4+112
ADDRLP4 336
INDIRI4
ASGNI4
line 862
;862:	}
LABELV $315
line 864
;863:
;864:	if ( ent->flags & FL_FORCE_GESTURE ) {
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $318
line 865
;865:		ent->flags &= ~FL_FORCE_GESTURE;
ADDRLP4 336
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
ASGNP4
ADDRLP4 336
INDIRP4
ADDRLP4 336
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 866
;866:		ent->client->pers.cmd.buttons |= BUTTON_GESTURE;
ADDRLP4 340
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 656
ADDP4
ASGNP4
ADDRLP4 340
INDIRP4
ADDRLP4 340
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 867
;867:	}
LABELV $318
line 896
;868:
;869:#ifdef MISSIONPACK
;870:	// check for invulnerability expansion before doing the Pmove
;871:	if (client->ps.powerups[PW_INVULNERABILITY] ) {
;872:		if ( !(client->ps.pm_flags & PMF_INVULEXPAND) ) {
;873:			vec3_t mins = { -42, -42, -42 };
;874:			vec3_t maxs = { 42, 42, 42 };
;875:			vec3_t oldmins, oldmaxs;
;876:
;877:			VectorCopy (ent->r.mins, oldmins);
;878:			VectorCopy (ent->r.maxs, oldmaxs);
;879:			// expand
;880:			VectorCopy (mins, ent->r.mins);
;881:			VectorCopy (maxs, ent->r.maxs);
;882:			trap_LinkEntity(ent);
;883:			// check if this would get anyone stuck in this player
;884:			if ( !StuckInOtherClient(ent) ) {
;885:				// set flag so the expanded size will be set in PM_CheckDuck
;886:				client->ps.pm_flags |= PMF_INVULEXPAND;
;887:			}
;888:			// set back
;889:			VectorCopy (oldmins, ent->r.mins);
;890:			VectorCopy (oldmaxs, ent->r.maxs);
;891:			trap_LinkEntity(ent);
;892:		}
;893:	}
;894:#endif
;895:
;896:	pm.ps = &client->ps;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 897
;897:	pm.cmd = *ucmd;
ADDRLP4 4+4
ADDRLP4 304
INDIRP4
INDIRB
ASGNB 100
line 898
;898:	if ( pm.ps->pm_type == PM_DEAD ) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $321
line 899
;899:		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRLP4 4+104
CNSTI4 65537
ASGNI4
line 900
;900:	}
ADDRGP4 $322
JUMPV
LABELV $321
line 901
;901:	else if ( ent->r.svFlags & SVF_BOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $324
line 902
;902:		pm.tracemask = MASK_PLAYERSOLID | CONTENTS_BOTCLIP;
ADDRLP4 4+104
CNSTI4 37814273
ASGNI4
line 903
;903:	}
ADDRGP4 $325
JUMPV
LABELV $324
line 904
;904:	else {
line 905
;905:		pm.tracemask = MASK_PLAYERSOLID;
ADDRLP4 4+104
CNSTI4 33619969
ASGNI4
line 906
;906:	}
LABELV $325
LABELV $322
line 907
;907:	pm.trace = trap_Trace;
ADDRLP4 4+292
ADDRGP4 trap_Trace
ASGNP4
line 908
;908:	pm.pointcontents = trap_PointContents;
ADDRLP4 4+296
ADDRGP4 trap_PointContents
ASGNP4
line 909
;909:	pm.debugLevel = g_debugMove.integer;
ADDRLP4 4+108
ADDRGP4 g_debugMove+12
INDIRI4
ASGNI4
line 911
;910:
;911:	pm.pmove_fixed = pmove_fixed.integer;
ADDRLP4 4+284
ADDRGP4 pmove_fixed+12
INDIRI4
ASGNI4
line 912
;912:	pm.pmove_msec = pmove_msec.integer;
ADDRLP4 4+288
ADDRGP4 pmove_msec+12
INDIRI4
ASGNI4
line 914
;913:
;914:	VectorCopy( client->ps.origin, client->oldOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 844
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 918
;915:
;916:#ifdef USE_VR
;917:		// avoid backflip if VR player
;918:		if ( client->pers.localClient )
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
CNSTI4 0
EQI4 $336
line 920
;919:#ifdef USE_VR_QVM
;920:			if ( pm.ps->vr_controller_type )
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $338
line 922
;921:#endif
;922:				client->ps.pm_flags |= PMF_NO_JUMP_ANIM;
ADDRLP4 340
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 340
INDIRP4
ADDRLP4 340
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
LABELV $338
LABELV $336
line 940
;923:#endif
;924:
;925:#ifdef MISSIONPACK
;926:		if (level.intermissionQueued != 0 && g_singlePlayer.integer) {
;927:			if ( level.time - level.intermissionQueued >= 1000  ) {
;928:				pm.cmd.buttons = 0;
;929:				pm.cmd.forwardmove = 0;
;930:				pm.cmd.rightmove = 0;
;931:				pm.cmd.upmove = 0;
;932:				if ( level.time - level.intermissionQueued >= 2000 && level.time - level.intermissionQueued <= 2500 ) {
;933:					trap_SendConsoleCommand( EXEC_APPEND, "centerview\n");
;934:				}
;935:				ent->client->ps.pm_type = PM_SPINTERMISSION;
;936:			}
;937:		}
;938:		Pmove (&pm);
;939:#else
;940:		Pmove (&pm);
ADDRLP4 4
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 944
;941:#endif
;942:
;943:	// save results of pmove
;944:	if ( ent->client->ps.eventSequence != oldEventSequence ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 312
INDIRI4
EQI4 $340
line 945
;945:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 946
;946:	}
LABELV $340
line 948
;947:
;948:	BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ARGP4
ADDRLP4 344
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 950
;949:
;950:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 952
;951:
;952:	if ( !( ent->client->ps.eFlags & EF_FIRING ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
NEI4 $343
line 953
;953:		client->fireHeld = qfalse;		// for grapple
ADDRLP4 0
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 0
ASGNI4
line 954
;954:	}
LABELV $343
line 957
;955:
;956:	// use the snapped origin for linking so it matches client predicted versions
;957:	VectorCopy( ent->s.pos.trBase, ent->r.currentOrigin );
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 984
ADDP4
ADDRLP4 348
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 959
;958:
;959:	VectorCopy (pm.mins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
ADDRLP4 4+252
INDIRB
ASGNB 12
line 960
;960:	VectorCopy (pm.maxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ADDRLP4 4+264
INDIRB
ASGNB 12
line 962
;961:
;962:	ent->waterlevel = pm.waterlevel;
ADDRFP4 0
INDIRP4
CNSTI4 1284
ADDP4
ADDRLP4 4+280
INDIRI4
ASGNI4
line 963
;963:	ent->watertype = pm.watertype;
ADDRFP4 0
INDIRP4
CNSTI4 1280
ADDP4
ADDRLP4 4+276
INDIRI4
ASGNI4
line 966
;964:
;965:	// execute client events
;966:	ClientEvents( ent, oldEventSequence );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 312
INDIRI4
ARGI4
ADDRGP4 ClientEvents
CALLV
pop
line 969
;967:
;968:	// link entity now, after any personal teleporters have been used
;969:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 970
;970:	if ( !ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
CNSTI4 0
NEI4 $349
line 971
;971:		G_TouchTriggers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 972
;972:	}
LABELV $349
line 975
;973:
;974:	// NOTE: now copy the exact origin over otherwise clients can be snapped into solid
;975:	VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 984
ADDP4
ADDRLP4 352
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 978
;976:
;977:	//test for solid areas in the AAS file
;978:	BotTestAAS(ent->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 984
ADDP4
ARGP4
ADDRGP4 BotTestAAS
CALLV
pop
line 981
;979:
;980:	// touch other objects
;981:	ClientImpacts( ent, &pm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 ClientImpacts
CALLV
pop
line 984
;982:
;983:	// save results of triggers and client events
;984:	if (ent->client->ps.eventSequence != oldEventSequence) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 312
INDIRI4
EQI4 $351
line 985
;985:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 986
;986:	}
LABELV $351
line 989
;987:
;988:	// swap and latch button actions
;989:	client->oldbuttons = client->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 836
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
ASGNI4
line 990
;990:	client->buttons = ucmd->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
ADDRLP4 304
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 991
;991:	client->latched_buttons |= client->buttons & ~client->oldbuttons;
ADDRLP4 364
ADDRLP4 0
INDIRP4
CNSTI4 840
ADDP4
ASGNP4
ADDRLP4 364
INDIRP4
ADDRLP4 364
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRI4
BCOMI4
BANDI4
BORI4
ASGNI4
line 994
;992:
;993:	// check for respawning
;994:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $354
line 996
;995:		// wait for the attack button to be pressed
;996:		if ( level.time > client->respawnTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRI4
LEI4 $261
line 998
;997:			// forcerespawn is to prevent users from waiting out powerups
;998:			if ( g_forcerespawn.integer > 0 && 
ADDRGP4 g_forcerespawn+12
INDIRI4
CNSTI4 0
LEI4 $359
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
INDIRI4
SUBI4
ADDRGP4 g_forcerespawn+12
INDIRI4
CNSTI4 1000
MULI4
LEI4 $359
line 999
;999:				( level.time - client->respawnTime ) > g_forcerespawn.integer * 1000 ) {
line 1000
;1000:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1001
;1001:				return;
ADDRGP4 $261
JUMPV
LABELV $359
line 1005
;1002:			}
;1003:		
;1004:			// pressing attack or use is the normal respawn method
;1005:			if ( ucmd->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) ) {
ADDRLP4 304
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 5
BANDI4
CNSTI4 0
EQI4 $261
line 1006
;1006:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1007
;1007:			}
line 1008
;1008:		}
line 1009
;1009:		return;
ADDRGP4 $261
JUMPV
LABELV $354
line 1013
;1010:	}
;1011:
;1012:	// perform once-a-second actions
;1013:	ClientTimerActions( ent, msec );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 ClientTimerActions
CALLV
pop
line 1014
;1014:}
LABELV $261
endproc ClientThink_real 368 12
export ClientThink
proc ClientThink 4 8
line 1024
;1015:
;1016:
;1017:/*
;1018:==================
;1019:ClientThink
;1020:
;1021:A new command has arrived from the client
;1022:==================
;1023:*/
;1024:void ClientThink( int clientNum ) {
line 1027
;1025:	gentity_t *ent;
;1026:
;1027:	ent = g_entities + clientNum;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1028
;1028:	trap_GetUsercmd( clientNum, &ent->client->pers.cmd );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 564
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 1036
;1029:
;1030:	// mark the time we got info, so we can display the
;1031:	// phone jack if they don't get any for a while
;1032:#if 0 // unlagged
;1033:	ent->client->lastCmdTime = level.time;
;1034:#endif
;1035:
;1036:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
ADDRLP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $367
ADDRGP4 g_synchronousClients+12
INDIRI4
CNSTI4 0
NEI4 $367
line 1037
;1037:		ClientThink_real( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1038
;1038:	}
LABELV $367
line 1039
;1039:}
LABELV $366
endproc ClientThink 4 8
export G_RunClient
proc G_RunClient 0 4
line 1042
;1040:
;1041:
;1042:void G_RunClient( gentity_t *ent ) {
line 1043
;1043:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $371
ADDRGP4 g_synchronousClients+12
INDIRI4
CNSTI4 0
NEI4 $371
line 1044
;1044:		return;
ADDRGP4 $370
JUMPV
LABELV $371
line 1046
;1045:	}
;1046:	ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1047
;1047:	ClientThink_real( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1048
;1048:}
LABELV $370
endproc G_RunClient 0 4
export SpectatorClientEndFrame
proc SpectatorClientEndFrame 20 4
line 1057
;1049:
;1050:
;1051:/*
;1052:==================
;1053:SpectatorClientEndFrame
;1054:
;1055:==================
;1056:*/
;1057:void SpectatorClientEndFrame( gentity_t *ent ) {
line 1061
;1058:	gclient_t	*cl;
;1059:
;1060:	// if we are doing a chase cam or a remote view, grab the latest info
;1061:	if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $376
line 1064
;1062:		int		clientNum, flags;
;1063:
;1064:		clientNum = ent->client->sess.spectatorClient;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 804
ADDP4
INDIRI4
ASGNI4
line 1067
;1065:
;1066:		// team follow1 and team follow2 go to whatever clients are playing
;1067:		if ( clientNum == -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $378
line 1068
;1068:			clientNum = level.follow1;
ADDRLP4 4
ADDRGP4 level+344
INDIRI4
ASGNI4
line 1069
;1069:		} else if ( clientNum == -2 ) {
ADDRGP4 $379
JUMPV
LABELV $378
ADDRLP4 4
INDIRI4
CNSTI4 -2
NEI4 $381
line 1070
;1070:			clientNum = level.follow2;
ADDRLP4 4
ADDRGP4 level+348
INDIRI4
ASGNI4
line 1071
;1071:		}
LABELV $381
LABELV $379
line 1072
;1072:		if ( (unsigned)clientNum < MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 64
GEU4 $384
line 1073
;1073:			cl = &level.clients[ clientNum ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1074
;1074:			if ( cl->pers.connected == CON_CONNECTED && cl->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $386
ADDRLP4 12
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
EQI4 $386
line 1075
;1075:				flags = (cl->ps.eFlags & ~(EF_VOTED | EF_TEAMVOTED)) | (ent->client->ps.eFlags & (EF_VOTED | EF_TEAMVOTED));
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 -540673
BANDI4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 540672
BANDI4
BORI4
ASGNI4
line 1076
;1076:				ent->client->ps = cl->ps;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 560
line 1077
;1077:				ent->client->ps.pm_flags |= PMF_FOLLOW;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1078
;1078:				ent->client->ps.eFlags = flags;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1079
;1079:				return;
ADDRGP4 $375
JUMPV
LABELV $386
line 1080
;1080:			} else {
line 1082
;1081:				// drop them to free spectators unless they are dedicated camera followers
;1082:				if ( ent->client->sess.spectatorClient >= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 804
ADDP4
INDIRI4
CNSTI4 0
LTI4 $388
line 1083
;1083:					ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 800
ADDP4
CNSTI4 1
ASGNI4
line 1084
;1084:					ClientBegin( ent->client - level.clients );
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1736
DIVI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1085
;1085:				}
LABELV $388
line 1086
;1086:			}
line 1087
;1087:		}
LABELV $384
line 1088
;1088:	}
LABELV $376
line 1090
;1089:
;1090:	if ( ent->client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
CNSTI4 3
NEI4 $390
line 1091
;1091:		ent->client->ps.pm_flags |= PMF_SCOREBOARD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 1092
;1092:	} else {
ADDRGP4 $391
JUMPV
LABELV $390
line 1093
;1093:		ent->client->ps.pm_flags &= ~PMF_SCOREBOARD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 1094
;1094:	}
LABELV $391
line 1095
;1095:}
LABELV $375
endproc SpectatorClientEndFrame 20 4
bss
align 4
LABELV $393
skip 1312
export ClientEndFrame
code
proc ClientEndFrame 40 12
line 1107
;1096:
;1097:
;1098:/*
;1099:==============
;1100:ClientEndFrame
;1101:
;1102:Called at the end of each server frame for each connected client
;1103:A fast client will have multiple ClientThink for each ClientEdFrame,
;1104:while a slow client may have multiple ClientEndFrame between ClientThink.
;1105:==============
;1106:*/
;1107:void ClientEndFrame( gentity_t *ent ) {
line 1114
;1108:	static gentity_t sent;
;1109:	int			i;
;1110:	gclient_t	*client;
;1111:	// unlagged
;1112:	int			frames;
;1113:
;1114:	if ( !ent->client )
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $394
line 1115
;1115:		return;
ADDRGP4 $392
JUMPV
LABELV $394
line 1117
;1116:
;1117:	ent->r.svFlags &= ~svf_self_portal2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRGP4 svf_self_portal2
INDIRI4
BCOMI4
BANDI4
ASGNI4
line 1119
;1118:
;1119:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
NEI4 $396
line 1120
;1120:		SpectatorClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpectatorClientEndFrame
CALLV
pop
line 1121
;1121:		return;
ADDRGP4 $392
JUMPV
LABELV $396
line 1124
;1122:	}
;1123:
;1124:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ASGNP4
line 1127
;1125:
;1126:	// turn off any expired powerups
;1127:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $398
line 1128
;1128:		if ( client->ps.powerups[ i ] < client->pers.cmd.serverTime ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
GEI4 $402
line 1129
;1129:			client->ps.powerups[ i ] = 0;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 312
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1130
;1130:		}
LABELV $402
line 1131
;1131:	}
LABELV $399
line 1127
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $398
line 1164
;1132:
;1133:#ifdef MISSIONPACK
;1134:	// set powerup for player animation
;1135:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;1136:		ent->client->ps.powerups[PW_GUARD] = level.time;
;1137:	}
;1138:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
;1139:		ent->client->ps.powerups[PW_SCOUT] = level.time;
;1140:	}
;1141:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_DOUBLER ) {
;1142:		ent->client->ps.powerups[PW_DOUBLER] = level.time;
;1143:	}
;1144:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
;1145:		ent->client->ps.powerups[PW_AMMOREGEN] = level.time;
;1146:	}
;1147:	if ( ent->client->invulnerabilityTime > level.time ) {
;1148:		ent->client->ps.powerups[PW_INVULNERABILITY] = level.time;
;1149:	}
;1150:#endif
;1151:
;1152:	// save network bandwidth
;1153:#if 0
;1154:	if ( !g_synchronousClients->integer && ent->client->ps.pm_type == PM_NORMAL ) {
;1155:		// FIXME: this must change eventually for non-sync demo recording
;1156:		VectorClear( ent->client->ps.viewangles );
;1157:	}
;1158:#endif
;1159:
;1160:	//
;1161:	// If the end of unit layout is displayed, don't give
;1162:	// the player any normal movement attributes
;1163:	//
;1164:	if ( level.intermissiontime ) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $404
line 1165
;1165:		client->ps.commandTime = client->pers.cmd.serverTime;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
ASGNI4
line 1166
;1166:		return;
ADDRGP4 $392
JUMPV
LABELV $404
line 1170
;1167:	}
;1168:
;1169:	// burn from lava, etc
;1170:	P_WorldEffects (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_WorldEffects
CALLV
pop
line 1173
;1171:
;1172:	// apply all the damage taken this frame
;1173:	P_DamageFeedback (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_DamageFeedback
CALLV
pop
line 1175
;1174:
;1175:	client->ps.stats[STAT_HEALTH] = ent->health;	// FIXME: get rid of ent->health...
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 1177
;1176:
;1177:	G_SetClientSound( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_SetClientSound
CALLV
pop
line 1180
;1178:
;1179:	// set the latest info
;1180:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1182
;1181:
;1182:	SendPendingPredictableEvents( &client->ps );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1184
;1183:
;1184:	client->ps.eFlags &= ~EF_CONNECTION;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 1185
;1185:	ent->s.eFlags &= ~EF_CONNECTION;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 1187
;1186:
;1187:	frames = level.framenum - client->lastUpdateFrame - 1;
ADDRLP4 8
ADDRGP4 level+28
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRI4
SUBI4
CNSTI4 1
SUBI4
ASGNI4
line 1190
;1188:
;1189:	// PVS prediction
;1190:	if ( g_predictPVS.integer && svf_self_portal2 ) {
ADDRGP4 g_predictPVS+12
INDIRI4
CNSTI4 0
EQI4 $408
ADDRGP4 svf_self_portal2
INDIRI4
CNSTI4 0
EQI4 $408
line 1192
;1191:		int lag;
;1192:		sent.s = ent->s;
ADDRGP4 $393
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 456
line 1193
;1193:		sent.r = ent->r;
ADDRGP4 $393+456
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRB
ASGNB 556
line 1194
;1194:		sent.clipmask = ent->clipmask;
ADDRGP4 $393+1068
ADDRFP4 0
INDIRP4
CNSTI4 1068
ADDP4
INDIRI4
ASGNI4
line 1197
;1195:		//VectorCopy( client->ps.origin, sent.s.pos.trBase );
;1196:		//VectorCopy( client->ps.velocity, sent.s.pos.trDelta );
;1197:		lag = level.time - client->ps.commandTime + 50;
ADDRLP4 24
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
SUBI4
CNSTI4 50
ADDI4
ASGNI4
line 1198
;1198:		if ( lag > 500 )
ADDRLP4 24
INDIRI4
CNSTI4 500
LEI4 $414
line 1199
;1199:			lag = 500;
ADDRLP4 24
CNSTI4 500
ASGNI4
LABELV $414
line 1200
;1200:		G_PredictPlayerMove( &sent, (float)lag * 0.001f );
ADDRGP4 $393
ARGP4
ADDRLP4 24
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ARGF4
ADDRGP4 G_PredictPlayerMove
CALLV
pop
line 1201
;1201:		VectorCopy( sent.s.pos.trBase, ent->r.unused.origin2 );
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRGP4 $393+12+12
INDIRB
ASGNB 12
line 1202
;1202:		ent->r.unused.origin2[2] += client->ps.viewheight;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1203
;1203:		ent->r.svFlags |= svf_self_portal2;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
ADDRGP4 svf_self_portal2
INDIRI4
BORI4
ASGNI4
line 1204
;1204:	}
LABELV $408
line 1206
;1205:
;1206:	if ( frames > 2 ) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LEI4 $418
line 1208
;1207:		// limit lagged player prediction to 2 server frames
;1208:		frames = 2;
ADDRLP4 8
CNSTI4 2
ASGNI4
line 1210
;1209:		// and add the EF_CONNECTION flag if we haven't gotten commands recently
;1210:		if ( !( ent->r.svFlags & SVF_BOT ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $420
line 1211
;1211:			client->ps.eFlags |= EF_CONNECTION;
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 1212
;1212:			ent->s.eFlags |= EF_CONNECTION;
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
CNSTI4 8192
BORI4
ASGNI4
line 1213
;1213:		}
LABELV $420
line 1214
;1214:	}
LABELV $418
line 1216
;1215:
;1216:	if ( frames > 0 && g_smoothClients.integer ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
LEI4 $422
ADDRGP4 g_smoothClients+12
INDIRI4
CNSTI4 0
EQI4 $422
line 1217
;1217:		G_PredictPlayerMove( ent, (float)frames / sv_fps.value );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRGP4 sv_fps+8
INDIRF4
DIVF4
ARGF4
ADDRGP4 G_PredictPlayerMove
CALLV
pop
line 1218
;1218:		SnapVector( ent->s.pos.trBase );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1219
;1219:	}
LABELV $422
line 1222
;1220:
;1221:	// unlagged
;1222:	G_StoreHistory( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_StoreHistory
CALLV
pop
line 1225
;1223:
;1224:	// hitsounds
;1225:	if ( client->damage.enemy && client->damage.amount ) {
ADDRLP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRI4
CNSTI4 0
EQI4 $426
ADDRLP4 0
INDIRP4
CNSTI4 1732
ADDP4
INDIRI4
CNSTI4 0
EQI4 $426
line 1226
;1226:		client->ps.persistant[PERS_HITS] += client->damage.enemy;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1227
;1227:		client->damage.enemy = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1728
ADDP4
CNSTI4 0
ASGNI4
line 1229
;1228:		// scale damage by max.health
;1229:		i = client->damage.amount * 100 / client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 1732
ADDP4
INDIRI4
CNSTI4 100
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
DIVI4
ASGNI4
line 1231
;1230:		// avoid high-byte setup
;1231:		if ( i > 255 )
ADDRLP4 4
INDIRI4
CNSTI4 255
LEI4 $428
line 1232
;1232:			i = 255;
ADDRLP4 4
CNSTI4 255
ASGNI4
LABELV $428
line 1233
;1233:		client->ps.persistant[PERS_ATTACKEE_ARMOR] = i;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1234
;1234:		client->damage.amount = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1732
ADDP4
CNSTI4 0
ASGNI4
line 1235
;1235:	} else if ( client->damage.team ) {
ADDRGP4 $427
JUMPV
LABELV $426
ADDRLP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRI4
CNSTI4 0
EQI4 $430
line 1236
;1236:		client->ps.persistant[PERS_HITS] -= client->damage.team;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1237
;1237:		client->damage.team = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1724
ADDP4
CNSTI4 0
ASGNI4
line 1238
;1238:	}
LABELV $430
LABELV $427
line 1243
;1239:
;1240:	// set the bit for the reachability area the client is currently in
;1241://	i = trap_AAS_PointReachabilityAreaIndex( ent->client->ps.origin );
;1242://	ent->client->areabits[i >> 3] |= 1 << (i & 7);
;1243:}
LABELV $392
endproc ClientEndFrame 40 12
import BotTestSolid
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
LABELV $286
byte 1 51
byte 1 51
byte 1 0
align 1
LABELV $282
byte 1 56
byte 1 0
align 1
LABELV $281
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $203
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 110
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $199
byte 1 68
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
