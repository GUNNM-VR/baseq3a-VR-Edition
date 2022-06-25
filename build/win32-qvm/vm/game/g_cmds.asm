export DeathmatchScoreboardMessage
code
proc DeathmatchScoreboardMessage 1344 64
file "..\..\..\..\code\game\g_cmds.c"
line 19
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:#ifdef MISSIONPACK
;6:#include "../../ui/menudef.h"			// for the voice chats
;7:#endif
;8:
;9:#ifdef USE_NEOHUD
;10:#include "../ui/menudef.h"			// for the voice chats
;11:#endif
;12:
;13:/*
;14:==================
;15:DeathmatchScoreboardMessage
;16:
;17:==================
;18:*/
;19:void DeathmatchScoreboardMessage( gentity_t *ent ) {
line 28
;20:	char		entry[256]; // enough to hold 14 integers
;21:	char		string[MAX_STRING_CHARS-1];
;22:	int			stringlength;
;23:	int			i, j, ping, prefix;
;24:	gclient_t	*cl;
;25:	int			numSorted, scoreFlags, accuracy, perfect;
;26:
;27:	// send the latest information on all clients
;28:	string[0] = '\0';
ADDRLP4 16
CNSTI1 0
ASGNI1
line 29
;29:	stringlength = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 30
;30:	scoreFlags = 0;
ADDRLP4 1316
CNSTI4 0
ASGNI4
line 32
;31:
;32:	numSorted = level.numConnectedClients;
ADDRLP4 1308
ADDRGP4 level+76
INDIRI4
ASGNI4
line 35
;33:
;34:	// estimate prefix length to avoid oversize of final string
;35:	prefix = BG_sprintf( entry, "scores %i %i %i", level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE], numSorted );
ADDRLP4 1039
ARGP4
ADDRGP4 $56
ARGP4
ADDRGP4 level+48+4
INDIRI4
ARGI4
ADDRGP4 level+48+8
INDIRI4
ARGI4
ADDRLP4 1308
INDIRI4
ARGI4
ADDRLP4 1320
ADDRGP4 BG_sprintf
CALLI4
ASGNI4
ADDRLP4 1312
ADDRLP4 1320
INDIRI4
ASGNI4
line 37
;36:	
;37:	for ( i = 0; i < numSorted; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $64
JUMPV
LABELV $61
line 39
;38:
;39:		cl = &level.clients[level.sortedClients[i]];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 41
;40:
;41:		if ( cl->pers.connected == CON_CONNECTING ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $66
line 42
;42:			ping = -1;
ADDRLP4 1296
CNSTI4 -1
ASGNI4
line 43
;43:		} else {
ADDRGP4 $67
JUMPV
LABELV $66
line 44
;44:			ping = cl->ps.ping < 999 ? cl->ps.ping : 999;
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CNSTI4 999
GEI4 $69
ADDRLP4 1324
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $70
JUMPV
LABELV $69
ADDRLP4 1324
CNSTI4 999
ASGNI4
LABELV $70
ADDRLP4 1296
ADDRLP4 1324
INDIRI4
ASGNI4
line 45
;45:		}
LABELV $67
line 47
;46:
;47:		if( cl->accuracy_shots ) {
ADDRLP4 0
INDIRP4
CNSTI4 888
ADDP4
INDIRI4
CNSTI4 0
EQI4 $71
line 48
;48:			accuracy = cl->accuracy_hits * 100 / cl->accuracy_shots;
ADDRLP4 1300
ADDRLP4 0
INDIRP4
CNSTI4 892
ADDP4
INDIRI4
CNSTI4 100
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 888
ADDP4
INDIRI4
DIVI4
ASGNI4
line 49
;49:		} else {
ADDRGP4 $72
JUMPV
LABELV $71
line 50
;50:			accuracy = 0;
ADDRLP4 1300
CNSTI4 0
ASGNI4
line 51
;51:		}
LABELV $72
line 53
;52:
;53:		perfect = ( cl->ps.persistant[PERS_RANK] == 0 && cl->ps.persistant[PERS_KILLED] == 0 ) ? 1 : 0;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
NEI4 $74
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 0
NEI4 $74
ADDRLP4 1324
CNSTI4 1
ASGNI4
ADDRGP4 $75
JUMPV
LABELV $74
ADDRLP4 1324
CNSTI4 0
ASGNI4
LABELV $75
ADDRLP4 1304
ADDRLP4 1324
INDIRI4
ASGNI4
line 55
;54:
;55:		j = BG_sprintf( entry, " %i %i %i %i %i %i %i %i %i %i %i %i %i %i",
ADDRLP4 1039
ARGP4
ADDRGP4 $76
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 1296
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
SUBI4
CNSTI4 60000
DIVI4
ARGI4
ADDRLP4 1316
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities+188
ADDP4
INDIRI4
ARGI4
ADDRLP4 1300
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 1304
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRLP4 1340
ADDRGP4 BG_sprintf
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 1340
INDIRI4
ASGNI4
line 71
;56:			level.sortedClients[i],
;57:			cl->ps.persistant[PERS_SCORE],
;58:			ping,
;59:			(level.time - cl->pers.enterTime)/60000,
;60:			scoreFlags,
;61:			g_entities[level.sortedClients[i]].s.powerups,
;62:			accuracy, 
;63:			cl->ps.persistant[PERS_IMPRESSIVE_COUNT],
;64:			cl->ps.persistant[PERS_EXCELLENT_COUNT],
;65:			cl->ps.persistant[PERS_GAUNTLET_FRAG_COUNT], 
;66:			cl->ps.persistant[PERS_DEFEND_COUNT], 
;67:			cl->ps.persistant[PERS_ASSIST_COUNT], 
;68:			perfect,
;69:			cl->ps.persistant[PERS_CAPTURES]);
;70:
;71:		if ( stringlength + j + prefix >= sizeof( string ) )
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ADDRLP4 1312
INDIRI4
ADDI4
CVIU4 4
CNSTU4 1023
LTU4 $81
line 72
;72:			break;
ADDRGP4 $63
JUMPV
LABELV $81
line 74
;73:
;74:		strcpy( string + stringlength, entry );
ADDRLP4 8
INDIRI4
ADDRLP4 16
ADDP4
ARGP4
ADDRLP4 1039
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 75
;75:		stringlength += j;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 76
;76:	}
LABELV $62
line 37
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $64
ADDRLP4 4
INDIRI4
ADDRLP4 1308
INDIRI4
LTI4 $61
LABELV $63
line 78
;77:
;78:	trap_SendServerCommand( ent-g_entities, va( "scores %i %i %i%s", i,
ADDRGP4 $83
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 level+48+4
INDIRI4
ARGI4
ADDRGP4 level+48+8
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 1324
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1324
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 81
;79:		level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE],
;80:		string ) );
;81:}
LABELV $54
endproc DeathmatchScoreboardMessage 1344 64
export Cmd_Score_f
proc Cmd_Score_f 0 4
line 91
;82:
;83:
;84:/*
;85:==================
;86:Cmd_Score_f
;87:
;88:Request current scoreboard information
;89:==================
;90:*/
;91:void Cmd_Score_f( gentity_t *ent ) {
line 92
;92:	DeathmatchScoreboardMessage( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DeathmatchScoreboardMessage
CALLV
pop
line 93
;93:}
LABELV $88
endproc Cmd_Score_f 0 4
export CheatsOk
proc CheatsOk 0 8
line 101
;94:
;95:
;96:/*
;97:==================
;98:CheatsOk
;99:==================
;100:*/
;101:qboolean	CheatsOk( gentity_t *ent ) {
line 102
;102:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $90
line 103
;103:		trap_SendServerCommand( ent-g_entities, "print \"Cheats are not enabled on this server.\n\"");
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
ADDRGP4 $93
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 104
;104:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $89
JUMPV
LABELV $90
line 106
;105:	}
;106:	if ( ent->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $94
line 107
;107:		trap_SendServerCommand( ent-g_entities, "print \"You must be alive to use this command.\n\"");
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
ADDRGP4 $96
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 108
;108:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $89
JUMPV
LABELV $94
line 110
;109:	}
;110:	return qtrue;
CNSTI4 1
RETI4
LABELV $89
endproc CheatsOk 0 8
bss
align 1
LABELV $98
skip 1024
export ConcatArgs
code
proc ConcatArgs 1048 12
line 119
;111:}
;112:
;113:
;114:/*
;115:==================
;116:ConcatArgs
;117:==================
;118:*/
;119:char *ConcatArgs( int start ) {
line 125
;120:	static char line[MAX_STRING_CHARS];
;121:	char	arg[MAX_STRING_CHARS];
;122:	int		i, c, tlen;
;123:	int		len;
;124:
;125:	len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 126
;126:	c = trap_Argc();
ADDRLP4 1040
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1040
INDIRI4
ASGNI4
line 127
;127:	for ( i = start ; i < c ; i++ ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 $102
JUMPV
LABELV $99
line 128
;128:		trap_Argv( i, arg, sizeof( arg ) );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 129
;129:		tlen = (int)strlen( arg );
ADDRLP4 8
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1044
INDIRI4
ASGNI4
line 130
;130:		if ( len + tlen >= sizeof( line )-1 ) {
ADDRLP4 0
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
CVIU4 4
CNSTU4 1023
LTU4 $103
line 131
;131:			break;
ADDRGP4 $101
JUMPV
LABELV $103
line 133
;132:		}
;133:		memcpy( line + len, arg, tlen );
ADDRLP4 0
INDIRI4
ADDRGP4 $98
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 134
;134:		len += tlen;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
ASGNI4
line 135
;135:		if ( i != c - 1 ) {
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
CNSTI4 1
SUBI4
EQI4 $105
line 136
;136:			line[len] = ' ';
ADDRLP4 0
INDIRI4
ADDRGP4 $98
ADDP4
CNSTI1 32
ASGNI1
line 137
;137:			len++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 138
;138:		}
LABELV $105
line 139
;139:	}
LABELV $100
line 127
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $102
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $99
LABELV $101
line 141
;140:
;141:	line[len] = '\0';
ADDRLP4 0
INDIRI4
ADDRGP4 $98
ADDP4
CNSTI1 0
ASGNI1
line 143
;142:
;143:	return line;
ADDRGP4 $98
RETP4
LABELV $97
endproc ConcatArgs 1048 12
export SanitizeString
proc SanitizeString 4 4
line 154
;144:}
;145:
;146:
;147:/*
;148:==================
;149:SanitizeString
;150:
;151:Remove case and control characters
;152:==================
;153:*/
;154:void SanitizeString( const char *in, char *out ) {
ADDRGP4 $109
JUMPV
LABELV $108
line 155
;155:	while ( *in ) {
line 156
;156:		if ( *in == 27 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 27
NEI4 $111
line 157
;157:			in += 2;		// skip color code
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 158
;158:			continue;
ADDRGP4 $109
JUMPV
LABELV $111
line 160
;159:		}
;160:		if ( *in < ' ' ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
GEI4 $113
line 161
;161:			in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 162
;162:			continue;
ADDRGP4 $109
JUMPV
LABELV $113
line 164
;163:		}
;164:		*out = tolower( *in );
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
CVII1 4
ASGNI1
line 165
;165:		out++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 166
;166:		in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 167
;167:	}
LABELV $109
line 155
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $108
line 169
;168:
;169:	*out = '\0';
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 170
;170:}
LABELV $107
endproc SanitizeString 4 4
export ClientNumberFromString
proc ClientNumberFromString 2068 8
line 181
;171:
;172:
;173:/*
;174:==================
;175:ClientNumberFromString
;176:
;177:Returns a player number for either a number or name string
;178:Returns -1 if invalid
;179:==================
;180:*/
;181:int ClientNumberFromString( gentity_t *to, char *s ) {
line 188
;182:	gclient_t	*cl;
;183:	int			idnum;
;184:	char		s2[MAX_STRING_CHARS];
;185:	char		n2[MAX_STRING_CHARS];
;186:
;187:	// numeric values are just slot numbers
;188:	if (s[0] >= '0' && s[0] <= '9') {
ADDRLP4 2056
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 48
LTI4 $116
ADDRLP4 2056
INDIRI4
CNSTI4 57
GTI4 $116
line 189
;189:		idnum = atoi( s );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 2060
INDIRI4
ASGNI4
line 190
;190:		if ( (unsigned) idnum >= (unsigned)level.maxclients ) {
ADDRLP4 4
INDIRI4
CVIU4 4
ADDRGP4 level+24
INDIRI4
CVIU4 4
LTU4 $118
line 191
;191:			trap_SendServerCommand( to-g_entities, va("print \"Bad client slot: %i\n\"", idnum));
ADDRGP4 $121
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 192
;192:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $115
JUMPV
LABELV $118
line 195
;193:		}
;194:
;195:		cl = &level.clients[idnum];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 196
;196:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 2
EQI4 $122
line 197
;197:			trap_SendServerCommand( to-g_entities, va("print \"Client %i is not active\n\"", idnum));
ADDRGP4 $124
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 198
;198:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $115
JUMPV
LABELV $122
line 200
;199:		}
;200:		return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $115
JUMPV
LABELV $116
line 204
;201:	}
;202:
;203:	// check for a name match
;204:	SanitizeString( s, s2 );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 205
;205:	for ( idnum=0,cl=level.clients ; idnum < level.maxclients ; idnum++,cl++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $128
JUMPV
LABELV $125
line 206
;206:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 2
EQI4 $130
line 207
;207:			continue;
ADDRGP4 $126
JUMPV
LABELV $130
line 209
;208:		}
;209:		SanitizeString( cl->pers.netname, n2 );
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 210
;210:		if ( !strcmp( n2, s2 ) ) {
ADDRLP4 8
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 2060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
NEI4 $132
line 211
;211:			return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $115
JUMPV
LABELV $132
line 213
;212:		}
;213:	}
LABELV $126
line 205
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1736
ADDP4
ASGNP4
LABELV $128
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $125
line 215
;214:
;215:	trap_SendServerCommand( to-g_entities, va("print \"User %s is not on the server\n\"", s));
ADDRGP4 $134
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 216
;216:	return -1;
CNSTI4 -1
RETI4
LABELV $115
endproc ClientNumberFromString 2068 8
export Cmd_Give_f
proc Cmd_Give_f 132 12
line 228
;217:}
;218:
;219:
;220:/*
;221:==================
;222:Cmd_Give_f
;223:
;224:Give items to a client
;225:==================
;226:*/
;227:void Cmd_Give_f( gentity_t *ent )
;228:{
line 236
;229:	char		*name;
;230:	gitem_t		*it;
;231:	int			i;
;232:	qboolean	give_all;
;233:	gentity_t	*it_ent;
;234:	trace_t		trace;
;235:
;236:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $136
line 237
;237:		return;
ADDRGP4 $135
JUMPV
LABELV $136
line 240
;238:	}
;239:
;240:	name = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 80
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 80
INDIRP4
ASGNP4
line 242
;241:
;242:	if (Q_stricmp(name, "all") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $140
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $138
line 243
;243:		give_all = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $139
JUMPV
LABELV $138
line 245
;244:	else
;245:		give_all = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $139
line 247
;246:
;247:	if (give_all || Q_stricmp( name, "health") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $144
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $143
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $141
LABELV $144
line 248
;248:	{
line 249
;249:		ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 250
;250:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $145
line 251
;251:			return;
ADDRGP4 $135
JUMPV
LABELV $145
line 252
;252:	}
LABELV $141
line 254
;253:
;254:	if (give_all || Q_stricmp(name, "weapons") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $150
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $149
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $147
LABELV $150
line 255
;255:	{
line 256
;256:		ent->client->ps.stats[STAT_WEAPONS] = (1 << WP_NUM_WEAPONS) - 1 - 
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 3070
ASGNI4
line 261
;257:#ifdef USE_GRAPPLING_HOOK
;258:			( 1 << WP_GRAPPLING_HOOK ) -
;259:#endif
;260:			( 1 << WP_NONE );
;261:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $151
line 262
;262:			return;
ADDRGP4 $135
JUMPV
LABELV $151
line 263
;263:	}
LABELV $147
line 265
;264:
;265:	if (give_all || Q_stricmp(name, "ammo") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $156
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 96
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $153
LABELV $156
line 266
;266:	{
line 267
;267:		for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $157
line 268
;268:			ent->client->ps.ammo[i] = 999;
ADDRLP4 0
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
CNSTI4 999
ASGNI4
line 269
;269:		}
LABELV $158
line 267
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $157
line 270
;270:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $161
line 271
;271:			return;
ADDRGP4 $135
JUMPV
LABELV $161
line 272
;272:	}
LABELV $153
line 274
;273:
;274:	if (give_all || Q_stricmp(name, "armor") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $166
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $165
ARGP4
ADDRLP4 100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $163
LABELV $166
line 275
;275:	{
line 276
;276:		ent->client->ps.stats[STAT_ARMOR] = 200;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 200
ASGNI4
line 278
;277:
;278:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $167
line 279
;279:			return;
ADDRGP4 $135
JUMPV
LABELV $167
line 280
;280:	}
LABELV $163
line 282
;281:
;282:	if (Q_stricmp(name, "excellent") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $171
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $169
line 283
;283:		ent->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 288
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 284
;284:		return;
ADDRGP4 $135
JUMPV
LABELV $169
line 286
;285:	}
;286:	if (Q_stricmp(name, "impressive") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $174
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $172
line 287
;287:		ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 288
;288:		return;
ADDRGP4 $135
JUMPV
LABELV $172
line 290
;289:	}
;290:	if (Q_stricmp(name, "gauntletaward") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $177
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $175
line 291
;291:		ent->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 292
;292:		return;
ADDRGP4 $135
JUMPV
LABELV $175
line 294
;293:	}
;294:	if (Q_stricmp(name, "defend") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $180
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $178
line 295
;295:		ent->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 296
;296:		return;
ADDRGP4 $135
JUMPV
LABELV $178
line 298
;297:	}
;298:	if (Q_stricmp(name, "assist") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $183
ARGP4
ADDRLP4 120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $181
line 299
;299:		ent->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 296
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 300
;300:		return;
ADDRGP4 $135
JUMPV
LABELV $181
line 304
;301:	}
;302:
;303:	// spawn a specific item right on the player
;304:	if ( !give_all ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $184
line 305
;305:		it = BG_FindItem (name);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 124
INDIRP4
ASGNP4
line 306
;306:		if (!it) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $186
line 307
;307:			return;
ADDRGP4 $135
JUMPV
LABELV $186
line 310
;308:		}
;309:
;310:		it_ent = G_Spawn();
ADDRLP4 128
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 128
INDIRP4
ASGNP4
line 311
;311:		VectorCopy( ent->r.currentOrigin, it_ent->s.origin );
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 984
ADDP4
INDIRB
ASGNB 12
line 312
;312:		it_ent->classname = it->classname;
ADDRLP4 12
INDIRP4
CNSTI4 1020
ADDP4
ADDRLP4 16
INDIRP4
INDIRP4
ASGNP4
line 313
;313:		G_SpawnItem (it_ent, it);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 314
;314:		FinishSpawningItem(it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 315
;315:		memset( &trace, 0, sizeof( trace ) );
ADDRLP4 20
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 316
;316:		Touch_Item (it_ent, ent, &trace);
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 Touch_Item
CALLV
pop
line 317
;317:		if (it_ent->inuse) {
ADDRLP4 12
INDIRP4
CNSTI4 1016
ADDP4
INDIRI4
CNSTI4 0
EQI4 $188
line 318
;318:			G_FreeEntity( it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 319
;319:		}
LABELV $188
line 320
;320:	}
LABELV $184
line 321
;321:}
LABELV $135
endproc Cmd_Give_f 132 12
export Cmd_God_f
proc Cmd_God_f 16 8
line 334
;322:
;323:
;324:/*
;325:==================
;326:Cmd_God_f
;327:
;328:Sets client to godmode
;329:
;330:argv(0) god
;331:==================
;332:*/
;333:void Cmd_God_f( gentity_t *ent )
;334:{
line 337
;335:	const char *msg;
;336:
;337:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $191
line 338
;338:		return;
ADDRGP4 $190
JUMPV
LABELV $191
line 341
;339:	}
;340:
;341:	ent->flags ^= FL_GODMODE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 16
BXORI4
ASGNI4
line 342
;342:	if (!(ent->flags & FL_GODMODE) )
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $193
line 343
;343:		msg = "godmode OFF\n";
ADDRLP4 0
ADDRGP4 $195
ASGNP4
ADDRGP4 $194
JUMPV
LABELV $193
line 345
;344:	else
;345:		msg = "godmode ON\n";
ADDRLP4 0
ADDRGP4 $196
ASGNP4
LABELV $194
line 347
;346:
;347:	trap_SendServerCommand( ent-g_entities, va( "print \"%s\"", msg ) );
ADDRGP4 $197
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 348
;348:}
LABELV $190
endproc Cmd_God_f 16 8
export Cmd_Notarget_f
proc Cmd_Notarget_f 16 8
line 360
;349:
;350:
;351:/*
;352:==================
;353:Cmd_Notarget_f
;354:
;355:Sets client to notarget
;356:
;357:argv(0) notarget
;358:==================
;359:*/
;360:void Cmd_Notarget_f( gentity_t *ent ) {
line 363
;361:	const char *msg;
;362:
;363:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $199
line 364
;364:		return;
ADDRGP4 $198
JUMPV
LABELV $199
line 367
;365:	}
;366:
;367:	ent->flags ^= FL_NOTARGET;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BXORI4
ASGNI4
line 368
;368:	if (!(ent->flags & FL_NOTARGET) )
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $201
line 369
;369:		msg = "notarget OFF\n";
ADDRLP4 0
ADDRGP4 $203
ASGNP4
ADDRGP4 $202
JUMPV
LABELV $201
line 371
;370:	else
;371:		msg = "notarget ON\n";
ADDRLP4 0
ADDRGP4 $204
ASGNP4
LABELV $202
line 373
;372:
;373:	trap_SendServerCommand( ent-g_entities, va( "print \"%s\"", msg ) );
ADDRGP4 $197
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 374
;374:}
LABELV $198
endproc Cmd_Notarget_f 16 8
export Cmd_Noclip_f
proc Cmd_Noclip_f 20 8
line 384
;375:
;376:
;377:/*
;378:==================
;379:Cmd_Noclip_f
;380:
;381:argv(0) noclip
;382:==================
;383:*/
;384:void Cmd_Noclip_f( gentity_t *ent ) {
line 387
;385:	const char *msg;
;386:
;387:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $206
line 388
;388:		return;
ADDRGP4 $205
JUMPV
LABELV $206
line 391
;389:	}
;390:
;391:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
CNSTI4 0
EQI4 $208
line 392
;392:		msg = "noclip OFF\n";
ADDRLP4 0
ADDRGP4 $210
ASGNP4
line 393
;393:	} else {
ADDRGP4 $209
JUMPV
LABELV $208
line 394
;394:		msg = "noclip ON\n";
ADDRLP4 0
ADDRGP4 $211
ASGNP4
line 395
;395:	}
LABELV $209
line 396
;396:	ent->client->noclip = !ent->client->noclip;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
CNSTI4 0
NEI4 $213
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $214
JUMPV
LABELV $213
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $214
ADDRLP4 12
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 824
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 398
;397:
;398:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $197
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 399
;399:}
LABELV $205
endproc Cmd_Noclip_f 20 8
export Cmd_LevelShot_f
proc Cmd_LevelShot_f 4 8
line 412
;400:
;401:
;402:/*
;403:==================
;404:Cmd_LevelShot_f
;405:
;406:This is just to help generate the level pictures
;407:for the menus.  It goes to the intermission immediately
;408:and sends over a command to the client to resize the view,
;409:hide the scoreboard, and take a special screenshot
;410:==================
;411:*/
;412:void Cmd_LevelShot_f( gentity_t *ent ) {
line 413
;413:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $216
line 414
;414:		return;
ADDRGP4 $215
JUMPV
LABELV $216
line 418
;415:	}
;416:
;417:	// doesn't work in single player
;418:	if ( g_gametype.integer == GT_SINGLE_PLAYER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $218
line 419
;419:		trap_SendServerCommand( ent-g_entities, 
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
ADDRGP4 $221
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 421
;420:			"print \"Must be in g_gametype 0 for levelshot\n\"" );
;421:		return;
ADDRGP4 $215
JUMPV
LABELV $218
line 424
;422:	}
;423:
;424:	if ( !ent->client->pers.localClient )
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
CNSTI4 0
NEI4 $222
line 425
;425:	{
line 426
;426:		trap_SendServerCommand( ent - g_entities,
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
ADDRGP4 $224
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 428
;427:			"print \"The levelshot command must be executed by a local client\n\"" );
;428:		return;
ADDRGP4 $215
JUMPV
LABELV $222
line 431
;429:	}
;430:
;431:	BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 432
;432:	trap_SendServerCommand( ent-g_entities, "clientLevelShot" );
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
ADDRGP4 $225
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 433
;433:}
LABELV $215
endproc Cmd_LevelShot_f 4 8
export Cmd_TeamTask_f
proc Cmd_TeamTask_f 2068 12
line 441
;434:
;435:
;436:/*
;437:==================
;438:Cmd_TeamTask_f
;439:==================
;440:*/
;441:void Cmd_TeamTask_f( gentity_t *ent ) {
line 445
;442:	char userinfo[MAX_INFO_STRING];
;443:	char arg[MAX_TOKEN_CHARS];
;444:	int task;
;445:	int client = ent->client - level.clients;
ADDRLP4 1024
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
ASGNI4
line 447
;446:
;447:	if ( trap_Argc() != 2 ) {
ADDRLP4 2056
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 2
EQI4 $227
line 448
;448:		return;
ADDRGP4 $226
JUMPV
LABELV $227
line 450
;449:	}
;450:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 451
;451:	task = atoi( arg );
ADDRLP4 1028
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2052
ADDRLP4 2060
INDIRI4
ASGNI4
line 453
;452:
;453:	trap_GetUserinfo( client, userinfo, sizeof( userinfo ) );
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 454
;454:	Info_SetValueForKey( userinfo, "teamtask", va( "%d", task ) );
ADDRGP4 $230
ARGP4
ADDRLP4 2052
INDIRI4
ARGI4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $229
ARGP4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 455
;455:	trap_SetUserinfo( client, userinfo );
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 456
;456:	ClientUserinfoChanged( client );
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 457
;457:}
LABELV $226
endproc Cmd_TeamTask_f 2068 12
export Cmd_Kill_f
proc Cmd_Kill_f 16 20
line 465
;458:
;459:
;460:/*
;461:=================
;462:Cmd_Kill_f
;463:=================
;464:*/
;465:void Cmd_Kill_f( gentity_t *ent ) {
line 466
;466:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
NEI4 $232
line 467
;467:		return;
ADDRGP4 $231
JUMPV
LABELV $232
line 469
;468:	}
;469:	if (ent->health <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $234
line 470
;470:		return;
ADDRGP4 $231
JUMPV
LABELV $234
line 472
;471:	}
;472:	ent->flags &= ~FL_GODMODE;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 473
;473:	ent->client->ps.stats[STAT_HEALTH] = ent->health = -999;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 -999
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 474
;474:	player_die (ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 player_die
CALLV
pop
line 475
;475:}
LABELV $231
endproc Cmd_Kill_f 16 20
export BroadcastTeamChange
proc BroadcastTeamChange 8 8
line 486
;476:
;477:
;478:/*
;479:=================
;480:BroadcastTeamChange
;481:
;482:Let everyone know about a team change
;483:=================
;484:*/
;485:void BroadcastTeamChange( gclient_t *client, team_t oldTeam )
;486:{
line 487
;487:	int clientNum = client - level.clients;
ADDRLP4 0
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
ASGNI4
line 489
;488:
;489:	if ( client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 1
NEI4 $237
line 490
;490:		G_BroadcastServerCommand( clientNum, va("cp \"%s" S_COLOR_WHITE " joined the " S_COLOR_RED "red" S_COLOR_WHITE " team.\n\"",
ADDRGP4 $239
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 492
;491:			client->pers.netname) );
;492:	} else if ( client->sess.sessionTeam == TEAM_BLUE ) {
ADDRGP4 $238
JUMPV
LABELV $237
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 2
NEI4 $240
line 493
;493:		G_BroadcastServerCommand( clientNum, va("cp \"%s" S_COLOR_WHITE " joined the " S_COLOR_BLUE "blue" S_COLOR_WHITE " team.\n\"",
ADDRGP4 $242
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 495
;494:		client->pers.netname));
;495:	} else if ( client->sess.sessionTeam == TEAM_SPECTATOR && oldTeam != TEAM_SPECTATOR ) {
ADDRGP4 $241
JUMPV
LABELV $240
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
NEI4 $243
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $243
line 496
;496:		G_BroadcastServerCommand( clientNum, va("cp \"%s" S_COLOR_WHITE " joined the spectators.\n\"",
ADDRGP4 $245
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 498
;497:		client->pers.netname));
;498:	} else if ( client->sess.sessionTeam == TEAM_FREE ) {
ADDRGP4 $244
JUMPV
LABELV $243
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 0
NEI4 $246
line 499
;499:		G_BroadcastServerCommand( clientNum, va("cp \"%s" S_COLOR_WHITE " joined the battle.\n\"",
ADDRGP4 $248
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 501
;500:		client->pers.netname));
;501:	}
LABELV $246
LABELV $244
LABELV $241
LABELV $238
line 502
;502:}
LABELV $236
endproc BroadcastTeamChange 8 8
proc AllowTeamSwitch 24 8
line 505
;503:
;504:
;505:static qboolean AllowTeamSwitch( int clientNum, team_t newTeam ) {
line 507
;506:
;507:	if ( g_teamForceBalance.integer  ) {
ADDRGP4 g_teamForceBalance+12
INDIRI4
CNSTI4 0
EQI4 $250
line 510
;508:		int		counts[TEAM_NUM_TEAMS];
;509:
;510:		counts[TEAM_BLUE] = TeamCount( clientNum, TEAM_BLUE );
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
line 511
;511:		counts[TEAM_RED] = TeamCount( clientNum, TEAM_RED );
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
line 514
;512:
;513:		// We allow a spread of two
;514:		if ( newTeam == TEAM_RED && counts[TEAM_RED] - counts[TEAM_BLUE] > 1 ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $255
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
SUBI4
CNSTI4 1
LEI4 $255
line 515
;515:			trap_SendServerCommand( clientNum, "cp \"Red team has too many players.\n\"" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $259
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 516
;516:			return qfalse; // ignore the request
CNSTI4 0
RETI4
ADDRGP4 $249
JUMPV
LABELV $255
line 519
;517:		}
;518:
;519:		if ( newTeam == TEAM_BLUE && counts[TEAM_BLUE] - counts[TEAM_RED] > 1 ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $260
ADDRLP4 0+8
INDIRI4
ADDRLP4 0+4
INDIRI4
SUBI4
CNSTI4 1
LEI4 $260
line 520
;520:			trap_SendServerCommand( clientNum, "cp \"Blue team has too many players.\n\"" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $264
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 521
;521:			return qfalse; // ignore the request
CNSTI4 0
RETI4
ADDRGP4 $249
JUMPV
LABELV $260
line 525
;522:		}
;523:
;524:		// It's ok, the team we are switching to has less or same number of players
;525:	}
LABELV $250
line 527
;526:
;527:	return qtrue;
CNSTI4 1
RETI4
LABELV $249
endproc AllowTeamSwitch 24 8
export SetTeam
proc SetTeam 76 20
line 536
;528:}
;529:
;530:
;531:/*
;532:=================
;533:SetTeam
;534:=================
;535:*/
;536:qboolean SetTeam( gentity_t *ent, const char *s ) {
line 549
;537:	team_t				team, oldTeam;
;538:	gclient_t			*client;
;539:	int					clientNum;
;540:	spectatorState_t	specState;
;541:	int					specClient;
;542:	int					teamLeader;
;543:	qboolean			checkTeamLeader;
;544:
;545:	//
;546:	// see what change is requested
;547:	//
;548:
;549:	clientNum = ent - g_entities;
ADDRLP4 12
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
line 550
;550:	client = level.clients + clientNum;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 553
;551:
;552:	// early team override
;553:	if ( client->pers.connected == CON_CONNECTING && g_gametype.integer >= GT_TEAM ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $266
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $266
line 554
;554:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $271
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $273
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $272
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $269
LABELV $273
line 555
;555:			team = TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 556
;556:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $270
JUMPV
LABELV $269
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $276
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $278
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $277
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $274
LABELV $278
line 557
;557:			team = TEAM_BLUE; 
ADDRLP4 4
CNSTI4 2
ASGNI4
line 558
;558:		} else {
ADDRGP4 $275
JUMPV
LABELV $274
line 559
;559:			team = -1;
ADDRLP4 4
CNSTI4 -1
ASGNI4
line 560
;560:		}
LABELV $275
LABELV $270
line 561
;561:		if ( team != -1 && AllowTeamSwitch( clientNum, team ) ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $279
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 AllowTeamSwitch
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $279
line 562
;562:			client->sess.sessionTeam = team;
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 563
;563:			client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 0
ASGNI4
line 564
;564:			G_WriteClientSessionData( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 566
;565:			// count current clients and rank for scoreboard
;566:			CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 567
;567:		}
LABELV $279
line 568
;568:		return qfalse; // bypass flood protection
CNSTI4 0
RETI4
ADDRGP4 $265
JUMPV
LABELV $266
line 571
;569:	}
;570:
;571:	specClient = clientNum;
ADDRLP4 20
ADDRLP4 12
INDIRI4
ASGNI4
line 572
;572:	specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 573
;573:	if ( !Q_stricmp( s, "scoreboard" ) || !Q_stricmp( s, "score" )  ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $283
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $285
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $284
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $281
LABELV $285
line 574
;574:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 575
;575:		specState = SPECTATOR_SCOREBOARD;
ADDRLP4 16
CNSTI4 3
ASGNI4
line 576
;576:	} else if ( !Q_stricmp( s, "follow1" ) ) {
ADDRGP4 $282
JUMPV
LABELV $281
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $288
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $286
line 577
;577:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 578
;578:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 579
;579:		specClient = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 580
;580:	} else if ( !Q_stricmp( s, "follow2" ) ) {
ADDRGP4 $287
JUMPV
LABELV $286
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $291
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $289
line 581
;581:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 582
;582:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 583
;583:		specClient = -2;
ADDRLP4 20
CNSTI4 -2
ASGNI4
line 584
;584:	} else if ( !Q_stricmp( s, "spectator" ) || !Q_stricmp( s, "s" ) ) {
ADDRGP4 $290
JUMPV
LABELV $289
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $294
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $296
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $295
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $292
LABELV $296
line 585
;585:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 586
;586:		specState = SPECTATOR_FREE;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 587
;587:	} else if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 $293
JUMPV
LABELV $292
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $297
line 589
;588:		// if running a team game, assign player to one of the teams
;589:		specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 590
;590:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $271
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $302
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $272
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $300
LABELV $302
line 591
;591:			team = TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 592
;592:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $301
JUMPV
LABELV $300
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $276
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $305
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $277
ARGP4
ADDRLP4 68
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $303
LABELV $305
line 593
;593:			team = TEAM_BLUE;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 594
;594:		} else {
ADDRGP4 $304
JUMPV
LABELV $303
line 596
;595:			// pick the team with the least number of players
;596:			team = PickTeam( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 72
INDIRI4
ASGNI4
line 597
;597:		}
LABELV $304
LABELV $301
line 599
;598:
;599:		if ( !AllowTeamSwitch( clientNum, team ) ) {
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 AllowTeamSwitch
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $298
line 600
;600:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $265
JUMPV
line 603
;601:		}
;602:
;603:	} else {
LABELV $297
line 605
;604:		// force them to spectators if there aren't any spots free
;605:		team = TEAM_FREE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 606
;606:	}
LABELV $298
LABELV $293
LABELV $290
LABELV $287
LABELV $282
line 609
;607:
;608:	// override decision if limiting the players
;609:	if ( (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $308
ADDRGP4 level+80
INDIRI4
CNSTI4 2
LTI4 $308
line 610
;610:		&& level.numNonSpectatorClients >= 2 ) {
line 611
;611:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 612
;612:	} else if ( g_maxGameClients.integer > 0 && 
ADDRGP4 $309
JUMPV
LABELV $308
ADDRGP4 g_maxGameClients+12
INDIRI4
CNSTI4 0
LEI4 $312
ADDRGP4 level+80
INDIRI4
ADDRGP4 g_maxGameClients+12
INDIRI4
LTI4 $312
line 613
;613:		level.numNonSpectatorClients >= g_maxGameClients.integer ) {
line 614
;614:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 615
;615:	}
LABELV $312
LABELV $309
line 620
;616:
;617:	//
;618:	// decide if we will allow the change
;619:	//
;620:	oldTeam = client->sess.sessionTeam;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ASGNI4
line 621
;621:	if ( team == oldTeam ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $317
line 622
;622:		if ( team != TEAM_SPECTATOR )
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $319
line 623
;623:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $265
JUMPV
LABELV $319
line 626
;624:
;625:		// do soft release if possible
;626:		if ( ( client->ps.pm_flags & PMF_FOLLOW ) && client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $321
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $321
line 627
;627:			StopFollowing( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StopFollowing
CALLV
pop
line 628
;628:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $265
JUMPV
LABELV $321
line 632
;629:		}
;630:
;631:		// second spectator team request will move player to intermission point
;632:		if ( client->ps.persistant[ PERS_TEAM ] == TEAM_SPECTATOR && !( client->ps.pm_flags & PMF_FOLLOW )
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
NEI4 $323
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $323
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
CNSTI4 1
NEI4 $323
line 633
;633:			&& client->sess.spectatorState == SPECTATOR_FREE ) {
line 634
;634:			VectorCopy( level.intermission_origin, ent->s.origin );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRGP4 level+7616
INDIRB
ASGNB 12
line 635
;635:			VectorCopy( level.intermission_origin, client->ps.origin );
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 level+7616
INDIRB
ASGNB 12
line 636
;636:			SetClientViewAngle( ent, level.intermission_angle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 level+7628
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 637
;637:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $265
JUMPV
LABELV $323
line 639
;638:		}
;639:	}
LABELV $317
line 646
;640:
;641:	//
;642:	// execute the team change
;643:	//
;644:
;645:	// if the player was dead leave the body
;646:	if ( ent->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $328
line 647
;647:		CopyToBodyQue( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 648
;648:	}
LABELV $328
line 651
;649:
;650:	// he starts at 'base'
;651:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 0
ASGNI4
line 653
;652:
;653:	if ( oldTeam != TEAM_SPECTATOR ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $330
line 656
;654:		
;655:		// revert any casted votes
;656:		if ( oldTeam != team )
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $332
line 657
;657:			G_RevertVote( ent->client );
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_RevertVote
CALLV
pop
LABELV $332
line 660
;658:
;659:		// Kill him (makes sure he loses flags, etc)
;660:		ent->flags &= ~FL_GODMODE;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 661
;661:		ent->client->ps.stats[STAT_HEALTH] = ent->health = 0;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 662
;662:		player_die (ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 player_die
CALLV
pop
line 663
;663:	}
LABELV $330
line 666
;664:
;665:	// they go to the end of the line for tournements
;666:	if ( team == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $334
line 667
;667:		client->sess.spectatorTime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
CNSTI4 0
ASGNI4
line 668
;668:	}
LABELV $334
line 670
;669:
;670:	client->sess.sessionTeam = team;
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 671
;671:	client->sess.spectatorState = specState;
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 672
;672:	client->sess.spectatorClient = specClient;
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 674
;673:
;674:	checkTeamLeader = client->sess.teamLeader;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
ASGNI4
line 675
;675:	client->sess.teamLeader = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 816
ADDP4
CNSTI4 0
ASGNI4
line 677
;676:
;677:	if ( team == TEAM_RED || team == TEAM_BLUE ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $338
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $336
LABELV $338
line 678
;678:		teamLeader = TeamLeader( team );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 TeamLeader
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 60
INDIRI4
ASGNI4
line 680
;679:		// if there is no team leader or the team leader is a bot and this client is not a bot
;680:		if ( teamLeader == -1 || ( !(g_entities[clientNum].r.svFlags & SVF_BOT) && (g_entities[teamLeader].r.svFlags & SVF_BOT) ) ) {
ADDRLP4 64
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 -1
EQI4 $345
ADDRLP4 12
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities+456+464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $339
ADDRLP4 64
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities+456+464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $339
LABELV $345
line 681
;681:			SetLeader( team, clientNum );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 682
;682:		}
LABELV $339
line 683
;683:	}
LABELV $336
line 686
;684:
;685:	// make sure there is a team leader on the team the player came from
;686:	if ( oldTeam == TEAM_RED || oldTeam == TEAM_BLUE ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $348
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $346
LABELV $348
line 687
;687:		if ( checkTeamLeader ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $349
line 688
;688:			CheckTeamLeader( oldTeam );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CheckTeamLeader
CALLV
pop
line 689
;689:		}
LABELV $349
line 690
;690:	}
LABELV $346
line 692
;691:
;692:	G_WriteClientSessionData( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 694
;693:
;694:	BroadcastTeamChange( client, oldTeam );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 697
;695:
;696:	// get and distribute relevant parameters
;697:	ClientUserinfoChanged( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 699
;698:
;699:	ClientBegin( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 701
;700:
;701:	return qtrue;
CNSTI4 1
RETI4
LABELV $265
endproc SetTeam 76 20
export StopFollowing
proc StopFollowing 12 12
line 713
;702:}
;703:
;704:
;705:/*
;706:=================
;707:StopFollowing
;708:
;709:If the client being followed leaves the game, or you just want to drop
;710:to free floating spectator mode
;711:=================
;712:*/
;713:void StopFollowing( gentity_t *ent, qboolean release ) {
line 716
;714:	gclient_t *client;
;715:
;716:	if ( ent->r.svFlags & SVF_BOT || !ent->inuse )
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $354
ADDRLP4 4
INDIRP4
CNSTI4 1016
ADDP4
INDIRI4
CNSTI4 0
NEI4 $352
LABELV $354
line 717
;717:		return;
ADDRGP4 $351
JUMPV
LABELV $352
line 719
;718:
;719:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ASGNP4
line 721
;720:
;721:	client->ps.persistant[ PERS_TEAM ] = TEAM_SPECTATOR;	
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 3
ASGNI4
line 722
;722:	client->sess.sessionTeam = TEAM_SPECTATOR;	
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
CNSTI4 3
ASGNI4
line 723
;723:	if ( release ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $355
line 724
;724:		client->ps.stats[STAT_HEALTH] = ent->health = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 725
;725:		memset( client->ps.powerups, 0, sizeof ( client->ps.powerups ) );
ADDRLP4 0
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
line 726
;726:	}
LABELV $355
line 727
;727:	SetClientViewAngle( ent, client->ps.viewangles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 729
;728:
;729:	client->sess.spectatorState = SPECTATOR_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
CNSTI4 1
ASGNI4
line 730
;730:	client->ps.pm_flags &= ~PMF_FOLLOW;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 733
;731:	//ent->r.svFlags &= ~SVF_BOT;
;732:
;733:	client->ps.clientNum = ent - g_entities;
ADDRLP4 0
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
line 734
;734:}
LABELV $351
endproc StopFollowing 12 12
proc Cmd_Team_f 1036 12
line 742
;735:
;736:
;737:/*
;738:=================
;739:Cmd_Team_f
;740:=================
;741:*/
;742:static void Cmd_Team_f( gentity_t *ent ) {
line 745
;743:	char		s[MAX_TOKEN_CHARS];
;744:
;745:	if ( trap_Argc() != 2 ) {
ADDRLP4 1024
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
EQI4 $358
line 746
;746:		switch ( ent->client->sess.sessionTeam ) {
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
LTI4 $357
ADDRLP4 1028
INDIRI4
CNSTI4 3
GTI4 $357
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $371
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $371
address $367
address $365
address $363
address $369
code
LABELV $363
line 748
;747:		case TEAM_BLUE:
;748:			trap_SendServerCommand( ent-g_entities, "print \"Blue team\n\"" );
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
ADDRGP4 $364
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 749
;749:			break;
ADDRGP4 $357
JUMPV
LABELV $365
line 751
;750:		case TEAM_RED:
;751:			trap_SendServerCommand( ent-g_entities, "print \"Red team\n\"" );
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
ADDRGP4 $366
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 752
;752:			break;
ADDRGP4 $357
JUMPV
LABELV $367
line 754
;753:		case TEAM_FREE:
;754:			trap_SendServerCommand( ent-g_entities, "print \"Free team\n\"" );
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
ADDRGP4 $368
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 755
;755:			break;
ADDRGP4 $357
JUMPV
LABELV $369
line 757
;756:		case TEAM_SPECTATOR:
;757:			trap_SendServerCommand( ent-g_entities, "print \"Spectator team\n\"" );
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
ADDRGP4 $370
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 758
;758:			break;
line 760
;759:		default:
;760:			break;
line 762
;761:		}
;762:		return;
ADDRGP4 $357
JUMPV
LABELV $358
line 765
;763:	}
;764:
;765:	if ( ent->client->switchTeamTime > level.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 940
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $372
line 766
;766:		trap_SendServerCommand( ent-g_entities, "print \"May not switch teams more than once per 5 seconds.\n\"" );
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
ADDRGP4 $375
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 767
;767:		return;
ADDRGP4 $357
JUMPV
LABELV $372
line 771
;768:	}
;769:
;770:	// if they are playing a tournement game, count as a loss
;771:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $376
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 0
NEI4 $376
line 772
;772:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 773
;773:		ent->client->sess.losses++;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 812
ADDP4
ASGNP4
ADDRLP4 1028
INDIRP4
ADDRLP4 1028
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 774
;774:	}
LABELV $376
line 776
;775:
;776:	trap_Argv( 1, s, sizeof( s ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 778
;777:
;778:	if ( SetTeam( ent, s ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 SetTeam
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $379
line 779
;779:		ent->client->switchTeamTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 940
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 780
;780:	}
LABELV $379
line 781
;781:}
LABELV $357
endproc Cmd_Team_f 1036 12
proc Cmd_Follow_f 1040 12
line 789
;782:
;783:
;784:/*
;785:=================
;786:Cmd_Follow_f
;787:=================
;788:*/
;789:static void Cmd_Follow_f( gentity_t *ent ) {
line 793
;790:	int		i;
;791:	char	arg[MAX_TOKEN_CHARS];
;792:
;793:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $383
line 794
;794:		if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $382
line 795
;795:			StopFollowing( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StopFollowing
CALLV
pop
line 796
;796:		}
line 797
;797:		return;
ADDRGP4 $382
JUMPV
LABELV $383
line 800
;798:	}
;799:
;800:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 801
;801:	i = ClientNumberFromString( ent, arg );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 ClientNumberFromString
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 802
;802:	if ( i == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $387
line 803
;803:		return;
ADDRGP4 $382
JUMPV
LABELV $387
line 807
;804:	}
;805:
;806:	// can't follow self
;807:	if ( &level.clients[ i ] == ent->client ) {
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
NEU4 $389
line 808
;808:		return;
ADDRGP4 $382
JUMPV
LABELV $389
line 812
;809:	}
;810:
;811:	// can't follow another spectator
;812:	if ( level.clients[ i ].sess.sessionTeam == TEAM_SPECTATOR ) {
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
CNSTI4 3
NEI4 $391
line 813
;813:		return;
ADDRGP4 $382
JUMPV
LABELV $391
line 817
;814:	}
;815:
;816:	// if they are playing a tournement game, count as a loss
;817:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $393
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 0
NEI4 $393
line 818
;818:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 819
;819:		ent->client->sess.losses++;
ADDRLP4 1036
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 812
ADDP4
ASGNP4
ADDRLP4 1036
INDIRP4
ADDRLP4 1036
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 820
;820:	}
LABELV $393
line 823
;821:
;822:	// first set them to spectator
;823:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
EQI4 $396
line 824
;824:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $294
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 825
;825:	}
LABELV $396
line 827
;826:
;827:	ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 800
ADDP4
CNSTI4 2
ASGNI4
line 828
;828:	ent->client->sess.spectatorClient = i;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 804
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 829
;829:}
LABELV $382
endproc Cmd_Follow_f 1040 12
export Cmd_FollowCycle_f
proc Cmd_FollowCycle_f 16 8
line 837
;830:
;831:
;832:/*
;833:=================
;834:Cmd_FollowCycle_f
;835:=================
;836:*/
;837:void Cmd_FollowCycle_f( gentity_t *ent, int dir ) {
line 843
;838:	int		clientnum;
;839:	int		original;
;840:	gclient_t	*client;
;841:
;842:	// if they are playing a tournement game, count as a loss
;843:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $399
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 0
NEI4 $399
line 844
;844:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 845
;845:		ent->client->sess.losses++;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 812
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 846
;846:	}
LABELV $399
line 848
;847:
;848:	client = ent->client;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ASGNP4
line 851
;849:
;850:	// first set them to spectator
;851:	if ( client->sess.spectatorState == SPECTATOR_NOT ) {
ADDRLP4 8
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
CNSTI4 0
NEI4 $402
line 852
;852:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $294
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 853
;853:	}
LABELV $402
line 855
;854:
;855:	if ( dir != 1 && dir != -1 ) {
ADDRLP4 12
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $404
ADDRLP4 12
INDIRI4
CNSTI4 -1
EQI4 $404
line 856
;856:		G_Error( "Cmd_FollowCycle_f: bad dir %i", dir );
ADDRGP4 $406
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Error
CALLV
pop
line 857
;857:	}
LABELV $404
line 859
;858:
;859:	clientnum = client->sess.spectatorClient;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 804
ADDP4
INDIRI4
ASGNI4
line 860
;860:	original = clientnum;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $407
line 861
;861:	do {
line 862
;862:		clientnum += dir;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 863
;863:		if ( clientnum >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $410
line 864
;864:			clientnum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 865
;865:		}
LABELV $410
line 866
;866:		if ( clientnum < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $413
line 867
;867:			clientnum = level.maxclients - 1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 868
;868:		}
LABELV $413
line 871
;869:
;870:		// can only follow connected clients
;871:		if ( level.clients[ clientnum ].pers.connected != CON_CONNECTED ) {
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
EQI4 $416
line 872
;872:			continue;
ADDRGP4 $408
JUMPV
LABELV $416
line 876
;873:		}
;874:
;875:		// can't follow another spectator
;876:		if ( level.clients[ clientnum ].sess.sessionTeam == TEAM_SPECTATOR ) {
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
CNSTI4 3
NEI4 $418
line 877
;877:			continue;
ADDRGP4 $408
JUMPV
LABELV $418
line 881
;878:		}
;879:
;880:		// this is good, we can use it
;881:		ent->client->sess.spectatorClient = clientnum;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 804
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 882
;882:		ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 800
ADDP4
CNSTI4 2
ASGNI4
line 883
;883:		return;
ADDRGP4 $398
JUMPV
LABELV $408
line 884
;884:	} while ( clientnum != original );
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $407
line 887
;885:
;886:	// leave it where it was
;887:}
LABELV $398
endproc Cmd_FollowCycle_f 16 8
proc G_SayTo 12 28
line 895
;888:
;889:
;890:/*
;891:==================
;892:G_Say
;893:==================
;894:*/
;895:static void G_SayTo( gentity_t *ent, gentity_t *other, int mode, int color, const char *name, const char *message ) {
line 896
;896:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $421
line 897
;897:		return;
ADDRGP4 $420
JUMPV
LABELV $421
line 899
;898:	}
;899:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 1016
ADDP4
INDIRI4
CNSTI4 0
NEI4 $423
line 900
;900:		return;
ADDRGP4 $420
JUMPV
LABELV $423
line 902
;901:	}
;902:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $425
line 903
;903:		return;
ADDRGP4 $420
JUMPV
LABELV $425
line 905
;904:	}
;905:	if ( other->client->pers.connected != CON_CONNECTED ) {
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 2
EQI4 $427
line 906
;906:		return;
ADDRGP4 $420
JUMPV
LABELV $427
line 908
;907:	}
;908:	if ( mode == SAY_TEAM  && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $429
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $429
line 909
;909:		return;
ADDRGP4 $420
JUMPV
LABELV $429
line 912
;910:	}
;911:	// no chatting to players in tournements
;912:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $431
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 0
NEI4 $431
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 0
EQI4 $431
line 914
;913:		&& other->client->sess.sessionTeam == TEAM_FREE
;914:		&& ent->client->sess.sessionTeam != TEAM_FREE ) {
line 915
;915:		return;
ADDRGP4 $420
JUMPV
LABELV $431
line 918
;916:	}
;917:
;918:	trap_SendServerCommand( other-g_entities, va( "%s \"%s%c%c%s\" %i", mode == SAY_TEAM ? "tchat" : "chat", 
ADDRGP4 $434
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $438
ADDRLP4 4
ADDRGP4 $435
ASGNP4
ADDRGP4 $439
JUMPV
LABELV $438
ADDRLP4 4
ADDRGP4 $436
ASGNP4
LABELV $439
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTI4 94
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
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
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1312
DIVI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 920
;919:		name, Q_COLOR_ESCAPE, color, message, ent - g_entities ) );
;920:}
LABELV $420
endproc G_SayTo 12 28
proc G_Say 388 28
line 924
;921:
;922:#define EC		"\x19"
;923:
;924:static void G_Say( gentity_t *ent, gentity_t *target, int mode, const char *chatText ) {
line 933
;925:	int			j;
;926:	gentity_t	*other;
;927:	int			color;
;928:	char		name[64 + 64 + 12]; // name + location + formatting
;929:	// don't let text be too long for malicious reasons
;930:	char		text[MAX_SAY_TEXT];
;931:	char		location[64];
;932:
;933:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
GEI4 $441
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $441
line 934
;934:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 935
;935:	}
LABELV $441
line 937
;936:
;937:	switch ( mode ) {
ADDRLP4 368
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $446
ADDRLP4 368
INDIRI4
CNSTI4 1
EQI4 $449
ADDRLP4 368
INDIRI4
CNSTI4 2
EQI4 $455
ADDRGP4 $444
JUMPV
LABELV $444
LABELV $446
line 940
;938:	default:
;939:	case SAY_ALL:
;940:		G_LogPrintf( "say: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $447
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 941
;941:		Com_sprintf (name, sizeof(name), "%s%c%c"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 140
ARGI4
ADDRGP4 $448
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 942
;942:		color = COLOR_GREEN;
ADDRLP4 300
CNSTI4 50
ASGNI4
line 943
;943:		break;
ADDRGP4 $445
JUMPV
LABELV $449
line 945
;944:	case SAY_TEAM:
;945:		G_LogPrintf( "sayteam: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $450
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 946
;946:		if (Team_GetLocationMsg(ent, location, sizeof(location)))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 304
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 372
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 0
EQI4 $451
line 947
;947:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC") (%s)"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 140
ARGI4
ADDRGP4 $453
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 304
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
ADDRGP4 $452
JUMPV
LABELV $451
line 950
;948:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location);
;949:		else
;950:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC")"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 140
ARGI4
ADDRGP4 $454
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
LABELV $452
line 952
;951:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
;952:		color = COLOR_CYAN;
ADDRLP4 300
CNSTI4 53
ASGNI4
line 953
;953:		break;
ADDRGP4 $445
JUMPV
LABELV $455
line 955
;954:	case SAY_TELL:
;955:		if (target && target->inuse && target->client && g_gametype.integer >= GT_TEAM &&
ADDRLP4 376
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 376
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $456
ADDRLP4 376
INDIRP4
CNSTI4 1016
ADDP4
INDIRI4
CNSTI4 0
EQI4 $456
ADDRLP4 376
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $456
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $456
ADDRLP4 380
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 376
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ADDRLP4 380
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
NEI4 $456
ADDRLP4 380
INDIRP4
ARGP4
ADDRLP4 304
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 384
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 384
INDIRI4
CNSTI4 0
EQI4 $456
line 958
;956:			target->client->sess.sessionTeam == ent->client->sess.sessionTeam &&
;957:			Team_GetLocationMsg(ent, location, sizeof(location)))
;958:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"] (%s)"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location );
ADDRLP4 158
ARGP4
CNSTI4 140
ARGI4
ADDRGP4 $459
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 304
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
ADDRGP4 $457
JUMPV
LABELV $456
line 960
;959:		else
;960:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"]"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 140
ARGI4
ADDRGP4 $460
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
LABELV $457
line 961
;961:		color = COLOR_MAGENTA;
ADDRLP4 300
CNSTI4 54
ASGNI4
line 962
;962:		break;
LABELV $445
line 965
;963:	}
;964:
;965:	Q_strncpyz( text, chatText, sizeof(text) );
ADDRLP4 8
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 150
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 967
;966:
;967:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $461
line 968
;968:		G_SayTo( ent, target, mode, color, name, text );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 300
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 969
;969:		return;
ADDRGP4 $440
JUMPV
LABELV $461
line 973
;970:	}
;971:
;972:	// echo the text to the console
;973:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $463
line 974
;974:		G_Printf( "%s%s\n", name, text);
ADDRGP4 $466
ARGP4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 975
;975:	}
LABELV $463
line 978
;976:
;977:	// send it to all the appropriate clients
;978:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $470
JUMPV
LABELV $467
line 979
;979:		other = &g_entities[j];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 980
;980:		G_SayTo( ent, other, mode, color, name, text );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 300
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 981
;981:	}
LABELV $468
line 978
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $470
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $467
line 982
;982:}
LABELV $440
endproc G_Say 388 28
proc Cmd_Say_f 12 16
line 990
;983:
;984:
;985:/*
;986:==================
;987:Cmd_Say_f
;988:==================
;989:*/
;990:static void Cmd_Say_f( gentity_t *ent, int mode, qboolean arg0 ) {
line 993
;991:	char		*p;
;992:
;993:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $473
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $473
line 994
;994:		return;
ADDRGP4 $472
JUMPV
LABELV $473
line 997
;995:	}
;996:
;997:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $475
line 998
;998:	{
line 999
;999:		p = ConcatArgs( 0 );
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1000
;1000:	}
ADDRGP4 $476
JUMPV
LABELV $475
line 1002
;1001:	else
;1002:	{
line 1003
;1003:		p = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1004
;1004:	}
LABELV $476
line 1006
;1005:
;1006:	G_Say( ent, NULL, mode, p );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1007
;1007:}
LABELV $472
endproc Cmd_Say_f 12 16
proc Cmd_Tell_f 1060 16
line 1015
;1008:
;1009:
;1010:/*
;1011:==================
;1012:Cmd_Tell_f
;1013:==================
;1014:*/
;1015:static void Cmd_Tell_f( gentity_t *ent ) {
line 1021
;1016:	int			targetNum;
;1017:	gentity_t	*target;
;1018:	char		*p;
;1019:	char		arg[MAX_TOKEN_CHARS];
;1020:
;1021:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $478
line 1022
;1022:		return;
ADDRGP4 $477
JUMPV
LABELV $478
line 1025
;1023:	}
;1024:
;1025:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1026
;1026:	targetNum = atoi( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1040
INDIRI4
ASGNI4
line 1027
;1027:	if ( (unsigned)targetNum >= (unsigned)level.maxclients ) {
ADDRLP4 8
INDIRI4
CVIU4 4
ADDRGP4 level+24
INDIRI4
CVIU4 4
LTU4 $480
line 1028
;1028:		return;
ADDRGP4 $477
JUMPV
LABELV $480
line 1031
;1029:	}
;1030:
;1031:	target = &g_entities[targetNum];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1032
;1032:	if ( !target->inuse || !target->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 1016
ADDP4
INDIRI4
CNSTI4 0
EQI4 $485
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $483
LABELV $485
line 1033
;1033:		return;
ADDRGP4 $477
JUMPV
LABELV $483
line 1036
;1034:	}
;1035:
;1036:	p = ConcatArgs( 2 );
CNSTI4 2
ARGI4
ADDRLP4 1048
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1048
INDIRP4
ASGNP4
line 1038
;1037:
;1038:	G_LogPrintf( "tell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, p );
ADDRGP4 $486
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1039
;1039:	G_Say( ent, target, SAY_TELL, p );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1042
;1040:	// don't tell to the player self if it was already directed to this player
;1041:	// also don't send the chat back to a bot
;1042:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $487
ADDRLP4 1052
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $487
line 1043
;1043:		G_Say( ent, ent, SAY_TELL, p );
ADDRLP4 1056
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1044
;1044:	}
LABELV $487
line 1045
;1045:}
LABELV $477
endproc Cmd_Tell_f 1060 16
proc G_VoiceTo 16 24
line 1049
;1046:
;1047:#if defined MISSIONPACK || defined USE_NEOHUD
;1048:
;1049:static void G_VoiceTo( gentity_t *ent, gentity_t *other, int mode, const char *id, qboolean voiceonly ) {
line 1053
;1050:	int color;
;1051:	char *cmd;
;1052:
;1053:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $490
line 1054
;1054:		return;
ADDRGP4 $489
JUMPV
LABELV $490
line 1056
;1055:	}
;1056:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 1016
ADDP4
INDIRI4
CNSTI4 0
NEI4 $492
line 1057
;1057:		return;
ADDRGP4 $489
JUMPV
LABELV $492
line 1059
;1058:	}
;1059:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $494
line 1060
;1060:		return;
ADDRGP4 $489
JUMPV
LABELV $494
line 1062
;1061:	}
;1062:	if ( mode == SAY_TEAM && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $496
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $496
line 1063
;1063:		return;
ADDRGP4 $489
JUMPV
LABELV $496
line 1066
;1064:	}
;1065:	// no chatting to players in tournements
;1066:	if ( g_gametype.integer == GT_TOURNAMENT ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $498
line 1067
;1067:		return;
ADDRGP4 $489
JUMPV
LABELV $498
line 1070
;1068:	}
;1069:
;1070:	if (mode == SAY_TEAM) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $501
line 1071
;1071:		color = COLOR_CYAN;
ADDRLP4 0
CNSTI4 53
ASGNI4
line 1072
;1072:		cmd = "vtchat";
ADDRLP4 4
ADDRGP4 $503
ASGNP4
line 1073
;1073:	}
ADDRGP4 $502
JUMPV
LABELV $501
line 1074
;1074:	else if (mode == SAY_TELL) {
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $504
line 1075
;1075:		color = COLOR_MAGENTA;
ADDRLP4 0
CNSTI4 54
ASGNI4
line 1076
;1076:		cmd = "vtell";
ADDRLP4 4
ADDRGP4 $506
ASGNP4
line 1077
;1077:	}
ADDRGP4 $505
JUMPV
LABELV $504
line 1078
;1078:	else {
line 1079
;1079:		color = COLOR_GREEN;
ADDRLP4 0
CNSTI4 50
ASGNI4
line 1080
;1080:		cmd = "vchat";
ADDRLP4 4
ADDRGP4 $507
ASGNP4
line 1081
;1081:	}
LABELV $505
LABELV $502
line 1083
;1082:
;1083:	trap_SendServerCommand( other-g_entities, va("%s %d %d %d %s", cmd, voiceonly, ent->s.number, color, id));
ADDRGP4 $508
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1312
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1084
;1084:}
LABELV $489
endproc G_VoiceTo 16 24
export G_Voice
proc G_Voice 8 20
line 1086
;1085:
;1086:void G_Voice( gentity_t *ent, gentity_t *target, int mode, const char *id, qboolean voiceonly ) {
line 1090
;1087:	int			j;
;1088:	gentity_t	*other;
;1089:
;1090:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
GEI4 $510
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $510
line 1091
;1091:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 1092
;1092:	}
LABELV $510
line 1094
;1093:
;1094:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $513
line 1095
;1095:		G_VoiceTo( ent, target, mode, id, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_VoiceTo
CALLV
pop
line 1096
;1096:		return;
ADDRGP4 $509
JUMPV
LABELV $513
line 1100
;1097:	}
;1098:
;1099:	// echo the text to the console
;1100:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $515
line 1101
;1101:		G_Printf( "voice: %s %s\n", ent->client->pers.netname, id);
ADDRGP4 $518
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1102
;1102:	}
LABELV $515
line 1105
;1103:
;1104:	// send it to all the appropriate clients
;1105:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $522
JUMPV
LABELV $519
line 1106
;1106:		other = &g_entities[j];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1107
;1107:		G_VoiceTo( ent, other, mode, id, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_VoiceTo
CALLV
pop
line 1108
;1108:	}
LABELV $520
line 1105
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $522
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $519
line 1109
;1109:}
LABELV $509
endproc G_Voice 8 20
proc Cmd_Voice_f 12 20
line 1116
;1110:
;1111:/*
;1112:==================
;1113:Cmd_Voice_f
;1114:==================
;1115:*/
;1116:static void Cmd_Voice_f( gentity_t *ent, int mode, qboolean arg0, qboolean voiceonly ) {
line 1119
;1117:	char		*p;
;1118:
;1119:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $525
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $525
line 1120
;1120:		return;
ADDRGP4 $524
JUMPV
LABELV $525
line 1123
;1121:	}
;1122:
;1123:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $527
line 1124
;1124:	{
line 1125
;1125:		p = ConcatArgs( 0 );
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1126
;1126:	}
ADDRGP4 $528
JUMPV
LABELV $527
line 1128
;1127:	else
;1128:	{
line 1129
;1129:		p = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1130
;1130:	}
LABELV $528
line 1132
;1131:
;1132:	G_Voice( ent, NULL, mode, p, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1133
;1133:}
LABELV $524
endproc Cmd_Voice_f 12 20
proc Cmd_VoiceTell_f 1064 20
line 1140
;1134:
;1135:/*
;1136:==================
;1137:Cmd_VoiceTell_f
;1138:==================
;1139:*/
;1140:static void Cmd_VoiceTell_f( gentity_t *ent, qboolean voiceonly ) {
line 1146
;1141:	int			targetNum;
;1142:	gentity_t	*target;
;1143:	char		*id;
;1144:	char		arg[MAX_TOKEN_CHARS];
;1145:
;1146:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $530
line 1147
;1147:		return;
ADDRGP4 $529
JUMPV
LABELV $530
line 1150
;1148:	}
;1149:
;1150:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1151
;1151:	targetNum = atoi( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1040
INDIRI4
ASGNI4
line 1152
;1152:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $535
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $532
LABELV $535
line 1153
;1153:		return;
ADDRGP4 $529
JUMPV
LABELV $532
line 1156
;1154:	}
;1155:
;1156:	target = &g_entities[targetNum];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1157
;1157:	if ( !target->inuse || !target->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 1016
ADDP4
INDIRI4
CNSTI4 0
EQI4 $538
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $536
LABELV $538
line 1158
;1158:		return;
ADDRGP4 $529
JUMPV
LABELV $536
line 1161
;1159:	}
;1160:
;1161:	id = ConcatArgs( 2 );
CNSTI4 2
ARGI4
ADDRLP4 1052
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1052
INDIRP4
ASGNP4
line 1163
;1162:
;1163:	G_LogPrintf( "vtell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, id );
ADDRGP4 $539
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1164
;1164:	G_Voice( ent, target, SAY_TELL, id, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1167
;1165:	// don't tell to the player self if it was already directed to this player
;1166:	// also don't send the chat back to a bot
;1167:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
ADDRLP4 1056
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1056
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $540
ADDRLP4 1056
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $540
line 1168
;1168:		G_Voice( ent, ent, SAY_TELL, id, voiceonly );
ADDRLP4 1060
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1169
;1169:	}
LABELV $540
line 1170
;1170:}
LABELV $529
endproc Cmd_VoiceTell_f 1064 20
proc Cmd_VoiceTaunt_f 28 20
line 1178
;1171:
;1172:
;1173:/*
;1174:==================
;1175:Cmd_VoiceTaunt_f
;1176:==================
;1177:*/
;1178:static void Cmd_VoiceTaunt_f( gentity_t *ent ) {
line 1182
;1179:	gentity_t *who;
;1180:	int i;
;1181:
;1182:	if (!ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $543
line 1183
;1183:		return;
ADDRGP4 $542
JUMPV
LABELV $543
line 1187
;1184:	}
;1185:
;1186:	// insult someone who just killed you
;1187:	if (ent->enemy && ent->enemy->client && ent->enemy->client->lastkilled_client == ent->s.number) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $545
ADDRLP4 8
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $545
ADDRLP4 8
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 896
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
INDIRI4
NEI4 $545
line 1189
;1188:		// i am a dead corpse
;1189:		if (!(ent->enemy->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $547
line 1190
;1190:			G_Voice( ent, ent->enemy, SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $549
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1191
;1191:		}
LABELV $547
line 1192
;1192:		if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $550
line 1193
;1193:			G_Voice( ent, ent,        SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $549
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1194
;1194:		}
LABELV $550
line 1195
;1195:		ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1264
ADDP4
CNSTP4 0
ASGNP4
line 1196
;1196:		return;
ADDRGP4 $542
JUMPV
LABELV $545
line 1199
;1197:	}
;1198:	// insult someone you just killed
;1199:	if (ent->client->lastkilled_client >= 0 && ent->client->lastkilled_client != ent->s.number) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 896
ADDP4
INDIRI4
CNSTI4 0
LTI4 $552
ADDRLP4 12
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 896
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
INDIRI4
EQI4 $552
line 1200
;1200:		who = g_entities + ent->client->lastkilled_client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 896
ADDP4
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1201
;1201:		if (who->client) {
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $554
line 1203
;1202:			// who is the person I just killed
;1203:			if (who->client->lasthurt_mod == MOD_GAUNTLET) {
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 904
ADDP4
INDIRI4
CNSTI4 2
NEI4 $556
line 1204
;1204:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $558
line 1205
;1205:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );	// and I killed them with a gauntlet
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $560
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1206
;1206:				}
LABELV $558
line 1207
;1207:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $557
line 1208
;1208:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $560
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1209
;1209:				}
line 1210
;1210:			} else {
ADDRGP4 $557
JUMPV
LABELV $556
line 1211
;1211:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $563
line 1212
;1212:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );	// and I killed them with something else
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $565
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1213
;1213:				}
LABELV $563
line 1214
;1214:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $566
line 1215
;1215:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $565
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1216
;1216:				}
LABELV $566
line 1217
;1217:			}
LABELV $557
line 1218
;1218:			ent->client->lastkilled_client = -1;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 896
ADDP4
CNSTI4 -1
ASGNI4
line 1219
;1219:			return;
ADDRGP4 $542
JUMPV
LABELV $554
line 1221
;1220:		}
;1221:	}
LABELV $552
line 1223
;1222:
;1223:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $568
line 1225
;1224:		// praise a team mate who just got a reward
;1225:		for(i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $571
line 1226
;1226:			who = g_entities + i;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1227
;1227:			if (who->client && who != ent && who->client->sess.sessionTeam == ent->client->sess.sessionTeam) {
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $575
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRP4
CVPU4 4
EQU4 $575
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
NEI4 $575
line 1228
;1228:				if (who->client->rewardTime > level.time) {
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $577
line 1229
;1229:					if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $580
line 1230
;1230:						G_Voice( ent, who, SAY_TELL, VOICECHAT_PRAISE, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $582
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1231
;1231:					}
LABELV $580
line 1232
;1232:					if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $542
line 1233
;1233:						G_Voice( ent, ent, SAY_TELL, VOICECHAT_PRAISE, qfalse );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $582
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1234
;1234:					}
line 1235
;1235:					return;
ADDRGP4 $542
JUMPV
LABELV $577
line 1237
;1236:				}
;1237:			}
LABELV $575
line 1238
;1238:		}
LABELV $572
line 1225
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $571
line 1239
;1239:	}
LABELV $568
line 1242
;1240:
;1241:	// just say something
;1242:	G_Voice( ent, NULL, SAY_ALL, VOICECHAT_TAUNT, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $585
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1243
;1243:}
LABELV $542
endproc Cmd_VoiceTaunt_f 28 20
data
align 4
LABELV gc_orders
address $586
address $587
address $588
address $589
address $590
address $591
address $592
export Cmd_GameCommand_f
code
proc Cmd_GameCommand_f 1044 16
line 1257
;1244:#endif
;1245:
;1246:
;1247:static char	*gc_orders[] = {
;1248:	"hold your position",
;1249:	"hold this position",
;1250:	"come here",
;1251:	"cover me",
;1252:	"guard location",
;1253:	"search and destroy",
;1254:	"report"
;1255:};
;1256:
;1257:void Cmd_GameCommand_f( gentity_t *ent ) {
line 1262
;1258:	int		player;
;1259:	int		order;
;1260:	char	str[MAX_TOKEN_CHARS];
;1261:
;1262:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1263
;1263:	player = atoi( str );
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1032
INDIRI4
ASGNI4
line 1264
;1264:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1265
;1265:	order = atoi( str );
ADDRLP4 0
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1036
INDIRI4
ASGNI4
line 1267
;1266:
;1267:	if ( (unsigned)player >= MAX_CLIENTS ) {
ADDRLP4 1028
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $594
line 1268
;1268:		return;
ADDRGP4 $593
JUMPV
LABELV $594
line 1270
;1269:	}
;1270:	if ( (unsigned) order > ARRAY_LEN( gc_orders ) ) {
ADDRLP4 1024
INDIRI4
CVIU4 4
CNSTU4 7
LEU4 $596
line 1271
;1271:		return;
ADDRGP4 $593
JUMPV
LABELV $596
line 1273
;1272:	}
;1273:	G_Say( ent, &g_entities[player], SAY_TELL, gc_orders[order] );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gc_orders
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1274
;1274:	G_Say( ent, ent, SAY_TELL, gc_orders[order] );
ADDRLP4 1040
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gc_orders
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1275
;1275:}
LABELV $593
endproc Cmd_GameCommand_f 1044 16
export Cmd_Where_f
proc Cmd_Where_f 8 8
line 1283
;1276:
;1277:
;1278:/*
;1279:==================
;1280:Cmd_Where_f
;1281:==================
;1282:*/
;1283:void Cmd_Where_f( gentity_t *ent ) {
line 1284
;1284:	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", vtos( ent->s.origin ) ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $599
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1285
;1285:}
LABELV $598
endproc Cmd_Where_f 8 8
data
align 4
LABELV voteCommands
address $600
address $601
address $602
address $603
address $604
address $605
address $606
address $607
address $608
address $609
address $610
address $611
code
proc ValidVoteCommand 320 12
line 1311
;1286:
;1287:static const char *voteCommands[] = {
;1288:	"map_restart",
;1289:	"map",
;1290:	"rotate",
;1291:	"nextmap",
;1292:	"kick",
;1293:	"clientkick",
;1294:	"g_gametype",
;1295:	"g_unlagged",
;1296:	"g_warmup",
;1297:	"timelimit",
;1298:	"fraglimit",
;1299:	"capturelimit"
;1300:};
;1301:
;1302:
;1303:/*
;1304:==================
;1305:ValidVoteCommand
;1306:
;1307:Input string can be modified by overwriting gametype number instead of text value, for example
;1308:==================
;1309:*/
;1310:static qboolean ValidVoteCommand( int clientNum, char *command ) 
;1311:{
line 1317
;1312:	char buf[ MAX_CVAR_VALUE_STRING ];
;1313:	char *base;
;1314:	char *s;
;1315:	int	i;
;1316:
;1317:	if ( strchr( command, ';' ) || strchr( command, '\n' ) || strchr( command, '\r' ) )
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 268
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 268
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $616
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 272
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 272
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $616
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 276
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 276
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $613
LABELV $616
line 1318
;1318:	{
line 1319
;1319:		trap_SendServerCommand( clientNum, "print \"Invalid vote command.\n\"" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $617
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1320
;1320:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $612
JUMPV
LABELV $613
line 1323
;1321:	}
;1322:
;1323:	base = command;
ADDRLP4 264
ADDRFP4 4
INDIRP4
ASGNP4
line 1325
;1324:	
;1325:	s = buf; // extract command name
ADDRLP4 4
ADDRLP4 8
ASGNP4
ADDRGP4 $619
JUMPV
LABELV $618
line 1326
;1326:	while ( *command != '\0' && *command != ' ' ) {
line 1327
;1327:		*s = *command; s++; command++;
ADDRLP4 4
INDIRP4
ADDRFP4 4
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1328
;1328:	}
LABELV $619
line 1326
ADDRLP4 280
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $621
ADDRLP4 280
INDIRI4
CNSTI4 32
NEI4 $618
LABELV $621
line 1329
;1329:	*s = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
ADDRGP4 $623
JUMPV
LABELV $622
line 1332
;1330:	// point cmd on first argument
;1331:	while ( *command == ' ' || *command == '\t' )
;1332:		command++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $623
line 1331
ADDRLP4 284
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 32
EQI4 $622
ADDRLP4 284
INDIRI4
CNSTI4 9
EQI4 $622
line 1334
;1333:
;1334:	for ( i = 0; i < ARRAY_LEN( voteCommands ); i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $628
JUMPV
LABELV $625
line 1335
;1335:		if ( !Q_stricmp( buf, voteCommands[i] ) ) {
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 voteCommands
ADDP4
INDIRP4
ARGP4
ADDRLP4 288
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $629
line 1336
;1336:			break;
ADDRGP4 $627
JUMPV
LABELV $629
line 1338
;1337:		}
;1338:	}
LABELV $626
line 1334
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $628
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 12
LTU4 $625
LABELV $627
line 1340
;1339:
;1340:	if ( i == ARRAY_LEN( voteCommands ) ) {
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 12
NEU4 $631
line 1341
;1341:		trap_SendServerCommand( clientNum, "print \"Invalid vote command.\nVote commands are: \n"
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $633
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1347
;1342:			" g_gametype <n|ffa|duel|tdm|ctf>\n"
;1343:			" map_restart, map <mapname>, rotate [round], nextmap\n"
;1344:			" kick <player>, clientkick <clientnum>\n"
;1345:			" g_unlagged <0|1>, g_warmup <-1|0|seconds>\n"
;1346:			" timelimit <time>, fraglimit <frags>, capturelimit <captures>.\n\"" );
;1347:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $612
JUMPV
LABELV $631
line 1350
;1348:	}
;1349:
;1350:	if ( Q_stricmp( buf, "g_gametype" ) == 0 )
ADDRLP4 8
ARGP4
ADDRGP4 $606
ARGP4
ADDRLP4 288
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $634
line 1351
;1351:	{
line 1352
;1352:		if ( !Q_stricmp( command, "ffa" ) ) i = GT_FFA;
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $638
ARGP4
ADDRLP4 292
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $636
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $637
JUMPV
LABELV $636
line 1353
;1353:		else if ( !Q_stricmp( command, "duel" ) ) i = GT_TOURNAMENT;
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $641
ARGP4
ADDRLP4 296
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
NEI4 $639
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $640
JUMPV
LABELV $639
line 1354
;1354:		else if ( !Q_stricmp( command, "tdm" ) ) i = GT_TEAM;
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $644
ARGP4
ADDRLP4 300
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
NEI4 $642
ADDRLP4 0
CNSTI4 3
ASGNI4
ADDRGP4 $643
JUMPV
LABELV $642
line 1355
;1355:		else if ( !Q_stricmp( command, "ctf" ) ) i = GT_CTF;
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $647
ARGP4
ADDRLP4 304
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 304
INDIRI4
CNSTI4 0
NEI4 $645
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRGP4 $646
JUMPV
LABELV $645
line 1357
;1356:		else 
;1357:		{
line 1358
;1358:			i = atoi( command );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 308
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 308
INDIRI4
ASGNI4
line 1359
;1359:			if( i == GT_SINGLE_PLAYER || i < GT_FFA || i >= GT_MAX_GAME_TYPE ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $651
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $651
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $648
LABELV $651
line 1360
;1360:				trap_SendServerCommand( clientNum, va( "print \"Invalid gametype %i.\n\"", i ) );
ADDRGP4 $652
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 316
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 316
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1361
;1361:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $612
JUMPV
LABELV $648
line 1363
;1362:			}
;1363:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $612
JUMPV
LABELV $646
LABELV $643
LABELV $640
LABELV $637
line 1367
;1364:		}
;1365:
;1366:		// handle string values
;1367:		BG_sprintf( base, "g_gametype %i", i );
ADDRLP4 264
INDIRP4
ARGP4
ADDRGP4 $653
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BG_sprintf
CALLI4
pop
line 1369
;1368:
;1369:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $612
JUMPV
LABELV $634
line 1372
;1370:	}
;1371:
;1372:	if ( Q_stricmp( buf, "map" ) == 0 ) {
ADDRLP4 8
ARGP4
ADDRGP4 $601
ARGP4
ADDRLP4 292
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $654
line 1373
;1373:		if ( !G_MapExist( command ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 296
ADDRGP4 G_MapExist
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
NEI4 $656
line 1374
;1374:			trap_SendServerCommand( clientNum, va( "print \"No such map on server: %s.\n\"", command ) );
ADDRGP4 $658
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 300
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1375
;1375:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $612
JUMPV
LABELV $656
line 1377
;1376:		} 
;1377:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $612
JUMPV
LABELV $654
line 1380
;1378:	}
;1379:
;1380:	if ( Q_stricmp( buf, "nextmap" ) == 0 ) {
ADDRLP4 8
ARGP4
ADDRGP4 $603
ARGP4
ADDRLP4 296
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
NEI4 $659
line 1381
;1381:		strcpy( base, "rotate" );
ADDRLP4 264
INDIRP4
ARGP4
ADDRGP4 $602
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1382
;1382:	}
LABELV $659
line 1384
;1383:
;1384:	return qtrue;
CNSTI4 1
RETI4
LABELV $612
endproc ValidVoteCommand 320 12
export Cmd_CallVote_f
proc Cmd_CallVote_f 2108 16
line 1393
;1385:}
;1386:
;1387:
;1388:/*
;1389:==================
;1390:Cmd_CallVote_f
;1391:==================
;1392:*/
;1393:void Cmd_CallVote_f( gentity_t *ent ) {
line 1398
;1394:	int		i, n;
;1395:	char	arg[MAX_STRING_TOKENS], *argn[4];
;1396:	char	cmd[MAX_STRING_TOKENS], *s;
;1397:
;1398:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $662
line 1399
;1399:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
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
ADDRGP4 $665
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1400
;1400:		return;
ADDRGP4 $661
JUMPV
LABELV $662
line 1403
;1401:	}
;1402:
;1403:	if ( level.voteTime ) {
ADDRGP4 level+872
INDIRI4
CNSTI4 0
EQI4 $666
line 1404
;1404:		trap_SendServerCommand( ent-g_entities, "print \"A vote is already in progress.\n\"" );
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
ADDRGP4 $669
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1405
;1405:		return;
ADDRGP4 $661
JUMPV
LABELV $666
line 1409
;1406:	}
;1407:
;1408:	// if there is still a vote to be executed
;1409:	if ( level.voteExecuteTime || level.restarted ) {
ADDRGP4 level+876
INDIRI4
CNSTI4 0
NEI4 $674
ADDRGP4 level+72
INDIRI4
CNSTI4 0
EQI4 $670
LABELV $674
line 1410
;1410:		trap_SendServerCommand( ent-g_entities, "print \"Previous vote command is waiting execution^1.^7\n\"" );
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
ADDRGP4 $675
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1411
;1411:		return;
ADDRGP4 $661
JUMPV
LABELV $670
line 1414
;1412:	}
;1413:
;1414:	if ( ent->client->pers.voteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 3
LTI4 $676
line 1415
;1415:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of votes.\n\"" );
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
ADDRGP4 $678
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1416
;1416:		return;
ADDRGP4 $661
JUMPV
LABELV $676
line 1418
;1417:	}
;1418:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
NEI4 $679
line 1419
;1419:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
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
ADDRGP4 $681
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1420
;1420:		return;
ADDRGP4 $661
JUMPV
LABELV $679
line 1424
;1421:	}
;1422:
;1423:	// build command buffer
;1424:	arg[ 0 ] = '\0'; s = arg;
ADDRLP4 1052
CNSTI1 0
ASGNI1
ADDRLP4 4
ADDRLP4 1052
ASGNP4
line 1425
;1425:	for ( i = 1; i < trap_Argc(); i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $685
JUMPV
LABELV $682
line 1426
;1426:		if ( arg[ 0 ] )
ADDRLP4 1052
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $686
line 1427
;1427:			s = Q_stradd( s, " " );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $688
ARGP4
ADDRLP4 2076
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2076
INDIRP4
ASGNP4
LABELV $686
line 1428
;1428:		trap_Argv( i, cmd, sizeof( cmd ) );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1429
;1429:		s = Q_stradd( s, cmd );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2080
INDIRP4
ASGNP4
line 1430
;1430:	}
LABELV $683
line 1425
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $685
ADDRLP4 2076
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 2076
INDIRI4
LTI4 $682
line 1433
;1431:
;1432:	// split by ';' seperators
;1433:	n = Com_Split( arg, argn, ARRAY_LEN( argn ), ';' );
ADDRLP4 1052
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 4
ARGI4
CNSTI4 59
ARGI4
ADDRLP4 2080
ADDRGP4 Com_Split
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 2080
INDIRI4
ASGNI4
line 1434
;1434:	if ( n == 0 || *argn[0] == '\0' ) 
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $691
ADDRLP4 1032
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $689
LABELV $691
line 1435
;1435:		return; // empty callvote command?
ADDRGP4 $661
JUMPV
LABELV $689
line 1438
;1436:
;1437:	// validate all split commands
;1438:	for ( i = 0; i < n; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $695
JUMPV
LABELV $692
line 1440
;1439:		// make sure it is a valid command to vote on
;1440:		if ( !ValidVoteCommand( ent - g_entities, argn[i] ) )
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
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
ADDP4
INDIRP4
ARGP4
ADDRLP4 2084
ADDRGP4 ValidVoteCommand
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $696
line 1441
;1441:			return;
ADDRGP4 $661
JUMPV
LABELV $696
line 1442
;1442:	}
LABELV $693
line 1438
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $695
ADDRLP4 0
INDIRI4
ADDRLP4 1048
INDIRI4
LTI4 $692
line 1445
;1443:
;1444:	// rebuild command buffer
;1445:	cmd[0] = '\0';
ADDRLP4 8
CNSTI1 0
ASGNI1
line 1446
;1446:	for ( s = cmd, i = 0; i < n; i++ ) {
ADDRLP4 4
ADDRLP4 8
ASGNP4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $701
JUMPV
LABELV $698
line 1447
;1447:		if ( cmd[0] )
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $702
line 1448
;1448:			s = Q_stradd( s, ";" );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $704
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2084
INDIRP4
ASGNP4
LABELV $702
line 1449
;1449:		s = Q_stradd( s, argn[ i ] );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
ADDP4
INDIRP4
ARGP4
ADDRLP4 2088
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2088
INDIRP4
ASGNP4
line 1450
;1450:	}
LABELV $699
line 1446
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $701
ADDRLP4 0
INDIRI4
ADDRLP4 1048
INDIRI4
LTI4 $698
line 1452
;1451:
;1452:	Com_sprintf( level.voteString, sizeof( level.voteString ), cmd );
ADDRGP4 level+360
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1453
;1453:	Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+616
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $709
ARGP4
ADDRGP4 level+360
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1455
;1454:
;1455:	trap_SendServerCommand( -1, va( "print \"%s called a vote(%s).\n\"", ent->client->pers.netname, cmd ) );
ADDRGP4 $711
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 2084
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2084
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1458
;1456:
;1457:	// start the voting, the caller automatically votes yes
;1458:	level.voteTime = level.time;
ADDRGP4 level+872
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1459
;1459:	level.voteYes = 1;
ADDRGP4 level+880
CNSTI4 1
ASGNI4
line 1460
;1460:	level.voteNo = 0;
ADDRGP4 level+884
CNSTI4 0
ASGNI4
line 1462
;1461:
;1462:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $719
JUMPV
LABELV $716
line 1463
;1463:		level.clients[i].ps.eFlags &= ~EF_VOTED;
ADDRLP4 2088
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2088
INDIRP4
ADDRLP4 2088
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1464
;1464:		level.clients[i].pers.voted = 0;
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 780
ADDP4
CNSTI4 0
ASGNI4
line 1465
;1465:	}
LABELV $717
line 1462
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $719
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $716
line 1467
;1466:
;1467:	ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 2088
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2088
INDIRP4
ADDRLP4 2088
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1468
;1468:	ent->client->pers.voted = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 1
ASGNI4
line 1470
;1469:
;1470:	ent->client->pers.voteCount++;
ADDRLP4 2092
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 768
ADDP4
ASGNP4
ADDRLP4 2092
INDIRP4
ADDRLP4 2092
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1472
;1471:
;1472:	trap_SetConfigstring( CS_VOTE_TIME, va("%i", level.voteTime ) );
ADDRGP4 $721
ARGP4
ADDRGP4 level+872
INDIRI4
ARGI4
ADDRLP4 2096
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 8
ARGI4
ADDRLP4 2096
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1473
;1473:	trap_SetConfigstring( CS_VOTE_STRING, level.voteDisplayString );	
CNSTI4 9
ARGI4
ADDRGP4 level+616
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1474
;1474:	trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $721
ARGP4
ADDRGP4 level+880
INDIRI4
ARGI4
ADDRLP4 2100
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 2100
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1475
;1475:	trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $721
ARGP4
ADDRGP4 level+884
INDIRI4
ARGI4
ADDRLP4 2104
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 2104
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1476
;1476:}
LABELV $661
endproc Cmd_CallVote_f 2108 16
proc Cmd_Vote_f 80 12
line 1484
;1477:
;1478:
;1479:/*
;1480:==================
;1481:Cmd_Vote_f
;1482:==================
;1483:*/
;1484:static void Cmd_Vote_f( gentity_t *ent ) {
line 1487
;1485:	char		msg[64];
;1486:
;1487:	if ( !level.voteTime ) {
ADDRGP4 level+872
INDIRI4
CNSTI4 0
NEI4 $727
line 1488
;1488:		trap_SendServerCommand( ent-g_entities, "print \"No vote in progress.\n\"" );
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
ADDRGP4 $730
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1489
;1489:		return;
ADDRGP4 $726
JUMPV
LABELV $727
line 1492
;1490:	}
;1491:
;1492:	if ( ent->client->pers.voted != 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
CNSTI4 0
EQI4 $731
line 1493
;1493:		trap_SendServerCommand( ent-g_entities, "print \"Vote already cast.\n\"" );
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
ADDRGP4 $733
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1494
;1494:		return;
ADDRGP4 $726
JUMPV
LABELV $731
line 1497
;1495:	}
;1496:
;1497:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
NEI4 $734
line 1498
;1498:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
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
ADDRGP4 $736
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1499
;1499:		return;
ADDRGP4 $726
JUMPV
LABELV $734
line 1502
;1500:	}
;1501:
;1502:	trap_SendServerCommand( ent-g_entities, "print \"Vote cast.\n\"" );
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
ADDRGP4 $737
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1504
;1503:
;1504:	ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1506
;1505:
;1506:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1508
;1507:
;1508:	if ( msg[0] == 'y' || msg[0] == 'Y' || msg[0] == '1' ) {
ADDRLP4 68
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 121
EQI4 $741
ADDRLP4 68
INDIRI4
CNSTI4 89
EQI4 $741
ADDRLP4 68
INDIRI4
CNSTI4 49
NEI4 $738
LABELV $741
line 1509
;1509:		level.voteYes++;
ADDRLP4 72
ADDRGP4 level+880
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1510
;1510:		ent->client->pers.voted = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 1
ASGNI4
line 1511
;1511:		trap_SetConfigstring( CS_VOTE_YES, va( "%i", level.voteYes ) );
ADDRGP4 $721
ARGP4
ADDRGP4 level+880
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1512
;1512:	} else {
ADDRGP4 $739
JUMPV
LABELV $738
line 1513
;1513:		level.voteNo++;
ADDRLP4 72
ADDRGP4 level+884
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1514
;1514:		ent->client->pers.voted = -1;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 -1
ASGNI4
line 1515
;1515:		trap_SetConfigstring( CS_VOTE_NO, va( "%i", level.voteNo ) );	
ADDRGP4 $721
ARGP4
ADDRGP4 level+884
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1516
;1516:	}
LABELV $739
line 1520
;1517:
;1518:	// a majority will be determined in CheckVote, which will also account
;1519:	// for players entering or leaving
;1520:}
LABELV $726
endproc Cmd_Vote_f 80 12
export G_RevertVote
proc G_RevertVote 20 8
line 1523
;1521:
;1522:
;1523:void G_RevertVote( gclient_t *client ) {
line 1524
;1524:	if ( level.voteTime ) {
ADDRGP4 level+872
INDIRI4
CNSTI4 0
EQI4 $747
line 1525
;1525:		if ( client->pers.voted == 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
CNSTI4 1
NEI4 $750
line 1526
;1526:			level.voteYes--;
ADDRLP4 0
ADDRGP4 level+880
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1527
;1527:			client->pers.voted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 0
ASGNI4
line 1528
;1528:			client->ps.eFlags &= ~EF_VOTED;
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
CNSTI4 -16385
BANDI4
ASGNI4
line 1529
;1529:			trap_SetConfigstring( CS_VOTE_YES, va( "%i", level.voteYes ) );
ADDRGP4 $721
ARGP4
ADDRGP4 level+880
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1530
;1530:		} else if ( client->pers.voted == -1 ) {
ADDRGP4 $751
JUMPV
LABELV $750
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $754
line 1531
;1531:			level.voteNo--;
ADDRLP4 0
ADDRGP4 level+884
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1532
;1532:			client->pers.voted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 0
ASGNI4
line 1533
;1533:			client->ps.eFlags &= ~EF_VOTED;
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
CNSTI4 -16385
BANDI4
ASGNI4
line 1534
;1534:			trap_SetConfigstring( CS_VOTE_NO, va( "%i", level.voteNo ) );
ADDRGP4 $721
ARGP4
ADDRGP4 level+884
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1535
;1535:		}
LABELV $754
LABELV $751
line 1536
;1536:	}
LABELV $747
line 1537
;1537:	if ( client->sess.sessionTeam == TEAM_RED || client->sess.sessionTeam == TEAM_BLUE ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 1
EQI4 $760
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 2
NEI4 $758
LABELV $760
line 1539
;1538:		int cs_offset;
;1539:		if ( client->sess.sessionTeam == TEAM_RED )
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 1
NEI4 $761
line 1540
;1540:			cs_offset = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $762
JUMPV
LABELV $761
line 1542
;1541:		else
;1542:			cs_offset = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $762
line 1543
;1543:		if ( client->pers.teamVoted == 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 1
NEI4 $763
line 1544
;1544:			level.teamVoteYes[cs_offset]--;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1545
;1545:			client->pers.teamVoted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 1546
;1546:			client->ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
line 1547
;1547:			trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $721
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1548
;1548:		} else if ( client->pers.teamVoted == -1 ) {
ADDRGP4 $764
JUMPV
LABELV $763
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $767
line 1549
;1549:			level.teamVoteNo[cs_offset]--;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1550
;1550:			client->pers.teamVoted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 1551
;1551:			client->ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
line 1552
;1552:			trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );
ADDRGP4 $721
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1553
;1553:		}
LABELV $767
LABELV $764
line 1554
;1554:	} 
LABELV $758
line 1555
;1555:}
LABELV $746
endproc G_RevertVote 20 8
proc Cmd_CallTeamVote_f 2172 20
line 1563
;1556:
;1557:
;1558:/*
;1559:==================
;1560:Cmd_CallTeamVote_f
;1561:==================
;1562:*/
;1563:static void Cmd_CallTeamVote_f( gentity_t *ent ) {
line 1568
;1564:	int		i, team, cs_offset;
;1565:	char	arg1[MAX_STRING_TOKENS];
;1566:	char	arg2[MAX_STRING_TOKENS];
;1567:
;1568:	team = ent->client->sess.sessionTeam;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ASGNI4
line 1569
;1569:	if ( team == TEAM_RED )
ADDRLP4 1028
INDIRI4
CNSTI4 1
NEI4 $772
line 1570
;1570:		cs_offset = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
ADDRGP4 $773
JUMPV
LABELV $772
line 1571
;1571:	else if ( team == TEAM_BLUE )
ADDRLP4 1028
INDIRI4
CNSTI4 2
NEI4 $771
line 1572
;1572:		cs_offset = 1;
ADDRLP4 1032
CNSTI4 1
ASGNI4
line 1574
;1573:	else
;1574:		return;
LABELV $775
LABELV $773
line 1576
;1575:
;1576:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $776
line 1577
;1577:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
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
ADDRGP4 $665
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1578
;1578:		return;
ADDRGP4 $771
JUMPV
LABELV $776
line 1581
;1579:	}
;1580:
;1581:	if ( level.teamVoteTime[cs_offset] ) {
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
INDIRI4
CNSTI4 0
EQI4 $779
line 1582
;1582:		trap_SendServerCommand( ent-g_entities, "print \"A team vote is already in progress.\n\"" );
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
ADDRGP4 $782
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1583
;1583:		return;
ADDRGP4 $771
JUMPV
LABELV $779
line 1585
;1584:	}
;1585:	if ( ent->client->pers.teamVoteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 772
ADDP4
INDIRI4
CNSTI4 3
LTI4 $783
line 1586
;1586:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of team votes.\n\"" );
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
ADDRGP4 $785
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1587
;1587:		return;
ADDRGP4 $771
JUMPV
LABELV $783
line 1590
;1588:	}
;1589:
;1590:	if ( level.voteExecuteTime || level.restarted ) {
ADDRGP4 level+876
INDIRI4
CNSTI4 0
NEI4 $790
ADDRGP4 level+72
INDIRI4
CNSTI4 0
EQI4 $786
LABELV $790
line 1591
;1591:		return;
ADDRGP4 $771
JUMPV
LABELV $786
line 1594
;1592:	}
;1593:
;1594:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
NEI4 $791
line 1595
;1595:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
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
ADDRGP4 $681
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1596
;1596:		return;
ADDRGP4 $771
JUMPV
LABELV $791
line 1600
;1597:	}
;1598:
;1599:	// make sure it is a valid command to vote on
;1600:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1601
;1601:	arg2[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1602
;1602:	for ( i = 2; i < trap_Argc(); i++ ) {
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 $796
JUMPV
LABELV $793
line 1603
;1603:		if (i > 2)
ADDRLP4 0
INDIRI4
CNSTI4 2
LEI4 $797
line 1604
;1604:			strcat(arg2, " ");
ADDRLP4 4
ARGP4
ADDRGP4 $688
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $797
line 1605
;1605:		trap_Argv( i, &arg2[strlen(arg2)], sizeof( arg2 ) - (int)strlen(arg2) );
ADDRLP4 4
ARGP4
ADDRLP4 2060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2060
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
CNSTU4 1024
ADDRLP4 2064
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1606
;1606:	}
LABELV $794
line 1602
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $796
ADDRLP4 2060
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 2060
INDIRI4
LTI4 $793
line 1608
;1607:
;1608:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) || strchr( arg2, '\n' ) || strchr( arg2, '\r' ) ) {
ADDRLP4 1036
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2064
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2064
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $803
ADDRLP4 4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2068
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2068
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $803
ADDRLP4 4
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 2072
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2072
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $803
ADDRLP4 4
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 2076
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2076
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $799
LABELV $803
line 1609
;1609:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $804
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1610
;1610:		return;
ADDRGP4 $771
JUMPV
LABELV $799
line 1613
;1611:	}
;1612:
;1613:	if ( !Q_stricmp( arg1, "leader" ) ) {
ADDRLP4 1036
ARGP4
ADDRGP4 $807
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $805
line 1616
;1614:		char netname[MAX_NETNAME], leader[MAX_NETNAME];
;1615:
;1616:		if ( !arg2[0] ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $808
line 1617
;1617:			i = ent->client->ps.clientNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 1618
;1618:		}
ADDRGP4 $809
JUMPV
LABELV $808
line 1619
;1619:		else {
line 1621
;1620:			// numeric values are just slot numbers
;1621:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $810
line 1622
;1622:				if ( !arg2[i] || arg2[i] < '0' || arg2[i] > '9' )
ADDRLP4 2156
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2156
INDIRI4
CNSTI4 0
EQI4 $817
ADDRLP4 2156
INDIRI4
CNSTI4 48
LTI4 $817
ADDRLP4 2156
INDIRI4
CNSTI4 57
LEI4 $814
LABELV $817
line 1623
;1623:					break;
ADDRGP4 $812
JUMPV
LABELV $814
line 1624
;1624:			}
LABELV $811
line 1621
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $810
LABELV $812
line 1625
;1625:			if ( i >= 3 || !arg2[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $820
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $818
LABELV $820
line 1626
;1626:				i = atoi( arg2 );
ADDRLP4 4
ARGP4
ADDRLP4 2160
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2160
INDIRI4
ASGNI4
line 1627
;1627:				if ( i < 0 || i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $824
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $821
LABELV $824
line 1628
;1628:					trap_SendServerCommand( ent-g_entities, va("print \"Bad client slot: %i\n\"", i) );
ADDRGP4 $121
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2168
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2168
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1629
;1629:					return;
ADDRGP4 $771
JUMPV
LABELV $821
line 1632
;1630:				}
;1631:
;1632:				if ( !g_entities[i].inuse ) {
ADDRLP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities+1016
ADDP4
INDIRI4
CNSTI4 0
NEI4 $819
line 1633
;1633:					trap_SendServerCommand( ent-g_entities, va("print \"Client %i is not active\n\"", i) );
ADDRGP4 $124
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2168
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2168
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1634
;1634:					return;
ADDRGP4 $771
JUMPV
line 1636
;1635:				}
;1636:			}
LABELV $818
line 1637
;1637:			else {
line 1638
;1638:				Q_strncpyz(leader, arg2, sizeof(leader));
ADDRLP4 2120
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1639
;1639:				Q_CleanStr(leader);
ADDRLP4 2120
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1640
;1640:				for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $831
JUMPV
LABELV $828
line 1641
;1641:					if ( level.clients[i].pers.connected == CON_DISCONNECTED )
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
NEI4 $833
line 1642
;1642:						continue;
ADDRGP4 $829
JUMPV
LABELV $833
line 1643
;1643:					if (level.clients[i].sess.sessionTeam != team)
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
ADDRLP4 1028
INDIRI4
EQI4 $835
line 1644
;1644:						continue;
ADDRGP4 $829
JUMPV
LABELV $835
line 1645
;1645:					Q_strncpyz(netname, level.clients[i].pers.netname, sizeof(netname));
ADDRLP4 2084
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 676
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1646
;1646:					Q_CleanStr(netname);
ADDRLP4 2084
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1647
;1647:					if ( !Q_stricmp(netname, leader) ) {
ADDRLP4 2084
ARGP4
ADDRLP4 2120
ARGP4
ADDRLP4 2160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2160
INDIRI4
CNSTI4 0
NEI4 $837
line 1648
;1648:						break;
ADDRGP4 $830
JUMPV
LABELV $837
line 1650
;1649:					}
;1650:				}
LABELV $829
line 1640
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $831
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $828
LABELV $830
line 1651
;1651:				if ( i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $839
line 1652
;1652:					trap_SendServerCommand( ent-g_entities, va("print \"%s is not a valid player on your team.\n\"", arg2) );
ADDRGP4 $842
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2160
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1653
;1653:					return;
ADDRGP4 $771
JUMPV
LABELV $839
line 1655
;1654:				}
;1655:			}
LABELV $819
line 1656
;1656:		}
LABELV $809
line 1657
;1657:		Com_sprintf(arg2, sizeof(arg2), "%d", i);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $230
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1658
;1658:	} else {
ADDRGP4 $806
JUMPV
LABELV $805
line 1659
;1659:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $804
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1660
;1660:		trap_SendServerCommand( ent-g_entities, "print \"Team vote commands are: leader <player>.\n\"" );
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
ADDRGP4 $843
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1661
;1661:		return;
ADDRGP4 $771
JUMPV
LABELV $806
line 1664
;1662:	}
;1663:
;1664:	Com_sprintf( level.teamVoteString[cs_offset], sizeof( level.teamVoteString[cs_offset] ), "%s %s", arg1, arg2 );
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+892
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $846
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1666
;1665:
;1666:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $850
JUMPV
LABELV $847
line 1667
;1667:		if ( level.clients[i].pers.connected == CON_DISCONNECTED )
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
NEI4 $852
line 1668
;1668:			continue;
ADDRGP4 $848
JUMPV
LABELV $852
line 1669
;1669:		if (level.clients[i].sess.sessionTeam == team)
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
ADDRLP4 1028
INDIRI4
NEI4 $854
line 1670
;1670:			trap_SendServerCommand( i, va("print \"%s called a team vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $856
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 2084
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2084
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $854
line 1671
;1671:	}
LABELV $848
line 1666
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $850
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $847
line 1674
;1672:
;1673:	// start the voting, the caller automatically votes yes
;1674:	level.teamVoteTime[cs_offset] = level.time;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1675
;1675:	level.teamVoteYes[cs_offset] = 1;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
CNSTI4 1
ASGNI4
line 1676
;1676:	level.teamVoteNo[cs_offset] = 0;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
CNSTI4 0
ASGNI4
line 1678
;1677:
;1678:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $864
JUMPV
LABELV $861
line 1679
;1679:		if ( level.clients[i].sess.sessionTeam == team ) {
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
ADDRLP4 1028
INDIRI4
NEI4 $866
line 1680
;1680:			level.clients[i].ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 2084
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2084
INDIRP4
ADDRLP4 2084
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
line 1681
;1681:			level.clients[i].pers.teamVoted = 0;
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 1682
;1682:		}
LABELV $866
line 1683
;1683:	}
LABELV $862
line 1678
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $864
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $861
line 1684
;1684:	ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 2084
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2084
INDIRP4
ADDRLP4 2084
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 1685
;1685:	ent->client->pers.teamVoted = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 1
ASGNI4
line 1687
;1686:
;1687:	ent->client->pers.teamVoteCount++;
ADDRLP4 2088
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ASGNP4
ADDRLP4 2088
INDIRP4
ADDRLP4 2088
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1689
;1688:
;1689:	trap_SetConfigstring( CS_TEAMVOTE_TIME + cs_offset, va("%i", level.teamVoteTime[cs_offset] ) );
ADDRGP4 $721
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
INDIRI4
ARGI4
ADDRLP4 2092
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 12
ADDI4
ARGI4
ADDRLP4 2092
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1690
;1690:	trap_SetConfigstring( CS_TEAMVOTE_STRING + cs_offset, level.teamVoteString[cs_offset] );
ADDRLP4 1032
INDIRI4
CNSTI4 14
ADDI4
ARGI4
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+892
ADDP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1691
;1691:	trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $721
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
INDIRI4
ARGI4
ADDRLP4 2100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 2100
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1692
;1692:	trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );
ADDRGP4 $721
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
INDIRI4
ARGI4
ADDRLP4 2104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 2104
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1693
;1693:}
LABELV $771
endproc Cmd_CallTeamVote_f 2172 20
proc Cmd_TeamVote_f 92 12
line 1701
;1694:
;1695:
;1696:/*
;1697:==================
;1698:Cmd_TeamVote_f
;1699:==================
;1700:*/
;1701:static void Cmd_TeamVote_f( gentity_t *ent ) {
line 1705
;1702:	int			team, cs_offset;
;1703:	char		msg[64];
;1704:
;1705:	team = ent->client->sess.sessionTeam;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ASGNI4
line 1706
;1706:	if ( team == TEAM_RED )
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $873
line 1707
;1707:		cs_offset = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $874
JUMPV
LABELV $873
line 1708
;1708:	else if ( team == TEAM_BLUE )
ADDRLP4 68
INDIRI4
CNSTI4 2
NEI4 $872
line 1709
;1709:		cs_offset = 1;
ADDRLP4 64
CNSTI4 1
ASGNI4
line 1711
;1710:	else
;1711:		return;
LABELV $876
LABELV $874
line 1713
;1712:
;1713:	if ( !level.teamVoteTime[cs_offset] ) {
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
INDIRI4
CNSTI4 0
NEI4 $877
line 1714
;1714:		trap_SendServerCommand( ent-g_entities, "print \"No team vote in progress.\n\"" );
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
ADDRGP4 $880
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1715
;1715:		return;
ADDRGP4 $872
JUMPV
LABELV $877
line 1717
;1716:	}
;1717:	if ( ent->client->pers.teamVoted != 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 0
EQI4 $881
line 1718
;1718:		trap_SendServerCommand( ent-g_entities, "print \"Team vote already cast.\n\"" );
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
ADDRGP4 $883
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1719
;1719:		return;
ADDRGP4 $872
JUMPV
LABELV $881
line 1721
;1720:	}
;1721:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
NEI4 $884
line 1722
;1722:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
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
ADDRGP4 $736
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1723
;1723:		return;
ADDRGP4 $872
JUMPV
LABELV $884
line 1726
;1724:	}
;1725:
;1726:	trap_SendServerCommand( ent-g_entities, "print \"Team vote cast.\n\"" );
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
ADDRGP4 $886
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1728
;1727:
;1728:	ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 72
ADDRFP4 0
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
CNSTI4 524288
BORI4
ASGNI4
line 1729
;1729:	ent->client->pers.teamVoteCount++;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1731
;1730:
;1731:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1733
;1732:
;1733:	if ( msg[0] == 'y' || msg[0] == 'Y' || msg[0] == '1' ) {
ADDRLP4 80
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 121
EQI4 $890
ADDRLP4 80
INDIRI4
CNSTI4 89
EQI4 $890
ADDRLP4 80
INDIRI4
CNSTI4 49
NEI4 $887
LABELV $890
line 1734
;1734:		level.teamVoteYes[cs_offset]++;
ADDRLP4 84
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1735
;1735:		trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $721
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1736
;1736:	} else {
ADDRGP4 $888
JUMPV
LABELV $887
line 1737
;1737:		level.teamVoteNo[cs_offset]++;
ADDRLP4 84
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1738
;1738:		trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );	
ADDRGP4 $721
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1739
;1739:	}
LABELV $888
line 1743
;1740:
;1741:	// a majority will be determined in TeamCheckVote, which will also account
;1742:	// for players entering or leaving
;1743:}
LABELV $872
endproc Cmd_TeamVote_f 92 12
proc Cmd_SetViewpos_f 1060 12
line 1751
;1744:
;1745:
;1746:/*
;1747:=================
;1748:Cmd_SetViewpos_f
;1749:=================
;1750:*/
;1751:static void Cmd_SetViewpos_f( gentity_t *ent ) {
line 1756
;1752:	vec3_t		origin, angles;
;1753:	char		buffer[MAX_TOKEN_CHARS];
;1754:	int			i;
;1755:
;1756:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $896
line 1757
;1757:		trap_SendServerCommand( ent-g_entities, "print \"Cheats are not enabled on this server.\n\"");
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
ADDRGP4 $93
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1758
;1758:		return;
ADDRGP4 $895
JUMPV
LABELV $896
line 1760
;1759:	}
;1760:	if ( trap_Argc() != 5 ) {
ADDRLP4 1052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 5
EQI4 $899
line 1761
;1761:		trap_SendServerCommand( ent-g_entities, "print \"usage: setviewpos x y z yaw\n\"");
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
ADDRGP4 $901
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1762
;1762:		return;
ADDRGP4 $895
JUMPV
LABELV $899
line 1765
;1763:	}
;1764:
;1765:	VectorClear( angles );
ADDRLP4 1040
CNSTF4 0
ASGNF4
ADDRLP4 1040+4
CNSTF4 0
ASGNF4
ADDRLP4 1040+8
CNSTF4 0
ASGNF4
line 1766
;1766:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $904
line 1767
;1767:		trap_Argv( i + 1, buffer, sizeof( buffer ) );
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1768
;1768:		origin[i] = atof( buffer );
ADDRLP4 4
ARGP4
ADDRLP4 1056
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1028
ADDP4
ADDRLP4 1056
INDIRF4
ASGNF4
line 1769
;1769:	}
LABELV $905
line 1766
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $904
line 1771
;1770:
;1771:	trap_Argv( 4, buffer, sizeof( buffer ) );
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1772
;1772:	angles[YAW] = atof( buffer );
ADDRLP4 4
ARGP4
ADDRLP4 1056
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1040+4
ADDRLP4 1056
INDIRF4
ASGNF4
line 1774
;1773:
;1774:	TeleportPlayer( ent, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1040
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 1775
;1775:}
LABELV $895
endproc Cmd_SetViewpos_f 1060 12
proc Cmd_Stats_f 0 0
line 1784
;1776:
;1777:
;1778:
;1779:/*
;1780:=================
;1781:Cmd_Stats_f
;1782:=================
;1783:*/
;1784:static void Cmd_Stats_f( gentity_t *ent ) {
line 1799
;1785:/*
;1786:	int max, n, i;
;1787:
;1788:	max = trap_AAS_PointReachabilityAreaIndex( NULL );
;1789:
;1790:	n = 0;
;1791:	for ( i = 0; i < max; i++ ) {
;1792:		if ( ent->client->areabits[i >> 3] & (1 << (i & 7)) )
;1793:			n++;
;1794:	}
;1795:
;1796:	//trap_SendServerCommand( ent-g_entities, va("print \"visited %d of %d areas\n\"", n, max));
;1797:	trap_SendServerCommand( ent-g_entities, va("print \"%d%% level coverage\n\"", n * 100 / max));
;1798:*/
;1799:}
LABELV $909
endproc Cmd_Stats_f 0 0
export ClientCommand
proc ClientCommand 1152 16
line 1807
;1800:
;1801:
;1802:/*
;1803:=================
;1804:ClientCommand
;1805:=================
;1806:*/
;1807:void ClientCommand( int clientNum ) {
line 1811
;1808:	gentity_t *ent;
;1809:	char	cmd[MAX_TOKEN_CHARS];
;1810:
;1811:	ent = g_entities + clientNum;
ADDRLP4 1024
ADDRFP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1812
;1812:	if ( !ent->client )
ADDRLP4 1024
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $911
line 1813
;1813:		return;
ADDRGP4 $910
JUMPV
LABELV $911
line 1815
;1814:
;1815:	trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1817
;1816:
;1817:	if ( ent->client->pers.connected != CON_CONNECTED ) {
ADDRLP4 1024
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 2
EQI4 $913
line 1818
;1818:		if ( ent->client->pers.connected == CON_CONNECTING && g_gametype.integer >= GT_TEAM ) {
ADDRLP4 1024
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $910
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $910
line 1819
;1819:			if ( Q_stricmp( cmd, "team" ) == 0 && !level.restarted ) {
ADDRLP4 0
ARGP4
ADDRGP4 $920
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $910
ADDRGP4 level+72
INDIRI4
CNSTI4 0
NEI4 $910
line 1820
;1820:				Cmd_Team_f( ent ); // early team override
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Team_f
CALLV
pop
line 1821
;1821:			}
line 1822
;1822:		}
line 1823
;1823:		return; // not fully in game yet
ADDRGP4 $910
JUMPV
LABELV $913
line 1826
;1824:	}
;1825:
;1826:	if (Q_stricmp (cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $924
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $922
line 1827
;1827:		Cmd_Say_f (ent, SAY_ALL, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 1828
;1828:		return;
ADDRGP4 $910
JUMPV
LABELV $922
line 1830
;1829:	}
;1830:	if (Q_stricmp (cmd, "say_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $927
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $925
line 1831
;1831:		Cmd_Say_f (ent, SAY_TEAM, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 1832
;1832:		return;
ADDRGP4 $910
JUMPV
LABELV $925
line 1834
;1833:	}
;1834:	if (Q_stricmp (cmd, "tell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $930
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $928
line 1835
;1835:		Cmd_Tell_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Tell_f
CALLV
pop
line 1836
;1836:		return;
ADDRGP4 $910
JUMPV
LABELV $928
line 1839
;1837:	}
;1838:#if defined MISSIONPACK || defined USE_NEOHUD
;1839:	if (Q_stricmp (cmd, "vsay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $933
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $931
line 1840
;1840:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 1841
;1841:		return;
ADDRGP4 $910
JUMPV
LABELV $931
line 1843
;1842:	}
;1843:	if (Q_stricmp (cmd, "vsay_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $936
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $934
line 1844
;1844:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 1845
;1845:		return;
ADDRGP4 $910
JUMPV
LABELV $934
line 1847
;1846:	}
;1847:	if (Q_stricmp (cmd, "vtell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $506
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $937
line 1848
;1848:		Cmd_VoiceTell_f ( ent, qfalse );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_VoiceTell_f
CALLV
pop
line 1849
;1849:		return;
ADDRGP4 $910
JUMPV
LABELV $937
line 1851
;1850:	}
;1851:	if (Q_stricmp (cmd, "vosay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $941
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $939
line 1852
;1852:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qtrue);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 1853
;1853:		return;
ADDRGP4 $910
JUMPV
LABELV $939
line 1855
;1854:	}
;1855:	if (Q_stricmp (cmd, "vosay_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $944
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $942
line 1856
;1856:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qtrue);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 1857
;1857:		return;
ADDRGP4 $910
JUMPV
LABELV $942
line 1859
;1858:	}
;1859:	if (Q_stricmp (cmd, "votell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $947
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $945
line 1860
;1860:		Cmd_VoiceTell_f ( ent, qtrue );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_VoiceTell_f
CALLV
pop
line 1861
;1861:		return;
ADDRGP4 $910
JUMPV
LABELV $945
line 1863
;1862:	}
;1863:	if (Q_stricmp (cmd, "vtaunt") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $950
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $948
line 1864
;1864:		Cmd_VoiceTaunt_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_VoiceTaunt_f
CALLV
pop
line 1865
;1865:		return;
ADDRGP4 $910
JUMPV
LABELV $948
line 1868
;1866:	}
;1867:#endif
;1868:	if (Q_stricmp (cmd, "score") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $284
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $951
line 1869
;1869:		Cmd_Score_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 1870
;1870:		return;
ADDRGP4 $910
JUMPV
LABELV $951
line 1874
;1871:	}
;1872:
;1873:	// ignore all other commands when at intermission
;1874:	if (level.intermissiontime) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $953
line 1875
;1875:		Cmd_Say_f (ent, qfalse, qtrue);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 1876
;1876:		return;
ADDRGP4 $910
JUMPV
LABELV $953
line 1879
;1877:	}
;1878:
;1879:	if (Q_stricmp (cmd, "give") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $958
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $956
line 1880
;1880:		Cmd_Give_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Give_f
CALLV
pop
ADDRGP4 $957
JUMPV
LABELV $956
line 1881
;1881:	else if (Q_stricmp (cmd, "god") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $961
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $959
line 1882
;1882:		Cmd_God_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_God_f
CALLV
pop
ADDRGP4 $960
JUMPV
LABELV $959
line 1883
;1883:	else if (Q_stricmp (cmd, "notarget") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $964
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $962
line 1884
;1884:		Cmd_Notarget_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Notarget_f
CALLV
pop
ADDRGP4 $963
JUMPV
LABELV $962
line 1885
;1885:	else if (Q_stricmp (cmd, "noclip") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $967
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $965
line 1886
;1886:		Cmd_Noclip_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Noclip_f
CALLV
pop
ADDRGP4 $966
JUMPV
LABELV $965
line 1887
;1887:	else if (Q_stricmp (cmd, "kill") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $970
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $968
line 1888
;1888:		Cmd_Kill_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Kill_f
CALLV
pop
ADDRGP4 $969
JUMPV
LABELV $968
line 1889
;1889:	else if (Q_stricmp (cmd, "teamtask") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $229
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $971
line 1890
;1890:		Cmd_TeamTask_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamTask_f
CALLV
pop
ADDRGP4 $972
JUMPV
LABELV $971
line 1891
;1891:	else if (Q_stricmp (cmd, "levelshot") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $975
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $973
line 1892
;1892:		Cmd_LevelShot_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_LevelShot_f
CALLV
pop
ADDRGP4 $974
JUMPV
LABELV $973
line 1893
;1893:	else if (Q_stricmp (cmd, "follow") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $978
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $976
line 1894
;1894:		Cmd_Follow_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Follow_f
CALLV
pop
ADDRGP4 $977
JUMPV
LABELV $976
line 1895
;1895:	else if (Q_stricmp (cmd, "follownext") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $981
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $979
line 1896
;1896:		Cmd_FollowCycle_f (ent, 1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $980
JUMPV
LABELV $979
line 1897
;1897:	else if (Q_stricmp (cmd, "followprev") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $984
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $982
line 1898
;1898:		Cmd_FollowCycle_f (ent, -1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $983
JUMPV
LABELV $982
line 1899
;1899:	else if (Q_stricmp (cmd, "team") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $920
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $985
line 1900
;1900:		Cmd_Team_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Team_f
CALLV
pop
ADDRGP4 $986
JUMPV
LABELV $985
line 1901
;1901:	else if (Q_stricmp (cmd, "where") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $989
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $987
line 1902
;1902:		Cmd_Where_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Where_f
CALLV
pop
ADDRGP4 $988
JUMPV
LABELV $987
line 1903
;1903:	else if (Q_stricmp (cmd, "callvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $992
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $990
line 1904
;1904:		Cmd_CallVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallVote_f
CALLV
pop
ADDRGP4 $991
JUMPV
LABELV $990
line 1905
;1905:	else if (Q_stricmp (cmd, "vote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $995
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $993
line 1906
;1906:		Cmd_Vote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Vote_f
CALLV
pop
ADDRGP4 $994
JUMPV
LABELV $993
line 1907
;1907:	else if (Q_stricmp (cmd, "callteamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $998
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $996
line 1908
;1908:		Cmd_CallTeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallTeamVote_f
CALLV
pop
ADDRGP4 $997
JUMPV
LABELV $996
line 1909
;1909:	else if (Q_stricmp (cmd, "teamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1001
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $999
line 1910
;1910:		Cmd_TeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamVote_f
CALLV
pop
ADDRGP4 $1000
JUMPV
LABELV $999
line 1911
;1911:	else if (Q_stricmp (cmd, "gc") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1004
ARGP4
ADDRLP4 1136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $1002
line 1912
;1912:		Cmd_GameCommand_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_GameCommand_f
CALLV
pop
ADDRGP4 $1003
JUMPV
LABELV $1002
line 1913
;1913:	else if (Q_stricmp (cmd, "setviewpos") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1007
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $1005
line 1914
;1914:		Cmd_SetViewpos_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SetViewpos_f
CALLV
pop
ADDRGP4 $1006
JUMPV
LABELV $1005
line 1915
;1915:	else if (Q_stricmp (cmd, "stats") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1010
ARGP4
ADDRLP4 1144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
NEI4 $1008
line 1916
;1916:		Cmd_Stats_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Stats_f
CALLV
pop
ADDRGP4 $1009
JUMPV
LABELV $1008
line 1918
;1917:	else
;1918:		trap_SendServerCommand( clientNum, va( "print \"unknown cmd %s\n\"", cmd ) );
ADDRGP4 $1011
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1148
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $1009
LABELV $1006
LABELV $1003
LABELV $1000
LABELV $997
LABELV $994
LABELV $991
LABELV $988
LABELV $986
LABELV $983
LABELV $980
LABELV $977
LABELV $974
LABELV $972
LABELV $969
LABELV $966
LABELV $963
LABELV $960
LABELV $957
line 1919
;1919:}
LABELV $910
endproc ClientCommand 1152 16
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
LABELV $1011
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1010
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1007
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $1004
byte 1 103
byte 1 99
byte 1 0
align 1
LABELV $1001
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $998
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $995
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $992
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $989
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $984
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $981
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $978
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $975
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $970
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $967
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $964
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $961
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $958
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $950
byte 1 118
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $947
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $944
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $941
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $936
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $933
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $930
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $927
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $924
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $920
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $901
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 32
byte 1 120
byte 1 32
byte 1 121
byte 1 32
byte 1 122
byte 1 32
byte 1 121
byte 1 97
byte 1 119
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $886
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $883
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $880
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $856
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $846
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $843
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 62
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $842
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $807
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $804
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $785
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $782
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 65
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $737
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $736
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $733
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $730
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $721
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $711
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $709
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $704
byte 1 59
byte 1 0
align 1
LABELV $688
byte 1 32
byte 1 0
align 1
LABELV $681
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $678
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $675
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 80
byte 1 114
byte 1 101
byte 1 118
byte 1 105
byte 1 111
byte 1 117
byte 1 115
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 117
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 94
byte 1 49
byte 1 46
byte 1 94
byte 1 55
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $669
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 65
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $665
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $658
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 115
byte 1 117
byte 1 99
byte 1 104
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $653
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $652
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $647
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $644
byte 1 116
byte 1 100
byte 1 109
byte 1 0
align 1
LABELV $641
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $638
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $633
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 10
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 60
byte 1 110
byte 1 124
byte 1 102
byte 1 102
byte 1 97
byte 1 124
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 124
byte 1 116
byte 1 100
byte 1 109
byte 1 124
byte 1 99
byte 1 116
byte 1 102
byte 1 62
byte 1 10
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 60
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 44
byte 1 32
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 91
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 93
byte 1 44
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 62
byte 1 44
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 60
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 110
byte 1 117
byte 1 109
byte 1 62
byte 1 10
byte 1 32
byte 1 103
byte 1 95
byte 1 117
byte 1 110
byte 1 108
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 60
byte 1 48
byte 1 124
byte 1 49
byte 1 62
byte 1 44
byte 1 32
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 32
byte 1 60
byte 1 45
byte 1 49
byte 1 124
byte 1 48
byte 1 124
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 62
byte 1 10
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 60
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 62
byte 1 44
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 60
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 62
byte 1 44
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 60
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 115
byte 1 62
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $617
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $611
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $610
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $609
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $608
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $607
byte 1 103
byte 1 95
byte 1 117
byte 1 110
byte 1 108
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $606
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $605
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $604
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $603
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $602
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $601
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $600
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $599
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $592
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $591
byte 1 115
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 0
align 1
LABELV $590
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $589
byte 1 99
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $588
byte 1 99
byte 1 111
byte 1 109
byte 1 101
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $587
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $586
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $585
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $582
byte 1 112
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $565
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $560
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $549
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $539
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $518
byte 1 118
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $508
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $507
byte 1 118
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $506
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $503
byte 1 118
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $486
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $466
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $460
byte 1 25
byte 1 91
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 93
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $459
byte 1 25
byte 1 91
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 93
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $454
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $453
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 41
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $450
byte 1 115
byte 1 97
byte 1 121
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $448
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $447
byte 1 115
byte 1 97
byte 1 121
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $436
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $435
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $434
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $406
byte 1 67
byte 1 109
byte 1 100
byte 1 95
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 67
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 95
byte 1 102
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 100
byte 1 105
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $375
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 97
byte 1 121
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 32
byte 1 53
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $370
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $368
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $366
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $364
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $295
byte 1 115
byte 1 0
align 1
LABELV $294
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $291
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 50
byte 1 0
align 1
LABELV $288
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 49
byte 1 0
align 1
LABELV $284
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $283
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
LABELV $277
byte 1 98
byte 1 0
align 1
LABELV $276
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $272
byte 1 114
byte 1 0
align 1
LABELV $271
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $264
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $259
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $248
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $245
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $242
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 94
byte 1 52
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 94
byte 1 55
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $239
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 94
byte 1 49
byte 1 114
byte 1 101
byte 1 100
byte 1 94
byte 1 55
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $230
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $229
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
LABELV $225
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 76
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $224
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $221
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 48
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $211
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $210
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $204
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $203
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $197
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $196
byte 1 103
byte 1 111
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $195
byte 1 103
byte 1 111
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $183
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $180
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $177
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 97
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $174
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $171
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $165
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $155
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $149
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $143
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $140
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $134
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $124
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $121
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $96
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $93
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
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
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $83
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $76
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $56
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
