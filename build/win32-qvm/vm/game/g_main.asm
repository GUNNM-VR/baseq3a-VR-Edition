data
align 4
LABELV gameCvarTable
address g_cheats
address $55
address $56
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_itemTimer
address $57
address $58
byte 4 4
skip 12
address g_allowDeathCam
address $59
address $58
byte 4 4
skip 12
byte 4 0
address $60
address $61
byte 4 68
byte 4 0
byte 4 0
skip 4
byte 4 0
address $62
address $63
byte 4 64
byte 4 0
byte 4 0
skip 4
address g_mapname
address $64
address $56
byte 4 68
byte 4 0
byte 4 0
skip 4
address sv_fps
address $65
address $66
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_gametype
address $67
address $68
byte 4 38
byte 4 0
byte 4 0
skip 4
address g_maxclients
address $69
address $70
byte 4 37
byte 4 0
byte 4 0
skip 4
address g_maxGameClients
address $71
address $68
byte 4 37
byte 4 0
byte 4 0
skip 4
address g_dmflags
address $72
address $68
byte 4 5
byte 4 0
byte 4 1
skip 4
address g_fraglimit
address $73
address $74
byte 4 1029
byte 4 0
byte 4 1
skip 4
address g_timelimit
address $75
address $68
byte 4 1029
byte 4 0
byte 4 1
skip 4
address g_capturelimit
address $76
address $70
byte 4 1029
byte 4 0
byte 4 1
skip 4
address g_synchronousClients
address $77
address $68
byte 4 8
byte 4 0
byte 4 0
skip 4
address g_friendlyFire
address $78
address $68
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_autoJoin
address $79
address $58
byte 4 1
skip 12
address g_teamForceBalance
address $80
address $68
byte 4 1
skip 12
address g_warmup
address $81
address $74
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_log
address $82
address $83
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_logSync
address $84
address $68
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_password
address $85
address $56
byte 4 2
byte 4 0
byte 4 0
skip 4
address g_banIPs
address $86
address $56
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_filterBan
address $87
address $58
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_needpass
address $88
address $68
byte 4 68
byte 4 0
byte 4 0
skip 4
address g_dedicated
address $89
address $68
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_speed
address $90
address $91
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_gravity
address $92
address $93
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_knockback
address $94
address $95
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_quadfactor
address $96
address $97
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_weaponRespawn
address $98
address $99
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_weaponTeamRespawn
address $100
address $66
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_forcerespawn
address $101
address $74
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_inactivity
address $102
address $68
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_debugMove
address $103
address $68
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_debugDamage
address $104
address $68
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_debugAlloc
address $105
address $68
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_motd
address $106
address $56
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_blood
address $107
address $58
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_podiumDist
address $108
address $109
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_podiumDrop
address $110
address $111
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_allowVote
address $112
address $58
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_listEntity
address $113
address $68
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_unlagged
address $114
address $58
byte 4 5
byte 4 0
byte 4 0
skip 4
address g_predictPVS
address $115
address $68
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_smoothClients
address $116
address $58
byte 4 0
byte 4 0
byte 4 0
skip 4
address pmove_fixed
address $117
address $68
byte 4 8
byte 4 0
byte 4 0
skip 4
address pmove_msec
address $118
address $70
byte 4 8
byte 4 0
byte 4 0
skip 4
address g_rotation
address $119
address $56
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_PureAllowHook
address $120
address $68
byte 4 36
byte 4 0
byte 4 0
skip 4
export vmMain
code
proc vmMain 16 12
file "..\..\..\..\code\game\g_main.c"
line 220
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:
;6:#ifdef USE_NATIVE_HACK
;7:#include "../../../Quake3e-master/code/vrmod/VRMOD_input.h"
;8:vr_clientinfo_t *vrinfo;
;9:#endif
;10:
;11:level_locals_t	level;
;12:
;13:typedef struct {
;14:	vmCvar_t	*vmCvar;
;15:	const char	*cvarName;
;16:	const char	*defaultString;
;17:	int			cvarFlags;
;18:	int			modificationCount;	// for tracking changes
;19:	qboolean	trackChange;		// track this variable, and announce if changed
;20:	qboolean	teamShader;			// track and if changed, update shader state
;21:} cvarTable_t;
;22:
;23:gentity_t		g_entities[MAX_GENTITIES];
;24:gclient_t		g_clients[MAX_CLIENTS];
;25:
;26:vmCvar_t	g_gametype;
;27:vmCvar_t	g_dmflags;
;28:vmCvar_t	g_fraglimit;
;29:vmCvar_t	g_timelimit;
;30:vmCvar_t	g_capturelimit;
;31:vmCvar_t	g_friendlyFire;
;32:vmCvar_t	g_password;
;33:vmCvar_t	g_needpass;
;34:vmCvar_t	g_mapname;
;35:vmCvar_t	sv_fps;
;36:vmCvar_t	g_maxclients;
;37:vmCvar_t	g_maxGameClients;
;38:vmCvar_t	g_dedicated;
;39:vmCvar_t	g_speed;
;40:vmCvar_t	g_gravity;
;41:vmCvar_t	g_cheats;
;42:vmCvar_t	g_knockback;
;43:vmCvar_t	g_quadfactor;
;44:vmCvar_t	g_forcerespawn;
;45:vmCvar_t	g_inactivity;
;46:vmCvar_t	g_debugMove;
;47:vmCvar_t	g_debugDamage;
;48:vmCvar_t	g_debugAlloc;
;49:vmCvar_t	g_weaponRespawn;
;50:vmCvar_t	g_weaponTeamRespawn;
;51:vmCvar_t	g_motd;
;52:vmCvar_t	g_synchronousClients;
;53:vmCvar_t	g_warmup;
;54:vmCvar_t	g_predictPVS;
;55://vmCvar_t	g_restarted;
;56:vmCvar_t	g_log;
;57:vmCvar_t	g_logSync;
;58:vmCvar_t	g_blood;
;59:vmCvar_t	g_podiumDist;
;60:vmCvar_t	g_podiumDrop;
;61:vmCvar_t	g_allowVote;
;62:vmCvar_t	g_autoJoin;
;63:vmCvar_t	g_teamForceBalance;
;64:vmCvar_t	g_banIPs;
;65:vmCvar_t	g_filterBan;
;66:vmCvar_t	g_smoothClients;
;67:vmCvar_t	g_rotation;
;68:vmCvar_t	g_unlagged;
;69:vmCvar_t	pmove_fixed;
;70:vmCvar_t	pmove_msec;
;71:vmCvar_t	g_listEntity;
;72:#ifdef MISSIONPACK
;73:vmCvar_t	g_obeliskHealth;
;74:vmCvar_t	g_obeliskRegenPeriod;
;75:vmCvar_t	g_obeliskRegenAmount;
;76:vmCvar_t	g_obeliskRespawnDelay;
;77:vmCvar_t	g_cubeTimeout;
;78:vmCvar_t	g_redteam;
;79:vmCvar_t	g_blueteam;
;80:vmCvar_t	g_singlePlayer;
;81:vmCvar_t	g_enableDust;
;82:vmCvar_t	g_enableBreath;
;83:vmCvar_t	g_proxMineTimeout;
;84:#endif
;85:#ifdef USE_GRAPPLING_HOOK
;86:vmCvar_t 	g_PureAllowHook;
;87:#endif
;88:#ifdef USE_ITEM_TIMERS
;89:vmCvar_t 	g_itemTimer;
;90:#endif
;91:#ifdef USE_DEATHCAM
;92:vmCvar_t 	g_allowDeathCam;
;93:#endif
;94:
;95:static cvarTable_t gameCvarTable[] = {
;96:	// don't override the cheat state set by the system
;97:	{ &g_cheats, "sv_cheats", "", 0, 0, qfalse },
;98:
;99:#ifdef USE_ITEM_TIMERS
;100:	{ &g_itemTimer, "g_itemTimer", "1", CVAR_SERVERINFO },
;101:#endif
;102:#ifdef USE_DEATHCAM
;103:	{ &g_allowDeathCam, "g_allowDeathCam", "1", CVAR_SERVERINFO },
;104:#endif
;105:
;106:	// noset vars
;107:	{ NULL, "gamename", GAMEVERSION , CVAR_SERVERINFO | CVAR_ROM, 0, qfalse  },
;108:	{ NULL, "gamedate", __DATE__ , CVAR_ROM, 0, qfalse  },
;109:	//{ &g_restarted, "g_restarted", "0", CVAR_ROM, 0, qfalse  },
;110:	{ &g_mapname, "mapname", "", CVAR_SERVERINFO | CVAR_ROM, 0, qfalse  },
;111:	{ &sv_fps, "sv_fps", "30", CVAR_ARCHIVE, 0, qfalse  },
;112:
;113:	// latched vars
;114:	{ &g_gametype, "g_gametype", "0", CVAR_SERVERINFO | CVAR_USERINFO | CVAR_LATCH, 0, qfalse  },
;115:
;116:	{ &g_maxclients, "sv_maxclients", "8", CVAR_SERVERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qfalse  },
;117:	{ &g_maxGameClients, "g_maxGameClients", "0", CVAR_SERVERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qfalse  },
;118:
;119:	// change anytime vars
;120:	{ &g_dmflags, "dmflags", "0", CVAR_SERVERINFO | CVAR_ARCHIVE, 0, qtrue  },
;121:	{ &g_fraglimit, "fraglimit", "20", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue },
;122:	{ &g_timelimit, "timelimit", "0", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue },
;123:	{ &g_capturelimit, "capturelimit", "8", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue },
;124:
;125:	{ &g_synchronousClients, "g_synchronousClients", "0", CVAR_SYSTEMINFO, 0, qfalse  },
;126:
;127:	{ &g_friendlyFire, "g_friendlyFire", "0", CVAR_ARCHIVE, 0, qtrue  },
;128:
;129:	{ &g_autoJoin, "g_autoJoin", "1", CVAR_ARCHIVE  },
;130:	{ &g_teamForceBalance, "g_teamForceBalance", "0", CVAR_ARCHIVE  },
;131:
;132:	{ &g_warmup, "g_warmup", "20", CVAR_ARCHIVE, 0, qtrue  },
;133:	{ &g_log, "g_log", "games.log", CVAR_ARCHIVE, 0, qfalse  },
;134:	{ &g_logSync, "g_logSync", "0", CVAR_ARCHIVE, 0, qfalse  },
;135:
;136:	{ &g_password, "g_password", "", CVAR_USERINFO, 0, qfalse  },
;137:
;138:	{ &g_banIPs, "g_banIPs", "", CVAR_ARCHIVE, 0, qfalse  },
;139:	{ &g_filterBan, "g_filterBan", "1", CVAR_ARCHIVE, 0, qfalse  },
;140:
;141:	{ &g_needpass, "g_needpass", "0", CVAR_SERVERINFO | CVAR_ROM, 0, qfalse },
;142:
;143:	{ &g_dedicated, "dedicated", "0", 0, 0, qfalse  },
;144:
;145:	{ &g_speed, "g_speed", "320", 0, 0, qtrue  },
;146:	{ &g_gravity, "g_gravity", "800", 0, 0, qtrue  },
;147:	{ &g_knockback, "g_knockback", "1000", 0, 0, qtrue  },
;148:	{ &g_quadfactor, "g_quadfactor", "3", 0, 0, qtrue  },
;149:	{ &g_weaponRespawn, "g_weaponrespawn", "5", 0, 0, qtrue  },
;150:	{ &g_weaponTeamRespawn, "g_weaponTeamRespawn", "30", 0, 0, qtrue },
;151:	{ &g_forcerespawn, "g_forcerespawn", "20", 0, 0, qtrue },
;152:	{ &g_inactivity, "g_inactivity", "0", 0, 0, qtrue },
;153:	{ &g_debugMove, "g_debugMove", "0", 0, 0, qfalse },
;154:	{ &g_debugDamage, "g_debugDamage", "0", 0, 0, qfalse },
;155:	{ &g_debugAlloc, "g_debugAlloc", "0", 0, 0, qfalse },
;156:	{ &g_motd, "g_motd", "", 0, 0, qfalse },
;157:	{ &g_blood, "com_blood", "1", 0, 0, qfalse },
;158:
;159:	{ &g_podiumDist, "g_podiumDist", "80", 0, 0, qfalse },
;160:	{ &g_podiumDrop, "g_podiumDrop", "70", 0, 0, qfalse },
;161:
;162:	{ &g_allowVote, "g_allowVote", "1", CVAR_ARCHIVE, 0, qfalse },
;163:	{ &g_listEntity, "g_listEntity", "0", 0, 0, qfalse },
;164:
;165:	{ &g_unlagged, "g_unlagged", "1", CVAR_SERVERINFO | CVAR_ARCHIVE, 0, qfalse },
;166:	{ &g_predictPVS, "g_predictPVS", "0", CVAR_ARCHIVE, 0, qfalse },
;167:
;168:#ifdef MISSIONPACK
;169:	{ &g_obeliskHealth, "g_obeliskHealth", "2500", 0, 0, qfalse },
;170:	{ &g_obeliskRegenPeriod, "g_obeliskRegenPeriod", "1", 0, 0, qfalse },
;171:	{ &g_obeliskRegenAmount, "g_obeliskRegenAmount", "15", 0, 0, qfalse },
;172:	{ &g_obeliskRespawnDelay, "g_obeliskRespawnDelay", "10", CVAR_SERVERINFO, 0, qfalse },
;173:
;174:	{ &g_cubeTimeout, "g_cubeTimeout", "30", 0, 0, qfalse },
;175:	{ &g_redteam, "g_redteam", "Stroggs", CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO , 0, qtrue, qtrue },
;176:	{ &g_blueteam, "g_blueteam", "Pagans", CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO , 0, qtrue, qtrue  },
;177:	{ &g_singlePlayer, "ui_singlePlayerActive", "", 0, 0, qfalse, qfalse  },
;178:
;179:	{ &g_enableDust, "g_enableDust", "0", CVAR_SERVERINFO, 0, qtrue, qfalse },
;180:	{ &g_enableBreath, "g_enableBreath", "0", CVAR_SERVERINFO, 0, qtrue, qfalse },
;181:	{ &g_proxMineTimeout, "g_proxMineTimeout", "20000", 0, 0, qfalse },
;182:#endif
;183:	{ &g_smoothClients, "g_smoothClients", "1", 0, 0, qfalse},
;184:	{ &pmove_fixed, "pmove_fixed", "0", CVAR_SYSTEMINFO, 0, qfalse},
;185:	{ &pmove_msec, "pmove_msec", "8", CVAR_SYSTEMINFO, 0, qfalse},
;186:
;187:	{ &g_rotation, "g_rotation", "", CVAR_ARCHIVE, 0, qfalse }
;188:#ifdef USE_GRAPPLING_HOOK
;189:	,{ &g_PureAllowHook, "g_PureAllowHook", "0", CVAR_SERVERINFO | CVAR_LATCH, 0, qfalse }
;190:#endif
;191:};
;192:
;193:
;194:static void G_InitGame( int levelTime, int randomSeed, int restart );
;195:static void G_RunFrame( int levelTime );
;196:static void G_ShutdownGame( int restart );
;197:static void CheckExitRules( void );
;198:static void SendScoreboardMessageToAllClients( void );
;199:
;200:// extension interface
;201:#ifdef Q3_VM
;202:qboolean (*trap_GetValue)( char *value, int valueSize, const char *key );
;203:#else
;204:int dll_com_trapGetValue;
;205:#endif
;206:
;207:int	svf_self_portal2;
;208:
;209:/*
;210:================
;211:vmMain
;212:
;213:This is the only way control passes into the module.
;214:This must be the very first function compiled into the .q3vm file
;215:================
;216:*/
;217:#ifdef USE_NATIVE_HACK
;218:DLLEXPORT intptr_t vmMain(int command, int arg0, int arg1, int arg2, int arg3, int arg4) {
;219:#else
;220:DLLEXPORT intptr_t vmMain( int command, int arg0, int arg1, int arg2 ) {
line 222
;221:#endif
;222:	switch ( command ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $122
ADDRLP4 0
INDIRI4
CNSTI4 10
GTI4 $122
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $135
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $135
address $124
address $125
address $126
address $130
address $128
address $129
address $131
address $127
address $132
address $133
address $134
code
LABELV $124
line 232
;223:	case GAME_INIT:
;224:#ifdef USE_NATIVE_HACK
;225:	{
;226:		int ptr[2];
;227:		ptr[0] = arg3;
;228:		ptr[1] = arg4;
;229:		vrinfo = (vr_clientinfo_t *)(*(long *)(ptr));
;230:	}
;231:#endif
;232:		G_InitGame( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 G_InitGame
CALLV
pop
line 233
;233:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $125
line 235
;234:	case GAME_SHUTDOWN:
;235:		G_ShutdownGame( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_ShutdownGame
CALLV
pop
line 236
;236:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $126
line 238
;237:	case GAME_CLIENT_CONNECT:
;238:		return (intptr_t)ClientConnect( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 ClientConnect
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CVUI4 4
RETI4
ADDRGP4 $121
JUMPV
LABELV $127
line 240
;239:	case GAME_CLIENT_THINK:
;240:		ClientThink( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientThink
CALLV
pop
line 241
;241:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $128
line 243
;242:	case GAME_CLIENT_USERINFO_CHANGED:
;243:		ClientUserinfoChanged( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 244
;244:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $129
line 246
;245:	case GAME_CLIENT_DISCONNECT:
;246:		ClientDisconnect( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientDisconnect
CALLV
pop
line 247
;247:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $130
line 249
;248:	case GAME_CLIENT_BEGIN:
;249:		ClientBegin( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 250
;250:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $131
line 252
;251:	case GAME_CLIENT_COMMAND:
;252:		ClientCommand( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientCommand
CALLV
pop
line 253
;253:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $132
line 255
;254:	case GAME_RUN_FRAME:
;255:		G_RunFrame( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_RunFrame
CALLV
pop
line 256
;256:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $121
JUMPV
LABELV $133
line 258
;257:	case GAME_CONSOLE_COMMAND:
;258:		return ConsoleCommand();
ADDRLP4 8
ADDRGP4 ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $121
JUMPV
LABELV $134
line 260
;259:	case BOTAI_START_FRAME:
;260:		return BotAIStartFrame( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BotAIStartFrame
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $121
JUMPV
LABELV $122
line 263
;261:	}
;262:
;263:	return -1;
CNSTI4 -1
RETI4
LABELV $121
endproc vmMain 16 12
export G_Printf
proc G_Printf 8204 12
line 267
;264:}
;265:
;266:
;267:void QDECL G_Printf( const char *fmt, ... ) {
line 272
;268:	va_list		argptr;
;269:	char		text[BIG_INFO_STRING];
;270:	int			len;
;271:
;272:	va_start( argptr, fmt );
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 273
;273:	len = ED_vsprintf( text, fmt, argptr );
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8200
ADDRGP4 ED_vsprintf
CALLI4
ASGNI4
ADDRLP4 8196
ADDRLP4 8200
INDIRI4
ASGNI4
line 274
;274:	va_end( argptr );
ADDRLP4 0
CNSTP4 0
ASGNP4
line 276
;275:
;276:	text[4095] = '\0'; // truncate to 1.32b/c max print buffer size
ADDRLP4 4+4095
CNSTI1 0
ASGNI1
line 278
;277:
;278:	trap_Print( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 279
;279:}
LABELV $136
endproc G_Printf 8204 12
export G_BroadcastServerCommand
proc G_BroadcastServerCommand 4 8
line 282
;280:
;281:
;282:void G_BroadcastServerCommand( int ignoreClient, const char *command ) {
line 284
;283:	int i;
;284:	for ( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $143
JUMPV
LABELV $140
line 285
;285:		if ( i == ignoreClient )
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $145
line 286
;286:			continue;
ADDRGP4 $141
JUMPV
LABELV $145
line 287
;287:		if ( level.clients[ i ].pers.connected == CON_CONNECTED ) {
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
NEI4 $147
line 288
;288:			trap_SendServerCommand( i, command );
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 289
;289:		}
LABELV $147
line 290
;290:	}
LABELV $141
line 284
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $143
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $140
line 291
;291:}
LABELV $139
endproc G_BroadcastServerCommand 4 8
export G_Error
proc G_Error 1028 12
line 294
;292:
;293:
;294:void QDECL G_Error( const char *fmt, ... ) {
line 298
;295:	va_list		argptr;
;296:	char		text[1024];
;297:
;298:	va_start( argptr, fmt );
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 299
;299:	ED_vsprintf( text, fmt, argptr );
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 300
;300:	va_end( argptr );
ADDRLP4 0
CNSTP4 0
ASGNP4
line 302
;301:
;302:	trap_Error( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 303
;303:}
LABELV $149
endproc G_Error 1028 12
export G_FindTeams
proc G_FindTeams 36 12
line 317
;304:
;305:
;306:/*
;307:================
;308:G_FindTeams
;309:
;310:Chain together all entities with a matching team field.
;311:Entity teams are used for item groups and multi-entity mover groups.
;312:
;313:All but the first will have the FL_TEAMSLAVE flag set and teammaster field set
;314:All but the last will have the teamchain field set to the next one
;315:================
;316:*/
;317:void G_FindTeams( void ) {
line 322
;318:	gentity_t	*e, *e2;
;319:	int		i, j;
;320:	int		c, c2;
;321:
;322:	c = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 323
;323:	c2 = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 324
;324:	for ( i=MAX_CLIENTS, e=g_entities+i ; i < level.num_entities ; i++,e++ ){
ADDRLP4 16
CNSTI4 64
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $155
JUMPV
LABELV $152
line 325
;325:		if (!e->inuse)
ADDRLP4 4
INDIRP4
CNSTI4 1016
ADDP4
INDIRI4
CNSTI4 0
NEI4 $157
line 326
;326:			continue;
ADDRGP4 $153
JUMPV
LABELV $157
line 327
;327:		if (!e->team)
ADDRLP4 4
INDIRP4
CNSTI4 1152
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $159
line 328
;328:			continue;
ADDRGP4 $153
JUMPV
LABELV $159
line 329
;329:		if (e->flags & FL_TEAMSLAVE)
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $161
line 330
;330:			continue;
ADDRGP4 $153
JUMPV
LABELV $161
line 331
;331:		e->teammaster = e;
ADDRLP4 4
INDIRP4
CNSTI4 1276
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 332
;332:		c++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 333
;333:		c2++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 334
;334:		for (j=i+1, e2=e+1 ; j < level.num_entities ; j++,e2++)
ADDRLP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 1312
ADDP4
ASGNP4
ADDRGP4 $166
JUMPV
LABELV $163
line 335
;335:		{
line 336
;336:			if (!e2->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 1016
ADDP4
INDIRI4
CNSTI4 0
NEI4 $168
line 337
;337:				continue;
ADDRGP4 $164
JUMPV
LABELV $168
line 338
;338:			if (!e2->team)
ADDRLP4 0
INDIRP4
CNSTI4 1152
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $170
line 339
;339:				continue;
ADDRGP4 $164
JUMPV
LABELV $170
line 340
;340:			if (e2->flags & FL_TEAMSLAVE)
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $172
line 341
;341:				continue;
ADDRGP4 $164
JUMPV
LABELV $172
line 342
;342:			if (!strcmp(e->team, e2->team))
ADDRLP4 4
INDIRP4
CNSTI4 1152
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1152
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $174
line 343
;343:			{
line 344
;344:				c2++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 345
;345:				e2->teamchain = e->teamchain;
ADDRLP4 0
INDIRP4
CNSTI4 1272
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1272
ADDP4
INDIRP4
ASGNP4
line 346
;346:				e->teamchain = e2;
ADDRLP4 4
INDIRP4
CNSTI4 1272
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 347
;347:				e2->teammaster = e;
ADDRLP4 0
INDIRP4
CNSTI4 1276
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 348
;348:				e2->flags |= FL_TEAMSLAVE;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 351
;349:
;350:				// make sure that targets only point at the master
;351:				if ( e2->targetname ) {
ADDRLP4 0
INDIRP4
CNSTI4 1148
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $176
line 352
;352:					e->targetname = e2->targetname;
ADDRLP4 4
INDIRP4
CNSTI4 1148
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1148
ADDP4
INDIRP4
ASGNP4
line 353
;353:					e2->targetname = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 1148
ADDP4
CNSTP4 0
ASGNP4
line 354
;354:				}
LABELV $176
line 355
;355:			}
LABELV $174
line 356
;356:		}
LABELV $164
line 334
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1312
ADDP4
ASGNP4
LABELV $166
ADDRLP4 8
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $163
line 357
;357:	}
LABELV $153
line 324
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1312
ADDP4
ASGNP4
LABELV $155
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $152
line 359
;358:
;359:	G_Printf ("%i teams with %i entities\n", c, c2);
ADDRGP4 $178
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 360
;360:}
LABELV $151
endproc G_FindTeams 36 12
export G_RemapTeamShaders
proc G_RemapTeamShaders 0 0
line 363
;361:
;362:
;363:void G_RemapTeamShaders( void ) {
line 375
;364:#ifdef MISSIONPACK
;365:	char string[1024];
;366:	float f = level.time * 0.001;
;367:	Com_sprintf( string, sizeof(string), "team_icon/%s_red", g_redteam.string );
;368:	AddRemap("textures/ctf2/redteam01", string, f); 
;369:	AddRemap("textures/ctf2/redteam02", string, f); 
;370:	Com_sprintf( string, sizeof(string), "team_icon/%s_blue", g_blueteam.string );
;371:	AddRemap("textures/ctf2/blueteam01", string, f); 
;372:	AddRemap("textures/ctf2/blueteam02", string, f); 
;373:	trap_SetConfigstring(CS_SHADERSTATE, BuildShaderStateConfig());
;374:#endif
;375:}
LABELV $179
endproc G_RemapTeamShaders 0 0
export G_RegisterCvars
proc G_RegisterCvars 20 16
line 383
;376:
;377:
;378:/*
;379:=================
;380:G_RegisterCvars
;381:=================
;382:*/
;383:void G_RegisterCvars( void ) {
line 384
;384:	qboolean remapped = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 388
;385:	cvarTable_t *cv;
;386:	int i;
;387:
;388:	for ( i = 0, cv = gameCvarTable ; i < ARRAY_LEN( gameCvarTable ) ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 gameCvarTable
ASGNP4
ADDRGP4 $184
JUMPV
LABELV $181
line 389
;389:		trap_Cvar_Register( cv->vmCvar, cv->cvarName,
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 391
;390:			cv->defaultString, cv->cvarFlags );
;391:		if ( cv->vmCvar )
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $185
line 392
;392:			cv->modificationCount = cv->vmCvar->modificationCount;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
LABELV $185
line 394
;393:
;394:		if (cv->teamShader) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $187
line 395
;395:			remapped = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 396
;396:		}
LABELV $187
line 397
;397:	}
LABELV $182
line 388
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
LABELV $184
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 50
LTU4 $181
line 399
;398:
;399:	if (remapped) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $189
line 400
;400:		G_RemapTeamShaders();
ADDRGP4 G_RemapTeamShaders
CALLV
pop
line 401
;401:	}
LABELV $189
line 404
;402:
;403:	// check some things
;404:	if ( g_gametype.integer < 0 || g_gametype.integer >= GT_MAX_GAME_TYPE ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
LTI4 $195
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $191
LABELV $195
line 405
;405:		G_Printf( "g_gametype %i is out of range, defaulting to 0\n", g_gametype.integer );
ADDRGP4 $196
ARGP4
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 406
;406:		trap_Cvar_Set( "g_gametype", "0" );
ADDRGP4 $67
ARGP4
ADDRGP4 $68
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 407
;407:		trap_Cvar_Update( &g_gametype );
ADDRGP4 g_gametype
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 408
;408:	}
LABELV $191
line 410
;409:
;410:	level.warmupModificationCount = g_warmup.modificationCount;
ADDRGP4 level+356
ADDRGP4 g_warmup+4
INDIRI4
ASGNI4
line 413
;411:
;412:	// force g_doWarmup to 1
;413:	trap_Cvar_Register( NULL, "g_doWarmup", "1", CVAR_ROM );
CNSTP4 0
ARGP4
ADDRGP4 $200
ARGP4
ADDRGP4 $58
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 414
;414:	trap_Cvar_Set( "g_doWarmup", "1" );
ADDRGP4 $200
ARGP4
ADDRGP4 $58
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 415
;415:}
LABELV $180
endproc G_RegisterCvars 20 16
proc G_UpdateCvars 28 12
line 423
;416:
;417:
;418:/*
;419:=================
;420:G_UpdateCvars
;421:=================
;422:*/
;423:static void G_UpdateCvars( void ) {
line 426
;424:	int			i;
;425:	cvarTable_t	*cv;
;426:	qboolean remapped = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 428
;427:
;428:	for ( i = 0, cv = gameCvarTable ; i < ARRAY_LEN( gameCvarTable ) ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 gameCvarTable
ASGNP4
ADDRGP4 $205
JUMPV
LABELV $202
line 429
;429:		if ( cv->vmCvar ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $206
line 430
;430:			trap_Cvar_Update( cv->vmCvar );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 432
;431:
;432:			if ( cv->modificationCount != cv->vmCvar->modificationCount ) {
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
EQI4 $208
line 433
;433:				cv->modificationCount = cv->vmCvar->modificationCount;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 435
;434:
;435:				if ( cv->trackChange ) {
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $210
line 436
;436:					G_BroadcastServerCommand( -1, va("print \"Server: %s changed to %s\n\"", 
ADDRGP4 $212
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 16
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
line 438
;437:						cv->cvarName, cv->vmCvar->string ) );
;438:				}
LABELV $210
line 440
;439:
;440:				if (cv->teamShader) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $213
line 441
;441:					remapped = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 442
;442:				}
LABELV $213
line 443
;443:			}
LABELV $208
line 444
;444:		}
LABELV $206
line 445
;445:	}
LABELV $203
line 428
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
LABELV $205
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 50
LTU4 $202
line 447
;446:
;447:	if (remapped) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $215
line 448
;448:		G_RemapTeamShaders();
ADDRGP4 G_RemapTeamShaders
CALLV
pop
line 449
;449:	}
LABELV $215
line 450
;450:}
LABELV $201
endproc G_UpdateCvars 28 12
proc G_LocateSpawnSpots 44 12
line 454
;451:
;452:
;453:static void G_LocateSpawnSpots( void ) 
;454:{
line 458
;455:	gentity_t			*ent;
;456:	int i, n;
;457:
;458:	level.spawnSpots[ SPAWN_SPOT_INTERMISSION ] = NULL;
ADDRGP4 level+7688+4092
CNSTP4 0
ASGNP4
line 461
;459:
;460:	// locate all spawn spots
;461:	n = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 462
;462:	ent = g_entities + MAX_CLIENTS;
ADDRLP4 0
ADDRGP4 g_entities+83968
ASGNP4
line 463
;463:	for ( i = MAX_CLIENTS; i < MAX_GENTITIES; i++, ent++ ) {
ADDRLP4 8
CNSTI4 64
ASGNI4
LABELV $221
line 465
;464:		
;465:		if ( !ent->inuse || !ent->classname )
ADDRLP4 0
INDIRP4
CNSTI4 1016
ADDP4
INDIRI4
CNSTI4 0
EQI4 $227
ADDRLP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $225
LABELV $227
line 466
;466:			continue;
ADDRGP4 $222
JUMPV
LABELV $225
line 469
;467:
;468:		// intermission/ffa spots
;469:		if ( !Q_stricmpn( ent->classname, "info_player_", 12 ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
ARGP4
ADDRGP4 $230
ARGP4
CNSTI4 12
ARGI4
ADDRLP4 16
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $228
line 470
;470:			if ( !Q_stricmp( ent->classname+12, "intermission" ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 $233
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $231
line 471
;471:				if ( level.spawnSpots[ SPAWN_SPOT_INTERMISSION ] == NULL ) {
ADDRGP4 level+7688+4092
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $222
line 472
;472:					level.spawnSpots[ SPAWN_SPOT_INTERMISSION ] = ent; // put in the last slot
ADDRGP4 level+7688+4092
ADDRLP4 0
INDIRP4
ASGNP4
line 473
;473:					ent->fteam = TEAM_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 0
ASGNI4
line 474
;474:				}
line 475
;475:				continue;
ADDRGP4 $222
JUMPV
LABELV $231
line 477
;476:			}
;477:			if ( !Q_stricmp( ent->classname+12, "deathmatch" ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 $242
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $222
line 478
;478:				level.spawnSpots[n] = ent; n++;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7688
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 479
;479:				level.numSpawnSpotsFFA++;
ADDRLP4 28
ADDRGP4 level+11792
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 480
;480:				ent->fteam = TEAM_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 0
ASGNI4
line 481
;481:				ent->count = 1;
ADDRLP4 0
INDIRP4
CNSTI4 1256
ADDP4
CNSTI4 1
ASGNI4
line 482
;482:				continue;
ADDRGP4 $222
JUMPV
line 484
;483:			}
;484:			continue;
LABELV $228
line 488
;485:		}
;486:
;487:		// team spawn spots
;488:		if ( !Q_stricmpn( ent->classname, "team_CTF_", 9 ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
ARGP4
ADDRGP4 $247
ARGP4
CNSTI4 9
ARGI4
ADDRLP4 20
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $245
line 489
;489:			if ( !Q_stricmp( ent->classname+9, "redspawn" ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CNSTI4 9
ADDP4
ARGP4
ADDRGP4 $250
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $248
line 490
;490:				level.spawnSpots[n] = ent; n++;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7688
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 491
;491:				level.numSpawnSpotsTeam++;
ADDRLP4 28
ADDRGP4 level+11788
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 492
;492:				ent->fteam = TEAM_RED;
ADDRLP4 0
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 1
ASGNI4
line 493
;493:				ent->count = 1; // means its not initial spawn point
ADDRLP4 0
INDIRP4
CNSTI4 1256
ADDP4
CNSTI4 1
ASGNI4
line 494
;494:				continue;
ADDRGP4 $222
JUMPV
LABELV $248
line 496
;495:			}
;496:			if ( !Q_stricmp( ent->classname+9, "bluespawn" ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CNSTI4 9
ADDP4
ARGP4
ADDRGP4 $255
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $253
line 497
;497:				level.spawnSpots[n] = ent; n++;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7688
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 498
;498:				level.numSpawnSpotsTeam++;
ADDRLP4 32
ADDRGP4 level+11788
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 499
;499:				ent->fteam = TEAM_BLUE;
ADDRLP4 0
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 2
ASGNI4
line 500
;500:				ent->count = 1;
ADDRLP4 0
INDIRP4
CNSTI4 1256
ADDP4
CNSTI4 1
ASGNI4
line 501
;501:				continue;
ADDRGP4 $222
JUMPV
LABELV $253
line 504
;502:			}
;503:			// base spawn spots
;504:			if ( !Q_stricmp( ent->classname+9, "redplayer" ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CNSTI4 9
ADDP4
ARGP4
ADDRGP4 $260
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $258
line 505
;505:				level.spawnSpots[n] = ent; n++;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7688
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 506
;506:				level.numSpawnSpotsTeam++;
ADDRLP4 36
ADDRGP4 level+11788
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 507
;507:				ent->fteam = TEAM_RED;
ADDRLP4 0
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 1
ASGNI4
line 508
;508:				ent->count = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1256
ADDP4
CNSTI4 0
ASGNI4
line 509
;509:				continue;
ADDRGP4 $222
JUMPV
LABELV $258
line 511
;510:			}
;511:			if ( !Q_stricmp( ent->classname+9, "blueplayer" ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CNSTI4 9
ADDP4
ARGP4
ADDRGP4 $265
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $263
line 512
;512:				level.spawnSpots[n] = ent; n++;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7688
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 513
;513:				level.numSpawnSpotsTeam++;
ADDRLP4 40
ADDRGP4 level+11788
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 514
;514:				ent->fteam = TEAM_BLUE;
ADDRLP4 0
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 2
ASGNI4
line 515
;515:				ent->count = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1256
ADDP4
CNSTI4 0
ASGNI4
line 516
;516:				continue;
LABELV $263
line 518
;517:			}
;518:		}
LABELV $245
line 519
;519:	}
LABELV $222
line 463
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1312
ADDP4
ASGNP4
ADDRLP4 8
INDIRI4
CNSTI4 1024
LTI4 $221
line 520
;520:	level.numSpawnSpots = n;
ADDRGP4 level+11784
ADDRLP4 4
INDIRI4
ASGNI4
line 521
;521:}
LABELV $217
endproc G_LocateSpawnSpots 44 12
proc G_InitGame 1288 20
line 530
;522:
;523:
;524:/*
;525:============
;526:G_InitGame
;527:
;528:============
;529:*/
;530:static void G_InitGame( int levelTime, int randomSeed, int restart ) {
line 534
;531:	char value[ MAX_CVAR_VALUE_STRING ];
;532:	int	i;
;533:
;534:	G_Printf ("------- Game Initialization -------\n");
ADDRGP4 $270
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 535
;535:	G_Printf ("gamename: %s\n", GAMEVERSION);
ADDRGP4 $271
ARGP4
ADDRGP4 $61
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 536
;536:	G_Printf ("gamedate: %s\n", __DATE__);
ADDRGP4 $272
ARGP4
ADDRGP4 $63
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 539
;537:
;538:	// extension interface
;539:	trap_Cvar_VariableStringBuffer( "//trap_GetValue", value, sizeof( value ) );
ADDRGP4 $273
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 540
;540:	if ( value[0] ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $274
line 542
;541:#ifdef Q3_VM
;542:		trap_GetValue = (void*)~atoi( value );// warning: conversion from `pointer to void' to `pointer to qboolean function
ADDRLP4 4
ARGP4
ADDRLP4 260
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 trap_GetValue
ADDRLP4 260
INDIRI4
BCOMI4
CVIU4 4
CVUP4 4
ASGNP4
line 546
;543:#else
;544:		dll_com_trapGetValue = atoi( value );
;545:#endif
;546:		if ( trap_GetValue( value, sizeof( value ), "SVF_SELF_PORTAL2_Q3E" ) ) {
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $278
ARGP4
ADDRLP4 264
ADDRGP4 trap_GetValue
INDIRP4
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $276
line 547
;547:			svf_self_portal2 = atoi( value );
ADDRLP4 4
ARGP4
ADDRLP4 268
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 svf_self_portal2
ADDRLP4 268
INDIRI4
ASGNI4
line 548
;548:		} else {
ADDRGP4 $277
JUMPV
LABELV $276
line 549
;549:			svf_self_portal2 = 0;
ADDRGP4 svf_self_portal2
CNSTI4 0
ASGNI4
line 550
;550:		}
LABELV $277
line 551
;551:	}
LABELV $274
line 553
;552:
;553:	srand( randomSeed );
ADDRFP4 4
INDIRI4
CVIU4 4
ARGU4
ADDRGP4 srand
CALLV
pop
line 555
;554:
;555:	G_RegisterCvars();
ADDRGP4 G_RegisterCvars
CALLV
pop
line 557
;556:
;557:	G_ProcessIPBans();
ADDRGP4 G_ProcessIPBans
CALLV
pop
line 559
;558:
;559:	G_InitMemory();
ADDRGP4 G_InitMemory
CALLV
pop
line 562
;560:
;561:	// set some level globals
;562:	memset( &level, 0, sizeof( level ) );
ADDRGP4 level
ARGP4
CNSTI4 0
ARGI4
CNSTI4 11804
ARGI4
ADDRGP4 memset
CALLP4
pop
line 563
;563:	level.time = levelTime;
ADDRGP4 level+32
ADDRFP4 0
INDIRI4
ASGNI4
line 565
;564:
;565:	level.startTime = levelTime;
ADDRGP4 level+40
ADDRFP4 0
INDIRI4
ASGNI4
line 567
;566:
;567:	level.previousTime = levelTime;
ADDRGP4 level+36
ADDRFP4 0
INDIRI4
ASGNI4
line 568
;568:	level.msec = FRAMETIME;
ADDRGP4 level+44
CNSTI4 100
ASGNI4
line 570
;569:
;570:	level.snd_fry = G_SoundIndex("sound/player/fry.wav");	// FIXME standing in lava / slime
ADDRGP4 $284
ARGP4
ADDRLP4 260
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 level+352
ADDRLP4 260
INDIRI4
ASGNI4
line 572
;571:
;572:	if ( g_gametype.integer != GT_SINGLE_PLAYER && g_log.string[0] ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $285
ADDRGP4 g_log+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $285
line 573
;573:		if ( g_logSync.integer ) {
ADDRGP4 g_logSync+12
INDIRI4
CNSTI4 0
EQI4 $289
line 574
;574:			trap_FS_FOpenFile( g_log.string, &level.logFile, FS_APPEND_SYNC );
ADDRGP4 g_log+16
ARGP4
ADDRGP4 level+20
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 575
;575:		} else {
ADDRGP4 $290
JUMPV
LABELV $289
line 576
;576:			trap_FS_FOpenFile( g_log.string, &level.logFile, FS_APPEND );
ADDRGP4 g_log+16
ARGP4
ADDRGP4 level+20
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 577
;577:		}
LABELV $290
line 578
;578:		if ( level.logFile == FS_INVALID_HANDLE ) {
ADDRGP4 level+20
INDIRI4
CNSTI4 0
NEI4 $296
line 579
;579:			G_Printf( "WARNING: Couldn't open logfile: %s\n", g_log.string );
ADDRGP4 $299
ARGP4
ADDRGP4 g_log+16
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 580
;580:		} else {
ADDRGP4 $286
JUMPV
LABELV $296
line 583
;581:			char	serverinfo[MAX_INFO_STRING];
;582:
;583:			trap_GetServerinfo( serverinfo, sizeof( serverinfo ) );
ADDRLP4 264
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetServerinfo
CALLV
pop
line 585
;584:
;585:			G_LogPrintf("------------------------------------------------------------\n" );
ADDRGP4 $301
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 586
;586:			G_LogPrintf("InitGame: %s\n", serverinfo );
ADDRGP4 $302
ARGP4
ADDRLP4 264
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 587
;587:		}
line 588
;588:	} else {
ADDRGP4 $286
JUMPV
LABELV $285
line 589
;589:		G_Printf( "Not logging to disk.\n" );
ADDRGP4 $303
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 590
;590:	}
LABELV $286
line 592
;591:
;592:	G_InitWorldSession();
ADDRGP4 G_InitWorldSession
CALLV
pop
line 595
;593:
;594:	// initialize all entities for this game
;595:	memset( g_entities, 0, MAX_GENTITIES * sizeof(g_entities[0]) );
ADDRGP4 g_entities
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1343488
ARGI4
ADDRGP4 memset
CALLP4
pop
line 596
;596:	level.gentities = g_entities;
ADDRGP4 level+4
ADDRGP4 g_entities
ASGNP4
line 599
;597:
;598:	// initialize all clients for this game
;599:	level.maxclients = g_maxclients.integer;
ADDRGP4 level+24
ADDRGP4 g_maxclients+12
INDIRI4
ASGNI4
line 600
;600:	memset( g_clients, 0, MAX_CLIENTS * sizeof(g_clients[0]) );
ADDRGP4 g_clients
ARGP4
CNSTI4 0
ARGI4
CNSTI4 111104
ARGI4
ADDRGP4 memset
CALLP4
pop
line 601
;601:	level.clients = g_clients;
ADDRGP4 level
ADDRGP4 g_clients
ASGNP4
line 604
;602:
;603:	// set client fields on player ents
;604:	for ( i=0 ; i<level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $310
JUMPV
LABELV $307
line 605
;605:		g_entities[i].client = level.clients + i;
ADDRLP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities+1012
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 606
;606:	}
LABELV $308
line 604
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $310
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $307
line 611
;607:
;608:	// always leave room for the max number of clients,
;609:	// even if they aren't all used, so numbers inside that
;610:	// range are NEVER anything but clients
;611:	level.num_entities = MAX_CLIENTS;
ADDRGP4 level+12
CNSTI4 64
ASGNI4
line 613
;612:
;613:	for ( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $314
line 614
;614:		g_entities[ i ].classname = "clientslot";
ADDRLP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities+1020
ADDP4
ADDRGP4 $319
ASGNP4
line 615
;615:	}
LABELV $315
line 613
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $314
line 618
;616:
;617:	// let the server system know where the entites are
;618:	trap_LocateGameData( level.gentities, level.num_entities, sizeof( gentity_t ), 
ADDRGP4 level+4
INDIRP4
ARGP4
ADDRGP4 level+12
INDIRI4
ARGI4
CNSTI4 1312
ARGI4
ADDRGP4 level
INDIRP4
ARGP4
CNSTI4 1736
ARGI4
ADDRGP4 trap_LocateGameData
CALLV
pop
line 622
;619:		&level.clients[0].ps, sizeof( level.clients[0] ) );
;620:
;621:	// reserve some spots for dead player bodies
;622:	InitBodyQue();
ADDRGP4 InitBodyQue
CALLV
pop
line 624
;623:
;624:	ClearRegisteredItems();
ADDRGP4 ClearRegisteredItems
CALLV
pop
line 627
;625:
;626:	// parse the key/value pairs and spawn gentities
;627:	G_SpawnEntitiesFromString();
ADDRGP4 G_SpawnEntitiesFromString
CALLV
pop
line 630
;628:
;629:	// general initialization
;630:	G_FindTeams();
ADDRGP4 G_FindTeams
CALLV
pop
line 633
;631:
;632:	// make sure we have flags for CTF, etc
;633:	if( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $322
line 634
;634:		G_CheckTeamItems();
ADDRGP4 G_CheckTeamItems
CALLV
pop
line 635
;635:	}
LABELV $322
line 637
;636:
;637:	SaveRegisteredItems();
ADDRGP4 SaveRegisteredItems
CALLV
pop
line 639
;638:
;639:	G_LocateSpawnSpots();
ADDRGP4 G_LocateSpawnSpots
CALLV
pop
line 641
;640:
;641:	G_Printf ("-----------------------------------\n");
ADDRGP4 $325
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 643
;642:
;643:	if( g_gametype.integer == GT_SINGLE_PLAYER || trap_Cvar_VariableIntegerValue( "com_buildScript" ) ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $330
ADDRGP4 $329
ARGP4
ADDRLP4 264
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $326
LABELV $330
line 644
;644:		G_ModelIndex( SP_PODIUM_MODEL );
ADDRGP4 $331
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 645
;645:	}
LABELV $326
line 647
;646:
;647:	if ( trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $334
ARGP4
ADDRLP4 268
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $332
line 648
;648:		BotAISetup( restart );
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 BotAISetup
CALLI4
pop
line 649
;649:		BotAILoadMap( restart );
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 BotAILoadMap
CALLI4
pop
line 650
;650:		G_InitBots( restart );
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_InitBots
CALLV
pop
line 651
;651:	}
LABELV $332
line 653
;652:
;653:	G_RemapTeamShaders();
ADDRGP4 G_RemapTeamShaders
CALLV
pop
line 656
;654:
;655:	// don't forget to reset times
;656:	trap_SetConfigstring( CS_INTERMISSION, "" );
CNSTI4 22
ARGI4
ADDRGP4 $56
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 658
;657:
;658:	if ( g_gametype.integer != GT_SINGLE_PLAYER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $335
line 660
;659:		// launch rotation system on first map load
;660:		if ( trap_Cvar_VariableIntegerValue( SV_ROTATION ) == 0 ) {
ADDRGP4 $340
ARGP4
ADDRLP4 272
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $338
line 661
;661:			trap_Cvar_Set( SV_ROTATION, "1" );
ADDRGP4 $340
ARGP4
ADDRGP4 $58
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 662
;662:			level.denyMapRestart = qtrue;
ADDRGP4 level+11796
CNSTI4 1
ASGNI4
line 663
;663:			ParseMapRotation();
ADDRGP4 ParseMapRotation
CALLI4
pop
line 664
;664:		}
LABELV $338
line 665
;665:	}
LABELV $335
line 666
;666:}
LABELV $269
endproc G_InitGame 1288 20
proc G_ShutdownGame 4 4
line 675
;667:
;668:
;669:/*
;670:=================
;671:G_ShutdownGame
;672:=================
;673:*/
;674:static void G_ShutdownGame( int restart )
;675:{
line 676
;676:	G_Printf ("==== ShutdownGame ====\n");
ADDRGP4 $343
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 678
;677:
;678:	if ( level.logFile != FS_INVALID_HANDLE ) {
ADDRGP4 level+20
INDIRI4
CNSTI4 0
EQI4 $344
line 679
;679:		G_LogPrintf("ShutdownGame:\n" );
ADDRGP4 $347
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 680
;680:		G_LogPrintf("------------------------------------------------------------\n" );
ADDRGP4 $301
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 681
;681:		trap_FS_FCloseFile( level.logFile );
ADDRGP4 level+20
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 682
;682:		level.logFile = FS_INVALID_HANDLE;
ADDRGP4 level+20
CNSTI4 0
ASGNI4
line 683
;683:	}
LABELV $344
line 686
;684:
;685:	// write all the client session data so we can get it back
;686:	G_WriteSessionData();
ADDRGP4 G_WriteSessionData
CALLV
pop
line 688
;687:
;688:	if ( trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $334
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $350
line 689
;689:		BotAIShutdown( restart );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAIShutdown
CALLI4
pop
line 690
;690:	}
LABELV $350
line 691
;691:}
LABELV $342
endproc G_ShutdownGame 4 4
export Com_Error
proc Com_Error 4100 12
line 700
;692:
;693:
;694:
;695://===================================================================
;696:
;697:#ifndef GAME_HARD_LINKED
;698:// this is only here so the functions in q_shared.c and bg_*.c can link
;699:
;700:void QDECL Com_Error( int level, const char *fmt, ... ) {
line 704
;701:	va_list		argptr;
;702:	char		text[4096];
;703:
;704:	va_start( argptr, fmt );
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 705
;705:	ED_vsprintf( text, fmt, argptr );
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 706
;706:	va_end( argptr );
ADDRLP4 0
CNSTP4 0
ASGNP4
line 708
;707:
;708:	trap_Error( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 709
;709:}
LABELV $352
endproc Com_Error 4100 12
export Com_Printf
proc Com_Printf 4100 12
line 712
;710:
;711:
;712:void QDECL Com_Printf( const char *fmt, ... ) {
line 716
;713:	va_list		argptr;
;714:	char		text[4096];
;715:
;716:	va_start( argptr, fmt );
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 717
;717:	ED_vsprintf( text, fmt, argptr );
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 718
;718:	va_end( argptr );
ADDRLP4 0
CNSTP4 0
ASGNP4
line 720
;719:
;720:	trap_Print( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 721
;721:}
LABELV $354
endproc Com_Printf 4100 12
export AddTournamentPlayer
proc AddTournamentPlayer 20 8
line 741
;722:
;723:#endif
;724:
;725:/*
;726:========================================================================
;727:
;728:PLAYER COUNTING / SCORE SORTING
;729:
;730:========================================================================
;731:*/
;732:
;733:/*
;734:=============
;735:AddTournamentPlayer
;736:
;737:If there are less than two tournament players, put a
;738:spectator in the game and restart
;739:=============
;740:*/
;741:void AddTournamentPlayer( void ) {
line 746
;742:	int			i;
;743:	gclient_t	*client;
;744:	gclient_t	*nextInLine;
;745:
;746:	if ( level.numPlayingClients >= 2 ) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
LTI4 $357
line 747
;747:		return;
ADDRGP4 $356
JUMPV
LABELV $357
line 751
;748:	}
;749:
;750:	// never change during intermission
;751:	if ( level.intermissiontime ) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $360
line 752
;752:		return;
ADDRGP4 $356
JUMPV
LABELV $360
line 755
;753:	}
;754:
;755:	nextInLine = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 757
;756:
;757:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $366
JUMPV
LABELV $363
line 758
;758:		client = &level.clients[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 759
;759:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 2
EQI4 $368
line 760
;760:			continue;
ADDRGP4 $364
JUMPV
LABELV $368
line 762
;761:		}
;762:		if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
EQI4 $370
line 763
;763:			continue;
ADDRGP4 $364
JUMPV
LABELV $370
line 766
;764:		}
;765:		// never select the dedicated follow or scoreboard clients
;766:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD || 
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
CNSTI4 3
EQI4 $374
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRI4
CNSTI4 0
GEI4 $372
LABELV $374
line 767
;767:			client->sess.spectatorClient < 0  ) {
line 768
;768:			continue;
ADDRGP4 $364
JUMPV
LABELV $372
line 771
;769:		}
;770:
;771:		if ( !nextInLine || client->sess.spectatorTime > nextInLine->sess.spectatorTime ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $377
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
LEI4 $375
LABELV $377
line 772
;772:			nextInLine = client;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
line 773
;773:		}
LABELV $375
line 774
;774:	}
LABELV $364
line 757
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $366
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $363
line 776
;775:
;776:	if ( !nextInLine ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $378
line 777
;777:		return;
ADDRGP4 $356
JUMPV
LABELV $378
line 780
;778:	}
;779:
;780:	level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 783
;781:
;782:	// set them to free-for-all team
;783:	SetTeam( &g_entities[ nextInLine - level.clients ], "f" );
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1736
DIVI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $381
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 784
;784:}
LABELV $356
endproc AddTournamentPlayer 20 8
export RemoveTournamentLoser
proc RemoveTournamentLoser 4 8
line 794
;785:
;786:
;787:/*
;788:=======================
;789:RemoveTournamentLoser
;790:
;791:Make the loser a spectator at the back of the line
;792:=======================
;793:*/
;794:void RemoveTournamentLoser( void ) {
line 797
;795:	int			clientNum;
;796:
;797:	if ( level.numPlayingClients != 2 ) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
EQI4 $383
line 798
;798:		return;
ADDRGP4 $382
JUMPV
LABELV $383
line 801
;799:	}
;800:
;801:	clientNum = level.sortedClients[1];
ADDRLP4 0
ADDRGP4 level+88+4
INDIRI4
ASGNI4
line 803
;802:
;803:	if ( level.clients[ clientNum ].pers.connected != CON_CONNECTED ) {
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
EQI4 $388
line 804
;804:		return;
ADDRGP4 $382
JUMPV
LABELV $388
line 808
;805:	}
;806:
;807:	// make them a spectator
;808:	SetTeam( &g_entities[ clientNum ], "s" );
ADDRLP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $390
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 809
;809:}
LABELV $382
endproc RemoveTournamentLoser 4 8
export RemoveTournamentWinner
proc RemoveTournamentWinner 4 8
line 817
;810:
;811:
;812:/*
;813:=======================
;814:RemoveTournamentWinner
;815:=======================
;816:*/
;817:void RemoveTournamentWinner( void ) {
line 820
;818:	int			clientNum;
;819:
;820:	if ( level.numPlayingClients != 2 ) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
EQI4 $392
line 821
;821:		return;
ADDRGP4 $391
JUMPV
LABELV $392
line 824
;822:	}
;823:
;824:	clientNum = level.sortedClients[0];
ADDRLP4 0
ADDRGP4 level+88
INDIRI4
ASGNI4
line 826
;825:
;826:	if ( level.clients[ clientNum ].pers.connected != CON_CONNECTED ) {
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
EQI4 $396
line 827
;827:		return;
ADDRGP4 $391
JUMPV
LABELV $396
line 831
;828:	}
;829:
;830:	// make them a spectator
;831:	SetTeam( &g_entities[ clientNum ], "s" );
ADDRLP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $390
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 832
;832:}
LABELV $391
endproc RemoveTournamentWinner 4 8
export AdjustTournamentScores
proc AdjustTournamentScores 8 4
line 840
;833:
;834:
;835:/*
;836:=======================
;837:AdjustTournamentScores
;838:=======================
;839:*/
;840:void AdjustTournamentScores( void ) {
line 843
;841:	int			clientNum;
;842:
;843:	clientNum = level.sortedClients[0];
ADDRLP4 0
ADDRGP4 level+88
INDIRI4
ASGNI4
line 844
;844:	if ( level.clients[ clientNum ].pers.connected == CON_CONNECTED ) {
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
NEI4 $400
line 845
;845:		level.clients[ clientNum ].sess.wins++;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 846
;846:		ClientUserinfoChanged( clientNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 847
;847:	}
LABELV $400
line 849
;848:
;849:	clientNum = level.sortedClients[1];
ADDRLP4 0
ADDRGP4 level+88+4
INDIRI4
ASGNI4
line 850
;850:	if ( level.clients[ clientNum ].pers.connected == CON_CONNECTED ) {
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
NEI4 $404
line 851
;851:		level.clients[ clientNum ].sess.losses++;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 812
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 852
;852:		ClientUserinfoChanged( clientNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 853
;853:	}
LABELV $404
line 855
;854:
;855:}
LABELV $398
endproc AdjustTournamentScores 8 4
proc SortRanks 16 0
line 863
;856:
;857:
;858:/*
;859:=============
;860:SortRanks
;861:=============
;862:*/
;863:static int QDECL SortRanks( const void *a, const void *b ) {
line 866
;864:	gclient_t	*ca, *cb;
;865:
;866:	ca = &level.clients[*(int *)a];
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 867
;867:	cb = &level.clients[*(int *)b];
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 870
;868:
;869:	// sort special clients last
;870:	if ( ca->sess.spectatorState == SPECTATOR_SCOREBOARD || ca->sess.spectatorClient < 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
CNSTI4 3
EQI4 $409
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRI4
CNSTI4 0
GEI4 $407
LABELV $409
line 871
;871:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $407
line 873
;872:	}
;873:	if ( cb->sess.spectatorState == SPECTATOR_SCOREBOARD || cb->sess.spectatorClient < 0  ) {
ADDRLP4 4
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
CNSTI4 3
EQI4 $412
ADDRLP4 4
INDIRP4
CNSTI4 804
ADDP4
INDIRI4
CNSTI4 0
GEI4 $410
LABELV $412
line 874
;874:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $406
JUMPV
LABELV $410
line 878
;875:	}
;876:
;877:	// then connecting clients
;878:	if ( ca->pers.connected == CON_CONNECTING ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $413
line 879
;879:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $413
line 881
;880:	}
;881:	if ( cb->pers.connected == CON_CONNECTING ) {
ADDRLP4 4
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $415
line 882
;882:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $406
JUMPV
LABELV $415
line 886
;883:	}
;884:
;885:	// then spectators
;886:	if ( ca->sess.sessionTeam == TEAM_SPECTATOR && cb->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
NEI4 $417
ADDRLP4 4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
NEI4 $417
line 887
;887:		if ( ca->sess.spectatorTime > cb->sess.spectatorTime ) {
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
LEI4 $419
line 888
;888:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $406
JUMPV
LABELV $419
line 890
;889:		}
;890:		if ( ca->sess.spectatorTime < cb->sess.spectatorTime ) {
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
GEI4 $421
line 891
;891:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $421
line 893
;892:		}
;893:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $406
JUMPV
LABELV $417
line 895
;894:	}
;895:	if ( ca->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
NEI4 $423
line 896
;896:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $423
line 898
;897:	}
;898:	if ( cb->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
NEI4 $425
line 899
;899:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $406
JUMPV
LABELV $425
line 903
;900:	}
;901:
;902:	// then sort by score
;903:	if ( ca->ps.persistant[PERS_SCORE]
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $427
line 904
;904:		> cb->ps.persistant[PERS_SCORE] ) {
line 905
;905:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $406
JUMPV
LABELV $427
line 907
;906:	}
;907:	if ( ca->ps.persistant[PERS_SCORE]
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
GEI4 $429
line 908
;908:		< cb->ps.persistant[PERS_SCORE] ) {
line 909
;909:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $429
line 911
;910:	}
;911:	return 0;
CNSTI4 0
RETI4
LABELV $406
endproc SortRanks 16 0
export CalculateRanks
proc CalculateRanks 44 16
line 924
;912:}
;913:
;914:
;915:/*
;916:============
;917:CalculateRanks
;918:
;919:Recalculates the score ranks of all players
;920:This will be called on every client connect, begin, disconnect, death,
;921:and team change.
;922:============
;923:*/
;924:void CalculateRanks( void ) {
line 931
;925:	int		i;
;926:	int		rank;
;927:	int		score;
;928:	int		newScore;
;929:	gclient_t	*cl;
;930:
;931:	if ( level.restarted )
ADDRGP4 level+72
INDIRI4
CNSTI4 0
EQI4 $432
line 932
;932:		return;
ADDRGP4 $431
JUMPV
LABELV $432
line 934
;933:
;934:	level.follow1 = -1;
ADDRGP4 level+344
CNSTI4 -1
ASGNI4
line 935
;935:	level.follow2 = -1;
ADDRGP4 level+348
CNSTI4 -1
ASGNI4
line 936
;936:	level.numConnectedClients = 0;
ADDRGP4 level+76
CNSTI4 0
ASGNI4
line 937
;937:	level.numNonSpectatorClients = 0;
ADDRGP4 level+80
CNSTI4 0
ASGNI4
line 938
;938:	level.numPlayingClients = 0;
ADDRGP4 level+84
CNSTI4 0
ASGNI4
line 939
;939:	level.numVotingClients = 0;		// don't count bots
ADDRGP4 level+888
CNSTI4 0
ASGNI4
line 940
;940:	for (i = 0; i < ARRAY_LEN(level.numteamVotingClients); i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $444
JUMPV
LABELV $441
line 941
;941:		level.numteamVotingClients[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2964
ADDP4
CNSTI4 0
ASGNI4
line 942
;942:	}
LABELV $442
line 940
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $444
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 4
LTU4 $441
line 943
;943:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $451
JUMPV
LABELV $448
line 944
;944:		if ( level.clients[i].pers.connected != CON_DISCONNECTED ) {
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
EQI4 $453
line 945
;945:			level.sortedClients[level.numConnectedClients] = i;
ADDRGP4 level+76
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 946
;946:			level.numConnectedClients++;
ADDRLP4 20
ADDRGP4 level+76
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 948
;947:
;948:			if ( level.clients[i].sess.sessionTeam != TEAM_SPECTATOR ) {
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
EQI4 $458
line 949
;949:				level.numNonSpectatorClients++;
ADDRLP4 24
ADDRGP4 level+80
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 952
;950:			
;951:				// decide if this should be auto-followed
;952:				if ( level.clients[i].pers.connected == CON_CONNECTED ) {
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
NEI4 $461
line 953
;953:					level.numPlayingClients++;
ADDRLP4 28
ADDRGP4 level+84
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 954
;954:					if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
ADDRLP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities+456+464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $464
line 955
;955:						level.numVotingClients++;
ADDRLP4 32
ADDRGP4 level+888
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 956
;956:						if ( level.clients[i].sess.sessionTeam == TEAM_RED )
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
CNSTI4 1
NEI4 $469
line 957
;957:							level.numteamVotingClients[0]++;
ADDRLP4 36
ADDRGP4 level+2964
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $470
JUMPV
LABELV $469
line 958
;958:						else if ( level.clients[i].sess.sessionTeam == TEAM_BLUE )
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
CNSTI4 2
NEI4 $472
line 959
;959:							level.numteamVotingClients[1]++;
ADDRLP4 40
ADDRGP4 level+2964+4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $472
LABELV $470
line 960
;960:					}
LABELV $464
line 961
;961:					if ( level.follow1 == -1 ) {
ADDRGP4 level+344
INDIRI4
CNSTI4 -1
NEI4 $476
line 962
;962:						level.follow1 = i;
ADDRGP4 level+344
ADDRLP4 0
INDIRI4
ASGNI4
line 963
;963:					} else if ( level.follow2 == -1 ) {
ADDRGP4 $477
JUMPV
LABELV $476
ADDRGP4 level+348
INDIRI4
CNSTI4 -1
NEI4 $480
line 964
;964:						level.follow2 = i;
ADDRGP4 level+348
ADDRLP4 0
INDIRI4
ASGNI4
line 965
;965:					}
LABELV $480
LABELV $477
line 966
;966:				}
LABELV $461
line 967
;967:			}
LABELV $458
line 968
;968:		}
LABELV $453
line 969
;969:	}
LABELV $449
line 943
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $451
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $448
line 971
;970:
;971:	qsort( level.sortedClients, level.numConnectedClients, 
ADDRGP4 level+88
ARGP4
ADDRGP4 level+76
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 SortRanks
ARGP4
ADDRGP4 qsort
CALLV
pop
line 975
;972:		sizeof(level.sortedClients[0]), SortRanks );
;973:
;974:	// set the rank value for all clients that are connected and not spectators
;975:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $487
line 977
;976:		// in team games, rank is just the order of the teams, 0=red, 1=blue, 2=tied
;977:		for ( i = 0;  i < level.numConnectedClients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $493
JUMPV
LABELV $490
line 978
;978:			cl = &level.clients[ level.sortedClients[i] ];
ADDRLP4 4
ADDRLP4 0
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
line 979
;979:			if ( level.teamScores[TEAM_RED] == level.teamScores[TEAM_BLUE] ) {
ADDRGP4 level+48+4
INDIRI4
ADDRGP4 level+48+8
INDIRI4
NEI4 $496
line 980
;980:				cl->ps.persistant[PERS_RANK] = 2;
ADDRLP4 4
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 2
ASGNI4
line 981
;981:			} else if ( level.teamScores[TEAM_RED] > level.teamScores[TEAM_BLUE] ) {
ADDRGP4 $497
JUMPV
LABELV $496
ADDRGP4 level+48+4
INDIRI4
ADDRGP4 level+48+8
INDIRI4
LEI4 $502
line 982
;982:				cl->ps.persistant[PERS_RANK] = 0;
ADDRLP4 4
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 983
;983:			} else {
ADDRGP4 $503
JUMPV
LABELV $502
line 984
;984:				cl->ps.persistant[PERS_RANK] = 1;
ADDRLP4 4
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 985
;985:			}
LABELV $503
LABELV $497
line 986
;986:		}
LABELV $491
line 977
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $493
ADDRLP4 0
INDIRI4
ADDRGP4 level+76
INDIRI4
LTI4 $490
line 987
;987:	} else {	
ADDRGP4 $488
JUMPV
LABELV $487
line 988
;988:		rank = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 989
;989:		score = MAX_QINT;
ADDRLP4 16
CNSTI4 2147483647
ASGNI4
line 990
;990:		for ( i = 0;  i < level.numPlayingClients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $511
JUMPV
LABELV $508
line 991
;991:			cl = &level.clients[ level.sortedClients[i] ];
ADDRLP4 4
ADDRLP4 0
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
line 992
;992:			newScore = cl->ps.persistant[PERS_SCORE];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 993
;993:			if ( i == 0 || newScore != score ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $516
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $514
LABELV $516
line 994
;994:				rank = i;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 996
;995:				// assume we aren't tied until the next client is checked
;996:				level.clients[ level.sortedClients[i] ].ps.persistant[PERS_RANK] = rank;
ADDRLP4 0
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
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 997
;997:			} else {
ADDRGP4 $515
JUMPV
LABELV $514
line 999
;998:				// we are tied with the previous client
;999:				level.clients[ level.sortedClients[i-1] ].ps.persistant[PERS_RANK] = rank | RANK_TIED_FLAG;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88-4
ADDP4
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1000
;1000:				level.clients[ level.sortedClients[i] ].ps.persistant[PERS_RANK] = rank | RANK_TIED_FLAG;
ADDRLP4 0
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
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1001
;1001:			}
LABELV $515
line 1002
;1002:			score = newScore;
ADDRLP4 16
ADDRLP4 8
INDIRI4
ASGNI4
line 1003
;1003:			if ( g_gametype.integer == GT_SINGLE_PLAYER && level.numPlayingClients == 1 ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $521
ADDRGP4 level+84
INDIRI4
CNSTI4 1
NEI4 $521
line 1004
;1004:				level.clients[ level.sortedClients[i] ].ps.persistant[PERS_RANK] = rank | RANK_TIED_FLAG;
ADDRLP4 0
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
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1005
;1005:			}
LABELV $521
line 1006
;1006:		}
LABELV $509
line 990
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $511
ADDRLP4 0
INDIRI4
ADDRGP4 level+84
INDIRI4
LTI4 $508
line 1007
;1007:	}
LABELV $488
line 1010
;1008:
;1009:	// set the CS_SCORES1/2 configstrings, which will be visible to everyone
;1010:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $526
line 1011
;1011:		trap_SetConfigstring( CS_SCORES1, va("%i", level.teamScores[TEAM_RED] ) );
ADDRGP4 $529
ARGP4
ADDRGP4 level+48+4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 6
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1012
;1012:		trap_SetConfigstring( CS_SCORES2, va("%i", level.teamScores[TEAM_BLUE] ) );
ADDRGP4 $529
ARGP4
ADDRGP4 level+48+8
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 7
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1013
;1013:	} else {
ADDRGP4 $527
JUMPV
LABELV $526
line 1014
;1014:		if ( level.numConnectedClients == 0 ) {
ADDRGP4 level+76
INDIRI4
CNSTI4 0
NEI4 $534
line 1015
;1015:			trap_SetConfigstring( CS_SCORES1, va("%i", SCORE_NOT_PRESENT) );
ADDRGP4 $529
ARGP4
CNSTI4 -9999
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 6
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1016
;1016:			trap_SetConfigstring( CS_SCORES2, va("%i", SCORE_NOT_PRESENT) );
ADDRGP4 $529
ARGP4
CNSTI4 -9999
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 7
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1017
;1017:		} else if ( level.numConnectedClients == 1 ) {
ADDRGP4 $535
JUMPV
LABELV $534
ADDRGP4 level+76
INDIRI4
CNSTI4 1
NEI4 $537
line 1018
;1018:			trap_SetConfigstring( CS_SCORES1, va("%i", level.clients[ level.sortedClients[0] ].ps.persistant[PERS_SCORE] ) );
ADDRGP4 $529
ARGP4
ADDRGP4 level+88
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 6
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1019
;1019:			trap_SetConfigstring( CS_SCORES2, va("%i", SCORE_NOT_PRESENT) );
ADDRGP4 $529
ARGP4
CNSTI4 -9999
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 7
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1020
;1020:		} else {
ADDRGP4 $538
JUMPV
LABELV $537
line 1021
;1021:			trap_SetConfigstring( CS_SCORES1, va("%i", level.clients[ level.sortedClients[0] ].ps.persistant[PERS_SCORE] ) );
ADDRGP4 $529
ARGP4
ADDRGP4 level+88
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 6
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1022
;1022:			trap_SetConfigstring( CS_SCORES2, va("%i", level.clients[ level.sortedClients[1] ].ps.persistant[PERS_SCORE] ) );
ADDRGP4 $529
ARGP4
ADDRGP4 level+88+4
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 7
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1023
;1023:		}
LABELV $538
LABELV $535
line 1024
;1024:	}
LABELV $527
line 1027
;1025:
;1026:	// see if it is time to end the level
;1027:	CheckExitRules();
ADDRGP4 CheckExitRules
CALLV
pop
line 1030
;1028:
;1029:	// if we are at the intermission, send the new info to everyone
;1030:	if ( level.intermissiontime ) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $544
line 1031
;1031:		SendScoreboardMessageToAllClients();
ADDRGP4 SendScoreboardMessageToAllClients
CALLV
pop
line 1032
;1032:	}
LABELV $544
line 1033
;1033:}
LABELV $431
endproc CalculateRanks 44 16
proc SendScoreboardMessageToAllClients 4 4
line 1052
;1034:
;1035:
;1036:/*
;1037:========================================================================
;1038:
;1039:MAP CHANGING
;1040:
;1041:========================================================================
;1042:*/
;1043:
;1044:/*
;1045:========================
;1046:SendScoreboardMessageToAllClients
;1047:
;1048:Do this at BeginIntermission time and whenever ranks are recalculated
;1049:due to enters/exits/forced team changes
;1050:========================
;1051:*/
;1052:static void SendScoreboardMessageToAllClients( void ) {
line 1055
;1053:	int		i;
;1054:
;1055:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $551
JUMPV
LABELV $548
line 1056
;1056:		if ( level.clients[ i ].pers.connected == CON_CONNECTED ) {
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
NEI4 $553
line 1057
;1057:			DeathmatchScoreboardMessage( g_entities + i );
ADDRLP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 DeathmatchScoreboardMessage
CALLV
pop
line 1058
;1058:		}
LABELV $553
line 1059
;1059:	}
LABELV $549
line 1055
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $551
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $548
line 1060
;1060:}
LABELV $547
endproc SendScoreboardMessageToAllClients 4 4
export MoveClientToIntermission
proc MoveClientToIntermission 20 12
line 1071
;1061:
;1062:
;1063:/*
;1064:========================
;1065:MoveClientToIntermission
;1066:
;1067:When the intermission starts, this will be called for all players.
;1068:If a new client connects, this will be called after the spawn function.
;1069:========================
;1070:*/
;1071:void MoveClientToIntermission( gentity_t *ent ) {
line 1075
;1072:	gclient_t * client;
;1073:	int vr_controller_type;
;1074:
;1075:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ASGNP4
line 1078
;1076:
;1077:#ifdef USE_VR_QVM
;1078:	vr_controller_type = client->ps.vr_controller_type;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
line 1085
;1079:#endif
;1080:#ifdef USE_NATIVE_HACK
;1081:	vr_controller_type = vrinfo->vr_controller_type;
;1082:#endif
;1083:
;1084:	// take out of follow mode if needed
;1085:	if ( client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
CNSTI4 2
NEI4 $556
line 1086
;1086:		StopFollowing( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StopFollowing
CALLV
pop
line 1087
;1087:	}
LABELV $556
line 1090
;1088:
;1089:	// move to the spot
;1090:	VectorCopy( level.intermission_origin, ent->s.origin );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRGP4 level+7616
INDIRB
ASGNB 12
line 1091
;1091:	VectorCopy( level.intermission_origin, client->ps.origin );
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 level+7616
INDIRB
ASGNB 12
line 1093
;1092:
;1093:	if ( vr_controller_type ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $560
line 1094
;1094:		VectorCopy(level.intermission_angle, ent->client->ps.viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRGP4 level+7628
INDIRB
ASGNB 12
line 1095
;1095:	}
LABELV $560
line 1097
;1096:
;1097:	SetClientViewAngle(ent, level.intermission_angle);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 level+7628
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 1100
;1098:
;1099:#ifdef USE_VR_QVM
;1100:	if ( vr_controller_type ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $564
line 1105
;1101:		// VR client
;1102:		// adjust VR controller's angle
;1103:		float yawAngle;
;1104:		int cmdAngle;
;1105:		yawAngle = -180;
ADDRLP4 8
CNSTF4 3274964992
ASGNF4
line 1106
;1106:		yawAngle += level.intermission_angle[YAW];
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRGP4 level+7628+4
INDIRF4
ADDF4
ASGNF4
line 1109
;1107:
;1108:		// set the delta angle
;1109:		cmdAngle = ANGLE2SHORT(yawAngle);
ADDRLP4 12
ADDRLP4 8
INDIRF4
CNSTF4 1127615329
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 1110
;1110:		ent->client->ps.delta_spawn_angles[YAW] = cmdAngle - ent->client->pers.cmd.right_hand_angles[YAW];
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1111
;1111:		ent->s.s_rightAngles[YAW] = yawAngle;
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 1112
;1112:		ent->client->ps.right_hand_angles[YAW] = yawAngle;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 1113
;1113:	}
LABELV $564
line 1115
;1114:#endif
;1115:	client->ps.pm_type = PM_INTERMISSION;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 5
ASGNI4
line 1118
;1116:
;1117:	// clean up powerup info
;1118:	memset( client->ps.powerups, 0, sizeof( client->ps.powerups ) );
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
line 1120
;1119:
;1120:	client->ps.eFlags = ( client->ps.eFlags & ~EF_PERSISTANT ) | ( client->ps.eFlags & EF_PERSISTANT );
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 -548865
BANDI4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 548864
BANDI4
BORI4
ASGNI4
line 1122
;1121:
;1122:	ent->s.eFlags = client->ps.eFlags;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ASGNI4
line 1123
;1123:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1124
;1124:	ent->s.modelindex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 1125
;1125:	ent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 1126
;1126:	ent->s.event = 0;
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 1127
;1127:	ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 0
ASGNI4
line 1129
;1128:
;1129:	ent->s.legsAnim = LEGS_IDLE;
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 22
ASGNI4
line 1130
;1130:	ent->s.torsoAnim = TORSO_STAND;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 11
ASGNI4
line 1131
;1131:}
LABELV $555
endproc MoveClientToIntermission 20 12
export FindIntermissionPoint
proc FindIntermissionPoint 28 16
line 1141
;1132:
;1133:
;1134:/*
;1135:==================
;1136:FindIntermissionPoint
;1137:
;1138:This is also used for spectator spawns
;1139:==================
;1140:*/
;1141:void FindIntermissionPoint( void ) {
line 1145
;1142:	gentity_t	*ent, *target;
;1143:	vec3_t		dir;
;1144:
;1145:	if ( level.intermission_spot ) // search only once
ADDRGP4 level+7640
INDIRI4
CNSTI4 0
EQI4 $569
line 1146
;1146:		return;
ADDRGP4 $568
JUMPV
LABELV $569
line 1149
;1147:
;1148:	// find the intermission spot
;1149:	ent = level.spawnSpots[ SPAWN_SPOT_INTERMISSION ];
ADDRLP4 0
ADDRGP4 level+7688+4092
INDIRP4
ASGNP4
line 1151
;1150:
;1151:	if ( !ent ) { // the map creator forgot to put in an intermission point...
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $574
line 1152
;1152:		SelectSpawnPoint( NULL, vec3_origin, level.intermission_origin, level.intermission_angle );
CNSTP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 level+7616
ARGP4
ADDRGP4 level+7628
ARGP4
ADDRGP4 SelectSpawnPoint
CALLP4
pop
line 1153
;1153:	} else {
ADDRGP4 $575
JUMPV
LABELV $574
line 1154
;1154:		VectorCopy (ent->s.origin, level.intermission_origin);
ADDRGP4 level+7616
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1155
;1155:		VectorCopy (ent->s.angles, level.intermission_angle);
ADDRGP4 level+7628
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1157
;1156:		// if it has a target, look towards it
;1157:		if ( ent->target ) {
ADDRLP4 0
INDIRP4
CNSTI4 1144
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $580
line 1158
;1158:			target = G_PickTarget( ent->target );
ADDRLP4 0
INDIRP4
CNSTI4 1144
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 1159
;1159:			if ( target ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $582
line 1160
;1160:				VectorSubtract( target->s.origin, level.intermission_origin, dir );
ADDRLP4 24
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 level+7616
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 24
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 level+7616+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 level+7616+8
INDIRF4
SUBF4
ASGNF4
line 1161
;1161:				vectoangles( dir, level.intermission_angle );
ADDRLP4 8
ARGP4
ADDRGP4 level+7628
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1162
;1162:			}
LABELV $582
line 1163
;1163:		}
LABELV $580
line 1164
;1164:	}
LABELV $575
line 1166
;1165:
;1166:	level.intermission_spot = qtrue;
ADDRGP4 level+7640
CNSTI4 1
ASGNI4
line 1167
;1167:}
LABELV $568
endproc FindIntermissionPoint 28 16
export BeginIntermission
proc BeginIntermission 8 4
line 1175
;1168:
;1169:
;1170:/*
;1171:==================
;1172:BeginIntermission
;1173:==================
;1174:*/
;1175:void BeginIntermission( void ) {
line 1179
;1176:	int			i;
;1177:	gentity_t	*client;
;1178:
;1179:	if ( level.intermissiontime ) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $594
line 1180
;1180:		return; // already active
ADDRGP4 $593
JUMPV
LABELV $594
line 1184
;1181:	}
;1182:
;1183:	// if in tournement mode, change the wins / losses
;1184:	if ( g_gametype.integer == GT_TOURNAMENT ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $597
line 1185
;1185:		AdjustTournamentScores();
ADDRGP4 AdjustTournamentScores
CALLV
pop
line 1186
;1186:	}
LABELV $597
line 1188
;1187:
;1188:	level.intermissiontime = level.time;
ADDRGP4 level+7604
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1189
;1189:	FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 1192
;1190:
;1191:	// move all clients to the intermission point
;1192:	for ( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $605
JUMPV
LABELV $602
line 1193
;1193:		client = g_entities + i;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1194
;1194:		if ( !client->inuse )
ADDRLP4 0
INDIRP4
CNSTI4 1016
ADDP4
INDIRI4
CNSTI4 0
NEI4 $607
line 1195
;1195:			continue;
ADDRGP4 $603
JUMPV
LABELV $607
line 1198
;1196:
;1197:		// respawn if dead
;1198:		if ( client->health <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $609
line 1199
;1199:			respawn( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1200
;1200:		}
LABELV $609
line 1202
;1201:
;1202:		MoveClientToIntermission( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 1203
;1203:	}
LABELV $603
line 1192
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $605
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $602
line 1212
;1204:
;1205:#ifdef MISSIONPACK
;1206:	if (g_singlePlayer.integer) {
;1207:		trap_Cvar_Set("ui_singlePlayerActive", "0");
;1208:		UpdateTournamentInfo();
;1209:	}
;1210:#else
;1211:	// if single player game
;1212:	if ( g_gametype.integer == GT_SINGLE_PLAYER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $611
line 1213
;1213:		UpdateTournamentInfo();
ADDRGP4 UpdateTournamentInfo
CALLV
pop
line 1214
;1214:		SpawnModelsOnVictoryPads();
ADDRGP4 SpawnModelsOnVictoryPads
CALLV
pop
line 1215
;1215:	}
LABELV $611
line 1219
;1216:#endif
;1217:
;1218:	// send the current scoring to all clients
;1219:	SendScoreboardMessageToAllClients();
ADDRGP4 SendScoreboardMessageToAllClients
CALLV
pop
line 1220
;1220:}
LABELV $593
endproc BeginIntermission 8 4
export ExitLevel
proc ExitLevel 272 12
line 1231
;1221:
;1222:
;1223:/*
;1224:=============
;1225:ExitLevel
;1226:
;1227:When the intermission has been exited, the server is either killed
;1228:or moved to a new level based on the "nextmap" cvar 
;1229:=============
;1230:*/
;1231:void ExitLevel( void ) {
line 1236
;1232:	int		i;
;1233:	gclient_t *cl;
;1234:
;1235:	//bot interbreeding
;1236:	BotInterbreedEndMatch();
ADDRGP4 BotInterbreedEndMatch
CALLV
pop
line 1240
;1237:
;1238:	// if we are running a tournement map, kick the loser to spectator status,
;1239:	// which will automatically grab the next spectator and restart
;1240:	if ( g_gametype.integer == GT_TOURNAMENT  ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $615
line 1241
;1241:		if ( !level.restarted ) {
ADDRGP4 level+72
INDIRI4
CNSTI4 0
NEI4 $614
line 1242
;1242:			RemoveTournamentLoser();
ADDRGP4 RemoveTournamentLoser
CALLV
pop
line 1243
;1243:			trap_SendConsoleCommand( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $621
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1244
;1244:			level.restarted = qtrue;
ADDRGP4 level+72
CNSTI4 1
ASGNI4
line 1245
;1245:			level.intermissiontime = 0;
ADDRGP4 level+7604
CNSTI4 0
ASGNI4
line 1246
;1246:		}
line 1247
;1247:		return;	
ADDRGP4 $614
JUMPV
LABELV $615
line 1250
;1248:	}
;1249:
;1250:	level.intermissiontime = 0;
ADDRGP4 level+7604
CNSTI4 0
ASGNI4
line 1253
;1251:
;1252:	// reset all the scores so we don't enter the intermission again
;1253:	level.teamScores[TEAM_RED] = 0;
ADDRGP4 level+48+4
CNSTI4 0
ASGNI4
line 1254
;1254:	level.teamScores[TEAM_BLUE] = 0;
ADDRGP4 level+48+8
CNSTI4 0
ASGNI4
line 1255
;1255:	for ( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $632
JUMPV
LABELV $629
line 1256
;1256:		cl = level.clients + i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1257
;1257:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 2
EQI4 $634
line 1258
;1258:			continue;
ADDRGP4 $630
JUMPV
LABELV $634
line 1260
;1259:		}
;1260:		cl->ps.persistant[PERS_SCORE] = 0;
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 0
ASGNI4
line 1261
;1261:	}
LABELV $630
line 1255
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $632
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $629
line 1264
;1262:
;1263:	// we need to do this here before changing to CON_CONNECTING
;1264:	G_WriteSessionData();
ADDRGP4 G_WriteSessionData
CALLV
pop
line 1268
;1265:
;1266:	// change all client states to connecting, so the early players into the
;1267:	// next level will know the others aren't done reconnecting
;1268:	for ( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $639
JUMPV
LABELV $636
line 1269
;1269:		if ( level.clients[i].pers.connected == CON_CONNECTED ) {
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
NEI4 $641
line 1270
;1270:			level.clients[i].pers.connected = CON_CONNECTING;
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 1271
;1271:		}
LABELV $641
line 1272
;1272:	}
LABELV $637
line 1268
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $639
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $636
line 1274
;1273:
;1274:	if ( !ParseMapRotation() ) {
ADDRLP4 8
ADDRGP4 ParseMapRotation
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $643
line 1277
;1275:		char val[ MAX_CVAR_VALUE_STRING ];
;1276:
;1277:		trap_Cvar_VariableStringBuffer( "nextmap", val, sizeof( val ) );
ADDRGP4 $645
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1279
;1278:
;1279:		if ( !val[0] || !Q_stricmpn( val, "map_restart ", 12 ) )
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $649
ADDRLP4 12
ARGP4
ADDRGP4 $648
ARGP4
CNSTI4 12
ARGI4
ADDRLP4 268
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $646
LABELV $649
line 1280
;1280:			G_LoadMap( NULL );
CNSTP4 0
ARGP4
ADDRGP4 G_LoadMap
CALLV
pop
ADDRGP4 $647
JUMPV
LABELV $646
line 1282
;1281:		else
;1282:			trap_SendConsoleCommand( EXEC_APPEND, "vstr nextmap\n" );
CNSTI4 2
ARGI4
ADDRGP4 $650
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
LABELV $647
line 1283
;1283:	} 
LABELV $643
line 1284
;1284:}
LABELV $614
endproc ExitLevel 272 12
export G_LogPrintf
proc G_LogPrintf 8224 24
line 1294
;1285:
;1286:
;1287:/*
;1288:=================
;1289:G_LogPrintf
;1290:
;1291:Print to the logfile with a time stamp if it is open
;1292:=================
;1293:*/
;1294:void QDECL G_LogPrintf( const char *fmt, ... ) {
line 1299
;1295:	va_list		argptr;
;1296:	char		string[BIG_INFO_STRING];
;1297:	int			min, tsec, sec, len, n;
;1298:
;1299:	tsec = level.time / 100;
ADDRLP4 8192
ADDRGP4 level+32
INDIRI4
CNSTI4 100
DIVI4
ASGNI4
line 1300
;1300:	sec = tsec / 10;
ADDRLP4 8196
ADDRLP4 8192
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 1301
;1301:	tsec %= 10;
ADDRLP4 8192
ADDRLP4 8192
INDIRI4
CNSTI4 10
MODI4
ASGNI4
line 1302
;1302:	min = sec / 60;
ADDRLP4 8204
ADDRLP4 8196
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 1303
;1303:	sec -= min * 60;
ADDRLP4 8196
ADDRLP4 8196
INDIRI4
ADDRLP4 8204
INDIRI4
CNSTI4 60
MULI4
SUBI4
ASGNI4
line 1305
;1304:
;1305:	len = Com_sprintf( string, sizeof( string ), "%3i:%02i.%i ", min, sec, tsec );
ADDRLP4 0
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 $653
ARGP4
ADDRLP4 8204
INDIRI4
ARGI4
ADDRLP4 8196
INDIRI4
ARGI4
ADDRLP4 8192
INDIRI4
ARGI4
ADDRLP4 8216
ADDRGP4 Com_sprintf
CALLI4
ASGNI4
ADDRLP4 8208
ADDRLP4 8216
INDIRI4
ASGNI4
line 1307
;1306:
;1307:	va_start( argptr, fmt );
ADDRLP4 8200
ADDRFP4 0+4
ASGNP4
line 1308
;1308:	ED_vsprintf( string + len, fmt,argptr );
ADDRLP4 8208
INDIRI4
ADDRLP4 0
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8200
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 1309
;1309:	va_end( argptr );
ADDRLP4 8200
CNSTP4 0
ASGNP4
line 1311
;1310:
;1311:	n = (int)strlen( string );
ADDRLP4 0
ARGP4
ADDRLP4 8220
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8212
ADDRLP4 8220
INDIRI4
ASGNI4
line 1313
;1312:
;1313:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $655
line 1314
;1314:		G_Printf( "%s", string + len );
ADDRGP4 $658
ARGP4
ADDRLP4 8208
INDIRI4
ADDRLP4 0
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1315
;1315:	}
LABELV $655
line 1317
;1316:
;1317:	if ( level.logFile == FS_INVALID_HANDLE ) {
ADDRGP4 level+20
INDIRI4
CNSTI4 0
NEI4 $659
line 1318
;1318:		return;
ADDRGP4 $651
JUMPV
LABELV $659
line 1321
;1319:	}
;1320:
;1321:	trap_FS_Write( string, n, level.logFile );
ADDRLP4 0
ARGP4
ADDRLP4 8212
INDIRI4
ARGI4
ADDRGP4 level+20
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1322
;1322:}
LABELV $651
endproc G_LogPrintf 8224 24
export LogExit
proc LogExit 24 20
line 1332
;1323:
;1324:
;1325:/*
;1326:================
;1327:LogExit
;1328:
;1329:Append information about this game to the log file
;1330:================
;1331:*/
;1332:void LogExit( const char *string ) {
line 1338
;1333:	int				i, numSorted;
;1334:	gclient_t		*cl;
;1335:#ifdef MISSIONPACK
;1336:	qboolean won = qtrue;
;1337:#endif
;1338:	G_LogPrintf( "Exit: %s\n", string );
ADDRGP4 $664
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1340
;1339:
;1340:	level.intermissionQueued = level.time;
ADDRGP4 level+7600
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1344
;1341:
;1342:	// this will keep the clients from playing any voice sounds
;1343:	// that will get cut off when the queued intermission starts
;1344:	trap_SetConfigstring( CS_INTERMISSION, "1" );
CNSTI4 22
ARGI4
ADDRGP4 $58
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1347
;1345:
;1346:	// don't send more than 32 scores (FIXME?)
;1347:	numSorted = level.numConnectedClients;
ADDRLP4 8
ADDRGP4 level+76
INDIRI4
ASGNI4
line 1348
;1348:	if ( numSorted > 32 ) {
ADDRLP4 8
INDIRI4
CNSTI4 32
LEI4 $668
line 1349
;1349:		numSorted = 32;
ADDRLP4 8
CNSTI4 32
ASGNI4
line 1350
;1350:	}
LABELV $668
line 1352
;1351:
;1352:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $670
line 1353
;1353:		G_LogPrintf( "red:%i  blue:%i\n",
ADDRGP4 $673
ARGP4
ADDRGP4 level+48+4
INDIRI4
ARGI4
ADDRGP4 level+48+8
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1355
;1354:			level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE] );
;1355:	}
LABELV $670
line 1357
;1356:
;1357:	for (i=0 ; i < numSorted ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $681
JUMPV
LABELV $678
line 1360
;1358:		int		ping;
;1359:
;1360:		cl = &level.clients[level.sortedClients[i]];
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
line 1362
;1361:
;1362:		if ( cl->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
NEI4 $683
line 1363
;1363:			continue;
ADDRGP4 $679
JUMPV
LABELV $683
line 1365
;1364:		}
;1365:		if ( cl->pers.connected == CON_CONNECTING ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $685
line 1366
;1366:			continue;
ADDRGP4 $679
JUMPV
LABELV $685
line 1369
;1367:		}
;1368:
;1369:		ping = cl->ps.ping < 999 ? cl->ps.ping : 999;
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CNSTI4 999
GEI4 $688
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $689
JUMPV
LABELV $688
ADDRLP4 16
CNSTI4 999
ASGNI4
LABELV $689
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 1371
;1370:
;1371:		G_LogPrintf( "score: %i  ping: %i  client: %i %s\n", cl->ps.persistant[PERS_SCORE], ping, level.sortedClients[i],	cl->pers.netname );
ADDRGP4 $690
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
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
CNSTI4 676
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1380
;1372:#ifdef MISSIONPACK
;1373:		if (g_singlePlayer.integer && g_gametype.integer == GT_TOURNAMENT) {
;1374:			if (g_entities[cl - level.clients].r.svFlags & SVF_BOT && cl->ps.persistant[PERS_RANK] == 0) {
;1375:				won = qfalse;
;1376:			}
;1377:		}
;1378:#endif
;1379:
;1380:	}
LABELV $679
line 1357
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $681
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $678
line 1390
;1381:
;1382:#ifdef MISSIONPACK
;1383:	if (g_singlePlayer.integer) {
;1384:		if (g_gametype.integer >= GT_CTF) {
;1385:			won = level.teamScores[TEAM_RED] > level.teamScores[TEAM_BLUE];
;1386:		}
;1387:		trap_SendConsoleCommand( EXEC_APPEND, (won) ? "spWin\n" : "spLose\n" );
;1388:	}
;1389:#endif
;1390:}
LABELV $663
endproc LogExit 24 20
export CheckIntermissionExit
proc CheckIntermissionExit 20 0
line 1403
;1391:
;1392:
;1393:/*
;1394:=================
;1395:CheckIntermissionExit
;1396:
;1397:The level will stay at the intermission for a minimum of 5 seconds
;1398:If all players wish to continue, the level will then exit.
;1399:If one or more players have not acknowledged the continue, the game will
;1400:wait 10 seconds before going on.
;1401:=================
;1402:*/
;1403:void CheckIntermissionExit( void ) {
line 1409
;1404:	int			ready, notReady;
;1405:	int			i;
;1406:	gclient_t	*cl;
;1407:	int			readyMask;
;1408:
;1409:	if ( g_gametype.integer == GT_SINGLE_PLAYER )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $693
line 1410
;1410:		return;
ADDRGP4 $692
JUMPV
LABELV $693
line 1413
;1411:
;1412:	// see which players are ready
;1413:	ready = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1414
;1414:	notReady = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1415
;1415:	readyMask = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1416
;1416:	for ( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $699
JUMPV
LABELV $696
line 1417
;1417:		cl = level.clients + i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1418
;1418:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 2
EQI4 $701
line 1419
;1419:			continue;
ADDRGP4 $697
JUMPV
LABELV $701
line 1422
;1420:		}
;1421:
;1422:		if ( g_entities[i].r.svFlags & SVF_BOT ) {
ADDRLP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities+456+464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $703
line 1423
;1423:			cl->readyToExit = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 820
ADDP4
CNSTI4 1
ASGNI4
line 1424
;1424:		}
LABELV $703
line 1426
;1425:
;1426:		if ( cl->readyToExit ) {
ADDRLP4 4
INDIRP4
CNSTI4 820
ADDP4
INDIRI4
CNSTI4 0
EQI4 $707
line 1427
;1427:			ready++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1428
;1428:			if ( i < 16 ) {
ADDRLP4 0
INDIRI4
CNSTI4 16
GEI4 $708
line 1429
;1429:				readyMask |= 1 << i;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 1430
;1430:			}
line 1431
;1431:		} else {
ADDRGP4 $708
JUMPV
LABELV $707
line 1432
;1432:			notReady++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1433
;1433:		}
LABELV $708
line 1434
;1434:	}
LABELV $697
line 1416
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $699
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $696
line 1437
;1435:
;1436:	// vote in progress
;1437:	if ( level.voteTime || level.voteExecuteTime ) {
ADDRGP4 level+872
INDIRI4
CNSTI4 0
NEI4 $715
ADDRGP4 level+876
INDIRI4
CNSTI4 0
EQI4 $711
LABELV $715
line 1438
;1438:		ready  = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1439
;1439:		notReady = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 1440
;1440:	}
LABELV $711
line 1444
;1441:
;1442:	// copy the readyMask to each player's stats so
;1443:	// it can be displayed on the scoreboard
;1444:	for ( i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $719
JUMPV
LABELV $716
line 1445
;1445:		cl = level.clients + i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1446
;1446:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 2
EQI4 $721
line 1447
;1447:			continue;
ADDRGP4 $717
JUMPV
LABELV $721
line 1449
;1448:		}
;1449:		cl->ps.stats[STAT_CLIENTS_READY] = readyMask;
ADDRLP4 4
INDIRP4
CNSTI4 204
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1450
;1450:	}
LABELV $717
line 1444
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
line 1453
;1451:
;1452:	// never exit in less than five seconds
;1453:	if ( level.time < level.intermissiontime + 5000 ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+7604
INDIRI4
CNSTI4 5000
ADDI4
GEI4 $723
line 1454
;1454:		return;
ADDRGP4 $692
JUMPV
LABELV $723
line 1458
;1455:	}
;1456:
;1457:	// if nobody wants to go, clear timer
;1458:	if ( !ready && notReady ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $727
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $727
line 1459
;1459:		level.readyToExit = qfalse;
ADDRGP4 level+7608
CNSTI4 0
ASGNI4
line 1460
;1460:		return;
ADDRGP4 $692
JUMPV
LABELV $727
line 1464
;1461:	}
;1462:
;1463:	// if everyone wants to go, go now
;1464:	if ( !notReady ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $730
line 1465
;1465:		ExitLevel();
ADDRGP4 ExitLevel
CALLV
pop
line 1466
;1466:		return;
ADDRGP4 $692
JUMPV
LABELV $730
line 1470
;1467:	}
;1468:
;1469:	// the first person to ready starts the ten second timeout
;1470:	if ( !level.readyToExit ) {
ADDRGP4 level+7608
INDIRI4
CNSTI4 0
NEI4 $732
line 1471
;1471:		level.readyToExit = qtrue;
ADDRGP4 level+7608
CNSTI4 1
ASGNI4
line 1472
;1472:		level.exitTime = level.time + 10000;
ADDRGP4 level+7612
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1473
;1473:	}
LABELV $732
line 1477
;1474:
;1475:	// if we have waited ten seconds since at least one player
;1476:	// wanted to exit, go ahead
;1477:	if ( level.time < level.exitTime ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+7612
INDIRI4
GEI4 $738
line 1478
;1478:		return;
ADDRGP4 $692
JUMPV
LABELV $738
line 1481
;1479:	}
;1480:
;1481:	ExitLevel();
ADDRGP4 ExitLevel
CALLV
pop
line 1482
;1482:}
LABELV $692
endproc CheckIntermissionExit 20 0
proc ScoreIsTied 12 0
line 1490
;1483:
;1484:
;1485:/*
;1486:=============
;1487:ScoreIsTied
;1488:=============
;1489:*/
;1490:static qboolean ScoreIsTied( void ) {
line 1493
;1491:	int		a, b;
;1492:
;1493:	if ( level.numPlayingClients < 2 ) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
GEI4 $743
line 1494
;1494:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $742
JUMPV
LABELV $743
line 1497
;1495:	}
;1496:	
;1497:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $746
line 1498
;1498:		return level.teamScores[TEAM_RED] == level.teamScores[TEAM_BLUE];
ADDRGP4 level+48+4
INDIRI4
ADDRGP4 level+48+8
INDIRI4
NEI4 $754
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $755
JUMPV
LABELV $754
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $755
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $742
JUMPV
LABELV $746
line 1501
;1499:	}
;1500:
;1501:	a = level.clients[level.sortedClients[0]].ps.persistant[PERS_SCORE];
ADDRLP4 0
ADDRGP4 level+88
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1502
;1502:	b = level.clients[level.sortedClients[1]].ps.persistant[PERS_SCORE];
ADDRLP4 4
ADDRGP4 level+88+4
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1504
;1503:
;1504:	return a == b;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $760
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $761
JUMPV
LABELV $760
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $761
ADDRLP4 8
INDIRI4
RETI4
LABELV $742
endproc ScoreIsTied 12 0
proc CheckExitRules 16 8
line 1517
;1505:}
;1506:
;1507:
;1508:/*
;1509:=================
;1510:CheckExitRules
;1511:
;1512:There will be a delay between the time the exit is qualified for
;1513:and the time everyone is moved to the intermission spot, so you
;1514:can see the last frag.
;1515:=================
;1516:*/
;1517:static void CheckExitRules( void ) {
line 1523
;1518:	int			i;
;1519:	gclient_t	*cl;
;1520:
;1521:	// if at the intermission, wait for all non-bots to
;1522:	// signal ready, then go to next level
;1523:	if ( level.intermissiontime ) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $763
line 1524
;1524:		CheckIntermissionExit();
ADDRGP4 CheckIntermissionExit
CALLV
pop
line 1525
;1525:		return;
ADDRGP4 $762
JUMPV
LABELV $763
line 1528
;1526:	}
;1527:
;1528:	if ( level.intermissionQueued ) {
ADDRGP4 level+7600
INDIRI4
CNSTI4 0
EQI4 $766
line 1536
;1529:#ifdef MISSIONPACK
;1530:		int time = (g_singlePlayer.integer) ? SP_INTERMISSION_DELAY_TIME : INTERMISSION_DELAY_TIME;
;1531:		if ( level.time - level.intermissionQueued >= time ) {
;1532:			level.intermissionQueued = 0;
;1533:			BeginIntermission();
;1534:		}
;1535:#else
;1536:		if ( level.time - level.intermissionQueued >= INTERMISSION_DELAY_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+7600
INDIRI4
SUBI4
CNSTI4 1000
LTI4 $762
line 1537
;1537:			level.intermissionQueued = 0;
ADDRGP4 level+7600
CNSTI4 0
ASGNI4
line 1538
;1538:			BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 1539
;1539:		}
line 1541
;1540:#endif
;1541:		return;
ADDRGP4 $762
JUMPV
LABELV $766
line 1545
;1542:	}
;1543:
;1544:	// check for sudden death
;1545:	if ( ScoreIsTied() ) {
ADDRLP4 8
ADDRGP4 ScoreIsTied
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $774
line 1547
;1546:		// always wait for sudden death
;1547:		return;
ADDRGP4 $762
JUMPV
LABELV $774
line 1550
;1548:	}
;1549:
;1550:	if ( g_timelimit.integer && !level.warmupTime ) {
ADDRGP4 g_timelimit+12
INDIRI4
CNSTI4 0
EQI4 $776
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $776
line 1551
;1551:		if ( level.time - level.startTime >= g_timelimit.integer*60000 ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
ADDRGP4 g_timelimit+12
INDIRI4
CNSTI4 60000
MULI4
LTI4 $780
line 1552
;1552:			G_BroadcastServerCommand( -1, "print \"Timelimit hit.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $785
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1553
;1553:			LogExit( "Timelimit hit." );
ADDRGP4 $786
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1554
;1554:			return;
ADDRGP4 $762
JUMPV
LABELV $780
line 1556
;1555:		}
;1556:	}
LABELV $776
line 1558
;1557:
;1558:	if ( level.numPlayingClients < 2 ) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
GEI4 $787
line 1559
;1559:		return;
ADDRGP4 $762
JUMPV
LABELV $787
line 1562
;1560:	}
;1561:
;1562:	if ( g_gametype.integer < GT_CTF && g_fraglimit.integer ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
GEI4 $790
ADDRGP4 g_fraglimit+12
INDIRI4
CNSTI4 0
EQI4 $790
line 1563
;1563:		if ( level.teamScores[TEAM_RED] >= g_fraglimit.integer ) {
ADDRGP4 level+48+4
INDIRI4
ADDRGP4 g_fraglimit+12
INDIRI4
LTI4 $794
line 1564
;1564:			G_BroadcastServerCommand( -1, "print \"Red hit the fraglimit.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $799
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1565
;1565:			LogExit( "Fraglimit hit." );
ADDRGP4 $800
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1566
;1566:			return;
ADDRGP4 $762
JUMPV
LABELV $794
line 1569
;1567:		}
;1568:
;1569:		if ( level.teamScores[TEAM_BLUE] >= g_fraglimit.integer ) {
ADDRGP4 level+48+8
INDIRI4
ADDRGP4 g_fraglimit+12
INDIRI4
LTI4 $801
line 1570
;1570:			G_BroadcastServerCommand( -1, "print \"Blue hit the fraglimit.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $806
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1571
;1571:			LogExit( "Fraglimit hit." );
ADDRGP4 $800
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1572
;1572:			return;
ADDRGP4 $762
JUMPV
LABELV $801
line 1575
;1573:		}
;1574:
;1575:		for ( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $810
JUMPV
LABELV $807
line 1576
;1576:			cl = level.clients + i;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1577
;1577:			if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 2
EQI4 $812
line 1578
;1578:				continue;
ADDRGP4 $808
JUMPV
LABELV $812
line 1580
;1579:			}
;1580:			if ( cl->sess.sessionTeam != TEAM_FREE ) {
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 0
EQI4 $814
line 1581
;1581:				continue;
ADDRGP4 $808
JUMPV
LABELV $814
line 1584
;1582:			}
;1583:
;1584:			if ( cl->ps.persistant[PERS_SCORE] >= g_fraglimit.integer ) {
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRGP4 g_fraglimit+12
INDIRI4
LTI4 $816
line 1585
;1585:				LogExit( "Fraglimit hit." );
ADDRGP4 $800
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1586
;1586:				G_BroadcastServerCommand( -1, va("print \"%s" S_COLOR_WHITE " hit the fraglimit.\n\"",
ADDRGP4 $819
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1588
;1587:					cl->pers.netname ) );
;1588:				return;
ADDRGP4 $762
JUMPV
LABELV $816
line 1590
;1589:			}
;1590:		}
LABELV $808
line 1575
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $810
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $807
line 1591
;1591:	}
LABELV $790
line 1593
;1592:
;1593:	if ( g_gametype.integer >= GT_CTF && g_capturelimit.integer ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $820
ADDRGP4 g_capturelimit+12
INDIRI4
CNSTI4 0
EQI4 $820
line 1595
;1594:
;1595:		if ( level.teamScores[TEAM_RED] >= g_capturelimit.integer ) {
ADDRGP4 level+48+4
INDIRI4
ADDRGP4 g_capturelimit+12
INDIRI4
LTI4 $824
line 1596
;1596:			G_BroadcastServerCommand( -1, "print \"Red hit the capturelimit.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $829
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1597
;1597:			LogExit( "Capturelimit hit." );
ADDRGP4 $830
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1598
;1598:			return;
ADDRGP4 $762
JUMPV
LABELV $824
line 1601
;1599:		}
;1600:
;1601:		if ( level.teamScores[TEAM_BLUE] >= g_capturelimit.integer ) {
ADDRGP4 level+48+8
INDIRI4
ADDRGP4 g_capturelimit+12
INDIRI4
LTI4 $831
line 1602
;1602:			G_BroadcastServerCommand( -1, "print \"Blue hit the capturelimit.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $836
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1603
;1603:			LogExit( "Capturelimit hit." );
ADDRGP4 $830
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1604
;1604:			return;
LABELV $831
line 1606
;1605:		}
;1606:	}
LABELV $820
line 1607
;1607:}
LABELV $762
endproc CheckExitRules 16 8
proc ClearBodyQue 12 4
line 1610
;1608:
;1609:
;1610:static void ClearBodyQue( void ) {
line 1614
;1611:	int	i;
;1612:	gentity_t	*ent;
;1613:
;1614:	for ( i = 0 ; i < BODY_QUEUE_SIZE ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $838
line 1615
;1615:		ent = level.bodyQue[ i ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7656
ADDP4
INDIRP4
ASGNP4
line 1616
;1616:		if ( ent->r.linked || ent->physicsObject ) {
ADDRLP4 0
INDIRP4
CNSTI4 912
ADDP4
INDIRI4
CNSTI4 0
NEI4 $845
ADDRLP4 0
INDIRP4
CNSTI4 1060
ADDP4
INDIRI4
CNSTI4 0
EQI4 $843
LABELV $845
line 1617
;1617:			trap_UnlinkEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1618
;1618:			ent->physicsObject = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 1060
ADDP4
CNSTI4 0
ASGNI4
line 1619
;1619:		}
LABELV $843
line 1620
;1620:	}
LABELV $839
line 1614
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $838
line 1621
;1621:}
LABELV $837
endproc ClearBodyQue 12 4
proc G_WarmupEnd 44 12
line 1625
;1622:
;1623:
;1624:static void G_WarmupEnd( void ) 
;1625:{
line 1631
;1626:	gclient_t *client;
;1627:	gentity_t *ent;
;1628:	int i, t;
;1629:
;1630:	// remove corpses
;1631:	ClearBodyQue();
ADDRGP4 ClearBodyQue
CALLV
pop
line 1634
;1632:
;1633:	// return flags
;1634:	Team_ResetFlags();
ADDRGP4 Team_ResetFlags
CALLV
pop
line 1636
;1635:
;1636:	memset( level.teamScores, 0, sizeof( level.teamScores ) );
ADDRGP4 level+48
ARGP4
CNSTI4 0
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1638
;1637:
;1638:	level.warmupTime = 0;
ADDRGP4 level+16
CNSTI4 0
ASGNI4
line 1639
;1639:	level.startTime = level.time;
ADDRGP4 level+40
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1641
;1640:
;1641:	trap_SetConfigstring( CS_SCORES1, "0" );
CNSTI4 6
ARGI4
ADDRGP4 $68
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1642
;1642:	trap_SetConfigstring( CS_SCORES2, "0" );
CNSTI4 7
ARGI4
ADDRGP4 $68
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1643
;1643:	trap_SetConfigstring( CS_WARMUP, "" );
CNSTI4 5
ARGI4
ADDRGP4 $56
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1644
;1644:	trap_SetConfigstring( CS_LEVEL_START_TIME, va( "%i", level.startTime ) );
ADDRGP4 $529
ARGP4
ADDRGP4 level+40
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 21
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1646
;1645:	
;1646:	client = level.clients;
ADDRLP4 0
ADDRGP4 level
INDIRP4
ASGNP4
line 1647
;1647:	for ( i = 0; i < level.maxclients; i++, client++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $856
JUMPV
LABELV $853
line 1649
;1648:		
;1649:		if ( client->pers.connected != CON_CONNECTED )
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 2
EQI4 $858
line 1650
;1650:			continue;
ADDRGP4 $854
JUMPV
LABELV $858
line 1653
;1651:
;1652:		// reset player awards
;1653:		client->ps.persistant[PERS_IMPRESSIVE_COUNT] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
CNSTI4 0
ASGNI4
line 1654
;1654:		client->ps.persistant[PERS_EXCELLENT_COUNT] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
CNSTI4 0
ASGNI4
line 1655
;1655:		client->ps.persistant[PERS_DEFEND_COUNT] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
CNSTI4 0
ASGNI4
line 1656
;1656:		client->ps.persistant[PERS_ASSIST_COUNT] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
CNSTI4 0
ASGNI4
line 1657
;1657:		client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 300
ADDP4
CNSTI4 0
ASGNI4
line 1659
;1658:
;1659:		client->ps.persistant[PERS_SCORE] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 0
ASGNI4
line 1660
;1660:		client->ps.persistant[PERS_CAPTURES] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 0
ASGNI4
line 1662
;1661:
;1662:		client->ps.persistant[PERS_ATTACKER] = ENTITYNUM_NONE;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 1023
ASGNI4
line 1663
;1663:		client->ps.persistant[PERS_ATTACKEE_ARMOR] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 0
ASGNI4
line 1664
;1664:		client->damage.enemy = client->damage.team = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1724
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1728
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1666
;1665:
;1666:		client->ps.stats[STAT_CLIENTS_READY] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 1667
;1667:		client->ps.stats[STAT_HOLDABLE_ITEM] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 1669
;1668:
;1669:		memset( &client->ps.powerups, 0, sizeof( client->ps.powerups ) );
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
line 1671
;1670:
;1671:		ClientUserinfoChanged( i ); // set max.health etc.
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 1673
;1672:
;1673:		if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
EQI4 $860
line 1674
;1674:			ClientSpawn( level.gentities + i );
ADDRLP4 8
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 level+4
INDIRP4
ADDP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 1675
;1675:		}
LABELV $860
line 1677
;1676:
;1677:		trap_SendServerCommand( i, "map_restart" );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 $863
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1678
;1678:	}
LABELV $854
line 1647
ADDRLP4 8
ADDRLP4 8
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
LABELV $856
ADDRLP4 8
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $853
line 1681
;1679:
;1680:	// respawn items, remove projectiles, etc.
;1681:	ent = level.gentities + MAX_CLIENTS;
ADDRLP4 4
ADDRGP4 level+4
INDIRP4
CNSTI4 83968
ADDP4
ASGNP4
line 1682
;1682:	for ( i = MAX_CLIENTS; i < level.num_entities ; i++, ent++ ) {
ADDRLP4 8
CNSTI4 64
ASGNI4
ADDRGP4 $868
JUMPV
LABELV $865
line 1684
;1683:
;1684:		if ( !ent->inuse || ent->freeAfterEvent )
ADDRLP4 4
INDIRP4
CNSTI4 1016
ADDP4
INDIRI4
CNSTI4 0
EQI4 $872
ADDRLP4 4
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
CNSTI4 0
EQI4 $870
LABELV $872
line 1685
;1685:			continue;
ADDRGP4 $866
JUMPV
LABELV $870
line 1687
;1686:
;1687:		if ( ent->tag == TAG_DONTSPAWN ) {
ADDRLP4 4
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
CNSTI4 1
NEI4 $873
line 1688
;1688:			ent->nextthink = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1184
ADDP4
CNSTI4 0
ASGNI4
line 1689
;1689:			continue;
ADDRGP4 $866
JUMPV
LABELV $873
line 1692
;1690:		}
;1691:
;1692:		if ( ent->s.eType == ET_ITEM && ent->item ) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $875
ADDRLP4 4
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $875
line 1695
;1693:
;1694:			// already processed in Team_ResetFlags()
;1695:			if ( ent->item->giTag == PW_NEUTRALFLAG || ent->item->giTag == PW_REDFLAG || ent->item->giTag == PW_BLUEFLAG )
ADDRLP4 4
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 9
EQI4 $880
ADDRLP4 4
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 7
EQI4 $880
ADDRLP4 4
INDIRP4
CNSTI4 1300
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 8
NEI4 $877
LABELV $880
line 1696
;1696:				continue;
ADDRGP4 $866
JUMPV
LABELV $877
line 1699
;1697:
;1698:			// remove dropped items
;1699:			if ( ent->flags & FL_DROPPED_ITEM ) {
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $881
line 1700
;1700:				ent->nextthink = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 1184
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1701
;1701:				continue;
ADDRGP4 $866
JUMPV
LABELV $881
line 1705
;1702:			}
;1703:
;1704:			// respawn picked up items
;1705:			t = SpawnTime( ent, qtrue );
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 32
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 32
INDIRI4
ASGNI4
line 1706
;1706:			if ( t != 0 ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $884
line 1708
;1707:				// hide items with defined spawn time
;1708:				ent->s.eFlags |= EF_NODRAW;
ADDRLP4 36
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 1709
;1709:				ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 40
ADDRLP4 4
INDIRP4
CNSTI4 920
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1710
;1710:				ent->r.contents = 0;
ADDRLP4 4
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 0
ASGNI4
line 1711
;1711:				ent->activator = NULL;
ADDRLP4 4
INDIRP4
CNSTI4 1268
ADDP4
CNSTP4 0
ASGNP4
line 1712
;1712:				ent->think = RespawnItem;
ADDRLP4 4
INDIRP4
CNSTI4 1188
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 1713
;1713:			} else {
ADDRGP4 $885
JUMPV
LABELV $884
line 1714
;1714:				t = FRAMETIME;
ADDRLP4 12
CNSTI4 100
ASGNI4
line 1715
;1715:				if ( ent->activator ) {
ADDRLP4 4
INDIRP4
CNSTI4 1268
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $886
line 1716
;1716:					ent->activator = NULL;
ADDRLP4 4
INDIRP4
CNSTI4 1268
ADDP4
CNSTP4 0
ASGNP4
line 1717
;1717:					ent->think = RespawnItem;
ADDRLP4 4
INDIRP4
CNSTI4 1188
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 1718
;1718:				}
LABELV $886
line 1719
;1719:			}
LABELV $885
line 1720
;1720:			if ( ent->random ) {
ADDRLP4 4
INDIRP4
CNSTI4 1296
ADDP4
INDIRF4
CNSTF4 0
EQF4 $888
line 1721
;1721:				t += (crandom() * ent->random) * 1000;
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRI4
CVIF4 4
ADDRLP4 36
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
ADDRLP4 4
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
line 1722
;1722:				if ( t < FRAMETIME ) {
ADDRLP4 12
INDIRI4
CNSTI4 100
GEI4 $890
line 1723
;1723:					t = FRAMETIME;
ADDRLP4 12
CNSTI4 100
ASGNI4
line 1724
;1724:				}
LABELV $890
line 1725
;1725:			}
LABELV $888
line 1726
;1726:			ent->nextthink = level.time + t;
ADDRLP4 4
INDIRP4
CNSTI4 1184
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 1728
;1727:
;1728:		} else if ( ent->s.eType == ET_MISSILE ) {
ADDRGP4 $876
JUMPV
LABELV $875
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $893
line 1730
;1729:			// remove all launched missiles
;1730:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1731
;1731:		}
LABELV $893
LABELV $876
line 1732
;1732:	}
LABELV $866
line 1682
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1312
ADDP4
ASGNP4
LABELV $868
ADDRLP4 8
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $865
line 1733
;1733:}
LABELV $846
endproc G_WarmupEnd 44 12
proc CheckTournament 28 8
line 1752
;1734:
;1735:
;1736:/*
;1737:========================================================================
;1738:
;1739:FUNCTIONS CALLED EVERY FRAME
;1740:
;1741:========================================================================
;1742:*/
;1743:
;1744:
;1745:/*
;1746:=============
;1747:CheckTournament
;1748:
;1749:Once a frame, check for changes in tournement player state
;1750:=============
;1751:*/
;1752:static void CheckTournament( void ) {
line 1756
;1753:
;1754:	// check because we run 3 game frames before calling Connect and/or ClientBegin
;1755:	// for clients on a map_restart
;1756:	if ( level.numPlayingClients == 0 ) {
ADDRGP4 level+84
INDIRI4
CNSTI4 0
NEI4 $896
line 1757
;1757:		return;
ADDRGP4 $895
JUMPV
LABELV $896
line 1760
;1758:	}
;1759:
;1760:	if ( g_gametype.integer == GT_TOURNAMENT ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $899
line 1763
;1761:
;1762:		// pull in a spectator if needed
;1763:		if ( level.numPlayingClients < 2 ) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
GEI4 $902
line 1764
;1764:			AddTournamentPlayer();
ADDRGP4 AddTournamentPlayer
CALLV
pop
line 1765
;1765:		}
LABELV $902
line 1768
;1766:
;1767:		// if we don't have two players, go back to "waiting for players"
;1768:		if ( level.numPlayingClients != 2 ) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
EQI4 $905
line 1769
;1769:			if ( level.warmupTime != -1 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 -1
EQI4 $895
line 1770
;1770:				level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 1771
;1771:				trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $529
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1772
;1772:				G_LogPrintf( "Warmup:\n" );
ADDRGP4 $913
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1773
;1773:			}
line 1774
;1774:			return;
ADDRGP4 $895
JUMPV
LABELV $905
line 1777
;1775:		}
;1776:
;1777:		if ( level.warmupTime == 0 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $914
line 1778
;1778:			return;
ADDRGP4 $895
JUMPV
LABELV $914
line 1782
;1779:		}
;1780:
;1781:		// if the warmup is changed at the console, restart it
;1782:		if ( g_warmup.modificationCount != level.warmupModificationCount ) {
ADDRGP4 g_warmup+4
INDIRI4
ADDRGP4 level+356
INDIRI4
EQI4 $917
line 1783
;1783:			level.warmupModificationCount = g_warmup.modificationCount;
ADDRGP4 level+356
ADDRGP4 g_warmup+4
INDIRI4
ASGNI4
line 1784
;1784:			level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 1785
;1785:		}
LABELV $917
line 1788
;1786:
;1787:		// if all players have arrived, start the countdown
;1788:		if ( level.warmupTime < 0 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
GEI4 $924
line 1789
;1789:			if ( level.numPlayingClients == 2 ) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
NEI4 $895
line 1790
;1790:				if ( g_warmup.integer > 0 ) {
ADDRGP4 g_warmup+12
INDIRI4
CNSTI4 0
LEI4 $930
line 1791
;1791:					level.warmupTime = level.time + g_warmup.integer * 1000;
ADDRGP4 level+16
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_warmup+12
INDIRI4
CNSTI4 1000
MULI4
ADDI4
ASGNI4
line 1792
;1792:				} else {
ADDRGP4 $931
JUMPV
LABELV $930
line 1793
;1793:					level.warmupTime = 0;
ADDRGP4 level+16
CNSTI4 0
ASGNI4
line 1794
;1794:				}
LABELV $931
line 1796
;1795:
;1796:				trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $529
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1797
;1797:			}
line 1798
;1798:			return;
ADDRGP4 $895
JUMPV
LABELV $924
line 1802
;1799:		}
;1800:
;1801:		// if the warmup time has counted down, restart
;1802:		if ( level.time > level.warmupTime ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+16
INDIRI4
LEI4 $900
line 1803
;1803:			G_WarmupEnd();
ADDRGP4 G_WarmupEnd
CALLV
pop
line 1804
;1804:			return;
ADDRGP4 $895
JUMPV
line 1806
;1805:		}
;1806:	} else if ( g_gametype.integer != GT_SINGLE_PLAYER && level.warmupTime != 0 ) {
LABELV $899
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $942
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $942
line 1808
;1807:		int		counts[TEAM_NUM_TEAMS];
;1808:		qboolean	notEnough = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1810
;1809:
;1810:		if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $946
line 1811
;1811:			counts[TEAM_BLUE] = TeamConnectedCount( -1, TEAM_BLUE );
CNSTI4 -1
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 20
ADDRGP4 TeamConnectedCount
CALLI4
ASGNI4
ADDRLP4 4+8
ADDRLP4 20
INDIRI4
ASGNI4
line 1812
;1812:			counts[TEAM_RED] = TeamConnectedCount( -1, TEAM_RED );
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 24
ADDRGP4 TeamConnectedCount
CALLI4
ASGNI4
ADDRLP4 4+4
ADDRLP4 24
INDIRI4
ASGNI4
line 1814
;1813:
;1814:			if (counts[TEAM_RED] < 1 || counts[TEAM_BLUE] < 1) {
ADDRLP4 4+4
INDIRI4
CNSTI4 1
LTI4 $955
ADDRLP4 4+8
INDIRI4
CNSTI4 1
GEI4 $947
LABELV $955
line 1815
;1815:				notEnough = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1816
;1816:			}
line 1817
;1817:		} else if ( level.numPlayingClients < 2 ) {
ADDRGP4 $947
JUMPV
LABELV $946
ADDRGP4 level+84
INDIRI4
CNSTI4 2
GEI4 $956
line 1818
;1818:			notEnough = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1819
;1819:		}
LABELV $956
LABELV $947
line 1821
;1820:
;1821:		if ( notEnough ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $959
line 1822
;1822:			if ( level.warmupTime != -1 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 -1
EQI4 $895
line 1823
;1823:				level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 1824
;1824:				trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $529
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1825
;1825:				G_LogPrintf( "Warmup:\n" );
ADDRGP4 $913
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1826
;1826:			}
line 1827
;1827:			return; // still waiting for team members
ADDRGP4 $895
JUMPV
LABELV $959
line 1830
;1828:		}
;1829:
;1830:		if ( level.warmupTime == 0 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $966
line 1831
;1831:			return;
ADDRGP4 $895
JUMPV
LABELV $966
line 1835
;1832:		}
;1833:
;1834:		// if the warmup is changed at the console, restart it
;1835:		if ( g_warmup.modificationCount != level.warmupModificationCount ) {
ADDRGP4 g_warmup+4
INDIRI4
ADDRGP4 level+356
INDIRI4
EQI4 $969
line 1836
;1836:			level.warmupModificationCount = g_warmup.modificationCount;
ADDRGP4 level+356
ADDRGP4 g_warmup+4
INDIRI4
ASGNI4
line 1837
;1837:			level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 1838
;1838:		}
LABELV $969
line 1841
;1839:
;1840:		// if all players have arrived, start the countdown
;1841:		if ( level.warmupTime < 0 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
GEI4 $976
line 1842
;1842:			if ( g_warmup.integer > 0 ) {
ADDRGP4 g_warmup+12
INDIRI4
CNSTI4 0
LEI4 $979
line 1843
;1843:				level.warmupTime = level.time + g_warmup.integer * 1000;
ADDRGP4 level+16
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_warmup+12
INDIRI4
CNSTI4 1000
MULI4
ADDI4
ASGNI4
line 1844
;1844:			} else {
ADDRGP4 $980
JUMPV
LABELV $979
line 1845
;1845:				level.warmupTime = 0;
ADDRGP4 level+16
CNSTI4 0
ASGNI4
line 1846
;1846:			}
LABELV $980
line 1848
;1847:
;1848:			trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $529
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1849
;1849:			return;
ADDRGP4 $895
JUMPV
LABELV $976
line 1853
;1850:		}
;1851:
;1852:		// if the warmup time has counted down, restart
;1853:		if ( level.time > level.warmupTime ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+16
INDIRI4
LEI4 $987
line 1854
;1854:			G_WarmupEnd();
ADDRGP4 G_WarmupEnd
CALLV
pop
line 1855
;1855:			return;
LABELV $987
line 1857
;1856:		}
;1857:	}
LABELV $942
LABELV $900
line 1858
;1858:}
LABELV $895
endproc CheckTournament 28 8
proc CheckVote 4 8
line 1866
;1859:
;1860:
;1861:/*
;1862:==================
;1863:CheckVote
;1864:==================
;1865:*/
;1866:static void CheckVote( void ) {
line 1868
;1867:	
;1868:	if ( level.voteExecuteTime ) {
ADDRGP4 level+876
INDIRI4
CNSTI4 0
EQI4 $992
line 1869
;1869:		 if ( level.voteExecuteTime < level.time ) {
ADDRGP4 level+876
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $991
line 1870
;1870:			level.voteExecuteTime = 0;
ADDRGP4 level+876
CNSTI4 0
ASGNI4
line 1871
;1871:			trap_SendConsoleCommand( EXEC_APPEND, va( "%s\n", level.voteString ) );
ADDRGP4 $1000
ARGP4
ADDRGP4 level+360
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1872
;1872:		 }
line 1873
;1873:		 return;
ADDRGP4 $991
JUMPV
LABELV $992
line 1876
;1874:	}
;1875:
;1876:	if ( !level.voteTime ) {
ADDRGP4 level+872
INDIRI4
CNSTI4 0
NEI4 $1002
line 1877
;1877:		return;
ADDRGP4 $991
JUMPV
LABELV $1002
line 1880
;1878:	}
;1879:
;1880:	if ( level.time - level.voteTime >= VOTE_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+872
INDIRI4
SUBI4
CNSTI4 30000
LTI4 $1005
line 1881
;1881:		G_BroadcastServerCommand( -1, "print \"Vote failed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $1009
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1882
;1882:	} else {
ADDRGP4 $1006
JUMPV
LABELV $1005
line 1884
;1883:		// ATVI Q3 1.32 Patch #9, WNF
;1884:		if ( level.voteYes > level.numVotingClients/2 ) {
ADDRGP4 level+880
INDIRI4
ADDRGP4 level+888
INDIRI4
CNSTI4 2
DIVI4
LEI4 $1010
line 1886
;1885:			// execute the command, then remove the vote
;1886:			G_BroadcastServerCommand( -1, "print \"Vote passed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $1014
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1887
;1887:			level.voteExecuteTime = level.time + 3000;
ADDRGP4 level+876
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1888
;1888:		} else if ( level.voteNo >= level.numVotingClients/2 ) {
ADDRGP4 $1011
JUMPV
LABELV $1010
ADDRGP4 level+884
INDIRI4
ADDRGP4 level+888
INDIRI4
CNSTI4 2
DIVI4
LTI4 $991
line 1890
;1889:			// same behavior as a timeout
;1890:			G_BroadcastServerCommand( -1, "print \"Vote failed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $1009
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1891
;1891:		} else {
line 1893
;1892:			// still waiting for a majority
;1893:			return;
LABELV $1018
LABELV $1011
line 1895
;1894:		}
;1895:	}
LABELV $1006
line 1897
;1896:
;1897:	level.voteTime = 0;
ADDRGP4 level+872
CNSTI4 0
ASGNI4
line 1898
;1898:	trap_SetConfigstring( CS_VOTE_TIME, "" );
CNSTI4 8
ARGI4
ADDRGP4 $56
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1899
;1899:}
LABELV $991
endproc CheckVote 4 8
proc PrintTeam 4 8
line 1907
;1900:
;1901:
;1902:/*
;1903:==================
;1904:PrintTeam
;1905:==================
;1906:*/
;1907:static void PrintTeam( team_t team, const char *message ) {
line 1910
;1908:	int i;
;1909:
;1910:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1026
JUMPV
LABELV $1023
line 1911
;1911:		if ( level.clients[i].sess.sessionTeam != team )
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
EQI4 $1028
line 1912
;1912:			continue;
ADDRGP4 $1024
JUMPV
LABELV $1028
line 1913
;1913:		if ( level.clients[i].pers.connected != CON_CONNECTED )
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
EQI4 $1030
line 1914
;1914:			continue;
ADDRGP4 $1024
JUMPV
LABELV $1030
line 1915
;1915:		trap_SendServerCommand( i, message );
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1916
;1916:	}
LABELV $1024
line 1910
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1026
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1023
line 1917
;1917:}
LABELV $1022
endproc PrintTeam 4 8
export SetLeader
proc SetLeader 8 8
line 1925
;1918:
;1919:
;1920:/*
;1921:==================
;1922:SetLeader
;1923:==================
;1924:*/
;1925:void SetLeader( team_t team, int client ) {
line 1928
;1926:	int i;
;1927:
;1928:	if ( level.clients[client].pers.connected == CON_DISCONNECTED ) {
ADDRFP4 4
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
NEI4 $1033
line 1929
;1929:		PrintTeam( team, va("print \"%s "S_COLOR_STRIP"is not connected\n\"", level.clients[client].pers.netname) );
ADDRGP4 $1035
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 PrintTeam
CALLV
pop
line 1930
;1930:		return;
ADDRGP4 $1032
JUMPV
LABELV $1033
line 1932
;1931:	}
;1932:	if (level.clients[client].sess.sessionTeam != team) {
ADDRFP4 4
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
EQI4 $1036
line 1933
;1933:		PrintTeam( team, va("print \"%s "S_COLOR_STRIP"is not on the team anymore\n\"", level.clients[client].pers.netname) );
ADDRGP4 $1038
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 PrintTeam
CALLV
pop
line 1934
;1934:		return;
ADDRGP4 $1032
JUMPV
LABELV $1036
line 1936
;1935:	}
;1936:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1042
JUMPV
LABELV $1039
line 1937
;1937:		if (level.clients[i].sess.sessionTeam != team)
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
EQI4 $1044
line 1938
;1938:			continue;
ADDRGP4 $1040
JUMPV
LABELV $1044
line 1939
;1939:		if (level.clients[i].sess.teamLeader) {
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
EQI4 $1046
line 1940
;1940:			level.clients[i].sess.teamLeader = qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 816
ADDP4
CNSTI4 0
ASGNI4
line 1941
;1941:			ClientUserinfoChanged( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 1942
;1942:		}
LABELV $1046
line 1943
;1943:	}
LABELV $1040
line 1936
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1042
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1039
line 1944
;1944:	level.clients[client].sess.teamLeader = qtrue;
ADDRFP4 4
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 816
ADDP4
CNSTI4 1
ASGNI4
line 1945
;1945:	ClientUserinfoChanged( client );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 1946
;1946:	PrintTeam( team, va("print \"%s is the new team leader\n\"", level.clients[client].pers.netname) );
ADDRGP4 $1048
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 PrintTeam
CALLV
pop
line 1947
;1947:}
LABELV $1032
endproc SetLeader 8 8
export CheckTeamLeader
proc CheckTeamLeader 28 8
line 1955
;1948:
;1949:
;1950:/*
;1951:==================
;1952:CheckTeamLeader
;1953:==================
;1954:*/
;1955:void CheckTeamLeader( team_t team ) {
line 1960
;1956:	int i;
;1957:	int	max_score, max_id;
;1958:	int	max_bot_score, max_bot_id;
;1959:
;1960:	for ( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1053
JUMPV
LABELV $1050
line 1962
;1961:
;1962:		if ( level.clients[i].sess.sessionTeam != team || level.clients[i].pers.connected == CON_DISCONNECTED )
ADDRLP4 24
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRLP4 24
INDIRP4
ADDP4
CNSTI4 792
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1057
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRLP4 24
INDIRP4
ADDP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1055
LABELV $1057
line 1963
;1963:			continue;
ADDRGP4 $1051
JUMPV
LABELV $1055
line 1965
;1964:
;1965:		if ( level.clients[i].sess.teamLeader )
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
EQI4 $1058
line 1966
;1966:			return;
ADDRGP4 $1049
JUMPV
LABELV $1058
line 1967
;1967:	}
LABELV $1051
line 1960
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1053
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1050
line 1970
;1968:
;1969:	// no leaders? find player with highest score
;1970:	max_score = SHRT_MIN;
ADDRLP4 4
CNSTI4 -32768
ASGNI4
line 1971
;1971:	max_id = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 1972
;1972:	max_bot_score = SHRT_MIN;
ADDRLP4 8
CNSTI4 -32768
ASGNI4
line 1973
;1973:	max_bot_id = -1;
ADDRLP4 16
CNSTI4 -1
ASGNI4
line 1975
;1974:
;1975:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1063
JUMPV
LABELV $1060
line 1977
;1976:
;1977:		if ( level.clients[i].sess.sessionTeam != team )
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
EQI4 $1065
line 1978
;1978:			continue;
ADDRGP4 $1061
JUMPV
LABELV $1065
line 1980
;1979:
;1980:		if ( g_entities[i].r.svFlags & SVF_BOT ) {
ADDRLP4 0
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities+456+464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1067
line 1981
;1981:			if ( level.clients[i].ps.persistant[PERS_SCORE] > max_bot_score ) {
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $1068
line 1982
;1982:				max_bot_score = level.clients[i].ps.persistant[PERS_SCORE];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1983
;1983:				max_bot_id = i;
ADDRLP4 16
ADDRLP4 0
INDIRI4
ASGNI4
line 1984
;1984:			}
line 1985
;1985:		} else {
ADDRGP4 $1068
JUMPV
LABELV $1067
line 1986
;1986:			if ( level.clients[i].ps.persistant[PERS_SCORE] > max_score ) {
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $1073
line 1987
;1987:				max_score = level.clients[i].ps.persistant[PERS_SCORE];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1736
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1988
;1988:				max_id = i;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 1989
;1989:			}
LABELV $1073
line 1990
;1990:		}
LABELV $1068
line 1991
;1991:	}
LABELV $1061
line 1975
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1063
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1060
line 1993
;1992:
;1993:	if ( max_id != -1 ) {
ADDRLP4 12
INDIRI4
CNSTI4 -1
EQI4 $1075
line 1994
;1994:		SetLeader( team, max_id ); 
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 1995
;1995:		return;
ADDRGP4 $1049
JUMPV
LABELV $1075
line 1998
;1996:	}
;1997:
;1998:	if ( max_bot_id != -1 ) {
ADDRLP4 16
INDIRI4
CNSTI4 -1
EQI4 $1077
line 1999
;1999:		SetLeader( team, max_bot_id );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 2000
;2000:		return;
LABELV $1077
line 2002
;2001:	}
;2002:}
LABELV $1049
endproc CheckTeamLeader 28 8
proc CheckTeamVote 16 12
line 2010
;2003:
;2004:
;2005:/*
;2006:==================
;2007:CheckTeamVote
;2008:==================
;2009:*/
;2010:static void CheckTeamVote( team_t team ) {
line 2013
;2011:	int cs_offset;
;2012:
;2013:	if ( team == TEAM_RED )
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $1080
line 2014
;2014:		cs_offset = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1081
JUMPV
LABELV $1080
line 2015
;2015:	else if ( team == TEAM_BLUE )
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $1079
line 2016
;2016:		cs_offset = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2018
;2017:	else
;2018:		return;
LABELV $1083
LABELV $1081
line 2020
;2019:
;2020:	if ( !level.teamVoteTime[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1084
line 2021
;2021:		return;
ADDRGP4 $1079
JUMPV
LABELV $1084
line 2023
;2022:	}
;2023:	if ( level.time - level.teamVoteTime[cs_offset] >= VOTE_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
INDIRI4
SUBI4
CNSTI4 30000
LTI4 $1087
line 2024
;2024:		G_BroadcastServerCommand( -1, "print \"Team vote failed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $1091
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 2025
;2025:	} else {
ADDRGP4 $1088
JUMPV
LABELV $1087
line 2026
;2026:		if ( level.teamVoteYes[cs_offset] > level.numteamVotingClients[cs_offset]/2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2964
ADDP4
INDIRI4
CNSTI4 2
DIVI4
LEI4 $1092
line 2028
;2027:			// execute the command, then remove the vote
;2028:			G_BroadcastServerCommand( -1, "print \"Team vote passed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $1096
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 2030
;2029:			//
;2030:			if ( !Q_strncmp( "leader", level.teamVoteString[cs_offset], 6) ) {
ADDRGP4 $1099
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+892
ADDP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 8
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1097
line 2032
;2031:				//set the team leader
;2032:				SetLeader(team, atoi(level.teamVoteString[cs_offset] + 7));
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+892+7
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 2033
;2033:			}
ADDRGP4 $1093
JUMPV
LABELV $1097
line 2034
;2034:			else {
line 2035
;2035:				trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.teamVoteString[cs_offset] ) );
ADDRGP4 $1000
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+892
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2036
;2036:			}
line 2037
;2037:		} else if ( level.teamVoteNo[cs_offset] >= level.numteamVotingClients[cs_offset]/2 ) {
ADDRGP4 $1093
JUMPV
LABELV $1092
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2964
ADDP4
INDIRI4
CNSTI4 2
DIVI4
LTI4 $1079
line 2039
;2038:			// same behavior as a timeout
;2039:			G_BroadcastServerCommand( -1, "print \"Team vote failed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $1091
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 2040
;2040:		} else {
line 2042
;2041:			// still waiting for a majority
;2042:			return;
LABELV $1105
LABELV $1093
line 2044
;2043:		}
;2044:	}
LABELV $1088
line 2045
;2045:	level.teamVoteTime[cs_offset] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
CNSTI4 0
ASGNI4
line 2046
;2046:	trap_SetConfigstring( CS_TEAMVOTE_TIME + cs_offset, "" );
ADDRLP4 0
INDIRI4
CNSTI4 12
ADDI4
ARGI4
ADDRGP4 $56
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2048
;2047:
;2048:}
LABELV $1079
endproc CheckTeamVote 16 12
data
align 4
LABELV $1110
byte 4 -1
export CheckCvars
code
proc CheckCvars 4 8
line 2056
;2049:
;2050:
;2051:/*
;2052:==================
;2053:CheckCvars
;2054:==================
;2055:*/
;2056:void CheckCvars( void ) {
line 2059
;2057:	static int lastMod = -1;
;2058:
;2059:	if ( lastMod != g_password.modificationCount ) {
ADDRGP4 $1110
INDIRI4
ADDRGP4 g_password+4
INDIRI4
EQI4 $1111
line 2060
;2060:		lastMod = g_password.modificationCount;
ADDRGP4 $1110
ADDRGP4 g_password+4
INDIRI4
ASGNI4
line 2061
;2061:		if ( g_password.string[0] && Q_stricmp( g_password.string, "none" ) != 0 ) {
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1115
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $1119
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1115
line 2062
;2062:			trap_Cvar_Set( "g_needpass", "1" );
ADDRGP4 $88
ARGP4
ADDRGP4 $58
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2063
;2063:		} else {
ADDRGP4 $1116
JUMPV
LABELV $1115
line 2064
;2064:			trap_Cvar_Set( "g_needpass", "0" );
ADDRGP4 $88
ARGP4
ADDRGP4 $68
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2065
;2065:		}
LABELV $1116
line 2066
;2066:	}
LABELV $1111
line 2067
;2067:}
LABELV $1109
endproc CheckCvars 4 8
export G_RunThink
proc G_RunThink 8 4
line 2077
;2068:
;2069:
;2070:/*
;2071:=============
;2072:G_RunThink
;2073:
;2074:Runs thinking code for this frame if necessary
;2075:=============
;2076:*/
;2077:void G_RunThink( gentity_t *ent ) {
line 2080
;2078:	int	thinktime;
;2079:
;2080:	thinktime = ent->nextthink;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1184
ADDP4
INDIRI4
ASGNI4
line 2081
;2081:	if (thinktime <= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $1121
line 2082
;2082:		return;
ADDRGP4 $1120
JUMPV
LABELV $1121
line 2084
;2083:	}
;2084:	if (thinktime > level.time) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1123
line 2085
;2085:		return;
ADDRGP4 $1120
JUMPV
LABELV $1123
line 2088
;2086:	}
;2087:	
;2088:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1184
ADDP4
CNSTI4 0
ASGNI4
line 2089
;2089:	if ( !ent->think ) {
ADDRFP4 0
INDIRP4
CNSTI4 1188
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1126
line 2090
;2090:		G_Error ( "NULL ent->think");
ADDRGP4 $1128
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 2091
;2091:	} else {
ADDRGP4 $1127
JUMPV
LABELV $1126
line 2092
;2092:		ent->think (ent);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1188
ADDP4
INDIRP4
CALLV
pop
line 2093
;2093:	}
LABELV $1127
line 2094
;2094:}
LABELV $1120
endproc G_RunThink 8 4
bss
align 4
LABELV $1130
skip 3840
code
proc G_RunFrame 32 12
line 2104
;2095:
;2096:
;2097:/*
;2098:================
;2099:G_RunFrame
;2100:
;2101:Advances the non-player objects in the world
;2102:================
;2103:*/
;2104:static void G_RunFrame( int levelTime ) {
line 2112
;2105:	int			i;
;2106:	gentity_t	*ent;
;2107:	gclient_t	*client;
;2108:	static	gentity_t *missiles[ MAX_GENTITIES - MAX_CLIENTS ];
;2109:	int		numMissiles;
;2110:	
;2111:	// if we are waiting for the level to restart, do nothing
;2112:	if ( level.restarted ) {
ADDRGP4 level+72
INDIRI4
CNSTI4 0
EQI4 $1131
line 2113
;2113:		return;
ADDRGP4 $1129
JUMPV
LABELV $1131
line 2116
;2114:	}
;2115:
;2116:	level.framenum++;
ADDRLP4 16
ADDRGP4 level+28
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2117
;2117:	level.previousTime = level.time;
ADDRGP4 level+36
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2118
;2118:	level.time = levelTime;
ADDRGP4 level+32
ADDRFP4 0
INDIRI4
ASGNI4
line 2119
;2119:	level.msec = level.time - level.previousTime;
ADDRGP4 level+44
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
ASGNI4
line 2122
;2120:
;2121:	// get any cvar changes
;2122:	G_UpdateCvars();
ADDRGP4 G_UpdateCvars
CALLV
pop
line 2124
;2123:
;2124:	numMissiles = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2129
;2125:
;2126:	//
;2127:	// go through all allocated objects
;2128:	//
;2129:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 2130
;2130:	for (i=0 ; i<level.num_entities ; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1144
JUMPV
LABELV $1141
line 2131
;2131:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 1016
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1146
line 2132
;2132:			continue;
ADDRGP4 $1142
JUMPV
LABELV $1146
line 2136
;2133:		}
;2134:
;2135:		// clear events that are too old
;2136:		if ( level.time - ent->eventTime > EVENT_VALID_MSEC ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
SUBI4
CNSTI4 300
LEI4 $1148
line 2137
;2137:			if ( ent->s.event ) {
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1151
line 2138
;2138:				ent->s.event = 0;	// &= EV_EVENT_BITS;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 2139
;2139:				if ( ent->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1153
line 2140
;2140:					ent->client->ps.externalEvent = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 128
ADDP4
CNSTI4 0
ASGNI4
line 2144
;2141:					// predicted events should never be set to zero
;2142:					//ent->client->ps.events[0] = 0;
;2143:					//ent->client->ps.events[1] = 0;
;2144:				}
LABELV $1153
line 2145
;2145:			}
LABELV $1151
line 2146
;2146:			if ( ent->freeAfterEvent ) {
ADDRLP4 0
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1155
line 2148
;2147:				// tempEntities or dropped items completely go away after their event
;2148:				G_FreeEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 2149
;2149:				continue;
ADDRGP4 $1142
JUMPV
LABELV $1155
line 2150
;2150:			} else if ( ent->unlinkAfterEvent ) {
ADDRLP4 0
INDIRP4
CNSTI4 1056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1157
line 2152
;2151:				// items that will respawn will hide themselves after their pickup event
;2152:				ent->unlinkAfterEvent = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 1056
ADDP4
CNSTI4 0
ASGNI4
line 2153
;2153:				trap_UnlinkEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 2154
;2154:			}
LABELV $1157
line 2155
;2155:		}
LABELV $1148
line 2158
;2156:
;2157:		// temporary entities don't think
;2158:		if ( ent->freeAfterEvent ) {
ADDRLP4 0
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1159
line 2159
;2159:			continue;
ADDRGP4 $1142
JUMPV
LABELV $1159
line 2162
;2160:		}
;2161:
;2162:		if ( !ent->r.linked && ent->neverFree ) {
ADDRLP4 0
INDIRP4
CNSTI4 912
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1161
ADDRLP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1161
line 2163
;2163:			continue;
ADDRGP4 $1142
JUMPV
LABELV $1161
line 2166
;2164:		}
;2165:
;2166:		if ( ent->s.eType == ET_MISSILE ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1163
line 2168
;2167:			// queue for unlagged pass
;2168:			missiles[ numMissiles ] = ent;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1130
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2169
;2169:			numMissiles++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2170
;2170:			continue;
ADDRGP4 $1142
JUMPV
LABELV $1163
line 2173
;2171:		}
;2172:
;2173:		if ( ent->s.eType == ET_ITEM || ent->physicsObject ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1167
ADDRLP4 0
INDIRP4
CNSTI4 1060
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1165
LABELV $1167
line 2174
;2174:			G_RunItem( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunItem
CALLV
pop
line 2175
;2175:			continue;
ADDRGP4 $1142
JUMPV
LABELV $1165
line 2178
;2176:		}
;2177:
;2178:		if ( ent->s.eType == ET_MOVER ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1168
line 2179
;2179:			G_RunMover( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunMover
CALLV
pop
line 2180
;2180:			continue;
ADDRGP4 $1142
JUMPV
LABELV $1168
line 2183
;2181:		}
;2182:
;2183:		if ( i < MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 64
GEI4 $1170
line 2184
;2184:			client = ent->client;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ASGNP4
line 2185
;2185:			client->sess.spectatorTime += level.msec; 
ADDRLP4 28
ADDRLP4 12
INDIRP4
CNSTI4 796
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRGP4 level+44
INDIRI4
ADDI4
ASGNI4
line 2186
;2186:			if ( client->pers.connected == CON_CONNECTED )
ADDRLP4 12
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1142
line 2187
;2187:				G_RunClient( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunClient
CALLV
pop
line 2188
;2188:			continue;
ADDRGP4 $1142
JUMPV
LABELV $1170
line 2191
;2189:		}
;2190:
;2191:		G_RunThink( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 2192
;2192:	}
LABELV $1142
line 2130
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1312
ADDP4
ASGNP4
LABELV $1144
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1141
line 2194
;2193:
;2194:	if ( numMissiles ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1175
line 2196
;2195:		// unlagged
;2196:		G_TimeShiftAllClients( level.previousTime, NULL );
ADDRGP4 level+36
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_TimeShiftAllClients
CALLV
pop
line 2198
;2197:		// run missiles
;2198:		for ( i = 0; i < numMissiles; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1181
JUMPV
LABELV $1178
line 2199
;2199:			G_RunMissile( missiles[ i ] );
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1130
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_RunMissile
CALLV
pop
LABELV $1179
line 2198
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1181
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $1178
line 2201
;2200:		// unlagged
;2201:		G_UnTimeShiftAllClients( NULL );
CNSTP4 0
ARGP4
ADDRGP4 G_UnTimeShiftAllClients
CALLV
pop
line 2202
;2202:	}
LABELV $1175
line 2205
;2203:
;2204:	// perform final fixups on the players
;2205:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 2206
;2206:	for ( i = 0; i < level.maxclients; i++, ent++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1185
JUMPV
LABELV $1182
line 2207
;2207:		if ( ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 1016
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1187
line 2208
;2208:			ClientEndFrame( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 2209
;2209:		}
LABELV $1187
line 2210
;2210:	}
LABELV $1183
line 2206
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1312
ADDP4
ASGNP4
LABELV $1185
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1182
line 2213
;2211:
;2212:	// see if it is time to do a tournement restart
;2213:	CheckTournament();
ADDRGP4 CheckTournament
CALLV
pop
line 2216
;2214:
;2215:	// see if it is time to end the level
;2216:	CheckExitRules();
ADDRGP4 CheckExitRules
CALLV
pop
line 2219
;2217:
;2218:	// update to team status?
;2219:	CheckTeamStatus();
ADDRGP4 CheckTeamStatus
CALLV
pop
line 2222
;2220:
;2221:	// cancel vote if timed out
;2222:	CheckVote();
ADDRGP4 CheckVote
CALLV
pop
line 2225
;2223:
;2224:	// check team votes
;2225:	CheckTeamVote( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 CheckTeamVote
CALLV
pop
line 2226
;2226:	CheckTeamVote( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 CheckTeamVote
CALLV
pop
line 2229
;2227:
;2228:	// for tracking changes
;2229:	CheckCvars();
ADDRGP4 CheckCvars
CALLV
pop
line 2231
;2230:
;2231:	if (g_listEntity.integer) {
ADDRGP4 g_listEntity+12
INDIRI4
CNSTI4 0
EQI4 $1189
line 2232
;2232:		for (i = 0; i < MAX_GENTITIES; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1192
line 2233
;2233:			G_Printf("%4i: %s\n", i, g_entities[i].classname);
ADDRGP4 $1196
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities+1020
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 2234
;2234:		}
LABELV $1193
line 2232
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $1192
line 2235
;2235:		trap_Cvar_Set("g_listEntity", "0");
ADDRGP4 $113
ARGP4
ADDRGP4 $68
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2236
;2236:	}
LABELV $1189
line 2239
;2237:
;2238:	// unlagged
;2239:	level.frameStartTime = trap_Milliseconds();
ADDRLP4 20
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRGP4 level+11800
ADDRLP4 20
INDIRI4
ASGNI4
line 2240
;2240:}
LABELV $1129
endproc G_RunFrame 32 12
bss
export trap_GetValue
align 4
LABELV trap_GetValue
skip 4
export g_listEntity
align 4
LABELV g_listEntity
skip 272
export g_podiumDrop
align 4
LABELV g_podiumDrop
skip 272
export g_podiumDist
align 4
LABELV g_podiumDist
skip 272
export g_logSync
align 4
LABELV g_logSync
skip 272
export g_log
align 4
LABELV g_log
skip 272
export g_maxclients
align 4
LABELV g_maxclients
skip 272
export g_clients
align 4
LABELV g_clients
skip 111104
export svf_self_portal2
align 4
LABELV svf_self_portal2
skip 4
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
export g_allowDeathCam
align 4
LABELV g_allowDeathCam
skip 272
export g_itemTimer
align 4
LABELV g_itemTimer
skip 272
export g_PureAllowHook
align 4
LABELV g_PureAllowHook
skip 272
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
export g_predictPVS
align 4
LABELV g_predictPVS
skip 272
export g_unlagged
align 4
LABELV g_unlagged
skip 272
export g_rotation
align 4
LABELV g_rotation
skip 272
export pmove_msec
align 4
LABELV pmove_msec
skip 272
export pmove_fixed
align 4
LABELV pmove_fixed
skip 272
export g_smoothClients
align 4
LABELV g_smoothClients
skip 272
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
export g_filterBan
align 4
LABELV g_filterBan
skip 272
export g_banIPs
align 4
LABELV g_banIPs
skip 272
export g_teamForceBalance
align 4
LABELV g_teamForceBalance
skip 272
export g_autoJoin
align 4
LABELV g_autoJoin
skip 272
export g_allowVote
align 4
LABELV g_allowVote
skip 272
export g_blood
align 4
LABELV g_blood
skip 272
export g_warmup
align 4
LABELV g_warmup
skip 272
export g_motd
align 4
LABELV g_motd
skip 272
export g_synchronousClients
align 4
LABELV g_synchronousClients
skip 272
export g_weaponTeamRespawn
align 4
LABELV g_weaponTeamRespawn
skip 272
export g_weaponRespawn
align 4
LABELV g_weaponRespawn
skip 272
export g_debugDamage
align 4
LABELV g_debugDamage
skip 272
export g_debugAlloc
align 4
LABELV g_debugAlloc
skip 272
export g_debugMove
align 4
LABELV g_debugMove
skip 272
export g_inactivity
align 4
LABELV g_inactivity
skip 272
export g_forcerespawn
align 4
LABELV g_forcerespawn
skip 272
export g_quadfactor
align 4
LABELV g_quadfactor
skip 272
export g_knockback
align 4
LABELV g_knockback
skip 272
export g_speed
align 4
LABELV g_speed
skip 272
export g_gravity
align 4
LABELV g_gravity
skip 272
export g_needpass
align 4
LABELV g_needpass
skip 272
export g_password
align 4
LABELV g_password
skip 272
export g_friendlyFire
align 4
LABELV g_friendlyFire
skip 272
export g_capturelimit
align 4
LABELV g_capturelimit
skip 272
export g_timelimit
align 4
LABELV g_timelimit
skip 272
export g_fraglimit
align 4
LABELV g_fraglimit
skip 272
export g_dmflags
align 4
LABELV g_dmflags
skip 272
export g_maxGameClients
align 4
LABELV g_maxGameClients
skip 272
export g_cheats
align 4
LABELV g_cheats
skip 272
export g_dedicated
align 4
LABELV g_dedicated
skip 272
export sv_fps
align 4
LABELV sv_fps
skip 272
export g_mapname
align 4
LABELV g_mapname
skip 272
export g_gametype
align 4
LABELV g_gametype
skip 272
export g_entities
align 4
LABELV g_entities
skip 1343488
export level
align 4
LABELV level
skip 11804
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
import DeathmatchScoreboardMessage
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SetClientVrControllerAngles
import SpotWouldTelefrag
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
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
LABELV $1196
byte 1 37
byte 1 52
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1128
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 45
byte 1 62
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 107
byte 1 0
align 1
LABELV $1119
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $1099
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1096
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
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1091
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
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1048
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
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1038
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
byte 1 94
byte 1 55
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
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1035
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
byte 1 94
byte 1 55
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
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
LABELV $1014
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
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1009
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
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1000
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $913
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $863
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
LABELV $836
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
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
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
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $830
byte 1 67
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
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $829
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
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
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
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $819
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
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
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
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $806
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
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
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
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $800
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $799
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
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
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
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $786
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 46
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
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $690
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 32
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
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
LABELV $673
byte 1 114
byte 1 101
byte 1 100
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 32
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $664
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $658
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $653
byte 1 37
byte 1 51
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 46
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $650
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $648
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
byte 1 32
byte 1 0
align 1
LABELV $645
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $621
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
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $529
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $390
byte 1 115
byte 1 0
align 1
LABELV $381
byte 1 102
byte 1 0
align 1
LABELV $347
byte 1 83
byte 1 104
byte 1 117
byte 1 116
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $343
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 32
byte 1 83
byte 1 104
byte 1 117
byte 1 116
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 10
byte 1 0
align 1
LABELV $340
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 77
byte 1 97
byte 1 112
byte 1 73
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $334
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $331
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 47
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 52
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $329
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $325
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $319
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $303
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 107
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $302
byte 1 73
byte 1 110
byte 1 105
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $301
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $299
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 103
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
LABELV $284
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
byte 1 102
byte 1 114
byte 1 121
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $278
byte 1 83
byte 1 86
byte 1 70
byte 1 95
byte 1 83
byte 1 69
byte 1 76
byte 1 70
byte 1 95
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 65
byte 1 76
byte 1 50
byte 1 95
byte 1 81
byte 1 51
byte 1 69
byte 1 0
align 1
LABELV $273
byte 1 47
byte 1 47
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 95
byte 1 71
byte 1 101
byte 1 116
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $272
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $271
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $270
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 32
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 73
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $265
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $260
byte 1 114
byte 1 101
byte 1 100
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $255
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $250
byte 1 114
byte 1 101
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $247
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 0
align 1
LABELV $242
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
LABELV $233
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $230
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
byte 1 0
align 1
LABELV $212
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
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
LABELV $200
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $196
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
byte 1 32
byte 1 105
byte 1 115
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
byte 1 44
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $178
byte 1 37
byte 1 105
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $120
byte 1 103
byte 1 95
byte 1 80
byte 1 117
byte 1 114
byte 1 101
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 72
byte 1 111
byte 1 111
byte 1 107
byte 1 0
align 1
LABELV $119
byte 1 103
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $118
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
LABELV $117
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $116
byte 1 103
byte 1 95
byte 1 115
byte 1 109
byte 1 111
byte 1 111
byte 1 116
byte 1 104
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $115
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 80
byte 1 86
byte 1 83
byte 1 0
align 1
LABELV $114
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
LABELV $113
byte 1 103
byte 1 95
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $112
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $111
byte 1 55
byte 1 48
byte 1 0
align 1
LABELV $110
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 68
byte 1 114
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $109
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $108
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 68
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $107
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $106
byte 1 103
byte 1 95
byte 1 109
byte 1 111
byte 1 116
byte 1 100
byte 1 0
align 1
LABELV $105
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 0
align 1
LABELV $104
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $103
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 77
byte 1 111
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $102
byte 1 103
byte 1 95
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
align 1
LABELV $101
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $100
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $99
byte 1 53
byte 1 0
align 1
LABELV $98
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $97
byte 1 51
byte 1 0
align 1
LABELV $96
byte 1 103
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $95
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $94
byte 1 103
byte 1 95
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $93
byte 1 56
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $92
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $91
byte 1 51
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $90
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $89
byte 1 100
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $88
byte 1 103
byte 1 95
byte 1 110
byte 1 101
byte 1 101
byte 1 100
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $87
byte 1 103
byte 1 95
byte 1 102
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 66
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $86
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 0
align 1
LABELV $85
byte 1 103
byte 1 95
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
LABELV $84
byte 1 103
byte 1 95
byte 1 108
byte 1 111
byte 1 103
byte 1 83
byte 1 121
byte 1 110
byte 1 99
byte 1 0
align 1
LABELV $83
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 46
byte 1 108
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $82
byte 1 103
byte 1 95
byte 1 108
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $81
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
LABELV $80
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 70
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 66
byte 1 97
byte 1 108
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $79
byte 1 103
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $78
byte 1 103
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $77
byte 1 103
byte 1 95
byte 1 115
byte 1 121
byte 1 110
byte 1 99
byte 1 104
byte 1 114
byte 1 111
byte 1 110
byte 1 111
byte 1 117
byte 1 115
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $76
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
LABELV $75
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
LABELV $74
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $73
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
LABELV $72
byte 1 100
byte 1 109
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $71
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $70
byte 1 56
byte 1 0
align 1
LABELV $69
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $68
byte 1 48
byte 1 0
align 1
LABELV $67
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
LABELV $66
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $65
byte 1 115
byte 1 118
byte 1 95
byte 1 102
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $64
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $63
byte 1 74
byte 1 117
byte 1 110
byte 1 32
byte 1 50
byte 1 51
byte 1 32
byte 1 50
byte 1 48
byte 1 50
byte 1 50
byte 1 0
align 1
LABELV $62
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $61
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 113
byte 1 51
byte 1 0
align 1
LABELV $60
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $59
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 67
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $58
byte 1 49
byte 1 0
align 1
LABELV $57
byte 1 103
byte 1 95
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $56
byte 1 0
align 1
LABELV $55
byte 1 115
byte 1 118
byte 1 95
byte 1 99
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 0
