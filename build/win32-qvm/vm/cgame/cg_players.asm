data
align 4
LABELV cg_customSoundNames
address $87
address $88
address $89
address $90
address $91
address $92
address $93
address $94
address $95
address $96
address $97
address $98
address $99
skip 76
export CG_CustomSound
code
proc CG_CustomSound 16 8
file "..\..\..\..\code\cgame\cg_players.c"
line 43
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_players.c -- handle the media and animation for player entities
;4:#include "cg_local.h"
;5:
;6:#ifdef USE_VR
;7:#include "../../../Quake3e-master/code/vrmod/VRMOD_input.h"
;8:extern vmCvar_t	cg_firstPersonBodyScale;
;9:
;10:#include "vr_helper.h"
;11:
;12:#endif
;13:
;14:#ifdef USE_NATIVE_HACK
;15:extern vr_clientinfo_t* vrinfo;
;16:#endif
;17:
;18:#define	PM_SKIN "pm"
;19:
;20:static const char *cg_customSoundNames[ MAX_CUSTOM_SOUNDS ] = {
;21:	"*death1.wav",
;22:	"*death2.wav",
;23:	"*death3.wav",
;24:	"*jump1.wav",
;25:	"*pain25_1.wav",
;26:	"*pain50_1.wav",
;27:	"*pain75_1.wav",
;28:	"*pain100_1.wav",
;29:	"*falling1.wav",
;30:	"*gasp.wav",
;31:	"*drown.wav",
;32:	"*fall1.wav",
;33:	"*taunt.wav"
;34:};
;35:
;36:
;37:/*
;38:================
;39:CG_CustomSound
;40:
;41:================
;42:*/
;43:sfxHandle_t	CG_CustomSound( int clientNum, const char *soundName ) {
line 47
;44:	clientInfo_t *ci;
;45:	int			i;
;46:
;47:	if ( soundName[0] != '*' ) {
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $101
line 48
;48:		return trap_S_RegisterSound( soundName, qfalse );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $100
JUMPV
LABELV $101
line 51
;49:	}
;50:
;51:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $105
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $103
LABELV $105
line 52
;52:		clientNum = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 53
;53:	}
LABELV $103
line 54
;54:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ASGNP4
line 56
;55:
;56:	for ( i = 0 ; i < MAX_CUSTOM_SOUNDS && cg_customSoundNames[i] ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $110
JUMPV
LABELV $107
line 57
;57:		if ( !strcmp( soundName, cg_customSoundNames[i] ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $111
line 58
;58:			return ci->sounds[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
INDIRI4
RETI4
ADDRGP4 $100
JUMPV
LABELV $111
line 60
;59:		}
;60:	}
LABELV $108
line 56
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $110
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $113
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $107
LABELV $113
line 62
;61:
;62:	CG_Error( "Unknown custom sound: %s", soundName );
ADDRGP4 $114
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 63
;63:	return 0;
CNSTI4 0
RETI4
LABELV $100
endproc CG_CustomSound 16 8
proc CG_ParseAnimationFile 20076 12
line 84
;64:}
;65:
;66:
;67:
;68:/*
;69:=============================================================================
;70:
;71:CLIENT INFO
;72:
;73:=============================================================================
;74:*/
;75:
;76:/*
;77:======================
;78:CG_ParseAnimationFile
;79:
;80:Read a configuration file containing animation counts and rates
;81:models/players/visor/animation.cfg, etc
;82:======================
;83:*/
;84:static qboolean	CG_ParseAnimationFile( const char *filename, clientInfo_t *ci ) {
line 95
;85:	char		*text_p, *prev;
;86:	int			len;
;87:	int			i;
;88:	char		*token;
;89:	float		fps;
;90:	int			skip;
;91:	char		text[20000];
;92:	fileHandle_t	f;
;93:	animation_t *animations;
;94:
;95:	animations = ci->animations;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 448
ADDP4
ASGNP4
line 98
;96:
;97:	// load the file
;98:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20036
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 20036
INDIRI4
ASGNI4
line 99
;99:	if ( f == FS_INVALID_HANDLE ) {
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $116
line 100
;100:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $115
JUMPV
LABELV $116
line 102
;101:	}
;102:	if ( len <= 0 ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
GTI4 $118
line 103
;103:		trap_FS_FCloseFile( f );
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 104
;104:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $115
JUMPV
LABELV $118
line 106
;105:	}
;106:	if ( len >= sizeof( text ) - 1 ) {
ADDRLP4 28
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $120
line 107
;107:		CG_Printf( "File %s too long\n", filename );
ADDRGP4 $122
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 108
;108:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $115
JUMPV
LABELV $120
line 110
;109:	}
;110:	trap_FS_Read( text, len, f );
ADDRLP4 36
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 111
;111:	text[len] = '\0';
ADDRLP4 28
INDIRI4
ADDRLP4 36
ADDP4
CNSTI1 0
ASGNI1
line 112
;112:	trap_FS_FCloseFile( f );
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 115
;113:
;114:	// parse the text
;115:	text_p = text;
ADDRLP4 12
ADDRLP4 36
ASGNP4
line 116
;116:	skip = 0;	// quite the compiler warning
ADDRLP4 24
CNSTI4 0
ASGNI4
line 118
;117:
;118:	ci->footsteps = FOOTSTEP_NORMAL;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 0
ASGNI4
line 119
;119:	VectorClear( ci->headOffset );
ADDRFP4 4
INDIRP4
CNSTI4 400
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 404
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
CNSTF4 0
ASGNF4
line 120
;120:	ci->gender = GENDER_MALE;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 121
;121:	ci->fixedlegs = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 392
ADDP4
CNSTI4 0
ASGNI4
line 122
;122:	ci->fixedtorso = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $124
JUMPV
LABELV $123
line 125
;123:
;124:	// read optional parameters
;125:	while ( 1 ) {
line 126
;126:		prev = text_p;	// so we can unget
ADDRLP4 20
ADDRLP4 12
INDIRP4
ASGNP4
line 127
;127:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20040
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20040
INDIRP4
ASGNP4
line 128
;128:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $126
line 129
;129:			break;
ADDRGP4 $125
JUMPV
LABELV $126
line 131
;130:		}
;131:		if ( !Q_stricmp( token, "footsteps" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $130
ARGP4
ADDRLP4 20044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20044
INDIRI4
CNSTI4 0
NEI4 $128
line 132
;132:			token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20048
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20048
INDIRP4
ASGNP4
line 133
;133:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $131
line 134
;134:				break;
ADDRGP4 $125
JUMPV
LABELV $131
line 136
;135:			}
;136:			if ( !Q_stricmp( token, "default" ) || !Q_stricmp( token, "normal" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 20052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20052
INDIRI4
CNSTI4 0
EQI4 $137
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $136
ARGP4
ADDRLP4 20056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20056
INDIRI4
CNSTI4 0
NEI4 $133
LABELV $137
line 137
;137:				ci->footsteps = FOOTSTEP_NORMAL;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 0
ASGNI4
line 138
;138:			} else if ( !Q_stricmp( token, "boot" ) ) {
ADDRGP4 $124
JUMPV
LABELV $133
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $140
ARGP4
ADDRLP4 20060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 0
NEI4 $138
line 139
;139:				ci->footsteps = FOOTSTEP_BOOT;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 1
ASGNI4
line 140
;140:			} else if ( !Q_stricmp( token, "flesh" ) ) {
ADDRGP4 $124
JUMPV
LABELV $138
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $143
ARGP4
ADDRLP4 20064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 0
NEI4 $141
line 141
;141:				ci->footsteps = FOOTSTEP_FLESH;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 2
ASGNI4
line 142
;142:			} else if ( !Q_stricmp( token, "mech" ) ) {
ADDRGP4 $124
JUMPV
LABELV $141
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 20068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20068
INDIRI4
CNSTI4 0
NEI4 $144
line 143
;143:				ci->footsteps = FOOTSTEP_MECH;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 3
ASGNI4
line 144
;144:			} else if ( !Q_stricmp( token, "energy" ) ) {
ADDRGP4 $124
JUMPV
LABELV $144
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $149
ARGP4
ADDRLP4 20072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20072
INDIRI4
CNSTI4 0
NEI4 $147
line 145
;145:				ci->footsteps = FOOTSTEP_ENERGY;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 4
ASGNI4
line 146
;146:			} else {
ADDRGP4 $124
JUMPV
LABELV $147
line 147
;147:				CG_Printf( "Bad footsteps parm in %s: %s\n", filename, token );
ADDRGP4 $150
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 148
;148:			}
line 149
;149:			continue;
ADDRGP4 $124
JUMPV
LABELV $128
line 150
;150:		} else if ( !Q_stricmp( token, "headoffset" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $153
ARGP4
ADDRLP4 20048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20048
INDIRI4
CNSTI4 0
NEI4 $151
line 151
;151:			for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $154
line 152
;152:				token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20052
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20052
INDIRP4
ASGNP4
line 153
;153:				if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $158
line 154
;154:					break;
ADDRGP4 $124
JUMPV
LABELV $158
line 156
;155:				}
;156:				ci->headOffset[i] = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20056
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 400
ADDP4
ADDP4
ADDRLP4 20056
INDIRF4
ASGNF4
line 157
;157:			}
LABELV $155
line 151
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $154
line 158
;158:			continue;
ADDRGP4 $124
JUMPV
LABELV $151
line 159
;159:		} else if ( !Q_stricmp( token, "sex" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $162
ARGP4
ADDRLP4 20052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20052
INDIRI4
CNSTI4 0
NEI4 $160
line 160
;160:			token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20056
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20056
INDIRP4
ASGNP4
line 161
;161:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $163
line 162
;162:				break;
ADDRGP4 $125
JUMPV
LABELV $163
line 164
;163:			}
;164:			if ( token[0] == 'f' || token[0] == 'F' ) {
ADDRLP4 20060
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 102
EQI4 $167
ADDRLP4 20060
INDIRI4
CNSTI4 70
NEI4 $165
LABELV $167
line 165
;165:				ci->gender = GENDER_FEMALE;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 1
ASGNI4
line 166
;166:			} else if ( token[0] == 'n' || token[0] == 'N' ) {
ADDRGP4 $124
JUMPV
LABELV $165
ADDRLP4 20064
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 110
EQI4 $170
ADDRLP4 20064
INDIRI4
CNSTI4 78
NEI4 $168
LABELV $170
line 167
;167:				ci->gender = GENDER_NEUTER;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 2
ASGNI4
line 168
;168:			} else {
ADDRGP4 $124
JUMPV
LABELV $168
line 169
;169:				ci->gender = GENDER_MALE;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 170
;170:			}
line 171
;171:			continue;
ADDRGP4 $124
JUMPV
LABELV $160
line 172
;172:		} else if ( !Q_stricmp( token, "fixedlegs" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $173
ARGP4
ADDRLP4 20056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20056
INDIRI4
CNSTI4 0
NEI4 $171
line 173
;173:			ci->fixedlegs = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 392
ADDP4
CNSTI4 1
ASGNI4
line 174
;174:			continue;
ADDRGP4 $124
JUMPV
LABELV $171
line 175
;175:		} else if ( !Q_stricmp( token, "fixedtorso" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $176
ARGP4
ADDRLP4 20060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 0
NEI4 $174
line 176
;176:			ci->fixedtorso = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 1
ASGNI4
line 177
;177:			continue;
ADDRGP4 $124
JUMPV
LABELV $174
line 181
;178:		}
;179:
;180:		// if it is a number, start parsing animations
;181:		if ( token[0] >= '0' && token[0] <= '9' ) {
ADDRLP4 20064
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 48
LTI4 $177
ADDRLP4 20064
INDIRI4
CNSTI4 57
GTI4 $177
line 182
;182:			text_p = prev;	// unget the token
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 183
;183:			break;
ADDRGP4 $125
JUMPV
LABELV $177
line 185
;184:		}
;185:		Com_Printf( "unknown token '%s' in %s\n", token, filename );
ADDRGP4 $179
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 186
;186:	}
LABELV $124
line 125
ADDRGP4 $123
JUMPV
LABELV $125
line 189
;187:
;188:	// read information for each frame
;189:	for ( i = 0 ; i < MAX_ANIMATIONS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $180
line 191
;190:
;191:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20040
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20040
INDIRP4
ASGNP4
line 192
;192:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $184
line 193
;193:			if( i >= TORSO_GETFLAG && i <= TORSO_NEGATIVE ) {
ADDRLP4 4
INDIRI4
CNSTI4 25
LTI4 $182
ADDRLP4 4
INDIRI4
CNSTI4 30
GTI4 $182
line 194
;194:				animations[i].firstFrame = animations[TORSO_GESTURE].firstFrame;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 195
;195:				animations[i].frameLerp = animations[TORSO_GESTURE].frameLerp;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 196
;196:				animations[i].initialLerp = animations[TORSO_GESTURE].initialLerp;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 16
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 197
;197:				animations[i].loopFrames = animations[TORSO_GESTURE].loopFrames;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ASGNI4
line 198
;198:				animations[i].numFrames = animations[TORSO_GESTURE].numFrames;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 199
;199:				animations[i].reversed = qfalse;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 200
;200:				animations[i].flipflop = qfalse;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 201
;201:				continue;
ADDRGP4 $181
JUMPV
line 203
;202:			}
;203:			break;
LABELV $184
line 205
;204:		}
;205:		animations[i].firstFrame = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 20044
INDIRI4
ASGNI4
line 207
;206:		// leg only frames are adjusted to not count the upper body only frames
;207:		if ( i == LEGS_WALKCR ) {
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $188
line 208
;208:			skip = animations[LEGS_WALKCR].firstFrame - animations[TORSO_GESTURE].firstFrame;
ADDRLP4 24
ADDRLP4 8
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
SUBI4
ASGNI4
line 209
;209:		}
LABELV $188
line 210
;210:		if ( i >= LEGS_WALKCR && i<TORSO_GETFLAG) {
ADDRLP4 4
INDIRI4
CNSTI4 13
LTI4 $190
ADDRLP4 4
INDIRI4
CNSTI4 25
GEI4 $190
line 211
;211:			animations[i].firstFrame -= skip;
ADDRLP4 20052
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ASGNP4
ADDRLP4 20052
INDIRP4
ADDRLP4 20052
INDIRP4
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 212
;212:		}
LABELV $190
line 214
;213:
;214:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20052
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20052
INDIRP4
ASGNP4
line 215
;215:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $192
line 216
;216:			break;
ADDRGP4 $182
JUMPV
LABELV $192
line 218
;217:		}
;218:		animations[i].numFrames = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20056
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 20056
INDIRI4
ASGNI4
line 220
;219:
;220:		animations[i].reversed = qfalse;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 221
;221:		animations[i].flipflop = qfalse;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 223
;222:		// if numFrames is negative the animation is reversed
;223:		if (animations[i].numFrames < 0) {
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
GEI4 $194
line 224
;224:			animations[i].numFrames = -animations[i].numFrames;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
NEGI4
ASGNI4
line 225
;225:			animations[i].reversed = qtrue;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 1
ASGNI4
line 226
;226:		}
LABELV $194
line 228
;227:
;228:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20060
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20060
INDIRP4
ASGNP4
line 229
;229:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $196
line 230
;230:			break;
ADDRGP4 $182
JUMPV
LABELV $196
line 232
;231:		}
;232:		animations[i].loopFrames = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20064
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 20064
INDIRI4
ASGNI4
line 234
;233:
;234:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20068
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20068
INDIRP4
ASGNP4
line 235
;235:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $198
line 236
;236:			break;
ADDRGP4 $182
JUMPV
LABELV $198
line 238
;237:		}
;238:		fps = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20072
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 20072
INDIRF4
ASGNF4
line 239
;239:		if ( fps == 0 ) {
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $200
line 240
;240:			fps = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 241
;241:		}
LABELV $200
line 242
;242:		animations[i].frameLerp = 1000 / fps;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 12
ADDP4
CNSTF4 1148846080
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 243
;243:		animations[i].initialLerp = 1000 / fps;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 16
ADDP4
CNSTF4 1148846080
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 244
;244:	}
LABELV $181
line 189
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 31
LTI4 $180
LABELV $182
line 246
;245:
;246:	if ( i != MAX_ANIMATIONS ) {
ADDRLP4 4
INDIRI4
CNSTI4 31
EQI4 $202
line 247
;247:		CG_Printf( "Error parsing animation file: %s\n", filename );
ADDRGP4 $204
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 248
;248:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $115
JUMPV
LABELV $202
line 252
;249:	}
;250:
;251:	// crouch backward animation
;252:	memcpy(&animations[LEGS_BACKCR], &animations[LEGS_WALKCR], sizeof(animation_t));
ADDRLP4 8
INDIRP4
CNSTI4 896
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 364
ADDP4
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 253
;253:	animations[LEGS_BACKCR].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 916
ADDP4
CNSTI4 1
ASGNI4
line 255
;254:	// walk backward animation
;255:	memcpy(&animations[LEGS_BACKWALK], &animations[LEGS_WALK], sizeof(animation_t));
ADDRLP4 8
INDIRP4
CNSTI4 924
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 392
ADDP4
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 256
;256:	animations[LEGS_BACKWALK].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 944
ADDP4
CNSTI4 1
ASGNI4
line 258
;257:	// flag moving fast
;258:	animations[FLAG_RUN].firstFrame = 0;
ADDRLP4 8
INDIRP4
CNSTI4 952
ADDP4
CNSTI4 0
ASGNI4
line 259
;259:	animations[FLAG_RUN].numFrames = 16;
ADDRLP4 8
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 16
ASGNI4
line 260
;260:	animations[FLAG_RUN].loopFrames = 16;
ADDRLP4 8
INDIRP4
CNSTI4 960
ADDP4
CNSTI4 16
ASGNI4
line 261
;261:	animations[FLAG_RUN].frameLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 964
ADDP4
CNSTI4 66
ASGNI4
line 262
;262:	animations[FLAG_RUN].initialLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 968
ADDP4
CNSTI4 66
ASGNI4
line 263
;263:	animations[FLAG_RUN].reversed = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 972
ADDP4
CNSTI4 0
ASGNI4
line 265
;264:	// flag not moving or moving slowly
;265:	animations[FLAG_STAND].firstFrame = 16;
ADDRLP4 8
INDIRP4
CNSTI4 980
ADDP4
CNSTI4 16
ASGNI4
line 266
;266:	animations[FLAG_STAND].numFrames = 5;
ADDRLP4 8
INDIRP4
CNSTI4 984
ADDP4
CNSTI4 5
ASGNI4
line 267
;267:	animations[FLAG_STAND].loopFrames = 0;
ADDRLP4 8
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 268
;268:	animations[FLAG_STAND].frameLerp = 1000 / 20;
ADDRLP4 8
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 50
ASGNI4
line 269
;269:	animations[FLAG_STAND].initialLerp = 1000 / 20;
ADDRLP4 8
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 50
ASGNI4
line 270
;270:	animations[FLAG_STAND].reversed = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 1000
ADDP4
CNSTI4 0
ASGNI4
line 272
;271:	// flag speeding up
;272:	animations[FLAG_STAND2RUN].firstFrame = 16;
ADDRLP4 8
INDIRP4
CNSTI4 1008
ADDP4
CNSTI4 16
ASGNI4
line 273
;273:	animations[FLAG_STAND2RUN].numFrames = 5;
ADDRLP4 8
INDIRP4
CNSTI4 1012
ADDP4
CNSTI4 5
ASGNI4
line 274
;274:	animations[FLAG_STAND2RUN].loopFrames = 1;
ADDRLP4 8
INDIRP4
CNSTI4 1016
ADDP4
CNSTI4 1
ASGNI4
line 275
;275:	animations[FLAG_STAND2RUN].frameLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 1020
ADDP4
CNSTI4 66
ASGNI4
line 276
;276:	animations[FLAG_STAND2RUN].initialLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 1024
ADDP4
CNSTI4 66
ASGNI4
line 277
;277:	animations[FLAG_STAND2RUN].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 1028
ADDP4
CNSTI4 1
ASGNI4
line 287
;278:	//
;279:	// new anims changes
;280:	//
;281://	animations[TORSO_GETFLAG].flipflop = qtrue;
;282://	animations[TORSO_GUARDBASE].flipflop = qtrue;
;283://	animations[TORSO_PATROL].flipflop = qtrue;
;284://	animations[TORSO_AFFIRMATIVE].flipflop = qtrue;
;285://	animations[TORSO_NEGATIVE].flipflop = qtrue;
;286:	//
;287:	return qtrue;
CNSTI4 1
RETI4
LABELV $115
endproc CG_ParseAnimationFile 20076 12
proc CG_FileExists 12 12
line 296
;288:}
;289:
;290:
;291:/*
;292:==========================
;293:CG_FileExists
;294:==========================
;295:*/
;296:static qboolean	CG_FileExists( const char *filename ) {
line 300
;297:	int len;
;298:	fileHandle_t	f;
;299:
;300:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 302
;301:
;302:	if ( f != FS_INVALID_HANDLE ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $206
line 303
;303:		trap_FS_FCloseFile( f );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 304
;304:	}
LABELV $206
line 306
;305:
;306:	if ( len > 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $208
line 307
;307:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $205
JUMPV
LABELV $208
line 310
;308:	}
;309:
;310:	return qfalse;
CNSTI4 0
RETI4
LABELV $205
endproc CG_FileExists 12 12
proc CG_FindClientModelFile 36 40
line 319
;311:}
;312:
;313:
;314:/*
;315:==========================
;316:CG_FindClientModelFile
;317:==========================
;318:*/
;319:static qboolean	CG_FindClientModelFile( char *filename, int length, clientInfo_t *ci, const char *teamName, const char *modelName, const char *skinName, const char *base, const char *ext ) {
line 323
;320:	char *team, *charactersFolder;
;321:	int i;
;322:
;323:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
LTI4 $211
line 324
;324:		switch ( ci->team ) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $217
ADDRGP4 $214
JUMPV
LABELV $217
line 325
;325:			case TEAM_BLUE: {
line 326
;326:				team = "blue";
ADDRLP4 8
ADDRGP4 $218
ASGNP4
line 327
;327:				break;
ADDRGP4 $212
JUMPV
LABELV $214
line 329
;328:			}
;329:			default: {
line 330
;330:				team = "red";
ADDRLP4 8
ADDRGP4 $219
ASGNP4
line 331
;331:				break;
line 334
;332:			}
;333:		}
;334:	}
ADDRGP4 $212
JUMPV
LABELV $211
line 335
;335:	else {
line 336
;336:		team = "default";
ADDRLP4 8
ADDRGP4 $135
ASGNP4
line 337
;337:	}
LABELV $212
line 340
;338:
;339:	// colored skins
;340:	if ( ci->coloredSkin && !Q_stricmp( ci->skinName, PM_SKIN ) ) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $220
ADDRLP4 12
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRGP4 $222
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $220
line 341
;341:		team = PM_SKIN;
ADDRLP4 8
ADDRGP4 $222
ASGNP4
line 342
;342:	}
LABELV $220
line 344
;343:
;344:	charactersFolder = "";
ADDRLP4 4
ADDRGP4 $223
ASGNP4
ADDRGP4 $225
JUMPV
LABELV $224
line 345
;345:	while(1) {
line 346
;346:		for ( i = 0; i < 2; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $227
line 347
;347:			if ( i == 0 && teamName && *teamName ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $231
ADDRLP4 20
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $231
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $231
line 349
;348:				//								"models/players/characters/james/stroggs/lower_lily_red.skin"
;349:				Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s_%s.%s", charactersFolder, modelName, teamName, base, skinName, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $233
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 350
;350:			}
ADDRGP4 $232
JUMPV
LABELV $231
line 351
;351:			else {
line 353
;352:				//								"models/players/characters/james/lower_lily_red.skin"
;353:				Com_sprintf( filename, length, "models/players/%s%s/%s_%s_%s.%s", charactersFolder, modelName, base, skinName, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $234
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 354
;354:			}
LABELV $232
line 355
;355:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $235
line 356
;356:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $210
JUMPV
LABELV $235
line 358
;357:			}
;358:			if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
LTI4 $237
line 359
;359:				if ( i == 0 && teamName && *teamName ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $240
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $240
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $240
line 361
;360:					//								"models/players/characters/james/stroggs/lower_red.skin"
;361:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", charactersFolder, modelName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $242
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 362
;362:				}
ADDRGP4 $238
JUMPV
LABELV $240
line 363
;363:				else {
line 365
;364:					//								"models/players/characters/james/lower_red.skin"
;365:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", charactersFolder, modelName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $243
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 366
;366:				}
line 367
;367:			}
ADDRGP4 $238
JUMPV
LABELV $237
line 368
;368:			else {
line 369
;369:				if ( i == 0 && teamName && *teamName ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $244
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $244
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $244
line 371
;370:					//								"models/players/characters/james/stroggs/lower_lily.skin"
;371:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", charactersFolder, modelName, teamName, base, skinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $242
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 372
;372:				}
ADDRGP4 $245
JUMPV
LABELV $244
line 373
;373:				else {
line 375
;374:					//								"models/players/characters/james/lower_lily.skin"
;375:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", charactersFolder, modelName, base, skinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $243
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 376
;376:				}
LABELV $245
line 377
;377:			}
LABELV $238
line 378
;378:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $246
line 379
;379:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $210
JUMPV
LABELV $246
line 381
;380:			}
;381:			if ( !teamName || !*teamName ) {
ADDRLP4 32
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $250
ADDRLP4 32
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $248
LABELV $250
line 382
;382:				break;
ADDRGP4 $229
JUMPV
LABELV $248
line 384
;383:			}
;384:		}
LABELV $228
line 346
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $227
LABELV $229
line 386
;385:		// if tried the heads folder first
;386:		if ( charactersFolder[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $251
line 387
;387:			break;
ADDRGP4 $226
JUMPV
LABELV $251
line 389
;388:		}
;389:		charactersFolder = "characters/";
ADDRLP4 4
ADDRGP4 $253
ASGNP4
line 390
;390:	}
LABELV $225
line 345
ADDRGP4 $224
JUMPV
LABELV $226
line 392
;391:
;392:	return qfalse;
CNSTI4 0
RETI4
LABELV $210
endproc CG_FindClientModelFile 36 40
proc CG_FindClientHeadFile 36 40
line 401
;393:}
;394:
;395:
;396:/*
;397:==========================
;398:CG_FindClientHeadFile
;399:==========================
;400:*/
;401:static qboolean	CG_FindClientHeadFile( char *filename, int length, clientInfo_t *ci, const char *teamName, const char *headModelName, const char *headSkinName, const char *base, const char *ext ) {
line 405
;402:	char *team, *headsFolder;
;403:	int i;
;404:
;405:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
LTI4 $255
line 406
;406:		switch ( ci->team ) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $261
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $262
ADDRGP4 $258
JUMPV
LABELV $261
line 407
;407:			case TEAM_RED: {
line 408
;408:				team = "red";
ADDRLP4 8
ADDRGP4 $219
ASGNP4
line 409
;409:				break;
ADDRGP4 $256
JUMPV
LABELV $262
line 411
;410:			}
;411:			case TEAM_BLUE: {
line 412
;412:				team = "blue";
ADDRLP4 8
ADDRGP4 $218
ASGNP4
line 413
;413:				break;
ADDRGP4 $256
JUMPV
LABELV $258
line 415
;414:			}
;415:			default: {
line 416
;416:				team = "default";
ADDRLP4 8
ADDRGP4 $135
ASGNP4
line 417
;417:				break;
line 420
;418:			}
;419:		}
;420:	}
ADDRGP4 $256
JUMPV
LABELV $255
line 421
;421:	else {
line 422
;422:		team = "default";
ADDRLP4 8
ADDRGP4 $135
ASGNP4
line 423
;423:	}
LABELV $256
line 426
;424:
;425:	// colored skins
;426:	if ( ci->coloredSkin && !Q_stricmp( ci->headSkinName, PM_SKIN ) ) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $263
ADDRLP4 12
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRGP4 $222
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $263
line 427
;427:		team = PM_SKIN;
ADDRLP4 8
ADDRGP4 $222
ASGNP4
line 428
;428:	}
LABELV $263
line 430
;429:
;430:	if ( headModelName[0] == '*' ) {
ADDRFP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $265
line 431
;431:		headsFolder = "heads/";
ADDRLP4 4
ADDRGP4 $267
ASGNP4
line 432
;432:		headModelName++;
ADDRFP4 16
ADDRFP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 433
;433:	}
ADDRGP4 $269
JUMPV
LABELV $265
line 434
;434:	else {
line 435
;435:		headsFolder = "";
ADDRLP4 4
ADDRGP4 $223
ASGNP4
line 436
;436:	}
ADDRGP4 $269
JUMPV
LABELV $268
line 437
;437:	while(1) {
line 438
;438:		for ( i = 0; i < 2; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $271
line 439
;439:			if ( i == 0 && teamName && *teamName ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $275
ADDRLP4 20
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $275
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $275
line 440
;440:				Com_sprintf( filename, length, "models/players/%s%s/%s/%s%s_%s.%s", headsFolder, headModelName, headSkinName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $277
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 441
;441:			}
ADDRGP4 $276
JUMPV
LABELV $275
line 442
;442:			else {
line 443
;443:				Com_sprintf( filename, length, "models/players/%s%s/%s/%s_%s.%s", headsFolder, headModelName, headSkinName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $278
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 444
;444:			}
LABELV $276
line 445
;445:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $279
line 446
;446:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $254
JUMPV
LABELV $279
line 448
;447:			}
;448:			if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
LTI4 $281
line 449
;449:				if ( i == 0 &&  teamName && *teamName ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $284
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $284
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $284
line 450
;450:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", headsFolder, headModelName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $242
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 451
;451:				}
ADDRGP4 $282
JUMPV
LABELV $284
line 452
;452:				else {
line 453
;453:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", headsFolder, headModelName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $243
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 454
;454:				}
line 455
;455:			}
ADDRGP4 $282
JUMPV
LABELV $281
line 456
;456:			else {
line 457
;457:				if ( i == 0 && teamName && *teamName ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $286
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $286
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $286
line 458
;458:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", headsFolder, headModelName, teamName, base, headSkinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $242
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 459
;459:				}
ADDRGP4 $287
JUMPV
LABELV $286
line 460
;460:				else {
line 461
;461:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", headsFolder, headModelName, base, headSkinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $243
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 462
;462:				}
LABELV $287
line 463
;463:			}
LABELV $282
line 464
;464:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $288
line 465
;465:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $254
JUMPV
LABELV $288
line 467
;466:			}
;467:			if ( !teamName || !*teamName ) {
ADDRLP4 32
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $292
ADDRLP4 32
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $290
LABELV $292
line 468
;468:				break;
ADDRGP4 $273
JUMPV
LABELV $290
line 470
;469:			}
;470:		}
LABELV $272
line 438
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $271
LABELV $273
line 472
;471:		// if tried the heads folder first
;472:		if ( headsFolder[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $293
line 473
;473:			break;
ADDRGP4 $270
JUMPV
LABELV $293
line 475
;474:		}
;475:		headsFolder = "heads/";
ADDRLP4 4
ADDRGP4 $267
ASGNP4
line 476
;476:	}
LABELV $269
line 437
ADDRGP4 $268
JUMPV
LABELV $270
line 478
;477:
;478:	return qfalse;
CNSTI4 0
RETI4
LABELV $254
endproc CG_FindClientHeadFile 36 40
proc CG_RegisterClientSkin 80 32
line 487
;479:}
;480:
;481:
;482:/*
;483:==========================
;484:CG_RegisterClientSkin
;485:==========================
;486:*/
;487:static qboolean	CG_RegisterClientSkin( clientInfo_t *ci, const char *teamName, const char *modelName, const char *skinName, const char *headModelName, const char *headSkinName ) {
line 512
;488:	char filename[MAX_QPATH];
;489:
;490:	/*
;491:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/%slower_%s.skin", modelName, teamName, skinName );
;492:	ci->legsSkin = trap_R_RegisterSkin( filename );
;493:	if (!ci->legsSkin) {
;494:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/%slower_%s.skin", modelName, teamName, skinName );
;495:		ci->legsSkin = trap_R_RegisterSkin( filename );
;496:		if (!ci->legsSkin) {
;497:			Com_Printf( "Leg skin load failure: %s\n", filename );
;498:		}
;499:	}
;500:
;501:
;502:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/%supper_%s.skin", modelName, teamName, skinName );
;503:	ci->torsoSkin = trap_R_RegisterSkin( filename );
;504:	if (!ci->torsoSkin) {
;505:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/%supper_%s.skin", modelName, teamName, skinName );
;506:		ci->torsoSkin = trap_R_RegisterSkin( filename );
;507:		if (!ci->torsoSkin) {
;508:			Com_Printf( "Torso skin load failure: %s\n", filename );
;509:		}
;510:	}
;511:	*/
;512:	if ( CG_FindClientModelFile( filename, sizeof(filename), ci, teamName, modelName, skinName, "lower", "skin" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
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
ADDRGP4 $298
ARGP4
ADDRGP4 $299
ARGP4
ADDRLP4 64
ADDRGP4 CG_FindClientModelFile
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $296
line 513
;513:		ci->legsSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 514
;514:	}
LABELV $296
line 515
;515:	if (!ci->legsSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
NEI4 $300
line 516
;516:		Com_Printf( "Leg skin load failure: %s\n", filename );
ADDRGP4 $302
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 517
;517:	}
LABELV $300
line 519
;518:
;519:	if ( CG_FindClientModelFile( filename, sizeof(filename), ci, teamName, modelName, skinName, "upper", "skin" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
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
ADDRGP4 $305
ARGP4
ADDRGP4 $299
ARGP4
ADDRLP4 68
ADDRGP4 CG_FindClientModelFile
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $303
line 520
;520:		ci->torsoSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 521
;521:	}
LABELV $303
line 522
;522:	if (!ci->torsoSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 0
NEI4 $306
line 523
;523:		Com_Printf( "Torso skin load failure: %s\n", filename );
ADDRGP4 $308
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 524
;524:	}
LABELV $306
line 526
;525:
;526:	if ( CG_FindClientHeadFile( filename, sizeof(filename), ci, teamName, headModelName, headSkinName, "head", "skin" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 $311
ARGP4
ADDRGP4 $299
ARGP4
ADDRLP4 72
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $309
line 527
;527:		ci->headSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 528
;528:	}
LABELV $309
line 529
;529:	if (!ci->headSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
NEI4 $312
line 530
;530:		Com_Printf( "Head skin load failure: %s\n", filename );
ADDRGP4 $314
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 531
;531:	}
LABELV $312
line 534
;532:
;533:	// if any skins failed to load
;534:	if ( !ci->legsSkin || !ci->torsoSkin || !ci->headSkin ) {
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
EQI4 $318
ADDRLP4 76
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 0
EQI4 $318
ADDRLP4 76
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
NEI4 $315
LABELV $318
line 535
;535:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $295
JUMPV
LABELV $315
line 537
;536:	}
;537:	return qtrue;
CNSTI4 1
RETI4
LABELV $295
endproc CG_RegisterClientSkin 80 32
proc CG_RegisterClientModelname 164 32
line 546
;538:}
;539:
;540:
;541:/*
;542:==========================
;543:CG_RegisterClientModelname
;544:==========================
;545:*/
;546:static qboolean CG_RegisterClientModelname( clientInfo_t *ci, const char *modelName, const char *skinName, const char *headModelName, const char *headSkinName, const char *teamName ) {
line 551
;547:	char	filename[MAX_QPATH];
;548:	const char		*headName;
;549:	char newTeamName[MAX_QPATH];
;550:
;551:	if ( headModelName[0] == '\0' ) {
ADDRFP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $320
line 552
;552:		headName = modelName;
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
line 553
;553:	}
ADDRGP4 $321
JUMPV
LABELV $320
line 554
;554:	else {
line 555
;555:		headName = headModelName;
ADDRLP4 64
ADDRFP4 12
INDIRP4
ASGNP4
line 556
;556:	}
LABELV $321
line 557
;557:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/lower.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $322
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 558
;558:	ci->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 132
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
ADDRLP4 132
INDIRI4
ASGNI4
line 559
;559:	if ( !ci->legsModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 0
NEI4 $323
line 560
;560:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/lower.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $325
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 561
;561:		ci->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 136
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
ADDRLP4 136
INDIRI4
ASGNI4
line 562
;562:		if ( !ci->legsModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 0
NEI4 $326
line 563
;563:			Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $328
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 564
;564:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $319
JUMPV
LABELV $326
line 566
;565:		}
;566:	}
LABELV $323
line 568
;567:
;568:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $329
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 569
;569:	ci->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 136
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
ADDRLP4 136
INDIRI4
ASGNI4
line 570
;570:	if ( !ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
NEI4 $330
line 571
;571:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $332
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 572
;572:		ci->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 573
;573:		if ( !ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
NEI4 $333
line 574
;574:			Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $328
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 575
;575:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $319
JUMPV
LABELV $333
line 577
;576:		}
;577:	}
LABELV $330
line 579
;578:
;579:	if( headName[0] == '*' ) {
ADDRLP4 64
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $335
line 580
;580:		Com_sprintf( filename, sizeof( filename ), "models/players/heads/%s/%s.md3", &headModelName[1], &headModelName[1] );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $337
ARGP4
ADDRLP4 140
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 581
;581:	}
ADDRGP4 $336
JUMPV
LABELV $335
line 582
;582:	else {
line 583
;583:		Com_sprintf( filename, sizeof( filename ), "models/players/%s/head.md3", headName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $338
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 584
;584:	}
LABELV $336
line 585
;585:	ci->headModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 587
;586:	// if the head model could not be found and we didn't load from the heads folder try to load from there
;587:	if ( !ci->headModel && headName[0] != '*' ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
CNSTI4 0
NEI4 $339
ADDRLP4 64
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $339
line 588
;588:		Com_sprintf( filename, sizeof( filename ), "models/players/heads/%s/%s.md3", headModelName, headModelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $337
ARGP4
ADDRLP4 144
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 589
;589:		ci->headModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 148
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 590
;590:	}
LABELV $339
line 591
;591:	if ( !ci->headModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
CNSTI4 0
NEI4 $341
line 592
;592:		Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $328
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 593
;593:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $319
JUMPV
LABELV $341
line 597
;594:	}
;595:
;596:	// if any skins failed to load, return failure
;597:	if ( !CG_RegisterClientSkin( ci, teamName, modelName, skinName, headName, headSkinName ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 CG_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $343
line 598
;598:		if ( teamName && *teamName) {
ADDRLP4 148
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $345
ADDRLP4 148
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $345
line 599
;599:			Com_Printf( "Failed to load skin file: %s : %s : %s, %s : %s\n", teamName, modelName, skinName, headName, headSkinName );
ADDRGP4 $347
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 600
;600:			if( ci->team == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $348
line 601
;601:				Com_sprintf(newTeamName, sizeof(newTeamName), "%s/", DEFAULT_BLUETEAM_NAME);
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $350
ARGP4
ADDRGP4 $351
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 602
;602:			}
ADDRGP4 $349
JUMPV
LABELV $348
line 603
;603:			else {
line 604
;604:				Com_sprintf(newTeamName, sizeof(newTeamName), "%s/", DEFAULT_REDTEAM_NAME);
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $350
ARGP4
ADDRGP4 $352
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 605
;605:			}
LABELV $349
line 606
;606:			if ( !CG_RegisterClientSkin( ci, newTeamName, modelName, skinName, headName, headSkinName ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 CG_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $346
line 607
;607:				Com_Printf( "Failed to load skin file: %s : %s : %s, %s : %s\n", newTeamName, modelName, skinName, headName, headSkinName );
ADDRGP4 $347
ARGP4
ADDRLP4 68
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 608
;608:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $319
JUMPV
line 610
;609:			}
;610:		} else {
LABELV $345
line 611
;611:			Com_Printf( "Failed to load skin file: %s : %s, %s : %s\n", modelName, skinName, headName, headSkinName );
ADDRGP4 $355
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 612
;612:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $319
JUMPV
LABELV $346
line 614
;613:		}
;614:	}
LABELV $343
line 617
;615:
;616:	// load the animations
;617:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $356
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 618
;618:	if ( !CG_ParseAnimationFile( filename, ci ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 CG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $357
line 619
;619:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $359
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 620
;620:		if ( !CG_ParseAnimationFile( filename, ci ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 CG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $360
line 621
;621:			Com_Printf( "Failed to load animation file %s\n", filename );
ADDRGP4 $362
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 622
;622:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $319
JUMPV
LABELV $360
line 624
;623:		}
;624:	}
LABELV $357
line 626
;625:
;626:	if ( CG_FindClientHeadFile( filename, sizeof(filename), ci, teamName, headName, headSkinName, "icon", "skin" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 $365
ARGP4
ADDRGP4 $299
ARGP4
ADDRLP4 152
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $363
line 627
;627:		ci->modelIcon = trap_R_RegisterShaderNoMip( filename );
ADDRLP4 0
ARGP4
ADDRLP4 156
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 628
;628:	}
ADDRGP4 $364
JUMPV
LABELV $363
line 629
;629:	else if ( CG_FindClientHeadFile( filename, sizeof(filename), ci, teamName, headName, headSkinName, "icon", "tga" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 $365
ARGP4
ADDRGP4 $368
ARGP4
ADDRLP4 156
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $366
line 630
;630:		ci->modelIcon = trap_R_RegisterShaderNoMip( filename );
ADDRLP4 0
ARGP4
ADDRLP4 160
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 160
INDIRI4
ASGNI4
line 631
;631:	}
LABELV $366
LABELV $364
line 633
;632:
;633:	if ( !ci->modelIcon ) {
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
CNSTI4 0
NEI4 $369
line 634
;634:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $319
JUMPV
LABELV $369
line 637
;635:	}
;636:
;637:	return qtrue;
CNSTI4 1
RETI4
LABELV $319
endproc CG_RegisterClientModelname 164 32
proc CG_IsKnownModel 92 8
line 642
;638:}
;639:
;640:
;641:/* advance this function on any new pm skin added */
;642:static qboolean CG_IsKnownModel( const char *modelName ) {
line 644
;643:
;644:	if ( Q_stricmp(modelName, "anarki") &&
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $374
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $375
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $376
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $377
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $378
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $379
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $380
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $381
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $382
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $383
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $384
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $385
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $386
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $387
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $388
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $389
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $390
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $391
ARGP4
ADDRLP4 68
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $392
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $393
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $394
ARGP4
ADDRLP4 80
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $395
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $396
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $372
line 667
;645:		 Q_stricmp(modelName, "biker") &&
;646:		 Q_stricmp(modelName, "bitterman") &&
;647:		 Q_stricmp(modelName, "bones") &&
;648:		 Q_stricmp(modelName, "crash") &&
;649:		 Q_stricmp(modelName, "doom") &&
;650:		 Q_stricmp(modelName, "grunt") &&
;651:		 Q_stricmp(modelName, "hunter") &&
;652:		 Q_stricmp(modelName, "keel") &&
;653:		 Q_stricmp(modelName, "klesk") &&
;654:		 Q_stricmp(modelName, "lucy") &&
;655:		 Q_stricmp(modelName, "major") &&
;656:		 Q_stricmp(modelName, "mynx") &&
;657:		 Q_stricmp(modelName, "orbb") &&
;658:		 Q_stricmp(modelName, "ranger") &&
;659:		 Q_stricmp(modelName, "razor") &&
;660:		 Q_stricmp(modelName, "sarge") &&
;661:		 Q_stricmp(modelName, "slash") &&
;662:		 Q_stricmp(modelName, "sorlag") &&
;663:		 Q_stricmp(modelName, "tankjr") &&
;664:		 Q_stricmp(modelName, "uriel") &&
;665:		 Q_stricmp(modelName, "visor") &&
;666:		 Q_stricmp(modelName, "xaero") )
;667:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $371
JUMPV
LABELV $372
line 669
;668:	else
;669:		return qtrue;
CNSTI4 1
RETI4
LABELV $371
endproc CG_IsKnownModel 92 8
proc CG_ColorFromChar 8 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII1 4
ASGNI1
line 678
;670:}
;671:
;672:
;673:/*
;674:====================
;675:CG_ColorFromChar
;676:====================
;677:*/
;678:static void CG_ColorFromChar( char v, vec3_t color ) {
line 681
;679:	int val;
;680:
;681:	val = v - '0';
ADDRLP4 0
ADDRFP4 0
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ASGNI4
line 683
;682:
;683:	if ( val < 1 || val > 7 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $400
ADDRLP4 0
INDIRI4
CNSTI4 7
LEI4 $398
LABELV $400
line 684
;684:		VectorSet( color, 1.0f, 1.0f, 1.0f );
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 685
;685:	} else {
ADDRGP4 $399
JUMPV
LABELV $398
line 686
;686:		VectorClear( color );
ADDRFP4 4
INDIRP4
CNSTF4 0
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 687
;687:		if ( val & 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $401
line 688
;688:			color[0] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
line 689
;689:		}
LABELV $401
line 690
;690:		if ( val & 2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $403
line 691
;691:			color[1] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
line 692
;692:		}
LABELV $403
line 693
;693:		if ( val & 4 ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $405
line 694
;694:			color[2] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 695
;695:		}
LABELV $405
line 696
;696:	}
LABELV $399
line 697
;697:}
LABELV $397
endproc CG_ColorFromChar 8 0
proc CG_SetColorInfo 0 8
line 701
;698:
;699:
;700:static void CG_SetColorInfo( const char *color, clientInfo_t *info ) 
;701:{
line 702
;702:	VectorSet ( info->headColor, 1.0f, 1.0f, 1.0f );
ADDRFP4 4
INDIRP4
CNSTI4 1616
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1620
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1624
ADDP4
CNSTF4 1065353216
ASGNF4
line 703
;703:	VectorSet ( info->bodyColor, 1.0f, 1.0f, 1.0f );
ADDRFP4 4
INDIRP4
CNSTI4 1628
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1632
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1636
ADDP4
CNSTF4 1065353216
ASGNF4
line 704
;704:	VectorSet ( info->legsColor, 1.0f, 1.0f, 1.0f );
ADDRFP4 4
INDIRP4
CNSTI4 1640
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1644
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1648
ADDP4
CNSTF4 1065353216
ASGNF4
line 706
;705:	
;706:	if ( !color[0] )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $408
line 707
;707:		return;
ADDRGP4 $407
JUMPV
LABELV $408
line 708
;708:	CG_ColorFromChar( color[0], info->headColor );
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 1616
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 710
;709:	
;710:	if ( !color[1] )
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $410
line 711
;711:		return;
ADDRGP4 $407
JUMPV
LABELV $410
line 712
;712:	CG_ColorFromChar( color[1], info->bodyColor );
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 1628
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 714
;713:
;714:	if ( !color[2] )
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $412
line 715
;715:		return;
ADDRGP4 $407
JUMPV
LABELV $412
line 716
;716:	CG_ColorFromChar( color[2], info->legsColor );
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 1640
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 719
;717:
;718:	// override color1/color2 if specified
;719:	if ( !color[3] )
ADDRFP4 0
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $414
line 720
;720:		return;
ADDRGP4 $407
JUMPV
LABELV $414
line 721
;721:	CG_ColorFromChar( color[3], info->color1 );
ADDRFP4 0
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 723
;722:
;723:	if ( !color[4] )
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $416
line 724
;724:		return;
ADDRGP4 $407
JUMPV
LABELV $416
line 725
;725:	CG_ColorFromChar( color[4], info->color2 );
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 56
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 726
;726:}
LABELV $407
endproc CG_SetColorInfo 0 8
bss
align 1
LABELV $419
skip 6
code
proc CG_GetTeamColors 8 12
line 729
;727:
;728:
;729:static const char *CG_GetTeamColors( const char *color, team_t team ) {
line 732
;730:	static char str[6];
;731:
;732:	Q_strncpyz( str, color, sizeof( str ) );
ADDRGP4 $419
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 734
;733:
;734:	switch ( team ) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $425
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $423
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $424
ADDRGP4 $421
JUMPV
LABELV $423
line 735
;735:		case TEAM_RED:  replace1( '?', '1', str ); break;
CNSTI4 63
ARGI4
CNSTI4 49
ARGI4
ADDRGP4 $419
ARGP4
ADDRGP4 replace1
CALLI4
pop
ADDRGP4 $421
JUMPV
LABELV $424
line 736
;736:		case TEAM_BLUE: replace1( '?', '4', str ); break;
CNSTI4 63
ARGI4
CNSTI4 52
ARGI4
ADDRGP4 $419
ARGP4
ADDRGP4 replace1
CALLI4
pop
ADDRGP4 $421
JUMPV
LABELV $425
line 737
;737:		case TEAM_FREE: replace1( '?', '7', str ); break;
CNSTI4 63
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 $419
ARGP4
ADDRGP4 replace1
CALLI4
pop
line 738
;738:		default: break;
LABELV $421
line 741
;739:    }
;740:
;741:	return str;
ADDRGP4 $419
RETP4
LABELV $418
endproc CG_GetTeamColors 8 12
proc CG_LoadClientInfo 404 24
line 753
;742:}
;743:
;744:
;745:/*
;746:===================
;747:CG_LoadClientInfo
;748:
;749:Load it now, taking the disk hits.
;750:This will usually be deferred to a safe time
;751:===================
;752:*/
;753:static void CG_LoadClientInfo( clientInfo_t *ci ) {
line 761
;754:	const char	*dir;
;755:	int			i, modelloaded;
;756:	const char	*s;
;757:	int			clientNum;
;758:	char		teamname[MAX_QPATH];
;759:	char		vertexlit[MAX_CVAR_VALUE_STRING];
;760:
;761:	teamname[0] = '\0';
ADDRLP4 276
CNSTI1 0
ASGNI1
line 764
;762:
;763:	// disable vertexlight for colored skins
;764:	trap_Cvar_VariableStringBuffer( "r_vertexlight", vertexlit, sizeof( vertexlit ) );
ADDRGP4 $427
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 765
;765:	if ( vertexlit[0] && vertexlit[0] != '0' ) {
ADDRLP4 340
ADDRLP4 16
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
EQI4 $428
ADDRLP4 340
INDIRI4
CNSTI4 48
EQI4 $428
line 766
;766:		trap_Cvar_Set( "r_vertexlight", "0" );
ADDRGP4 $427
ARGP4
ADDRGP4 $430
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 767
;767:	}
LABELV $428
line 781
;768:
;769:#ifdef MISSIONPACK
;770:	if( cgs.gametype >= GT_TEAM) {
;771:		if( ci->team == TEAM_BLUE ) {
;772:			Q_strncpyz(teamname, cg_blueTeamName.string, sizeof(teamname) );
;773:		} else {
;774:			Q_strncpyz(teamname, cg_redTeamName.string, sizeof(teamname) );
;775:		}
;776:	}
;777:	if( teamname[0] ) {
;778:		strcat( teamname, "/" );
;779:	}
;780:#endif
;781:	modelloaded = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 782
;782:	if ( !CG_RegisterClientModelname( ci, ci->modelName, ci->skinName, ci->headModelName, ci->headSkinName, teamname ) ) {
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 276
ARGP4
ADDRLP4 348
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
NEI4 $431
line 783
;783:		if ( cg_buildScript.integer ) {
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $433
line 784
;784:			CG_Error( "CG_RegisterClientModelname( %s, %s, %s, %s %s ) failed", ci->modelName, ci->skinName, ci->headModelName, ci->headSkinName, teamname );
ADDRGP4 $436
ARGP4
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 276
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 785
;785:		}
LABELV $433
line 788
;786:
;787:		// fall back to default team name
;788:		if( cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
LTI4 $437
line 790
;789:			// keep skin name
;790:			if( ci->team == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $440
line 791
;791:				Q_strncpyz(teamname, DEFAULT_BLUETEAM_NAME, sizeof(teamname) );
ADDRLP4 276
ARGP4
ADDRGP4 $351
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 792
;792:			} else {
ADDRGP4 $441
JUMPV
LABELV $440
line 793
;793:				Q_strncpyz(teamname, DEFAULT_REDTEAM_NAME, sizeof(teamname) );
ADDRLP4 276
ARGP4
ADDRGP4 $352
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 794
;794:			}
LABELV $441
line 795
;795:			if ( !CG_RegisterClientModelname( ci, DEFAULT_MODEL, ci->skinName, DEFAULT_MODEL, ci->skinName, teamname ) ) {
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 356
ADDRGP4 $390
ASGNP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 276
ARGP4
ADDRLP4 360
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
NEI4 $438
line 796
;796:				CG_Error( "DEFAULT_TEAM_MODEL / skin (%s/%s) failed to register", DEFAULT_MODEL, ci->skinName );
ADDRGP4 $444
ARGP4
ADDRGP4 $390
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 797
;797:			}
line 798
;798:		} else {
ADDRGP4 $438
JUMPV
LABELV $437
line 799
;799:			if ( !CG_RegisterClientModelname( ci, DEFAULT_MODEL, "default", DEFAULT_MODEL, "default", teamname ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 352
ADDRGP4 $390
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 356
ADDRGP4 $135
ASGNP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 276
ARGP4
ADDRLP4 360
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
NEI4 $445
line 800
;800:				CG_Error( "DEFAULT_MODEL (%s) failed to register", DEFAULT_MODEL );
ADDRGP4 $447
ARGP4
ADDRGP4 $390
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 801
;801:			}
LABELV $445
line 802
;802:		}
LABELV $438
line 803
;803:		modelloaded = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 804
;804:	}
LABELV $431
line 806
;805:
;806:	ci->newAnims = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 0
ASGNI4
line 807
;807:	if ( ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
EQI4 $448
line 810
;808:		orientation_t tag;
;809:		// if the torso model has the "tag_flag"
;810:		if ( trap_R_LerpTag( &tag, ci->torsoModel, 0, 0, 1, "tag_flag" ) ) {
ADDRLP4 352
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 $452
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_LerpTag
CALLI4
ASGNI4
ADDRLP4 400
INDIRI4
CNSTI4 0
EQI4 $450
line 811
;811:			ci->newAnims = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 1
ASGNI4
line 812
;812:		}
LABELV $450
line 813
;813:	}
LABELV $448
line 816
;814:
;815:	// sounds
;816:	dir = ci->modelName;
ADDRLP4 272
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ASGNP4
line 818
;817:
;818:	for ( i = 0 ; i < MAX_CUSTOM_SOUNDS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $453
line 819
;819:		s = cg_customSoundNames[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ASGNP4
line 820
;820:		if ( !s ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $457
line 821
;821:			break;
ADDRGP4 $455
JUMPV
LABELV $457
line 823
;822:		}
;823:		ci->sounds[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 825
;824:		// if the model didn't load use the sounds of the default model
;825:		if (modelloaded) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $459
line 826
;826:			ci->sounds[i] = trap_S_RegisterSound( va("sound/player/%s/%s", dir, s + 1), qfalse );
ADDRGP4 $461
ARGP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 352
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 356
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
ADDRLP4 356
INDIRI4
ASGNI4
line 827
;827:		}
LABELV $459
line 828
;828:		if ( !ci->sounds[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $462
line 829
;829:			ci->sounds[i] = trap_S_RegisterSound( va("sound/player/%s/%s", DEFAULT_MODEL, s + 1), qfalse );
ADDRGP4 $461
ARGP4
ADDRGP4 $390
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 352
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 356
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
ADDRLP4 356
INDIRI4
ASGNI4
line 830
;830:		}
LABELV $462
line 831
;831:	}
LABELV $454
line 818
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $453
LABELV $455
line 833
;832:
;833:	ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 0
ASGNI4
line 837
;834:
;835:	// reset any existing players and bodies, because they might be in bad
;836:	// frames for this new model
;837:	clientNum = ci - cgs.clientinfo;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cgs+41012
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1680
DIVI4
ASGNI4
line 838
;838:	for ( i = 0 ; i < MAX_GENTITIES ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $465
line 839
;839:		if ( cg_entities[i].currentState.clientNum == clientNum
ADDRLP4 0
INDIRI4
CNSTI4 1236
MULI4
ADDRGP4 cg_entities+168
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $469
ADDRLP4 0
INDIRI4
CNSTI4 1236
MULI4
ADDRGP4 cg_entities+4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $469
line 840
;840:			&& cg_entities[i].currentState.eType == ET_PLAYER ) {
line 841
;841:			CG_ResetPlayerEntity( &cg_entities[i] );
ADDRLP4 0
INDIRI4
CNSTI4 1236
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 842
;842:		}
LABELV $469
line 843
;843:	}
LABELV $466
line 838
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $465
line 846
;844:
;845:	// restore vertexlight mode
;846:	if ( vertexlit[0] && vertexlit[0] != '0' ) {
ADDRLP4 352
ADDRLP4 16
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 0
EQI4 $473
ADDRLP4 352
INDIRI4
CNSTI4 48
EQI4 $473
line 847
;847:		trap_Cvar_Set( "r_vertexlight", vertexlit );
ADDRGP4 $427
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 848
;848:	}
LABELV $473
line 849
;849:}
LABELV $426
endproc CG_LoadClientInfo 404 24
proc CG_CopyClientInfoModel 0 12
line 857
;850:
;851:
;852:/*
;853:======================
;854:CG_CopyClientInfoModel
;855:======================
;856:*/
;857:static void CG_CopyClientInfoModel( const clientInfo_t *from, clientInfo_t *to ) {
line 858
;858:	VectorCopy( from->headOffset, to->headOffset );
ADDRFP4 4
INDIRP4
CNSTI4 400
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 400
ADDP4
INDIRB
ASGNB 12
line 859
;859:	to->footsteps = from->footsteps;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ASGNI4
line 860
;860:	to->gender = from->gender;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ASGNI4
line 862
;861:
;862:	to->legsModel = from->legsModel;
ADDRFP4 4
INDIRP4
CNSTI4 420
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
line 863
;863:	to->legsSkin = from->legsSkin;
ADDRFP4 4
INDIRP4
CNSTI4 424
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 864
;864:	to->torsoModel = from->torsoModel;
ADDRFP4 4
INDIRP4
CNSTI4 428
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ASGNI4
line 865
;865:	to->torsoSkin = from->torsoSkin;
ADDRFP4 4
INDIRP4
CNSTI4 432
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
ASGNI4
line 866
;866:	to->headModel = from->headModel;
ADDRFP4 4
INDIRP4
CNSTI4 436
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ASGNI4
line 867
;867:	to->headSkin = from->headSkin;
ADDRFP4 4
INDIRP4
CNSTI4 440
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
line 868
;868:	to->modelIcon = from->modelIcon;
ADDRFP4 4
INDIRP4
CNSTI4 444
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ASGNI4
line 870
;869:
;870:	to->newAnims = from->newAnims;
ADDRFP4 4
INDIRP4
CNSTI4 388
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
ASGNI4
line 871
;871:	to->coloredSkin = from->coloredSkin;
ADDRFP4 4
INDIRP4
CNSTI4 1612
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
ASGNI4
line 873
;872:
;873:	memcpy( to->animations, from->animations, sizeof( to->animations ) );
ADDRFP4 4
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ARGP4
CNSTI4 1036
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 874
;874:	memcpy( to->sounds, from->sounds, sizeof( to->sounds ) );
ADDRFP4 4
INDIRP4
CNSTI4 1484
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 875
;875:}
LABELV $475
endproc CG_CopyClientInfoModel 0 12
proc CG_ScanForExistingClientInfo 24 8
line 883
;876:
;877:
;878:/*
;879:======================
;880:CG_ScanForExistingClientInfo
;881:======================
;882:*/
;883:static qboolean CG_ScanForExistingClientInfo( clientInfo_t *ci ) {
line 887
;884:	int		i;
;885:	clientInfo_t	*match;
;886:
;887:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $480
JUMPV
LABELV $477
line 888
;888:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ASGNP4
line 889
;889:		if ( !match->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $483
line 890
;890:			continue;
ADDRGP4 $478
JUMPV
LABELV $483
line 892
;891:		}
;892:		if ( match->deferred ) {
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $485
line 893
;893:			continue;
ADDRGP4 $478
JUMPV
LABELV $485
line 895
;894:		}
;895:		if ( !Q_stricmp( ci->modelName, match->modelName )
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $487
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $487
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $487
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $487
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
LTI4 $490
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
NEI4 $487
LABELV $490
line 901
;896:			&& !Q_stricmp( ci->skinName, match->skinName )
;897:			&& !Q_stricmp( ci->headModelName, match->headModelName )
;898:			&& !Q_stricmp( ci->headSkinName, match->headSkinName ) 
;899:			//&& !Q_stricmp( ci->blueTeam, match->blueTeam ) 
;900:			//&& !Q_stricmp( ci->redTeam, match->redTeam )
;901:			&& (cgs.gametype < GT_TEAM || ci->team == match->team) ) {
line 904
;902:			// this clientinfo is identical, so use it's handles
;903:
;904:			ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 0
ASGNI4
line 906
;905:
;906:			CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 908
;907:
;908:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $476
JUMPV
LABELV $487
line 910
;909:		}
;910:	}
LABELV $478
line 887
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $480
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31520
INDIRI4
LTI4 $477
line 913
;911:
;912:	// nothing matches, so defer the load
;913:	return qfalse;
CNSTI4 0
RETI4
LABELV $476
endproc CG_ScanForExistingClientInfo 24 8
proc CG_SetDeferredClientInfo 20 8
line 925
;914:}
;915:
;916:
;917:/*
;918:======================
;919:CG_SetDeferredClientInfo
;920:
;921:We aren't going to load it now, so grab some other
;922:client's info to use until we have some spare time.
;923:======================
;924:*/
;925:static void CG_SetDeferredClientInfo( clientInfo_t *ci ) {
line 931
;926:	int		i;
;927:	clientInfo_t	*match;
;928:
;929:	// if someone else is already the same models and skins we
;930:	// can just load the client info
;931:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $495
JUMPV
LABELV $492
line 932
;932:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ASGNP4
line 933
;933:		if ( !match->infoValid || match->deferred ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $500
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $498
LABELV $500
line 934
;934:			continue;
ADDRGP4 $493
JUMPV
LABELV $498
line 936
;935:		}
;936:		if ( Q_stricmp( ci->skinName, match->skinName ) ||
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $505
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $505
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
LTI4 $501
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
EQI4 $501
LABELV $505
line 940
;937:			 Q_stricmp( ci->modelName, match->modelName ) ||
;938://			 Q_stricmp( ci->headModelName, match->headModelName ) ||
;939://			 Q_stricmp( ci->headSkinName, match->headSkinName ) ||
;940:			 (cgs.gametype >= GT_TEAM && ci->team != match->team) ) {
line 941
;941:			continue;
ADDRGP4 $493
JUMPV
LABELV $501
line 944
;942:		}
;943:		// just load the real info cause it uses the same models and skins
;944:		CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 945
;945:		return;
ADDRGP4 $491
JUMPV
LABELV $493
line 931
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $495
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31520
INDIRI4
LTI4 $492
line 949
;946:	}
;947:
;948:	// if we are in teamplay, only grab a model if the skin is correct
;949:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
LTI4 $506
line 950
;950:		for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $512
JUMPV
LABELV $509
line 951
;951:			match = &cgs.clientinfo[ i ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ASGNP4
line 952
;952:			if ( !match->infoValid || match->deferred ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $517
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $515
LABELV $517
line 953
;953:				continue;
ADDRGP4 $510
JUMPV
LABELV $515
line 955
;954:			}
;955:			if ( Q_stricmp( ci->skinName, match->skinName ) ||
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $521
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
LTI4 $518
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
EQI4 $518
LABELV $521
line 956
;956:				(cgs.gametype >= GT_TEAM && ci->team != match->team) ) {
line 957
;957:				continue;
ADDRGP4 $510
JUMPV
LABELV $518
line 959
;958:			}
;959:			ci->deferred = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 1
ASGNI4
line 960
;960:			CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 961
;961:			return;
ADDRGP4 $491
JUMPV
LABELV $510
line 950
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $512
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31520
INDIRI4
LTI4 $509
line 967
;962:		}
;963:		// load the full model, because we don't ever want to show
;964:		// an improper team skin.  This will cause a hitch for the first
;965:		// player, when the second enters.  Combat shouldn't be going on
;966:		// yet, so it shouldn't matter
;967:		CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 968
;968:		return;
ADDRGP4 $491
JUMPV
LABELV $506
line 972
;969:	}
;970:
;971:	// find the first valid clientinfo and grab its stuff
;972:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $525
JUMPV
LABELV $522
line 973
;973:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ASGNP4
line 974
;974:		if ( !match->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $528
line 975
;975:			continue;
ADDRGP4 $523
JUMPV
LABELV $528
line 978
;976:		}
;977:
;978:		ci->deferred = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 1
ASGNI4
line 979
;979:		CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 980
;980:		return;
ADDRGP4 $491
JUMPV
LABELV $523
line 972
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $525
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31520
INDIRI4
LTI4 $522
line 984
;981:	}
;982:
;983:	// we should never get here...
;984:	CG_Printf( "CG_SetDeferredClientInfo: no valid clients!\n" );
ADDRGP4 $530
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 986
;985:
;986:	CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 987
;987:}
LABELV $491
endproc CG_SetDeferredClientInfo 20 8
proc CG_SetSkinAndModel 188 12
line 998
;988:
;989:
;990:static void CG_SetSkinAndModel( clientInfo_t *newInfo,
;991:		clientInfo_t *curInfo,
;992:		const char *infomodel,
;993:		qboolean allowNativeModel,
;994:		int clientNum, int myClientNum,
;995:		team_t myTeam, qboolean setColor,
;996:		char *modelName, int modelNameSize,
;997:		char *skinName, int skinNameSize ) 
;998:{
line 1006
;999:	char modelStr[ MAX_QPATH ];
;1000:	char newSkin[ MAX_QPATH ];
;1001:	char *skin, *slash;
;1002:	qboolean	pm_model;
;1003:	team_t		team;
;1004:	const char	*colors;
;1005:	
;1006:	team = newInfo->team;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
line 1007
;1007:	pm_model = ( Q_stricmp( cg_enemyModel.string, PM_SKIN ) == 0 ) ? qtrue : qfalse;
ADDRGP4 cg_enemyModel+16
ARGP4
ADDRGP4 $222
ARGP4
ADDRLP4 152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $534
ADDRLP4 148
CNSTI4 1
ASGNI4
ADDRGP4 $535
JUMPV
LABELV $534
ADDRLP4 148
CNSTI4 0
ASGNI4
LABELV $535
ADDRLP4 8
ADDRLP4 148
INDIRI4
ASGNI4
line 1009
;1008:
;1009:	if ( cg_forceModel.integer || cg_enemyModel.string[0] || cg_teamModel.string[0] )
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
NEI4 $542
ADDRGP4 cg_enemyModel+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $542
ADDRGP4 cg_teamModel+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $536
LABELV $542
line 1010
;1010:	{
line 1011
;1011:		if ( cgs.gametype >= GT_TEAM )
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
LTI4 $543
line 1012
;1012:		{
line 1014
;1013:			// enemy model
;1014:			if ( cg_enemyModel.string[0] && team != myTeam && team != TEAM_SPECTATOR ) {
ADDRGP4 cg_enemyModel+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $546
ADDRLP4 156
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 156
INDIRI4
ADDRFP4 24
INDIRI4
EQI4 $546
ADDRLP4 156
INDIRI4
CNSTI4 3
EQI4 $546
line 1015
;1015:				if ( pm_model )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $549
line 1016
;1016:					Q_strncpyz( modelName, infomodel, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $550
JUMPV
LABELV $549
line 1018
;1017:				else
;1018:					Q_strncpyz( modelName, cg_enemyModel.string, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 cg_enemyModel+16
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $550
line 1020
;1019:
;1020:				skin = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 160
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 160
INDIRP4
ASGNP4
line 1022
;1021:				// force skin
;1022:				strcpy( newSkin, PM_SKIN );
ADDRLP4 16
ARGP4
ADDRGP4 $222
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1023
;1023:				if ( skin )
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $552
line 1024
;1024:					*skin = '\0';
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
LABELV $552
line 1026
;1025:
;1026:				if ( pm_model && !CG_IsKnownModel( modelName ) ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $554
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 CG_IsKnownModel
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $554
line 1028
;1027:					// revert to default model if specified skin is not known
;1028:					Q_strncpyz( modelName, "sarge", modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 $390
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1029
;1029:				}
LABELV $554
line 1030
;1030:				Q_strncpyz( skinName, newSkin, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1032
;1031:
;1032:				if ( setColor ) {
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $537
line 1033
;1033:					if ( cg_enemyColors.string[0] && myTeam != TEAM_SPECTATOR ) // free-fly?
ADDRGP4 cg_enemyColors+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $558
ADDRFP4 24
INDIRI4
CNSTI4 3
EQI4 $558
line 1034
;1034:						colors = CG_GetTeamColors( cg_enemyColors.string, newInfo->team );
ADDRGP4 cg_enemyColors+16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 168
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 168
INDIRP4
ASGNP4
ADDRGP4 $559
JUMPV
LABELV $558
line 1036
;1035:					else
;1036:						colors = CG_GetTeamColors( "???", newInfo->team );
ADDRGP4 $562
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 172
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 172
INDIRP4
ASGNP4
LABELV $559
line 1038
;1037:
;1038:					CG_SetColorInfo( colors, newInfo );
ADDRLP4 80
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetColorInfo
CALLV
pop
line 1039
;1039:					newInfo->coloredSkin = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 1
ASGNI4
line 1040
;1040:				}
line 1042
;1041:
;1042:			} else if ( cg_teamModel.string[0] && team == myTeam && team != TEAM_SPECTATOR && clientNum != myClientNum ) {
ADDRGP4 $537
JUMPV
LABELV $546
ADDRGP4 cg_teamModel+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $563
ADDRLP4 160
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 160
INDIRI4
ADDRFP4 24
INDIRI4
NEI4 $563
ADDRLP4 160
INDIRI4
CNSTI4 3
EQI4 $563
ADDRFP4 16
INDIRI4
ADDRFP4 20
INDIRI4
EQI4 $563
line 1044
;1043:				// teammodel
;1044:				pm_model = ( Q_stricmp( cg_teamModel.string, PM_SKIN ) == 0 ) ? qtrue : qfalse;
ADDRGP4 cg_teamModel+16
ARGP4
ADDRGP4 $222
ARGP4
ADDRLP4 168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
NEI4 $568
ADDRLP4 164
CNSTI4 1
ASGNI4
ADDRGP4 $569
JUMPV
LABELV $568
ADDRLP4 164
CNSTI4 0
ASGNI4
LABELV $569
ADDRLP4 8
ADDRLP4 164
INDIRI4
ASGNI4
line 1046
;1045:
;1046:				if ( pm_model )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $570
line 1047
;1047:					Q_strncpyz( modelName, infomodel, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $571
JUMPV
LABELV $570
line 1049
;1048:				else
;1049:					Q_strncpyz( modelName, cg_teamModel.string, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 cg_teamModel+16
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $571
line 1051
;1050:
;1051:				skin = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 172
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 172
INDIRP4
ASGNP4
line 1053
;1052:				// force skin
;1053:				strcpy( newSkin, PM_SKIN );
ADDRLP4 16
ARGP4
ADDRGP4 $222
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1054
;1054:				if ( skin )
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $573
line 1055
;1055:					*skin = '\0';
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
LABELV $573
line 1057
;1056:
;1057:				if ( pm_model && !CG_IsKnownModel( modelName ) ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $575
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 CG_IsKnownModel
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
NEI4 $575
line 1059
;1058:					// revert to default model if specified skin is not known
;1059:					Q_strncpyz( modelName, "sarge", modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 $390
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1060
;1060:				}
LABELV $575
line 1061
;1061:				Q_strncpyz( skinName, newSkin, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1063
;1062:
;1063:				if ( setColor ) {
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $537
line 1064
;1064:					if ( cg_teamColors.string[0] && myTeam != TEAM_SPECTATOR ) // free-fly?
ADDRGP4 cg_teamColors+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $579
ADDRFP4 24
INDIRI4
CNSTI4 3
EQI4 $579
line 1065
;1065:						colors = CG_GetTeamColors( cg_teamColors.string, newInfo->team );
ADDRGP4 cg_teamColors+16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 180
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 180
INDIRP4
ASGNP4
ADDRGP4 $580
JUMPV
LABELV $579
line 1067
;1066:					else
;1067:						colors = CG_GetTeamColors( "???", newInfo->team );
ADDRGP4 $562
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 184
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 184
INDIRP4
ASGNP4
LABELV $580
line 1069
;1068:
;1069:					CG_SetColorInfo( colors, newInfo );
ADDRLP4 80
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetColorInfo
CALLV
pop
line 1070
;1070:					newInfo->coloredSkin = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 1
ASGNI4
line 1071
;1071:				}
line 1073
;1072:
;1073:			} else {
ADDRGP4 $537
JUMPV
LABELV $563
line 1075
;1074:				// forcemodel etc.
;1075:				if ( cg_forceModel.integer ) {
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
EQI4 $583
line 1077
;1076:
;1077:					trap_Cvar_VariableStringBuffer( "model", modelStr, sizeof( modelStr ) );
ADDRGP4 $586
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1078
;1078:					if ( ( skin = strchr( modelStr, '/' ) ) == NULL) {
ADDRLP4 84
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 164
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 164
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $587
line 1079
;1079:						skin = "default";
ADDRLP4 12
ADDRGP4 $135
ASGNP4
line 1080
;1080:					} else {
ADDRGP4 $588
JUMPV
LABELV $587
line 1081
;1081:						*skin++ = '\0';
ADDRLP4 168
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 168
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI1 0
ASGNI1
line 1082
;1082:					}
LABELV $588
line 1084
;1083:
;1084:					Q_strncpyz( skinName, skin, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1085
;1085:					Q_strncpyz( modelName, modelStr, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 84
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1087
;1086:
;1087:				} else {
ADDRGP4 $537
JUMPV
LABELV $583
line 1088
;1088:					Q_strncpyz( modelName, infomodel, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1089
;1089:					slash = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 164
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 164
INDIRP4
ASGNP4
line 1090
;1090:					if ( !slash ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $589
line 1091
;1091:						Q_strncpyz( skinName, "default", skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $135
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1092
;1092:					} else {
ADDRGP4 $537
JUMPV
LABELV $589
line 1093
;1093:						Q_strncpyz( skinName, slash + 1, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1094
;1094:						*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1095
;1095:					}
line 1096
;1096:				}
line 1097
;1097:			}
line 1098
;1098:		} else { // not team game
ADDRGP4 $537
JUMPV
LABELV $543
line 1100
;1099:
;1100:			if ( pm_model && myClientNum != clientNum && cgs.gametype != GT_SINGLE_PLAYER ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $591
ADDRFP4 20
INDIRI4
ADDRFP4 16
INDIRI4
EQI4 $591
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 2
EQI4 $591
line 1101
;1101:				Q_strncpyz( modelName, infomodel, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1104
;1102:
;1103:				// strip skin name from model name
;1104:				slash = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
line 1105
;1105:				if ( !slash ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $594
line 1106
;1106:					Q_strncpyz( skinName, PM_SKIN, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $222
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1107
;1107:				} else {
ADDRGP4 $595
JUMPV
LABELV $594
line 1108
;1108:					Q_strncpyz( skinName, PM_SKIN, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $222
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1109
;1109:					*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1110
;1110:				}
LABELV $595
line 1112
;1111:
;1112:				if ( !CG_IsKnownModel( modelName ) )
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 CG_IsKnownModel
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $596
line 1113
;1113:					Q_strncpyz( modelName, "sarge", modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 $390
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $596
line 1115
;1114:
;1115:				if ( setColor ) {
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $537
line 1116
;1116:					colors = CG_GetTeamColors( cg_enemyColors.string, newInfo->team );
ADDRGP4 cg_enemyColors+16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 164
INDIRP4
ASGNP4
line 1117
;1117:					CG_SetColorInfo( colors, newInfo );
ADDRLP4 80
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetColorInfo
CALLV
pop
line 1118
;1118:					newInfo->coloredSkin = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 1
ASGNI4
line 1119
;1119:				}
line 1121
;1120:
;1121:			} else if ( cg_enemyModel.string[0] && myClientNum != clientNum && !allowNativeModel && cgs.gametype != GT_SINGLE_PLAYER ) {
ADDRGP4 $537
JUMPV
LABELV $591
ADDRGP4 cg_enemyModel+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $601
ADDRFP4 20
INDIRI4
ADDRFP4 16
INDIRI4
EQI4 $601
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $601
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 2
EQI4 $601
line 1123
;1122:
;1123:				Q_strncpyz( modelName, cg_enemyModel.string, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 cg_enemyModel+16
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1125
;1124:
;1125:				slash = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
line 1126
;1126:				if ( !slash ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $606
line 1127
;1127:					Q_strncpyz( skinName, PM_SKIN, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $222
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1128
;1128:				} else {
ADDRGP4 $607
JUMPV
LABELV $606
line 1129
;1129:					Q_strncpyz( skinName, slash + 1, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1130
;1130:					*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1131
;1131:				}
LABELV $607
line 1133
;1132:
;1133:				if ( setColor ) {
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $537
line 1134
;1134:					colors = CG_GetTeamColors( cg_enemyColors.string, newInfo->team );
ADDRGP4 cg_enemyColors+16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 160
INDIRP4
ASGNP4
line 1135
;1135:					CG_SetColorInfo( colors, newInfo );
ADDRLP4 80
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetColorInfo
CALLV
pop
line 1136
;1136:					newInfo->coloredSkin = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 1
ASGNI4
line 1137
;1137:				}
line 1138
;1138:			} else { // forcemodel, etc.
ADDRGP4 $537
JUMPV
LABELV $601
line 1139
;1139:				if ( cg_forceModel.integer ) {
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
EQI4 $611
line 1141
;1140:
;1141:					trap_Cvar_VariableStringBuffer( "model", modelStr, sizeof( modelStr ) );
ADDRGP4 $586
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1142
;1142:					if ( ( skin = strchr( modelStr, '/' ) ) == NULL ) {
ADDRLP4 84
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 156
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $614
line 1143
;1143:						skin = "default";
ADDRLP4 12
ADDRGP4 $135
ASGNP4
line 1144
;1144:					} else {
ADDRGP4 $615
JUMPV
LABELV $614
line 1145
;1145:						*skin++ = '\0';
ADDRLP4 160
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 160
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI1 0
ASGNI1
line 1146
;1146:					}
LABELV $615
line 1148
;1147:
;1148:					Q_strncpyz( skinName, skin, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1149
;1149:					Q_strncpyz( modelName, modelStr, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 84
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1150
;1150:				} else {
ADDRGP4 $537
JUMPV
LABELV $611
line 1151
;1151:					Q_strncpyz( modelName, infomodel, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1152
;1152:						slash = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
line 1153
;1153:					if ( !slash ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $616
line 1155
;1154:						// modelName didn not include a skin name
;1155:						Q_strncpyz( skinName, "default", skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $135
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1156
;1156:					} else {
ADDRGP4 $537
JUMPV
LABELV $616
line 1157
;1157:						Q_strncpyz( skinName, slash + 1, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1159
;1158:						// truncate modelName
;1159:						*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1160
;1160:					}
line 1161
;1161:				}
line 1162
;1162:			}
line 1163
;1163:		}
line 1164
;1164:	}
ADDRGP4 $537
JUMPV
LABELV $536
line 1166
;1165:	else // !cg_forcemodel && !cg_enemyModel && !cg_teamModel
;1166:	{
line 1167
;1167:		Q_strncpyz( modelName, infomodel, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1168
;1168:		slash = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
line 1169
;1169:		if ( !slash ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $618
line 1171
;1170:			// modelName didn not include a skin name
;1171:			Q_strncpyz( skinName, "default", skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $135
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1172
;1172:		} else {
ADDRGP4 $619
JUMPV
LABELV $618
line 1173
;1173:			Q_strncpyz( skinName, slash + 1, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1175
;1174:			// truncate modelName
;1175:			*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1176
;1176:		}
LABELV $619
line 1177
;1177:	}
LABELV $537
line 1178
;1178:}
LABELV $531
endproc CG_SetSkinAndModel 188 12
export CG_NewClientInfo
proc CG_NewClientInfo 1828 48
line 1186
;1179:
;1180:
;1181:/*
;1182:======================
;1183:CG_NewClientInfo
;1184:======================
;1185:*/
;1186:void CG_NewClientInfo( int clientNum ) {
line 1200
;1187:	clientInfo_t *ci;
;1188:	clientInfo_t newInfo;
;1189:	const char	*configstring;
;1190:	const char	*v;
;1191:
;1192:	// for colored skins
;1193:	qboolean	allowNativeModel;
;1194:	int			can_defer;
;1195:	int			myClientNum;
;1196:	team_t		myTeam;
;1197:	team_t		team;
;1198:	int			len;
;1199:
;1200:	ci = &cgs.clientinfo[clientNum];
ADDRLP4 1696
ADDRFP4 0
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ASGNP4
line 1202
;1201:
;1202:	configstring = CG_ConfigString( clientNum + CS_PLAYERS );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 1716
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 1684
ADDRLP4 1716
INDIRP4
ASGNP4
line 1203
;1203:	if ( !configstring[0] ) {
ADDRLP4 1684
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $622
line 1204
;1204:		memset( ci, 0, sizeof( *ci ) );
ADDRLP4 1696
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1680
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1205
;1205:		return;	// player just left
ADDRGP4 $620
JUMPV
LABELV $622
line 1208
;1206:	}
;1207:
;1208:	if ( cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $624
line 1209
;1209:		myClientNum = cg.snap->ps.clientNum;
ADDRLP4 1700
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 1210
;1210:		myTeam = cgs.clientinfo[ myClientNum ].team;
ADDRLP4 1692
ADDRLP4 1700
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012+36
ADDP4
INDIRI4
ASGNI4
line 1211
;1211:	} else {
ADDRGP4 $625
JUMPV
LABELV $624
line 1212
;1212:		myClientNum = cg.clientNum;
ADDRLP4 1700
ADDRGP4 cg+4
INDIRI4
ASGNI4
line 1213
;1213:		myTeam = TEAM_SPECTATOR;
ADDRLP4 1692
CNSTI4 3
ASGNI4
line 1214
;1214:	}
LABELV $625
line 1217
;1215:
;1216:	// "join" team if spectating
;1217:	if ( myTeam == TEAM_SPECTATOR && cg.snap ) {
ADDRLP4 1692
INDIRI4
CNSTI4 3
NEI4 $631
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $631
line 1218
;1218:		myTeam = cg.snap->ps.persistant[ PERS_TEAM ];
ADDRLP4 1692
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ASGNI4
line 1219
;1219:	}
LABELV $631
line 1221
;1220:
;1221:	allowNativeModel = qfalse;
ADDRLP4 1704
CNSTI4 0
ASGNI4
line 1222
;1222:	if ( cgs.gametype < GT_TEAM ) {
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
GEI4 $635
line 1223
;1223:		if ( !cg.snap || ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_FREE && cg.snap->ps.clientNum == clientNum ) ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $643
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 0
NEI4 $638
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $638
LABELV $643
line 1224
;1224:			if ( cg.demoPlayback || ( cg.snap && cg.snap->ps.pm_flags & PMF_FOLLOW ) ) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $649
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $644
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $644
LABELV $649
line 1225
;1225:				allowNativeModel = qtrue;
ADDRLP4 1704
CNSTI4 1
ASGNI4
line 1226
;1226:			}
LABELV $644
line 1227
;1227:		}
LABELV $638
line 1228
;1228:	}
LABELV $635
line 1232
;1229:
;1230:	// build into a temp buffer so the defer checks can use
;1231:	// the old value
;1232:	memset( &newInfo, 0, sizeof( newInfo ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1680
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1235
;1233:
;1234:	// isolate the player's name
;1235:	v = Info_ValueForKey( configstring, "n" );
ADDRLP4 1684
INDIRP4
ARGP4
ADDRGP4 $650
ARGP4
ADDRLP4 1720
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1680
ADDRLP4 1720
INDIRP4
ASGNP4
line 1236
;1236:	Q_strncpyz( newInfo.name, v, sizeof( newInfo.name ) );
ADDRLP4 0+4
ARGP4
ADDRLP4 1680
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1239
;1237:
;1238:	// team
;1239:	v = Info_ValueForKey( configstring, "t" );
ADDRLP4 1684
INDIRP4
ARGP4
ADDRGP4 $653
ARGP4
ADDRLP4 1724
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1680
ADDRLP4 1724
INDIRP4
ASGNP4
line 1240
;1240:	team = atoi( v );
ADDRLP4 1680
INDIRP4
ARGP4
ADDRLP4 1728
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1688
ADDRLP4 1728
INDIRI4
ASGNI4
line 1241
;1241:	if ( (unsigned) team > TEAM_NUM_TEAMS ) {
ADDRLP4 1688
INDIRI4
CVIU4 4
CNSTU4 4
LEU4 $654
line 1242
;1242:		team = TEAM_SPECTATOR;
ADDRLP4 1688
CNSTI4 3
ASGNI4
line 1243
;1243:	}
LABELV $654
line 1244
;1244:	newInfo.team = team;
ADDRLP4 0+36
ADDRLP4 1688
INDIRI4
ASGNI4
line 1247
;1245:
;1246:	// colors
;1247:	v = Info_ValueForKey( configstring, "c1" );
ADDRLP4 1684
INDIRP4
ARGP4
ADDRGP4 $657
ARGP4
ADDRLP4 1732
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1680
ADDRLP4 1732
INDIRP4
ASGNP4
line 1248
;1248:	CG_ColorFromChar( v[0], newInfo.color1 );
ADDRLP4 1680
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0+44
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 1250
;1249:
;1250:	v = Info_ValueForKey( configstring, "c2" );
ADDRLP4 1684
INDIRP4
ARGP4
ADDRGP4 $659
ARGP4
ADDRLP4 1736
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1680
ADDRLP4 1736
INDIRP4
ASGNP4
line 1251
;1251:	CG_ColorFromChar( v[0], newInfo.color2 );
ADDRLP4 1680
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0+56
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 1253
;1252:
;1253:	VectorSet( newInfo.headColor, 1.0, 1.0, 1.0 );
ADDRLP4 0+1616
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1616+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1616+8
CNSTF4 1065353216
ASGNF4
line 1254
;1254:	VectorSet( newInfo.bodyColor, 1.0, 1.0, 1.0 );
ADDRLP4 0+1628
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1628+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1628+8
CNSTF4 1065353216
ASGNF4
line 1255
;1255:	VectorSet( newInfo.legsColor, 1.0, 1.0, 1.0 );
ADDRLP4 0+1640
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1640+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1640+8
CNSTF4 1065353216
ASGNF4
line 1258
;1256:
;1257:	// bot skill
;1258:	v = Info_ValueForKey( configstring, "skill" );
ADDRLP4 1684
INDIRP4
ARGP4
ADDRGP4 $676
ARGP4
ADDRLP4 1740
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1680
ADDRLP4 1740
INDIRP4
ASGNP4
line 1259
;1259:	newInfo.botSkill = atoi( v );
ADDRLP4 1680
INDIRP4
ARGP4
ADDRLP4 1744
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+40
ADDRLP4 1744
INDIRI4
ASGNI4
line 1261
;1260:
;1261:	v = Info_ValueForKey(configstring, "vt"); // vr_controller_type
ADDRLP4 1684
INDIRP4
ARGP4
ADDRGP4 $678
ARGP4
ADDRLP4 1748
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1680
ADDRLP4 1748
INDIRP4
ASGNP4
line 1262
;1262:	newInfo.vr_controller_type = atoi( v );
ADDRLP4 1680
INDIRP4
ARGP4
ADDRLP4 1752
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+1652
ADDRLP4 1752
INDIRI4
ASGNI4
line 1279
;1263:
;1264:	//GUNNM TODO pass the vrFlags int
;1265:	//v = Info_ValueForKey(configstring, "lb"); // laserBeamPlayer
;1266:	//newInfo.laserBeamPlayer = atoi( v );
;1267:
;1268:
;1269:	//GUNNM TODO
;1270:	/*v = Info_ValueForKey(configstring, "c3"); // laserBeamRGBA
;1271:	CG_ColorFromRGBAString( v, newInfo.laserBeamRGBA );*/
;1272:
;1273:	/*newInfo.c1RGBA[0] = 255 * newInfo.laserBeamRGBA[0];
;1274:	newInfo.c1RGBA[1] = 255 * newInfo.laserBeamRGBA[1];
;1275:	newInfo.c1RGBA[2] = 255 * newInfo.laserBeamRGBA[2];
;1276:	newInfo.c1RGBA[3] = 255* newInfo.laserBeamRGBA[3];*/
;1277:
;1278:	// handicap
;1279:	v = Info_ValueForKey( configstring, "hc" );
ADDRLP4 1684
INDIRP4
ARGP4
ADDRGP4 $680
ARGP4
ADDRLP4 1756
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1680
ADDRLP4 1756
INDIRP4
ASGNP4
line 1280
;1280:	newInfo.handicap = atoi( v );
ADDRLP4 1680
INDIRP4
ARGP4
ADDRLP4 1760
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+88
ADDRLP4 1760
INDIRI4
ASGNI4
line 1283
;1281:
;1282:	// wins
;1283:	v = Info_ValueForKey( configstring, "w" );
ADDRLP4 1684
INDIRP4
ARGP4
ADDRGP4 $682
ARGP4
ADDRLP4 1764
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1680
ADDRLP4 1764
INDIRP4
ASGNP4
line 1284
;1284:	newInfo.wins = atoi( v );
ADDRLP4 1680
INDIRP4
ARGP4
ADDRLP4 1768
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+92
ADDRLP4 1768
INDIRI4
ASGNI4
line 1287
;1285:
;1286:	// losses
;1287:	v = Info_ValueForKey( configstring, "l" );
ADDRLP4 1684
INDIRP4
ARGP4
ADDRGP4 $684
ARGP4
ADDRLP4 1772
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1680
ADDRLP4 1772
INDIRP4
ASGNP4
line 1288
;1288:	newInfo.losses = atoi( v );
ADDRLP4 1680
INDIRP4
ARGP4
ADDRLP4 1776
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+96
ADDRLP4 1776
INDIRI4
ASGNI4
line 1291
;1289:
;1290:	// always apply team colors [4] and [5] if specified, this will work in non-team games too
;1291:	if ( cg_teamColors.string[0] && team != TEAM_SPECTATOR ) {
ADDRGP4 cg_teamColors+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $686
ADDRLP4 1688
INDIRI4
CNSTI4 3
EQI4 $686
line 1292
;1292:		if ( allowNativeModel || ( ( team == TEAM_RED || team == TEAM_BLUE ) && team == myTeam && ( clientNum != myClientNum || cg.demoPlayback ) ) ) {
ADDRLP4 1704
INDIRI4
CNSTI4 0
NEI4 $694
ADDRLP4 1688
INDIRI4
CNSTI4 1
EQI4 $693
ADDRLP4 1688
INDIRI4
CNSTI4 2
NEI4 $689
LABELV $693
ADDRLP4 1688
INDIRI4
ADDRLP4 1692
INDIRI4
NEI4 $689
ADDRFP4 0
INDIRI4
ADDRLP4 1700
INDIRI4
NEI4 $694
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
EQI4 $689
LABELV $694
line 1293
;1293:			v = CG_GetTeamColors( cg_teamColors.string, team );
ADDRGP4 cg_teamColors+16
ARGP4
ADDRLP4 1688
INDIRI4
ARGI4
ADDRLP4 1784
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 1680
ADDRLP4 1784
INDIRP4
ASGNP4
line 1294
;1294:			len = strlen( v );
ADDRLP4 1680
INDIRP4
ARGP4
ADDRLP4 1788
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1712
ADDRLP4 1788
INDIRI4
ASGNI4
line 1295
;1295:			if ( len >= 4 )
ADDRLP4 1712
INDIRI4
CNSTI4 4
LTI4 $696
line 1296
;1296:				CG_ColorFromChar( v[3], newInfo.color1 );
ADDRLP4 1680
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0+44
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
LABELV $696
line 1297
;1297:			if ( len >= 5 )
ADDRLP4 1712
INDIRI4
CNSTI4 5
LTI4 $699
line 1298
;1298:				CG_ColorFromChar( v[4], newInfo.color2 );
ADDRLP4 1680
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0+56
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
LABELV $699
line 1299
;1299:		}
LABELV $689
line 1300
;1300:	}
LABELV $686
line 1303
;1301:
;1302:	// team task
;1303:	v = Info_ValueForKey( configstring, "tt" );
ADDRLP4 1684
INDIRP4
ARGP4
ADDRGP4 $702
ARGP4
ADDRLP4 1780
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1680
ADDRLP4 1780
INDIRP4
ASGNP4
line 1304
;1304:	newInfo.teamTask = atoi(v);
ADDRLP4 1680
INDIRP4
ARGP4
ADDRLP4 1784
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+100
ADDRLP4 1784
INDIRI4
ASGNI4
line 1307
;1305:
;1306:	// team leader
;1307:	v = Info_ValueForKey( configstring, "tl" );
ADDRLP4 1684
INDIRP4
ARGP4
ADDRGP4 $704
ARGP4
ADDRLP4 1788
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1680
ADDRLP4 1788
INDIRP4
ASGNP4
line 1308
;1308:	newInfo.teamLeader = atoi(v);
ADDRLP4 1680
INDIRP4
ARGP4
ADDRLP4 1792
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+104
ADDRLP4 1792
INDIRI4
ASGNI4
line 1311
;1309:
;1310:	// model
;1311:	v = Info_ValueForKey( configstring, "model" );
ADDRLP4 1684
INDIRP4
ARGP4
ADDRGP4 $586
ARGP4
ADDRLP4 1796
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1680
ADDRLP4 1796
INDIRP4
ASGNP4
line 1312
;1312:	CG_SetSkinAndModel( &newInfo, ci, v, allowNativeModel, clientNum, myClientNum, myTeam, qtrue, 
ADDRLP4 0
ARGP4
ADDRLP4 1696
INDIRP4
ARGP4
ADDRLP4 1680
INDIRP4
ARGP4
ADDRLP4 1704
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1700
INDIRI4
ARGI4
ADDRLP4 1692
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0+128
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0+192
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 CG_SetSkinAndModel
CALLV
pop
line 1316
;1313:		newInfo.modelName, sizeof( newInfo.modelName ),	newInfo.skinName, sizeof( newInfo.skinName ) );
;1314:
;1315:	// head model
;1316:	v = Info_ValueForKey( configstring, "hmodel" );
ADDRLP4 1684
INDIRP4
ARGP4
ADDRGP4 $710
ARGP4
ADDRLP4 1800
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1680
ADDRLP4 1800
INDIRP4
ASGNP4
line 1317
;1317:	CG_SetSkinAndModel( &newInfo, ci, v, allowNativeModel, clientNum, myClientNum, myTeam, qfalse, 
ADDRLP4 0
ARGP4
ADDRLP4 1696
INDIRP4
ARGP4
ADDRLP4 1680
INDIRP4
ARGP4
ADDRLP4 1704
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1700
INDIRI4
ARGI4
ADDRLP4 1692
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0+256
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0+320
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 CG_SetSkinAndModel
CALLV
pop
line 1321
;1318:		newInfo.headModelName, sizeof( newInfo.headModelName ),	newInfo.headSkinName, sizeof( newInfo.headSkinName ) );
;1319:
;1320:	// allow deferred load at some conditions
;1321:	can_defer = cg_deferPlayers.integer == 2 || ( cg_deferPlayers.integer == 1 && myTeam != TEAM_SPECTATOR && team == TEAM_SPECTATOR );
ADDRGP4 cg_deferPlayers+12
INDIRI4
CNSTI4 2
EQI4 $720
ADDRGP4 cg_deferPlayers+12
INDIRI4
CNSTI4 1
NEI4 $718
ADDRLP4 1692
INDIRI4
CNSTI4 3
EQI4 $718
ADDRLP4 1688
INDIRI4
CNSTI4 3
NEI4 $718
LABELV $720
ADDRLP4 1804
CNSTI4 1
ASGNI4
ADDRGP4 $719
JUMPV
LABELV $718
ADDRLP4 1804
CNSTI4 0
ASGNI4
LABELV $719
ADDRLP4 1708
ADDRLP4 1804
INDIRI4
ASGNI4
line 1325
;1322:
;1323:	// scan for an existing clientinfo that matches this modelname
;1324:	// so we can avoid loading checks if possible
;1325:	if ( !CG_ScanForExistingClientInfo( &newInfo ) ) {
ADDRLP4 0
ARGP4
ADDRLP4 1808
ADDRGP4 CG_ScanForExistingClientInfo
CALLI4
ASGNI4
ADDRLP4 1808
INDIRI4
CNSTI4 0
NEI4 $721
line 1329
;1326:		qboolean	forceDefer;
;1327:		qboolean 	myself;
;1328:
;1329:		forceDefer = trap_MemoryRemaining() < 4000000;
ADDRLP4 1824
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 1824
INDIRI4
CNSTI4 4000000
GEI4 $724
ADDRLP4 1820
CNSTI4 1
ASGNI4
ADDRGP4 $725
JUMPV
LABELV $724
ADDRLP4 1820
CNSTI4 0
ASGNI4
LABELV $725
ADDRLP4 1812
ADDRLP4 1820
INDIRI4
ASGNI4
line 1330
;1330:		myself = qfalse;// (clientNum == cg.snap->ps.clientNum); // no need to defer loading of the client / bug with native as cg.snap is NULL -------------------------------------------------------------------------------
ADDRLP4 1816
CNSTI4 0
ASGNI4
line 1333
;1331:
;1332:		// if we are defering loads, just have it pick the first valid
;1333:		if ( forceDefer || (can_defer && !cg_buildScript.integer && !cg.loading) && !myself ) {
ADDRLP4 1812
INDIRI4
CNSTI4 0
NEI4 $730
ADDRLP4 1708
INDIRI4
CNSTI4 0
EQI4 $726
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
NEI4 $726
ADDRGP4 cg+20
INDIRI4
CNSTI4 0
NEI4 $726
ADDRLP4 1816
INDIRI4
CNSTI4 0
NEI4 $726
LABELV $730
line 1335
;1334:			// keep whatever they had if it won't violate team skins
;1335:			CG_SetDeferredClientInfo( &newInfo );
ADDRLP4 0
ARGP4
ADDRGP4 CG_SetDeferredClientInfo
CALLV
pop
line 1337
;1336:			// if we are low on memory, leave them with this model
;1337:			if ( forceDefer ) {
ADDRLP4 1812
INDIRI4
CNSTI4 0
EQI4 $727
line 1338
;1338:				CG_Printf( "Memory is low. Using deferred model.\n" );
ADDRGP4 $733
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1339
;1339:				newInfo.deferred = qfalse;
ADDRLP4 0+384
CNSTI4 0
ASGNI4
line 1340
;1340:			}
line 1341
;1341:		} else {
ADDRGP4 $727
JUMPV
LABELV $726
line 1342
;1342:			CG_LoadClientInfo( &newInfo );
ADDRLP4 0
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1343
;1343:		}
LABELV $727
line 1344
;1344:	}
LABELV $721
line 1347
;1345:
;1346:	// replace whatever was there with the new one
;1347:	newInfo.infoValid = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1348
;1348:	*ci = newInfo;
ADDRLP4 1696
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 1680
line 1349
;1349:}
LABELV $620
endproc CG_NewClientInfo 1828 48
export CG_LoadDeferredPlayers
proc CG_LoadDeferredPlayers 16 4
line 1361
;1350:
;1351:
;1352:/*
;1353:======================
;1354:CG_LoadDeferredPlayers
;1355:
;1356:Called each frame when a player is dead
;1357:and the scoreboard is up
;1358:so deferred players can be loaded
;1359:======================
;1360:*/
;1361:void CG_LoadDeferredPlayers( void ) {
line 1366
;1362:	int		i;
;1363:	clientInfo_t	*ci;
;1364:
;1365:	// scan for a deferred player to load
;1366:	for ( i = 0, ci = cgs.clientinfo ; i < cgs.maxclients ; i++, ci++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cgs+41012
ASGNP4
ADDRGP4 $739
JUMPV
LABELV $736
line 1367
;1367:		if ( ci->infoValid && ci->deferred ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $742
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $742
line 1369
;1368:			// if we are low on memory, leave it deferred
;1369:			if ( trap_MemoryRemaining() < 4000000 ) {
ADDRLP4 12
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4000000
GEI4 $744
line 1370
;1370:				CG_Printf( "Memory is low.  Using deferred model.\n" );
ADDRGP4 $746
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1371
;1371:				ci->deferred = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 0
ASGNI4
line 1372
;1372:				continue;
ADDRGP4 $737
JUMPV
LABELV $744
line 1374
;1373:			}
;1374:			CG_LoadClientInfo( ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1376
;1375://			break;
;1376:		}
LABELV $742
line 1377
;1377:	}
LABELV $737
line 1366
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1680
ADDP4
ASGNP4
LABELV $739
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31520
INDIRI4
LTI4 $736
line 1378
;1378:}
LABELV $735
endproc CG_LoadDeferredPlayers 16 4
proc CG_SetLerpFrameAnimation 12 8
line 1396
;1379:
;1380:/*
;1381:=============================================================================
;1382:
;1383:PLAYER ANIMATION
;1384:
;1385:=============================================================================
;1386:*/
;1387:
;1388:
;1389:/*
;1390:===============
;1391:CG_SetLerpFrameAnimation
;1392:
;1393:may include ANIM_TOGGLEBIT
;1394:===============
;1395:*/
;1396:static void CG_SetLerpFrameAnimation( clientInfo_t *ci, lerpFrame_t *lf, int newAnimation ) {
line 1399
;1397:	animation_t	*anim;
;1398:
;1399:	lf->animationNumber = newAnimation;
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1400
;1400:	newAnimation &= ~ANIM_TOGGLEBIT;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1402
;1401:
;1402:	if ( newAnimation < 0 || newAnimation >= MAX_TOTALANIMATIONS ) {
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $750
ADDRLP4 4
INDIRI4
CNSTI4 37
LTI4 $748
LABELV $750
line 1403
;1403:		CG_Error( "Bad animation number: %i", newAnimation );
ADDRGP4 $751
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1404
;1404:	}
LABELV $748
line 1406
;1405:
;1406:	anim = &ci->animations[ newAnimation ];
ADDRLP4 0
ADDRFP4 8
INDIRI4
CNSTI4 28
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDP4
ASGNP4
line 1408
;1407:
;1408:	lf->animation = anim;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1409
;1409:	lf->animationTime = lf->frameTime + anim->initialLerp;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1411
;1410:
;1411:	if ( cg_debugAnim.integer ) {
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $752
line 1412
;1412:		CG_Printf( "Anim: %i\n", newAnimation );
ADDRGP4 $755
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1413
;1413:	}
LABELV $752
line 1414
;1414:}
LABELV $747
endproc CG_SetLerpFrameAnimation 12 8
proc CG_RunLerpFrame 36 12
line 1425
;1415:
;1416:
;1417:/*
;1418:===============
;1419:CG_RunLerpFrame
;1420:
;1421:Sets cg.snap, cg.oldFrame, and cg.backlerp
;1422:cg.time should be between oldFrameTime and frameTime after exit
;1423:===============
;1424:*/
;1425:static void CG_RunLerpFrame( clientInfo_t *ci, lerpFrame_t *lf, int newAnimation, float speedScale ) {
line 1430
;1426:	int			f, numFrames;
;1427:	animation_t	*anim;
;1428:
;1429:	// debugging tool to get no animations
;1430:	if ( cg_animSpeed.integer == 0 ) {
ADDRGP4 cg_animSpeed+12
INDIRI4
CNSTI4 0
NEI4 $757
line 1431
;1431:		lf->oldFrame = lf->frame = lf->backlerp = 0;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1432
;1432:		return;
ADDRGP4 $756
JUMPV
LABELV $757
line 1436
;1433:	}
;1434:
;1435:	// see if the animation sequence is switching
;1436:	if ( newAnimation != lf->animationNumber || !lf->animation ) {
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
NEI4 $762
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $760
LABELV $762
line 1437
;1437:		CG_SetLerpFrameAnimation( ci, lf, newAnimation );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 1438
;1438:	}
LABELV $760
line 1442
;1439:
;1440:	// if we have passed the current frame, move it to
;1441:	// oldFrame and calculate a new frame
;1442:	if ( cg.time >= lf->frameTime ) {
ADDRGP4 cg+234764
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LTI4 $763
line 1443
;1443:		lf->oldFrame = lf->frame;
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1444
;1444:		lf->oldFrameTime = lf->frameTime;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1447
;1445:
;1446:		// get the next frame based on the animation
;1447:		anim = lf->animation;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ASGNP4
line 1448
;1448:		if ( !anim->frameLerp ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $766
line 1449
;1449:			return;		// shouldn't happen
ADDRGP4 $756
JUMPV
LABELV $766
line 1451
;1450:		}
;1451:		if ( cg.time < lf->animationTime ) {
ADDRGP4 cg+234764
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
GEI4 $768
line 1452
;1452:			lf->frameTime = lf->animationTime;		// initial lerp
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 1453
;1453:		} else {
ADDRGP4 $769
JUMPV
LABELV $768
line 1454
;1454:			lf->frameTime = lf->oldFrameTime + anim->frameLerp;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1455
;1455:		}
LABELV $769
line 1456
;1456:		f = ( lf->frameTime - lf->animationTime ) / anim->frameLerp;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
DIVI4
ASGNI4
line 1457
;1457:		f *= speedScale;		// adjust for haste, etc
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRFP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1459
;1458:
;1459:		numFrames = anim->numFrames;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1460
;1460:		if (anim->flipflop) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $771
line 1461
;1461:			numFrames *= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1462
;1462:		}
LABELV $771
line 1463
;1463:		if ( f >= numFrames ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $773
line 1464
;1464:			f -= numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1465
;1465:			if ( anim->loopFrames ) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
EQI4 $775
line 1466
;1466:				f %= anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MODI4
ASGNI4
line 1467
;1467:				f += anim->numFrames - anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
ADDI4
ASGNI4
line 1468
;1468:			} else {
ADDRGP4 $776
JUMPV
LABELV $775
line 1469
;1469:				f = numFrames - 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1472
;1470:				// the animation is stuck at the end, so it
;1471:				// can immediately transition to another sequence
;1472:				lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 1473
;1473:			}
LABELV $776
line 1474
;1474:		}
LABELV $773
line 1475
;1475:		if ( anim->reversed ) {
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $778
line 1476
;1476:			lf->frame = anim->firstFrame + anim->numFrames - 1 - f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 1477
;1477:		}
ADDRGP4 $779
JUMPV
LABELV $778
line 1478
;1478:		else if (anim->flipflop && f>=anim->numFrames) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $780
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $780
line 1479
;1479:			lf->frame = anim->firstFrame + anim->numFrames - 1 - (f%anim->numFrames);
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
MODI4
SUBI4
ASGNI4
line 1480
;1480:		}
ADDRGP4 $781
JUMPV
LABELV $780
line 1481
;1481:		else {
line 1482
;1482:			lf->frame = anim->firstFrame + f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1483
;1483:		}
LABELV $781
LABELV $779
line 1484
;1484:		if ( cg.time > lf->frameTime ) {
ADDRGP4 cg+234764
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $782
line 1485
;1485:			lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 1486
;1486:			if ( cg_debugAnim.integer ) {
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $786
line 1487
;1487:				CG_Printf( "Clamp lf->frameTime\n");
ADDRGP4 $789
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1488
;1488:			}
LABELV $786
line 1489
;1489:		}
LABELV $782
line 1490
;1490:	}
LABELV $763
line 1492
;1491:
;1492:	if ( lf->frameTime > cg.time + 200 ) {
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRGP4 cg+234764
INDIRI4
CNSTI4 200
ADDI4
LEI4 $790
line 1493
;1493:		lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 1494
;1494:	}
LABELV $790
line 1496
;1495:
;1496:	if ( lf->oldFrameTime > cg.time ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 cg+234764
INDIRI4
LEI4 $794
line 1497
;1497:		lf->oldFrameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 1498
;1498:	}
LABELV $794
line 1500
;1499:	// calculate current lerp value
;1500:	if ( lf->frameTime == lf->oldFrameTime ) {
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $798
line 1501
;1501:		lf->backlerp = 0;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 0
ASGNF4
line 1502
;1502:	} else {
ADDRGP4 $799
JUMPV
LABELV $798
line 1503
;1503:		lf->backlerp = 1.0 - (float)( cg.time - lf->oldFrameTime ) / ( lf->frameTime - lf->oldFrameTime );
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 1065353216
ADDRGP4 cg+234764
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 1504
;1504:	}
LABELV $799
line 1505
;1505:}
LABELV $756
endproc CG_RunLerpFrame 36 12
proc CG_ClearLerpFrame 16 12
line 1513
;1506:
;1507:
;1508:/*
;1509:===============
;1510:CG_ClearLerpFrame
;1511:===============
;1512:*/
;1513:static void CG_ClearLerpFrame( clientInfo_t *ci, lerpFrame_t *lf, int animationNumber ) {
line 1514
;1514:	lf->frameTime = lf->oldFrameTime = cg.time;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRGP4 cg+234764
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1515
;1515:	CG_SetLerpFrameAnimation( ci, lf, animationNumber );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 1516
;1516:	lf->oldFrame = lf->frame = lf->animation->firstFrame;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1517
;1517:}
LABELV $801
endproc CG_ClearLerpFrame 16 12
proc CG_PlayerAnimation 20 16
line 1526
;1518:
;1519:
;1520:/*
;1521:===============
;1522:CG_PlayerAnimation
;1523:===============
;1524:*/
;1525:static void CG_PlayerAnimation( centity_t *cent, int *legsOld, int *legs, float *legsBackLerp,
;1526:						int *torsoOld, int *torso, float *torsoBackLerp ) {
line 1531
;1527:	clientInfo_t	*ci;
;1528:	int				clientNum;
;1529:	float			speedScale;
;1530:
;1531:	clientNum = cent->currentState.clientNum;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1533
;1532:
;1533:	if ( cg_noPlayerAnims.integer ) {
ADDRGP4 cg_noPlayerAnims+12
INDIRI4
CNSTI4 0
EQI4 $804
line 1534
;1534:		*legsOld = *legs = *torsoOld = *torso = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1535
;1535:		return;
ADDRGP4 $803
JUMPV
LABELV $804
line 1538
;1536:	}
;1537:
;1538:	if ( cent->currentState.powerups & ( 1 << PW_HASTE ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $807
line 1539
;1539:		speedScale = 1.5;
ADDRLP4 4
CNSTF4 1069547520
ASGNF4
line 1540
;1540:	} else {
ADDRGP4 $808
JUMPV
LABELV $807
line 1541
;1541:		speedScale = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1542
;1542:	}
LABELV $808
line 1544
;1543:
;1544:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ASGNP4
line 1547
;1545:
;1546:	// do the shuffle turn frames locally
;1547:	if ( cent->pe.legs.yawing && ( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) == LEGS_IDLE ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
CNSTI4 0
EQI4 $810
ADDRLP4 12
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 22
NEI4 $810
line 1548
;1548:		CG_RunLerpFrame( ci, &cent->pe.legs, LEGS_TURN, speedScale );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
ARGP4
CNSTI4 24
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1549
;1549:	} else {
ADDRGP4 $811
JUMPV
LABELV $810
line 1550
;1550:		CG_RunLerpFrame( ci, &cent->pe.legs, cent->currentState.legsAnim, speedScale );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 956
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1551
;1551:	}
LABELV $811
line 1553
;1552:
;1553:	*legsOld = cent->pe.legs.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ASGNI4
line 1554
;1554:	*legs = cent->pe.legs.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
ASGNI4
line 1555
;1555:	*legsBackLerp = cent->pe.legs.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 972
ADDP4
INDIRF4
ASGNF4
line 1557
;1556:
;1557:	CG_RunLerpFrame( ci, &cent->pe.torso, cent->currentState.torsoAnim, speedScale );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1004
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1559
;1558:
;1559:	*torsoOld = cent->pe.torso.oldFrame;
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
ASGNI4
line 1560
;1560:	*torso = cent->pe.torso.frame;
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ASGNI4
line 1561
;1561:	*torsoBackLerp = cent->pe.torso.backlerp;
ADDRFP4 24
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
ASGNF4
line 1562
;1562:}
LABELV $803
endproc CG_PlayerAnimation 20 16
proc CG_SwingAngles 28 8
line 1578
;1563:
;1564:/*
;1565:=============================================================================
;1566:
;1567:PLAYER ANGLES
;1568:
;1569:=============================================================================
;1570:*/
;1571:
;1572:/*
;1573:==================
;1574:CG_SwingAngles
;1575:==================
;1576:*/
;1577:static void CG_SwingAngles( float destination, float swingTolerance, float clampTolerance,
;1578:					float speed, float *angle, qboolean *swinging ) {
line 1583
;1579:	float	swing;
;1580:	float	move;
;1581:	float	scale;
;1582:
;1583:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $813
line 1585
;1584:		// see if a swing should be started
;1585:		swing = AngleSubtract( *angle, destination );
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 1586
;1586:		if ( swing > swingTolerance || swing < -swingTolerance ) {
ADDRLP4 20
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
GTF4 $817
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
NEGF4
GEF4 $815
LABELV $817
line 1587
;1587:			*swinging = qtrue;
ADDRFP4 20
INDIRP4
CNSTI4 1
ASGNI4
line 1588
;1588:		}
LABELV $815
line 1589
;1589:	}
LABELV $813
line 1591
;1590:
;1591:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $818
line 1592
;1592:		return;
ADDRGP4 $812
JUMPV
LABELV $818
line 1597
;1593:	}
;1594:	
;1595:	// modify the speed depending on the delta
;1596:	// so it doesn't seem so linear
;1597:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 1598
;1598:	scale = fabs( swing );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
ASGNF4
line 1599
;1599:	if ( scale < swingTolerance * 0.5 ) {
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
CNSTF4 1056964608
MULF4
GEF4 $820
line 1600
;1600:		scale = 0.5;
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 1601
;1601:	} else if ( scale < swingTolerance ) {
ADDRGP4 $821
JUMPV
LABELV $820
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
GEF4 $822
line 1602
;1602:		scale = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1603
;1603:	} else {
ADDRGP4 $823
JUMPV
LABELV $822
line 1604
;1604:		scale = 2.0;
ADDRLP4 4
CNSTF4 1073741824
ASGNF4
line 1605
;1605:	}
LABELV $823
LABELV $821
line 1608
;1606:
;1607:	// swing towards the destination angle
;1608:	if ( swing >= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LTF4 $824
line 1609
;1609:		move = cg.frametime * scale * speed;
ADDRLP4 8
ADDRGP4 cg+234760
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 1610
;1610:		if ( move >= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
LTF4 $827
line 1611
;1611:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 1612
;1612:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 1613
;1613:		}
LABELV $827
line 1614
;1614:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1615
;1615:	} else {
ADDRGP4 $825
JUMPV
LABELV $824
line 1616
;1616:		move = cg.frametime * scale * -speed;
ADDRLP4 8
ADDRGP4 cg+234760
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
NEGF4
MULF4
ASGNF4
line 1617
;1617:		if ( move <= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $830
line 1618
;1618:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 1619
;1619:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 1620
;1620:		}
LABELV $830
line 1621
;1621:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1622
;1622:	}
LABELV $825
line 1625
;1623:
;1624:	// clamp to no more than tolerance
;1625:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 1626
;1626:	if ( swing > clampTolerance ) {
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $832
line 1627
;1627:		*angle = AngleMod( destination - (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
SUBF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1628
;1628:	} else if ( swing < -clampTolerance ) {
ADDRGP4 $833
JUMPV
LABELV $832
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $834
line 1629
;1629:		*angle = AngleMod( destination + (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1630
;1630:	}
LABELV $834
LABELV $833
line 1631
;1631:}
LABELV $812
endproc CG_SwingAngles 28 8
proc CG_AddPainTwitch 12 0
line 1639
;1632:
;1633:
;1634:/*
;1635:=================
;1636:CG_AddPainTwitch
;1637:=================
;1638:*/
;1639:static void CG_AddPainTwitch( centity_t *cent, vec3_t torsoAngles ) {
line 1643
;1640:	int		t;
;1641:	float	f;
;1642:
;1643:	t = cg.time - cent->pe.painTime;
ADDRLP4 0
ADDRGP4 cg+234764
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1100
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1644
;1644:	if ( t >= PAIN_TWITCH_TIME ) {
ADDRLP4 0
INDIRI4
CNSTI4 200
LTI4 $838
line 1645
;1645:		return;
ADDRGP4 $836
JUMPV
LABELV $838
line 1648
;1646:	}
;1647:
;1648:	f = 1.0 - (float)t / PAIN_TWITCH_TIME;
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1000593162
MULF4
SUBF4
ASGNF4
line 1650
;1649:
;1650:	if ( cent->pe.painDirection ) {
ADDRFP4 0
INDIRP4
CNSTI4 1104
ADDP4
INDIRI4
CNSTI4 0
EQI4 $840
line 1651
;1651:		torsoAngles[ROLL] += 20 * f;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1101004800
MULF4
ADDF4
ASGNF4
line 1652
;1652:	} else {
ADDRGP4 $841
JUMPV
LABELV $840
line 1653
;1653:		torsoAngles[ROLL] -= 20 * f;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1101004800
MULF4
SUBF4
ASGNF4
line 1654
;1654:	}
LABELV $841
line 1655
;1655:}
LABELV $836
endproc CG_AddPainTwitch 12 0
data
align 4
LABELV $843
byte 4 0
byte 4 22
byte 4 45
byte 4 -22
byte 4 0
byte 4 22
byte 4 -45
byte 4 -22
code
proc CG_PlayerAngles 184 24
line 1673
;1656:
;1657:
;1658:/*
;1659:===============
;1660:CG_PlayerAngles
;1661:
;1662:Handles separate torso motion
;1663:
;1664:  legs pivot based on direction of movement
;1665:
;1666:  head always looks exactly at cent->lerpAngles
;1667:
;1668:  if motion < 20 degrees, show in head only
;1669:  if < 45 degrees, also show in torso
;1670:===============
;1671:*/
;1672:
;1673:static void CG_PlayerAngles( centity_t *cent, vec3_t legs[3], vec3_t torso[3], vec3_t head[3] ) {
line 1684
;1674:	vec3_t			legsAngles, torsoAngles, headAngles, weaponAngles;
;1675:	float			dest;
;1676:	static	int		movementOffsets[8] = { 0, 22, 45, -22, 0, 22, -45, -22 };
;1677:	vec3_t			velocity;
;1678:	float			speed;
;1679:	int				dir, clientNum;
;1680:	qboolean 		isDead, fixedtorso, fixedlegs;
;1681:	int 			vr_controller_type;
;1682:	vec3_t			rightAngles;
;1683:	qboolean		firstPersonBody;
;1684:	qboolean		mySelf = (cent->currentState.number == cg.snap->ps.clientNum);
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $846
ADDRLP4 112
CNSTI4 1
ASGNI4
ADDRGP4 $847
JUMPV
LABELV $846
ADDRLP4 112
CNSTI4 0
ASGNI4
LABELV $847
ADDRLP4 92
ADDRLP4 112
INDIRI4
ASGNI4
line 1686
;1685:
;1686:	isDead = fixedtorso = fixedlegs = qfalse;
ADDRLP4 116
CNSTI4 0
ASGNI4
ADDRLP4 100
ADDRLP4 116
INDIRI4
ASGNI4
ADDRLP4 96
ADDRLP4 116
INDIRI4
ASGNI4
ADDRLP4 64
ADDRLP4 116
INDIRI4
ASGNI4
line 1692
;1687:
;1688:#ifdef USE_VR
;1689:	//========================
;1690:	// Get weapon hand angles
;1691:	//========================
;1692:	VR_get_cent_controller_angles( cent, rightAngles, SideRIGHT );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 80
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 VR_get_cent_controller_angles
CALLV
pop
line 1695
;1693:
;1694:	//qboolean firstPersonBody = mySelf && (!cg.renderingThirdPerson) && (cg_firstPersonBodyScale.value > 0.0f);
;1695:	firstPersonBody = mySelf && (!cg.renderingThirdPerson);
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $850
ADDRGP4 cg+234788
INDIRI4
CNSTI4 0
NEI4 $850
ADDRLP4 120
CNSTI4 1
ASGNI4
ADDRGP4 $851
JUMPV
LABELV $850
ADDRLP4 120
CNSTI4 0
ASGNI4
LABELV $851
ADDRLP4 104
ADDRLP4 120
INDIRI4
ASGNI4
line 1697
;1696:
;1697:	if ( cg.vr_controller_type >= 2 && firstPersonBody )
ADDRGP4 cg+282972
INDIRI4
CNSTI4 2
LTI4 $852
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $852
line 1698
;1698:	{
line 1707
;1699:		//=====================================
;1700:		//				6 Dof
;1701:		//=====================================
;1702:		// get the player model information
;1703:
;1704:		vec3_t headAngles, legsAngles;
;1705:		float ctrlYaw;
;1706:
;1707:		if ( mySelf ) {
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $855
line 1708
;1708:			VR_get_client_HMD_angles( headAngles );
ADDRLP4 136
ARGP4
ADDRGP4 VR_get_client_HMD_angles
CALLV
pop
line 1709
;1709:		}
ADDRGP4 $856
JUMPV
LABELV $855
line 1710
;1710:		else if ( cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $857
line 1711
;1711:			VectorCopy(cg.snap->ps.viewangles, headAngles);
ADDRLP4 136
ADDRGP4 cg+36
INDIRP4
CNSTI4 196
ADDP4
INDIRB
ASGNB 12
line 1712
;1712:		}
LABELV $857
LABELV $856
line 1717
;1713:
;1714:#ifdef USE_NATIVE_HACK
;1715:		ctrlYaw = rightAngles[YAW];
;1716:#else
;1717:		if ( cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $861
line 1718
;1718:			ctrlYaw = cg.snap->ps.right_hand_angles[YAW];
ADDRLP4 148
ADDRGP4 cg+36
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ASGNF4
line 1719
;1719:		}
LABELV $861
line 1722
;1720:#endif
;1721:
;1722:		VectorClear(legsAngles);
ADDRLP4 124
CNSTF4 0
ASGNF4
ADDRLP4 124+4
CNSTF4 0
ASGNF4
ADDRLP4 124+8
CNSTF4 0
ASGNF4
line 1724
;1723:
;1724:		legsAngles[YAW] = cg.refdefViewAngles[YAW] + headAngles[YAW] - ctrlYaw;
ADDRLP4 124+4
ADDRGP4 cg+237172+4
INDIRF4
ADDRLP4 136+4
INDIRF4
ADDF4
ADDRLP4 148
INDIRF4
SUBF4
ASGNF4
line 1727
;1725:
;1726:		// only show a fraction of the pitch angle in the legs
;1727:		CG_SwingAngles(legsAngles[YAW], 40, 90, cg_swingSpeed.value, &cent->pe.legs.yawAngle, &cent->pe.legs.yawing);
ADDRLP4 124+4
INDIRF4
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1119092736
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 976
ADDP4
ARGP4
ADDRLP4 152
INDIRP4
CNSTI4 980
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1728
;1728:		legsAngles[YAW] = cent->pe.legs.yawAngle;
ADDRLP4 124+4
ADDRFP4 0
INDIRP4
CNSTI4 976
ADDP4
INDIRF4
ASGNF4
line 1730
;1729:
;1730:		AnglesToAxis( legsAngles, legs );
ADDRLP4 124
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1737
;1731:
;1732:		/*VectorScale(legs.axis[0], cg_firstPersonBodyScale.value, legs.axis[0]);
;1733:		VectorScale(legs.axis[1], cg_firstPersonBodyScale.value, legs.axis[1]);
;1734:		VectorScale(legs.axis[2], cg_firstPersonBodyScale.value, legs.axis[2]);*/
;1735:
;1736:		//AnglesToAxis(vec3_origin, torso.axis);
;1737:		AnglesToAxis( rightAngles, torso );
ADDRLP4 80
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1743
;1738:
;1739:		/*VectorScale(torso.axis[0], cg_firstPersonBodyScale.value, torso.axis[0]);
;1740:		VectorScale(torso.axis[1], cg_firstPersonBodyScale.value, torso.axis[1]);
;1741:		VectorScale(torso.axis[2], cg_firstPersonBodyScale.value, torso.axis[2]);*/
;1742:
;1743:		headAngles[YAW] -= ctrlYaw;
ADDRLP4 136+4
ADDRLP4 136+4
INDIRF4
ADDRLP4 148
INDIRF4
SUBF4
ASGNF4
line 1744
;1744:		AnglesToAxis( headAngles, head );
ADDRLP4 136
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1745
;1745:		return;
ADDRGP4 $842
JUMPV
LABELV $852
line 1749
;1746:	}
;1747:#endif
;1748:
;1749:	VectorCopy( cent->lerpAngles, headAngles );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 1224
ADDP4
INDIRB
ASGNB 12
line 1750
;1750:	headAngles[YAW] = AngleMod( headAngles[YAW] );
ADDRLP4 24+4
INDIRF4
ARGF4
ADDRLP4 124
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 124
INDIRF4
ASGNF4
line 1751
;1751:	VectorClear( legsAngles );
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 12+4
CNSTF4 0
ASGNF4
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1752
;1752:	VectorClear( torsoAngles );
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0+4
CNSTF4 0
ASGNF4
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1753
;1753:	VectorClear( weaponAngles );
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 52+4
CNSTF4 0
ASGNF4
ADDRLP4 52+8
CNSTF4 0
ASGNF4
line 1755
;1754:
;1755:	clientNum = cent->currentState.clientNum;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1756
;1756:	if (clientNum >= 0 && clientNum < MAX_CLIENTS) {
ADDRLP4 76
INDIRI4
CNSTI4 0
LTI4 $883
ADDRLP4 76
INDIRI4
CNSTI4 64
GEI4 $883
line 1757
;1757:		clientInfo_t *ci = &cgs.clientinfo[clientNum];
ADDRLP4 132
ADDRLP4 76
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ASGNP4
line 1758
;1758:		if ( ci->infoValid ) {
ADDRLP4 132
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $886
line 1759
;1759:			vr_controller_type = ci->vr_controller_type;
ADDRLP4 48
ADDRLP4 132
INDIRP4
CNSTI4 1652
ADDP4
INDIRI4
ASGNI4
line 1760
;1760:			fixedtorso = ci->fixedtorso;
ADDRLP4 96
ADDRLP4 132
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ASGNI4
line 1761
;1761:			fixedlegs  = ci->fixedlegs;
ADDRLP4 100
ADDRLP4 132
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ASGNI4
line 1762
;1762:		}
LABELV $886
line 1763
;1763:	}
LABELV $883
line 1766
;1764:
;1765:	// if VR player is dead, only head movements are allowed
;1766:	isDead = ( cent->currentState.eFlags & EF_DEAD );
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 1768
;1767:
;1768:	if ( vr_controller_type == 1 && !isDead ) {
ADDRLP4 48
INDIRI4
CNSTI4 1
NEI4 $888
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $888
line 1769
;1769:		torsoAngles[YAW]   = rightAngles[YAW];
ADDRLP4 0+4
ADDRLP4 80+4
INDIRF4
ASGNF4
line 1770
;1770:		torsoAngles[PITCH] = rightAngles[PITCH];
ADDRLP4 0
ADDRLP4 80
INDIRF4
ASGNF4
line 1771
;1771:		weaponAngles[ROLL] = rightAngles[ROLL];
ADDRLP4 52+8
ADDRLP4 80+8
INDIRF4
ASGNF4
line 1772
;1772:	}
LABELV $888
line 1779
;1773:
;1774:	//===================
;1775:	// YAW
;1776:	//===================
;1777:
;1778:	// allow yaw to drift a bit
;1779:	if ( (cent->currentState.legsAnim & ~ANIM_TOGGLEBIT) 	!= LEGS_IDLE
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 22
NEI4 $896
ADDRLP4 132
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 11
EQI4 $894
ADDRLP4 132
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 12
EQI4 $894
LABELV $896
line 1782
;1780:		|| ((cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT)!= TORSO_STAND
;1781:		&& (cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT) != TORSO_STAND2) )
;1782:	{
line 1784
;1783:		// if not standing still, always point all in the same direction
;1784:		cent->pe.torso.yawing 	= qtrue; // always center
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
CNSTI4 1
ASGNI4
line 1785
;1785:		cent->pe.torso.pitching = qtrue; // always center
ADDRFP4 0
INDIRP4
CNSTI4 1036
ADDP4
CNSTI4 1
ASGNI4
line 1786
;1786:		cent->pe.legs.yawing 	= qtrue; // always center
ADDRFP4 0
INDIRP4
CNSTI4 980
ADDP4
CNSTI4 1
ASGNI4
line 1787
;1787:	}
LABELV $894
line 1790
;1788:
;1789:	// adjust legs for movement dir
;1790:	if ( isDead ) {
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $897
line 1792
;1791:		// don't let dead bodies twitch
;1792:		dir = 0;
ADDRLP4 72
CNSTI4 0
ASGNI4
line 1793
;1793:	} else {
ADDRGP4 $898
JUMPV
LABELV $897
line 1794
;1794:		dir = cent->currentState.angles2[YAW];
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 1795
;1795:		if ( dir < 0 || dir > 7 ) {
ADDRLP4 72
INDIRI4
CNSTI4 0
LTI4 $901
ADDRLP4 72
INDIRI4
CNSTI4 7
LEI4 $899
LABELV $901
line 1796
;1796:			CG_Error( "Bad player movement angle" );
ADDRGP4 $902
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 1797
;1797:		}
LABELV $899
line 1798
;1798:	}
LABELV $898
line 1803
;1799:
;1800:	//===================
;1801:	//	legs
;1802:	//===================
;1803:		legsAngles[YAW] = headAngles[YAW] + movementOffsets[dir];
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $843
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1804
;1804:		CG_SwingAngles(legsAngles[YAW], 40, 90, cg_swingSpeed.value, &cent->pe.legs.yawAngle, &cent->pe.legs.yawing);
ADDRLP4 12+4
INDIRF4
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1119092736
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CNSTI4 976
ADDP4
ARGP4
ADDRLP4 136
INDIRP4
CNSTI4 980
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1805
;1805:		legsAngles[YAW] = cent->pe.legs.yawAngle;
ADDRLP4 12+4
ADDRFP4 0
INDIRP4
CNSTI4 976
ADDP4
INDIRF4
ASGNF4
line 1811
;1806:	
;1807:	//===================
;1808:	// torso YAW
;1809:	//===================
;1810:#ifdef USE_VR
;1811:	if ( !vr_controller_type )
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $908
line 1813
;1812:#endif
;1813:	{
line 1815
;1814:		//ori q3e
;1815:		torsoAngles[YAW] = headAngles[YAW] + 0.25 * movementOffsets[ dir ];
ADDRLP4 0+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $843
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1048576000
MULF4
ADDF4
ASGNF4
line 1816
;1816:		CG_SwingAngles( torsoAngles[YAW], 25, 90, cg_swingSpeed.value, &cent->pe.torso.yawAngle, &cent->pe.torso.yawing );
ADDRLP4 0+4
INDIRF4
ARGF4
CNSTF4 1103626240
ARGF4
CNSTF4 1119092736
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 1024
ADDP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 1028
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1817
;1817:		torsoAngles[YAW] = cent->pe.torso.yawAngle;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRF4
ASGNF4
line 1818
;1818:	}
LABELV $908
line 1824
;1819:
;1820:	//===================
;1821:	// Torso PITCH
;1822:	//===================
;1823:#ifdef USE_VR 
;1824:	if ( !vr_controller_type )
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $915
line 1826
;1825:#endif
;1826:	{
line 1828
;1827:		// only show a fraction of the pitch angle in the torso
;1828:		if ( headAngles[PITCH] > 180 ) {
ADDRLP4 24
INDIRF4
CNSTF4 1127481344
LEF4 $917
line 1829
;1829:			dest = (-360 + headAngles[PITCH]) * 0.75f;
ADDRLP4 108
ADDRLP4 24
INDIRF4
CNSTF4 3283353600
ADDF4
CNSTF4 1061158912
MULF4
ASGNF4
line 1830
;1830:		}
ADDRGP4 $918
JUMPV
LABELV $917
line 1831
;1831:		else {
line 1832
;1832:			dest = headAngles[PITCH] * 0.75f;
ADDRLP4 108
ADDRLP4 24
INDIRF4
CNSTF4 1061158912
MULF4
ASGNF4
line 1833
;1833:		}
LABELV $918
line 1834
;1834:		CG_SwingAngles(dest, 15, 30, 0.1f, &cent->pe.torso.pitchAngle, &cent->pe.torso.pitching);
ADDRLP4 108
INDIRF4
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
CNSTF4 1036831949
ARGF4
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 1032
ADDP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 1036
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1835
;1835:		torsoAngles[PITCH] = cent->pe.torso.pitchAngle;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRF4
ASGNF4
line 1836
;1836:	}
LABELV $915
line 1839
;1837:
;1838:	// fixed torso models
;1839:	if ( fixedtorso ) {
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $919
line 1840
;1840:		torsoAngles[PITCH] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1841
;1841:	}
LABELV $919
line 1847
;1842:
;1843:	//===================
;1844:	// Legs ROLL & PITCH
;1845:	//===================
;1846:	// lean towards the direction of travel
;1847:	VectorCopy( cent->currentState.pos.trDelta, velocity );
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1848
;1848:	speed = VectorNormalize( velocity );
ADDRLP4 36
ARGP4
ADDRLP4 140
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 68
ADDRLP4 140
INDIRF4
ASGNF4
line 1849
;1849:	if ( speed ) {
ADDRLP4 68
INDIRF4
CNSTF4 0
EQF4 $921
line 1853
;1850:		vec3_t	axis[3];
;1851:		float	side;
;1852:
;1853:		speed *= 0.05f;
ADDRLP4 68
ADDRLP4 68
INDIRF4
CNSTF4 1028443341
MULF4
ASGNF4
line 1855
;1854:
;1855:		AnglesToAxis( legsAngles, axis );
ADDRLP4 12
ARGP4
ADDRLP4 144
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1856
;1856:		side = speed * DotProduct( velocity, axis[1] );
ADDRLP4 180
ADDRLP4 68
INDIRF4
ADDRLP4 36
INDIRF4
ADDRLP4 144+12
INDIRF4
MULF4
ADDRLP4 36+4
INDIRF4
ADDRLP4 144+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 36+8
INDIRF4
ADDRLP4 144+12+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 1857
;1857:		legsAngles[ROLL] -= side;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 180
INDIRF4
SUBF4
ASGNF4
line 1859
;1858:
;1859:		side = speed * DotProduct( velocity, axis[0] );
ADDRLP4 180
ADDRLP4 68
INDIRF4
ADDRLP4 36
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ADDRLP4 36+4
INDIRF4
ADDRLP4 144+4
INDIRF4
MULF4
ADDF4
ADDRLP4 36+8
INDIRF4
ADDRLP4 144+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 1860
;1860:		legsAngles[PITCH] += side;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 180
INDIRF4
ADDF4
ASGNF4
line 1861
;1861:	}
LABELV $921
line 1866
;1862:
;1863:	//============================
;1864:	//		fixed legs models
;1865:	//============================
;1866:	if ( fixedlegs ) {
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $935
line 1867
;1867:		legsAngles[YAW] = torsoAngles[YAW];
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
ASGNF4
line 1868
;1868:		legsAngles[PITCH] = 0.0f;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1869
;1869:		legsAngles[ROLL] = 0.0f;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1870
;1870:	}
LABELV $935
line 1873
;1871:
;1872:	// pain twitch
;1873:	CG_AddPainTwitch( cent, torsoAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_AddPainTwitch
CALLV
pop
line 1879
;1874:
;1875:	//============================
;1876:	// pull the angles back out of the hierarchial chain
;1877:	//============================
;1878:	//if ( !isDead ) {
;1879:	AnglesSubtract( headAngles, torsoAngles, headAngles );
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 1880
;1880:	AnglesSubtract( torsoAngles, legsAngles, torsoAngles );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 1883
;1881:	//}
;1882:
;1883:	AnglesToAxis( legsAngles, legs );
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1884
;1884:	AnglesToAxis( torsoAngles, torso );
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1885
;1885:	AnglesToAxis( headAngles, head );
ADDRLP4 24
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1888
;1886:
;1887:#if defined USE_VR
;1888:	if ( vr_controller_type == 1 ) {
ADDRLP4 48
INDIRI4
CNSTI4 1
NEI4 $940
line 1889
;1889:		AnglesToAxis( weaponAngles, client_weapon.axis );
ADDRLP4 52
ARGP4
ADDRGP4 client_weapon
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1890
;1890:	}
ADDRGP4 $941
JUMPV
LABELV $940
line 1893
;1891:	else
;1892:#endif
;1893:		AnglesToAxis( torsoAngles, client_weapon.axis );
ADDRLP4 0
ARGP4
ADDRGP4 client_weapon
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
LABELV $941
line 1894
;1894:}
LABELV $842
endproc CG_PlayerAngles 184 24
proc CG_HasteTrail 32 48
line 1904
;1895:
;1896:
;1897://==========================================================================
;1898:
;1899:/*
;1900:===============
;1901:CG_HasteTrail
;1902:===============
;1903:*/
;1904:static void CG_HasteTrail( centity_t *cent ) {
line 1909
;1905:	localEntity_t	*smoke;
;1906:	vec3_t			origin;
;1907:	int				anim;
;1908:
;1909:	if ( cent->trailTime > cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
ADDRGP4 cg+234764
INDIRI4
LEI4 $943
line 1910
;1910:		return;
ADDRGP4 $942
JUMPV
LABELV $943
line 1912
;1911:	}
;1912:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1913
;1913:	if ( anim != LEGS_RUN && anim != LEGS_BACK ) {
ADDRLP4 12
INDIRI4
CNSTI4 15
EQI4 $946
ADDRLP4 12
INDIRI4
CNSTI4 16
EQI4 $946
line 1914
;1914:		return;
ADDRGP4 $942
JUMPV
LABELV $946
line 1917
;1915:	}
;1916:
;1917:	cent->trailTime += 100;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1918
;1918:	if ( cent->trailTime < cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
ADDRGP4 cg+234764
INDIRI4
GEI4 $948
line 1919
;1919:		cent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 1920
;1920:	}
LABELV $948
line 1922
;1921:
;1922:	VectorCopy( cent->lerpOrigin, origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
INDIRB
ASGNB 12
line 1923
;1923:	origin[2] -= 16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1925
;1924:
;1925:	smoke = CG_SmokePuff( origin, vec3_origin, 
ADDRLP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1140457472
ARGF4
ADDRGP4 cg+234764
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+150560+480
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRP4
ASGNP4
line 1935
;1926:				  8, 
;1927:				  1, 1, 1, 1,
;1928:				  500, 
;1929:				  cg.time,
;1930:				  0,
;1931:				  0,
;1932:				  cgs.media.hastePuffShader );
;1933:
;1934:	// use the optimized local entity add
;1935:	smoke->leType = LE_SCALE_FADE;
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 7
ASGNI4
line 1936
;1936:}
LABELV $942
endproc CG_HasteTrail 32 48
proc CG_TrailItem 188 12
line 2032
;1937:
;1938:
;1939:#ifdef MISSIONPACK
;1940:/*
;1941:===============
;1942:CG_BreathPuffs
;1943:===============
;1944:*/
;1945:static void CG_BreathPuffs( centity_t *cent, refEntity_t *head) {
;1946:	clientInfo_t *ci;
;1947:	vec3_t up, origin;
;1948:	int contents;
;1949:
;1950:	ci = &cgs.clientinfo[ cent->currentState.number ];
;1951:
;1952:	if (!cg_enableBreath.integer) {
;1953:		return;
;1954:	}
;1955:	if ( cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson) {
;1956:		return;
;1957:	}
;1958:	if ( cent->currentState.eFlags & EF_DEAD ) {
;1959:		return;
;1960:	}
;1961:	contents = CG_PointContents( head->origin, 0 );
;1962:	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
;1963:		return;
;1964:	}
;1965:	if ( ci->breathPuffTime > cg.time ) {
;1966:		return;
;1967:	}
;1968:
;1969:	VectorSet( up, 0, 0, 8 );
;1970:	VectorMA(head->origin, 8, head->axis[0], origin);
;1971:	VectorMA(origin, -4, head->axis[2], origin);
;1972:	CG_SmokePuff( origin, up, 16, 1, 1, 1, 0.66f, 1500, cg.time, cg.time + 400, LEF_PUFF_DONT_SCALE, cgs.media.shotgunSmokePuffShader );
;1973:	ci->breathPuffTime = cg.time + 2000;
;1974:}
;1975:
;1976:/*
;1977:===============
;1978:CG_DustTrail
;1979:===============
;1980:*/
;1981:static void CG_DustTrail( centity_t *cent ) {
;1982:	int				anim;
;1983:	vec3_t end, vel;
;1984:	trace_t tr;
;1985:
;1986:	if (!cg_enableDust.integer)
;1987:		return;
;1988:
;1989:	if ( cent->dustTrailTime > cg.time ) {
;1990:		return;
;1991:	}
;1992:
;1993:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
;1994:	if ( anim != LEGS_LANDB && anim != LEGS_LAND ) {
;1995:		return;
;1996:	}
;1997:
;1998:	cent->dustTrailTime += 40;
;1999:	if ( cent->dustTrailTime < cg.time ) {
;2000:		cent->dustTrailTime = cg.time;
;2001:	}
;2002:
;2003:	VectorCopy(cent->currentState.pos.trBase, end);
;2004:	end[2] -= 64;
;2005:	CG_Trace( &tr, cent->currentState.pos.trBase, NULL, NULL, end, cent->currentState.number, MASK_PLAYERSOLID );
;2006:
;2007:	if ( !(tr.surfaceFlags & SURF_DUST) )
;2008:		return;
;2009:
;2010:	VectorCopy( cent->currentState.pos.trBase, end );
;2011:	end[2] -= 16;
;2012:
;2013:	VectorSet(vel, 0, 0, -30);
;2014:	CG_SmokePuff( end, vel,
;2015:				  24,
;2016:				  .8f, .8f, 0.7f, 0.33f,
;2017:				  500,
;2018:				  cg.time,
;2019:				  0,
;2020:				  0,
;2021:				  cgs.media.dustPuffShader );
;2022:}
;2023:#endif
;2024:
;2025:
;2026:/*
;2027:===============
;2028:CG_TrailItem
;2029:===============
;2030:*/
;2031:#ifndef USE_TRAIL_ITEM
;2032:static void CG_TrailItem( const centity_t *cent, qhandle_t hModel ) {
line 2037
;2033:	refEntity_t		ent;
;2034:	vec3_t			angles;
;2035:	vec3_t			axis[3];
;2036:
;2037:	VectorCopy( cent->lerpAngles, angles );
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 1224
ADDP4
INDIRB
ASGNB 12
line 2038
;2038:	angles[PITCH] = 0;
ADDRLP4 140
CNSTF4 0
ASGNF4
line 2039
;2039:	angles[ROLL] = 0;
ADDRLP4 140+8
CNSTF4 0
ASGNF4
line 2040
;2040:	AnglesToAxis( angles, axis );
ADDRLP4 140
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2042
;2041:
;2042:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2043
;2043:	VectorMA( cent->lerpOrigin, -16, axis[0], ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
INDIRF4
ADDRLP4 152
INDIRF4
CNSTF4 3246391296
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRFP4 0
INDIRP4
CNSTI4 1216
ADDP4
INDIRF4
ADDRLP4 152+4
INDIRF4
CNSTF4 3246391296
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRFP4 0
INDIRP4
CNSTI4 1220
ADDP4
INDIRF4
ADDRLP4 152+8
INDIRF4
CNSTF4 3246391296
MULF4
ADDF4
ASGNF4
line 2044
;2044:	ent.origin[2] += 16;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 2045
;2045:	angles[YAW] += 90;
ADDRLP4 140+4
ADDRLP4 140+4
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 2046
;2046:	AnglesToAxis( angles, ent.axis );
ADDRLP4 140
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2048
;2047:
;2048:	ent.hModel = hModel;
ADDRLP4 0+8
ADDRFP4 4
INDIRI4
ASGNI4
line 2049
;2049:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2050
;2050:}
LABELV $956
endproc CG_TrailItem 188 12
proc CG_PlayerFlag 352 24
line 2113
;2051:#else
;2052:
;2053:void CG_TrailItem(centity_t *cent, qhandle_t hModel, vec3_t offset, float scale) {
;2054:	refEntity_t		ent;
;2055:	vec3_t			angles;
;2056:	vec3_t			axis[3];
;2057:
;2058:	if (!cent)
;2059:	{
;2060:		return;
;2061:	}
;2062:
;2063:	memset(&ent, 0, sizeof(ent));
;2064:
;2065:	if (cent->currentState.clientNum == cg.snap->ps.clientNum)
;2066:	{
;2067:		vec3_t forward, right, up;
;2068:		qboolean show_in_hand_enabled = trap_Cvar_VariableValue("vr_showItemInHand") != 0.0f;
;2069:		qboolean two_handed_enabled = trap_Cvar_VariableValue("vr_twoHandedWeapons") != 0.0f;
;2070:		//qboolean weapon_stabilised = trap_Cvar_VariableValue("vr_weapon_stabilised") != 0.0f;
;2071:		qboolean weapon_stabilised = player_weapon_stabilised();
;2072:
;2073:		if (!show_in_hand_enabled || (two_handed_enabled && weapon_stabilised))
;2074:		{
;2075:			return;
;2076:		}
;2077:
;2078:		CG_CalculateVROffHandPosition(ent.origin, angles);
;2079:		AnglesToAxis(angles, ent.axis);
;2080:		VectorScale(ent.axis[0], scale, ent.axis[0]);
;2081:		VectorScale(ent.axis[1], scale, ent.axis[1]);
;2082:		VectorScale(ent.axis[2], scale, ent.axis[2]);
;2083:
;2084:		AngleVectors(angles, forward, right, up);
;2085:		VectorMA(ent.origin, offset[0], right, ent.origin);
;2086:		VectorMA(ent.origin, offset[1], forward, ent.origin);
;2087:		VectorMA(ent.origin, offset[2], up, ent.origin);
;2088:		ent.nonNormalizedAxes = qtrue;
;2089:	}
;2090:	else {
;2091:		VectorCopy(cent->lerpAngles, angles);
;2092:		angles[PITCH] = 0;
;2093:		angles[ROLL] = 0;
;2094:		AnglesToAxis(angles, axis);
;2095:
;2096:		memset(&ent, 0, sizeof(ent));
;2097:		VectorMA(cent->lerpOrigin, -16, axis[0], ent.origin);
;2098:		ent.origin[2] += 16;
;2099:		angles[YAW] += 90;
;2100:		AnglesToAxis(angles, ent.axis);
;2101:	}
;2102:
;2103:	ent.hModel = hModel;
;2104:	trap_R_AddRefEntityToScene(&ent);
;2105:}
;2106:#endif
;2107:
;2108:/*
;2109:===============
;2110:CG_PlayerFlag
;2111:===============
;2112:*/
;2113:static void CG_PlayerFlag( centity_t *cent, qhandle_t hSkin, refEntity_t *torso ) {
line 2122
;2114:	clientInfo_t	*ci;
;2115:	refEntity_t	pole;
;2116:	refEntity_t	flag;
;2117:	vec3_t		angles, dir;
;2118:	int			legsAnim, flagAnim, updateangles;
;2119:	float		angle, d;
;2120:
;2121:	// show the flag pole model
;2122:	memset( &pole, 0, sizeof(pole) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2123
;2123:	pole.hModel = cgs.media.flagPoleModel;
ADDRLP4 0+8
ADDRGP4 cgs+150560+88
INDIRI4
ASGNI4
line 2124
;2124:	VectorCopy( torso->lightingOrigin, pole.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 2125
;2125:	pole.shadowPlane = torso->shadowPlane;
ADDRLP4 0+24
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 2126
;2126:	pole.renderfx = torso->renderfx;
ADDRLP4 0+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2127
;2127:	CG_PositionEntityOnTag( &pole, torso, torso->hModel, "tag_flag" );
ADDRLP4 0
ARGP4
ADDRLP4 328
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 328
INDIRP4
ARGP4
ADDRLP4 328
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $452
ARGP4
ADDRGP4 CG_PositionEntityOnTag
CALLV
pop
line 2128
;2128:	trap_R_AddRefEntityToScene( &pole );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2131
;2129:
;2130:	// show the flag model
;2131:	memset( &flag, 0, sizeof(flag) );
ADDRLP4 140
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2132
;2132:	flag.hModel = cgs.media.flagFlapModel;
ADDRLP4 140+8
ADDRGP4 cgs+150560+92
INDIRI4
ASGNI4
line 2133
;2133:	flag.customSkin = hSkin;
ADDRLP4 140+108
ADDRFP4 4
INDIRI4
ASGNI4
line 2134
;2134:	VectorCopy( torso->lightingOrigin, flag.lightingOrigin );
ADDRLP4 140+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 2135
;2135:	flag.shadowPlane = torso->shadowPlane;
ADDRLP4 140+24
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 2136
;2136:	flag.renderfx = torso->renderfx;
ADDRLP4 140+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2138
;2137:
;2138:	VectorClear(angles);
ADDRLP4 280
CNSTF4 0
ASGNF4
ADDRLP4 280+4
CNSTF4 0
ASGNF4
ADDRLP4 280+8
CNSTF4 0
ASGNF4
line 2140
;2139:
;2140:	updateangles = qfalse;
ADDRLP4 312
CNSTI4 0
ASGNI4
line 2141
;2141:	legsAnim = cent->currentState.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 2142
;2142:	if( legsAnim == LEGS_IDLE || legsAnim == LEGS_IDLECR ) {
ADDRLP4 304
INDIRI4
CNSTI4 22
EQI4 $988
ADDRLP4 304
INDIRI4
CNSTI4 23
NEI4 $986
LABELV $988
line 2143
;2143:		flagAnim = FLAG_STAND;
ADDRLP4 320
CNSTI4 35
ASGNI4
line 2144
;2144:	} else if ( legsAnim == LEGS_WALK || legsAnim == LEGS_WALKCR ) {
ADDRGP4 $987
JUMPV
LABELV $986
ADDRLP4 304
INDIRI4
CNSTI4 14
EQI4 $991
ADDRLP4 304
INDIRI4
CNSTI4 13
NEI4 $989
LABELV $991
line 2145
;2145:		flagAnim = FLAG_STAND;
ADDRLP4 320
CNSTI4 35
ASGNI4
line 2146
;2146:		updateangles = qtrue;
ADDRLP4 312
CNSTI4 1
ASGNI4
line 2147
;2147:	} else {
ADDRGP4 $990
JUMPV
LABELV $989
line 2148
;2148:		flagAnim = FLAG_RUN;
ADDRLP4 320
CNSTI4 34
ASGNI4
line 2149
;2149:		updateangles = qtrue;
ADDRLP4 312
CNSTI4 1
ASGNI4
line 2150
;2150:	}
LABELV $990
LABELV $987
line 2152
;2151:
;2152:	if ( updateangles ) {
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $992
line 2154
;2153:
;2154:		VectorCopy( cent->currentState.pos.trDelta, dir );
ADDRLP4 292
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 2156
;2155:		// add gravity
;2156:		dir[2] += 100;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1120403456
ADDF4
ASGNF4
line 2157
;2157:		VectorNormalize( dir );
ADDRLP4 292
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2158
;2158:		d = DotProduct(pole.axis[2], dir);
ADDRLP4 308
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 292
INDIRF4
MULF4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 292+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2160
;2159:		// if there is enough movement orthogonal to the flag pole
;2160:		if (fabs(d) < 0.9) {
ADDRLP4 308
INDIRF4
ARGF4
ADDRLP4 340
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 340
INDIRF4
CNSTF4 1063675494
GEF4 $1005
line 2162
;2161:			//
;2162:			d = DotProduct(pole.axis[0], dir);
ADDRLP4 308
ADDRLP4 0+28
INDIRF4
ADDRLP4 292
INDIRF4
MULF4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 292+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2163
;2163:			if (d > 1.0f) {
ADDRLP4 308
INDIRF4
CNSTF4 1065353216
LEF4 $1014
line 2164
;2164:				d = 1.0f;
ADDRLP4 308
CNSTF4 1065353216
ASGNF4
line 2165
;2165:			}
ADDRGP4 $1015
JUMPV
LABELV $1014
line 2166
;2166:			else if (d < -1.0f) {
ADDRLP4 308
INDIRF4
CNSTF4 3212836864
GEF4 $1016
line 2167
;2167:				d = -1.0f;
ADDRLP4 308
CNSTF4 3212836864
ASGNF4
line 2168
;2168:			}
LABELV $1016
LABELV $1015
line 2169
;2169:			angle = acos(d);
ADDRLP4 308
INDIRF4
ARGF4
ADDRLP4 344
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 324
ADDRLP4 344
INDIRF4
ASGNF4
line 2171
;2170:
;2171:			d = DotProduct(pole.axis[1], dir);
ADDRLP4 308
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 292
INDIRF4
MULF4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 292+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2172
;2172:			if (d < 0) {
ADDRLP4 308
INDIRF4
CNSTF4 0
GEF4 $1028
line 2173
;2173:				angles[YAW] = 360 - angle * 180 / M_PI;
ADDRLP4 280+4
CNSTF4 1135869952
ADDRLP4 324
INDIRF4
CNSTF4 1113927393
MULF4
SUBF4
ASGNF4
line 2174
;2174:			}
ADDRGP4 $1029
JUMPV
LABELV $1028
line 2175
;2175:			else {
line 2176
;2176:				angles[YAW] = angle * 180 / M_PI;
ADDRLP4 280+4
ADDRLP4 324
INDIRF4
CNSTF4 1113927393
MULF4
ASGNF4
line 2177
;2177:			}
LABELV $1029
line 2178
;2178:			if (angles[YAW] < 0)
ADDRLP4 280+4
INDIRF4
CNSTF4 0
GEF4 $1032
line 2179
;2179:				angles[YAW] += 360;
ADDRLP4 280+4
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $1032
line 2180
;2180:			if (angles[YAW] > 360)
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
LEF4 $1036
line 2181
;2181:				angles[YAW] -= 360;
ADDRLP4 280+4
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $1036
line 2186
;2182:
;2183:			//vectoangles( cent->currentState.pos.trDelta, tmpangles );
;2184:			//angles[YAW] = tmpangles[YAW] + 45 - cent->pe.torso.yawAngle;
;2185:			// change the yaw angle
;2186:			CG_SwingAngles( angles[YAW], 25, 90, 0.15f, &cent->pe.flag.yawAngle, &cent->pe.flag.yawing );
ADDRLP4 280+4
INDIRF4
ARGF4
CNSTF4 1103626240
ARGF4
CNSTF4 1119092736
ARGF4
CNSTF4 1041865114
ARGF4
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 1072
ADDP4
ARGP4
ADDRLP4 348
INDIRP4
CNSTI4 1076
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 2187
;2187:		}
LABELV $1005
line 2207
;2188:
;2189:		/*
;2190:		d = DotProduct(pole.axis[2], dir);
;2191:		angle = Q_acos(d);
;2192:
;2193:		d = DotProduct(pole.axis[1], dir);
;2194:		if (d < 0) {
;2195:			angle = 360 - angle * 180 / M_PI;
;2196:		}
;2197:		else {
;2198:			angle = angle * 180 / M_PI;
;2199:		}
;2200:		if (angle > 340 && angle < 20) {
;2201:			flagAnim = FLAG_RUNUP;
;2202:		}
;2203:		if (angle > 160 && angle < 200) {
;2204:			flagAnim = FLAG_RUNDOWN;
;2205:		}
;2206:		*/
;2207:	}
LABELV $992
line 2210
;2208:
;2209:	// set the yaw angle
;2210:	angles[YAW] = cent->pe.flag.yawAngle;
ADDRLP4 280+4
ADDRFP4 0
INDIRP4
CNSTI4 1072
ADDP4
INDIRF4
ASGNF4
line 2212
;2211:	// lerp the flag animation frames
;2212:	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 316
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ASGNP4
line 2213
;2213:	CG_RunLerpFrame( ci, &cent->pe.flag, flagAnim, 1 );
ADDRLP4 316
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1052
ADDP4
ARGP4
ADDRLP4 320
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 2214
;2214:	flag.oldframe = cent->pe.flag.oldFrame;
ADDRLP4 140+96
ADDRFP4 0
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
ASGNI4
line 2215
;2215:	flag.frame = cent->pe.flag.frame;
ADDRLP4 140+80
ADDRFP4 0
INDIRP4
CNSTI4 1060
ADDP4
INDIRI4
ASGNI4
line 2216
;2216:	flag.backlerp = cent->pe.flag.backlerp;
ADDRLP4 140+100
ADDRFP4 0
INDIRP4
CNSTI4 1068
ADDP4
INDIRF4
ASGNF4
line 2218
;2217:
;2218:	AnglesToAxis( angles, flag.axis );
ADDRLP4 280
ARGP4
ADDRLP4 140+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2219
;2219:	CG_PositionRotatedEntityOnTag( &flag, &pole, pole.hModel, "tag_flag" );
ADDRLP4 140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $452
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2221
;2220:
;2221:	trap_R_AddRefEntityToScene( &flag );
ADDRLP4 140
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2222
;2222:}
LABELV $970
endproc CG_PlayerFlag 352 24
proc CG_PlayerPowerups 12 20
line 2298
;2223:
;2224:
;2225:#ifdef MISSIONPACK // bk001204
;2226:/*
;2227:===============
;2228:CG_PlayerTokens
;2229:===============
;2230:*/
;2231:static void CG_PlayerTokens( centity_t *cent, int renderfx ) {
;2232:	int			tokens, i, j;
;2233:	float		angle;
;2234:	refEntity_t	ent;
;2235:	vec3_t		dir, origin;
;2236:	skulltrail_t *trail;
;2237:	trail = &cg.skulltrails[cent->currentState.number];
;2238:	tokens = cent->currentState.generic1;
;2239:	if ( !tokens ) {
;2240:		trail->numpositions = 0;
;2241:		return;
;2242:	}
;2243:
;2244:	if ( tokens > MAX_SKULLTRAIL ) {
;2245:		tokens = MAX_SKULLTRAIL;
;2246:	}
;2247:
;2248:	// add skulls if there are more than last time
;2249:	for (i = 0; i < tokens - trail->numpositions; i++) {
;2250:		for (j = trail->numpositions; j > 0; j--) {
;2251:			VectorCopy(trail->positions[j-1], trail->positions[j]);
;2252:		}
;2253:		VectorCopy(cent->lerpOrigin, trail->positions[0]);
;2254:	}
;2255:	trail->numpositions = tokens;
;2256:
;2257:	// move all the skulls along the trail
;2258:	VectorCopy(cent->lerpOrigin, origin);
;2259:	for (i = 0; i < trail->numpositions; i++) {
;2260:		VectorSubtract(trail->positions[i], origin, dir);
;2261:		if (VectorNormalize(dir) > 30) {
;2262:			VectorMA(origin, 30, dir, trail->positions[i]);
;2263:		}
;2264:		VectorCopy(trail->positions[i], origin);
;2265:	}
;2266:
;2267:	memset( &ent, 0, sizeof( ent ) );
;2268:	if( cgs.clientinfo[ cent->currentState.clientNum ].team == TEAM_BLUE ) {
;2269:		ent.hModel = cgs.media.redCubeModel;
;2270:	} else {
;2271:		ent.hModel = cgs.media.blueCubeModel;
;2272:	}
;2273:	ent.renderfx = renderfx;
;2274:
;2275:	VectorCopy(cent->lerpOrigin, origin);
;2276:	for (i = 0; i < trail->numpositions; i++) {
;2277:		VectorSubtract(origin, trail->positions[i], ent.axis[0]);
;2278:		ent.axis[0][2] = 0;
;2279:		VectorNormalize(ent.axis[0]);
;2280:		VectorSet(ent.axis[2], 0, 0, 1);
;2281:		CrossProduct(ent.axis[0], ent.axis[2], ent.axis[1]);
;2282:
;2283:		VectorCopy(trail->positions[i], ent.origin);
;2284:		angle = (((cg.time + 500 * MAX_SKULLTRAIL - 500 * i) / 16) & 255) * (M_PI * 2) / 255;
;2285:		ent.origin[2] += sin(angle) * 10;
;2286:		trap_R_AddRefEntityToScene( &ent );
;2287:		VectorCopy(trail->positions[i], origin);
;2288:	}
;2289:}
;2290:#endif
;2291:
;2292:
;2293:/*
;2294:===============
;2295:CG_PlayerPowerups
;2296:===============
;2297:*/
;2298:static void CG_PlayerPowerups( centity_t *cent, refEntity_t *torso ) {
line 2318
;2299:	int		powerups;
;2300:	clientInfo_t	*ci;
;2301:
;2302:#ifdef USE_TRAIL_ITEM
;2303:	//Player held items should render in the off-hand
;2304:	if (cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson)
;2305:	{
;2306:		int		value;
;2307:		value = cg.snap->ps.stats[STAT_HOLDABLE_ITEM];
;2308:
;2309:		if (value) {
;2310:			vec3_t offset;
;2311:			CG_RegisterItemVisuals(value);	
;2312:			VectorSet(offset, 0, 0, -4);
;2313:			CG_TrailItem(cent, cg_items[value].models[0], offset, 0.35f);
;2314:		}
;2315:	}
;2316:#endif
;2317:
;2318:	powerups = cent->currentState.powerups;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 2319
;2319:	if ( !powerups ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1049
line 2320
;2320:		return;
ADDRGP4 $1048
JUMPV
LABELV $1049
line 2324
;2321:	}
;2322:
;2323:	// quad gives a dlight
;2324:	if ( powerups & ( 1 << PW_QUAD ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1051
line 2325
;2325:		if ( cgs.clientinfo[ cent->currentState.clientNum ].team == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1053
line 2326
;2326:			trap_R_AddLightToScene( cent->lerpOrigin, ( POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD) ), 1.0f, 0.2f, 0.2f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2327
;2327:		} else {
ADDRGP4 $1054
JUMPV
LABELV $1053
line 2328
;2328:			trap_R_AddLightToScene( cent->lerpOrigin, ( POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD) ), 0.2f, 0.2f, 1.0f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2329
;2329:		}
LABELV $1054
line 2330
;2330:	}
LABELV $1051
line 2333
;2331:
;2332:	// flight plays a looped sound
;2333:	if ( powerups & ( 1 << PW_FLIGHT ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1057
line 2334
;2334:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, cgs.media.flightSound );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 1212
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 cgs+150560+896
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 2335
;2335:	}
LABELV $1057
line 2337
;2336:
;2337:	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ASGNP4
line 2339
;2338:	// redflag
;2339:	if ( powerups & ( 1 << PW_REDFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1062
line 2350
;2340:#if defined USE_TRAIL_ITEM
;2341:		if (ci->newAnims && cent->currentState.clientNum != cg.snap->ps.clientNum) {
;2342:			CG_PlayerFlag(cent, cgs.media.redFlagFlapSkin, torso);
;2343:		}
;2344:		else {
;2345:			vec3_t offset;
;2346:			VectorSet(offset, 0, -1, 0);
;2347:			CG_TrailItem(cent, cgs.media.redFlagModel, offset, 0.1f);
;2348:		}
;2349:#else
;2350:		if (ci->newAnims) {
ADDRLP4 4
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1064
line 2351
;2351:			CG_PlayerFlag( cent, cgs.media.redFlagFlapSkin, torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+150560+96
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 2352
;2352:		}
ADDRGP4 $1065
JUMPV
LABELV $1064
line 2353
;2353:		else {
line 2354
;2354:			CG_TrailItem( cent, cgs.media.redFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+150560+36
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 2355
;2355:		}
LABELV $1065
line 2357
;2356:#endif
;2357:		trap_R_AddLightToScene( cent->lerpOrigin, ( POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD) ), 1.0f, 0.2f, 0.2f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2358
;2358:	}
LABELV $1062
line 2361
;2359:
;2360:	// blueflag
;2361:	if ( powerups & ( 1 << PW_BLUEFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1070
line 2372
;2362:#ifdef USE_TRAIL_ITEM
;2363:		if (ci->newAnims && cent->currentState.clientNum != cg.snap->ps.clientNum) {
;2364:			CG_PlayerFlag(cent, cgs.media.blueFlagFlapSkin, torso);
;2365:		}
;2366:		else {
;2367:			vec3_t offset;
;2368:			VectorSet(offset, 0, -1, 0);
;2369:			CG_TrailItem(cent, cgs.media.blueFlagModel, offset, 0.1f);
;2370:		}
;2371:#else
;2372:		if (ci->newAnims) {
ADDRLP4 4
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1072
line 2373
;2373:			CG_PlayerFlag(cent, cgs.media.blueFlagFlapSkin, torso);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+150560+100
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 2374
;2374:		}
ADDRGP4 $1073
JUMPV
LABELV $1072
line 2375
;2375:		else {
line 2376
;2376:			CG_TrailItem(cent, cgs.media.blueFlagModel);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+150560+40
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 2377
;2377:		}
LABELV $1073
line 2379
;2378:#endif
;2379:		trap_R_AddLightToScene( cent->lerpOrigin, ( POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD) ), 0.2f, 0.2f, 1.0f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2380
;2380:	}
LABELV $1070
line 2383
;2381:
;2382:	// neutralflag
;2383:	if ( powerups & ( 1 << PW_NEUTRALFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1078
line 2394
;2384:#ifdef USE_TRAIL_ITEM
;2385:		if (ci->newAnims && cent->currentState.clientNum != cg.snap->ps.clientNum) {
;2386:			CG_PlayerFlag(cent, cgs.media.neutralFlagFlapSkin, torso);
;2387:		}
;2388:		else {
;2389:			vec3_t offset;
;2390:			VectorSet(offset, 0, -1, 0);
;2391:			CG_TrailItem(cent, cgs.media.neutralFlagModel, offset, 0.1f);
;2392:		}
;2393:#else
;2394:		if (ci->newAnims) {
ADDRLP4 4
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1080
line 2395
;2395:			CG_PlayerFlag( cent, cgs.media.neutralFlagFlapSkin, torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+150560+104
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 2396
;2396:		}
ADDRGP4 $1081
JUMPV
LABELV $1080
line 2397
;2397:		else {
line 2398
;2398:			CG_TrailItem( cent, cgs.media.neutralFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+150560+44
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 2399
;2399:		}
LABELV $1081
line 2401
;2400:#endif
;2401:		trap_R_AddLightToScene( cent->lerpOrigin, ( POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD) ), 1.0f, 1.0f, 1.0f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2402
;2402:	}
LABELV $1078
line 2405
;2403:
;2404:	// haste leaves smoke trails
;2405:	if ( powerups & ( 1 << PW_HASTE ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1086
line 2406
;2406:		CG_HasteTrail( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_HasteTrail
CALLV
pop
line 2407
;2407:	}
LABELV $1086
line 2408
;2408:}
LABELV $1048
endproc CG_PlayerPowerups 12 20
proc CG_PlayerFloatSprite 144 12
line 2418
;2409:
;2410:
;2411:/*
;2412:===============
;2413:CG_PlayerFloatSprite
;2414:
;2415:Float a sprite over the player's head
;2416:===============
;2417:*/
;2418:static void CG_PlayerFloatSprite( const centity_t *cent, qhandle_t shader ) {
line 2422
;2419:	int				rf;
;2420:	refEntity_t		ent;
;2421:
;2422:	if ( cent->currentState.number == cg.snap->ps.clientNum && ( cg.vr_controller_type || !cg.renderingThirdPerson) ) {//TODO check the "followed player" sprite
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1089
ADDRGP4 cg+282972
INDIRI4
CNSTI4 0
NEI4 $1094
ADDRGP4 cg+234788
INDIRI4
CNSTI4 0
NEI4 $1089
LABELV $1094
line 2423
;2423:		rf = RF_THIRD_PERSON;		// only show in mirrors
ADDRLP4 140
CNSTI4 2
ASGNI4
line 2424
;2424:	} else {
ADDRGP4 $1090
JUMPV
LABELV $1089
line 2425
;2425:		rf = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 2426
;2426:	}
LABELV $1090
line 2428
;2427:
;2428:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2429
;2429:	VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
INDIRB
ASGNB 12
line 2430
;2430:	ent.origin[2] += 48;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 2431
;2431:	ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 2432
;2432:	ent.customShader = shader;
ADDRLP4 0+112
ADDRFP4 4
INDIRI4
ASGNI4
line 2433
;2433:	ent.radius = 10;
ADDRLP4 0+132
CNSTF4 1092616192
ASGNF4
line 2434
;2434:	ent.renderfx = rf;
ADDRLP4 0+4
ADDRLP4 140
INDIRI4
ASGNI4
line 2435
;2435:	ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 2436
;2436:	ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 2437
;2437:	ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 2438
;2438:	ent.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 2439
;2439:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2440
;2440:}
LABELV $1088
endproc CG_PlayerFloatSprite 144 12
proc CG_PlayerSprites 8 8
line 2450
;2441:
;2442:
;2443:/*
;2444:===============
;2445:CG_PlayerSprites
;2446:
;2447:Float sprites over the player's head
;2448:===============
;2449:*/
;2450:static void CG_PlayerSprites( centity_t *cent ) {
line 2453
;2451:	int		team;
;2452:
;2453:	if ( cent->currentState.eFlags & EF_CONNECTION ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1109
line 2454
;2454:		CG_PlayerFloatSprite( cent, cgs.media.connectionShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+150560+208
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2455
;2455:		return;
ADDRGP4 $1108
JUMPV
LABELV $1109
line 2466
;2456:	}
;2457:
;2458:	// we don't show the talk ballon anymore as virtual menu is a good indicator.
;2459:	// GUNNM TODO create cvar_t to force talk balloon sprite instead of the virtual menu
;2460:#ifndef USE_VIRTUAL_MENU
;2461:	if ( cent->currentState.eFlags & EF_TALK ) {
;2462:		CG_PlayerFloatSprite( cent, cgs.media.balloonShader );
;2463:		return;
;2464:	}
;2465:#endif
;2466:	if ( cent->currentState.eFlags & EF_AWARD_IMPRESSIVE ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $1113
line 2467
;2467:		CG_PlayerFloatSprite( cent, cgs.media.medalImpressive );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+150560+552
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2468
;2468:		return;
ADDRGP4 $1108
JUMPV
LABELV $1113
line 2471
;2469:	}
;2470:
;2471:	if ( cent->currentState.eFlags & EF_AWARD_EXCELLENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1117
line 2472
;2472:		CG_PlayerFloatSprite( cent, cgs.media.medalExcellent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+150560+556
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2473
;2473:		return;
ADDRGP4 $1108
JUMPV
LABELV $1117
line 2476
;2474:	}
;2475:
;2476:	if ( cent->currentState.eFlags & EF_AWARD_GAUNTLET ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1121
line 2477
;2477:		CG_PlayerFloatSprite( cent, cgs.media.medalGauntlet );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+150560+560
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2478
;2478:		return;
ADDRGP4 $1108
JUMPV
LABELV $1121
line 2481
;2479:	}
;2480:
;2481:	if ( cent->currentState.eFlags & EF_AWARD_DEFEND ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $1125
line 2482
;2482:		CG_PlayerFloatSprite( cent, cgs.media.medalDefend );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+150560+564
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2483
;2483:		return;
ADDRGP4 $1108
JUMPV
LABELV $1125
line 2486
;2484:	}
;2485:
;2486:	if ( cent->currentState.eFlags & EF_AWARD_ASSIST ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $1129
line 2487
;2487:		CG_PlayerFloatSprite( cent, cgs.media.medalAssist );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+150560+568
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2488
;2488:		return;
ADDRGP4 $1108
JUMPV
LABELV $1129
line 2491
;2489:	}
;2490:
;2491:	if ( cent->currentState.eFlags & EF_AWARD_CAP ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1133
line 2492
;2492:		CG_PlayerFloatSprite( cent, cgs.media.medalCapture );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+150560+572
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2493
;2493:		return;
ADDRGP4 $1108
JUMPV
LABELV $1133
line 2498
;2494:	}
;2495:
;2496:#ifdef USE_DEATHCAM
;2497:	//Put a sprite over the followed player's head
;2498:	if (cent->currentState.number == cg.snap->ps.clientNum && cg.renderingThirdPerson && CG_IsThirdPersonFollowMode_Query()) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1137
ADDRGP4 cg+234788
INDIRI4
CNSTI4 0
EQI4 $1137
ADDRLP4 4
ADDRGP4 CG_IsThirdPersonFollowMode_Query
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1137
line 2499
;2499:		CG_PlayerFloatSprite(cent, cgs.media.friendShader);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+150560+200
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2500
;2500:		return;
ADDRGP4 $1108
JUMPV
LABELV $1137
line 2504
;2501:	}
;2502:#endif
;2503:
;2504:	team = cgs.clientinfo[ cent->currentState.clientNum ].team;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012+36
ADDP4
INDIRI4
ASGNI4
line 2505
;2505:	if ( !(cent->currentState.eFlags & EF_DEAD) && 
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $1145
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1145
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
LTI4 $1145
line 2507
;2506:		cg.snap->ps.persistant[PERS_TEAM] == team &&
;2507:		cgs.gametype >= GT_TEAM) {
line 2508
;2508:		if (cg_drawFriend.integer) {
ADDRGP4 cg_drawFriend+12
INDIRI4
CNSTI4 0
EQI4 $1108
line 2509
;2509:			CG_PlayerFloatSprite( cent, cgs.media.friendShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+150560+200
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2510
;2510:		}
line 2511
;2511:		return;
LABELV $1145
line 2513
;2512:	}
;2513:}
LABELV $1108
endproc CG_PlayerSprites 8 8
data
align 4
LABELV $1155
byte 4 3245342720
byte 4 3245342720
byte 4 0
align 4
LABELV $1156
byte 4 1097859072
byte 4 1097859072
byte 4 1073741824
code
proc CG_PlayerShadow 108 44
line 2526
;2514:
;2515:
;2516:/*
;2517:===============
;2518:CG_PlayerShadow
;2519:
;2520:Returns the Z component of the surface being shadowed
;2521:
;2522:  should it return a full plane instead of a Z?
;2523:===============
;2524:*/
;2525:#define	SHADOW_DISTANCE		128
;2526:static qboolean CG_PlayerShadow( centity_t *cent, float *shadowPlane ) {
line 2527
;2527:	vec3_t		end, mins = {-15, -15, 0}, maxs = {15, 15, 2};
ADDRLP4 72
ADDRGP4 $1155
INDIRB
ASGNB 12
ADDRLP4 84
ADDRGP4 $1156
INDIRB
ASGNB 12
line 2531
;2528:	trace_t		trace;
;2529:	float		alpha;
;2530:#ifdef USE_DEATHCAM
;2531:	qboolean clientPlayer = cent->currentState.number == cg.snap->ps.clientNum;
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1159
ADDRLP4 100
CNSTI4 1
ASGNI4
ADDRGP4 $1160
JUMPV
LABELV $1159
ADDRLP4 100
CNSTI4 0
ASGNI4
LABELV $1160
ADDRLP4 96
ADDRLP4 100
INDIRI4
ASGNI4
line 2534
;2532:#endif
;2533:
;2534:	*shadowPlane = 0;
ADDRFP4 4
INDIRP4
CNSTF4 0
ASGNF4
line 2539
;2535:
;2536:#if defined USE_DEATHCAM && defined USE_NATIVE_HACK
;2537:	if ((clientPlayer && cg_playerShadow.integer == 0) || (!clientPlayer && cg_shadows.integer == 0)) {
;2538:#else
;2539:	if ( cg_shadows.integer == 0 ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $1161
line 2541
;2540:#endif
;2541:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1154
JUMPV
LABELV $1161
line 2545
;2542:	}
;2543:
;2544:	// no shadows when invisible
;2545:	if ( cent->currentState.powerups & ( 1 << PW_INVIS ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1164
line 2546
;2546:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1154
JUMPV
LABELV $1164
line 2551
;2547:	}
;2548:
;2549:#ifdef USE_DEATHCAM
;2550:	// no shadow if VR player is dead
;2551:	if (clientPlayer && (cg.predictedPlayerState.stats[STAT_HEALTH] <= 0)) {
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $1166
ADDRGP4 cg+234796+184
INDIRI4
CNSTI4 0
GTI4 $1166
line 2552
;2552:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1154
JUMPV
LABELV $1166
line 2557
;2553:	}
;2554:#endif
;2555:
;2556:	// send a trace down from the player to the ground
;2557:	VectorCopy( cent->lerpOrigin, end );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
INDIRB
ASGNB 12
line 2558
;2558:	end[2] -= SHADOW_DISTANCE;
ADDRLP4 60+8
ADDRLP4 60+8
INDIRF4
CNSTF4 1124073472
SUBF4
ASGNF4
line 2560
;2559:
;2560:	trap_CM_BoxTrace( &trace, cent->lerpOrigin, end, mins, maxs, 0, MASK_PLAYERSOLID );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 0
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 2563
;2561:
;2562:	// no shadow if too high
;2563:	if ( trace.fraction == 1.0 || trace.startsolid || trace.allsolid ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $1176
ADDRLP4 0+4
INDIRI4
CNSTI4 0
NEI4 $1176
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1171
LABELV $1176
line 2564
;2564:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1154
JUMPV
LABELV $1171
line 2567
;2565:	}
;2566:
;2567:	*shadowPlane = trace.endpos[2] + 1;
ADDRFP4 4
INDIRP4
ADDRLP4 0+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2573
;2568:
;2569:	// no mark for stencil or projection shadows
;2570:#if defined USE_DEATHCAM && defined USE_NATIVE_HACK
;2571:	if ((clientPlayer && cg_playerShadow.integer != 1) || (!clientPlayer && cg_shadows.integer != 1)) {
;2572:#else
;2573:	if ( cg_shadows.integer != 1 ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 1
EQI4 $1179
line 2575
;2574:#endif
;2575:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1154
JUMPV
LABELV $1179
line 2579
;2576:	}
;2577:
;2578:	// fade the shadow out with height
;2579:	alpha = 1.0 - trace.fraction;
ADDRLP4 56
CNSTF4 1065353216
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 2586
;2580:
;2581:	// bk0101022 - hack / FPE - bogus planes?
;2582:	//assert( DotProduct( trace.plane.normal, trace.plane.normal ) != 0.0f ) 
;2583:
;2584:	// add the mark as a temporary, so it goes directly to the renderer
;2585:	// without taking a spot in the cg_marks array
;2586:	CG_ImpactMark( cgs.media.shadowMarkShader, trace.endpos, trace.plane.normal, 
ADDRGP4 cgs+150560+404
INDIRI4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 0+24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 976
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTI4 0
ARGI4
CNSTF4 1103101952
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
line 2589
;2587:		cent->pe.legs.yawAngle, alpha,alpha,alpha,1, qfalse, 24, qtrue );
;2588:
;2589:	return qtrue;
CNSTI4 1
RETI4
LABELV $1154
endproc CG_PlayerShadow 108 44
proc CG_PlayerSplash 188 28
line 2600
;2590:}
;2591:
;2592:
;2593:/*
;2594:===============
;2595:CG_PlayerSplash
;2596:
;2597:Draw a mark at the water surface
;2598:===============
;2599:*/
;2600:static void CG_PlayerSplash( const centity_t *cent ) {
line 2610
;2601:	vec3_t		start, end;
;2602:	trace_t		trace;
;2603:	int			contents;
;2604:	polyVert_t	verts[4];
;2605:
;2606:#if defined USE_DEATHCAM && defined USE_NATIVE_HACK
;2607:	qboolean clientPlayer = cent->currentState.number == cg.snap->ps.clientNum;
;2608:	if ((clientPlayer && !cg_playerShadow.integer) || (!clientPlayer && !cg_shadows.integer)) {
;2609:#else
;2610:	if ( !cg_shadows.integer ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $1188
line 2612
;2611:#endif
;2612:		return;
ADDRGP4 $1187
JUMPV
LABELV $1188
line 2615
;2613:	}
;2614:
;2615:	VectorCopy( cent->lerpOrigin, end );
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
INDIRB
ASGNB 12
line 2616
;2616:	end[2] -= 24;
ADDRLP4 164+8
ADDRLP4 164+8
INDIRF4
CNSTF4 1103101952
SUBF4
ASGNF4
line 2620
;2617:
;2618:	// if the feet aren't in liquid, don't make a mark
;2619:	// this won't handle moving water brushes, but they wouldn't draw right anyway...
;2620:	contents = CG_PointContents( end, 0 );
ADDRLP4 164
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 180
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 176
ADDRLP4 180
INDIRI4
ASGNI4
line 2621
;2621:	if ( !( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) ) {
ADDRLP4 176
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $1192
line 2622
;2622:		return;
ADDRGP4 $1187
JUMPV
LABELV $1192
line 2625
;2623:	}
;2624:
;2625:	VectorCopy( cent->lerpOrigin, start );
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
INDIRB
ASGNB 12
line 2626
;2626:	start[2] += 32;
ADDRLP4 152+8
ADDRLP4 152+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2629
;2627:
;2628:	// if the head isn't out of liquid, don't make a mark
;2629:	contents = CG_PointContents( start, 0 );
ADDRLP4 152
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 184
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 176
ADDRLP4 184
INDIRI4
ASGNI4
line 2630
;2630:	if ( contents & ( CONTENTS_SOLID | CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
ADDRLP4 176
INDIRI4
CNSTI4 57
BANDI4
CNSTI4 0
EQI4 $1195
line 2631
;2631:		return;
ADDRGP4 $1187
JUMPV
LABELV $1195
line 2635
;2632:	}
;2633:
;2634:	// trace down to find the surface
;2635:	trap_CM_BoxTrace( &trace, start, end, NULL, NULL, 0, ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) );
ADDRLP4 96
ARGP4
ADDRLP4 152
ARGP4
ADDRLP4 164
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 2637
;2636:
;2637:	if ( trace.fraction == 1.0 ) {
ADDRLP4 96+8
INDIRF4
CNSTF4 1065353216
NEF4 $1197
line 2638
;2638:		return;
ADDRGP4 $1187
JUMPV
LABELV $1197
line 2642
;2639:	}
;2640:
;2641:	// create a mark polygon
;2642:	VectorCopy( trace.endpos, verts[0].xyz );
ADDRLP4 0
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2643
;2643:	verts[0].xyz[0] -= 32;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2644
;2644:	verts[0].xyz[1] -= 32;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2645
;2645:	verts[0].st[0] = 0;
ADDRLP4 0+12
CNSTF4 0
ASGNF4
line 2646
;2646:	verts[0].st[1] = 0;
ADDRLP4 0+12+4
CNSTF4 0
ASGNF4
line 2647
;2647:	verts[0].modulate[0] = 255;
ADDRLP4 0+20
CNSTU1 255
ASGNU1
line 2648
;2648:	verts[0].modulate[1] = 255;
ADDRLP4 0+20+1
CNSTU1 255
ASGNU1
line 2649
;2649:	verts[0].modulate[2] = 255;
ADDRLP4 0+20+2
CNSTU1 255
ASGNU1
line 2650
;2650:	verts[0].modulate[3] = 255;
ADDRLP4 0+20+3
CNSTU1 255
ASGNU1
line 2652
;2651:
;2652:	VectorCopy( trace.endpos, verts[1].xyz );
ADDRLP4 0+24
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2653
;2653:	verts[1].xyz[0] -= 32;
ADDRLP4 0+24
ADDRLP4 0+24
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2654
;2654:	verts[1].xyz[1] += 32;
ADDRLP4 0+24+4
ADDRLP4 0+24+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2655
;2655:	verts[1].st[0] = 0;
ADDRLP4 0+24+12
CNSTF4 0
ASGNF4
line 2656
;2656:	verts[1].st[1] = 1;
ADDRLP4 0+24+12+4
CNSTF4 1065353216
ASGNF4
line 2657
;2657:	verts[1].modulate[0] = 255;
ADDRLP4 0+24+20
CNSTU1 255
ASGNU1
line 2658
;2658:	verts[1].modulate[1] = 255;
ADDRLP4 0+24+20+1
CNSTU1 255
ASGNU1
line 2659
;2659:	verts[1].modulate[2] = 255;
ADDRLP4 0+24+20+2
CNSTU1 255
ASGNU1
line 2660
;2660:	verts[1].modulate[3] = 255;
ADDRLP4 0+24+20+3
CNSTU1 255
ASGNU1
line 2662
;2661:
;2662:	VectorCopy( trace.endpos, verts[2].xyz );
ADDRLP4 0+48
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2663
;2663:	verts[2].xyz[0] += 32;
ADDRLP4 0+48
ADDRLP4 0+48
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2664
;2664:	verts[2].xyz[1] += 32;
ADDRLP4 0+48+4
ADDRLP4 0+48+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2665
;2665:	verts[2].st[0] = 1;
ADDRLP4 0+48+12
CNSTF4 1065353216
ASGNF4
line 2666
;2666:	verts[2].st[1] = 1;
ADDRLP4 0+48+12+4
CNSTF4 1065353216
ASGNF4
line 2667
;2667:	verts[2].modulate[0] = 255;
ADDRLP4 0+48+20
CNSTU1 255
ASGNU1
line 2668
;2668:	verts[2].modulate[1] = 255;
ADDRLP4 0+48+20+1
CNSTU1 255
ASGNU1
line 2669
;2669:	verts[2].modulate[2] = 255;
ADDRLP4 0+48+20+2
CNSTU1 255
ASGNU1
line 2670
;2670:	verts[2].modulate[3] = 255;
ADDRLP4 0+48+20+3
CNSTU1 255
ASGNU1
line 2672
;2671:
;2672:	VectorCopy( trace.endpos, verts[3].xyz );
ADDRLP4 0+72
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2673
;2673:	verts[3].xyz[0] += 32;
ADDRLP4 0+72
ADDRLP4 0+72
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2674
;2674:	verts[3].xyz[1] -= 32;
ADDRLP4 0+72+4
ADDRLP4 0+72+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2675
;2675:	verts[3].st[0] = 1;
ADDRLP4 0+72+12
CNSTF4 1065353216
ASGNF4
line 2676
;2676:	verts[3].st[1] = 0;
ADDRLP4 0+72+12+4
CNSTF4 0
ASGNF4
line 2677
;2677:	verts[3].modulate[0] = 255;
ADDRLP4 0+72+20
CNSTU1 255
ASGNU1
line 2678
;2678:	verts[3].modulate[1] = 255;
ADDRLP4 0+72+20+1
CNSTU1 255
ASGNU1
line 2679
;2679:	verts[3].modulate[2] = 255;
ADDRLP4 0+72+20+2
CNSTU1 255
ASGNU1
line 2680
;2680:	verts[3].modulate[3] = 255;
ADDRLP4 0+72+20+3
CNSTU1 255
ASGNU1
line 2682
;2681:
;2682:	trap_R_AddPolyToScene( cgs.media.wakeMarkShader, 4, verts );
ADDRGP4 cgs+150560+428
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 2683
;2683:}
LABELV $1187
endproc CG_PlayerSplash 188 28
export CG_AddRefEntityWithPowerups
proc CG_AddRefEntityWithPowerups 0 4
line 2694
;2684:
;2685:
;2686:/*
;2687:===============
;2688:CG_AddRefEntityWithPowerups
;2689:
;2690:Adds a piece with modifications or duplications for powerups
;2691:Also called by CG_Missile for quad rockets, but nobody can tell...
;2692:===============
;2693:*/
;2694:void CG_AddRefEntityWithPowerups( refEntity_t *ent, entityState_t *state, int team ) {
line 2696
;2695:
;2696:	if ( state->powerups & ( 1 << PW_INVIS ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1278
line 2697
;2697:		ent->customShader = cgs.media.invisShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+150560+464
INDIRI4
ASGNI4
line 2698
;2698:		trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2699
;2699:	} else {
ADDRGP4 $1279
JUMPV
LABELV $1278
line 2709
;2700:		/*
;2701:		if ( state->eFlags & EF_KAMIKAZE ) {
;2702:			if (team == TEAM_BLUE)
;2703:				ent->customShader = cgs.media.blueKamikazeShader;
;2704:			else
;2705:				ent->customShader = cgs.media.redKamikazeShader;
;2706:			trap_R_AddRefEntityToScene( ent );
;2707:		}
;2708:		else {*/
;2709:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2712
;2710:		//}
;2711:
;2712:		if ( state->powerups & ( 1 << PW_QUAD ) )
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1282
line 2713
;2713:		{
line 2714
;2714:			if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $1284
line 2715
;2715:				ent->customShader = cgs.media.redQuadShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+150560+456
INDIRI4
ASGNI4
ADDRGP4 $1285
JUMPV
LABELV $1284
line 2717
;2716:			else
;2717:				ent->customShader = cgs.media.quadShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+150560+452
INDIRI4
ASGNI4
LABELV $1285
line 2718
;2718:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2719
;2719:		}
LABELV $1282
line 2720
;2720:		if ( state->powerups & ( 1 << PW_REGEN ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1290
line 2721
;2721:			if ( ( ( cg.time / 100 ) % 10 ) == 1 ) {
ADDRGP4 cg+234764
INDIRI4
CNSTI4 100
DIVI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $1292
line 2722
;2722:				ent->customShader = cgs.media.regenShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+150560+468
INDIRI4
ASGNI4
line 2723
;2723:				trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2724
;2724:			}
LABELV $1292
line 2725
;2725:		}
LABELV $1290
line 2726
;2726:		if ( state->powerups & ( 1 << PW_BATTLESUIT ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1297
line 2727
;2727:			ent->customShader = cgs.media.battleSuitShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+150560+472
INDIRI4
ASGNI4
line 2728
;2728:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2729
;2729:		}
LABELV $1297
line 2730
;2730:	}
LABELV $1279
line 2731
;2731:}
LABELV $1277
endproc CG_AddRefEntityWithPowerups 0 4
export CG_LightVerts
proc CG_LightVerts 88 16
line 2740
;2732:
;2733:
;2734:/*
;2735:=================
;2736:CG_LightVerts
;2737:=================
;2738:*/
;2739:int CG_LightVerts( vec3_t normal, int numVerts, polyVert_t *verts )
;2740:{
line 2747
;2741:	int				i, j;
;2742:	float			incoming;
;2743:	vec3_t			ambientLight;
;2744:	vec3_t			lightDir;
;2745:	vec3_t			directedLight;
;2746:
;2747:	trap_R_LightForPoint( verts[0].xyz, ambientLight, directedLight, lightDir );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_LightForPoint
CALLI4
pop
line 2749
;2748:
;2749:	for (i = 0; i < numVerts; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1305
JUMPV
LABELV $1302
line 2750
;2750:		incoming = DotProduct (normal, lightDir);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2751
;2751:		if ( incoming <= 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $1308
line 2752
;2752:			verts[i].modulate[0] = ambientLight[0];
ADDRLP4 56
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 60
CNSTF4 1325400064
ASGNF4
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
LTF4 $1311
ADDRLP4 52
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1312
JUMPV
LABELV $1311
ADDRLP4 52
ADDRLP4 56
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1312
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 52
INDIRU4
CVUU1 4
ASGNU1
line 2753
;2753:			verts[i].modulate[1] = ambientLight[1];
ADDRLP4 68
ADDRLP4 12+4
INDIRF4
ASGNF4
ADDRLP4 72
CNSTF4 1325400064
ASGNF4
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
LTF4 $1315
ADDRLP4 64
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1316
JUMPV
LABELV $1315
ADDRLP4 64
ADDRLP4 68
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1316
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 64
INDIRU4
CVUU1 4
ASGNU1
line 2754
;2754:			verts[i].modulate[2] = ambientLight[2];
ADDRLP4 80
ADDRLP4 12+8
INDIRF4
ASGNF4
ADDRLP4 84
CNSTF4 1325400064
ASGNF4
ADDRLP4 80
INDIRF4
ADDRLP4 84
INDIRF4
LTF4 $1319
ADDRLP4 76
ADDRLP4 80
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1320
JUMPV
LABELV $1319
ADDRLP4 76
ADDRLP4 80
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1320
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 76
INDIRU4
CVUU1 4
ASGNU1
line 2755
;2755:			verts[i].modulate[3] = 255;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 23
ADDP4
CNSTU1 255
ASGNU1
line 2756
;2756:			continue;
ADDRGP4 $1303
JUMPV
LABELV $1308
line 2758
;2757:		} 
;2758:		j = ( ambientLight[0] + incoming * directedLight[0] );
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2759
;2759:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1321
line 2760
;2760:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2761
;2761:		}
LABELV $1321
line 2762
;2762:		verts[i].modulate[0] = j;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2764
;2763:
;2764:		j = ( ambientLight[1] + incoming * directedLight[1] );
ADDRLP4 0
ADDRLP4 12+4
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2765
;2765:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1325
line 2766
;2766:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2767
;2767:		}
LABELV $1325
line 2768
;2768:		verts[i].modulate[1] = j;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2770
;2769:
;2770:		j = ( ambientLight[2] + incoming * directedLight[2] );
ADDRLP4 0
ADDRLP4 12+8
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2771
;2771:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1329
line 2772
;2772:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2773
;2773:		}
LABELV $1329
line 2774
;2774:		verts[i].modulate[2] = j;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2776
;2775:
;2776:		verts[i].modulate[3] = 255;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 23
ADDP4
CNSTU1 255
ASGNU1
line 2777
;2777:	}
LABELV $1303
line 2749
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1305
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $1302
line 2778
;2778:	return qtrue;
CNSTI4 1
RETI4
LABELV $1301
endproc CG_LightVerts 88 16
export CG_LaserNeeded
proc CG_LaserNeeded 44 8
line 2788
;2779:}
;2780:
;2781:
;2782:/*
;2783:===============
;2784:CG_LaserNeeded
;2785:===============
;2786:*/
;2787:#ifdef USE_LASER_SIGHT
;2788:qboolean CG_LaserNeeded( centity_t *cent, qboolean from_cg_player ) {
line 2803
;2789:	//qboolean		laserNeeded;
;2790:	qboolean		inMenu;
;2791:	qboolean		isFiring;
;2792:	qboolean		mySelf;
;2793:	int				clientNum;
;2794:	clientInfo_t	*ci;
;2795:	weapon_t		weaponNum;
;2796:#if defined USE_WEAPON_WHEEL || defined EF_LASER_SIGHT
;2797:	int vrFlags;
;2798:#endif
;2799:
;2800:	// the client number is stored in clientNum.  It can't be derived
;2801:	// from the entity number, because a single client may have
;2802:	// multiple corpses on the level using the same clientinfo
;2803:	clientNum = cent->currentState.clientNum;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 2804
;2804:	if ((unsigned)clientNum >= MAX_CLIENTS) {
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $1332
line 2805
;2805:		CG_Error("Bad clientNum on player entity");
ADDRGP4 $1334
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2806
;2806:	}
LABELV $1332
line 2807
;2807:	ci = &cgs.clientinfo[clientNum];
ADDRLP4 24
ADDRLP4 12
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ASGNP4
line 2811
;2808:
;2809:	// is cent the client?
;2810:	//mySelf = (cent->currentState.number == cg.snap->ps.clientNum);
;2811:	mySelf = (cent->currentState.number == cg.predictedPlayerState.clientNum);
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+234796+140
INDIRI4
NEI4 $1339
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRGP4 $1340
JUMPV
LABELV $1339
ADDRLP4 28
CNSTI4 0
ASGNI4
LABELV $1340
ADDRLP4 4
ADDRLP4 28
INDIRI4
ASGNI4
line 2814
;2812:
;2813:	//isDead	= (cent->currentState.eFlags & EF_DEAD);
;2814:	inMenu		= (cent->currentState.eFlags & EF_TALK);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ASGNI4
line 2815
;2815:	isFiring	= (cent->currentState.eFlags & EF_FIRING);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ASGNI4
line 2816
;2816:	weaponNum	= cent->currentState.weapon;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 2819
;2817:
;2818:	// always show laser beam in menu 
;2819:	if ( mySelf && inMenu )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1341
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $1341
line 2820
;2820:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1331
JUMPV
LABELV $1341
line 2823
;2821:
;2822:#if defined USE_WEAPON_WHEEL || defined EF_LASER_SIGHT
;2823:	vrFlags = VR_get_cent_vrFlags( cent, mySelf );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 VR_get_cent_vrFlags
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 32
INDIRI4
ASGNI4
line 2827
;2824:#endif
;2825:
;2826:#ifdef USE_WEAPON_WHEEL
;2827:	if ( mySelf && vrFlags & EF_WEAPON_WHEEL )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1343
ADDRLP4 8
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1343
line 2828
;2828:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1331
JUMPV
LABELV $1343
line 2830
;2829:#ifdef USE_VR_QVM
;2830:	else if ( vrFlags & EF_WEAPON_WHEEL )
ADDRLP4 8
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1345
line 2831
;2831:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1331
JUMPV
LABELV $1345
line 2836
;2832:#endif
;2833:#endif
;2834:
;2835:	// no laser beam with some weapons
;2836:	if (weaponNum == WP_GAUNTLET || weaponNum == WP_GRENADE_LAUNCHER)
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $1349
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $1347
LABELV $1349
line 2837
;2837:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1331
JUMPV
LABELV $1347
line 2840
;2838:
;2839:	// no laser beam during fire with some weapons
;2840:	if (isFiring && (weaponNum == WP_LIGHTNING ||
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1350
ADDRLP4 0
INDIRI4
CNSTI4 6
EQI4 $1353
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $1353
ADDRLP4 0
INDIRI4
CNSTI4 7
NEI4 $1350
LABELV $1353
line 2844
;2841:#ifdef USE_GRAPPLING_HOOK
;2842:		weaponNum == WP_GRAPPLING_HOOK ||
;2843:#endif
;2844:		weaponNum == WP_RAILGUN)) {
line 2845
;2845:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1331
JUMPV
LABELV $1350
line 2848
;2846:	}
;2847:
;2848:	return (vrFlags & EF_LASER_SIGHT);
ADDRLP4 8
INDIRI4
CNSTI4 1
BANDI4
RETI4
LABELV $1331
endproc CG_LaserNeeded 44 8
export CG_Player
proc CG_Player 680 28
line 2858
;2849:}
;2850:#endif // USE_LASER_SIGHT
;2851:
;2852:
;2853:/*
;2854:===============
;2855:CG_Player
;2856:===============
;2857:*/
;2858:void CG_Player( centity_t *cent ) {
line 2891
;2859:	clientInfo_t	*ci;
;2860:	refEntity_t		legs;
;2861:	refEntity_t		torso;
;2862:	refEntity_t		head;
;2863:	int				clientNum;
;2864:	int				renderfx;
;2865:	qboolean		shadow;
;2866:	float			shadowPlane;
;2867:	qboolean		mySelf, isDead, inMenu;
;2868:	refEntity_t		gun;
;2869:#ifdef USE_LASER_SIGHT
;2870:	qboolean laserNeeded;
;2871:#endif
;2872:
;2873:#ifdef MISSIONPACK
;2874:	refEntity_t		skull;
;2875:	refEntity_t		powerup;
;2876:	int				t;
;2877:	float			c;
;2878:	float			angle;
;2879:	vec3_t			dir, angles;
;2880:#endif
;2881:	qboolean		darken;
;2882:	qboolean		weapon_select;
;2883:	vec3_t			rightAngles;
;2884:#ifdef USE_WEAPON_WHEEL
;2885:	int vrFlags;
;2886:#endif
;2887:
;2888:	// the client number is stored in clientNum.  It can't be derived
;2889:	// from the entity number, because a single client may have
;2890:	// multiple corpses on the level using the same clientinfo
;2891:	clientNum = cent->currentState.clientNum;
ADDRLP4 584
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 2892
;2892:	if ( (unsigned) clientNum >= MAX_CLIENTS ) {
ADDRLP4 584
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $1355
line 2893
;2893:		CG_Error( "Bad clientNum on player entity" );
ADDRGP4 $1334
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2894
;2894:	}
LABELV $1355
line 2895
;2895:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 140
ADDRLP4 584
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ASGNP4
line 2899
;2896:
;2897:	// it is possible to see corpses from disconnected players that may
;2898:	// not have valid clientinfo
;2899:	if ( !ci->infoValid ) {
ADDRLP4 140
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1358
line 2900
;2900:		return;
ADDRGP4 $1354
JUMPV
LABELV $1358
line 2904
;2901:	}
;2902:
;2903:	// is cent the client?
;2904:	mySelf = (cent->currentState.number == cg.snap->ps.clientNum);
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1362
ADDRLP4 620
CNSTI4 1
ASGNI4
ADDRGP4 $1363
JUMPV
LABELV $1362
ADDRLP4 620
CNSTI4 0
ASGNI4
LABELV $1363
ADDRLP4 424
ADDRLP4 620
INDIRI4
ASGNI4
line 2905
;2905:	isDead = (cent->currentState.eFlags & EF_DEAD);
ADDRLP4 432
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 2906
;2906:	inMenu = (cent->currentState.eFlags & EF_TALK);
ADDRLP4 616
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ASGNI4
line 2910
;2907:
;2908:
;2909:#ifdef USE_WEAPON_WHEEL
;2910:	vrFlags = VR_get_cent_vrFlags( cent, mySelf );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 424
INDIRI4
ARGI4
ADDRLP4 624
ADDRGP4 VR_get_cent_vrFlags
CALLI4
ASGNI4
ADDRLP4 612
ADDRLP4 624
INDIRI4
ASGNI4
line 2911
;2911:	weapon_select = (vrFlags & EF_WEAPON_WHEEL);
ADDRLP4 608
ADDRLP4 612
INDIRI4
CNSTI4 2
BANDI4
ASGNI4
line 2917
;2912:#endif // USE_WEAPON_WHEEL
;2913:
;2914:	//========================
;2915:	// Get weapon hand angles
;2916:	//========================
;2917:	VR_get_cent_controller_angles( cent, rightAngles, SideRIGHT );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 588
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 VR_get_cent_controller_angles
CALLV
pop
line 2920
;2918:
;2919:	// get the player model information
;2920:	renderfx = 0;
ADDRLP4 428
CNSTI4 0
ASGNI4
line 2921
;2921:	if ( mySelf ) {
ADDRLP4 424
INDIRI4
CNSTI4 0
EQI4 $1364
line 2922
;2922:		if ( !cg.renderingThirdPerson ) {
ADDRGP4 cg+234788
INDIRI4
CNSTI4 0
NEI4 $1366
line 2923
;2923:			renderfx = RF_THIRD_PERSON; // only draw in mirrors
ADDRLP4 428
CNSTI4 2
ASGNI4
line 2924
;2924:		} else {
ADDRGP4 $1367
JUMPV
LABELV $1366
line 2925
;2925:			if ( cg_cameraMode.integer ) {
ADDRGP4 cg_cameraMode+12
INDIRI4
CNSTI4 0
EQI4 $1369
line 2926
;2926:				return;
ADDRGP4 $1354
JUMPV
LABELV $1369
line 2928
;2927:			}
;2928:		}
LABELV $1367
line 2929
;2929:	}
LABELV $1364
line 2932
;2930:
;2931:	// show only in mirrors in VR
;2932:	if ( mySelf && !isDead && !cg.renderingThirdPerson )
ADDRLP4 424
INDIRI4
CNSTI4 0
EQI4 $1372
ADDRLP4 432
INDIRI4
CNSTI4 0
NEI4 $1372
ADDRGP4 cg+234788
INDIRI4
CNSTI4 0
NEI4 $1372
line 2933
;2933:		renderfx = RF_THIRD_PERSON;
ADDRLP4 428
CNSTI4 2
ASGNI4
LABELV $1372
line 2935
;2934:
;2935:	if ( cg_deadBodyDarken.integer && isDead )
ADDRGP4 cg_deadBodyDarken+12
INDIRI4
CNSTI4 0
EQI4 $1375
ADDRLP4 432
INDIRI4
CNSTI4 0
EQI4 $1375
line 2936
;2936:		darken = qtrue;
ADDRLP4 580
CNSTI4 1
ASGNI4
ADDRGP4 $1376
JUMPV
LABELV $1375
line 2938
;2937:	else
;2938:		darken = qfalse;
ADDRLP4 580
CNSTI4 0
ASGNI4
LABELV $1376
line 2940
;2939:
;2940:	memset( &legs, 0, sizeof(legs) );
ADDRLP4 144
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2941
;2941:	memset( &torso, 0, sizeof(torso) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2942
;2942:	memset( &head, 0, sizeof(head) );
ADDRLP4 284
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2943
;2943:	memset( &gun, 0, sizeof(gun) );
ADDRLP4 436
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2946
;2944:
;2945:	// get the rotation information
;2946:	CG_PlayerAngles( cent, legs.axis, torso.axis, head.axis );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144+28
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 284+28
ARGP4
ADDRGP4 CG_PlayerAngles
CALLV
pop
line 2949
;2947:
;2948:	// get the animation state (after rotation, to allow feet shuffle)
;2949:	CG_PlayerAnimation( cent, &legs.oldframe, &legs.frame, &legs.backlerp,
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144+96
ARGP4
ADDRLP4 144+80
ARGP4
ADDRLP4 144+100
ARGP4
ADDRLP4 0+96
ARGP4
ADDRLP4 0+80
ARGP4
ADDRLP4 0+100
ARGP4
ADDRGP4 CG_PlayerAnimation
CALLV
pop
line 2953
;2950:		&torso.oldframe, &torso.frame, &torso.backlerp );
;2951:
;2952:	// add the talk baloon or disconnect icon
;2953:	CG_PlayerSprites( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 2956
;2954:
;2955:	// add the shadow
;2956:	shadow = CG_PlayerShadow( cent, &shadowPlane );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 576
ARGP4
ADDRLP4 628
ADDRGP4 CG_PlayerShadow
CALLI4
ASGNI4
ADDRLP4 600
ADDRLP4 628
INDIRI4
ASGNI4
line 2959
;2957:
;2958:	// add a water splash if partially in and out of water
;2959:	CG_PlayerSplash( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSplash
CALLV
pop
line 2964
;2960:
;2961:#if defined USE_DEATHCAM && defined USE_NATIVE_HACK
;2962:	if ( shadow && ((mySelf && cg_playerShadow.integer == 3) || (!mySelf && cg_shadows.integer == 3)) ) {
;2963:#else
;2964:	if ( cg_shadows.integer == 3 && shadow ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 3
NEI4 $1387
ADDRLP4 600
INDIRI4
CNSTI4 0
EQI4 $1387
line 2966
;2965:#endif
;2966:		renderfx |= RF_SHADOW_PLANE;
ADDRLP4 428
ADDRLP4 428
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 2967
;2967:	}
LABELV $1387
line 2969
;2968:
;2969:	renderfx |= RF_LIGHTING_ORIGIN;			// use the same origin for all
ADDRLP4 428
ADDRLP4 428
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 2979
;2970:#ifdef MISSIONPACK
;2971:	if ( cgs.gametype == GT_HARVESTER ) {
;2972:		CG_PlayerTokens( cent, renderfx );
;2973:	}
;2974:#endif
;2975:
;2976:	//=============================
;2977:	//		add the legs
;2978:	//=============================
;2979:	legs.hModel = ci->legsModel;
ADDRLP4 144+8
ADDRLP4 140
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
line 2980
;2980:	legs.customSkin = ci->legsSkin;
ADDRLP4 144+108
ADDRLP4 140
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 2982
;2981:
;2982:	VectorCopy( cent->lerpOrigin, legs.origin );
ADDRLP4 144+68
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
INDIRB
ASGNB 12
line 2984
;2983:
;2984:	VectorCopy( cent->lerpOrigin, legs.lightingOrigin );
ADDRLP4 144+12
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
INDIRB
ASGNB 12
line 2985
;2985:	legs.shadowPlane = shadowPlane;
ADDRLP4 144+24
ADDRLP4 576
INDIRF4
ASGNF4
line 2986
;2986:	legs.renderfx = renderfx;
ADDRLP4 144+4
ADDRLP4 428
INDIRI4
ASGNI4
line 2987
;2987:	VectorCopy(legs.origin, legs.oldorigin);	// don't positionally lerp at all
ADDRLP4 144+84
ADDRLP4 144+68
INDIRB
ASGNB 12
line 2990
;2988:
;2989:	// colored skin
;2990:	if ( darken ) {
ADDRLP4 580
INDIRI4
CNSTI4 0
EQI4 $1398
line 2991
;2991:		legs.shaderRGBA[0] = 85;
ADDRLP4 144+116
CNSTU1 85
ASGNU1
line 2992
;2992:		legs.shaderRGBA[1] = 85;
ADDRLP4 144+116+1
CNSTU1 85
ASGNU1
line 2993
;2993:		legs.shaderRGBA[2] = 85;
ADDRLP4 144+116+2
CNSTU1 85
ASGNU1
line 2994
;2994:	} else {
ADDRGP4 $1399
JUMPV
LABELV $1398
line 2995
;2995:		legs.shaderRGBA[0] = ci->legsColor[0] * 255;
ADDRLP4 636
ADDRLP4 140
INDIRP4
CNSTI4 1640
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 640
CNSTF4 1325400064
ASGNF4
ADDRLP4 636
INDIRF4
ADDRLP4 640
INDIRF4
LTF4 $1407
ADDRLP4 632
ADDRLP4 636
INDIRF4
ADDRLP4 640
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1408
JUMPV
LABELV $1407
ADDRLP4 632
ADDRLP4 636
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1408
ADDRLP4 144+116
ADDRLP4 632
INDIRU4
CVUU1 4
ASGNU1
line 2996
;2996:		legs.shaderRGBA[1] = ci->legsColor[1] * 255;
ADDRLP4 648
ADDRLP4 140
INDIRP4
CNSTI4 1644
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 652
CNSTF4 1325400064
ASGNF4
ADDRLP4 648
INDIRF4
ADDRLP4 652
INDIRF4
LTF4 $1412
ADDRLP4 644
ADDRLP4 648
INDIRF4
ADDRLP4 652
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1413
JUMPV
LABELV $1412
ADDRLP4 644
ADDRLP4 648
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1413
ADDRLP4 144+116+1
ADDRLP4 644
INDIRU4
CVUU1 4
ASGNU1
line 2997
;2997:		legs.shaderRGBA[2] = ci->legsColor[2] * 255;
ADDRLP4 660
ADDRLP4 140
INDIRP4
CNSTI4 1648
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 664
CNSTF4 1325400064
ASGNF4
ADDRLP4 660
INDIRF4
ADDRLP4 664
INDIRF4
LTF4 $1417
ADDRLP4 656
ADDRLP4 660
INDIRF4
ADDRLP4 664
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1418
JUMPV
LABELV $1417
ADDRLP4 656
ADDRLP4 660
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1418
ADDRLP4 144+116+2
ADDRLP4 656
INDIRU4
CVUU1 4
ASGNU1
line 2998
;2998:	}
LABELV $1399
line 2999
;2999:	legs.shaderRGBA[3] = 255;
ADDRLP4 144+116+3
CNSTU1 255
ASGNU1
line 3001
;3000:
;3001:	CG_AddRefEntityWithPowerups( &legs, &cent->currentState, ci->team );
ADDRLP4 144
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 3004
;3002:
;3003:	// if the model failed, allow the default nullmodel to be displayed
;3004:	if (!legs.hModel) {
ADDRLP4 144+8
INDIRI4
CNSTI4 0
NEI4 $1421
line 3005
;3005:		return;
ADDRGP4 $1354
JUMPV
LABELV $1421
line 3011
;3006:	}
;3007:
;3008:	//=============================
;3009:	//		add the torso
;3010:	//=============================
;3011:	torso.hModel = ci->torsoModel;
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ASGNI4
line 3012
;3012:	if (!torso.hModel) {
ADDRLP4 0+8
INDIRI4
CNSTI4 0
NEI4 $1425
line 3013
;3013:		return;
ADDRGP4 $1354
JUMPV
LABELV $1425
line 3016
;3014:	}
;3015:
;3016:	torso.customSkin = ci->torsoSkin;
ADDRLP4 0+108
ADDRLP4 140
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
ASGNI4
line 3018
;3017:
;3018:	VectorCopy( cent->lerpOrigin, torso.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
INDIRB
ASGNB 12
line 3020
;3019:
;3020:	CG_PositionRotatedEntityOnTag( &torso, &legs, ci->legsModel, "tag_torso" );
ADDRLP4 0
ARGP4
ADDRLP4 144
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ARGI4
ADDRGP4 $1430
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 3022
;3021:
;3022:	torso.shadowPlane = shadowPlane;
ADDRLP4 0+24
ADDRLP4 576
INDIRF4
ASGNF4
line 3023
;3023:	torso.renderfx = renderfx;
ADDRLP4 0+4
ADDRLP4 428
INDIRI4
ASGNI4
line 3026
;3024:
;3025:	// colored skin
;3026:	if ( darken ) {
ADDRLP4 580
INDIRI4
CNSTI4 0
EQI4 $1433
line 3027
;3027:		torso.shaderRGBA[0] = 85;
ADDRLP4 0+116
CNSTU1 85
ASGNU1
line 3028
;3028:		torso.shaderRGBA[1] = 85;
ADDRLP4 0+116+1
CNSTU1 85
ASGNU1
line 3029
;3029:		torso.shaderRGBA[2] = 85;
ADDRLP4 0+116+2
CNSTU1 85
ASGNU1
line 3030
;3030:	} else {
ADDRGP4 $1434
JUMPV
LABELV $1433
line 3031
;3031:		torso.shaderRGBA[0] = ci->bodyColor[0] * 255;
ADDRLP4 636
ADDRLP4 140
INDIRP4
CNSTI4 1628
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 640
CNSTF4 1325400064
ASGNF4
ADDRLP4 636
INDIRF4
ADDRLP4 640
INDIRF4
LTF4 $1442
ADDRLP4 632
ADDRLP4 636
INDIRF4
ADDRLP4 640
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1443
JUMPV
LABELV $1442
ADDRLP4 632
ADDRLP4 636
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1443
ADDRLP4 0+116
ADDRLP4 632
INDIRU4
CVUU1 4
ASGNU1
line 3032
;3032:		torso.shaderRGBA[1] = ci->bodyColor[1] * 255;
ADDRLP4 648
ADDRLP4 140
INDIRP4
CNSTI4 1632
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 652
CNSTF4 1325400064
ASGNF4
ADDRLP4 648
INDIRF4
ADDRLP4 652
INDIRF4
LTF4 $1447
ADDRLP4 644
ADDRLP4 648
INDIRF4
ADDRLP4 652
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1448
JUMPV
LABELV $1447
ADDRLP4 644
ADDRLP4 648
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1448
ADDRLP4 0+116+1
ADDRLP4 644
INDIRU4
CVUU1 4
ASGNU1
line 3033
;3033:		torso.shaderRGBA[2] = ci->bodyColor[2] * 255;
ADDRLP4 660
ADDRLP4 140
INDIRP4
CNSTI4 1636
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 664
CNSTF4 1325400064
ASGNF4
ADDRLP4 660
INDIRF4
ADDRLP4 664
INDIRF4
LTF4 $1452
ADDRLP4 656
ADDRLP4 660
INDIRF4
ADDRLP4 664
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1453
JUMPV
LABELV $1452
ADDRLP4 656
ADDRLP4 660
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1453
ADDRLP4 0+116+2
ADDRLP4 656
INDIRU4
CVUU1 4
ASGNU1
line 3034
;3034:	}
LABELV $1434
line 3035
;3035:	torso.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 3040
;3036:
;3037:	// the torso will be add later, because we need to change
;3038:	// its placement/axis depending of the gun position/axis
;3039:
;3040:	if ( ci->vr_controller_type == 1 )
ADDRLP4 140
INDIRP4
CNSTI4 1652
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1456
line 3041
;3041:	{
line 3052
;3042:		//=================
;3043:		//		3 Dof
;3044:		//=================
;3045:		// weapon axis must be exact vr controller axis.
;3046:		// but it is place on, and therefore after, the torso.
;3047:		// we then need to :
;3048:		// - subtract VR controller axis from gun axis 
;3049:		// - add the result to torso.axis
;3050:
;3051:		// get the weapon angle, from torso placement and axis. we will later remove these angles from the torso matrix
;3052:		CG_GetPlayerWeaponAxis(&torso, NULL, cent, &gun);
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 436
ARGP4
ADDRGP4 CG_GetPlayerWeaponAxis
CALLV
pop
line 3056
;3053:
;3054:		// we want the gun to have the vr controller exact angles
;3055:		// so the torso must do the appropriate rotations 
;3056:		if ( !isDead || inMenu )
ADDRLP4 432
INDIRI4
CNSTI4 0
EQI4 $1460
ADDRLP4 616
INDIRI4
CNSTI4 0
EQI4 $1457
LABELV $1460
line 3057
;3057:		{
line 3061
;3058:			vec3_t res_axis;
;3059:			vec3_t vr_controller_axis[3];
;3060:
;3061:			AnglesToAxis( rightAngles, vr_controller_axis );
ADDRLP4 588
ARGP4
ADDRLP4 644
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 3064
;3062:
;3063:			// Remove VR controller axis part from gun axis
;3064:			VectorSubtract(gun.axis[PITCH], vr_controller_axis[PITCH], res_axis);
ADDRLP4 632
ADDRLP4 436+28
INDIRF4
ADDRLP4 644
INDIRF4
SUBF4
ASGNF4
ADDRLP4 632+4
ADDRLP4 436+28+4
INDIRF4
ADDRLP4 644+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 632+8
ADDRLP4 436+28+8
INDIRF4
ADDRLP4 644+8
INDIRF4
SUBF4
ASGNF4
line 3067
;3065:
;3066:			// add the [PITCH] axis
;3067:			VectorAdd(torso.axis[PITCH], res_axis, torso.axis[PITCH]);
ADDRLP4 0+28
ADDRLP4 0+28
INDIRF4
ADDRLP4 632
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+28+4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 632+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+28+8
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 632+8
INDIRF4
ADDF4
ASGNF4
line 3069
;3068:
;3069:			memcpy( gun.axis, vr_controller_axis, 36 );
ADDRLP4 436+28
ARGP4
ADDRLP4 644
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 3070
;3070:		}
line 3071
;3071:	}
ADDRGP4 $1457
JUMPV
LABELV $1456
line 3072
;3072:	else if ( ci->vr_controller_type == 2 )
ADDRLP4 140
INDIRP4
CNSTI4 1652
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1483
line 3073
;3073:	{
line 3077
;3074:		//=================
;3075:		//		6 Dof
;3076:		//=================
;3077:		if (!isDead || inMenu) {
ADDRLP4 432
INDIRI4
CNSTI4 0
EQI4 $1487
ADDRLP4 616
INDIRI4
CNSTI4 0
EQI4 $1485
LABELV $1487
line 3078
;3078:			AnglesToAxis(rightAngles, torso.axis);
ADDRLP4 588
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 3079
;3079:		}
LABELV $1485
line 3080
;3080:	}
LABELV $1483
LABELV $1457
line 3294
;3081:
;3082:
;3083:#ifdef MISSIONPACK
;3084:	if ( cent->currentState.eFlags & EF_KAMIKAZE ) {
;3085:
;3086:		memset( &skull, 0, sizeof(skull) );
;3087:
;3088:		VectorCopy( cent->lerpOrigin, skull.lightingOrigin );
;3089:		skull.shadowPlane = shadowPlane;
;3090:		skull.renderfx = renderfx;
;3091:
;3092:		if ( isDead ) {
;3093:			// one skull bobbing above the dead body
;3094:			angle = ((cg.time / 7) & 255) * (M_PI * 2) / 255;
;3095:			if (angle > M_PI * 2)
;3096:				angle -= (float)M_PI * 2;
;3097:			dir[0] = sin(angle) * 20;
;3098:			dir[1] = cos(angle) * 20;
;3099:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255;
;3100:			dir[2] = 15 + sin(angle) * 8;
;3101:			VectorAdd(torso.origin, dir, skull.origin);
;3102:
;3103:			dir[2] = 0;
;3104:			VectorCopy(dir, skull.axis[1]);
;3105:			VectorNormalize(skull.axis[1]);
;3106:			VectorSet(skull.axis[2], 0, 0, 1);
;3107:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;3108:
;3109:			skull.hModel = cgs.media.kamikazeHeadModel;
;3110:			trap_R_AddRefEntityToScene( &skull );
;3111:			skull.hModel = cgs.media.kamikazeHeadTrail;
;3112:			trap_R_AddRefEntityToScene( &skull );
;3113:		}
;3114:		else {
;3115:			// three skulls spinning around the player
;3116:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255;
;3117:			dir[0] = cos(angle) * 20;
;3118:			dir[1] = sin(angle) * 20;
;3119:			dir[2] = cos(angle) * 20;
;3120:			VectorAdd(torso.origin, dir, skull.origin);
;3121:
;3122:			angles[0] = sin(angle) * 30;
;3123:			angles[1] = (angle * 180 / M_PI) + 90;
;3124:			if (angles[1] > 360)
;3125:				angles[1] -= 360;
;3126:			angles[2] = 0;
;3127:			AnglesToAxis( angles, skull.axis );
;3128:
;3129:			/*
;3130:			dir[2] = 0;
;3131:			VectorInverse(dir);
;3132:			VectorCopy(dir, skull.axis[1]);
;3133:			VectorNormalize(skull.axis[1]);
;3134:			VectorSet(skull.axis[2], 0, 0, 1);
;3135:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;3136:			*/
;3137:
;3138:			skull.hModel = cgs.media.kamikazeHeadModel;
;3139:			trap_R_AddRefEntityToScene( &skull );
;3140:			// flip the trail because this skull is spinning in the other direction
;3141:			VectorInverse(skull.axis[1]);
;3142:			skull.hModel = cgs.media.kamikazeHeadTrail;
;3143:			trap_R_AddRefEntityToScene( &skull );
;3144:
;3145:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255 + M_PI;
;3146:			if (angle > M_PI * 2)
;3147:				angle -= (float)M_PI * 2;
;3148:			dir[0] = sin(angle) * 20;
;3149:			dir[1] = cos(angle) * 20;
;3150:			dir[2] = cos(angle) * 20;
;3151:			VectorAdd(torso.origin, dir, skull.origin);
;3152:
;3153:			angles[0] = cos(angle - 0.5 * M_PI) * 30;
;3154:			angles[1] = 360 - (angle * 180 / M_PI);
;3155:			if (angles[1] > 360)
;3156:				angles[1] -= 360;
;3157:			angles[2] = 0;
;3158:			AnglesToAxis( angles, skull.axis );
;3159:
;3160:			/*
;3161:			dir[2] = 0;
;3162:			VectorCopy(dir, skull.axis[1]);
;3163:			VectorNormalize(skull.axis[1]);
;3164:			VectorSet(skull.axis[2], 0, 0, 1);
;3165:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;3166:			*/
;3167:
;3168:			skull.hModel = cgs.media.kamikazeHeadModel;
;3169:			trap_R_AddRefEntityToScene( &skull );
;3170:			skull.hModel = cgs.media.kamikazeHeadTrail;
;3171:			trap_R_AddRefEntityToScene( &skull );
;3172:
;3173:			angle = ((cg.time / 3) & 255) * (M_PI * 2) / 255 + 0.5 * M_PI;
;3174:			if (angle > M_PI * 2)
;3175:				angle -= (float)M_PI * 2;
;3176:			dir[0] = sin(angle) * 20;
;3177:			dir[1] = cos(angle) * 20;
;3178:			dir[2] = 0;
;3179:			VectorAdd(torso.origin, dir, skull.origin);
;3180:
;3181:			VectorCopy(dir, skull.axis[1]);
;3182:			VectorNormalize(skull.axis[1]);
;3183:			VectorSet(skull.axis[2], 0, 0, 1);
;3184:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;3185:
;3186:			skull.hModel = cgs.media.kamikazeHeadModel;
;3187:			trap_R_AddRefEntityToScene( &skull );
;3188:			skull.hModel = cgs.media.kamikazeHeadTrail;
;3189:			trap_R_AddRefEntityToScene( &skull );
;3190:		}
;3191:	}
;3192:
;3193:	if ( cent->currentState.powerups & ( 1 << PW_GUARD ) ) {
;3194:		memcpy(&powerup, &torso, sizeof(torso));
;3195:		powerup.hModel = cgs.media.guardPowerupModel;
;3196:		powerup.frame = 0;
;3197:		powerup.oldframe = 0;
;3198:		powerup.customSkin = 0;
;3199:		trap_R_AddRefEntityToScene( &powerup );
;3200:	}
;3201:	if ( cent->currentState.powerups & ( 1 << PW_SCOUT ) ) {
;3202:		memcpy(&powerup, &torso, sizeof(torso));
;3203:		powerup.hModel = cgs.media.scoutPowerupModel;
;3204:		powerup.frame = 0;
;3205:		powerup.oldframe = 0;
;3206:		powerup.customSkin = 0;
;3207:		trap_R_AddRefEntityToScene( &powerup );
;3208:	}
;3209:	if ( cent->currentState.powerups & ( 1 << PW_DOUBLER ) ) {
;3210:		memcpy(&powerup, &torso, sizeof(torso));
;3211:		powerup.hModel = cgs.media.doublerPowerupModel;
;3212:		powerup.frame = 0;
;3213:		powerup.oldframe = 0;
;3214:		powerup.customSkin = 0;
;3215:		trap_R_AddRefEntityToScene( &powerup );
;3216:	}
;3217:	if ( cent->currentState.powerups & ( 1 << PW_AMMOREGEN ) ) {
;3218:		memcpy(&powerup, &torso, sizeof(torso));
;3219:		powerup.hModel = cgs.media.ammoRegenPowerupModel;
;3220:		powerup.frame = 0;
;3221:		powerup.oldframe = 0;
;3222:		powerup.customSkin = 0;
;3223:		trap_R_AddRefEntityToScene( &powerup );
;3224:	}
;3225:	if ( cent->currentState.powerups & ( 1 << PW_INVULNERABILITY ) ) {
;3226:		if ( !ci->invulnerabilityStartTime ) {
;3227:			ci->invulnerabilityStartTime = cg.time;
;3228:		}
;3229:		ci->invulnerabilityStopTime = cg.time;
;3230:	}
;3231:	else {
;3232:		ci->invulnerabilityStartTime = 0;
;3233:	}
;3234:	if ( (cent->currentState.powerups & ( 1 << PW_INVULNERABILITY ) ) ||
;3235:		cg.time - ci->invulnerabilityStopTime < 250 ) {
;3236:
;3237:		memcpy(&powerup, &torso, sizeof(torso));
;3238:		powerup.hModel = cgs.media.invulnerabilityPowerupModel;
;3239:		powerup.frame = 0;//TODO is it usefull?
;3240:		powerup.oldframe = 0;// usefull?
;3241:		powerup.customSkin = 0;
;3242:		// always draw
;3243:		powerup.renderfx &= ~RF_THIRD_PERSON;
;3244:		VectorCopy(cent->lerpOrigin, powerup.origin);
;3245:
;3246:		if ( cg.time - ci->invulnerabilityStartTime < 250 ) {
;3247:			c = (float) (cg.time - ci->invulnerabilityStartTime) / 250;
;3248:		}
;3249:		else if (cg.time - ci->invulnerabilityStopTime < 250 ) {
;3250:			c = (float) (250 - (cg.time - ci->invulnerabilityStopTime)) / 250;
;3251:		}
;3252:		else {
;3253:			c = 1;
;3254:		}
;3255:		VectorSet( powerup.axis[0], c, 0, 0 );
;3256:		VectorSet( powerup.axis[1], 0, c, 0 );
;3257:		VectorSet( powerup.axis[2], 0, 0, c );
;3258:		trap_R_AddRefEntityToScene( &powerup );
;3259:	}
;3260:
;3261:	t = cg.time - ci->medkitUsageTime;
;3262:	if ( ci->medkitUsageTime && t < 500 ) {
;3263:		memcpy(&powerup, &torso, sizeof(torso));
;3264:		powerup.hModel = cgs.media.medkitUsageModel;
;3265:		powerup.frame = 0; // was not in q3e
;3266:		powerup.oldframe = 0; // was not in q3e
;3267:		powerup.customSkin = 0;
;3268:		// always draw
;3269:		powerup.renderfx &= ~RF_THIRD_PERSON;
;3270:		VectorClear(angles);
;3271:		AnglesToAxis(angles, powerup.axis);
;3272:		VectorCopy(cent->lerpOrigin, powerup.origin);
;3273:		powerup.origin[2] += -24 + (float) t * 80 / 500;
;3274:		if ( t > 400 ) {
;3275:			c = (float) (t - 1000) * 0xff / 100;
;3276:			powerup.shaderRGBA[0] = 0xff - c;
;3277:			powerup.shaderRGBA[1] = 0xff - c;
;3278:			powerup.shaderRGBA[2] = 0xff - c;
;3279:			powerup.shaderRGBA[3] = 0xff - c;
;3280:		}
;3281:		else {
;3282:			powerup.shaderRGBA[0] = 0xff;
;3283:			powerup.shaderRGBA[1] = 0xff;
;3284:			powerup.shaderRGBA[2] = 0xff;
;3285:			powerup.shaderRGBA[3] = 0xff;
;3286:		}
;3287:		trap_R_AddRefEntityToScene( &powerup );
;3288:	}
;3289:#endif // MISSIONPACK
;3290:
;3291:	//=============================
;3292:	//		add the head
;3293:	//=============================
;3294:	head.hModel = ci->headModel;
ADDRLP4 284+8
ADDRLP4 140
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ASGNI4
line 3295
;3295:	if (!head.hModel) {
ADDRLP4 284+8
INDIRI4
CNSTI4 0
NEI4 $1490
line 3296
;3296:		return;
ADDRGP4 $1354
JUMPV
LABELV $1490
line 3298
;3297:	}
;3298:	head.customSkin = ci->headSkin;
ADDRLP4 284+108
ADDRLP4 140
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
line 3300
;3299:
;3300:	VectorCopy( cent->lerpOrigin, head.lightingOrigin );
ADDRLP4 284+12
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
INDIRB
ASGNB 12
line 3302
;3301:
;3302:	CG_PositionRotatedEntityOnTag( &head, &torso, ci->torsoModel, "tag_head" );
ADDRLP4 284
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ARGI4
ADDRGP4 $1495
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 3304
;3303:
;3304:	head.shadowPlane = shadowPlane;
ADDRLP4 284+24
ADDRLP4 576
INDIRF4
ASGNF4
line 3306
;3305:
;3306:	if ( mySelf && !isDead && cg.renderingThirdPerson && ci->vr_controller_type )
ADDRLP4 424
INDIRI4
CNSTI4 0
EQI4 $1497
ADDRLP4 432
INDIRI4
CNSTI4 0
NEI4 $1497
ADDRGP4 cg+234788
INDIRI4
CNSTI4 0
EQI4 $1497
ADDRLP4 140
INDIRP4
CNSTI4 1652
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1497
line 3307
;3307:		head.renderfx = RF_THIRD_PERSON; // show head only in mirrors in VR
ADDRLP4 284+4
CNSTI4 2
ASGNI4
ADDRGP4 $1498
JUMPV
LABELV $1497
line 3309
;3308:	else
;3309:		head.renderfx = renderfx;
ADDRLP4 284+4
ADDRLP4 428
INDIRI4
ASGNI4
LABELV $1498
line 3312
;3310:
;3311:	// colored skin
;3312:	if ( darken ) {
ADDRLP4 580
INDIRI4
CNSTI4 0
EQI4 $1502
line 3313
;3313:		head.shaderRGBA[0] = 85;
ADDRLP4 284+116
CNSTU1 85
ASGNU1
line 3314
;3314:		head.shaderRGBA[1] = 85;
ADDRLP4 284+116+1
CNSTU1 85
ASGNU1
line 3315
;3315:		head.shaderRGBA[2] = 85;
ADDRLP4 284+116+2
CNSTU1 85
ASGNU1
line 3316
;3316:	} else {
ADDRGP4 $1503
JUMPV
LABELV $1502
line 3317
;3317:		head.shaderRGBA[0] = ci->headColor[0] * 255;
ADDRLP4 636
ADDRLP4 140
INDIRP4
CNSTI4 1616
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 640
CNSTF4 1325400064
ASGNF4
ADDRLP4 636
INDIRF4
ADDRLP4 640
INDIRF4
LTF4 $1511
ADDRLP4 632
ADDRLP4 636
INDIRF4
ADDRLP4 640
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1512
JUMPV
LABELV $1511
ADDRLP4 632
ADDRLP4 636
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1512
ADDRLP4 284+116
ADDRLP4 632
INDIRU4
CVUU1 4
ASGNU1
line 3318
;3318:		head.shaderRGBA[1] = ci->headColor[1] * 255;
ADDRLP4 648
ADDRLP4 140
INDIRP4
CNSTI4 1620
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 652
CNSTF4 1325400064
ASGNF4
ADDRLP4 648
INDIRF4
ADDRLP4 652
INDIRF4
LTF4 $1516
ADDRLP4 644
ADDRLP4 648
INDIRF4
ADDRLP4 652
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1517
JUMPV
LABELV $1516
ADDRLP4 644
ADDRLP4 648
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1517
ADDRLP4 284+116+1
ADDRLP4 644
INDIRU4
CVUU1 4
ASGNU1
line 3319
;3319:		head.shaderRGBA[2] = ci->headColor[2] * 255;
ADDRLP4 660
ADDRLP4 140
INDIRP4
CNSTI4 1624
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 664
CNSTF4 1325400064
ASGNF4
ADDRLP4 660
INDIRF4
ADDRLP4 664
INDIRF4
LTF4 $1521
ADDRLP4 656
ADDRLP4 660
INDIRF4
ADDRLP4 664
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1522
JUMPV
LABELV $1521
ADDRLP4 656
ADDRLP4 660
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1522
ADDRLP4 284+116+2
ADDRLP4 656
INDIRU4
CVUU1 4
ASGNU1
line 3320
;3320:	}
LABELV $1503
line 3321
;3321:	head.shaderRGBA[3] = 255;
ADDRLP4 284+116+3
CNSTU1 255
ASGNU1
line 3323
;3322:
;3323:	CG_AddRefEntityWithPowerups( &head, &cent->currentState, ci->team );
ADDRLP4 284
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 3340
;3324:
;3325:#ifndef USE_DEATHCAM
;3326:	//change VR view origin when dead to follow the head
;3327:	if ( myself && isDead )
;3328:		VectorCopy( head.origin, cg.vr_vieworigin);
;3329:#endif
;3330:
;3331:#ifdef MISSIONPACK
;3332:	CG_BreathPuffs(cent, &head);
;3333:
;3334:	CG_DustTrail(cent);
;3335:#endif
;3336:
;3337:	//=============================
;3338:	// add the torso
;3339:	//=============================
;3340:	{
line 3341
;3341:		int keepTorsoRenderfx = torso.renderfx;
ADDRLP4 632
ADDRLP4 0+4
INDIRI4
ASGNI4
line 3342
;3342:		if ( ci->vr_controller_type == 1 && mySelf && !isDead )
ADDRLP4 140
INDIRP4
CNSTI4 1652
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1526
ADDRLP4 424
INDIRI4
CNSTI4 0
EQI4 $1526
ADDRLP4 432
INDIRI4
CNSTI4 0
NEI4 $1526
line 3343
;3343:		{
line 3345
;3344:			// hide the torso when leaning depending on cvar VR_hide_torso.
;3345:			if ( rightAngles[PITCH] >= VR_angle_hide_torso.integer || VR_hide_torso.integer )
ADDRLP4 588
INDIRF4
ADDRGP4 VR_angle_hide_torso+12
INDIRI4
CVIF4 4
GEF4 $1532
ADDRGP4 VR_hide_torso+12
INDIRI4
CNSTI4 0
EQI4 $1528
LABELV $1532
line 3346
;3346:				torso.renderfx = RF_THIRD_PERSON; // only show in mirror
ADDRLP4 0+4
CNSTI4 2
ASGNI4
LABELV $1528
line 3347
;3347:		}
LABELV $1526
line 3349
;3348:
;3349:		CG_AddRefEntityWithPowerups(&torso, &cent->currentState, ci->team);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 3352
;3350:
;3351:		// don't change visibility of weapon (who used parent.rendefx) 
;3352:		if ( rightAngles[PITCH] >= VR_angle_hide_torso.integer || VR_hide_torso.integer )
ADDRLP4 588
INDIRF4
ADDRGP4 VR_angle_hide_torso+12
INDIRI4
CVIF4 4
GEF4 $1538
ADDRGP4 VR_hide_torso+12
INDIRI4
CNSTI4 0
EQI4 $1534
LABELV $1538
line 3353
;3353:			torso.renderfx = keepTorsoRenderfx;
ADDRLP4 0+4
ADDRLP4 632
INDIRI4
ASGNI4
LABELV $1534
line 3354
;3354:	}
line 3359
;3355:
;3356:	//=============================
;3357:	// add gun / barrel / flash
;3358:	//=============================
;3359:	CG_AddPlayerWeapon( &torso, NULL, cent, ci->team, &gun );
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 436
ARGP4
ADDRGP4 CG_AddPlayerWeapon
CALLV
pop
line 3364
;3360:
;3361:	// =============================
;3362:	// add powerups floating behind the player
;3363:	// =============================
;3364:	CG_PlayerPowerups( cent, &torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_PlayerPowerups
CALLV
pop
line 3371
;3365:
;3366:	//=============================
;3367:	//	  add players laser beam
;3368:	//		or crosshair
;3369:	//=============================
;3370:#ifdef USE_LASER_SIGHT
;3371:	laserNeeded = CG_LaserNeeded(cent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 632
ADDRGP4 CG_LaserNeeded
CALLI4
ASGNI4
ADDRLP4 604
ADDRLP4 632
INDIRI4
ASGNI4
line 3372
;3372:	if ( mySelf && !laserNeeded && !weapon_select )
ADDRLP4 424
INDIRI4
CNSTI4 0
EQI4 $1540
ADDRLP4 604
INDIRI4
CNSTI4 0
NEI4 $1540
ADDRLP4 608
INDIRI4
CNSTI4 0
NEI4 $1540
line 3374
;3373:#endif
;3374:		CG_DrawCrosshair3D(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_DrawCrosshair3D
CALLV
pop
LABELV $1540
line 3380
;3375:
;3376:	//=============================
;3377:	//		add 3D menu geometry
;3378:	//=============================
;3379:#ifdef USE_VIRTUAL_MENU
;3380:	CG_VR_Menu( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_VR_Menu
CALLV
pop
line 3387
;3381:#endif
;3382:
;3383:	// =============================
;3384:	//		add virtual keyboard
;3385:	// =============================
;3386:#ifdef USE_VIRTUAL_KEYBOARD
;3387:	if ( mySelf && ci->vr_controller_type && showVirtualKeyboard.integer ) {
ADDRLP4 424
INDIRI4
CNSTI4 0
EQI4 $1542
ADDRLP4 140
INDIRP4
CNSTI4 1652
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1542
ADDRGP4 showVirtualKeyboard+12
INDIRI4
CNSTI4 0
EQI4 $1542
line 3388
;3388:		CG_VR_Keyboard( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_VR_Keyboard
CALLV
pop
line 3389
;3389:	}
LABELV $1542
line 3391
;3390:#endif
;3391:}
LABELV $1354
endproc CG_Player 680 28
export CG_ResetPlayerEntity
proc CG_ResetPlayerEntity 40 12
line 3403
;3392:
;3393:
;3394://=====================================================================
;3395:
;3396:/*
;3397:===============
;3398:CG_ResetPlayerEntity
;3399:
;3400:A player just came into view or teleported, so reset all animation info
;3401:===============
;3402:*/
;3403:void CG_ResetPlayerEntity( centity_t *cent ) {
line 3404
;3404:	cent->errorTime = -99999;		// guarantee no error decay added
ADDRFP4 0
INDIRP4
CNSTI4 1144
ADDP4
CNSTI4 -99999
ASGNI4
line 3405
;3405:	cent->extrapolated = qfalse;	
ADDRFP4 0
INDIRP4
CNSTI4 1172
ADDP4
CNSTI4 0
ASGNI4
line 3407
;3406:
;3407:	CG_ClearLerpFrame( &cgs.clientinfo[ cent->currentState.clientNum ], &cent->pe.legs, cent->currentState.legsAnim );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 3408
;3408:	CG_ClearLerpFrame( &cgs.clientinfo[ cent->currentState.clientNum ], &cent->pe.torso, cent->currentState.torsoAnim );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1004
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 3410
;3409:
;3410:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, cent->lerpOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+234764
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 1212
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 3411
;3411:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time, cent->lerpAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+234764
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 1224
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 3413
;3412:
;3413:	VectorCopy( cent->lerpOrigin, cent->rawOrigin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1176
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 1212
ADDP4
INDIRB
ASGNB 12
line 3414
;3414:	VectorCopy( cent->lerpAngles, cent->rawAngles );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1188
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 1224
ADDP4
INDIRB
ASGNB 12
line 3416
;3415:
;3416:	memset( &cent->pe.legs, 0, sizeof( cent->pe.legs ) );
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 3417
;3417:	cent->pe.legs.yawAngle = cent->rawAngles[YAW];
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 976
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 1192
ADDP4
INDIRF4
ASGNF4
line 3418
;3418:	cent->pe.legs.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 980
ADDP4
CNSTI4 0
ASGNI4
line 3419
;3419:	cent->pe.legs.pitchAngle = 0;
ADDRFP4 0
INDIRP4
CNSTI4 984
ADDP4
CNSTF4 0
ASGNF4
line 3420
;3420:	cent->pe.legs.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 3422
;3421:
;3422:	memset( &cent->pe.torso, 0, sizeof( cent->pe.torso ) );
ADDRFP4 0
INDIRP4
CNSTI4 1004
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 3423
;3423:	cent->pe.torso.yawAngle = cent->rawAngles[YAW];
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1024
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 1192
ADDP4
INDIRF4
ASGNF4
line 3424
;3424:	cent->pe.torso.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
CNSTI4 0
ASGNI4
line 3425
;3425:	cent->pe.torso.pitchAngle = cent->rawAngles[PITCH];
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 1032
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 1188
ADDP4
INDIRF4
ASGNF4
line 3426
;3426:	cent->pe.torso.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1036
ADDP4
CNSTI4 0
ASGNI4
line 3428
;3427:
;3428:	if ( cg_debugPosition.integer ) {
ADDRGP4 cg_debugPosition+12
INDIRI4
CNSTI4 0
EQI4 $1550
line 3429
;3429:		CG_Printf("%i ResetPlayerEntity yaw=%f\n", cent->currentState.number, cent->pe.torso.yawAngle );
ADDRGP4 $1553
ARGP4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
CNSTI4 1024
ADDP4
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 3430
;3430:	}
LABELV $1550
line 3431
;3431:}
LABELV $1545
endproc CG_ResetPlayerEntity 40 12
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
import cg_firstPersonBodyScale
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
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_PlayDroppedEvents
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_GetModelHeight
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
LABELV $1553
byte 1 37
byte 1 105
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 121
byte 1 97
byte 1 119
byte 1 61
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $1495
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1430
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $1334
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
byte 1 78
byte 1 117
byte 1 109
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $902
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $789
byte 1 67
byte 1 108
byte 1 97
byte 1 109
byte 1 112
byte 1 32
byte 1 108
byte 1 102
byte 1 45
byte 1 62
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $755
byte 1 65
byte 1 110
byte 1 105
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $751
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $746
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 119
byte 1 46
byte 1 32
byte 1 32
byte 1 85
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $733
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 119
byte 1 46
byte 1 32
byte 1 85
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $710
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $704
byte 1 116
byte 1 108
byte 1 0
align 1
LABELV $702
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $684
byte 1 108
byte 1 0
align 1
LABELV $682
byte 1 119
byte 1 0
align 1
LABELV $680
byte 1 104
byte 1 99
byte 1 0
align 1
LABELV $678
byte 1 118
byte 1 116
byte 1 0
align 1
LABELV $676
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $659
byte 1 99
byte 1 50
byte 1 0
align 1
LABELV $657
byte 1 99
byte 1 49
byte 1 0
align 1
LABELV $653
byte 1 116
byte 1 0
align 1
LABELV $650
byte 1 110
byte 1 0
align 1
LABELV $586
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $562
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $530
byte 1 67
byte 1 71
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $461
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
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $452
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $447
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 95
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 76
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $444
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 95
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 95
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 76
byte 1 32
byte 1 47
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $436
byte 1 67
byte 1 71
byte 1 95
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 40
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 41
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $430
byte 1 48
byte 1 0
align 1
LABELV $427
byte 1 114
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $396
byte 1 120
byte 1 97
byte 1 101
byte 1 114
byte 1 111
byte 1 0
align 1
LABELV $395
byte 1 118
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $394
byte 1 117
byte 1 114
byte 1 105
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $393
byte 1 116
byte 1 97
byte 1 110
byte 1 107
byte 1 106
byte 1 114
byte 1 0
align 1
LABELV $392
byte 1 115
byte 1 111
byte 1 114
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $391
byte 1 115
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $390
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $389
byte 1 114
byte 1 97
byte 1 122
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $388
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $387
byte 1 111
byte 1 114
byte 1 98
byte 1 98
byte 1 0
align 1
LABELV $386
byte 1 109
byte 1 121
byte 1 110
byte 1 120
byte 1 0
align 1
LABELV $385
byte 1 109
byte 1 97
byte 1 106
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $384
byte 1 108
byte 1 117
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $383
byte 1 107
byte 1 108
byte 1 101
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $382
byte 1 107
byte 1 101
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $381
byte 1 104
byte 1 117
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $380
byte 1 103
byte 1 114
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $379
byte 1 100
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $378
byte 1 99
byte 1 114
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $377
byte 1 98
byte 1 111
byte 1 110
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $376
byte 1 98
byte 1 105
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $375
byte 1 98
byte 1 105
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $374
byte 1 97
byte 1 110
byte 1 97
byte 1 114
byte 1 107
byte 1 105
byte 1 0
align 1
LABELV $368
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $365
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $362
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $359
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $356
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $355
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $352
byte 1 83
byte 1 116
byte 1 114
byte 1 111
byte 1 103
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $351
byte 1 80
byte 1 97
byte 1 103
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $350
byte 1 37
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $347
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $338
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $337
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $332
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $329
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $328
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $325
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $322
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $314
byte 1 72
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $311
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $308
byte 1 84
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $305
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $302
byte 1 76
byte 1 101
byte 1 103
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $299
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $298
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $278
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $277
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $267
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $253
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $243
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $242
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $234
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $233
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $223
byte 1 0
align 1
LABELV $222
byte 1 112
byte 1 109
byte 1 0
align 1
LABELV $219
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $218
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $204
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $179
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $176
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $173
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $162
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $153
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 111
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $150
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 105
byte 1 110
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
LABELV $149
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 103
byte 1 121
byte 1 0
align 1
LABELV $146
byte 1 109
byte 1 101
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $143
byte 1 102
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $140
byte 1 98
byte 1 111
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $136
byte 1 110
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $135
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $130
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $122
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $114
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $99
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
LABELV $98
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
LABELV $97
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
LABELV $96
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
LABELV $95
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $94
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
LABELV $93
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
LABELV $92
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
LABELV $91
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
LABELV $90
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
LABELV $89
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $88
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $87
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
