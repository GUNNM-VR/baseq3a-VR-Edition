export vmMain
code
proc vmMain 12 12
file "..\..\..\..\code\q3_ui\ui_main.c"
line 30
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:USER INTERFACE MAIN
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:#ifdef USE_NATIVE_HACK
;15:#include "../../../Quake3e-master/code/vrmod/VRMOD_input.h"
;16:vr_clientinfo_t *vrinfo = NULL;
;17:#endif
;18:
;19:/*
;20:================
;21:vmMain
;22:
;23:This is the only way control passes into the module.
;24:This must be the very first function compiled into the .qvm file
;25:================
;26:*/
;27:#ifdef USE_NATIVE_HACK
;28:DLLEXPORT intptr_t vmMain( int command, int arg0, int arg1, int arg2) {
;29:#else
;30:DLLEXPORT intptr_t vmMain(int command, int arg0, int arg1, int arg2, int arg3) {
line 32
;31:#endif
;32:	switch ( command ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $69
ADDRLP4 0
INDIRI4
CNSTI4 10
GTI4 $69
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $82
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $82
address $71
address $72
address $73
address $74
address $75
address $76
address $77
address $78
address $79
address $80
address $81
code
LABELV $71
line 34
;33:	case UI_GETAPIVERSION:
;34:		return UI_API_VERSION;
CNSTI4 4
RETI4
ADDRGP4 $68
JUMPV
LABELV $72
line 45
;35:
;36:	case UI_INIT:
;37:#ifdef USE_NATIVE_HACK
;38:	{
;39:		unsigned int ptr[2];
;40:		ptr[0] = arg1;
;41:		ptr[1] = arg2;
;42:		vrinfo = (vr_clientinfo_t *)(*(long *)(ptr));
;43:	}
;44:#endif
;45:		UI_Init();
ADDRGP4 UI_Init
CALLV
pop
line 46
;46:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $68
JUMPV
LABELV $73
line 49
;47:
;48:	case UI_SHUTDOWN:
;49:		UI_Shutdown();
ADDRGP4 UI_Shutdown
CALLV
pop
line 50
;50:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $68
JUMPV
LABELV $74
line 53
;51:
;52:	case UI_KEY_EVENT:
;53:		UI_KeyEvent( arg0, arg1 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_KeyEvent
CALLV
pop
line 54
;54:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $68
JUMPV
LABELV $75
line 58
;55:
;56:	case UI_MOUSE_EVENT:
;57:#ifdef USE_VIRTUAL_MENU
;58:		UI_MouseEvent( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_MouseEvent
CALLV
pop
line 62
;59:#else
;60:		UI_MouseEvent( arg0, arg1 );
;61:#endif
;62:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $68
JUMPV
LABELV $76
line 65
;63:
;64:	case UI_REFRESH:
;65:		UI_Refresh( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_Refresh
CALLV
pop
line 66
;66:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $68
JUMPV
LABELV $77
line 69
;67:
;68:	case UI_IS_FULLSCREEN:
;69:		return UI_IsFullscreen();
ADDRLP4 4
ADDRGP4 UI_IsFullscreen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $68
JUMPV
LABELV $78
line 72
;70:
;71:	case UI_SET_ACTIVE_MENU:
;72:		UI_SetActiveMenu( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_SetActiveMenu
CALLV
pop
line 73
;73:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $68
JUMPV
LABELV $79
line 76
;74:
;75:	case UI_CONSOLE_COMMAND:
;76:		return UI_ConsoleCommand( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $68
JUMPV
LABELV $80
line 79
;77:
;78:	case UI_DRAW_CONNECT_SCREEN:
;79:		UI_DrawConnectScreen( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawConnectScreen
CALLV
pop
line 80
;80:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $68
JUMPV
LABELV $81
line 83
;81:
;82:	case UI_HASUNIQUECDKEY:	// mod authors need to observe this
;83:		return qtrue;		// change this to qfalse for mods!
CNSTI4 1
RETI4
ADDRGP4 $68
JUMPV
LABELV $69
line 86
;84:	}
;85:
;86:	return -1;
CNSTI4 -1
RETI4
LABELV $68
endproc vmMain 12 12
data
align 4
LABELV cvarTable
address ui_ffa_fraglimit
address $84
address $85
byte 4 1
address ui_ffa_timelimit
address $86
address $87
byte 4 1
address ui_tourney_fraglimit
address $88
address $87
byte 4 1
address ui_tourney_timelimit
address $89
address $90
byte 4 1
address ui_team_fraglimit
address $91
address $87
byte 4 1
address ui_team_timelimit
address $92
address $85
byte 4 1
address ui_team_friendly
address $93
address $94
byte 4 1
address ui_ctf_capturelimit
address $95
address $96
byte 4 1
address ui_ctf_timelimit
address $97
address $98
byte 4 1
address ui_ctf_friendly
address $99
address $87
byte 4 1
address ui_arenasFile
address $100
address $101
byte 4 80
address ui_botsFile
address $102
address $101
byte 4 33
address ui_spScores1
address $103
address $101
byte 4 1
address ui_spScores2
address $104
address $101
byte 4 1
address ui_spScores3
address $105
address $101
byte 4 1
address ui_spScores4
address $106
address $101
byte 4 1
address ui_spScores5
address $107
address $101
byte 4 1
address ui_spAwards
address $108
address $101
byte 4 1
address ui_spVideos
address $109
address $101
byte 4 1
address ui_spSkill
address $110
address $111
byte 4 33
address ui_spSelection
address $112
address $101
byte 4 64
address ui_browserMaster
address $113
address $87
byte 4 1
address ui_browserGameType
address $114
address $87
byte 4 1
address ui_browserSortKey
address $115
address $116
byte 4 1
address ui_browserShowFull
address $117
address $94
byte 4 1
address ui_browserShowEmpty
address $118
address $94
byte 4 1
address ui_brassTime
address $119
address $120
byte 4 1
address ui_drawCrosshair
address $121
address $116
byte 4 1
address ui_drawCrosshairNames
address $122
address $94
byte 4 1
address ui_marks
address $123
address $94
byte 4 1
address ui_server1
address $124
address $101
byte 4 1
address ui_server2
address $125
address $101
byte 4 1
address ui_server3
address $126
address $101
byte 4 1
address ui_server4
address $127
address $101
byte 4 1
address ui_server5
address $128
address $101
byte 4 1
address ui_server6
address $129
address $101
byte 4 1
address ui_server7
address $130
address $101
byte 4 1
address ui_server8
address $131
address $101
byte 4 1
address ui_server9
address $132
address $101
byte 4 1
address ui_server10
address $133
address $101
byte 4 1
address ui_server11
address $134
address $101
byte 4 1
address ui_server12
address $135
address $101
byte 4 1
address ui_server13
address $136
address $101
byte 4 1
address ui_server14
address $137
address $101
byte 4 1
address ui_server15
address $138
address $101
byte 4 1
address ui_server16
address $139
address $101
byte 4 1
address ui_cdkeychecked
address $140
address $87
byte 4 64
address vr_controller_type
address $141
address $87
byte 4 1
address laserBeamRGBA
address $142
address $143
byte 4 1
align 4
LABELV cvarTableSize
byte 4 49
export UI_RegisterCvars
code
proc UI_RegisterCvars 12 16
line 235
;87:}
;88:
;89:
;90:/*
;91:================
;92:cvars
;93:================
;94:*/
;95:
;96:typedef struct {
;97:	vmCvar_t	*vmCvar;
;98:	char		*cvarName;
;99:	char		*defaultString;
;100:	int			cvarFlags;
;101:} cvarTable_t;
;102:
;103:vmCvar_t	ui_ffa_fraglimit;
;104:vmCvar_t	ui_ffa_timelimit;
;105:
;106:vmCvar_t	ui_tourney_fraglimit;
;107:vmCvar_t	ui_tourney_timelimit;
;108:
;109:vmCvar_t	ui_team_fraglimit;
;110:vmCvar_t	ui_team_timelimit;
;111:vmCvar_t	ui_team_friendly;
;112:
;113:vmCvar_t	ui_ctf_capturelimit;
;114:vmCvar_t	ui_ctf_timelimit;
;115:vmCvar_t	ui_ctf_friendly;
;116:
;117:vmCvar_t	ui_arenasFile;
;118:vmCvar_t	ui_botsFile;
;119:vmCvar_t	ui_spScores1;
;120:vmCvar_t	ui_spScores2;
;121:vmCvar_t	ui_spScores3;
;122:vmCvar_t	ui_spScores4;
;123:vmCvar_t	ui_spScores5;
;124:vmCvar_t	ui_spAwards;
;125:vmCvar_t	ui_spVideos;
;126:vmCvar_t	ui_spSkill;
;127:
;128:vmCvar_t	ui_spSelection;
;129:
;130:vmCvar_t	ui_browserMaster;
;131:vmCvar_t	ui_browserGameType;
;132:vmCvar_t	ui_browserSortKey;
;133:vmCvar_t	ui_browserShowFull;
;134:vmCvar_t	ui_browserShowEmpty;
;135:
;136:vmCvar_t	ui_brassTime;
;137:vmCvar_t	ui_drawCrosshair;
;138:vmCvar_t	ui_drawCrosshairNames;
;139:vmCvar_t	ui_marks;
;140:
;141:vmCvar_t	ui_server1;
;142:vmCvar_t	ui_server2;
;143:vmCvar_t	ui_server3;
;144:vmCvar_t	ui_server4;
;145:vmCvar_t	ui_server5;
;146:vmCvar_t	ui_server6;
;147:vmCvar_t	ui_server7;
;148:vmCvar_t	ui_server8;
;149:vmCvar_t	ui_server9;
;150:vmCvar_t	ui_server10;
;151:vmCvar_t	ui_server11;
;152:vmCvar_t	ui_server12;
;153:vmCvar_t	ui_server13;
;154:vmCvar_t	ui_server14;
;155:vmCvar_t	ui_server15;
;156:vmCvar_t	ui_server16;
;157:
;158:vmCvar_t	ui_cdkeychecked;
;159:
;160:vmCvar_t	vr_controller_type;
;161:vmCvar_t	laserBeamRGBA;
;162:
;163:// bk001129 - made static to avoid aliasing.
;164:static cvarTable_t		cvarTable[] = {
;165:	{ &ui_ffa_fraglimit, "ui_ffa_fraglimit", "20", CVAR_ARCHIVE },
;166:	{ &ui_ffa_timelimit, "ui_ffa_timelimit", "0", CVAR_ARCHIVE },
;167:
;168:	{ &ui_tourney_fraglimit, "ui_tourney_fraglimit", "0", CVAR_ARCHIVE },
;169:	{ &ui_tourney_timelimit, "ui_tourney_timelimit", "15", CVAR_ARCHIVE },
;170:
;171:	{ &ui_team_fraglimit, "ui_team_fraglimit", "0", CVAR_ARCHIVE },
;172:	{ &ui_team_timelimit, "ui_team_timelimit", "20", CVAR_ARCHIVE },
;173:	{ &ui_team_friendly, "ui_team_friendly",  "1", CVAR_ARCHIVE },
;174:
;175:	{ &ui_ctf_capturelimit, "ui_ctf_capturelimit", "8", CVAR_ARCHIVE },
;176:	{ &ui_ctf_timelimit, "ui_ctf_timelimit", "30", CVAR_ARCHIVE },
;177:	{ &ui_ctf_friendly, "ui_ctf_friendly",  "0", CVAR_ARCHIVE },
;178:
;179:	{ &ui_arenasFile, "g_arenasFile", "", CVAR_INIT|CVAR_ROM },
;180:	{ &ui_botsFile, "g_botsFile", "", CVAR_ARCHIVE|CVAR_LATCH },
;181:	{ &ui_spScores1, "g_spScores1", "", CVAR_ARCHIVE },
;182:	{ &ui_spScores2, "g_spScores2", "", CVAR_ARCHIVE },
;183:	{ &ui_spScores3, "g_spScores3", "", CVAR_ARCHIVE },
;184:	{ &ui_spScores4, "g_spScores4", "", CVAR_ARCHIVE },
;185:	{ &ui_spScores5, "g_spScores5", "", CVAR_ARCHIVE },
;186:	{ &ui_spAwards, "g_spAwards", "", CVAR_ARCHIVE },
;187:	{ &ui_spVideos, "g_spVideos", "", CVAR_ARCHIVE },
;188:	{ &ui_spSkill, "g_spSkill", "2", CVAR_ARCHIVE | CVAR_LATCH },
;189:
;190:	{ &ui_spSelection, "ui_spSelection", "", CVAR_ROM },
;191:
;192:	{ &ui_browserMaster, "ui_browserMaster", "0", CVAR_ARCHIVE },
;193:	{ &ui_browserGameType, "ui_browserGameType", "0", CVAR_ARCHIVE },
;194:	{ &ui_browserSortKey, "ui_browserSortKey", "4", CVAR_ARCHIVE },
;195:	{ &ui_browserShowFull, "ui_browserShowFull", "1", CVAR_ARCHIVE },
;196:	{ &ui_browserShowEmpty, "ui_browserShowEmpty", "1", CVAR_ARCHIVE },
;197:
;198:	{ &ui_brassTime, "cg_brassTime", "2500", CVAR_ARCHIVE },
;199:	{ &ui_drawCrosshair, "cg_drawCrosshair", "4", CVAR_ARCHIVE },
;200:	{ &ui_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE },
;201:	{ &ui_marks, "cg_marks", "1", CVAR_ARCHIVE },
;202:
;203:	{ &ui_server1, "server1", "", CVAR_ARCHIVE },
;204:	{ &ui_server2, "server2", "", CVAR_ARCHIVE },
;205:	{ &ui_server3, "server3", "", CVAR_ARCHIVE },
;206:	{ &ui_server4, "server4", "", CVAR_ARCHIVE },
;207:	{ &ui_server5, "server5", "", CVAR_ARCHIVE },
;208:	{ &ui_server6, "server6", "", CVAR_ARCHIVE },
;209:	{ &ui_server7, "server7", "", CVAR_ARCHIVE },
;210:	{ &ui_server8, "server8", "", CVAR_ARCHIVE },
;211:	{ &ui_server9, "server9", "", CVAR_ARCHIVE },
;212:	{ &ui_server10, "server10", "", CVAR_ARCHIVE },
;213:	{ &ui_server11, "server11", "", CVAR_ARCHIVE },
;214:	{ &ui_server12, "server12", "", CVAR_ARCHIVE },
;215:	{ &ui_server13, "server13", "", CVAR_ARCHIVE },
;216:	{ &ui_server14, "server14", "", CVAR_ARCHIVE },
;217:	{ &ui_server15, "server15", "", CVAR_ARCHIVE },
;218:	{ &ui_server16, "server16", "", CVAR_ARCHIVE },
;219:
;220:	{ &ui_cdkeychecked, "ui_cdkeychecked", "0", CVAR_ROM },
;221:
;222:	{ &vr_controller_type, "vr_controller_type", "0", CVAR_ARCHIVE },
;223:	{ &laserBeamRGBA, "laserBeamRGBA", "FF0000C0", CVAR_ARCHIVE },
;224:};
;225:
;226:// bk001129 - made static to avoid aliasing
;227:static int cvarTableSize = sizeof(cvarTable) / sizeof(cvarTable[0]);
;228:
;229:
;230:/*
;231:=================
;232:UI_RegisterCvars
;233:=================
;234:*/
;235:void UI_RegisterCvars( void ) {
line 239
;236:	int			i;
;237:	cvarTable_t	*cv;
;238:
;239:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $148
JUMPV
LABELV $145
line 240
;240:		trap_Cvar_Register( cv->vmCvar, cv->cvarName, cv->defaultString, cv->cvarFlags );
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
line 241
;241:	}
LABELV $146
line 239
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $148
ADDRLP4 4
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $145
line 242
;242:}
LABELV $144
endproc UI_RegisterCvars 12 16
export UI_UpdateCvars
proc UI_UpdateCvars 8 4
line 249
;243:
;244:/*
;245:=================
;246:UI_UpdateCvars
;247:=================
;248:*/
;249:void UI_UpdateCvars( void ) {
line 253
;250:	int			i;
;251:	cvarTable_t	*cv;
;252:
;253:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $153
JUMPV
LABELV $150
line 254
;254:		trap_Cvar_Update( cv->vmCvar );
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 255
;255:	}
LABELV $151
line 253
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $153
ADDRLP4 0
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $150
line 256
;256:}
LABELV $149
endproc UI_UpdateCvars 8 4
export UI_VideoCheck
proc UI_VideoCheck 12 4
line 265
;257:
;258:
;259:/*
;260:=================
;261:UI_VideoCheck
;262:=================
;263:*/
;264:void UI_VideoCheck( int time ) 
;265:{
line 266
;266:	if ( abs( time - uis.lastVideoCheck ) > 1000 ) {
ADDRFP4 0
INDIRI4
ADDRGP4 uis+11492
INDIRI4
SUBI4
ARGI4
ADDRLP4 0
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1000
LEI4 $155
line 269
;267:
;268:		int oldWidth, oldHeight;
;269:		oldWidth = uis.glconfig.menuWidth;
ADDRLP4 4
ADDRGP4 uis+60+11312
INDIRI4
ASGNI4
line 270
;270:		oldHeight = uis.glconfig.menuHeight;
ADDRLP4 8
ADDRGP4 uis+60+11316
INDIRI4
ASGNI4
line 272
;271:
;272:		trap_GetGlconfig( &uis.glconfig );
ADDRGP4 uis+60
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 274
;273:
;274:		if ( uis.glconfig.menuWidth != oldWidth || uis.glconfig.menuHeight != oldHeight ) {
ADDRGP4 uis+60+11312
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $169
ADDRGP4 uis+60+11316
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $163
LABELV $169
line 275
;275:			uis.biasY = 0.0;
ADDRGP4 uis+11460
CNSTF4 0
ASGNF4
line 276
;276:			uis.biasX = 0.0;
ADDRGP4 uis+11456
CNSTF4 0
ASGNF4
line 278
;277:			// for 640x480 virtualized screen
;278:			if ( uis.glconfig.menuWidth * 480 > uis.glconfig.menuHeight * 640 ) {
ADDRGP4 uis+60+11312
INDIRI4
CNSTI4 480
MULI4
ADDRGP4 uis+60+11316
INDIRI4
CNSTI4 640
MULI4
LEI4 $172
line 280
;279:				// wide screen, scale by height
;280:				uis.scale = uis.glconfig.menuHeight * (1.0/480.0);
ADDRGP4 uis+11452
ADDRGP4 uis+60+11316
INDIRI4
CVIF4 4
CNSTF4 990414985
MULF4
ASGNF4
line 281
;281:				uis.biasX = 0.5 * ( uis.glconfig.menuWidth - ( uis.glconfig.menuHeight * (640.0 / 480.0)));
ADDRGP4 uis+11456
ADDRGP4 uis+60+11312
INDIRI4
CVIF4 4
ADDRGP4 uis+60+11316
INDIRI4
CVIF4 4
CNSTF4 1068149419
MULF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 282
;282:			} else {
ADDRGP4 $173
JUMPV
LABELV $172
line 284
;283:				// no wide screen, scale by width
;284:				uis.scale = uis.glconfig.menuWidth * (1.0/640.0);
ADDRGP4 uis+11452
ADDRGP4 uis+60+11312
INDIRI4
CVIF4 4
CNSTF4 986500301
MULF4
ASGNF4
line 285
;285:				uis.biasY = 0.5 * ( uis.glconfig.menuHeight - ( uis.glconfig.menuWidth * (480.0 / 640)));
ADDRGP4 uis+11460
ADDRGP4 uis+60+11316
INDIRI4
CVIF4 4
ADDRGP4 uis+60+11312
INDIRI4
CVIF4 4
CNSTF4 1061158912
MULF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 286
;286:			}
LABELV $173
line 288
;287:
;288:			uis.screenXmin = 0.0 - (uis.biasX / uis.scale);
ADDRGP4 uis+11468
CNSTF4 0
ADDRGP4 uis+11456
INDIRF4
ADDRGP4 uis+11452
INDIRF4
DIVF4
SUBF4
ASGNF4
line 289
;289:			uis.screenXmax = 640.0 + (uis.biasX / uis.scale);
ADDRGP4 uis+11472
ADDRGP4 uis+11456
INDIRF4
ADDRGP4 uis+11452
INDIRF4
DIVF4
CNSTF4 1142947840
ADDF4
ASGNF4
line 291
;290:
;291:			uis.screenYmin = 0.0 - (uis.biasY / uis.scale);
ADDRGP4 uis+11476
CNSTF4 0
ADDRGP4 uis+11460
INDIRF4
ADDRGP4 uis+11452
INDIRF4
DIVF4
SUBF4
ASGNF4
line 292
;292:			uis.screenYmax = 480.0 + (uis.biasY / uis.scale);
ADDRGP4 uis+11480
ADDRGP4 uis+11460
INDIRF4
ADDRGP4 uis+11452
INDIRF4
DIVF4
CNSTF4 1139802112
ADDF4
ASGNF4
line 294
;293:
;294:			uis.cursorScaleR = 1.0 / uis.scale;
ADDRGP4 uis+11464
CNSTF4 1065353216
ADDRGP4 uis+11452
INDIRF4
DIVF4
ASGNF4
line 295
;295:			if ( uis.cursorScaleR < 0.5 ) {
ADDRGP4 uis+11464
INDIRF4
CNSTF4 1056964608
GEF4 $208
line 296
;296:				uis.cursorScaleR = 0.5;
ADDRGP4 uis+11464
CNSTF4 1056964608
ASGNF4
line 297
;297:			}
LABELV $208
line 298
;298:		}
LABELV $163
line 300
;299:
;300:		uis.lastVideoCheck = time;
ADDRGP4 uis+11492
ADDRFP4 0
INDIRI4
ASGNI4
line 301
;301:	}
LABELV $155
line 302
;302:}
LABELV $154
endproc UI_VideoCheck 12 4
import set_VR_focusItem
import get_VR_focusItem
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_RankingsMenu
import Rankings_Cache
import Rankings_DrawPassword
import Rankings_DrawName
import Rankings_DrawText
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetNumBots
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import UI_HudMenu
import UI_Hud_Cache
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_SetPbClStatus
import trap_VerifyCDKey
import trap_SetCDKey
import trap_GetCDKey
import trap_MemoryRemaining
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_ServerStatus
import trap_LAN_LoadCachedServers
import trap_LAN_SaveCachedServers
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import uis
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_AdjustFrom640
import UI_CursorInRect
import UI_DrawChar
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString_AutoWrapped
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawRect
import UI_FillRect
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
import UI_RegisterClientModelname
import UI_PlayerInfo_SetInfo
import UI_PlayerInfo_SetModel
import UI_DrawPlayer
import VRconf_Cache
import UI_VRconfMenu
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UI_BotSelectMenu_Cache
import UI_BotSelectMenu
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_Message
import UI_ConfirmMenu_Style
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_MainMenu
import MainMenu_Cache
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import text_color_highlight
import text_color_normal
import text_color_disabled
import listbar_color
import list_color
import name_color
import color_dim
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
bss
export laserBeamRGBA
align 4
LABELV laserBeamRGBA
skip 272
export vr_controller_type
align 4
LABELV vr_controller_type
skip 272
export ui_cdkeychecked
align 4
LABELV ui_cdkeychecked
skip 272
import ui_cdkey
export ui_server16
align 4
LABELV ui_server16
skip 272
export ui_server15
align 4
LABELV ui_server15
skip 272
export ui_server14
align 4
LABELV ui_server14
skip 272
export ui_server13
align 4
LABELV ui_server13
skip 272
export ui_server12
align 4
LABELV ui_server12
skip 272
export ui_server11
align 4
LABELV ui_server11
skip 272
export ui_server10
align 4
LABELV ui_server10
skip 272
export ui_server9
align 4
LABELV ui_server9
skip 272
export ui_server8
align 4
LABELV ui_server8
skip 272
export ui_server7
align 4
LABELV ui_server7
skip 272
export ui_server6
align 4
LABELV ui_server6
skip 272
export ui_server5
align 4
LABELV ui_server5
skip 272
export ui_server4
align 4
LABELV ui_server4
skip 272
export ui_server3
align 4
LABELV ui_server3
skip 272
export ui_server2
align 4
LABELV ui_server2
skip 272
export ui_server1
align 4
LABELV ui_server1
skip 272
export ui_marks
align 4
LABELV ui_marks
skip 272
export ui_drawCrosshairNames
align 4
LABELV ui_drawCrosshairNames
skip 272
export ui_drawCrosshair
align 4
LABELV ui_drawCrosshair
skip 272
export ui_brassTime
align 4
LABELV ui_brassTime
skip 272
export ui_browserShowEmpty
align 4
LABELV ui_browserShowEmpty
skip 272
export ui_browserShowFull
align 4
LABELV ui_browserShowFull
skip 272
export ui_browserSortKey
align 4
LABELV ui_browserSortKey
skip 272
export ui_browserGameType
align 4
LABELV ui_browserGameType
skip 272
export ui_browserMaster
align 4
LABELV ui_browserMaster
skip 272
export ui_spSelection
align 4
LABELV ui_spSelection
skip 272
export ui_spSkill
align 4
LABELV ui_spSkill
skip 272
export ui_spVideos
align 4
LABELV ui_spVideos
skip 272
export ui_spAwards
align 4
LABELV ui_spAwards
skip 272
export ui_spScores5
align 4
LABELV ui_spScores5
skip 272
export ui_spScores4
align 4
LABELV ui_spScores4
skip 272
export ui_spScores3
align 4
LABELV ui_spScores3
skip 272
export ui_spScores2
align 4
LABELV ui_spScores2
skip 272
export ui_spScores1
align 4
LABELV ui_spScores1
skip 272
export ui_botsFile
align 4
LABELV ui_botsFile
skip 272
export ui_arenasFile
align 4
LABELV ui_arenasFile
skip 272
export ui_ctf_friendly
align 4
LABELV ui_ctf_friendly
skip 272
export ui_ctf_timelimit
align 4
LABELV ui_ctf_timelimit
skip 272
export ui_ctf_capturelimit
align 4
LABELV ui_ctf_capturelimit
skip 272
export ui_team_friendly
align 4
LABELV ui_team_friendly
skip 272
export ui_team_timelimit
align 4
LABELV ui_team_timelimit
skip 272
export ui_team_fraglimit
align 4
LABELV ui_team_fraglimit
skip 272
export ui_tourney_timelimit
align 4
LABELV ui_tourney_timelimit
skip 272
export ui_tourney_fraglimit
align 4
LABELV ui_tourney_fraglimit
skip 272
export ui_ffa_timelimit
align 4
LABELV ui_ffa_timelimit
skip 272
export ui_ffa_fraglimit
align 4
LABELV ui_ffa_fraglimit
skip 272
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
LABELV $143
byte 1 70
byte 1 70
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 67
byte 1 48
byte 1 0
align 1
LABELV $142
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
LABELV $141
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
LABELV $140
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $139
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $138
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $137
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 52
byte 1 0
align 1
LABELV $136
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 51
byte 1 0
align 1
LABELV $135
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $134
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $133
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $132
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 57
byte 1 0
align 1
LABELV $131
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 56
byte 1 0
align 1
LABELV $130
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 55
byte 1 0
align 1
LABELV $129
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 54
byte 1 0
align 1
LABELV $128
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 53
byte 1 0
align 1
LABELV $127
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 52
byte 1 0
align 1
LABELV $126
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 51
byte 1 0
align 1
LABELV $125
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $124
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $123
byte 1 99
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $122
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $121
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $120
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $119
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $118
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $117
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $116
byte 1 52
byte 1 0
align 1
LABELV $115
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $114
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $113
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 77
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $112
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $111
byte 1 50
byte 1 0
align 1
LABELV $110
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $109
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 86
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $108
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 65
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $107
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 53
byte 1 0
align 1
LABELV $106
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 52
byte 1 0
align 1
LABELV $105
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 51
byte 1 0
align 1
LABELV $104
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $103
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 49
byte 1 0
align 1
LABELV $102
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $101
byte 1 0
align 1
LABELV $100
byte 1 103
byte 1 95
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $99
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $98
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $97
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
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
LABELV $96
byte 1 56
byte 1 0
align 1
LABELV $95
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
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
LABELV $94
byte 1 49
byte 1 0
align 1
LABELV $93
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $92
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
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
LABELV $91
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
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
LABELV $90
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $89
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 95
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
LABELV $88
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 95
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
LABELV $87
byte 1 48
byte 1 0
align 1
LABELV $86
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 102
byte 1 97
byte 1 95
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
LABELV $85
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $84
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 102
byte 1 97
byte 1 95
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
