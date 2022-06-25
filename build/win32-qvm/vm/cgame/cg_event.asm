bss
align 1
LABELV $88
skip 64
export CG_PlaceString
code
proc CG_PlaceString 12 20
file "..\..\..\..\code\cgame\cg_event.c"
line 24
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_event.c -- handle entity events at snapshot or playerstate transitions
;4:
;5:#include "cg_local.h"
;6:
;7:#ifdef USE_VR
;8:#include "vr_helper.h"
;9:#endif
;10:
;11:// for the voice chats
;12:#ifdef MISSIONPACK // bk001205
;13:#include "../../ui/menudef.h"
;14:#endif
;15://==========================================================================
;16:
;17:/*
;18:===================
;19:CG_PlaceString
;20:
;21:Also called by scoreboard drawing
;22:===================
;23:*/
;24:const char	*CG_PlaceString( int rank ) {
line 28
;25:	static char	str[64];
;26:	char	*s, *t;
;27:
;28:	if ( rank & RANK_TIED_FLAG ) {
ADDRFP4 0
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $89
line 29
;29:		rank &= ~RANK_TIED_FLAG;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 30
;30:		t = "Tied for ";
ADDRLP4 4
ADDRGP4 $91
ASGNP4
line 31
;31:	} else {
ADDRGP4 $90
JUMPV
LABELV $89
line 32
;32:		t = "";
ADDRLP4 4
ADDRGP4 $92
ASGNP4
line 33
;33:	}
LABELV $90
line 35
;34:
;35:	if ( rank == 1 ) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $93
line 36
;36:		s = S_COLOR_BLUE "1st" S_COLOR_WHITE;		// draw in blue
ADDRLP4 0
ADDRGP4 $95
ASGNP4
line 37
;37:	} else if ( rank == 2 ) {
ADDRGP4 $94
JUMPV
LABELV $93
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $96
line 38
;38:		s = S_COLOR_RED "2nd" S_COLOR_WHITE;		// draw in red
ADDRLP4 0
ADDRGP4 $98
ASGNP4
line 39
;39:	} else if ( rank == 3 ) {
ADDRGP4 $97
JUMPV
LABELV $96
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $99
line 40
;40:		s = S_COLOR_YELLOW "3rd" S_COLOR_WHITE;		// draw in yellow
ADDRLP4 0
ADDRGP4 $101
ASGNP4
line 41
;41:	} else if ( rank == 11 ) {
ADDRGP4 $100
JUMPV
LABELV $99
ADDRFP4 0
INDIRI4
CNSTI4 11
NEI4 $102
line 42
;42:		s = "11th";
ADDRLP4 0
ADDRGP4 $104
ASGNP4
line 43
;43:	} else if ( rank == 12 ) {
ADDRGP4 $103
JUMPV
LABELV $102
ADDRFP4 0
INDIRI4
CNSTI4 12
NEI4 $105
line 44
;44:		s = "12th";
ADDRLP4 0
ADDRGP4 $107
ASGNP4
line 45
;45:	} else if ( rank == 13 ) {
ADDRGP4 $106
JUMPV
LABELV $105
ADDRFP4 0
INDIRI4
CNSTI4 13
NEI4 $108
line 46
;46:		s = "13th";
ADDRLP4 0
ADDRGP4 $110
ASGNP4
line 47
;47:	} else if ( rank % 10 == 1 ) {
ADDRGP4 $109
JUMPV
LABELV $108
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $111
line 48
;48:		s = va("%ist", rank);
ADDRGP4 $113
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 49
;49:	} else if ( rank % 10 == 2 ) {
ADDRGP4 $112
JUMPV
LABELV $111
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
NEI4 $114
line 50
;50:		s = va("%ind", rank);
ADDRGP4 $116
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 51
;51:	} else if ( rank % 10 == 3 ) {
ADDRGP4 $115
JUMPV
LABELV $114
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 3
NEI4 $117
line 52
;52:		s = va("%ird", rank);
ADDRGP4 $119
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 53
;53:	} else {
ADDRGP4 $118
JUMPV
LABELV $117
line 54
;54:		s = va("%ith", rank);
ADDRGP4 $120
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 55
;55:	}
LABELV $118
LABELV $115
LABELV $112
LABELV $109
LABELV $106
LABELV $103
LABELV $100
LABELV $97
LABELV $94
line 57
;56:
;57:	Com_sprintf( str, sizeof( str ), "%s%s", t, s );
ADDRGP4 $88
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $121
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 58
;58:	return str;
ADDRGP4 $88
RETP4
LABELV $87
endproc CG_PlaceString 12 20
proc CG_Obituary 1340 20
line 67
;59:}
;60:
;61:
;62:/*
;63:=============
;64:CG_Obituary
;65:=============
;66:*/
;67:static void CG_Obituary( entityState_t *ent ) {
line 80
;68:	int			mod;
;69:	int			target, attacker;
;70:	char		*message;
;71:	char		*message2;
;72:	const char	*targetInfo;
;73:	const char	*attackerInfo;
;74:	char		targetName[32];
;75:	char		attackerName[32];
;76:	gender_t	gender;
;77:	clientInfo_t	*ci;
;78:	qboolean	following;
;79:
;80:	target = ent->otherEntityNum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 81
;81:	attacker = ent->otherEntityNum2;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 82
;82:	mod = ent->eventParm;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 84
;83:
;84:	if ( target < 0 || target >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $125
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $123
LABELV $125
line 85
;85:		CG_Error( "CG_Obituary: target out of range" );
ADDRGP4 $126
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 86
;86:	}
LABELV $123
line 87
;87:	ci = &cgs.clientinfo[target];
ADDRLP4 92
ADDRLP4 4
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ASGNP4
line 89
;88:
;89:	if ( attacker < 0 || attacker >= MAX_CLIENTS ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $130
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $128
LABELV $130
line 90
;90:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 91
;91:		attackerInfo = NULL;
ADDRLP4 84
CNSTP4 0
ASGNP4
line 92
;92:	} else {
ADDRGP4 $129
JUMPV
LABELV $128
line 93
;93:		attackerInfo = CG_ConfigString( CS_PLAYERS + attacker );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 112
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 112
INDIRP4
ASGNP4
line 94
;94:	}
LABELV $129
line 96
;95:
;96:	targetInfo = CG_ConfigString( CS_PLAYERS + target );
ADDRLP4 4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 112
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 112
INDIRP4
ASGNP4
line 97
;97:	if ( !targetInfo[0] )
ADDRLP4 48
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $131
line 98
;98:	{
line 99
;99:		return;
ADDRGP4 $122
JUMPV
LABELV $131
line 101
;100:	}
;101:	Q_strncpyz( targetName, Info_ValueForKey( targetInfo, "n" ), sizeof(targetName) - 2);
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 $133
ARGP4
ADDRLP4 116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 102
;102:	strcat( targetName, S_COLOR_WHITE );
ADDRLP4 8
ARGP4
ADDRGP4 $134
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 104
;103:
;104:	following = cg.snap->ps.pm_flags & PMF_FOLLOW;
ADDRLP4 96
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ASGNI4
line 106
;105:
;106:	message2 = "";
ADDRLP4 88
ADDRGP4 $92
ASGNP4
line 110
;107:
;108:	// check for single client messages
;109:
;110:	switch( mod ) {
ADDRLP4 44
INDIRI4
CNSTI4 14
LTI4 $136
ADDRLP4 44
INDIRI4
CNSTI4 22
GTI4 $136
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $154-56
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $154
address $144
address $146
address $148
address $142
address $136
address $140
address $138
address $150
address $152
code
LABELV $138
line 112
;111:	case MOD_SUICIDE:
;112:		message = "suicides";
ADDRLP4 40
ADDRGP4 $139
ASGNP4
line 113
;113:		break;
ADDRGP4 $137
JUMPV
LABELV $140
line 115
;114:	case MOD_FALLING:
;115:		message = "cratered";
ADDRLP4 40
ADDRGP4 $141
ASGNP4
line 116
;116:		break;
ADDRGP4 $137
JUMPV
LABELV $142
line 118
;117:	case MOD_CRUSH:
;118:		message = "was squished";
ADDRLP4 40
ADDRGP4 $143
ASGNP4
line 119
;119:		break;
ADDRGP4 $137
JUMPV
LABELV $144
line 121
;120:	case MOD_WATER:
;121:		message = "sank like a rock";
ADDRLP4 40
ADDRGP4 $145
ASGNP4
line 122
;122:		break;
ADDRGP4 $137
JUMPV
LABELV $146
line 124
;123:	case MOD_SLIME:
;124:		message = "melted";
ADDRLP4 40
ADDRGP4 $147
ASGNP4
line 125
;125:		break;
ADDRGP4 $137
JUMPV
LABELV $148
line 127
;126:	case MOD_LAVA:
;127:		message = "does a back flip into the lava";
ADDRLP4 40
ADDRGP4 $149
ASGNP4
line 128
;128:		break;
ADDRGP4 $137
JUMPV
LABELV $150
line 130
;129:	case MOD_TARGET_LASER:
;130:		message = "saw the light";
ADDRLP4 40
ADDRGP4 $151
ASGNP4
line 131
;131:		break;
ADDRGP4 $137
JUMPV
LABELV $152
line 133
;132:	case MOD_TRIGGER_HURT:
;133:		message = "was in the wrong place";
ADDRLP4 40
ADDRGP4 $153
ASGNP4
line 134
;134:		break;
ADDRGP4 $137
JUMPV
LABELV $136
line 136
;135:	default:
;136:		message = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
line 137
;137:		break;
LABELV $137
line 140
;138:	}
;139:
;140:	if (attacker == target) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $156
line 141
;141:		gender = ci->gender;
ADDRLP4 100
ADDRLP4 92
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ASGNI4
line 142
;142:		switch (mod) {
ADDRLP4 44
INDIRI4
CNSTI4 5
EQI4 $160
ADDRLP4 44
INDIRI4
CNSTI4 7
EQI4 $168
ADDRLP4 44
INDIRI4
CNSTI4 9
EQI4 $176
ADDRLP4 44
INDIRI4
CNSTI4 5
LTI4 $158
LABELV $193
ADDRLP4 44
INDIRI4
CNSTI4 13
EQI4 $184
ADDRGP4 $158
JUMPV
LABELV $160
line 149
;143:#ifdef MISSIONPACK
;144:		case MOD_KAMIKAZE:
;145:			message = "goes out with a bang";
;146:			break;
;147:#endif
;148:		case MOD_GRENADE_SPLASH:
;149:			if ( gender == GENDER_FEMALE )
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $161
line 150
;150:				message = "tripped on her own grenade";
ADDRLP4 40
ADDRGP4 $163
ASGNP4
ADDRGP4 $159
JUMPV
LABELV $161
line 151
;151:			else if ( gender == GENDER_NEUTER )
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $164
line 152
;152:				message = "tripped on its own grenade";
ADDRLP4 40
ADDRGP4 $166
ASGNP4
ADDRGP4 $159
JUMPV
LABELV $164
line 154
;153:			else
;154:				message = "tripped on his own grenade";
ADDRLP4 40
ADDRGP4 $167
ASGNP4
line 155
;155:			break;
ADDRGP4 $159
JUMPV
LABELV $168
line 157
;156:		case MOD_ROCKET_SPLASH:
;157:			if ( gender == GENDER_FEMALE )
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $169
line 158
;158:				message = "blew herself up";
ADDRLP4 40
ADDRGP4 $171
ASGNP4
ADDRGP4 $159
JUMPV
LABELV $169
line 159
;159:			else if ( gender == GENDER_NEUTER )
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $172
line 160
;160:				message = "blew itself up";
ADDRLP4 40
ADDRGP4 $174
ASGNP4
ADDRGP4 $159
JUMPV
LABELV $172
line 162
;161:			else
;162:				message = "blew himself up";
ADDRLP4 40
ADDRGP4 $175
ASGNP4
line 163
;163:			break;
ADDRGP4 $159
JUMPV
LABELV $176
line 165
;164:		case MOD_PLASMA_SPLASH:
;165:			if ( gender == GENDER_FEMALE )
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $177
line 166
;166:				message = "melted herself";
ADDRLP4 40
ADDRGP4 $179
ASGNP4
ADDRGP4 $159
JUMPV
LABELV $177
line 167
;167:			else if ( gender == GENDER_NEUTER )
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $180
line 168
;168:				message = "melted itself";
ADDRLP4 40
ADDRGP4 $182
ASGNP4
ADDRGP4 $159
JUMPV
LABELV $180
line 170
;169:			else
;170:				message = "melted himself";
ADDRLP4 40
ADDRGP4 $183
ASGNP4
line 171
;171:			break;
ADDRGP4 $159
JUMPV
LABELV $184
line 173
;172:		case MOD_BFG_SPLASH:
;173:			message = "should have used a smaller gun";
ADDRLP4 40
ADDRGP4 $185
ASGNP4
line 174
;174:			break;
ADDRGP4 $159
JUMPV
LABELV $158
line 187
;175:#ifdef MISSIONPACK
;176:		case MOD_PROXIMITY_MINE:
;177:			if( gender == GENDER_FEMALE ) {
;178:				message = "found her prox mine";
;179:			} else if ( gender == GENDER_NEUTER ) {
;180:				message = "found its prox mine";
;181:			} else {
;182:				message = "found his prox mine";
;183:			}
;184:			break;
;185:#endif
;186:		default:
;187:			if ( gender == GENDER_FEMALE )
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $186
line 188
;188:				message = "killed herself";
ADDRLP4 40
ADDRGP4 $188
ASGNP4
ADDRGP4 $159
JUMPV
LABELV $186
line 189
;189:			else if ( gender == GENDER_NEUTER )
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $189
line 190
;190:				message = "killed itself";
ADDRLP4 40
ADDRGP4 $191
ASGNP4
ADDRGP4 $159
JUMPV
LABELV $189
line 192
;191:			else
;192:				message = "killed himself";
ADDRLP4 40
ADDRGP4 $192
ASGNP4
line 193
;193:			break;
LABELV $159
line 195
;194:		}
;195:	}
LABELV $156
line 197
;196:
;197:	if ( message ) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $194
line 198
;198:		CG_Printf( "%s %s.\n", targetName, message);
ADDRGP4 $196
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 200
;199:		// switch to first killer if not following anyone
;200:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR && cg_followKiller.integer ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $122
ADDRGP4 cg_followKiller+12
INDIRI4
CNSTI4 0
EQI4 $122
line 201
;201:			if ( !cg.followTime && attacker != cg.snap->ps.clientNum && attacker < MAX_CLIENTS ) {
ADDRGP4 cg+282940
INDIRI4
CNSTI4 0
NEI4 $122
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $122
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $122
line 202
;202:				cg.followClient = attacker;
ADDRGP4 cg+282944
ADDRLP4 0
INDIRI4
ASGNI4
line 203
;203:				cg.followTime = cg.time;
ADDRGP4 cg+282940
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 204
;204:			}
line 205
;205:		}
line 206
;206:		return;
ADDRGP4 $122
JUMPV
LABELV $194
line 210
;207:	}
;208:
;209:	// check for kill messages from the current clientNum
;210:	if ( attacker == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $208
line 213
;211:		char	*s;
;212:
;213:		if ( cgs.gametype < GT_TEAM ) {
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
GEI4 $211
line 214
;214:			s = va("You fragged %s\n%s place with %i", targetName, 
ADDRGP4 cg+36
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 128
ADDRGP4 CG_PlaceString
CALLP4
ASGNP4
ADDRGP4 $214
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 124
ADDRLP4 132
INDIRP4
ASGNP4
line 217
;215:				CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ),
;216:				cg.snap->ps.persistant[PERS_SCORE] );
;217:		} else {
ADDRGP4 $212
JUMPV
LABELV $211
line 218
;218:			s = va("You fragged %s", targetName );
ADDRGP4 $217
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 128
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 124
ADDRLP4 128
INDIRP4
ASGNP4
line 219
;219:		}
LABELV $212
line 226
;220:#ifdef MISSIONPACK
;221:		if (!(cg_singlePlayerActive.integer && cg_cameraOrbit.integer)) {
;222:			CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
;223:		}
;224:#endif
;225:#ifdef USE_NEOHUD
;226:		{
line 228
;227:		item_t itm;
;228:		itm = dyn_itemArray[KillMsg_idx];
ADDRLP4 128
ADDRGP4 KillMsg_idx
INDIRI4
CNSTI4 1212
MULI4
ADDRGP4 dyn_itemArray
ADDP4
INDIRB
ASGNB 1212
line 229
;229:		CG_CenterPrint( s, itm.rect.y, itm.fontsize.w, itm.forecolor.color );
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 128+1088+4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 128+1120
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 128+1152
ARGP4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 230
;230:		}
line 237
;231:#endif
;232:#if !defined MISSIONPACK && !defined USE_NEOHUD
;233:		CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
;234:#endif
;235:
;236:		// print the text message as well
;237:	}
LABELV $208
line 240
;238:
;239:	// check for double client messages
;240:	if ( !attackerInfo ) {
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $222
line 241
;241:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 242
;242:		strcpy( attackerName, "noname" );
ADDRLP4 52
ARGP4
ADDRGP4 $224
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 243
;243:	} else {
ADDRGP4 $223
JUMPV
LABELV $222
line 244
;244:		Q_strncpyz( attackerName, Info_ValueForKey( attackerInfo, "n" ), sizeof(attackerName) - 2);
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 $133
ARGP4
ADDRLP4 124
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 52
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 245
;245:		Q_CleanStr( attackerName );
ADDRLP4 52
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 246
;246:		strcat( attackerName, S_COLOR_WHITE );
ADDRLP4 52
ARGP4
ADDRGP4 $134
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 248
;247:		// check for kill messages about the current clientNum
;248:		if ( target == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $225
line 249
;249:			Q_strncpyz( cg.killerName, attackerName, sizeof( cg.killerName ) );
ADDRGP4 cg+243128
ARGP4
ADDRLP4 52
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 251
;250:			// follow killer
;251:			if ( following && cg_followKiller.integer ) {
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $230
ADDRGP4 cg_followKiller+12
INDIRI4
CNSTI4 0
EQI4 $230
line 252
;252:				if ( !cg.followTime && attacker != cg.snap->ps.clientNum && attacker < MAX_CLIENTS ) {
ADDRGP4 cg+282940
INDIRI4
CNSTI4 0
NEI4 $233
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $233
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $233
line 253
;253:					cg.followClient = attacker;
ADDRGP4 cg+282944
ADDRLP4 0
INDIRI4
ASGNI4
line 254
;254:					cg.followTime = cg.time + 1100;
ADDRGP4 cg+282940
ADDRGP4 cg+234764
INDIRI4
CNSTI4 1100
ADDI4
ASGNI4
line 255
;255:				}
LABELV $233
line 256
;256:			}
LABELV $230
line 257
;257:		}
LABELV $225
line 258
;258:	}
LABELV $223
line 260
;259:
;260:	if ( attacker != ENTITYNUM_WORLD ) {
ADDRLP4 0
INDIRI4
CNSTI4 1022
EQI4 $240
line 261
;261:		switch (mod) {
ADDRLP4 44
INDIRI4
CNSTI4 1
LTI4 $242
ADDRLP4 44
INDIRI4
CNSTI4 23
GTI4 $242
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $277-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $277
address $250
address $246
address $248
address $252
address $255
address $258
address $260
address $262
address $265
address $266
address $268
address $270
address $270
address $242
address $242
address $242
address $242
address $273
address $242
address $242
address $242
address $242
address $244
code
LABELV $244
line 263
;262:		case MOD_GRAPPLE:
;263:			message = "was caught by";
ADDRLP4 40
ADDRGP4 $245
ASGNP4
line 264
;264:			break;
ADDRGP4 $243
JUMPV
LABELV $246
line 266
;265:		case MOD_GAUNTLET:
;266:			message = "was pummeled by";
ADDRLP4 40
ADDRGP4 $247
ASGNP4
line 267
;267:			break;
ADDRGP4 $243
JUMPV
LABELV $248
line 269
;268:		case MOD_MACHINEGUN:
;269:			message = "was machinegunned by";
ADDRLP4 40
ADDRGP4 $249
ASGNP4
line 270
;270:			break;
ADDRGP4 $243
JUMPV
LABELV $250
line 272
;271:		case MOD_SHOTGUN:
;272:			message = "was gunned down by";
ADDRLP4 40
ADDRGP4 $251
ASGNP4
line 273
;273:			break;
ADDRGP4 $243
JUMPV
LABELV $252
line 275
;274:		case MOD_GRENADE:
;275:			message = "ate";
ADDRLP4 40
ADDRGP4 $253
ASGNP4
line 276
;276:			message2 = "'s grenade";
ADDRLP4 88
ADDRGP4 $254
ASGNP4
line 277
;277:			break;
ADDRGP4 $243
JUMPV
LABELV $255
line 279
;278:		case MOD_GRENADE_SPLASH:
;279:			message = "was shredded by";
ADDRLP4 40
ADDRGP4 $256
ASGNP4
line 280
;280:			message2 = "'s shrapnel";
ADDRLP4 88
ADDRGP4 $257
ASGNP4
line 281
;281:			break;
ADDRGP4 $243
JUMPV
LABELV $258
line 283
;282:		case MOD_ROCKET:
;283:			message = "ate";
ADDRLP4 40
ADDRGP4 $253
ASGNP4
line 284
;284:			message2 = "'s rocket";
ADDRLP4 88
ADDRGP4 $259
ASGNP4
line 285
;285:			break;
ADDRGP4 $243
JUMPV
LABELV $260
line 287
;286:		case MOD_ROCKET_SPLASH:
;287:			message = "almost dodged";
ADDRLP4 40
ADDRGP4 $261
ASGNP4
line 288
;288:			message2 = "'s rocket";
ADDRLP4 88
ADDRGP4 $259
ASGNP4
line 289
;289:			break;
ADDRGP4 $243
JUMPV
LABELV $262
line 291
;290:		case MOD_PLASMA:
;291:			message = "was melted by";
ADDRLP4 40
ADDRGP4 $263
ASGNP4
line 292
;292:			message2 = "'s plasmagun";
ADDRLP4 88
ADDRGP4 $264
ASGNP4
line 293
;293:			break;
ADDRGP4 $243
JUMPV
LABELV $265
line 295
;294:		case MOD_PLASMA_SPLASH:
;295:			message = "was melted by";
ADDRLP4 40
ADDRGP4 $263
ASGNP4
line 296
;296:			message2 = "'s plasmagun";
ADDRLP4 88
ADDRGP4 $264
ASGNP4
line 297
;297:			break;
ADDRGP4 $243
JUMPV
LABELV $266
line 299
;298:		case MOD_RAILGUN:
;299:			message = "was railed by";
ADDRLP4 40
ADDRGP4 $267
ASGNP4
line 300
;300:			break;
ADDRGP4 $243
JUMPV
LABELV $268
line 302
;301:		case MOD_LIGHTNING:
;302:			message = "was electrocuted by";
ADDRLP4 40
ADDRGP4 $269
ASGNP4
line 303
;303:			break;
ADDRGP4 $243
JUMPV
LABELV $270
line 306
;304:		case MOD_BFG:
;305:		case MOD_BFG_SPLASH:
;306:			message = "was blasted by";
ADDRLP4 40
ADDRGP4 $271
ASGNP4
line 307
;307:			message2 = "'s BFG";
ADDRLP4 88
ADDRGP4 $272
ASGNP4
line 308
;308:			break;
ADDRGP4 $243
JUMPV
LABELV $273
line 330
;309:#ifdef MISSIONPACK
;310:		case MOD_NAIL:
;311:			message = "was nailed by";
;312:			break;
;313:		case MOD_CHAINGUN:
;314:			message = "got lead poisoning from";
;315:			message2 = "'s Chaingun";
;316:			break;
;317:		case MOD_PROXIMITY_MINE:
;318:			message = "was too close to";
;319:			message2 = "'s Prox Mine";
;320:			break;
;321:		case MOD_KAMIKAZE:
;322:			message = "falls to";
;323:			message2 = "'s Kamikaze blast";
;324:			break;
;325:		case MOD_JUICED:
;326:			message = "was juiced by";
;327:			break;
;328:#endif
;329:		case MOD_TELEFRAG:
;330:			message = "tried to invade";
ADDRLP4 40
ADDRGP4 $274
ASGNP4
line 331
;331:			message2 = "'s personal space";
ADDRLP4 88
ADDRGP4 $275
ASGNP4
line 332
;332:			break;
ADDRGP4 $243
JUMPV
LABELV $242
line 334
;333:		default:
;334:			message = "was killed by";
ADDRLP4 40
ADDRGP4 $276
ASGNP4
line 335
;335:			break;
LABELV $243
line 338
;336:		}
;337:
;338:		if ( message ) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $279
line 339
;339:			CG_Printf( "%s %s %s%s\n", targetName, message, attackerName, message2 );
ADDRGP4 $281
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 341
;340:			// switch to first killer if not following anyone
;341:			if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR && cg_followKiller.integer ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $122
ADDRGP4 cg_followKiller+12
INDIRI4
CNSTI4 0
EQI4 $122
line 342
;342:				if ( !cg.followTime && attacker != cg.snap->ps.clientNum && attacker < MAX_CLIENTS ) {
ADDRGP4 cg+282940
INDIRI4
CNSTI4 0
NEI4 $122
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $122
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $122
line 343
;343:					cg.followClient = attacker;
ADDRGP4 cg+282944
ADDRLP4 0
INDIRI4
ASGNI4
line 344
;344:					cg.followTime = cg.time;
ADDRGP4 cg+282940
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 345
;345:				}
line 346
;346:			}
line 347
;347:			return;
ADDRGP4 $122
JUMPV
LABELV $279
line 349
;348:		}
;349:	}
LABELV $240
line 352
;350:
;351:	// we don't know what it was
;352:	CG_Printf( "%s "S_COLOR_STRIP"died.\n", targetName );
ADDRGP4 $293
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 353
;353:}
LABELV $122
endproc CG_Obituary 1340 20
proc CG_UseItem 1244 16
line 362
;354://==========================================================================
;355:
;356:
;357:/*
;358:===============
;359:CG_UseItem
;360:===============
;361:*/
;362:static void CG_UseItem( centity_t *cent ) {
line 368
;363:	clientInfo_t	*ci;
;364:	int				itemNum, clientNum;
;365:	gitem_t			*item;
;366:	entityState_t	*es;
;367:
;368:	es = &cent->currentState;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 370
;369:	
;370:	itemNum = (es->event & ~EV_EVENT_BITS) - EV_USE_ITEM0;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 25
SUBI4
ASGNI4
line 371
;371:	if ( itemNum < 0 || itemNum > HI_NUM_HOLDABLE ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $297
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $295
LABELV $297
line 372
;372:		itemNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 373
;373:	}
LABELV $295
line 377
;374:
;375:	// print a message if the local player
;376:#ifdef USE_NEOHUD
;377:	if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $298
line 378
;378:		item_t itm = dyn_itemArray[ItemMsg_idx];
ADDRLP4 24
ADDRGP4 ItemMsg_idx
INDIRI4
CNSTI4 1212
MULI4
ADDRGP4 dyn_itemArray
ADDP4
INDIRB
ASGNB 1212
line 379
;379:		if ( !itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $301
line 380
;380:			CG_CenterPrint( "No item to use", itm.rect.y, itm.fontsize.w, itm.forecolor.color);
ADDRGP4 $303
ARGP4
ADDRLP4 24+1088+4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 24+1120
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 24+1152
ARGP4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 381
;381:		} else {
ADDRGP4 $302
JUMPV
LABELV $301
line 382
;382:			item = BG_FindItemForHoldable( itemNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1236
ADDRGP4 BG_FindItemForHoldable
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1236
INDIRP4
ASGNP4
line 383
;383:			CG_CenterPrint( va("Use %s", item->pickup_name), itm.rect.y, itm.fontsize.w, itm.forecolor.color);
ADDRGP4 $308
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRLP4 1240
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1240
INDIRP4
ARGP4
ADDRLP4 24+1088+4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 24+1120
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 24+1152
ARGP4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 384
;384:		}
LABELV $302
line 385
;385:	}
LABELV $298
line 397
;386:#else
;387:	if ( es->number == cg.snap->ps.clientNum ) {
;388:		if ( !itemNum ) {
;389:			CG_CenterPrint( "No item to use", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
;390:		} else {
;391:			item = BG_FindItemForHoldable( itemNum );
;392:			CG_CenterPrint( va("Use %s", item->pickup_name), SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
;393:		}
;394:	}
;395:#endif
;396:
;397:	switch ( itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $315
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $314
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $319
ADDRGP4 $313
JUMPV
LABELV $313
LABELV $315
line 400
;398:	default:
;399:	case HI_NONE:
;400:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useNothingSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+150560+588
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 401
;401:		break;
ADDRGP4 $314
JUMPV
line 404
;402:
;403:	case HI_TELEPORTER:
;404:		break;
LABELV $319
line 407
;405:
;406:	case HI_MEDKIT:
;407:		clientNum = cent->currentState.clientNum;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 408
;408:		if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 28
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $320
ADDRLP4 28
INDIRI4
CNSTI4 64
GEI4 $320
line 409
;409:			ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 16
ADDRLP4 12
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ASGNP4
line 410
;410:			ci->medkitUsageTime = cg.time;
ADDRLP4 16
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 411
;411:		}
LABELV $320
line 412
;412:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.medkitSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+150560+900
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 413
;413:		break;
LABELV $314
line 426
;414:
;415:#ifdef MISSIONPACK
;416:	case HI_KAMIKAZE:
;417:		break;
;418:
;419:	case HI_PORTAL:
;420:		break;
;421:	case HI_INVULNERABILITY:
;422:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useInvulnerabilitySound );
;423:		break;
;424:#endif
;425:	}
;426:}
LABELV $294
endproc CG_UseItem 1244 16
data
align 4
LABELV $327
byte 4 -1
code
proc CG_ItemPickup 4 0
line 436
;427:
;428:
;429:/*
;430:================
;431:CG_ItemPickup
;432:
;433:A new item was picked up this frame
;434:================
;435:*/
;436:static void CG_ItemPickup( int itemNum ) {
line 439
;437:	static int oldItem = -1;
;438:	
;439:	cg.itemPickup = itemNum;
ADDRGP4 cg+245620
ADDRFP4 0
INDIRI4
ASGNI4
line 440
;440:	cg.itemPickupTime = cg.time;
ADDRGP4 cg+245628
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 441
;441:	cg.itemPickupBlendTime = cg.time;
ADDRGP4 cg+245632
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 443
;442:
;443:	if ( oldItem != itemNum )
ADDRGP4 $327
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $333
line 444
;444:		cg.itemPickupCount = 1;
ADDRGP4 cg+245624
CNSTI4 1
ASGNI4
ADDRGP4 $334
JUMPV
LABELV $333
line 446
;445:	else
;446:		cg.itemPickupCount++;
ADDRLP4 0
ADDRGP4 cg+245624
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $334
line 448
;447:
;448:	oldItem = itemNum;
ADDRGP4 $327
ADDRFP4 0
INDIRI4
ASGNI4
line 451
;449:	
;450:	// see if it should be the grabbed weapon
;451:	if ( bg_itemlist[itemNum].giType == IT_WEAPON ) {
ADDRFP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $337
line 453
;452:		// select it immediately
;453:		if ( cg_autoswitch.integer && bg_itemlist[itemNum].giTag != WP_MACHINEGUN ) {
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 0
EQI4 $340
ADDRFP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 2
EQI4 $340
line 454
;454:			cg.weaponSelectTime = cg.time;
ADDRGP4 cg+245636
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 455
;455:			cg.weaponSelect = bg_itemlist[itemNum].giTag;
ADDRGP4 cg+236704
ADDRFP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 456
;456:		}
LABELV $340
line 457
;457:	}
LABELV $337
line 459
;458:
;459:}
LABELV $326
endproc CG_ItemPickup 4 0
export CG_WaterLevel
proc CG_WaterLevel 52 8
line 469
;460:
;461:
;462:/*
;463:================
;464:CG_WaterLevel
;465:
;466:Returns waterlevel for entity origin
;467:================
;468:*/
;469:int CG_WaterLevel(centity_t *cent) {
line 474
;470:	vec3_t point;
;471:	int contents, sample1, sample2, anim, waterlevel;
;472:	int viewheight;
;473:
;474:	anim = cent->currentState.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 476
;475:
;476:	if ( anim == LEGS_WALKCR || anim == LEGS_IDLECR ) {
ADDRLP4 16
INDIRI4
CNSTI4 13
EQI4 $351
ADDRLP4 16
INDIRI4
CNSTI4 23
NEI4 $349
LABELV $351
line 478
;477:#ifdef USE_VR
;478:		viewheight = cg.heightCrouch;
ADDRLP4 24
ADDRGP4 cg+282964
INDIRF4
CVFI4 4
ASGNI4
line 482
;479:#else
;480:		viewheight = CROUCH_VIEWHEIGHT;
;481:#endif
;482:	} else {
ADDRGP4 $350
JUMPV
LABELV $349
line 484
;483:#ifdef USE_VR
;484:		viewheight = cg.heightStand;
ADDRLP4 24
ADDRGP4 cg+282960
INDIRF4
CVFI4 4
ASGNI4
line 488
;485:#else
;486:		viewheight = DEFAULT_VIEWHEIGHT;
;487:#endif
;488:	}
LABELV $350
line 493
;489:
;490:	//
;491:	// get waterlevel, accounting for ducking
;492:	//
;493:	waterlevel = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 495
;494:
;495:	point[0] = cent->lerpOrigin[0];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
INDIRF4
ASGNF4
line 496
;496:	point[1] = cent->lerpOrigin[1];
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 1216
ADDP4
INDIRF4
ASGNF4
line 497
;497:	point[2] = cent->lerpOrigin[2] + MINS_Z + 1;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 1220
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 498
;498:	contents = CG_PointContents(point, -1);
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 40
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 40
INDIRI4
ASGNI4
line 500
;499:
;500:	if ( contents & MASK_WATER ) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $356
line 501
;501:		sample2 = viewheight - MINS_Z;
ADDRLP4 28
ADDRLP4 24
INDIRI4
CNSTI4 -24
SUBI4
ASGNI4
line 502
;502:		sample1 = sample2 / 2;
ADDRLP4 32
ADDRLP4 28
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 503
;503:		waterlevel = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 504
;504:		point[2] = cent->lerpOrigin[2] + MINS_Z + sample1;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 1220
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 32
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 505
;505:		contents = CG_PointContents(point, -1);
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 44
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 507
;506:
;507:		if (contents & MASK_WATER) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $359
line 508
;508:			waterlevel = 2;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 509
;509:			point[2] = cent->lerpOrigin[2] + MINS_Z + sample2;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 1220
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 28
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 510
;510:			contents = CG_PointContents(point, -1);
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 48
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 512
;511:
;512:			if (contents & MASK_WATER) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $362
line 513
;513:				waterlevel = 3;
ADDRLP4 20
CNSTI4 3
ASGNI4
line 514
;514:			}
LABELV $362
line 515
;515:		}
LABELV $359
line 516
;516:	}
LABELV $356
line 518
;517:
;518:	return waterlevel;
ADDRLP4 20
INDIRI4
RETI4
LABELV $348
endproc CG_WaterLevel 52 8
export CG_PainEvent
proc CG_PainEvent 16 16
line 528
;519:}
;520:
;521:/*
;522:================
;523:CG_PainEvent
;524:
;525:Also called by playerstate transition
;526:================
;527:*/
;528:void CG_PainEvent( centity_t *cent, int health ) {
line 532
;529:	const char *snd;
;530:
;531:	// don't do more than two pain sounds a second
;532:	if ( cg.time - cent->pe.painTime < 500 ) {
ADDRGP4 cg+234764
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1100
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $365
line 533
;533:		cent->pe.painIgnore = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1108
ADDP4
CNSTI4 0
ASGNI4
line 534
;534:		return;
ADDRGP4 $364
JUMPV
LABELV $365
line 537
;535:	}
;536:
;537:	if ( cent->pe.painIgnore ) {
ADDRFP4 0
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
CNSTI4 0
EQI4 $368
line 538
;538:		cent->pe.painIgnore = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1108
ADDP4
CNSTI4 0
ASGNI4
line 539
;539:		return;
ADDRGP4 $364
JUMPV
LABELV $368
line 542
;540:	}
;541:
;542:	if ( health < 25 ) {
ADDRFP4 4
INDIRI4
CNSTI4 25
GEI4 $370
line 543
;543:		snd = "*pain25_1.wav";
ADDRLP4 0
ADDRGP4 $372
ASGNP4
line 544
;544:	} else if ( health < 50 ) {
ADDRGP4 $371
JUMPV
LABELV $370
ADDRFP4 4
INDIRI4
CNSTI4 50
GEI4 $373
line 545
;545:		snd = "*pain50_1.wav";
ADDRLP4 0
ADDRGP4 $375
ASGNP4
line 546
;546:	} else if ( health < 75 ) {
ADDRGP4 $374
JUMPV
LABELV $373
ADDRFP4 4
INDIRI4
CNSTI4 75
GEI4 $376
line 547
;547:		snd = "*pain75_1.wav";
ADDRLP4 0
ADDRGP4 $378
ASGNP4
line 548
;548:	} else {
ADDRGP4 $377
JUMPV
LABELV $376
line 549
;549:		snd = "*pain100_1.wav";
ADDRLP4 0
ADDRGP4 $379
ASGNP4
line 550
;550:	}
LABELV $377
LABELV $374
LABELV $371
line 553
;551:
;552:	// play a gurp sound instead of a normal pain sound
;553:	if (CG_WaterLevel(cent) == 3) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CG_WaterLevel
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $380
line 554
;554:		if (rand()&1) {
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $382
line 555
;555:			trap_S_StartSound(NULL, cent->currentState.number, CHAN_VOICE, CG_CustomSound(cent->currentState.number, "sound/player/gurp1.wav"));
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $384
ARGP4
ADDRLP4 12
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 556
;556:		} else {
ADDRGP4 $381
JUMPV
LABELV $382
line 557
;557:			trap_S_StartSound(NULL, cent->currentState.number, CHAN_VOICE, CG_CustomSound(cent->currentState.number, "sound/player/gurp2.wav"));
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $385
ARGP4
ADDRLP4 12
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 558
;558:		}
line 559
;559:	} else {
ADDRGP4 $381
JUMPV
LABELV $380
line 560
;560:		trap_S_StartSound(NULL, cent->currentState.number, CHAN_VOICE, CG_CustomSound(cent->currentState.number, snd));
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 561
;561:	}
LABELV $381
line 564
;562:
;563:	// save pain time for programitic twitch animation
;564:	cent->pe.painTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 1100
ADDP4
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 565
;565:	cent->pe.painDirection ^= 1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1104
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 566
;566:}
LABELV $364
endproc CG_PainEvent 16 16
data
align 4
LABELV $493
byte 4 0
byte 4 0
byte 4 1065353216
export CG_EntityEvent
code
proc CG_EntityEvent 112 48
line 578
;567:
;568:
;569:
;570:/*
;571:==============
;572:CG_EntityEvent
;573:
;574:An entity has an event value
;575:also called by CG_CheckPlayerstateEvents
;576:==============
;577:*/
;578:void CG_EntityEvent( centity_t *cent, vec3_t position, int entityNum ) {
line 589
;579:	entityState_t	*es;
;580:	entity_event_t	event;
;581:	vec3_t			dir;
;582:	const char		*s;
;583:	int				clientNum;
;584:	clientInfo_t	*ci;
;585:	vec3_t			vec;
;586:	//float			fovOffset;
;587:	centity_t		*ce;
;588:
;589:	es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 590
;590:	event = es->event & ~EV_EVENT_BITS;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 592
;591:
;592:	if ( (unsigned) event >= EV_MAX ) {
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 84
LTU4 $388
line 593
;593:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $390
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 594
;594:		return;
ADDRGP4 $387
JUMPV
LABELV $388
line 597
;595:	}
;596:
;597:	if ( cg_debugEvents.integer ) {
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $391
line 598
;598:		CG_Printf( "ent:%3i  event:%3i %s", es->number, event, eventnames[ event ] );
ADDRGP4 $394
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventnames
ADDP4
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 599
;599:	}
LABELV $391
line 601
;600:
;601:	if ( !event ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $395
line 602
;602:		return;
ADDRGP4 $387
JUMPV
LABELV $395
line 605
;603:	}
;604:
;605:	clientNum = es->clientNum;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 606
;606:	if ( (unsigned) clientNum >= MAX_CLIENTS ) {
ADDRLP4 8
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $397
line 607
;607:		clientNum = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 608
;608:	}
LABELV $397
line 609
;609:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 12
ADDRLP4 8
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ASGNP4
line 620
;610:
;611:#ifdef USE_HAPTIC
;612:	if (event >= EV_USE_ITEM0 && event <= EV_USE_ITEM15)
;613:	{
;614:		if (clientNum == cg.predictedPlayerState.clientNum) {
;615:			trap_HapticEvent("pickup_shield", 0, 0, 100, 0, 0);
;616:		}
;617:	}
;618:#endif
;619:
;620:	switch ( event ) {
ADDRLP4 48
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 1
LTI4 $400
ADDRLP4 48
INDIRI4
CNSTI4 83
GTI4 $400
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $826-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $826
address $403
address $409
address $416
address $423
address $430
address $466
address $466
address $466
address $466
address $437
address $447
address $456
address $492
address $500
address $518
address $521
address $524
address $527
address $529
address $550
address $400
address $567
address $571
address $578
address $579
address $579
address $579
address $579
address $579
address $579
address $579
address $579
address $579
address $579
address $579
address $579
address $579
address $579
address $579
address $579
address $593
address $590
address $580
address $587
address $597
address $681
address $686
address $693
address $679
address $678
address $605
address $606
address $607
address $608
address $680
address $400
address $781
address $785
address $785
address $785
address $790
address $791
address $800
address $810
address $820
address $604
address $401
address $401
address $400
address $400
address $400
address $400
address $400
address $400
address $824
address $823
address $504
address $506
address $508
address $510
address $512
address $514
address $516
code
LABELV $403
line 625
;621:	//
;622:	// movement generated events
;623:	//
;624:	case EV_FOOTSTEP:
;625:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $401
line 626
;626:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 56
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 cgs+150560+596
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 628
;627:				cgs.media.footsteps[ ci->footsteps ][rand()&3] );
;628:		}
line 629
;629:		break;
ADDRGP4 $401
JUMPV
LABELV $409
line 632
;630:
;631:	case EV_FOOTSTEP_METAL:
;632:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $401
line 633
;633:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 56
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+150560+596+80
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 635
;634:				cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;635:		}
line 636
;636:		break;
ADDRGP4 $401
JUMPV
LABELV $416
line 639
;637:
;638:	case EV_FOOTSPLASH:
;639:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $401
line 640
;640:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 56
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+150560+596+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 642
;641:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;642:		}
line 643
;643:		break;
ADDRGP4 $401
JUMPV
LABELV $423
line 646
;644:
;645:	case EV_FOOTWADE:
;646:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $401
line 647
;647:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 56
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+150560+596+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 649
;648:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;649:		}
line 650
;650:		break;
ADDRGP4 $401
JUMPV
LABELV $430
line 653
;651:
;652:	case EV_SWIM:
;653:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $401
line 654
;654:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 56
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+150560+596+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 656
;655:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;656:		}
line 657
;657:		break;
ADDRGP4 $401
JUMPV
LABELV $437
line 660
;658:
;659:	case EV_FALL_SHORT:
;660:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.landSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+150560+792
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 661
;661:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+234796+140
INDIRI4
NEI4 $401
line 663
;662:			// smooth landing z changes
;663:			cg.landChange = -8;
ADDRGP4 cg+236696
CNSTF4 3238002688
ASGNF4
line 664
;664:			cg.landTime = cg.time;
ADDRGP4 cg+236700
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 668
;665:#ifdef USE_HAPTIC
;666:			trap_HapticEvent("jump_landing", 0, 0, 40, 0, 0);
;667:#endif
;668:		}
line 669
;669:		break;
ADDRGP4 $401
JUMPV
LABELV $447
line 673
;670:
;671:	case EV_FALL_MEDIUM:
;672:		// use normal pain sound
;673:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*pain100_1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $379
ARGP4
ADDRLP4 56
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 674
;674:		cent->pe.painIgnore = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1108
ADDP4
CNSTI4 1
ASGNI4
line 675
;675:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 1100
ADDP4
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 676
;676:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+234796+140
INDIRI4
NEI4 $401
line 678
;677:			// smooth landing z changes
;678:			cg.landChange = -16;
ADDRGP4 cg+236696
CNSTF4 3246391296
ASGNF4
line 679
;679:			cg.landTime = cg.time;
ADDRGP4 cg+236700
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 683
;680:#ifdef USE_HAPTIC
;681:			trap_HapticEvent("jump_landing", 0, 0, 60, 0, 0);
;682:#endif
;683:		}
line 684
;684:		break;
ADDRGP4 $401
JUMPV
LABELV $456
line 687
;685:
;686:	case EV_FALL_FAR:
;687:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*fall1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $457
ARGP4
ADDRLP4 60
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 688
;688:		cent->pe.painIgnore = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1108
ADDP4
CNSTI4 1
ASGNI4
line 689
;689:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 1100
ADDP4
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 690
;690:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+234796+140
INDIRI4
NEI4 $401
line 692
;691:			// smooth landing z changes
;692:			cg.landChange = -24;
ADDRGP4 cg+236696
CNSTF4 3250585600
ASGNF4
line 693
;693:			cg.landTime = cg.time;
ADDRGP4 cg+236700
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 697
;694:#ifdef USE_HAPTIC
;695:			trap_HapticEvent("jump_landing", 0, 0, 100, 0, 0);
;696:#endif
;697:		}
line 698
;698:		break;
ADDRGP4 $401
JUMPV
LABELV $466
line 704
;699:
;700:	case EV_STEP_4:
;701:	case EV_STEP_8:
;702:	case EV_STEP_12:
;703:	case EV_STEP_16:		// smooth out step up transitions
;704:	{
line 709
;705:		float	oldStep;
;706:		int		delta;
;707:		int		step;
;708:
;709:		if ( clientNum != cg.predictedPlayerState.clientNum ) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+234796+140
INDIRI4
EQI4 $467
line 710
;710:			break;
ADDRGP4 $401
JUMPV
LABELV $467
line 713
;711:		}
;712:		// if we are interpolating, we don't need to smooth steps
;713:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ||
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $479
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $479
ADDRGP4 cg_nopredict+12
INDIRI4
CNSTI4 0
NEI4 $479
ADDRGP4 cgs+151672
INDIRI4
CNSTI4 0
EQI4 $471
LABELV $479
line 714
;714:			cg_nopredict.integer || cgs.synchronousClients ) {
line 715
;715:			break;
ADDRGP4 $401
JUMPV
LABELV $471
line 718
;716:		}
;717:		// check for stepping up before a previous step is completed
;718:		delta = cg.time - cg.stepTime;
ADDRLP4 64
ADDRGP4 cg+234764
INDIRI4
ADDRGP4 cg+236684
INDIRI4
SUBI4
ASGNI4
line 719
;719:		if (delta < STEP_TIME) {
ADDRLP4 64
INDIRI4
CNSTI4 200
GEI4 $482
line 720
;720:			oldStep = cg.stepChange * (STEP_TIME - delta) / STEP_TIME;
ADDRLP4 68
ADDRGP4 cg+236680
INDIRF4
CNSTI4 200
ADDRLP4 64
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1000593162
MULF4
ASGNF4
line 721
;721:		} else {
ADDRGP4 $483
JUMPV
LABELV $482
line 722
;722:			oldStep = 0;
ADDRLP4 68
CNSTF4 0
ASGNF4
line 723
;723:		}
LABELV $483
line 726
;724:
;725:		// add this amount
;726:		step = 4 * (event - EV_STEP_4 + 1 );
ADDRLP4 72
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 24
SUBI4
CNSTI4 4
ADDI4
ASGNI4
line 727
;727:		cg.stepChange = oldStep + step;
ADDRGP4 cg+236680
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 728
;728:		if ( cg.stepChange > MAX_STEP_CHANGE ) {
ADDRGP4 cg+236680
INDIRF4
CNSTF4 1107296256
LEF4 $486
line 729
;729:			cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+236680
CNSTF4 1107296256
ASGNF4
line 730
;730:		}
LABELV $486
line 731
;731:		cg.stepTime = cg.time;
ADDRGP4 cg+236684
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 732
;732:		break;
ADDRGP4 $401
JUMPV
LABELV $492
line 737
;733:	}
;734:
;735:	case EV_JUMP_PAD:
;736://		CG_Printf( "EV_JUMP_PAD w/effect #%i\n", es->eventParm );
;737:		{
line 738
;738:			vec3_t			up = {0, 0, 1};
ADDRLP4 64
ADDRGP4 $493
INDIRB
ASGNB 12
line 741
;739:
;740:
;741:			CG_SmokePuff( cent->lerpOrigin, up, 
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
ARGP4
ADDRLP4 64
ARGP4
CNSTF4 1107296256
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1051260355
ARGF4
CNSTF4 1148846080
ARGF4
ADDRGP4 cg+234764
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cgs+150560+276
INDIRI4
ARGI4
ADDRGP4 CG_SmokePuff
CALLP4
pop
line 748
;742:						  32, 
;743:						  1, 1, 1, 0.33f,
;744:						  1000, 
;745:						  cg.time, 0,
;746:						  LEF_PUFF_DONT_SCALE, 
;747:						  cgs.media.smokePuffShader );
;748:		}
line 751
;749:
;750:		// boing sound at origin, jump sound on player
;751:		trap_S_StartSound ( cent->lerpOrigin, -1, CHAN_VOICE, cgs.media.jumpPadSound );
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 cgs+150560+796
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 752
;752:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $499
ARGP4
ADDRLP4 64
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 758
;753:#ifdef USE_HAPTIC
;754:		if (clientNum == cg.predictedPlayerState.clientNum) {
;755:			trap_HapticEvent("jump_start", 0, 0, 100, 0, 0);
;756:		}
;757:#endif
;758:		break;
ADDRGP4 $401
JUMPV
LABELV $500
line 762
;759:
;760:	case EV_JUMP:
;761:		// pain event with fast sequential jump just creates sound distortion
;762:		if ( cg.time - cent->pe.painTime > 50 )
ADDRGP4 cg+234764
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1100
ADDP4
INDIRI4
SUBI4
CNSTI4 50
LEI4 $401
line 763
;763:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $499
ARGP4
ADDRLP4 68
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 769
;764:#ifdef USE_HAPTIC
;765:		if (clientNum == cg.predictedPlayerState.clientNum) {
;766:			trap_HapticEvent("jump_start", 0, 0, 50, 0, 0);
;767:		}
;768:#endif
;769:		break;
ADDRGP4 $401
JUMPV
LABELV $504
line 772
;770:
;771:	case EV_TAUNT:
;772:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*taunt.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $505
ARGP4
ADDRLP4 72
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 773
;773:		break;
ADDRGP4 $401
JUMPV
LABELV $506
line 777
;774:
;775:#if defined MISSIONPACK || defined USE_NEOHUD
;776:	case EV_TAUNT_YES:
;777:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_YES);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $507
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 778
;778:		break;
ADDRGP4 $401
JUMPV
LABELV $508
line 781
;779:
;780:	case EV_TAUNT_NO:
;781:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_NO);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $509
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 782
;782:		break;
ADDRGP4 $401
JUMPV
LABELV $510
line 785
;783:
;784:	case EV_TAUNT_FOLLOWME:
;785:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_FOLLOWME);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $511
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 786
;786:		break;
ADDRGP4 $401
JUMPV
LABELV $512
line 789
;787:
;788:	case EV_TAUNT_GETFLAG:
;789:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONGETFLAG);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $513
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 790
;790:		break;
ADDRGP4 $401
JUMPV
LABELV $514
line 793
;791:
;792:	case EV_TAUNT_GUARDBASE:
;793:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONDEFENSE);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $515
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 794
;794:		break;
ADDRGP4 $401
JUMPV
LABELV $516
line 797
;795:
;796:	case EV_TAUNT_PATROL:
;797:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONPATROL);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $517
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 798
;798:		break;
ADDRGP4 $401
JUMPV
LABELV $518
line 801
;799:#endif
;800:	case EV_WATER_TOUCH:
;801:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+150560+884
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 802
;802:		break;
ADDRGP4 $401
JUMPV
LABELV $521
line 805
;803:
;804:	case EV_WATER_LEAVE:
;805:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+150560+888
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 806
;806:		break;
ADDRGP4 $401
JUMPV
LABELV $524
line 809
;807:
;808:	case EV_WATER_UNDER:
;809:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrUnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+150560+892
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 810
;810:		break;
ADDRGP4 $401
JUMPV
LABELV $527
line 813
;811:
;812:	case EV_WATER_CLEAR:
;813:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*gasp.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $528
ARGP4
ADDRLP4 76
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 814
;814:		break;
ADDRGP4 $401
JUMPV
LABELV $529
line 817
;815:
;816:	case EV_ITEM_PICKUP:
;817:		{
line 821
;818:			gitem_t	*item;
;819:			int		index;
;820:
;821:			index = es->eventParm;		// player predicted
ADDRLP4 80
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 823
;822:
;823:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 88
ADDRLP4 80
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 1
LTI4 $532
ADDRLP4 88
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $530
LABELV $532
line 824
;824:				break;
ADDRGP4 $401
JUMPV
LABELV $530
line 827
;825:			}
;826:
;827:			if ( entityNum >= 0 ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
LTI4 $533
line 829
;828:				// our predicted entity
;829:				ce = cg_entities + entityNum;
ADDRLP4 28
ADDRFP4 8
INDIRI4
CNSTI4 1236
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 830
;830:				if ( ce->delaySpawn > cg.time && ce->delaySpawnPlayed ) {
ADDRLP4 92
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ADDRGP4 cg+234764
INDIRI4
LEI4 $534
ADDRLP4 92
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 0
EQI4 $534
line 831
;831:					break; // delay item pickup
ADDRGP4 $401
JUMPV
line 833
;832:				}
;833:			} else {
LABELV $533
line 834
;834:				ce = NULL;
ADDRLP4 28
CNSTP4 0
ASGNP4
line 835
;835:			}
LABELV $534
line 837
;836:
;837:			item = &bg_itemlist[ index ];
ADDRLP4 84
ADDRLP4 80
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 841
;838:
;839:			// powerups and team items will have a separate global sound, this one
;840:			// will be played at prediction time
;841:			if ( item->giType == IT_POWERUP || item->giType == IT_TEAM) {
ADDRLP4 92
ADDRLP4 84
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
EQI4 $540
ADDRLP4 92
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $538
LABELV $540
line 842
;842:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.n_healthSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+150560+1068
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 848
;843:#ifdef USE_HAPTIC
;844:				if (clientNum == cg.predictedPlayerState.clientNum) {
;845:					trap_HapticEvent("pickup_weapon", 0, 0, 80, 0, 0);
;846:				}
;847:#endif
;848:			} else if (item->giType == IT_PERSISTANT_POWERUP) {
ADDRGP4 $539
JUMPV
LABELV $538
ADDRLP4 84
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 7
NEI4 $543
line 871
;849:#ifdef MISSIONPACK
;850:				switch (item->giTag ) {
;851:					case PW_SCOUT:
;852:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.scoutSound );
;853:					break;
;854:					case PW_GUARD:
;855:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.guardSound );
;856:					break;
;857:					case PW_DOUBLER:
;858:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.doublerSound );
;859:					break;
;860:					case PW_AMMOREGEN:
;861:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.ammoregenSound );
;862:					break;
;863:				}
;864:#endif
;865:
;866:#ifdef USE_HAPTIC
;867:				if (clientNum == cg.predictedPlayerState.clientNum) {
;868:					trap_HapticEvent("pickup_weapon", 0, 0, 50, 0, 0);
;869:				}
;870:#endif
;871:			} else {
ADDRGP4 $544
JUMPV
LABELV $543
line 872
;872:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	trap_S_RegisterSound( item->pickup_sound, qfalse ) );
ADDRLP4 84
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 96
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 878
;873:#ifdef USE_HAPTIC
;874:				if (clientNum == cg.predictedPlayerState.clientNum) {
;875:					trap_HapticEvent("RTCWQuest:pickup_item", 0, 0, 100, 0, 0);
;876:				}
;877:#endif
;878:			}
LABELV $544
LABELV $539
line 881
;879:
;880:			// show icon and name on status bar
;881:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $545
line 882
;882:				CG_ItemPickup( index );
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 883
;883:			}
LABELV $545
line 885
;884:
;885:			if ( ce ) {
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $401
line 886
;886:				ce->delaySpawnPlayed = qtrue;
ADDRLP4 28
INDIRP4
CNSTI4 948
ADDP4
CNSTI4 1
ASGNI4
line 887
;887:			}
line 888
;888:		}
line 889
;889:		break;
ADDRGP4 $401
JUMPV
LABELV $550
line 892
;890:
;891:	case EV_GLOBAL_ITEM_PICKUP:
;892:		{
line 896
;893:			gitem_t	*item;
;894:			int		index;
;895:
;896:			index = es->eventParm;		// player predicted
ADDRLP4 80
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 898
;897:
;898:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 88
ADDRLP4 80
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 1
LTI4 $553
ADDRLP4 88
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $551
LABELV $553
line 899
;899:				break;
ADDRGP4 $401
JUMPV
LABELV $551
line 902
;900:			}
;901:
;902:			if ( entityNum >= 0 ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
LTI4 $554
line 904
;903:				// our predicted entity
;904:				ce = cg_entities + entityNum;
ADDRLP4 28
ADDRFP4 8
INDIRI4
CNSTI4 1236
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 905
;905:				if ( ce->delaySpawn > cg.time && ce->delaySpawnPlayed ) {
ADDRLP4 92
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ADDRGP4 cg+234764
INDIRI4
LEI4 $555
ADDRLP4 92
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 0
EQI4 $555
line 906
;906:					break;
ADDRGP4 $401
JUMPV
line 908
;907:				}
;908:			} else {
LABELV $554
line 909
;909:				ce = NULL;
ADDRLP4 28
CNSTP4 0
ASGNP4
line 910
;910:			}
LABELV $555
line 912
;911:
;912:			item = &bg_itemlist[ index ];
ADDRLP4 84
ADDRLP4 80
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 914
;913:			// powerup pickups are global
;914:			if( item->pickup_sound ) {
ADDRLP4 84
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $559
line 915
;915:				trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, trap_S_RegisterSound( item->pickup_sound, qfalse ) );
ADDRLP4 84
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 92
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 92
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 916
;916:			}
LABELV $559
line 919
;917:
;918:			// show icon and name on status bar
;919:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $562
line 920
;920:				CG_ItemPickup( index );
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 921
;921:			}
LABELV $562
line 923
;922:
;923:			if ( ce ) {
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $401
line 924
;924:				ce->delaySpawnPlayed = qtrue;
ADDRLP4 28
INDIRP4
CNSTI4 948
ADDP4
CNSTI4 1
ASGNI4
line 925
;925:			}
line 926
;926:		}
line 927
;927:		break;
ADDRGP4 $401
JUMPV
LABELV $567
line 934
;928:
;929:	//
;930:	// weapon events
;931:	//
;932:	case EV_NOAMMO:
;933://		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.noAmmoSound );
;934:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $401
line 935
;935:			CG_OutOfAmmoChange();
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 936
;936:		}
line 937
;937:		break;
ADDRGP4 $401
JUMPV
LABELV $571
line 940
;938:
;939:	case EV_CHANGE_WEAPON:
;940:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.selectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+150560+584
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 942
;941:
;942:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+234796+140
INDIRI4
NEI4 $401
line 950
;943:#ifdef USE_NATIVE_HACK
;944:			vrinfo->realign = 3; // auto trigger weapon re-align in 4 frames
;945:			//int position = vrinfo->weapon_stabilised ? 4 : (vrinfo->right_handed ? 1 : 2);
;946:#endif
;947:#ifdef USE_HAPTIC
;948:			trap_HapticEvent("weapon_switch", 0, 0, 100, 0, 0);
;949:#endif
;950:		}
line 952
;951:
;952:		break;
ADDRGP4 $401
JUMPV
LABELV $578
line 955
;953:
;954:	case EV_FIRE_WEAPON:
;955:		CG_FireWeapon( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 956
;956:		break;
ADDRGP4 $401
JUMPV
LABELV $579
line 974
;957:
;958:	case EV_USE_ITEM0:
;959:	case EV_USE_ITEM1:
;960:	case EV_USE_ITEM2:
;961:	case EV_USE_ITEM3:
;962:	case EV_USE_ITEM4:
;963:	case EV_USE_ITEM5:
;964:	case EV_USE_ITEM6:
;965:	case EV_USE_ITEM7:
;966:	case EV_USE_ITEM8:
;967:	case EV_USE_ITEM9:
;968:	case EV_USE_ITEM10:
;969:	case EV_USE_ITEM11:
;970:	case EV_USE_ITEM12:
;971:	case EV_USE_ITEM13:
;972:	case EV_USE_ITEM14:
;973:	case EV_USE_ITEM15:
;974:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 975
;975:		break;
ADDRGP4 $401
JUMPV
LABELV $580
line 983
;976:
;977:	//=================================================================
;978:
;979:	//
;980:	// other events
;981:	//
;982:	case EV_PLAYER_TELEPORT_IN:
;983:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+150560+772
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 984
;984:		CG_SpawnEffect( position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 986
;985:
;986:		if (clientNum == cg.predictedPlayerState.clientNum) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+234796+140
INDIRI4
NEI4 $401
line 993
;987:#ifdef USE_NATIVE_HACK
;988:			vrinfo->realign = 3; // Initiate position reset for fake 6DoF
;989:#endif
;990:#ifdef USE_HAPTIC
;991:			trap_HapticEvent("spark", 0, 0, 80, 0, 0);
;992:#endif
;993:		}
line 994
;994:		break;
ADDRGP4 $401
JUMPV
LABELV $587
line 997
;995:
;996:	case EV_PLAYER_TELEPORT_OUT:
;997:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+150560+776
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 998
;998:		CG_SpawnEffect(  position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 999
;999:		break;
ADDRGP4 $401
JUMPV
LABELV $590
line 1002
;1000:
;1001:	case EV_ITEM_POP:
;1002:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+150560+784
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1003
;1003:		break;
ADDRGP4 $401
JUMPV
LABELV $593
line 1006
;1004:
;1005:	case EV_ITEM_RESPAWN:
;1006:		cent->miscTime = cg.time;	// scale up from this
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 1007
;1007:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+150560+784
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1008
;1008:		break;
ADDRGP4 $401
JUMPV
LABELV $597
line 1011
;1009:
;1010:	case EV_GRENADE_BOUNCE:
;1011:		if ( rand() & 1 ) {
ADDRLP4 80
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $598
line 1012
;1012:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb1aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+150560+1072
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1013
;1013:		} else {
ADDRGP4 $401
JUMPV
LABELV $598
line 1014
;1014:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb2aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+150560+1076
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1015
;1015:		}
line 1016
;1016:		break;
ADDRGP4 $401
JUMPV
LABELV $604
line 1059
;1017:
;1018:#ifdef MISSIONPACK
;1019:	case EV_PROXIMITY_MINE_STICK:
;1020:		if( es->eventParm & SURF_FLESH ) {
;1021:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimplSound );
;1022:		} else 	if( es->eventParm & SURF_METALSTEPS ) {
;1023:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpmSound );
;1024:		} else {
;1025:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpdSound );
;1026:		}
;1027:		break;
;1028:
;1029:	case EV_PROXIMITY_MINE_TRIGGER:
;1030:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbactvSound );
;1031:		break;
;1032:
;1033:	case EV_KAMIKAZE:
;1034:		CG_KamikazeEffect( cent->lerpOrigin );
;1035:		break;
;1036:
;1037:	case EV_OBELISKEXPLODE:
;1038:		CG_ObeliskExplode( cent->lerpOrigin, es->eventParm );
;1039:		break;
;1040:
;1041:	case EV_OBELISKPAIN:
;1042:		CG_ObeliskPain( cent->lerpOrigin );
;1043:		break;
;1044:
;1045:	case EV_INVUL_IMPACT:
;1046:		CG_InvulnerabilityImpact( cent->lerpOrigin, cent->currentState.angles );
;1047:		break;
;1048:
;1049:	case EV_JUICED:
;1050:		CG_InvulnerabilityJuiced( cent->lerpOrigin );
;1051:		break;
;1052:
;1053:	case EV_LIGHTNINGBOLT:
;1054:		CG_LightningBoltBeam(es->origin2, es->pos.trBase);
;1055:		break;
;1056:#endif
;1057:
;1058:	case EV_SCOREPLUM:
;1059:		CG_ScorePlum( cent->currentState.otherEntityNum, cent->lerpOrigin, cent->currentState.time );
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
INDIRP4
CNSTI4 1212
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ScorePlum
CALLV
pop
line 1060
;1060:		break;
ADDRGP4 $401
JUMPV
LABELV $605
line 1066
;1061:
;1062:	//
;1063:	// missile impacts
;1064:	//
;1065:	case EV_MISSILE_HIT:
;1066:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1067
;1067:		CG_MissileHitPlayer( es->weapon, position, dir, es->otherEntityNum );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitPlayer
CALLV
pop
line 1068
;1068:		break;
ADDRGP4 $401
JUMPV
LABELV $606
line 1071
;1069:
;1070:	case EV_MISSILE_MISS:
;1071:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1072
;1072:		CG_MissileHitWall( es->weapon, 0, position, dir, IMPACTSOUND_DEFAULT );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 1073
;1073:		break;
ADDRGP4 $401
JUMPV
LABELV $607
line 1076
;1074:
;1075:	case EV_MISSILE_MISS_METAL:
;1076:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1077
;1077:		CG_MissileHitWall( es->weapon, 0, position, dir, IMPACTSOUND_METAL );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 1078
;1078:		break;
ADDRGP4 $401
JUMPV
LABELV $608
line 1081
;1079:
;1080:	case EV_RAILTRAIL:
;1081:		cent->currentState.weapon = WP_RAILGUN;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 7
ASGNI4
line 1084
;1082:
;1083:#ifdef USE_VR
;1084:		if ( !cg.vr_controller_type ) 
ADDRGP4 cg+282972
INDIRI4
CNSTI4 0
NEI4 $609
line 1087
;1085:#endif
;1086:			//if ( cent->currentState.clientNum == cg.snap->ps.clientNum && !cg_thirdPerson.integer )
;1087:			if ( es->clientNum == cg.snap->ps.clientNum && !cg.renderingThirdPerson )
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $612
ADDRGP4 cg+234788
INDIRI4
CNSTI4 0
NEI4 $612
line 1088
;1088:			{
line 1089
;1089:				if ( cg.vr_controller_type >= 2 ) {
ADDRGP4 cg+282972
INDIRI4
CNSTI4 2
LTI4 $616
line 1094
;1090:					//==================
;1091:					//		6 Dof
;1092:					//==================
;1093:					vec3_t angles;
;1094:					CG_CalculateWeaponPosition_VR_6Dof( es->origin2, angles );
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 92
ARGP4
ADDRGP4 CG_CalculateWeaponPosition_VR_6Dof
CALLV
pop
line 1095
;1095:					VectorCopy(es->origin2, vec);
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 1096
;1096:				}
ADDRGP4 $613
JUMPV
LABELV $616
line 1097
;1097:				else if ( cg.vr_controller_type == 1 ) {
ADDRGP4 cg+282972
INDIRI4
CNSTI4 1
NEI4 $613
line 1101
;1098:					//==================
;1099:					//		3 Dof
;1100:					//==================
;1101:					float fovOffset = -0.2f * (cgs.fov - 90.0f);
ADDRLP4 92
ADDRGP4 cgs+151656
INDIRF4
CNSTF4 1119092736
SUBF4
CNSTF4 3192704205
MULF4
ASGNF4
line 1102
;1102:					VectorCopy(cg.refdef.vieworg, vec);
ADDRLP4 32
ADDRGP4 cg+236804+24
INDIRB
ASGNB 12
line 1105
;1103:
;1104:					// 13.5, -5.5, -6.0
;1105:					VectorMA(vec, cg_gun_x.value + 13.5f, cg.refdef.viewaxis[0], vec);
ADDRLP4 32
ADDRLP4 32
INDIRF4
ADDRGP4 cg+236804+36
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
CNSTF4 1096286208
ADDF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 32+4
INDIRF4
ADDRGP4 cg+236804+36+4
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
CNSTF4 1096286208
ADDF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32+8
ADDRLP4 32+8
INDIRF4
ADDRGP4 cg+236804+36+8
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
CNSTF4 1096286208
ADDF4
MULF4
ADDF4
ASGNF4
line 1106
;1106:					VectorMA(vec, cg_gun_y.value - 5.5f, cg.refdef.viewaxis[1], vec);
ADDRLP4 32
ADDRLP4 32
INDIRF4
ADDRGP4 cg+236804+36+12
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
CNSTF4 1085276160
SUBF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 32+4
INDIRF4
ADDRGP4 cg+236804+36+12+4
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
CNSTF4 1085276160
SUBF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32+8
ADDRLP4 32+8
INDIRF4
ADDRGP4 cg+236804+36+12+8
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
CNSTF4 1085276160
SUBF4
MULF4
ADDF4
ASGNF4
line 1107
;1107:					VectorMA(vec, cg_gun_z.value + fovOffset - 6.0f, cg.refdef.viewaxis[2], vec);
ADDRLP4 96
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 32
ADDRLP4 32
INDIRF4
ADDRGP4 cg+236804+36+24
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
ADDRLP4 96
INDIRF4
ADDF4
CNSTF4 1086324736
SUBF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 32+4
INDIRF4
ADDRGP4 cg+236804+36+24+4
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
ADDRLP4 96
INDIRF4
ADDF4
CNSTF4 1086324736
SUBF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32+8
ADDRLP4 32+8
INDIRF4
ADDRGP4 cg+236804+36+24+8
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
ADDRLP4 92
INDIRF4
ADDF4
CNSTF4 1086324736
SUBF4
MULF4
ADDF4
ASGNF4
line 1108
;1108:				}
line 1109
;1109:			}
ADDRGP4 $613
JUMPV
LABELV $612
line 1111
;1110:			else
;1111:				VectorCopy( es->origin2, vec );
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
LABELV $613
LABELV $609
line 1114
;1112:
;1113:		// if the end was on a nomark surface, don't make an explosion
;1114:		CG_RailTrail( ci, vec, es->pos.trBase );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 CG_RailTrail
CALLV
pop
line 1116
;1115:
;1116:		if ( es->eventParm != 255 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 255
EQI4 $401
line 1117
;1117:			ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1118
;1118:			CG_MissileHitWall( es->weapon, es->clientNum, position, dir, IMPACTSOUND_DEFAULT );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 1119
;1119:		}
line 1120
;1120:		break;
ADDRGP4 $401
JUMPV
LABELV $678
line 1123
;1121:
;1122:	case EV_BULLET_HIT_WALL:
;1123:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1124
;1124:		CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qfalse, ENTITYNUM_WORLD );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1022
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 1125
;1125:		break;
ADDRGP4 $401
JUMPV
LABELV $679
line 1128
;1126:
;1127:	case EV_BULLET_HIT_FLESH:
;1128:		CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qtrue, es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 1129
;1129:		break;
ADDRGP4 $401
JUMPV
LABELV $680
line 1132
;1130:
;1131:	case EV_SHOTGUN:
;1132:		CG_ShotgunFire( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ShotgunFire
CALLV
pop
line 1133
;1133:		break;
ADDRGP4 $401
JUMPV
LABELV $681
line 1136
;1134:
;1135:	case EV_GENERAL_SOUND:
;1136:		if ( cgs.gameSounds[ es->eventParm ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35888
ADDP4
INDIRI4
CNSTI4 0
EQI4 $682
line 1137
;1137:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35888
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1138
;1138:		} else {
ADDRGP4 $401
JUMPV
LABELV $682
line 1139
;1139:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 100
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 44
ADDRLP4 100
INDIRP4
ASGNP4
line 1140
;1140:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1141
;1141:		}
line 1142
;1142:		break;
ADDRGP4 $401
JUMPV
LABELV $686
line 1145
;1143:
;1144:	case EV_GLOBAL_SOUND:	// play from the player's head so it never diminishes
;1145:		if ( cgs.gameSounds[ es->eventParm ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35888
ADDP4
INDIRI4
CNSTI4 0
EQI4 $687
line 1146
;1146:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35888
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1147
;1147:		} else {
ADDRGP4 $401
JUMPV
LABELV $687
line 1148
;1148:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 100
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 44
ADDRLP4 100
INDIRP4
ASGNP4
line 1149
;1149:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1150
;1150:		}
line 1151
;1151:		break;
ADDRGP4 $401
JUMPV
LABELV $693
line 1154
;1152:
;1153:	case EV_GLOBAL_TEAM_SOUND:	// play from the player's head so it never diminishes
;1154:		{
line 1155
;1155:			switch( es->eventParm ) {
ADDRLP4 100
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
LTI4 $401
ADDRLP4 100
INDIRI4
CNSTI4 12
GTI4 $401
ADDRLP4 100
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $780
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $780
address $697
address $705
address $713
address $723
address $733
address $749
address $401
address $401
address $765
address $768
address $771
address $774
address $777
code
LABELV $697
line 1157
;1156:				case GTS_RED_CAPTURE: // CTF: red team captured the blue flag, 1FCTF: red team captured the neutral flag
;1157:					if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $698
line 1158
;1158:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+150560+928
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $401
JUMPV
LABELV $698
line 1160
;1159:					else
;1160:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+150560+932
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1161
;1161:					break;
ADDRGP4 $401
JUMPV
LABELV $705
line 1163
;1162:				case GTS_BLUE_CAPTURE: // CTF: blue team captured the red flag, 1FCTF: blue team captured the neutral flag
;1163:					if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $706
line 1164
;1164:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+150560+928
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $401
JUMPV
LABELV $706
line 1166
;1165:					else
;1166:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+150560+932
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1167
;1167:					break;
ADDRGP4 $401
JUMPV
LABELV $713
line 1169
;1168:				case GTS_RED_RETURN: // CTF: blue flag returned, 1FCTF: never used
;1169:					if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $714
line 1170
;1170:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+150560+936
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $715
JUMPV
LABELV $714
line 1172
;1171:					else
;1172:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+150560+940
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $715
line 1174
;1173:					//
;1174:					CG_AddBufferedSound( cgs.media.blueFlagReturnedSound );
ADDRGP4 cgs+150560+956
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1175
;1175:					break;
ADDRGP4 $401
JUMPV
LABELV $723
line 1177
;1176:				case GTS_BLUE_RETURN: // CTF red flag returned, 1FCTF: neutral flag returned
;1177:					if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $724
line 1178
;1178:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+150560+936
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $725
JUMPV
LABELV $724
line 1180
;1179:					else
;1180:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+150560+940
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $725
line 1182
;1181:					//
;1182:					CG_AddBufferedSound( cgs.media.redFlagReturnedSound );
ADDRGP4 cgs+150560+952
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1183
;1183:					break;
ADDRGP4 $401
JUMPV
LABELV $733
line 1187
;1184:
;1185:				case GTS_RED_TAKEN: // CTF: red team took blue flag, 1FCTF: blue team took the neutral flag
;1186:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1187:					if (cg.snap->ps.powerups[PW_BLUEFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
NEI4 $738
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
CNSTI4 0
EQI4 $734
LABELV $738
line 1188
;1188:					}
ADDRGP4 $401
JUMPV
LABELV $734
line 1189
;1189:					else {
line 1190
;1190:						if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $739
line 1196
;1191:#ifdef MISSIONPACK
;1192:							if (cgs.gametype == GT_1FCTF) 
;1193:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1194:							else
;1195:#endif
;1196:							CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+150560+960
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1197
;1197:						}
ADDRGP4 $401
JUMPV
LABELV $739
line 1198
;1198:						else if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $401
line 1204
;1199:#ifdef MISSIONPACK
;1200:							if (cgs.gametype == GT_1FCTF)
;1201:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1202:							else
;1203:#endif
;1204: 							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+150560+968
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1205
;1205:						}
line 1206
;1206:					}
line 1207
;1207:					break;
ADDRGP4 $401
JUMPV
LABELV $749
line 1210
;1208:				case GTS_BLUE_TAKEN: // CTF: blue team took the red flag, 1FCTF red team took the neutral flag
;1209:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1210:					if (cg.snap->ps.powerups[PW_REDFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
NEI4 $754
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
CNSTI4 0
EQI4 $750
LABELV $754
line 1211
;1211:					}
ADDRGP4 $401
JUMPV
LABELV $750
line 1212
;1212:					else {
line 1213
;1213:						if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $755
line 1219
;1214:#ifdef MISSIONPACK
;1215:							if (cgs.gametype == GT_1FCTF)
;1216:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1217:							else
;1218:#endif
;1219:							CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+150560+960
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1220
;1220:						}
ADDRGP4 $401
JUMPV
LABELV $755
line 1221
;1221:						else if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $401
line 1227
;1222:#ifdef MISSIONPACK
;1223:							if (cgs.gametype == GT_1FCTF)
;1224:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1225:							else
;1226:#endif
;1227:							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+150560+968
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1228
;1228:						}
line 1229
;1229:					}
line 1230
;1230:					break;
ADDRGP4 $401
JUMPV
LABELV $765
line 1245
;1231:#ifdef MISSIONPACK
;1232:				case GTS_REDOBELISK_ATTACKED: // Overload: red obelisk is being attacked
;1233:					if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED) {
;1234:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
;1235:					}
;1236:					break;
;1237:				case GTS_BLUEOBELISK_ATTACKED: // Overload: blue obelisk is being attacked
;1238:					if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE) {
;1239:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
;1240:					}
;1241:					break;
;1242:#endif
;1243:
;1244:				case GTS_REDTEAM_SCORED:
;1245:					CG_AddBufferedSound(cgs.media.redScoredSound);
ADDRGP4 cgs+150560+908
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1246
;1246:					break;
ADDRGP4 $401
JUMPV
LABELV $768
line 1248
;1247:				case GTS_BLUETEAM_SCORED:
;1248:					CG_AddBufferedSound(cgs.media.blueScoredSound);
ADDRGP4 cgs+150560+912
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1249
;1249:					break;
ADDRGP4 $401
JUMPV
LABELV $771
line 1251
;1250:				case GTS_REDTEAM_TOOK_LEAD:
;1251:					CG_AddBufferedSound(cgs.media.redLeadsSound);
ADDRGP4 cgs+150560+916
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1252
;1252:					break;
ADDRGP4 $401
JUMPV
LABELV $774
line 1254
;1253:				case GTS_BLUETEAM_TOOK_LEAD:
;1254:					CG_AddBufferedSound(cgs.media.blueLeadsSound);
ADDRGP4 cgs+150560+920
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1255
;1255:					break;
ADDRGP4 $401
JUMPV
LABELV $777
line 1257
;1256:				case GTS_TEAMS_ARE_TIED:
;1257:					CG_AddBufferedSound( cgs.media.teamsTiedSound );
ADDRGP4 cgs+150560+924
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1258
;1258:					break;
line 1265
;1259:#ifdef MISSIONPACK
;1260:				case GTS_KAMIKAZE:
;1261:					trap_S_StartLocalSound(cgs.media.kamikazeFarSound, CHAN_ANNOUNCER);
;1262:					break;
;1263:#endif
;1264:				default:
;1265:					break;
line 1267
;1266:			}
;1267:			break;
ADDRGP4 $401
JUMPV
LABELV $781
line 1273
;1268:		}
;1269:
;1270:	case EV_PAIN:
;1271:		// local player sounds are triggered in CG_CheckLocalSounds,
;1272:		// so ignore events on the player
;1273:		if ( cent->currentState.number != cg.snap->ps.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $401
line 1274
;1274:			CG_PainEvent( cent, es->eventParm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainEvent
CALLV
pop
line 1275
;1275:		}
line 1276
;1276:		break;
ADDRGP4 $401
JUMPV
LABELV $785
line 1281
;1277:
;1278:	case EV_DEATH1:
;1279:	case EV_DEATH2:
;1280:	case EV_DEATH3:
;1281:		if ( CG_WaterLevel(cent) == 3 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 CG_WaterLevel
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 3
NEI4 $786
line 1282
;1282:			trap_S_StartSound( NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, "*drown.wav") );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $788
ARGP4
ADDRLP4 104
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1283
;1283:		} else {
ADDRGP4 $401
JUMPV
LABELV $786
line 1284
;1284:			trap_S_StartSound( NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, va("*death%i.wav", event - EV_DEATH1 + 1)) );
ADDRGP4 $789
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 58
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 108
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1285
;1285:		}
line 1291
;1286:#ifdef USE_HAPTIC
;1287:		if (es->clientNum == cg.snap->ps.clientNum) {
;1288:			trap_HapticEvent("fireball", 0, 0, 100, 0, 0);
;1289:		}
;1290:#endif
;1291:		break;
ADDRGP4 $401
JUMPV
LABELV $790
line 1294
;1292:
;1293:	case EV_OBITUARY:
;1294:		CG_Obituary( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 1295
;1295:		break;
ADDRGP4 $401
JUMPV
LABELV $791
line 1301
;1296:
;1297:	//
;1298:	// powerup events
;1299:	//
;1300:	case EV_POWERUP_QUAD:
;1301:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $792
line 1302
;1302:			cg.powerupActive = PW_QUAD;
ADDRGP4 cg+245320
CNSTI4 1
ASGNI4
line 1303
;1303:			cg.powerupTime = cg.time;
ADDRGP4 cg+245324
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 1304
;1304:		}
LABELV $792
line 1305
;1305:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.quadSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+150560+576
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1311
;1306:#ifdef USE_HAPTIC
;1307:		if (clientNum == cg.predictedPlayerState.clientNum) {
;1308:			trap_HapticEvent("decontaminate", 0, 0, 100, 0, 0);
;1309:		}
;1310:#endif
;1311:		break;
ADDRGP4 $401
JUMPV
LABELV $800
line 1315
;1312:
;1313:	case EV_POWERUP_BATTLESUIT:
;1314:		//if ( es->number == cg.snap->ps.clientNum ) {//q3e
;1315:		if ( es->number == cg.predictedPlayerState.clientNum ) {//ioq3quest
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+234796+140
INDIRI4
NEI4 $801
line 1316
;1316:			cg.powerupActive = PW_BATTLESUIT;
ADDRGP4 cg+245320
CNSTI4 2
ASGNI4
line 1317
;1317:			cg.powerupTime = cg.time;
ADDRGP4 cg+245324
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 1318
;1318:		}
LABELV $801
line 1319
;1319:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.protectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+150560+1064
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1325
;1320:#ifdef USE_HAPTIC
;1321:		if (clientNum == cg.predictedPlayerState.clientNum) {
;1322:			trap_HapticEvent("decontaminate", 0, 0, 100, 0, 0);
;1323:		}
;1324:#endif
;1325:		break;
ADDRGP4 $401
JUMPV
LABELV $810
line 1329
;1326:
;1327:	case EV_POWERUP_REGEN:
;1328:		//if ( es->number == cg.snap->ps.clientNum ) { //q3e
;1329:		if ( es->number == cg.predictedPlayerState.clientNum ) {//ioq3quest
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+234796+140
INDIRI4
NEI4 $811
line 1330
;1330:			cg.powerupActive = PW_REGEN;
ADDRGP4 cg+245320
CNSTI4 5
ASGNI4
line 1331
;1331:			cg.powerupTime = cg.time;
ADDRGP4 cg+245324
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 1332
;1332:		}
LABELV $811
line 1333
;1333:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.regenSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+150560+1060
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1339
;1334:#ifdef USE_HAPTIC
;1335:		if (clientNum == cg.predictedPlayerState.clientNum) {
;1336:			trap_HapticEvent("decontaminate", 0, 0, 100, 0, 0);
;1337:		}
;1338:#endif
;1339:		break;
ADDRGP4 $401
JUMPV
LABELV $820
line 1350
;1340:
;1341:	case EV_GIB_PLAYER:
;1342:		// don't play gib sound when using the kamikaze because it interferes
;1343:		// with the kamikaze sound, downside is that the gib sound will also
;1344:		// not be played when someone is gibbed while just carrying the kamikaze
;1345:#ifdef MISSIONPACK
;1346:		if ( !(es->eFlags & EF_KAMIKAZE) ) {
;1347:			trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
;1348:		}
;1349:#else
;1350:		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+150560+756
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1352
;1351:#endif
;1352:		CG_GibPlayer( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
ARGP4
ADDRGP4 CG_GibPlayer
CALLV
pop
line 1358
;1353:#ifdef USE_HAPTIC
;1354:		if (clientNum == cg.snap->ps.clientNum) {
;1355:			trap_HapticEvent("shield_break", 0, 0, 100, 0, 0);
;1356:		}
;1357:#endif
;1358:		break;
ADDRGP4 $401
JUMPV
LABELV $823
line 1361
;1359:
;1360:	case EV_STOPLOOPINGSOUND:
;1361:		trap_S_StopLoopingSound( es->number );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 1362
;1362:		es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 1363
;1363:		break;
ADDRGP4 $401
JUMPV
LABELV $824
line 1366
;1364:
;1365:	case EV_DEBUG_LINE:
;1366:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1367
;1367:		break;
ADDRGP4 $401
JUMPV
line 1371
;1368:
;1369:	case EV_PROXIMITY_MINE_STICK:
;1370:	case EV_PROXIMITY_MINE_TRIGGER:
;1371:		break;
LABELV $400
line 1374
;1372:
;1373:	default:
;1374:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $390
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1375
;1375:		break;
LABELV $401
line 1377
;1376:	}
;1377:}
LABELV $387
endproc CG_EntityEvent 112 48
export CG_CheckEvents
proc CG_CheckEvents 8 12
line 1386
;1378:
;1379:
;1380:/*
;1381:==============
;1382:CG_CheckEvents
;1383:
;1384:==============
;1385:*/
;1386:void CG_CheckEvents( centity_t *cent ) {
line 1388
;1387:	// check for event-only entities
;1388:	if ( cent->currentState.eType > ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
LEI4 $829
line 1389
;1389:		if ( cent->previousEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
INDIRI4
CNSTI4 0
EQI4 $831
line 1390
;1390:			return;	// already fired
ADDRGP4 $828
JUMPV
LABELV $831
line 1393
;1391:		}
;1392:		// if this is a player event set the entity number of the client entity number
;1393:		if ( cent->currentState.eFlags & EF_PLAYER_EVENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $833
line 1394
;1394:			cent->currentState.number = cent->currentState.otherEntityNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 1395
;1395:		}
LABELV $833
line 1397
;1396:
;1397:		cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
CNSTI4 1
ASGNI4
line 1399
;1398:
;1399:		cent->currentState.event = cent->currentState.eType - ET_EVENTS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
SUBI4
ASGNI4
line 1400
;1400:	} else {
ADDRGP4 $830
JUMPV
LABELV $829
line 1402
;1401:		// check for events riding with another entity
;1402:		if ( cent->currentState.event == cent->previousEvent ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 924
ADDP4
INDIRI4
NEI4 $835
line 1403
;1403:			return;
ADDRGP4 $828
JUMPV
LABELV $835
line 1405
;1404:		}
;1405:		cent->previousEvent = cent->currentState.event;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 924
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 1406
;1406:		if ( ( cent->currentState.event & ~EV_EVENT_BITS ) == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $837
line 1407
;1407:			return;
ADDRGP4 $828
JUMPV
LABELV $837
line 1409
;1408:		}
;1409:	}
LABELV $830
line 1412
;1410:
;1411:	// calculate the position at exactly the frame time
;1412:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1212
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1413
;1413:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 1415
;1414:
;1415:	CG_EntityEvent( cent, cent->lerpOrigin, -1 );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1212
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 1416
;1416:}
LABELV $828
endproc CG_CheckEvents 8 12
import CG_IsDeathCam
import CG_IsThirdPersonFollowMode_Query
import CG_IsFollowMode
import CG_ConvertFromVR
import CG_CalculateVRPositionInWorld
import CG_CalculateWeaponPosition_VR_3Dof
import CG_CalculateWeaponPosition_VR_6Dof
import math_length
import Matrix4x4_ConvertToEntity
import Matrix4x4_Concat
import Matrix4x4_CreateFromEntity
import VR_get_ps_controller_type
import VR_get_cent_controller_type
import VR_get_cent_controller_angles
import VR_get_ps_controller_angles
import VR_get_cent_vrFlags
import VR_get_ps_vrFlags
import VR_get_client_vrFlags
import VR_get_client_controller_offset
import VR_get_client_controller_position
import VR_get_client_HMD_angles
import VR_get_client_HMD_position
import VR_get_client_controller_type
import trap_R_AddLinearLightToScene
import trap_R_AddRefEntityToScene2
import linearLight
import intShaderTime
import CG_NewParticleArea
import initparticles
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_VR_KeepLeftAngles
import trap_VR_keepLeftMuzzlePos
import trap_VR_KeepSpawnAngles
import trap_VR_KeepRightAngles
import trap_VR_keepRightMuzzlePos
import CG_ChangeFrameResolution
import trap_R_RenderHUD
import trap_R_inPVS
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddAdditiveLightToScene
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedCapsuleTrace
import trap_CM_TransformedBoxTrace
import trap_CM_CapsuleTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_RemoveCommand
import trap_AddCommand
import trap_RealTime
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_VR_Keyboard
import CG_VR_Menu
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_LoadVoiceChats
import CG_ShaderStateChanged
import CG_SetConfigValues
import CG_ParseSysteminfo
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_ScoreboardClick
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_ProcessSnapshots
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayer
import CG_ScorePlum
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect_V
import CG_DrawWeaponSelect_H
import CG_DrawCrosshair3D
import CG_GetPlayerWeaponAxis
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_LaserNeeded
import CG_LaserSight
import CG_CalculateWeaponPosition
import CG_DrawWeaponSelector
import CG_WeaponSelectorSelect_f
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PlayDroppedEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_GetModelHeight
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_TrackClientTeamChange
import CG_ForceModelChange
import CG_ShowResponseHead
import CG_CheckOrderPending
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Draw3DModel
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_SelectFont
import CG_LoadFonts
import CG_DrawString
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColorTime
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawStringExt
import CG_DrawGradientPic
import CG_DrawPic
import CG_FillScreen
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_SetScoreCatcher
import CG_BuildSpectatorString
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import laserBeam
import vr_controller_type
import menu_distance
import VR_angle_hide_torso
import VR_hide_torso
import showVirtualKeyboard
import eventnames
import cg_followKiller
import cg_fovAdjust
import cg_deadBodyDarken
import cg_teamColors
import cg_teamModel
import cg_enemyColors
import cg_enemyModel
import cg_hitSounds
import cg_currentSelectedPlayer
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import cg_smoothClients
import cg_allowDeathCam
import cg_itemTimer
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_drawSpeed
import cg_drawAttacker
import cg_drawPing
import cg_lagometer
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_railTrailRadius
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_drawWeaponSelect
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
import cg_weaponSelectorSimple2DIcons
import cg_debugWeaponAiming
import cg_fragMessage
import cg_playerShadow
import cg_weaponbob
import client_weapon
import CG_DrawAttacker_icon
import CG_DrawSelectedPlayerStatus
import HUD_color
import HUD_ItemCaptionValue
import CG_DrawTeamPlayerPowerup
import CG_Draw_Icon_Ammo
import CG_Draw_Icon_Armor
import CG_DrawStatusBarHead
import playerTeam
import getPlayerHealth
import getPlayerLocation
import getTeamPlayerName
import HUD_Update_finalRect
import HUD_DrawGradientBackground
import HUD_DrawBackground
import copyColor
import HUD_Draw_Text
import HUD_GradientValue
import FPS
import TeamOverlay_Sel_idx
import ServerMsg_idx
import ItemMsg_idx
import Attacker_idx
import KillMsg_idx
import WarmFightMsg_idx
import IcoPowerUp_idx
import WeapListSelName_idx
import IcoWeapListSel_idx
import IcoWeapList_idx
import HUD_Update_Valign
import HUD_Update_Margin
import HUD_Update_Anchors
import CG_HUDItemVisible
import CG_HUDShader
import item_Keywords
import dyn_itemCount
import dyn_itemArray
import itemCount
import itemArray
import CG_CheckHUD
import String_Init
import String_Alloc
import teams_colors
import ammo_colors
import armor_colors
import health_colors
import VRMOD_IN_Button
import VRMOD_togglePlayerLaserBeam
import VRMOD_IN_Grab
import VRMOD_IN_Triggers
import VRMOD_IN_Joystick
import VRMOD_CL_MouseEvent
import VRMOD_CL_VRInit
import VRMOD_CL_KeepLeftAngles
import VRMOD_CL_KeepRightAngles
import VRMOD_CL_KeepRightPos
import VRMOD_CL_Finish_VR_Move
import VRMOD_CL_handle_controllers
import VRMOD_CL_Get_HMD_Position
import VRMOD_CL_Get_HMD_Angles
import VRMOD_CL_GestureCrouchCheck
import positional_movementForward
import positional_movementSideways
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
LABELV $789
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $788
byte 1 42
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $528
byte 1 42
byte 1 103
byte 1 97
byte 1 115
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $517
byte 1 111
byte 1 110
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $515
byte 1 111
byte 1 110
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $513
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 116
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $511
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $509
byte 1 110
byte 1 111
byte 1 0
align 1
LABELV $507
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $505
byte 1 42
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $499
byte 1 42
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $457
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $394
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $390
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $385
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 117
byte 1 114
byte 1 112
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $384
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 117
byte 1 114
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $379
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 48
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $378
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 55
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $375
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 53
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $372
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $308
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $303
byte 1 78
byte 1 111
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $293
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 100
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $281
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $276
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $275
byte 1 39
byte 1 115
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $274
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $272
byte 1 39
byte 1 115
byte 1 32
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $271
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $269
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 114
byte 1 111
byte 1 99
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $267
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $264
byte 1 39
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $263
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $261
byte 1 97
byte 1 108
byte 1 109
byte 1 111
byte 1 115
byte 1 116
byte 1 32
byte 1 100
byte 1 111
byte 1 100
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $259
byte 1 39
byte 1 115
byte 1 32
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $257
byte 1 39
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 114
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $256
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 114
byte 1 101
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $254
byte 1 39
byte 1 115
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $253
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $251
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $249
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $247
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 112
byte 1 117
byte 1 109
byte 1 109
byte 1 101
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $245
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 117
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $224
byte 1 110
byte 1 111
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $217
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $214
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 37
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $196
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $192
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $191
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $188
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $185
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $183
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $182
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $179
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $175
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $174
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $171
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $167
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $166
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $163
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $153
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 119
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $151
byte 1 115
byte 1 97
byte 1 119
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $149
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 102
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 0
align 1
LABELV $147
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $145
byte 1 115
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 108
byte 1 105
byte 1 107
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $143
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 113
byte 1 117
byte 1 105
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $141
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $139
byte 1 115
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $134
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $133
byte 1 110
byte 1 0
align 1
LABELV $126
byte 1 67
byte 1 71
byte 1 95
byte 1 79
byte 1 98
byte 1 105
byte 1 116
byte 1 117
byte 1 97
byte 1 114
byte 1 121
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $121
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $120
byte 1 37
byte 1 105
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $119
byte 1 37
byte 1 105
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $116
byte 1 37
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $113
byte 1 37
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $110
byte 1 49
byte 1 51
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $107
byte 1 49
byte 1 50
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $104
byte 1 49
byte 1 49
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $101
byte 1 94
byte 1 51
byte 1 51
byte 1 114
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $98
byte 1 94
byte 1 49
byte 1 50
byte 1 110
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $95
byte 1 94
byte 1 52
byte 1 49
byte 1 115
byte 1 116
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $92
byte 1 0
align 1
LABELV $91
byte 1 84
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 0
