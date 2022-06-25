data
export playerMins
align 4
LABELV playerMins
byte 4 3245342720
byte 4 3245342720
byte 4 3250585600
export playerMaxs
align 4
LABELV playerMaxs
byte 4 1097859072
byte 4 1097859072
byte 4 1107296256
export SP_info_player_deathmatch
code
proc SP_info_player_deathmatch 8 12
file "..\..\..\..\code\game\g_client.c"
line 23
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:#if defined USE_NATIVE_HACK
;6:#include "../../../Quake3e-master/code/vrmod/VRMOD_input.h"
;7:#endif
;8:
;9:// g_client.c -- client functions that don't happen every frame
;10:
;11:const vec3_t	playerMins = {-15, -15, -24};
;12:const vec3_t	playerMaxs = { 15,  15,  32};
;13:
;14:static char	ban_reason[MAX_CVAR_VALUE_STRING];
;15:
;16:/*QUAKED info_player_deathmatch (1 0 1) (-16 -16 -24) (16 16 32) initial
;17:potential spawning position for deathmatch games.
;18:The first time a player enters the game, they will be at an 'initial' spot.
;19:Targets will be fired when someone spawns in on them.
;20:"nobots" will prevent bots from using this spot.
;21:"nohumans" will prevent non-bots from using this spot.
;22:*/
;23:void SP_info_player_deathmatch( gentity_t *ent ) {
line 26
;24:	int		i;
;25:
;26:	G_SpawnInt( "nobots", "0", &i);
ADDRGP4 $55
ARGP4
ADDRGP4 $56
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 27
;27:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $57
line 28
;28:		ent->flags |= FL_NO_BOTS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1032
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
line 29
;29:	}
LABELV $57
line 30
;30:	G_SpawnInt( "nohumans", "0", &i );
ADDRGP4 $59
ARGP4
ADDRGP4 $56
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 31
;31:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $60
line 32
;32:		ent->flags |= FL_NO_HUMANS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 33
;33:	}
LABELV $60
line 34
;34:}
LABELV $54
endproc SP_info_player_deathmatch 8 12
export SP_info_player_start
proc SP_info_player_start 0 4
line 39
;35:
;36:/*QUAKED info_player_start (1 0 0) (-16 -16 -24) (16 16 32)
;37:equivalent to info_player_deathmatch
;38:*/
;39:void SP_info_player_start(gentity_t *ent) {
line 40
;40:	ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 1020
ADDP4
ADDRGP4 $63
ASGNP4
line 41
;41:	SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 42
;42:}
LABELV $62
endproc SP_info_player_start 0 4
export SP_info_player_intermission
proc SP_info_player_intermission 0 0
line 47
;43:
;44:/*QUAKED info_player_intermission (1 0 1) (-16 -16 -24) (16 16 32)
;45:The intermission will be viewed from this point.  Target an info_notnull for the view direction.
;46:*/
;47:void SP_info_player_intermission( gentity_t *ent ) {
line 49
;48:
;49:}
LABELV $64
endproc SP_info_player_intermission 0 0
export SpotWouldTelefrag
proc SpotWouldTelefrag 4144 16
line 67
;50:
;51:
;52:
;53:/*
;54:=======================================================================
;55:
;56:  SelectSpawnPoint
;57:
;58:=======================================================================
;59:*/
;60:
;61:/*
;62:================
;63:SpotWouldTelefrag
;64:
;65:================
;66:*/
;67:qboolean SpotWouldTelefrag( gentity_t *spot ) {
line 73
;68:	int			i, num;
;69:	int			touch[MAX_GENTITIES];
;70:	gentity_t	*hit;
;71:	vec3_t		mins, maxs;
;72:
;73:	VectorAdd( spot->s.origin, playerMins, mins );
ADDRLP4 4132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4132
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMins
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4132
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMins+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMins+8
INDIRF4
ADDF4
ASGNF4
line 74
;74:	VectorAdd( spot->s.origin, playerMaxs, maxs );
ADDRLP4 4136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4136
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMaxs
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4136
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMaxs+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMaxs+8
INDIRF4
ADDF4
ASGNF4
line 75
;75:	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 4108
ARGP4
ADDRLP4 4120
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4140
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4140
INDIRI4
ASGNI4
line 77
;76:
;77:	for (i=0 ; i<num ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $77
JUMPV
LABELV $74
line 78
;78:		hit = &g_entities[touch[i]];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 80
;79:		//if ( hit->client && hit->client->ps.stats[STAT_HEALTH] > 0 ) {
;80:		if ( hit->client) {
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $78
line 81
;81:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $65
JUMPV
LABELV $78
line 84
;82:		}
;83:
;84:	}
LABELV $75
line 77
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $77
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $74
line 86
;85:
;86:	return qfalse;
CNSTI4 0
RETI4
LABELV $65
endproc SpotWouldTelefrag 4144 16
proc SelectRandomFurthestSpawnPoint 596 4
line 98
;87:}
;88:
;89:
;90:/*
;91:===========
;92:SelectRandomFurthestSpawnPoint
;93:
;94:Chooses a player start, deathmatch start, etc
;95:============
;96:*/
;97:#define	MAX_SPAWN_POINTS 64
;98:static gentity_t *SelectRandomFurthestSpawnPoint( const gentity_t *ent, vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 111
;99:	gentity_t	*spot;
;100:	vec3_t		delta;
;101:	float		dist;
;102:	float		list_dist[MAX_SPAWN_POINTS];
;103:	gentity_t	*list_spot[MAX_SPAWN_POINTS];
;104:	int			numSpots, i, j, n;
;105:	int			selection;
;106:	int			checkTelefrag;
;107:	int			checkType;
;108:	int			checkMask;
;109:	qboolean	isBot;
;110:
;111:	checkType = qtrue;
ADDRLP4 552
CNSTI4 1
ASGNI4
line 112
;112:	checkTelefrag = qtrue;
ADDRLP4 548
CNSTI4 1
ASGNI4
line 114
;113:
;114:	if ( ent )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $81
line 115
;115:		isBot = ((ent->r.svFlags & SVF_BOT) == SVF_BOT); 
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 8
NEI4 $84
ADDRLP4 568
CNSTI4 1
ASGNI4
ADDRGP4 $85
JUMPV
LABELV $84
ADDRLP4 568
CNSTI4 0
ASGNI4
LABELV $85
ADDRLP4 556
ADDRLP4 568
INDIRI4
ASGNI4
ADDRGP4 $82
JUMPV
LABELV $81
line 117
;116:	else
;117:		isBot = qfalse;
ADDRLP4 556
CNSTI4 0
ASGNI4
LABELV $82
line 119
;118:
;119:	checkMask = 3;
ADDRLP4 560
CNSTI4 3
ASGNI4
LABELV $86
line 123
;120:
;121:__search:
;122:
;123:	checkTelefrag = checkMask & 1;
ADDRLP4 548
ADDRLP4 560
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 124
;124:	checkType = checkMask & 2;
ADDRLP4 552
ADDRLP4 560
INDIRI4
CNSTI4 2
BANDI4
ASGNI4
line 126
;125:
;126:	numSpots = 0;
ADDRLP4 520
CNSTI4 0
ASGNI4
line 127
;127:	for ( n = 0 ; n < level.numSpawnSpots ; n++ ) {
ADDRLP4 544
CNSTI4 0
ASGNI4
ADDRGP4 $90
JUMPV
LABELV $87
line 128
;128:		spot = level.spawnSpots[n];
ADDRLP4 528
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7688
ADDP4
INDIRP4
ASGNP4
line 130
;129:
;130:		if ( spot->fteam != TEAM_FREE && level.numSpawnSpotsFFA > 0 )
ADDRLP4 528
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $93
ADDRGP4 level+11792
INDIRI4
CNSTI4 0
LEI4 $93
line 131
;131:			continue;
ADDRGP4 $88
JUMPV
LABELV $93
line 133
;132:
;133:		if ( checkTelefrag && SpotWouldTelefrag( spot ) )
ADDRLP4 548
INDIRI4
CNSTI4 0
EQI4 $96
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 572
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 572
INDIRI4
CNSTI4 0
EQI4 $96
line 134
;134:			continue;
ADDRGP4 $88
JUMPV
LABELV $96
line 136
;135:
;136:		if ( checkType ) 
ADDRLP4 552
INDIRI4
CNSTI4 0
EQI4 $98
line 137
;137:		{
line 138
;138:			if ( (spot->flags & FL_NO_BOTS) && isBot )
ADDRLP4 528
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $100
ADDRLP4 556
INDIRI4
CNSTI4 0
EQI4 $100
line 139
;139:				continue;
ADDRGP4 $88
JUMPV
LABELV $100
line 140
;140:			if ( (spot->flags & FL_NO_HUMANS) && !isBot )
ADDRLP4 528
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $102
ADDRLP4 556
INDIRI4
CNSTI4 0
NEI4 $102
line 141
;141:				continue;
ADDRGP4 $88
JUMPV
LABELV $102
line 142
;142:		}
LABELV $98
line 144
;143:
;144:		VectorSubtract( spot->s.origin, avoidPoint, delta );
ADDRLP4 580
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 532
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 580
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+4
ADDRLP4 528
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 580
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+8
ADDRLP4 528
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 145
;145:		dist = VectorLength( delta );
ADDRLP4 532
ARGP4
ADDRLP4 584
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 524
ADDRLP4 584
INDIRF4
ASGNF4
line 147
;146:
;147:		for ( i = 0; i < numSpots; i++ )
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRGP4 $109
JUMPV
LABELV $106
line 148
;148:		{
line 149
;149:			if( dist > list_dist[i] )
ADDRLP4 524
INDIRF4
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
LEF4 $110
line 150
;150:			{
line 151
;151:				if (numSpots >= MAX_SPAWN_POINTS)
ADDRLP4 520
INDIRI4
CNSTI4 64
LTI4 $112
line 152
;152:					numSpots = MAX_SPAWN_POINTS - 1;
ADDRLP4 520
CNSTI4 63
ASGNI4
LABELV $112
line 154
;153:
;154:				for( j = numSpots; j > i; j-- )
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
ADDRGP4 $117
JUMPV
LABELV $114
line 155
;155:				{
line 156
;156:					list_dist[j] = list_dist[j-1];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRF4
ASGNF4
line 157
;157:					list_spot[j] = list_spot[j-1];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260-4
ADDP4
INDIRP4
ASGNP4
line 158
;158:				}
LABELV $115
line 154
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $117
ADDRLP4 0
INDIRI4
ADDRLP4 516
INDIRI4
GTI4 $114
line 160
;159:
;160:				list_dist[i] = dist;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 161
;161:				list_spot[i] = spot;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 163
;162:
;163:				numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 164
;164:				break;
ADDRGP4 $108
JUMPV
LABELV $110
line 166
;165:			}
;166:		}
LABELV $107
line 147
ADDRLP4 516
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $109
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $106
LABELV $108
line 168
;167:
;168:		if(i >= numSpots && numSpots < MAX_SPAWN_POINTS)
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $120
ADDRLP4 520
INDIRI4
CNSTI4 64
GEI4 $120
line 169
;169:		{
line 170
;170:			list_dist[numSpots] = dist;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 171
;171:			list_spot[numSpots] = spot;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 172
;172:			numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 173
;173:		}
LABELV $120
line 174
;174:	}
LABELV $88
line 127
ADDRLP4 544
ADDRLP4 544
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $90
ADDRLP4 544
INDIRI4
ADDRGP4 level+11784
INDIRI4
LTI4 $87
line 176
;175:
;176:	if ( !numSpots ) {
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $122
line 177
;177:		if ( checkMask <= 0 ) {
ADDRLP4 560
INDIRI4
CNSTI4 0
GTI4 $124
line 178
;178:			G_Error( "Couldn't find a spawn point" );
ADDRGP4 $126
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 179
;179:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $80
JUMPV
LABELV $124
line 181
;180:		}
;181:		checkMask--;
ADDRLP4 560
ADDRLP4 560
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 182
;182:		goto __search; // next attempt with different flags
ADDRGP4 $86
JUMPV
LABELV $122
line 186
;183:	}
;184:
;185:	// select a random spot from the spawn points furthest away
;186:	selection = random() * (numSpots / 2);
ADDRLP4 572
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 564
ADDRLP4 572
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 520
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 187
;187:	spot = list_spot[ selection ];
ADDRLP4 528
ADDRLP4 564
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
ASGNP4
line 189
;188:
;189:	VectorCopy( spot->s.angles, angles );
ADDRFP4 12
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 190
;190:	VectorCopy( spot->s.origin, origin );
ADDRFP4 8
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 191
;191:	origin[2] += 9.0f;
ADDRLP4 576
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 576
INDIRP4
ADDRLP4 576
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 193
;192:
;193:	return spot;
ADDRLP4 528
INDIRP4
RETP4
LABELV $80
endproc SelectRandomFurthestSpawnPoint 596 4
export SelectSpawnPoint
proc SelectSpawnPoint 4 16
line 204
;194:}
;195:
;196:
;197:/*
;198:===========
;199:SelectSpawnPoint
;200:
;201:Chooses a player start, deathmatch start, etc
;202:============
;203:*/
;204:gentity_t *SelectSpawnPoint( gentity_t *ent, vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 205
;205:	return SelectRandomFurthestSpawnPoint( ent, avoidPoint, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 SelectRandomFurthestSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $127
endproc SelectSpawnPoint 4 16
export SelectInitialSpawnPoint
proc SelectInitialSpawnPoint 20 16
line 217
;206:}
;207:
;208:
;209:/*
;210:===========
;211:SelectInitialSpawnPoint
;212:
;213:Try to find a spawn point marked 'initial', otherwise
;214:use normal spawn selection.
;215:============
;216:*/
;217:gentity_t *SelectInitialSpawnPoint( gentity_t *ent, vec3_t origin, vec3_t angles ) {
line 221
;218:	gentity_t	*spot;
;219:	int n;
;220:
;221:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 223
;222:
;223:	for ( n = 0; n < level.numSpawnSpotsFFA; n++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $132
JUMPV
LABELV $129
line 224
;224:		spot = level.spawnSpots[ n ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7688
ADDP4
INDIRP4
ASGNP4
line 225
;225:		if ( spot->fteam != TEAM_FREE )
ADDRLP4 0
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $135
line 226
;226:			continue;
ADDRGP4 $130
JUMPV
LABELV $135
line 227
;227:		if ( spot->spawnflags & 1 )
ADDRLP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $137
line 228
;228:			break;
ADDRGP4 $131
JUMPV
LABELV $137
line 230
;229:		else
;230:			spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 231
;231:	}
LABELV $130
line 223
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $132
ADDRLP4 4
INDIRI4
ADDRGP4 level+11792
INDIRI4
LTI4 $129
LABELV $131
line 233
;232:
;233:	if ( !spot || SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $141
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $139
LABELV $141
line 234
;234:		return SelectSpawnPoint( ent, vec3_origin, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
RETP4
ADDRGP4 $128
JUMPV
LABELV $139
line 237
;235:	}
;236:
;237:	VectorCopy( spot->s.angles, angles );
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 238
;238:	VectorCopy( spot->s.origin, origin );
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 239
;239:	origin[2] += 9.0f;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 241
;240:
;241:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $128
endproc SelectInitialSpawnPoint 20 16
export SelectSpectatorSpawnPoint
proc SelectSpectatorSpawnPoint 0 0
line 251
;242:}
;243:
;244:
;245:/*
;246:===========
;247:SelectSpectatorSpawnPoint
;248:
;249:============
;250:*/
;251:gentity_t *SelectSpectatorSpawnPoint( vec3_t origin, vec3_t angles ) {
line 252
;252:	FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 254
;253:
;254:	VectorCopy( level.intermission_origin, origin );
ADDRFP4 0
INDIRP4
ADDRGP4 level+7616
INDIRB
ASGNB 12
line 255
;255:	VectorCopy( level.intermission_angle, angles );
ADDRFP4 4
INDIRP4
ADDRGP4 level+7628
INDIRB
ASGNB 12
line 257
;256:
;257:	return level.spawnSpots[ SPAWN_SPOT_INTERMISSION ]; // was NULL
ADDRGP4 level+7688+4092
INDIRP4
RETP4
LABELV $142
endproc SelectSpectatorSpawnPoint 0 0
export InitBodyQue
proc InitBodyQue 12 0
line 274
;258:}
;259:
;260:
;261:/*
;262:=======================================================================
;263:
;264:BODYQUE
;265:
;266:=======================================================================
;267:*/
;268:
;269:/*
;270:===============
;271:InitBodyQue
;272:===============
;273:*/
;274:void InitBodyQue (void) {
line 278
;275:	int		i;
;276:	gentity_t	*ent;
;277:
;278:	level.bodyQueIndex = 0;
ADDRGP4 level+7652
CNSTI4 0
ASGNI4
line 279
;279:	for (i=0; i<BODY_QUEUE_SIZE ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $149
line 280
;280:		ent = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 281
;281:		ent->classname = "bodyque";
ADDRLP4 0
INDIRP4
CNSTI4 1020
ADDP4
ADDRGP4 $153
ASGNP4
line 282
;282:		ent->neverFree = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1028
ADDP4
CNSTI4 1
ASGNI4
line 283
;283:		level.bodyQue[i] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7656
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 284
;284:	}
LABELV $150
line 279
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $149
line 285
;285:}
LABELV $147
endproc InitBodyQue 12 0
export BodySink
proc BodySink 4 4
line 294
;286:
;287:/*
;288:=============
;289:BodySink
;290:
;291:After sitting around for five seconds, fall into the ground and disappear
;292:=============
;293:*/
;294:void BodySink( gentity_t *ent ) {
line 295
;295:	if ( level.time - ent->timestamp > 6500 ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1136
ADDP4
INDIRI4
SUBI4
CNSTI4 6500
LEI4 $156
line 297
;296:		// the body ques are never actually freed, they are just unlinked
;297:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 298
;298:		ent->physicsObject = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1060
ADDP4
CNSTI4 0
ASGNI4
line 299
;299:		return;	
ADDRGP4 $155
JUMPV
LABELV $156
line 301
;300:	}
;301:	ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 1184
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 302
;302:	ent->s.pos.trBase[2] -= 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 303
;303:}
LABELV $155
endproc BodySink 4 4
export CopyToBodyQue
proc CopyToBodyQue 48 8
line 314
;304:
;305:
;306:/*
;307:=============
;308:CopyToBodyQue
;309:
;310:A player is respawning, so make an entity that looks
;311:just like the existing corpse to leave behind.
;312:=============
;313:*/
;314:void CopyToBodyQue( gentity_t *ent ) {
line 322
;315:#ifdef MISSIONPACK
;316:	gentity_t	*e;
;317:	int i;
;318:#endif
;319:	gentity_t		*body;
;320:	int			contents;
;321:
;322:	trap_UnlinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 325
;323:
;324:	// if client is in a nodrop area, don't leave the body
;325:	contents = trap_PointContents( ent->s.origin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 8
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 326
;326:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $161
line 327
;327:		return;
ADDRGP4 $160
JUMPV
LABELV $161
line 331
;328:	}
;329:
;330:	// grab a body que and cycle to the next one
;331:	body = level.bodyQue[ level.bodyQueIndex ];
ADDRLP4 0
ADDRGP4 level+7652
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7656
ADDP4
INDIRP4
ASGNP4
line 332
;332:	level.bodyQueIndex = (level.bodyQueIndex + 1) % BODY_QUEUE_SIZE;
ADDRGP4 level+7652
ADDRGP4 level+7652
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 8
MODI4
ASGNI4
line 334
;333:
;334:	trap_UnlinkEntity (body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 336
;335:
;336:	body->s = ent->s;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 456
line 337
;337:	body->s.eFlags = EF_DEAD;		// clear EF_TALK, etc
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
line 356
;338:#ifdef MISSIONPACK
;339:	if ( ent->s.eFlags & EF_KAMIKAZE ) {
;340:		body->s.eFlags |= EF_KAMIKAZE;
;341:
;342:		// check if there is a kamikaze timer around for this owner
;343:		for (i = 0; i < level.num_entities; i++) {
;344:			e = &g_entities[i];
;345:			if (!e->inuse)
;346:				continue;
;347:			if (e->activator != ent)
;348:				continue;
;349:			if (strcmp(e->classname, "kamikaze timer"))
;350:				continue;
;351:			e->activator = body;
;352:			break;
;353:		}
;354:	}
;355:#endif
;356:	body->s.powerups = 0;	// clear powerups
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 357
;357:	body->s.loopSound = 0;	// clear lava burning
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 358
;358:	body->s.number = body - g_entities;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1312
DIVI4
ASGNI4
line 359
;359:	body->timestamp = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 1136
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 360
;360:	body->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1060
ADDP4
CNSTI4 1
ASGNI4
line 361
;361:	body->physicsBounce = 0;		// don't bounce
ADDRLP4 0
INDIRP4
CNSTI4 1064
ADDP4
CNSTF4 0
ASGNF4
line 362
;362:	if ( body->s.groundEntityNum == ENTITYNUM_NONE ) {
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $168
line 363
;363:		body->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 364
;364:		body->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 365
;365:		VectorCopy( ent->client->ps.velocity, body->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 366
;366:	} else {
ADDRGP4 $169
JUMPV
LABELV $168
line 367
;367:		body->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 368
;368:	}
LABELV $169
line 369
;369:	body->s.event = 0;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 373
;370:
;371:	// change the animation to the last-frame only, so the sequence
;372:	// doesn't repeat anew for the body
;373:	switch ( body->s.legsAnim & ~ANIM_TOGGLEBIT ) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $171
ADDRLP4 16
INDIRI4
CNSTI4 5
GTI4 $171
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $177
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $177
address $174
address $174
address $175
address $175
address $176
address $176
code
LABELV $174
line 376
;374:	case BOTH_DEATH1:
;375:	case BOTH_DEAD1:
;376:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD1;
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 377
;377:		break;
ADDRGP4 $172
JUMPV
LABELV $175
line 380
;378:	case BOTH_DEATH2:
;379:	case BOTH_DEAD2:
;380:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD2;
ADDRLP4 36
CNSTI4 3
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 381
;381:		break;
ADDRGP4 $172
JUMPV
LABELV $176
LABELV $171
line 385
;382:	case BOTH_DEATH3:
;383:	case BOTH_DEAD3:
;384:	default:
;385:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD3;
ADDRLP4 44
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 386
;386:		break;
LABELV $172
line 389
;387:	}
;388:
;389:	body->r.svFlags = ent->r.svFlags;
ADDRLP4 0
INDIRP4
CNSTI4 920
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
ASGNI4
line 390
;390:	VectorCopy (ent->r.mins, body->r.mins);
ADDRLP4 0
INDIRP4
CNSTI4 932
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
INDIRB
ASGNB 12
line 391
;391:	VectorCopy (ent->r.maxs, body->r.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRB
ASGNB 12
line 392
;392:	VectorCopy (ent->r.absmin, body->r.absmin);
ADDRLP4 0
INDIRP4
CNSTI4 960
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 960
ADDP4
INDIRB
ASGNB 12
line 393
;393:	VectorCopy (ent->r.absmax, body->r.absmax);
ADDRLP4 0
INDIRP4
CNSTI4 972
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 972
ADDP4
INDIRB
ASGNB 12
line 395
;394:
;395:	body->clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 1068
ADDP4
CNSTI4 65537
ASGNI4
line 396
;396:	body->r.contents = CONTENTS_CORPSE;
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 67108864
ASGNI4
line 397
;397:	body->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 1008
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 399
;398:
;399:	body->nextthink = level.time + 5000;
ADDRLP4 0
INDIRP4
CNSTI4 1184
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 400
;400:	body->think = BodySink;
ADDRLP4 0
INDIRP4
CNSTI4 1188
ADDP4
ADDRGP4 BodySink
ASGNP4
line 402
;401:
;402:	body->die = body_die;
ADDRLP4 0
INDIRP4
CNSTI4 1212
ADDP4
ADDRGP4 body_die
ASGNP4
line 405
;403:
;404:	// don't take more damage if already gibbed
;405:	if ( ent->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $179
line 406
;406:		body->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 1232
ADDP4
CNSTI4 0
ASGNI4
line 407
;407:	} else {
ADDRGP4 $180
JUMPV
LABELV $179
line 408
;408:		body->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1232
ADDP4
CNSTI4 1
ASGNI4
line 409
;409:	}
LABELV $180
line 411
;410:
;411:	VectorCopy ( body->s.pos.trBase, body->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 984
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 412
;412:	trap_LinkEntity( body );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 413
;413:}
LABELV $160
endproc CopyToBodyQue 48 8
export SetClientViewAngle
proc SetClientViewAngle 24 0
line 423
;414:
;415:
;416://======================================================================
;417:
;418:/*
;419:==================
;420:SetClientViewAngle
;421:==================
;422:*/
;423:void SetClientViewAngle( gentity_t *ent, vec3_t angle ) {
line 430
;424:	int	i, cmdAngle;
;425:#ifdef USE_VR
;426:	int vr_controller_type;
;427:#endif
;428:	gclient_t	*client;
;429:
;430:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ASGNP4
line 433
;431:
;432:#ifdef USE_VR_QVM
;433:	vr_controller_type = client->ps.vr_controller_type;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
line 442
;434:#endif
;435:
;436:#ifdef USE_NATIVE_HACK
;437:	vr_controller_type = vrinfo->vr_controller_type;
;438:#endif
;439:
;440:#ifdef USE_VR
;441:	// VR client
;442:	if ( vr_controller_type > 0)
ADDRLP4 12
INDIRI4
CNSTI4 0
LEI4 $182
line 443
;443:	{
line 445
;444:		// for correct view PITCH when respawn and previously looking up or down
;445:		int	cmdAngle = ANGLE2SHORT(angle[YAW]);
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1127615329
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 446
;446:		client->ps.delta_angles[YAW] = cmdAngle - client->pers.cmd.angles[YAW];
ADDRLP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 16
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
SUBI4
ASGNI4
line 447
;447:		ent->s.angles[YAW] = angle[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 448
;448:		client->ps.viewangles[YAW] = angle[YAW];
ADDRLP4 4
INDIRP4
CNSTI4 156
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 449
;449:	}
ADDRGP4 $183
JUMPV
LABELV $182
line 452
;450:	else
;451:#endif
;452:	{
line 455
;453:		// not VR client
;454:		// set the delta angle
;455:		for ( i = 0; i < 3; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $184
line 456
;456:			cmdAngle = ANGLE2SHORT(angle[i]);
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
CNSTF4 1127615329
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 457
;457:			client->ps.delta_angles[i] = cmdAngle - client->pers.cmd.angles[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 56
ADDP4
ADDP4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 568
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 458
;458:		}
LABELV $185
line 455
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $184
line 459
;459:		VectorCopy( angle, ent->s.angles );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 460
;460:		VectorCopy( ent->s.angles, client->ps.viewangles );
ADDRLP4 4
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 461
;461:	}
LABELV $183
line 462
;462:}
LABELV $181
endproc SetClientViewAngle 24 0
export SetClientVrControllerAngles
proc SetClientVrControllerAngles 8 0
line 472
;463:
;464:
;465:/*
;466:==================
;467:SetClientVrControllerAngles
;468:// and keep angle when TeleportPlayer
;469:==================
;470:*/
;471:#ifdef USE_VR_QVM
;472:void SetClientVrControllerAngles( gentity_t *ent, vec3_t angle ) {
line 474
;473:	// set the delta angle
;474:	int cmdAngle = ANGLE2SHORT(angle[YAW]);
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1127615329
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 475
;475:	ent->client->ps.delta_spawn_angles[YAW] = cmdAngle - ent->client->pers.cmd.right_hand_angles[YAW];
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
SUBI4
ASGNI4
line 476
;476:	ent->s.s_rightAngles[YAW] = angle[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 477
;477:	ent->client->ps.right_hand_angles[YAW] = angle[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 478
;478:}
LABELV $188
endproc SetClientVrControllerAngles 8 0
export respawn
proc respawn 8 8
line 487
;479:#endif
;480:
;481:
;482:/*
;483:================
;484:respawn
;485:================
;486:*/
;487:void respawn( gentity_t *ent ) {
line 490
;488:	gentity_t	*tent;
;489:
;490:	if ( ent->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $190
line 491
;491:		CopyToBodyQue( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
LABELV $190
line 493
;492:
;493:	ClientSpawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 496
;494:
;495:	// bots doesn't need to see any effects
;496:	if ( level.intermissiontime && ent->r.svFlags & SVF_BOT )
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $192
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $192
line 497
;497:		return;
ADDRGP4 $189
JUMPV
LABELV $192
line 500
;498:
;499:	// add a teleportation effect
;500:	tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 43
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 501
;501:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 504
;502:
;503:	// optimize bandwidth
;504:	if ( level.intermissiontime ) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $195
line 505
;505:		tent->r.svFlags = SVF_SINGLECLIENT;
ADDRLP4 0
INDIRP4
CNSTI4 920
ADDP4
CNSTI4 256
ASGNI4
line 506
;506:		tent->r.singleClient = ent->s.clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 924
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 507
;507:	}
LABELV $195
line 508
;508:}
LABELV $189
endproc respawn 8 8
export TeamCount
proc TeamCount 8 0
line 518
;509:
;510:
;511:/*
;512:================
;513:TeamCount
;514:
;515:Returns number of players on a team
;516:================
;517:*/
;518:int TeamCount( int ignoreClientNum, team_t team ) {
line 520
;519:	int		i;
;520:	int		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 522
;521:
;522:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $202
JUMPV
LABELV $199
line 523
;523:		if ( i == ignoreClientNum ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $204
line 524
;524:			continue;
ADDRGP4 $200
JUMPV
LABELV $204
line 526
;525:		}
;526:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $206
line 527
;527:			continue;
ADDRGP4 $200
JUMPV
LABELV $206
line 529
;528:		}
;529:		if ( level.clients[i].sess.sessionTeam == team ) {
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 792
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $208
line 530
;530:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 531
;531:		}
LABELV $208
line 532
;532:	}
LABELV $200
line 522
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $202
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $199
line 534
;533:
;534:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $198
endproc TeamCount 8 0
export TeamConnectedCount
proc TeamConnectedCount 8 0
line 545
;535:}
;536:
;537:
;538:/*
;539:================
;540:TeamConnectedCount
;541:
;542:Returns number of active players on a team
;543:================
;544:*/
;545:int TeamConnectedCount( int ignoreClientNum, team_t team ) {
line 547
;546:	int		i;
;547:	int		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 549
;548:
;549:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $214
JUMPV
LABELV $211
line 550
;550:		if ( i == ignoreClientNum ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $216
line 551
;551:			continue;
ADDRGP4 $212
JUMPV
LABELV $216
line 553
;552:		}
;553:		if ( level.clients[i].pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 2
EQI4 $218
line 554
;554:			continue;
ADDRGP4 $212
JUMPV
LABELV $218
line 556
;555:		}
;556:		if ( level.clients[i].sess.sessionTeam == team ) {
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 792
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $220
line 557
;557:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 558
;558:		}
LABELV $220
line 559
;559:	}
LABELV $212
line 549
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $214
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $211
line 561
;560:
;561:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $210
endproc TeamConnectedCount 8 0
export TeamLeader
proc TeamLeader 4 0
line 572
;562:}
;563:
;564:
;565:/*
;566:================
;567:TeamLeader
;568:
;569:Returns the client number of the team leader
;570:================
;571:*/
;572:int TeamLeader( team_t team ) {
line 575
;573:	int		i;
;574:
;575:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $226
JUMPV
LABELV $223
line 576
;576:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $228
line 577
;577:			continue;
ADDRGP4 $224
JUMPV
LABELV $228
line 579
;578:		}
;579:		if ( level.clients[i].sess.sessionTeam == team ) {
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 792
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $230
line 580
;580:			if ( level.clients[i].sess.teamLeader )
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 816
ADDP4
INDIRI4
CNSTI4 0
EQI4 $232
line 581
;581:				return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $222
JUMPV
LABELV $232
line 582
;582:		}
LABELV $230
line 583
;583:	}
LABELV $224
line 575
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $226
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $223
line 585
;584:
;585:	return -1;
CNSTI4 -1
RETI4
LABELV $222
endproc TeamLeader 4 0
export PickTeam
proc PickTeam 24 8
line 594
;586:}
;587:
;588:
;589:/*
;590:================
;591:PickTeam
;592:================
;593:*/
;594:team_t PickTeam( int ignoreClientNum ) {
line 597
;595:	int		counts[TEAM_NUM_TEAMS];
;596:
;597:	counts[TEAM_BLUE] = TeamCount( ignoreClientNum, TEAM_BLUE );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 16
INDIRI4
ASGNI4
line 598
;598:	counts[TEAM_RED] = TeamCount( ignoreClientNum, TEAM_RED );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 20
INDIRI4
ASGNI4
line 600
;599:
;600:	if ( counts[TEAM_BLUE] > counts[TEAM_RED] ) {
ADDRLP4 0+8
INDIRI4
ADDRLP4 0+4
INDIRI4
LEI4 $237
line 601
;601:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $234
JUMPV
LABELV $237
line 603
;602:	}
;603:	if ( counts[TEAM_RED] > counts[TEAM_BLUE] ) {
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
LEI4 $241
line 604
;604:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $234
JUMPV
LABELV $241
line 607
;605:	}
;606:	// equal team count, so join the team with the lowest score
;607:	if ( level.teamScores[TEAM_BLUE] > level.teamScores[TEAM_RED] ) {
ADDRGP4 level+48+8
INDIRI4
ADDRGP4 level+48+4
INDIRI4
LEI4 $245
line 608
;608:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $234
JUMPV
LABELV $245
line 610
;609:	}
;610:	return TEAM_BLUE;
CNSTI4 2
RETI4
LABELV $234
endproc PickTeam 24 8
export ClientUserinfoChanged
proc ClientUserinfoChanged 2344 52
line 627
;611:}
;612:
;613:
;614:/*
;615:===========
;616:ClientUserInfoChanged
;617:
;618:Called from ClientConnect when the player first connects and
;619:directly by the server system when the player updates a userinfo variable.
;620:
;621:The game can override any of the settings and call trap_SetUserinfo
;622:if desired.
;623:
;624:returns qfalse in case of invalid userinfo
;625:============
;626:*/
;627:qboolean ClientUserinfoChanged( int clientNum ) {
line 642
;628:	gentity_t *ent;
;629:	int		teamTask, teamLeader, health;
;630:	char	*s;
;631:	char	model[MAX_QPATH];
;632:	char	headModel[MAX_QPATH];
;633:	char	oldname[MAX_NETNAME];
;634:	gclient_t	*client;
;635:	char	c1[8];
;636:	char	c2[8];
;637:	char	userinfo[MAX_INFO_STRING];
;638:	int 	vr_controller_type;
;639:	//int 	laserBeamPlayer; 
;640:	char	c3[MAX_INFO_STRING];
;641:
;642:	ent = g_entities + clientNum;
ADDRLP4 1032
ADDRFP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 643
;643:	client = ent->client;
ADDRLP4 0
ADDRLP4 1032
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ASGNP4
line 645
;644:
;645:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 648
;646:
;647:	// check for malformed or illegal info strings
;648:	if ( !Info_Validate( userinfo ) ) {
ADDRLP4 4
ARGP4
ADDRLP4 2256
ADDRGP4 Info_Validate
CALLI4
ASGNI4
ADDRLP4 2256
INDIRI4
CNSTI4 0
NEI4 $252
line 649
;649:		Q_strcpy( ban_reason, "bad userinfo" );
ADDRGP4 ban_reason
ARGP4
ADDRGP4 $254
ARGP4
ADDRGP4 Q_strcpy
CALLV
pop
line 650
;650:		if ( client && client->pers.connected != CON_DISCONNECTED )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $255
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $255
line 651
;651:			trap_DropClient( clientNum, ban_reason );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ban_reason
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
LABELV $255
line 652
;652:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $251
JUMPV
LABELV $252
line 655
;653:	}
;654:
;655:	if ( client->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $257
line 658
;656:		// we just checked if connecting player can join server
;657:		// so quit now as some important data like player team is still not set
;658:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $251
JUMPV
LABELV $257
line 662
;659:	}
;660:
;661:	// check for local client
;662:	s = Info_ValueForKey( userinfo, "ip" );
ADDRLP4 4
ARGP4
ADDRGP4 $259
ARGP4
ADDRLP4 2260
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 2260
INDIRP4
ASGNP4
line 663
;663:	if ( !strcmp( s, "localhost" ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $262
ARGP4
ADDRLP4 2264
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2264
INDIRI4
CNSTI4 0
NEI4 $260
line 664
;664:		client->pers.localClient = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
CNSTI4 1
ASGNI4
line 665
;665:	} else {
ADDRGP4 $261
JUMPV
LABELV $260
line 666
;666:		client->pers.localClient = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
CNSTI4 0
ASGNI4
line 667
;667:	}
LABELV $261
line 670
;668:
;669:	// check the item prediction
;670:	s = Info_ValueForKey( userinfo, "cg_predictItems" );
ADDRLP4 4
ARGP4
ADDRGP4 $263
ARGP4
ADDRLP4 2268
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 2268
INDIRP4
ASGNP4
line 671
;671:	if ( !atoi( s ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 2272
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2272
INDIRI4
CNSTI4 0
NEI4 $264
line 672
;672:		client->pers.predictItemPickup = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTI4 0
ASGNI4
line 673
;673:	} else {
ADDRGP4 $265
JUMPV
LABELV $264
line 674
;674:		client->pers.predictItemPickup = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTI4 1
ASGNI4
line 675
;675:	}
LABELV $265
line 678
;676:
;677:	// set name
;678:	Q_strncpyz( oldname, client->pers.netname, sizeof( oldname ) );
ADDRLP4 1180
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 679
;679:	s = Info_ValueForKey( userinfo, "name" );
ADDRLP4 4
ARGP4
ADDRGP4 $266
ARGP4
ADDRLP4 2276
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 2276
INDIRP4
ASGNP4
line 680
;680:	BG_CleanName( s, client->pers.netname, sizeof( client->pers.netname ), "UnnamedPlayer" );
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 $267
ARGP4
ADDRGP4 BG_CleanName
CALLV
pop
line 682
;681:
;682:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
NEI4 $268
line 683
;683:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
CNSTI4 3
NEI4 $270
line 684
;684:			Q_strncpyz( client->pers.netname, "scoreboard", sizeof(client->pers.netname) );
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRGP4 $272
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 685
;685:		}
LABELV $270
line 686
;686:	}
LABELV $268
line 688
;687:
;688:	if ( client->pers.connected == CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $273
line 689
;689:		if ( strcmp( oldname, client->pers.netname ) ) {
ADDRLP4 1180
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 2280
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2280
INDIRI4
CNSTI4 0
EQI4 $275
line 690
;690:			G_BroadcastServerCommand( -1, va("print \"%s" S_COLOR_WHITE " renamed to %s\n\"", oldname, client->pers.netname) );
ADDRGP4 $277
ARGP4
ADDRLP4 1180
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 2284
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2284
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 691
;691:		}
LABELV $275
line 692
;692:	}
LABELV $273
line 706
;693:
;694:	// set max health
;695:#ifdef MISSIONPACK
;696:	if (client->ps.powerups[PW_GUARD]) {
;697:		client->pers.maxHealth = HEALTH_SOFT_LIMIT*2;
;698:	} else {
;699:		health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
;700:		client->pers.maxHealth = health;
;701:		if ( client->pers.maxHealth < 1 || client->pers.maxHealth > HEALTH_SOFT_LIMIT ) {
;702:			client->pers.maxHealth = HEALTH_SOFT_LIMIT;
;703:		}
;704:	}
;705:#else
;706:	health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $278
ARGP4
ADDRLP4 2280
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2280
INDIRP4
ARGP4
ADDRLP4 2284
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1224
ADDRLP4 2284
INDIRI4
ASGNI4
line 707
;707:	client->pers.maxHealth = health;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRLP4 1224
INDIRI4
ASGNI4
line 708
;708:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > HEALTH_SOFT_LIMIT ) {
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 1
LTI4 $281
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 100
LEI4 $279
LABELV $281
line 709
;709:		client->pers.maxHealth = HEALTH_SOFT_LIMIT;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 100
ASGNI4
line 710
;710:	}
LABELV $279
line 712
;711:#endif
;712:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ASGNI4
line 715
;713:
;714:#if defined MISSIONPACK || defined USE_NEOHUD
;715:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $282
line 716
;716:		client->pers.teamInfo = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 1
ASGNI4
line 717
;717:	} else {
ADDRGP4 $283
JUMPV
LABELV $282
line 718
;718:		s = Info_ValueForKey( userinfo, "teamoverlay" );
ADDRLP4 4
ARGP4
ADDRGP4 $285
ARGP4
ADDRLP4 2296
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 2296
INDIRP4
ASGNP4
line 719
;719:		if ( ! *s || atoi( s ) != 0 ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $288
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 2304
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2304
INDIRI4
CNSTI4 0
EQI4 $286
LABELV $288
line 720
;720:			client->pers.teamInfo = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 1
ASGNI4
line 721
;721:		} else {
ADDRGP4 $287
JUMPV
LABELV $286
line 722
;722:			client->pers.teamInfo = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 0
ASGNI4
line 723
;723:		}
LABELV $287
line 724
;724:	}
LABELV $283
line 736
;725:#else
;726:	// teamInfo
;727:	s = Info_ValueForKey( userinfo, "teamoverlay" );
;728:	if ( ! *s || atoi( s ) != 0 ) {
;729:		client->pers.teamInfo = qtrue;
;730:	} else {
;731:		client->pers.teamInfo = qfalse;
;732:	}
;733:#endif
;734:
;735:	// set model
;736:	Q_strncpyz( model, Info_ValueForKey( userinfo, "model" ), sizeof( model ) );
ADDRLP4 4
ARGP4
ADDRGP4 $289
ARGP4
ADDRLP4 2296
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
ARGP4
ADDRLP4 2296
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 737
;737:	Q_strncpyz( headModel, Info_ValueForKey( userinfo, "headmodel" ), sizeof( headModel ) );
ADDRLP4 4
ARGP4
ADDRGP4 $290
ARGP4
ADDRLP4 2300
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1100
ARGP4
ADDRLP4 2300
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 740
;738:
;739:	// team task (0 = none, 1 = offence, 2 = defence)
;740:	teamTask = atoi(Info_ValueForKey(userinfo, "teamtask"));
ADDRLP4 4
ARGP4
ADDRGP4 $291
ARGP4
ADDRLP4 2304
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2304
INDIRP4
ARGP4
ADDRLP4 2308
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1216
ADDRLP4 2308
INDIRI4
ASGNI4
line 742
;741:	// team Leader (1 = leader, 0 is normal player)
;742:	teamLeader = client->sess.teamLeader;
ADDRLP4 1220
ADDRLP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
ASGNI4
line 745
;743:
;744:	// VR stuff
;745:	vr_controller_type = atoi( Info_ValueForKey( userinfo, "vr_controller_type" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $292
ARGP4
ADDRLP4 2312
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2312
INDIRP4
ARGP4
ADDRLP4 2316
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2252
ADDRLP4 2316
INDIRI4
ASGNI4
line 747
;746:	//laserBeamPlayer = atoi( Info_ValueForKey( userinfo, "laserBeam" ) );
;747:	Q_strncpyz(c3, Info_ValueForKey( userinfo, "laserBeamRGBA" ), sizeof( c3 ));
ADDRLP4 4
ARGP4
ADDRGP4 $293
ARGP4
ADDRLP4 2320
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1228
ARGP4
ADDRLP4 2320
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 750
;748:
;749:	// colors
;750:	Q_strncpyz( c1, Info_ValueForKey( userinfo, "color1" ), sizeof( c1 ) );
ADDRLP4 4
ARGP4
ADDRGP4 $294
ARGP4
ADDRLP4 2324
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1164
ARGP4
ADDRLP4 2324
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 751
;751:	Q_strncpyz( c2, Info_ValueForKey( userinfo, "color2" ), sizeof( c2 ) );
ADDRLP4 4
ARGP4
ADDRGP4 $295
ARGP4
ADDRLP4 2328
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1172
ARGP4
ADDRLP4 2328
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 755
;752:
;753:	// send over a subset of the userinfo keys so other clients can
;754:	// print scoreboards, display models, and play custom sounds
;755:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 1032
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $296
line 756
;756:		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\skill\\%s\\tt\\%d\\tl\\%d",
ADDRLP4 4
ARGP4
ADDRGP4 $299
ARGP4
ADDRLP4 2332
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $298
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 1164
ARGP4
ADDRLP4 1172
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ARGI4
ADDRLP4 2332
INDIRP4
ARGP4
ADDRLP4 1216
INDIRI4
ARGI4
ADDRLP4 1220
INDIRI4
ARGI4
ADDRLP4 2340
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 2340
INDIRP4
ASGNP4
line 760
;757:			client->pers.netname, client->sess.sessionTeam, model, headModel, c1, c2,
;758:			client->pers.maxHealth, client->sess.wins, client->sess.losses,
;759:			Info_ValueForKey( userinfo, "skill" ), teamTask, teamLeader );
;760:	} else {
ADDRGP4 $297
JUMPV
LABELV $296
line 767
;761:		/*s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\tt\\%d\\tl\\%d\\vt\\%i\\lb\\%i", // VR
;762://		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\tt\\%d\\tl\\%d", // q3a
;763:			client->pers.netname, client->sess.sessionTeam, model, headModel, c1, c2, 
;764:			client->pers.maxHealth, client->sess.wins, client->sess.losses, teamTask, teamLeader,
;765:			vr_controller_type, laserBeamPlayer );// VR*/
;766:
;767:		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\tt\\%d\\tl\\%d\\vt\\%i\\lb\\%i", // VR
ADDRGP4 $300
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 1164
ARGP4
ADDRLP4 1172
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ARGI4
ADDRLP4 1216
INDIRI4
ARGI4
ADDRLP4 1220
INDIRI4
ARGI4
ADDRLP4 2252
INDIRI4
ARGI4
ADDRLP4 2336
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 2336
INDIRP4
ASGNP4
line 772
;768://		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\tt\\%d\\tl", // q3a
;769:		client->pers.netname, client->sess.sessionTeam, model, headModel, c1, c2,
;770:		client->pers.maxHealth, client->sess.wins, client->sess.losses, teamTask, teamLeader,
;771:		vr_controller_type );// VR
;772:	}
LABELV $297
line 774
;773:
;774:	trap_SetConfigstring( CS_PLAYERS+clientNum, s );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 777
;775:
;776:	// this is not the userinfo, more like the configstring actually
;777:	G_LogPrintf( "ClientUserinfoChanged: %i %s\n", clientNum, s );
ADDRGP4 $301
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 779
;778:
;779:	return qtrue;
CNSTI4 1
RETI4
LABELV $251
endproc ClientUserinfoChanged 2344 52
export ClientConnect
proc ClientConnect 1072 12
line 803
;780:}
;781:
;782:
;783:/*
;784:===========
;785:ClientConnect
;786:
;787:Called when a player begins connecting to the server.
;788:Called again for every map change or tournement restart.
;789:
;790:The session information will be valid after exit.
;791:
;792:Return NULL if the client should be allowed, otherwise return
;793:a string with the reason for denial.
;794:
;795:Otherwise, the client will be sent the current gamestate
;796:and will eventually get to ClientBegin.
;797:
;798:firstTime will be qtrue the very first time a client connects
;799:to the server machine, but qfalse on map changes and tournement
;800:restarts.
;801:============
;802:*/
;803:const char *ClientConnect( int clientNum, qboolean firstTime, qboolean isBot ) {
line 811
;804:	char		*value;
;805://	char		*areabits;
;806:	gclient_t	*client;
;807:	char		userinfo[MAX_INFO_STRING];
;808:	gentity_t	*ent;
;809:	qboolean	isAdmin;
;810:
;811:	if ( clientNum >= level.maxclients ) {
ADDRFP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $303
line 812
;812:		return "Bad connection slot.";
ADDRGP4 $306
RETP4
ADDRGP4 $302
JUMPV
LABELV $303
line 815
;813:	}
;814:
;815:	ent = &g_entities[ clientNum ];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 816
;816:	ent->client = level.clients + clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 818
;817:
;818:	if ( firstTime ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $307
line 821
;819:		// cleanup previous data manually
;820:		// because client may silently (re)connect without ClientDisconnect in case of crash for example
;821:		if ( level.clients[ clientNum ].pers.connected != CON_DISCONNECTED )
ADDRFP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $309
line 822
;822:			ClientDisconnect( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientDisconnect
CALLV
pop
LABELV $309
line 825
;823:
;824:		// remove old entity from the world
;825:		trap_UnlinkEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 826
;826:		ent->r.contents = 0;
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 0
ASGNI4
line 827
;827:		ent->s.eType = ET_INVISIBLE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 828
;828:		ent->s.eFlags = 0;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 829
;829:		ent->s.modelindex = 0;
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 830
;830:		ent->s.clientNum = clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 831
;831:		ent->s.number = clientNum;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRI4
ASGNI4
line 832
;832:		ent->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 1232
ADDP4
CNSTI4 0
ASGNI4
line 833
;833:	}
LABELV $307
line 835
;834:
;835:	ent->r.svFlags &= ~SVF_BOT;
ADDRLP4 1040
ADDRLP4 0
INDIRP4
CNSTI4 920
ADDP4
ASGNP4
ADDRLP4 1040
INDIRP4
ADDRLP4 1040
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 836
;836:	ent->inuse = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 1016
ADDP4
CNSTI4 0
ASGNI4
line 838
;837:
;838:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 844
;839:
;840: 	// IP filtering
;841: 	// https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=500
;842: 	// recommanding PB based IP / GUID banning, the builtin system is pretty limited
;843: 	// check to see if they are on the banned IP list
;844:	value = Info_ValueForKey( userinfo, "ip" );
ADDRLP4 12
ARGP4
ADDRGP4 $259
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1044
INDIRP4
ASGNP4
line 846
;845:
;846:	if ( !strcmp( value, "localhost" ) && !isBot )
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $262
ARGP4
ADDRLP4 1048
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $311
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $311
line 847
;847:		isAdmin = qtrue;
ADDRLP4 1036
CNSTI4 1
ASGNI4
ADDRGP4 $312
JUMPV
LABELV $311
line 849
;848:	else
;849:		isAdmin = qfalse;
ADDRLP4 1036
CNSTI4 0
ASGNI4
LABELV $312
line 851
;850:
;851:	if ( !isAdmin && G_FilterPacket( value ) ) {
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $313
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 G_FilterPacket
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
EQI4 $313
line 852
;852:		return "You are banned from this server.";
ADDRGP4 $315
RETP4
ADDRGP4 $302
JUMPV
LABELV $313
line 858
;853:	}
;854:
;855:	// we don't check password for bots and local client
;856:	// NOTE: local client <-> "ip" "localhost"
;857:	// this means this client is not running in our current process
;858:	if ( !isBot && !isAdmin ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $316
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $316
line 860
;859:		// check for a password
;860:		if ( g_password.string[0] && Q_stricmp( g_password.string, "none" ) ) {
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $318
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $322
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $318
line 861
;861:			value = Info_ValueForKey( userinfo, "password" );
ADDRLP4 12
ARGP4
ADDRGP4 $323
ARGP4
ADDRLP4 1060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1060
INDIRP4
ASGNP4
line 862
;862:			if ( strcmp( g_password.string, value ) )
ADDRGP4 g_password+16
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
EQI4 $324
line 863
;863:				return "Invalid password";
ADDRGP4 $327
RETP4
ADDRGP4 $302
JUMPV
LABELV $324
line 864
;864:		}
LABELV $318
line 865
;865:	}
LABELV $316
line 868
;866:
;867:	// they can connect
;868:	ent->client = level.clients + clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 869
;869:	client = ent->client;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ASGNP4
line 872
;870:
;871://	areabits = client->areabits;
;872:	memset( client, 0, sizeof( *client ) );
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1736
ARGI4
ADDRGP4 memset
CALLP4
pop
line 874
;873:
;874:	client->ps.clientNum = clientNum;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 876
;875:
;876:	if ( !ClientUserinfoChanged( clientNum ) ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1056
ADDRGP4 ClientUserinfoChanged
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $328
line 877
;877:		return ban_reason;
ADDRGP4 ban_reason
RETP4
ADDRGP4 $302
JUMPV
LABELV $328
line 881
;878:	}
;879:
;880:	// read or initialize the session data
;881:	if ( firstTime || level.newSession ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $333
ADDRGP4 level+68
INDIRI4
CNSTI4 0
EQI4 $330
LABELV $333
line 882
;882:		value = Info_ValueForKey( userinfo, "team" );
ADDRLP4 12
ARGP4
ADDRGP4 $334
ARGP4
ADDRLP4 1060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1060
INDIRP4
ASGNP4
line 883
;883:		G_InitSessionData( client, value, isBot );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_InitSessionData
CALLV
pop
line 884
;884:		G_WriteClientSessionData( client );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 885
;885:	}
LABELV $330
line 887
;886:
;887:	G_ReadClientSessionData( client );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_ReadClientSessionData
CALLV
pop
line 889
;888:
;889:	if( isBot ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $335
line 890
;890:		if( !G_BotConnect( clientNum, !firstTime ) ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $340
ADDRLP4 1060
CNSTI4 1
ASGNI4
ADDRGP4 $341
JUMPV
LABELV $340
ADDRLP4 1060
CNSTI4 0
ASGNI4
LABELV $341
ADDRLP4 1060
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 G_BotConnect
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $337
line 891
;891:			return "BotConnectfailed";
ADDRGP4 $342
RETP4
ADDRGP4 $302
JUMPV
LABELV $337
line 893
;892:		}
;893:		ent->r.svFlags |= SVF_BOT;
ADDRLP4 1068
ADDRLP4 0
INDIRP4
CNSTI4 920
ADDP4
ASGNP4
ADDRLP4 1068
INDIRP4
ADDRLP4 1068
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 894
;894:		client->sess.spectatorClient = clientNum;
ADDRLP4 4
INDIRP4
CNSTI4 804
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 895
;895:	}
LABELV $335
line 896
;896:	ent->inuse = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1016
ADDP4
CNSTI4 1
ASGNI4
line 899
;897:
;898:	// get and distribute relevant paramters
;899:	G_LogPrintf( "ClientConnect: %i\n", clientNum );
ADDRGP4 $343
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 901
;900:
;901:	client->pers.connected = CON_CONNECTING;
ADDRLP4 4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 903
;902:
;903:	ClientUserinfoChanged( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 906
;904:
;905:	// don't do the "xxx connected" messages if they were caried over from previous level
;906:	if ( firstTime ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $344
line 907
;907:		G_BroadcastServerCommand( -1, va( "print \"%s" S_COLOR_WHITE " connected\n\"", client->pers.netname ) );
ADDRGP4 $346
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 910
;908:
;909:		// mute all prints until completely in game
;910:		client->pers.inGame = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 788
ADDP4
CNSTI4 0
ASGNI4
line 911
;911:	} else {
ADDRGP4 $345
JUMPV
LABELV $344
line 912
;912:		client->pers.inGame = qtrue; // FIXME: read from session data?
ADDRLP4 4
INDIRP4
CNSTI4 788
ADDP4
CNSTI4 1
ASGNI4
line 913
;913:	}
LABELV $345
line 916
;914:
;915:	// count current clients and rank for scoreboard
;916:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 923
;917:
;918:	// for statistics
;919://	client->areabits = areabits;
;920://	if ( !client->areabits )
;921://		client->areabits = G_Alloc( (trap_AAS_PointReachabilityAreaIndex( NULL ) + 7) / 8 );
;922:
;923:	return NULL;
CNSTP4 0
RETP4
LABELV $302
endproc ClientConnect 1072 12
export ClientBegin
proc ClientBegin 28 12
line 936
;924:}
;925:
;926:
;927:/*
;928:===========
;929:ClientBegin
;930:
;931:called when a client has finished connecting, and is ready
;932:to be placed into the level.  This will happen every level load,
;933:and on transition between teams, but doesn't happen on respawns
;934:============
;935:*/
;936:void ClientBegin( int clientNum ) {
line 943
;937:	gentity_t	*ent;
;938:	gclient_t	*client;
;939:	gentity_t	*tent;
;940:	int			flags;
;941:	int			spawns;
;942:
;943:	ent = g_entities + clientNum;
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 945
;944:
;945:	client = level.clients + clientNum;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 947
;946:
;947:	if ( ent->r.linked ) {
ADDRLP4 4
INDIRP4
CNSTI4 912
ADDP4
INDIRI4
CNSTI4 0
EQI4 $348
line 948
;948:		trap_UnlinkEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 949
;949:	}
LABELV $348
line 951
;950:
;951:	G_InitGentity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 952
;952:	ent->touch = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1200
ADDP4
CNSTP4 0
ASGNP4
line 953
;953:	ent->pain = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1208
ADDP4
CNSTP4 0
ASGNP4
line 954
;954:	ent->client = client;
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 956
;955:
;956:	if ( client->pers.connected == CON_DISCONNECTED )
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $350
line 957
;957:		return;
ADDRGP4 $347
JUMPV
LABELV $350
line 959
;958:
;959:	client->pers.connected = CON_CONNECTED;
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 2
ASGNI4
line 960
;960:	client->pers.enterTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 961
;961:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 0
ASGNI4
line 962
;962:	spawns = client->ps.persistant[PERS_SPAWN_COUNT];
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ASGNI4
line 969
;963:
;964:	// save eflags around this, because changing teams will
;965:	// cause this to happen with a valid entity, and we
;966:	// want to make sure the teleport bit is set right
;967:	// so the viewpoint doesn't interpolate through the
;968:	// world to the new position
;969:	flags = client->ps.eFlags;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ASGNI4
line 970
;970:	memset( &client->ps, 0, sizeof( client->ps ) );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 560
ARGI4
ADDRGP4 memset
CALLP4
pop
line 971
;971:	client->ps.eFlags = flags;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 972
;972:	client->ps.persistant[PERS_SPAWN_COUNT] = spawns;
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 975
;973:
;974:	// locate ent at a spawn point
;975:	ClientSpawn( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 977
;976:
;977:	if ( !client->pers.inGame ) {
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
CNSTI4 0
NEI4 $353
line 978
;978:		BroadcastTeamChange( client, -1 );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 979
;979:		if ( client->sess.sessionTeam == TEAM_RED || client->sess.sessionTeam == TEAM_BLUE )
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 1
EQI4 $357
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 2
NEI4 $355
LABELV $357
line 980
;980:			CheckTeamLeader( client->sess.sessionTeam );
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ARGI4
ADDRGP4 CheckTeamLeader
CALLV
pop
LABELV $355
line 981
;981:	}
LABELV $353
line 983
;982:
;983:	if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
EQI4 $358
line 985
;984:		// send event
;985:		tent = G_TempEntity( client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 43
ARGI4
ADDRLP4 20
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
ASGNP4
line 986
;986:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 16
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 988
;987:
;988:		client->sess.spectatorTime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
CNSTI4 0
ASGNI4
line 990
;989:
;990:		if ( g_gametype.integer != GT_TOURNAMENT && !client->pers.inGame ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $360
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
CNSTI4 0
NEI4 $360
line 991
;991:			G_BroadcastServerCommand( -1, va("print \"%s" S_COLOR_WHITE " entered the game\n\"", client->pers.netname) );
ADDRGP4 $363
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 992
;992:		}
LABELV $360
line 993
;993:	}
LABELV $358
line 995
;994:	
;995:	client->pers.inGame = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
CNSTI4 1
ASGNI4
line 997
;996:
;997:	G_LogPrintf( "ClientBegin: %i\n", clientNum );
ADDRGP4 $364
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1000
;998:
;999:	// count current clients and rank for scoreboard
;1000:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1001
;1001:}
LABELV $347
endproc ClientBegin 28 12
export ClientSpawn
proc ClientSpawn 1468 20
line 1013
;1002:
;1003:
;1004:/*
;1005:===========
;1006:ClientSpawn
;1007:
;1008:Called every time a client is placed fresh in the world:
;1009:after the first ClientBegin, and after each respawn
;1010:Initializes all non-persistant parts of playerState
;1011:============
;1012:*/
;1013:void ClientSpawn(gentity_t *ent) {
line 1030
;1014:	int		index;
;1015:	vec3_t	spawn_origin, spawn_angles;
;1016:	gclient_t	*client;
;1017:	int		i;
;1018:	clientPersistant_t	saved;
;1019:	clientSession_t		savedSess;
;1020:	int		persistant[MAX_PERSISTANT];
;1021:	gentity_t	*spawnPoint;
;1022:	int		flags;
;1023:	int		savedPing;
;1024://	char	*savedAreaBits;
;1025:	int		accuracy_hits, accuracy_shots;
;1026:	int		eventSequence;
;1027:	char	userinfo[MAX_INFO_STRING];
;1028:	qboolean isSpectator;
;1029:
;1030:	index = ent - g_entities;
ADDRLP4 104
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
line 1031
;1031:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ASGNP4
line 1033
;1032:
;1033:	trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1035
;1034:
;1035:	isSpectator = client->sess.sessionTeam == TEAM_SPECTATOR;
ADDRLP4 4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
NEI4 $367
ADDRLP4 1412
CNSTI4 1
ASGNI4
ADDRGP4 $368
JUMPV
LABELV $367
ADDRLP4 1412
CNSTI4 0
ASGNI4
LABELV $368
ADDRLP4 100
ADDRLP4 1412
INDIRI4
ASGNI4
line 1039
;1036:	// find a spawn point
;1037:	// do it before setting health back up, so farthest
;1038:	// ranging doesn't count this client
;1039:	if ( isSpectator ) {
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $369
line 1040
;1040:		spawnPoint = SelectSpectatorSpawnPoint( spawn_origin, spawn_angles );
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 1416
ADDRGP4 SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1416
INDIRP4
ASGNP4
line 1041
;1041:	} else if (g_gametype.integer >= GT_CTF ) {
ADDRGP4 $370
JUMPV
LABELV $369
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $371
line 1043
;1042:		// all base oriented team games use the CTF spawn points
;1043:		spawnPoint = SelectCTFSpawnPoint( ent, client->sess.sessionTeam, client->pers.teamState.state, spawn_origin, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 1420
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1420
INDIRP4
ASGNP4
line 1044
;1044:	} else {
ADDRGP4 $372
JUMPV
LABELV $371
LABELV $374
line 1045
;1045:		do {
line 1047
;1046:			// the first spawn should be at a good looking spot
;1047:			if ( !client->pers.initialSpawn && client->pers.localClient ) {
ADDRLP4 4
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
CNSTI4 0
NEI4 $377
ADDRLP4 4
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
CNSTI4 0
EQI4 $377
line 1048
;1048:				client->pers.initialSpawn = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 668
ADDP4
CNSTI4 1
ASGNI4
line 1049
;1049:				spawnPoint = SelectInitialSpawnPoint( ent, spawn_origin, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 1420
ADDRGP4 SelectInitialSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1420
INDIRP4
ASGNP4
line 1050
;1050:			} else {
ADDRGP4 $378
JUMPV
LABELV $377
line 1052
;1051:				// don't spawn near existing origin if possible
;1052:				spawnPoint = SelectSpawnPoint( ent, client->ps.origin, spawn_origin, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 1420
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1420
INDIRP4
ASGNP4
line 1053
;1053:			}
LABELV $378
line 1057
;1054:
;1055:			// Tim needs to prevent bots from spawning at the initial point
;1056:			// on q3dm0...
;1057:			if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 72
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $379
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $379
line 1058
;1058:				continue;	// try again
ADDRGP4 $375
JUMPV
LABELV $379
line 1061
;1059:			}
;1060:			// just to be symetric, we have a nohumans option...
;1061:			if ( ( spawnPoint->flags & FL_NO_HUMANS ) && !( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 72
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $376
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $376
line 1062
;1062:				continue;	// try again
line 1065
;1063:			}
;1064:
;1065:			break;
LABELV $375
line 1067
;1066:
;1067:		} while ( 1 );
ADDRGP4 $374
JUMPV
LABELV $376
line 1068
;1068:	}
LABELV $372
LABELV $370
line 1069
;1069:	client->pers.teamState.state = TEAM_ACTIVE;
ADDRLP4 4
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 1
ASGNI4
line 1078
;1070:
;1071:#ifdef MISSIONPACK
;1072:	// always clear the kamikaze flag
;1073:	ent->s.eFlags &= ~EF_KAMIKAZE;
;1074:#endif
;1075:
;1076:	// toggle the teleport bit so the client knows to not lerp
;1077:	// and never clear the voted flag
;1078:	flags = client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
ADDRLP4 1132
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 540676
BANDI4
ASGNI4
line 1079
;1079:	flags ^= EF_TELEPORT_BIT;
ADDRLP4 1132
ADDRLP4 1132
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 1082
;1080:
;1081:	// unlagged
;1082:	G_ResetHistory( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ResetHistory
CALLV
pop
line 1083
;1083:	client->saved.leveltime = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1708
ADDP4
CNSTI4 0
ASGNI4
line 1087
;1084:
;1085:	// clear everything but the persistant data
;1086:
;1087:	saved = client->pers;
ADDRLP4 1136
ADDRLP4 4
INDIRP4
CNSTI4 560
ADDP4
INDIRB
ASGNB 232
line 1088
;1088:	savedSess = client->sess;
ADDRLP4 1368
ADDRLP4 4
INDIRP4
CNSTI4 792
ADDP4
INDIRB
ASGNB 28
line 1089
;1089:	savedPing = client->ps.ping;
ADDRLP4 1396
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
line 1091
;1090://	savedAreaBits = client->areabits;
;1091:	accuracy_hits = client->accuracy_hits;
ADDRLP4 1400
ADDRLP4 4
INDIRP4
CNSTI4 892
ADDP4
INDIRI4
ASGNI4
line 1092
;1092:	accuracy_shots = client->accuracy_shots;
ADDRLP4 1404
ADDRLP4 4
INDIRP4
CNSTI4 888
ADDP4
INDIRI4
ASGNI4
line 1093
;1093:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $383
line 1094
;1094:		persistant[i] = client->ps.persistant[i];
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
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1095
;1095:	}
LABELV $384
line 1093
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $383
line 1096
;1096:	eventSequence = client->ps.eventSequence;
ADDRLP4 1408
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1098
;1097:
;1098:	Com_Memset (client, 0, sizeof(*client));
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1736
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1100
;1099:
;1100:	client->pers = saved;
ADDRLP4 4
INDIRP4
CNSTI4 560
ADDP4
ADDRLP4 1136
INDIRB
ASGNB 232
line 1101
;1101:	client->sess = savedSess;
ADDRLP4 4
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 1368
INDIRB
ASGNB 28
line 1102
;1102:	client->ps.ping = savedPing;
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
ADDRLP4 1396
INDIRI4
ASGNI4
line 1104
;1103://	client->areabits = savedAreaBits;
;1104:	client->accuracy_hits = accuracy_hits;
ADDRLP4 4
INDIRP4
CNSTI4 892
ADDP4
ADDRLP4 1400
INDIRI4
ASGNI4
line 1105
;1105:	client->accuracy_shots = accuracy_shots;
ADDRLP4 4
INDIRP4
CNSTI4 888
ADDP4
ADDRLP4 1404
INDIRI4
ASGNI4
line 1106
;1106:	client->lastkilled_client = -1;
ADDRLP4 4
INDIRP4
CNSTI4 896
ADDP4
CNSTI4 -1
ASGNI4
line 1108
;1107:
;1108:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $387
line 1109
;1109:		client->ps.persistant[i] = persistant[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
ASGNI4
line 1110
;1110:	}
LABELV $388
line 1108
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $387
line 1111
;1111:	client->ps.eventSequence = eventSequence;
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 1408
INDIRI4
ASGNI4
line 1113
;1112:	// increment the spawncount so the client will detect the respawn
;1113:	client->ps.persistant[PERS_SPAWN_COUNT]++;
ADDRLP4 1416
ADDRLP4 4
INDIRP4
CNSTI4 264
ADDP4
ASGNP4
ADDRLP4 1416
INDIRP4
ADDRLP4 1416
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1114
;1114:	client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;
ADDRLP4 4
INDIRP4
CNSTI4 260
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ASGNI4
line 1116
;1115:
;1116:	client->airOutTime = level.time + 12000;
ADDRLP4 4
INDIRP4
CNSTI4 924
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 1118
;1117:
;1118:	trap_GetUserinfo( index, userinfo, sizeof(userinfo) );
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 108
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1120
;1119:	// set max health
;1120:	client->pers.maxHealth = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 108
ARGP4
ADDRGP4 $278
ARGP4
ADDRLP4 1424
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1424
INDIRP4
ARGP4
ADDRLP4 1428
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 712
ADDP4
ADDRLP4 1428
INDIRI4
ASGNI4
line 1121
;1121:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > HEALTH_SOFT_LIMIT ) {
ADDRLP4 4
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 1
LTI4 $394
ADDRLP4 4
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 100
LEI4 $392
LABELV $394
line 1122
;1122:		client->pers.maxHealth = HEALTH_SOFT_LIMIT;
ADDRLP4 4
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 100
ASGNI4
line 1123
;1123:	}
LABELV $392
line 1125
;1124:	// clear entity values
;1125:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ASGNI4
line 1126
;1126:	client->ps.eFlags = flags;
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 1132
INDIRI4
ASGNI4
line 1128
;1127:
;1128:	ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1023
ASGNI4
line 1129
;1129:	ent->client = &level.clients[index];
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
ADDRLP4 104
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1130
;1130:	ent->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
CNSTI4 1
ASGNI4
line 1131
;1131:	ent->classname = "player";
ADDRFP4 0
INDIRP4
CNSTI4 1020
ADDP4
ADDRGP4 $395
ASGNP4
line 1132
;1132:	if ( isSpectator ) {
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $396
line 1133
;1133:		ent->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1232
ADDP4
CNSTI4 0
ASGNI4
line 1134
;1134:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 0
ASGNI4
line 1135
;1135:		ent->clipmask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 1068
ADDP4
CNSTI4 65537
ASGNI4
line 1136
;1136:		client->ps.pm_type = PM_SPECTATOR;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 1137
;1137:	} else {
ADDRGP4 $397
JUMPV
LABELV $396
line 1138
;1138:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1232
ADDP4
CNSTI4 1
ASGNI4
line 1139
;1139:		ent->r.contents = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 33554432
ASGNI4
line 1140
;1140:		ent->clipmask = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 1068
ADDP4
CNSTI4 33619969
ASGNI4
line 1141
;1141:	}
LABELV $397
line 1142
;1142:	ent->die = player_die;
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
ADDRGP4 player_die
ASGNP4
line 1143
;1143:	ent->waterlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1284
ADDP4
CNSTI4 0
ASGNI4
line 1144
;1144:	ent->watertype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1280
ADDP4
CNSTI4 0
ASGNI4
line 1145
;1145:	ent->flags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
CNSTI4 0
ASGNI4
line 1147
;1146:	
;1147:	VectorCopy (playerMins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
ADDRGP4 playerMins
INDIRB
ASGNB 12
line 1148
;1148:	VectorCopy (playerMaxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ADDRGP4 playerMaxs
INDIRB
ASGNB 12
line 1150
;1149:
;1150:	client->ps.clientNum = index;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1152
;1151:
;1152:	client->ps.stats[STAT_WEAPONS] = ( 1 << WP_MACHINEGUN );
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 1153
;1153:	if ( g_gametype.integer == GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $398
line 1154
;1154:		client->ps.ammo[WP_MACHINEGUN] = 50;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 50
ASGNI4
line 1155
;1155:	} else {
ADDRGP4 $399
JUMPV
LABELV $398
line 1156
;1156:		client->ps.ammo[WP_MACHINEGUN] = 100;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 100
ASGNI4
line 1157
;1157:	}
LABELV $399
line 1159
;1158:
;1159:	client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
ADDRLP4 1440
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 1440
INDIRP4
ADDRLP4 1440
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1160
;1160:	client->ps.ammo[WP_GAUNTLET] = -1;
ADDRLP4 4
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 -1
ASGNI4
line 1164
;1161:
;1162:#ifdef USE_GRAPPLING_HOOK
;1163:	// Allow grappling hook
;1164:	if( g_PureAllowHook.integer ) {
ADDRGP4 g_PureAllowHook+12
INDIRI4
CNSTI4 0
EQI4 $401
line 1165
;1165:		client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GRAPPLING_HOOK); 
ADDRLP4 1444
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 1444
INDIRP4
ADDRLP4 1444
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 1166
;1166:		client->ps.ammo[WP_GRAPPLING_HOOK] = -1;
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 -1
ASGNI4
line 1167
;1167:	}
LABELV $401
line 1170
;1168:#endif
;1169:	// health will count down towards max_health
;1170:	ent->health = client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH] + 25;
ADDRLP4 1448
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 1448
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 1448
INDIRI4
ASGNI4
line 1172
;1171:
;1172:	G_SetOrigin( ent, spawn_origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1173
;1173:	VectorCopy( spawn_origin, client->ps.origin );
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 76
INDIRB
ASGNB 12
line 1176
;1174:
;1175:	// the respawned flag will be cleared after the attack and jump keys come up
;1176:	client->ps.pm_flags |= PMF_RESPAWNED;
ADDRLP4 1452
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1452
INDIRP4
ADDRLP4 1452
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1178
;1177:
;1178:	trap_GetUsercmd( client - level.clients, &ent->client->pers.cmd );
ADDRLP4 4
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
ADDRFP4 0
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
line 1181
;1179:
;1180:#ifdef USE_VR_QVM
;1181:	client->ps.vr_controller_type = atoi(Info_ValueForKey(userinfo, "vr_controller_type"));
ADDRLP4 108
ARGP4
ADDRGP4 $292
ARGP4
ADDRLP4 1456
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1456
INDIRP4
ARGP4
ADDRLP4 1460
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
ADDRLP4 1460
INDIRI4
ASGNI4
line 1184
;1182:#endif
;1183:
;1184:	SetClientViewAngle( ent, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 1189
;1185:
;1186:#ifdef USE_VR_QVM
;1187:	// set VR controller angle at spawn_angles
;1188:	// send spawn_angles to VR client
;1189:	SetClientVrControllerAngles( ent, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 SetClientVrControllerAngles
CALLV
pop
line 1193
;1190:#endif
;1191:
;1192:	// entity should be unlinked before calling G_KillBox()	
;1193:	if ( !isSpectator )
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $404
line 1194
;1194:		G_KillBox( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
LABELV $404
line 1197
;1195:
;1196:	// force the base weapon up
;1197:	client->ps.weapon = WP_MACHINEGUN;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 2
ASGNI4
line 1198
;1198:	client->ps.weaponstate = WEAPON_READY;
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1201
;1199:
;1200:	// don't allow full run speed for a bit
;1201:	client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 1464
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1464
INDIRP4
ADDRLP4 1464
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1202
;1202:	client->ps.pm_time = 100;
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 1204
;1203:
;1204:	client->respawnTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 908
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1205
;1205:	client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRLP4 4
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
line 1206
;1206:	client->latched_buttons = 0;
ADDRLP4 4
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 1209
;1207:
;1208:	// set default animations
;1209:	client->ps.torsoAnim = TORSO_STAND;
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 11
ASGNI4
line 1210
;1210:	client->ps.legsAnim = LEGS_IDLE;
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 22
ASGNI4
line 1212
;1211:
;1212:	if ( level.intermissiontime ) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $409
line 1213
;1213:		MoveClientToIntermission( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 1214
;1214:	} else {
ADDRGP4 $410
JUMPV
LABELV $409
line 1215
;1215:		if ( !isSpectator )
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $412
line 1216
;1216:			trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
LABELV $412
line 1218
;1217:		// fire the targets of the spawn point
;1218:		G_UseTargets( spawnPoint, ent );
ADDRLP4 72
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1222
;1219:
;1220:		// select the highest weapon number available, after any
;1221:		// spawn given items have fired
;1222:		client->ps.weapon = 1;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 1225
;1223:
;1224:		//for ( i = WP_NUM_WEAPONS - 1 ; i > 0 ; i-- ) {//q3A
;1225:		for ( i = WP_NUM_WEAPONS - 3 ; i > 0 ; i-- ) { // grapple and VR controller aren't selected by default
ADDRLP4 0
CNSTI4 9
ASGNI4
LABELV $414
line 1226
;1226:			if ( client->ps.stats[STAT_WEAPONS] & ( 1 << i ) ) {
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $418
line 1227
;1227:				client->ps.weapon = i;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1228
;1228:				break;
ADDRGP4 $416
JUMPV
LABELV $418
line 1230
;1229:			}
;1230:		}
LABELV $415
line 1225
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $414
LABELV $416
line 1231
;1231:	}
LABELV $410
line 1235
;1232:
;1233:	// run a client frame to drop exactly to the floor,
;1234:	// initialize animations and other things
;1235:	client->ps.commandTime = level.time - 100;
ADDRLP4 4
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
line 1236
;1236:	client->pers.cmd.serverTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1237
;1237:	ClientThink( ent-g_entities );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1312
DIVI4
ARGI4
ADDRGP4 ClientThink
CALLV
pop
line 1239
;1238:
;1239:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 4
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
line 1240
;1240:	VectorCopy( client->ps.origin, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 984
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1243
;1241:
;1242:	// run the presend to set anything else
;1243:	ClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 1246
;1244:
;1245:	// clear entity state values
;1246:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 4
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
line 1247
;1247:}
LABELV $365
endproc ClientSpawn 1468 20
export ClientDisconnect
proc ClientDisconnect 24 8
line 1262
;1248:
;1249:
;1250:/*
;1251:===========
;1252:ClientDisconnect
;1253:
;1254:Called when a player drops from the server.
;1255:Will not be called between levels.
;1256:
;1257:This should NOT be called directly by any game logic,
;1258:call trap_DropClient(), which will call this and do
;1259:server system housekeeping.
;1260:============
;1261:*/
;1262:void ClientDisconnect( int clientNum ) {
line 1269
;1263:	gentity_t	*ent;
;1264:	gentity_t	*tent;
;1265:	int			i;
;1266:
;1267:	// cleanup if we are kicking a bot that
;1268:	// hasn't spawned yet
;1269:	G_RemoveQueuedBotBegin( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_RemoveQueuedBotBegin
CALLV
pop
line 1271
;1270:
;1271:	ent = g_entities + clientNum;
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1272
;1272:	if (!ent->client || ent->client->pers.connected == CON_DISCONNECTED) {
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $425
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $423
LABELV $425
line 1273
;1273:		return;
ADDRGP4 $422
JUMPV
LABELV $423
line 1277
;1274:	}
;1275:
;1276:	// stop any following clients
;1277:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $429
JUMPV
LABELV $426
line 1278
;1278:		if ( level.clients[i].sess.sessionTeam == TEAM_SPECTATOR
ADDRLP4 20
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRLP4 20
INDIRP4
ADDP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
NEI4 $431
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRLP4 20
INDIRP4
ADDP4
CNSTI4 800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $431
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRLP4 20
INDIRP4
ADDP4
CNSTI4 804
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $431
line 1280
;1279:			&& level.clients[i].sess.spectatorState == SPECTATOR_FOLLOW
;1280:			&& level.clients[i].sess.spectatorClient == clientNum ) {
line 1281
;1281:			StopFollowing( &g_entities[i], qtrue );
ADDRLP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StopFollowing
CALLV
pop
line 1282
;1282:		}
LABELV $431
line 1283
;1283:	}
LABELV $427
line 1277
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $429
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $426
line 1286
;1284:
;1285:	// send effect if they were completely connected
;1286:	if ( ent->client->pers.connected == CON_CONNECTED 
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $433
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
EQI4 $433
line 1287
;1287:		&& ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 1288
;1288:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 44
ARGI4
ADDRLP4 20
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 1289
;1289:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1293
;1290:
;1291:		// They don't get to take powerups with them!
;1292:		// Especially important for stuff like CTF flags
;1293:		TossClientItems( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 1301
;1294:#ifdef MISSIONPACK
;1295:		TossClientPersistantPowerups( ent );
;1296:		if( g_gametype.integer == GT_HARVESTER ) {
;1297:			TossClientCubes( ent );
;1298:		}
;1299:#endif
;1300:
;1301:	}
LABELV $433
line 1303
;1302:
;1303:	G_RevertVote( ent->client );
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_RevertVote
CALLV
pop
line 1305
;1304:
;1305:	G_LogPrintf( "ClientDisconnect: %i\n", clientNum );
ADDRGP4 $435
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1308
;1306:
;1307:	// if we are playing in tourney mode and losing, give a win to the other player
;1308:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $436
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
NEI4 $436
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $436
ADDRGP4 level+88+4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $436
line 1310
;1309:		&& !level.intermissiontime
;1310:		&& !level.warmupTime && level.sortedClients[1] == clientNum ) {
line 1311
;1311:		level.clients[ level.sortedClients[0] ].sess.wins++;
ADDRLP4 20
ADDRGP4 level+88
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1312
;1312:		ClientUserinfoChanged( level.sortedClients[0] );
ADDRGP4 level+88
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 1313
;1313:	}
LABELV $436
line 1315
;1314:
;1315:	trap_UnlinkEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1316
;1316:	ent->s.modelindex = 0;
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 1317
;1317:	ent->inuse = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 1016
ADDP4
CNSTI4 0
ASGNI4
line 1318
;1318:	ent->classname = "disconnected";
ADDRLP4 4
INDIRP4
CNSTI4 1020
ADDP4
ADDRGP4 $445
ASGNP4
line 1319
;1319:	ent->client->pers.connected = CON_DISCONNECTED;
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 1320
;1320:	ent->client->ps.persistant[PERS_TEAM] = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 0
ASGNI4
line 1321
;1321:	ent->client->sess.sessionTeam = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
CNSTI4 0
ASGNI4
line 1323
;1322:
;1323:	trap_SetConfigstring( CS_PLAYERS + clientNum, "" );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRGP4 $446
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1325
;1324:
;1325:	G_ClearClientSessionData( ent->client );
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_ClearClientSessionData
CALLV
pop
line 1327
;1326:
;1327:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1329
;1328:
;1329:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 4
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $447
line 1330
;1330:		BotAIShutdownClient( clientNum, qfalse );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 1331
;1331:	}
LABELV $447
line 1332
;1332:}
LABELV $422
endproc ClientDisconnect 24 8
bss
align 1
LABELV ban_reason
skip 256
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
import CalculateRanks
import AddScore
import player_die
import BeginIntermission
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
LABELV $446
byte 1 0
align 1
LABELV $445
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $435
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 68
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $395
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $364
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 66
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $363
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $346
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $343
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $342
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $334
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $327
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $323
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $322
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $315
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $306
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $301
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
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
LABELV $300
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 50
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 116
byte 1 116
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 116
byte 1 108
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 118
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 98
byte 1 92
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $299
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $298
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 50
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 116
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 116
byte 1 108
byte 1 92
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $295
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $294
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $293
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 66
byte 1 101
byte 1 97
byte 1 109
byte 1 82
byte 1 71
byte 1 66
byte 1 65
byte 1 0
align 1
LABELV $292
byte 1 118
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 95
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $291
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $290
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $289
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $285
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $278
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $277
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $272
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $267
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $266
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $263
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $262
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $259
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $254
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $153
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 113
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $126
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $63
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $59
byte 1 110
byte 1 111
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $56
byte 1 48
byte 1 0
align 1
LABELV $55
byte 1 110
byte 1 111
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
