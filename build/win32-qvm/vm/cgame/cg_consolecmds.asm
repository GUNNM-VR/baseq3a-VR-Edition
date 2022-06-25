code
proc CG_TargetCommand_f 20 12
file "..\..\..\..\code\cgame\cg_consolecmds.c"
line 18
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_consolecmds.c -- text commands typed in at the local console, or
;4:// executed by a key binding
;5:
;6:#include "cg_local.h"
;7:#ifdef MISSIONPACK
;8:#include "../ui/ui_shared.h"
;9:extern menuDef_t *menuScoreboard;
;10:#endif
;11:
;12:
;13:/*
;14:=================
;15:CG_TargetCommand_f
;16:=================
;17:*/
;18:static void CG_TargetCommand_f( void ) {
line 22
;19:	int		targetNum;
;20:	char	cmd[4];
;21:
;22:	targetNum = CG_CrosshairPlayer();
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 23
;23:	if ( targetNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $88
line 24
;24:		return;
ADDRGP4 $87
JUMPV
LABELV $88
line 27
;25:	}
;26:
;27:	trap_Argv( 1, cmd, sizeof( cmd ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 28
;28:	trap_SendConsoleCommand( va( "gc %i %i", targetNum, atoi( cmd ) ) );
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $90
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 29
;29:}
LABELV $87
endproc CG_TargetCommand_f 20 12
proc CG_SizeUp_f 4 8
line 40
;30:
;31:
;32:
;33:/*
;34:=================
;35:CG_SizeUp_f
;36:
;37:Keybinding command
;38:=================
;39:*/
;40:static void CG_SizeUp_f (void) {
line 41
;41:	trap_Cvar_Set("cg_viewsize", va("%i",(int)(cg_viewsize.integer+10)));
ADDRGP4 $93
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
ADDI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $92
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 42
;42:}
LABELV $91
endproc CG_SizeUp_f 4 8
proc CG_SizeDown_f 4 8
line 52
;43:
;44:
;45:/*
;46:=================
;47:CG_SizeDown_f
;48:
;49:Keybinding command
;50:=================
;51:*/
;52:static void CG_SizeDown_f (void) {
line 53
;53:	trap_Cvar_Set("cg_viewsize", va("%i",(int)(cg_viewsize.integer-10)));
ADDRGP4 $93
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
SUBI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $92
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 54
;54:}
LABELV $95
endproc CG_SizeDown_f 4 8
proc CG_Viewpos_f 0 20
line 64
;55:
;56:
;57:/*
;58:=============
;59:CG_Viewpos_f
;60:
;61:Debugging command to print the current position
;62:=============
;63:*/
;64:static void CG_Viewpos_f (void) {
line 65
;65:	CG_Printf ("(%i %i %i) : %i\n", (int)cg.refdef.vieworg[0],
ADDRGP4 $98
ARGP4
ADDRGP4 cg+236804+24
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+236804+24+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+236804+24+8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+237172+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 68
;66:		(int)cg.refdef.vieworg[1], (int)cg.refdef.vieworg[2], 
;67:		(int)cg.refdefViewAngles[YAW]);
;68:}
LABELV $97
endproc CG_Viewpos_f 0 20
proc CG_ScoresDown_f 0 4
line 71
;69:
;70:
;71:static void CG_ScoresDown_f( void ) {
line 76
;72:
;73:#ifdef MISSIONPACK
;74:	CG_BuildSpectatorString();
;75:#endif
;76:	if ( cg.scoresRequestTime + 2000 < cg.time && !cg.demoPlayback ) {
ADDRGP4 cg+238232
INDIRI4
CNSTI4 2000
ADDI4
ADDRGP4 cg+234764
INDIRI4
GEI4 $110
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $110
line 79
;77:		// the scores are more than two seconds out of data,
;78:		// so request new ones
;79:		cg.scoresRequestTime = cg.time;
ADDRGP4 cg+238232
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 80
;80:		trap_SendClientCommand( "score" );
ADDRGP4 $117
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 84
;81:
;82:		// leave the current scores up if they were already
;83:		// displayed, but if this is the first hit, clear them out
;84:		if ( !cg.showScores ) {
ADDRGP4 cg+243116
INDIRI4
CNSTI4 0
NEI4 $111
line 85
;85:			cg.showScores = qtrue;
ADDRGP4 cg+243116
CNSTI4 1
ASGNI4
line 86
;86:			cg.numScores = 0;
ADDRGP4 cg+238236
CNSTI4 0
ASGNI4
line 87
;87:		}
line 88
;88:	} else {
ADDRGP4 $111
JUMPV
LABELV $110
line 91
;89:		// show the cached contents even if they just pressed if it
;90:		// is within two seconds
;91:		cg.showScores = qtrue;
ADDRGP4 cg+243116
CNSTI4 1
ASGNI4
line 92
;92:	}
LABELV $111
line 94
;93:
;94:	CG_SetScoreCatcher( cg.showScores );
ADDRGP4 cg+243116
INDIRI4
ARGI4
ADDRGP4 CG_SetScoreCatcher
CALLV
pop
line 95
;95:}
LABELV $109
endproc CG_ScoresDown_f 0 4
proc CG_ScoresUp_f 0 4
line 98
;96:
;97:
;98:static void CG_ScoresUp_f( void ) {
line 100
;99:
;100:	if ( cgs.filterKeyUpEvent ) {
ADDRGP4 cgs+151684
INDIRI4
CNSTI4 0
EQI4 $126
line 101
;101:		cgs.filterKeyUpEvent = qfalse;
ADDRGP4 cgs+151684
CNSTI4 0
ASGNI4
line 102
;102:		return;
ADDRGP4 $125
JUMPV
LABELV $126
line 105
;103:	}
;104:
;105:	if ( cg.showScores ) {
ADDRGP4 cg+243116
INDIRI4
CNSTI4 0
EQI4 $130
line 106
;106:		cg.showScores = qfalse;
ADDRGP4 cg+243116
CNSTI4 0
ASGNI4
line 107
;107:		cg.scoreFadeTime = cg.time;
ADDRGP4 cg+243124
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 108
;108:	}
LABELV $130
line 110
;109:
;110:	CG_SetScoreCatcher( cg.showScores );
ADDRGP4 cg+243116
INDIRI4
ARGI4
ADDRGP4 CG_SetScoreCatcher
CALLV
pop
line 111
;111:}
LABELV $125
endproc CG_ScoresUp_f 0 4
proc CG_TellTarget_f 264 20
line 184
;112:
;113:
;114:#ifdef MISSIONPACK
;115:extern menuDef_t *menuScoreboard;
;116:void Menu_Reset( void );			// FIXME: add to right include file
;117:
;118:static void CG_LoadHud_f( void) {
;119:  char buff[1024];
;120:	const char *hudSet;
;121:  memset(buff, 0, sizeof(buff));
;122:
;123:	String_Init();
;124:	Menu_Reset();
;125:	
;126:	trap_Cvar_VariableStringBuffer("cg_hudFiles", buff, sizeof(buff));
;127:	hudSet = buff;
;128:	if (hudSet[0] == '\0') {
;129:		hudSet = "ui/hud.txt";
;130:	}
;131:
;132:	CG_LoadMenus(hudSet);
;133:  menuScoreboard = NULL;
;134:}
;135:
;136:
;137:static void CG_scrollScoresDown_f( void) {
;138:	if (menuScoreboard && cg.scoreBoardShowing) {
;139:		Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, qtrue);
;140:		Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, qtrue);
;141:		Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, qtrue);
;142:	}
;143:}
;144:
;145:
;146:static void CG_scrollScoresUp_f( void) {
;147:	if (menuScoreboard && cg.scoreBoardShowing) {
;148:		Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, qfalse);
;149:		Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, qfalse);
;150:		Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, qfalse);
;151:	}
;152:}
;153:
;154:
;155:static void CG_spWin_f( void) {
;156:	trap_Cvar_Set("cg_cameraOrbit", "2");
;157:	trap_Cvar_Set("cg_cameraOrbitDelay", "35");
;158:	trap_Cvar_Set("cg_thirdPerson", "1");
;159:	trap_Cvar_Set("cg_thirdPersonAngle", "0");
;160:	trap_Cvar_Set("cg_thirdPersonRange", "100");
;161:	CG_AddBufferedSound(cgs.media.winnerSound);
;162:	//trap_S_StartLocalSound(cgs.media.winnerSound, CHAN_ANNOUNCER);
;163:	CG_CenterPrint("YOU WIN!", SCREEN_HEIGHT * .30, 0);
;164:}
;165:
;166:static void CG_spLose_f( void) {
;167:	trap_Cvar_Set("cg_cameraOrbit", "2");
;168:	trap_Cvar_Set("cg_cameraOrbitDelay", "35");
;169:	trap_Cvar_Set("cg_thirdPerson", "1");
;170:	trap_Cvar_Set("cg_thirdPersonAngle", "0");
;171:	trap_Cvar_Set("cg_thirdPersonRange", "100");
;172:	CG_AddBufferedSound(cgs.media.loserSound);
;173:	//trap_S_StartLocalSound(cgs.media.loserSound, CHAN_ANNOUNCER);
;174:	CG_CenterPrint("YOU LOSE...", SCREEN_HEIGHT * .30, 0);
;175:}
;176:
;177:#endif
;178:
;179:/*
;180:==================
;181:CG_TellTarget_f
;182:==================
;183:*/
;184:static void CG_TellTarget_f( void ) {
line 189
;185:	int		clientNum;
;186:	char	command[128];
;187:	char	message[128];
;188:
;189:	clientNum = CG_CrosshairPlayer();
ADDRLP4 260
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 190
;190:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $138
line 191
;191:		return;
ADDRGP4 $137
JUMPV
LABELV $138
line 194
;192:	}
;193:
;194:	trap_Args( message, sizeof( message ) );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 195
;195:	Com_sprintf( command, sizeof( command ), "tell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $140
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 196
;196:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 197
;197:}
LABELV $137
endproc CG_TellTarget_f 264 20
proc CG_TellAttacker_f 264 20
line 205
;198:
;199:
;200:/*
;201:==================
;202:CG_TellAttacker_f
;203:==================
;204:*/
;205:static void CG_TellAttacker_f( void ) {
line 210
;206:	int		clientNum;
;207:	char	command[128];
;208:	char	message[128];
;209:
;210:	clientNum = CG_LastAttacker();
ADDRLP4 260
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 211
;211:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $142
line 212
;212:		return;
ADDRGP4 $141
JUMPV
LABELV $142
line 215
;213:	}
;214:
;215:	trap_Args( message, sizeof( message ) );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 216
;216:	Com_sprintf( command, sizeof( command ), "tell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $140
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 217
;217:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 218
;218:}
LABELV $141
endproc CG_TellAttacker_f 264 20
proc CG_VoiceTellTarget_f 264 20
line 227
;219:
;220:
;221:#if defined MISSIONPACK || defined USE_NEOHUD
;222:/*
;223:==================
;224:CG_VoiceTellTarget_f
;225:==================
;226:*/
;227:static void CG_VoiceTellTarget_f( void ) {
line 232
;228:	int		clientNum;
;229:	char	command[128];
;230:	char	message[128];
;231:
;232:	clientNum = CG_CrosshairPlayer();
ADDRLP4 260
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 233
;233:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $145
line 234
;234:		return;
ADDRGP4 $144
JUMPV
LABELV $145
line 237
;235:	}
;236:
;237:	trap_Args( message, sizeof( message ) );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 238
;238:	Com_sprintf( command, sizeof( command ), "vtell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $147
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 239
;239:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 240
;240:}
LABELV $144
endproc CG_VoiceTellTarget_f 264 20
proc CG_VoiceTellAttacker_f 264 20
line 248
;241:
;242:
;243:/*
;244:==================
;245:CG_VoiceTellAttacker_f
;246:==================
;247:*/
;248:static void CG_VoiceTellAttacker_f( void ) {
line 253
;249:	int		clientNum;
;250:	char	command[128];
;251:	char	message[128];
;252:
;253:	clientNum = CG_LastAttacker();
ADDRLP4 260
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 254
;254:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $149
line 255
;255:		return;
ADDRGP4 $148
JUMPV
LABELV $149
line 258
;256:	}
;257:
;258:	trap_Args( message, sizeof( message ) );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 259
;259:	Com_sprintf( command, sizeof( command ), "vtell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $147
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 260
;260:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 261
;261:}
LABELV $148
endproc CG_VoiceTellAttacker_f 264 20
proc CG_NextTeamMember_f 0 0
line 263
;262:
;263:static void CG_NextTeamMember_f( void ) {
line 264
;264:	CG_SelectNextPlayer();
ADDRGP4 CG_SelectNextPlayer
CALLV
pop
line 265
;265:}
LABELV $151
endproc CG_NextTeamMember_f 0 0
proc CG_PrevTeamMember_f 0 0
line 267
;266:
;267:static void CG_PrevTeamMember_f( void ) {
line 268
;268:	CG_SelectPrevPlayer();
ADDRGP4 CG_SelectPrevPlayer
CALLV
pop
line 269
;269:}
LABELV $152
endproc CG_PrevTeamMember_f 0 0
proc CG_NextOrder_f 12 0
line 273
;270:
;271:// ASS U ME's enumeration order as far as task specific orders, OFFENSE is zero, CAMP is last
;272://
;273:static void CG_NextOrder_f( void ) {
line 285
;274:	// hack: we're not team leader before changing team (skirmish for example)
;275:	// but this create another problem: anybody in the team can control bots
;276:	// fixme: use default behaviour in multiplayer game
;277:#ifdef MISSIONPACK
;278:	clientInfo_t *ci = cgs.clientinfo + cg.snap->ps.clientNum;
;279:	if (ci) {
;280:		if (!ci->teamLeader && sortedTeamPlayers[cg_currentSelectedPlayer.integer] != cg.snap->ps.clientNum) {
;281:			return;
;282:		}
;283:	}
;284:#endif
;285:	if (cgs.currentOrder < TEAMTASK_CAMP) {
ADDRGP4 cgs+150500
INDIRI4
CNSTI4 7
GEI4 $154
line 286
;286:		cgs.currentOrder++;
ADDRLP4 0
ADDRGP4 cgs+150500
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 288
;287:
;288:		if (cgs.currentOrder == TEAMTASK_RETRIEVE) {
ADDRGP4 cgs+150500
INDIRI4
CNSTI4 5
NEI4 $158
line 289
;289:			if (!CG_OtherTeamHasFlag()) {
ADDRLP4 4
ADDRGP4 CG_OtherTeamHasFlag
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $161
line 290
;290:				cgs.currentOrder++;
ADDRLP4 8
ADDRGP4 cgs+150500
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 291
;291:			}
LABELV $161
line 292
;292:		}
LABELV $158
line 294
;293:
;294:		if (cgs.currentOrder == TEAMTASK_ESCORT) {
ADDRGP4 cgs+150500
INDIRI4
CNSTI4 6
NEI4 $155
line 295
;295:			if (!CG_YourTeamHasFlag()) {
ADDRLP4 4
ADDRGP4 CG_YourTeamHasFlag
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $155
line 296
;296:				cgs.currentOrder++;
ADDRLP4 8
ADDRGP4 cgs+150500
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 297
;297:			}
line 298
;298:		}
line 300
;299:
;300:	} else {
ADDRGP4 $155
JUMPV
LABELV $154
line 301
;301:		cgs.currentOrder = TEAMTASK_OFFENSE;
ADDRGP4 cgs+150500
CNSTI4 1
ASGNI4
line 302
;302:	}
LABELV $155
line 303
;303:	cgs.orderPending = qtrue;
ADDRGP4 cgs+150504
CNSTI4 1
ASGNI4
line 304
;304:	cgs.orderTime = cg.time + 3000;
ADDRGP4 cgs+150508
ADDRGP4 cg+234764
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 305
;305:}
LABELV $153
endproc CG_NextOrder_f 12 0
proc CG_ConfirmOrder_f 8 12
line 308
;306:
;307:
;308:static void CG_ConfirmOrder_f (void ) {
line 309
;309:	trap_SendConsoleCommand(va("cmd vtell %d %s\n", cgs.acceptLeader, VOICECHAT_YES));
ADDRGP4 $175
ARGP4
ADDRGP4 cgs+150524
INDIRI4
ARGI4
ADDRGP4 $177
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 310
;310:	trap_SendConsoleCommand("+button5; wait; -button5");
ADDRGP4 $178
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 311
;311:	if (cg.time < cgs.acceptOrderTime) {
ADDRGP4 cg+234764
INDIRI4
ADDRGP4 cgs+150516
INDIRI4
GEI4 $179
line 312
;312:		trap_SendClientCommand(va("teamtask %d\n", cgs.acceptTask));
ADDRGP4 $183
ARGP4
ADDRGP4 cgs+150520
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 313
;313:		cgs.acceptOrderTime = 0;
ADDRGP4 cgs+150516
CNSTI4 0
ASGNI4
line 314
;314:	}
LABELV $179
line 315
;315:}
LABELV $174
endproc CG_ConfirmOrder_f 8 12
proc CG_DenyOrder_f 4 12
line 317
;316:
;317:static void CG_DenyOrder_f (void ) {
line 318
;318:	trap_SendConsoleCommand(va("cmd vtell %d %s\n", cgs.acceptLeader, VOICECHAT_NO));
ADDRGP4 $175
ARGP4
ADDRGP4 cgs+150524
INDIRI4
ARGI4
ADDRGP4 $188
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 319
;319:	trap_SendConsoleCommand("+button6; wait; -button6");
ADDRGP4 $189
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 320
;320:	if (cg.time < cgs.acceptOrderTime) {
ADDRGP4 cg+234764
INDIRI4
ADDRGP4 cgs+150516
INDIRI4
GEI4 $190
line 321
;321:		cgs.acceptOrderTime = 0;
ADDRGP4 cgs+150516
CNSTI4 0
ASGNI4
line 322
;322:	}
LABELV $190
line 323
;323:}
LABELV $186
endproc CG_DenyOrder_f 4 12
proc CG_TaskOffense_f 4 8
line 325
;324:
;325:static void CG_TaskOffense_f (void ) {
line 326
;326:	if (cgs.gametype == GT_CTF 
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 4
NEI4 $196
line 330
;327:#ifdef MISSIONPACK
;328:		|| cgs.gametype == GT_1FCTF
;329:#endif
;330:		) {
line 331
;331:		trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONGETFLAG));
ADDRGP4 $199
ARGP4
ADDRGP4 $200
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 332
;332:	} else {
ADDRGP4 $197
JUMPV
LABELV $196
line 333
;333:		trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONOFFENSE));
ADDRGP4 $199
ARGP4
ADDRGP4 $201
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 334
;334:	}
LABELV $197
line 335
;335:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_OFFENSE));
ADDRGP4 $183
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 336
;336:}
LABELV $195
endproc CG_TaskOffense_f 4 8
proc CG_TaskDefense_f 8 8
line 338
;337:
;338:static void CG_TaskDefense_f (void ) {
line 339
;339:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONDEFENSE));
ADDRGP4 $199
ARGP4
ADDRGP4 $203
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 340
;340:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_DEFENSE));
ADDRGP4 $183
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 341
;341:}
LABELV $202
endproc CG_TaskDefense_f 8 8
proc CG_TaskPatrol_f 8 8
line 343
;342:
;343:static void CG_TaskPatrol_f (void ) {
line 344
;344:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONPATROL));
ADDRGP4 $199
ARGP4
ADDRGP4 $205
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 345
;345:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_PATROL));
ADDRGP4 $183
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 346
;346:}
LABELV $204
endproc CG_TaskPatrol_f 8 8
proc CG_TaskCamp_f 8 8
line 348
;347:
;348:static void CG_TaskCamp_f (void ) {
line 349
;349:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONCAMPING));
ADDRGP4 $199
ARGP4
ADDRGP4 $207
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 350
;350:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_CAMP));
ADDRGP4 $183
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 351
;351:}
LABELV $206
endproc CG_TaskCamp_f 8 8
proc CG_TaskFollow_f 8 8
line 353
;352:
;353:static void CG_TaskFollow_f (void ) {
line 354
;354:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONFOLLOW));
ADDRGP4 $199
ARGP4
ADDRGP4 $209
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 355
;355:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_FOLLOW));
ADDRGP4 $183
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 356
;356:}
LABELV $208
endproc CG_TaskFollow_f 8 8
proc CG_TaskRetrieve_f 8 8
line 358
;357:
;358:static void CG_TaskRetrieve_f (void ) {
line 359
;359:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONRETURNFLAG));
ADDRGP4 $199
ARGP4
ADDRGP4 $211
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 360
;360:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_RETRIEVE));
ADDRGP4 $183
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 361
;361:}
LABELV $210
endproc CG_TaskRetrieve_f 8 8
proc CG_TaskEscort_f 8 8
line 363
;362:
;363:static void CG_TaskEscort_f (void ) {
line 364
;364:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONFOLLOWCARRIER));
ADDRGP4 $199
ARGP4
ADDRGP4 $213
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 365
;365:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_ESCORT));
ADDRGP4 $183
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 366
;366:}
LABELV $212
endproc CG_TaskEscort_f 8 8
proc CG_TaskOwnFlag_f 4 8
line 368
;367:
;368:static void CG_TaskOwnFlag_f (void ) {
line 369
;369:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_IHAVEFLAG));
ADDRGP4 $199
ARGP4
ADDRGP4 $215
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 370
;370:}
LABELV $214
endproc CG_TaskOwnFlag_f 4 8
proc CG_TauntKillInsult_f 0 4
line 372
;371:
;372:static void CG_TauntKillInsult_f (void ) {
line 373
;373:	trap_SendConsoleCommand("cmd vsay kill_insult\n");
ADDRGP4 $217
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 374
;374:}
LABELV $216
endproc CG_TauntKillInsult_f 0 4
proc CG_TauntPraise_f 0 4
line 376
;375:
;376:static void CG_TauntPraise_f (void ) {
line 377
;377:	trap_SendConsoleCommand("cmd vsay praise\n");
ADDRGP4 $219
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 378
;378:}
LABELV $218
endproc CG_TauntPraise_f 0 4
proc CG_TauntTaunt_f 0 4
line 380
;379:
;380:static void CG_TauntTaunt_f (void ) {
line 381
;381:	trap_SendConsoleCommand("cmd vtaunt\n");
ADDRGP4 $221
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 382
;382:}
LABELV $220
endproc CG_TauntTaunt_f 0 4
proc CG_TauntDeathInsult_f 0 4
line 384
;383:
;384:static void CG_TauntDeathInsult_f (void ) {
line 385
;385:	trap_SendConsoleCommand("cmd vsay death_insult\n");
ADDRGP4 $223
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 386
;386:}
LABELV $222
endproc CG_TauntDeathInsult_f 0 4
proc CG_TauntGauntlet_f 0 4
line 388
;387:
;388:static void CG_TauntGauntlet_f (void ) {
line 389
;389:	trap_SendConsoleCommand("cmd vsay kill_gauntlet\n");
ADDRGP4 $225
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 390
;390:}
LABELV $224
endproc CG_TauntGauntlet_f 0 4
proc CG_TaskSuicide_f 136 16
line 392
;391:
;392:static void CG_TaskSuicide_f (void ) {
line 396
;393:	int		clientNum;
;394:	char	command[128];
;395:
;396:	clientNum = CG_CrosshairPlayer();
ADDRLP4 132
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 132
INDIRI4
ASGNI4
line 397
;397:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $227
line 398
;398:		return;
ADDRGP4 $226
JUMPV
LABELV $227
line 401
;399:	}
;400:
;401:	Com_sprintf( command, 128, "tell %i suicide", clientNum );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $229
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 402
;402:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 403
;403:}
LABELV $226
endproc CG_TaskSuicide_f 136 16
proc CG_StartOrbit_f 1028 12
line 444
;404:
;405:
;406:
;407:/*
;408:==================
;409:CG_TeamMenu_f
;410:==================
;411:*/
;412:/*
;413:static void CG_TeamMenu_f( void ) {
;414:  if (trap_Key_GetCatcher() & KEYCATCH_CGAME) {
;415:    CG_EventHandling(CGAME_EVENT_NONE);
;416:    trap_Key_SetCatcher(0);
;417:  } else {
;418:    CG_EventHandling(CGAME_EVENT_TEAMMENU);
;419:    //trap_Key_SetCatcher(KEYCATCH_CGAME);
;420:  }
;421:}
;422:*/
;423:
;424:/*
;425:==================
;426:CG_EditHud_f
;427:==================
;428:*/
;429:/*
;430:static void CG_EditHud_f( void ) {
;431:  //cls.keyCatchers ^= KEYCATCH_CGAME;
;432:  //VM_Call (cgvm, CG_EVENT_HANDLING, (cls.keyCatchers & KEYCATCH_CGAME) ? CGAME_EVENT_EDITHUD : CGAME_EVENT_NONE);
;433:}
;434:*/
;435:
;436:#endif
;437:
;438:/*
;439:==================
;440:CG_StartOrbit_f
;441:==================
;442:*/
;443:
;444:static void CG_StartOrbit_f( void ) {
line 447
;445:	char var[MAX_TOKEN_CHARS];
;446:
;447:	trap_Cvar_VariableStringBuffer( "developer", var, sizeof( var ) );
ADDRGP4 $231
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 448
;448:	if ( !atoi(var) ) {
ADDRLP4 0
ARGP4
ADDRLP4 1024
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $232
line 449
;449:		return;
ADDRGP4 $230
JUMPV
LABELV $232
line 451
;450:	}
;451:	if (cg_cameraOrbit.value != 0) {
ADDRGP4 cg_cameraOrbit+8
INDIRF4
CNSTF4 0
EQF4 $234
line 452
;452:		trap_Cvar_Set ("cg_cameraOrbit", "0");
ADDRGP4 $237
ARGP4
ADDRGP4 $238
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 453
;453:		trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $239
ARGP4
ADDRGP4 $238
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 454
;454:	} else {
ADDRGP4 $235
JUMPV
LABELV $234
line 455
;455:		trap_Cvar_Set("cg_cameraOrbit", "5");
ADDRGP4 $237
ARGP4
ADDRGP4 $240
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 456
;456:		trap_Cvar_Set("cg_thirdPerson", "1");
ADDRGP4 $239
ARGP4
ADDRGP4 $241
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 457
;457:		trap_Cvar_Set("cg_thirdPersonAngle", "0");
ADDRGP4 $242
ARGP4
ADDRGP4 $238
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 458
;458:		trap_Cvar_Set("cg_thirdPersonRange", "100");
ADDRGP4 $243
ARGP4
ADDRGP4 $244
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 459
;459:	}
LABELV $235
line 460
;460:}
LABELV $230
endproc CG_StartOrbit_f 1028 12
data
align 4
LABELV commands
address $246
address CG_TestGun_f
address $247
address CG_TestModel_f
address $248
address CG_TestModelNextFrame_f
address $249
address CG_TestModelPrevFrame_f
address $250
address CG_TestModelNextSkin_f
address $251
address CG_TestModelPrevSkin_f
address $252
address CG_Viewpos_f
address $253
address CG_ScoresDown_f
address $254
address CG_ScoresUp_f
address $255
address CG_ZoomDown_f
address $256
address CG_ZoomUp_f
address $257
address CG_SizeUp_f
address $258
address CG_SizeDown_f
address $259
address CG_NextWeapon_f
address $260
address CG_PrevWeapon_f
address $261
address CG_Weapon_f
address $262
address CG_TargetCommand_f
address $263
address CG_TellTarget_f
address $264
address CG_TellAttacker_f
address $265
address CG_WeaponSelectorSelect_f
address $266
address CG_VoiceTellTarget_f
address $267
address CG_VoiceTellAttacker_f
address $268
address CG_NextTeamMember_f
address $269
address CG_PrevTeamMember_f
address $270
address CG_NextOrder_f
address $271
address CG_ConfirmOrder_f
address $272
address CG_DenyOrder_f
address $273
address CG_TaskOffense_f
address $274
address CG_TaskDefense_f
address $275
address CG_TaskPatrol_f
address $276
address CG_TaskCamp_f
address $277
address CG_TaskFollow_f
address $278
address CG_TaskRetrieve_f
address $279
address CG_TaskEscort_f
address $280
address CG_TaskSuicide_f
address $281
address CG_TaskOwnFlag_f
address $282
address CG_TauntKillInsult_f
address $283
address CG_TauntPraise_f
address $284
address CG_TauntTaunt_f
address $285
address CG_TauntDeathInsult_f
address $286
address CG_TauntGauntlet_f
address $287
address CG_StartOrbit_f
address $288
address CG_LoadDeferredPlayers
export CG_ConsoleCommand
code
proc CG_ConsoleCommand 16 8
line 551
;461:
;462:/*
;463:static void CG_Camera_f( void ) {
;464:	char name[1024];
;465:	trap_Argv( 1, name, sizeof(name));
;466:	if (trap_loadCamera(name)) {
;467:		cg.cameraMode = qtrue;
;468:		trap_startCamera(cg.time);
;469:	} else {
;470:		CG_Printf ("Unable to load camera %s\n",name);
;471:	}
;472:}
;473:*/
;474:
;475:
;476:typedef struct {
;477:	const char *cmd;
;478:	void	(*function)(void);
;479:} consoleCommand_t;
;480:
;481:static consoleCommand_t	commands[] = {
;482:	{ "testgun", CG_TestGun_f },
;483:	{ "testmodel", CG_TestModel_f },
;484:	{ "nextframe", CG_TestModelNextFrame_f },
;485:	{ "prevframe", CG_TestModelPrevFrame_f },
;486:	{ "nextskin", CG_TestModelNextSkin_f },
;487:	{ "prevskin", CG_TestModelPrevSkin_f },
;488:	{ "viewpos", CG_Viewpos_f },
;489:	{ "+scores", CG_ScoresDown_f },
;490:	{ "-scores", CG_ScoresUp_f },
;491:	{ "+zoom", CG_ZoomDown_f },
;492:	{ "-zoom", CG_ZoomUp_f },
;493:	{ "sizeup", CG_SizeUp_f },
;494:	{ "sizedown", CG_SizeDown_f },
;495:	{ "weapnext", CG_NextWeapon_f },
;496:	{ "weapprev", CG_PrevWeapon_f },
;497:	{ "weapon", CG_Weapon_f },
;498:	{ "tcmd", CG_TargetCommand_f },
;499:	{ "tell_target", CG_TellTarget_f },
;500:	{ "tell_attacker", CG_TellAttacker_f },
;501:
;502:#ifdef USE_WEAPON_WHEEL
;503:	{ "weapon_select", CG_WeaponSelectorSelect_f },
;504:#endif
;505:
;506:#if defined MISSIONPACK || defined USE_NEOHUD
;507:	{ "vtell_target", CG_VoiceTellTarget_f },
;508:	{ "vtell_attacker", CG_VoiceTellAttacker_f },
;509:
;510:	{ "nextTeamMember", CG_NextTeamMember_f },
;511:	{ "prevTeamMember", CG_PrevTeamMember_f },
;512:	{ "nextOrder", CG_NextOrder_f },
;513:	{ "confirmOrder", CG_ConfirmOrder_f },
;514:	{ "denyOrder", CG_DenyOrder_f },
;515:	{ "taskOffense", CG_TaskOffense_f },
;516:	{ "taskDefense", CG_TaskDefense_f },
;517:	{ "taskPatrol", CG_TaskPatrol_f },
;518:	{ "taskCamp", CG_TaskCamp_f },
;519:	{ "taskFollow", CG_TaskFollow_f },
;520:	{ "taskRetrieve", CG_TaskRetrieve_f },
;521:	{ "taskEscort", CG_TaskEscort_f },
;522:	{ "taskSuicide", CG_TaskSuicide_f },
;523:	{ "taskOwnFlag", CG_TaskOwnFlag_f },
;524:	{ "tauntKillInsult", CG_TauntKillInsult_f },
;525:	{ "tauntPraise", CG_TauntPraise_f },
;526:	{ "tauntTaunt", CG_TauntTaunt_f },
;527:	{ "tauntDeathInsult", CG_TauntDeathInsult_f },
;528:	{ "tauntGauntlet", CG_TauntGauntlet_f },
;529:#endif
;530:#ifdef MISSIONPACK
;531:	{ "loadhud", CG_LoadHud_f },
;532:	{ "spWin", CG_spWin_f },
;533:	{ "spLose", CG_spLose_f },
;534:	{ "scoresDown", CG_scrollScoresDown_f },
;535:	{ "scoresUp", CG_scrollScoresUp_f },
;536:#endif
;537:	{ "startOrbit", CG_StartOrbit_f },
;538:	//{ "camera", CG_Camera_f },
;539:	{ "loaddeferred", CG_LoadDeferredPlayers }	
;540:};
;541:
;542:
;543:/*
;544:=================
;545:CG_ConsoleCommand
;546:
;547:The string has been tokenized and can be retrieved with
;548:Cmd_Argc() / Cmd_Argv()
;549:=================
;550:*/
;551:qboolean CG_ConsoleCommand( void ) {
line 555
;552:	const char	*cmd;
;553:	int		i;
;554:
;555:	cmd = CG_Argv(0);
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 557
;556:
;557:	for ( i = 0 ; i < ARRAY_LEN( commands ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $293
JUMPV
LABELV $290
line 558
;558:		if ( !Q_stricmp( cmd, commands[i].cmd ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $294
line 559
;559:			commands[i].function();
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands+4
ADDP4
INDIRP4
CALLV
pop
line 560
;560:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $289
JUMPV
LABELV $294
line 562
;561:		}
;562:	}
LABELV $291
line 557
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $293
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 43
LTU4 $290
line 564
;563:
;564:	return qfalse;
CNSTI4 0
RETI4
LABELV $289
endproc CG_ConsoleCommand 16 8
export CG_InitConsoleCommands
proc CG_InitConsoleCommands 4 4
line 576
;565:}
;566:
;567:
;568:/*
;569:=================
;570:CG_InitConsoleCommands
;571:
;572:Let the client system know about all of our commands
;573:so it can perform tab completion
;574:=================
;575:*/
;576:void CG_InitConsoleCommands( void ) {
line 579
;577:	int		i;
;578:
;579:	for ( i = 0 ; i < ARRAY_LEN( commands ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $301
JUMPV
LABELV $298
line 580
;580:		trap_AddCommand( commands[i].cmd );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 581
;581:	}
LABELV $299
line 579
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $301
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 43
LTU4 $298
line 587
;582:
;583:	//
;584:	// the game server will interpret these commands, which will be automatically
;585:	// forwarded to the server after they are not recognized locally
;586:	//
;587:	trap_AddCommand ("kill");
ADDRGP4 $302
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 588
;588:	trap_AddCommand ("say");
ADDRGP4 $303
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 589
;589:	trap_AddCommand ("say_team");
ADDRGP4 $304
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 590
;590:	trap_AddCommand ("tell");
ADDRGP4 $305
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 592
;591:#if defined MISSIONPACK || defined USE_NEOHUD
;592:	trap_AddCommand ("vsay");
ADDRGP4 $306
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 593
;593:	trap_AddCommand ("vsay_team");
ADDRGP4 $307
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 594
;594:	trap_AddCommand ("vtell");
ADDRGP4 $308
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 595
;595:	trap_AddCommand ("vtaunt");
ADDRGP4 $309
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 596
;596:	trap_AddCommand ("vosay");
ADDRGP4 $310
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 597
;597:	trap_AddCommand ("vosay_team");
ADDRGP4 $311
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 598
;598:	trap_AddCommand ("votell");
ADDRGP4 $312
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 600
;599:#endif
;600:	trap_AddCommand ("give");
ADDRGP4 $313
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 601
;601:	trap_AddCommand ("god");
ADDRGP4 $314
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 602
;602:	trap_AddCommand ("notarget");
ADDRGP4 $315
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 603
;603:	trap_AddCommand ("noclip");
ADDRGP4 $316
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 604
;604:	trap_AddCommand ("team");
ADDRGP4 $317
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 605
;605:	trap_AddCommand ("follow");
ADDRGP4 $318
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 606
;606:	trap_AddCommand ("levelshot");
ADDRGP4 $319
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 607
;607:	trap_AddCommand ("addbot");
ADDRGP4 $320
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 608
;608:	trap_AddCommand ("setviewpos");
ADDRGP4 $321
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 609
;609:	trap_AddCommand ("callvote");
ADDRGP4 $322
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 610
;610:	trap_AddCommand ("vote");
ADDRGP4 $323
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 611
;611:	trap_AddCommand ("callteamvote");
ADDRGP4 $324
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 612
;612:	trap_AddCommand ("teamvote");
ADDRGP4 $325
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 613
;613:	trap_AddCommand ("stats");
ADDRGP4 $326
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 614
;614:	trap_AddCommand ("teamtask");
ADDRGP4 $327
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 615
;615:	trap_AddCommand ("loaddefered");	// spelled wrong, but not changing for demo
ADDRGP4 $328
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 616
;616:}
LABELV $297
endproc CG_InitConsoleCommands 4 4
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
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
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
LABELV $328
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $327
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
LABELV $326
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $325
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
LABELV $324
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
LABELV $323
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $322
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
LABELV $321
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
LABELV $320
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $319
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
LABELV $318
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $317
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $316
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $315
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
LABELV $314
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $313
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $312
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $311
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
LABELV $310
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $309
byte 1 118
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $308
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $307
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
LABELV $306
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $305
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $304
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
LABELV $303
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $302
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $288
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $287
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $286
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 71
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $285
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 73
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $284
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 84
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $283
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 80
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $282
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 73
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $281
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 79
byte 1 119
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $280
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 83
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $279
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 69
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $278
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 82
byte 1 101
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $277
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $276
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 67
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $275
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 80
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $274
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $273
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 79
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $272
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $271
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 114
byte 1 109
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $270
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $269
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 77
byte 1 101
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $268
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 77
byte 1 101
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $267
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $266
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $265
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $264
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $263
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $262
byte 1 116
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $261
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $260
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $259
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $258
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $257
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $256
byte 1 45
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $255
byte 1 43
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $254
byte 1 45
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $253
byte 1 43
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $252
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $251
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $250
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $249
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $248
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $247
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $246
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $244
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $243
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 82
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $242
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 65
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $241
byte 1 49
byte 1 0
align 1
LABELV $240
byte 1 53
byte 1 0
align 1
LABELV $239
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $238
byte 1 48
byte 1 0
align 1
LABELV $237
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $231
byte 1 100
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $229
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $225
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 32
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
byte 1 10
byte 1 0
align 1
LABELV $223
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 32
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
byte 1 10
byte 1 0
align 1
LABELV $221
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $219
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 32
byte 1 112
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $217
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 32
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
byte 1 10
byte 1 0
align 1
LABELV $215
byte 1 105
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $213
byte 1 111
byte 1 110
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $211
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $209
byte 1 111
byte 1 110
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $207
byte 1 111
byte 1 110
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $205
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
LABELV $203
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
LABELV $201
byte 1 111
byte 1 110
byte 1 111
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $200
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
LABELV $199
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $189
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 54
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 59
byte 1 32
byte 1 45
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 54
byte 1 0
align 1
LABELV $188
byte 1 110
byte 1 111
byte 1 0
align 1
LABELV $183
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $178
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 53
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 59
byte 1 32
byte 1 45
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 53
byte 1 0
align 1
LABELV $177
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $175
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $147
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $140
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $117
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $98
byte 1 40
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 41
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $93
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $92
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $90
byte 1 103
byte 1 99
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
