data
export forceModelModificationCount
align 4
LABELV forceModelModificationCount
byte 4 -1
export enemyModelModificationCount
align 4
LABELV enemyModelModificationCount
byte 4 -1
export enemyColorsModificationCount
align 4
LABELV enemyColorsModificationCount
byte 4 -1
export teamModelModificationCount
align 4
LABELV teamModelModificationCount
byte 4 -1
export teamColorsModificationCount
align 4
LABELV teamColorsModificationCount
byte 4 -1
export intShaderTime
align 4
LABELV intShaderTime
byte 4 0
export linearLight
align 4
LABELV linearLight
byte 4 0
export vmMain
code
proc vmMain 16 12
file "..\..\..\..\code\cgame\cg_main.c"
line 51
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_main.c -- initialization and primary entry point for cgame
;4:#include "cg_local.h"
;5:
;6:#ifdef MISSIONPACK
;7:#include "../ui/ui_shared.h"
;8:// display context for new ui stuff
;9:displayContextDef_t cgDC;
;10:#endif
;11:
;12:#ifdef USE_NATIVE_HACK
;13:#include "../../../Quake3e-master/code/vrmod/VRMOD_input.h"
;14:vr_clientinfo_t *vrinfo;
;15:#endif
;16:
;17:int forceModelModificationCount = -1;
;18:int enemyModelModificationCount  = -1;
;19:int	enemyColorsModificationCount = -1;
;20:int teamModelModificationCount  = -1;
;21:int	teamColorsModificationCount = -1;
;22:
;23:void CG_Init( int serverMessageNum, int serverCommandSequence, int clientNum );
;24:void CG_Shutdown( void );
;25:
;26:// extension interface
;27:qboolean intShaderTime = qfalse;
;28:qboolean linearLight = qfalse;
;29:
;30:#ifdef Q3_VM
;31:qboolean (*trap_GetValue)( char *value, int valueSize, const char *key );
;32:void (*trap_R_AddRefEntityToScene2)( const refEntity_t *re );
;33:void (*trap_R_AddLinearLightToScene)( const vec3_t start, const vec3_t end, float intensity, float r, float g, float b );
;34:#else
;35:int dll_com_trapGetValue;
;36:int dll_trap_R_AddRefEntityToScene2;
;37:int dll_trap_R_AddLinearLightToScene;
;38:#endif
;39:
;40:/*
;41:================
;42:vmMain
;43:
;44:This is the only way control passes into the module.
;45:This must be the very first function compiled into the .q3vm file
;46:================
;47:*/
;48:#ifdef USE_NATIVE_HACK
;49:DLLEXPORT intptr_t vmMain(int command, int arg0, int arg1, int arg2, int arg3, int arg4) {
;50:#else
;51:DLLEXPORT intptr_t vmMain( int command, int arg0, int arg1, int arg2 ) {
line 53
;52:#endif
;53:	switch ( command ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $88
ADDRLP4 0
INDIRI4
CNSTI4 8
GTI4 $88
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $100
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $100
address $90
address $91
address $92
address $93
address $94
address $95
address $96
address $97
address $98
code
LABELV $90
line 63
;54:	case CG_INIT:
;55:#ifdef USE_NATIVE_HACK
;56:	{
;57:		int ptr[2];
;58:		ptr[0] = arg3;
;59:		ptr[1] = arg4;
;60:		vrinfo = (vr_clientinfo_t *)(*(long *)(ptr));
;61:	}
;62:#endif
;63:		CG_Init( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Init
CALLV
pop
line 64
;64:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $87
JUMPV
LABELV $91
line 66
;65:	case CG_SHUTDOWN:
;66:		CG_Shutdown();
ADDRGP4 CG_Shutdown
CALLV
pop
line 67
;67:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $87
JUMPV
LABELV $92
line 69
;68:	case CG_CONSOLE_COMMAND:
;69:		return CG_ConsoleCommand();
ADDRLP4 4
ADDRGP4 CG_ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $87
JUMPV
LABELV $93
line 71
;70:	case CG_DRAW_ACTIVE_FRAME:
;71:		CG_DrawActiveFrame( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawActiveFrame
CALLV
pop
line 72
;72:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $87
JUMPV
LABELV $94
line 74
;73:	case CG_CROSSHAIR_PLAYER:
;74:		return CG_CrosshairPlayer();
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $87
JUMPV
LABELV $95
line 76
;75:	case CG_LAST_ATTACKER:
;76:		return CG_LastAttacker();
ADDRLP4 12
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $87
JUMPV
LABELV $96
line 78
;77:	case CG_KEY_EVENT:
;78:		CG_KeyEvent(arg0, arg1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_KeyEvent
CALLV
pop
line 79
;79:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $87
JUMPV
LABELV $97
line 85
;80:	case CG_MOUSE_EVENT:
;81:#ifdef MISSIONPACK
;82:		cgDC.cursorx = cgs.cursorX;
;83:		cgDC.cursory = cgs.cursorY;
;84:#endif
;85:		CG_MouseEvent(arg0, arg1, arg2); // arg2 : cursor z intersection point
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_MouseEvent
CALLV
pop
line 86
;86:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $87
JUMPV
LABELV $98
line 88
;87:	case CG_EVENT_HANDLING:
;88:		CG_EventHandling(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 89
;89:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $87
JUMPV
LABELV $88
line 91
;90:	default:
;91:		CG_Error( "vmMain: unknown command %i", command );
ADDRGP4 $99
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 92
;92:		break;
LABELV $89
line 94
;93:	}
;94:	return -1;
CNSTI4 -1
RETI4
LABELV $87
endproc vmMain 16 12
data
align 4
LABELV cvarTable
address cg_playerShadow
address $102
address $103
byte 4 1
address cg_fragMessage
address $104
address $103
byte 4 1
address cg_firstPersonBodyScale
address $105
address $106
byte 4 1
address cg_debugWeaponAiming
address $107
address $106
byte 4 1
address cg_weaponSelectorSimple2DIcons
address $108
address $106
byte 4 1
address cg_ignore
address $109
address $106
byte 4 0
address cg_autoswitch
address $110
address $103
byte 4 1
address cg_drawGun
address $111
address $103
byte 4 1
address cg_zoomFov
address $112
address $113
byte 4 1
address cg_fov
address $114
address $115
byte 4 1
address cg_viewsize
address $116
address $117
byte 4 1
address cg_shadows
address $118
address $103
byte 4 1
address cg_gibs
address $119
address $103
byte 4 1
address cg_draw2D
address $120
address $103
byte 4 1
address cg_drawStatus
address $121
address $103
byte 4 1
address cg_drawTimer
address $122
address $106
byte 4 1
address cg_drawFPS
address $123
address $106
byte 4 1
address cg_drawSnapshot
address $124
address $106
byte 4 1
address cg_draw3dIcons
address $125
address $103
byte 4 1
address cg_drawIcons
address $126
address $103
byte 4 1
address cg_drawAmmoWarning
address $127
address $103
byte 4 1
address cg_drawAttacker
address $128
address $103
byte 4 1
address cg_drawSpeed
address $129
address $106
byte 4 1
address cg_drawCrosshair
address $130
address $131
byte 4 1
address cg_drawCrosshairNames
address $132
address $103
byte 4 1
address cg_drawRewards
address $133
address $103
byte 4 1
address cg_drawWeaponSelect
address $134
address $103
byte 4 1
address cg_crosshairSize
address $135
address $136
byte 4 1
address cg_crosshairHealth
address $137
address $103
byte 4 1
address cg_crosshairX
address $138
address $106
byte 4 1
address cg_crosshairY
address $139
address $106
byte 4 1
address cg_brassTime
address $140
address $141
byte 4 1
address cg_simpleItems
address $142
address $106
byte 4 1
address cg_addMarks
address $143
address $103
byte 4 1
address cg_lagometer
address $144
address $103
byte 4 1
address cg_drawPing
address $145
address $103
byte 4 1
address cg_railTrailTime
address $146
address $147
byte 4 1
address cg_railTrailRadius
address $148
address $106
byte 4 1
address cg_gun_x
address $149
address $106
byte 4 1
address cg_gun_y
address $150
address $106
byte 4 1
address cg_gun_z
address $151
address $106
byte 4 1
address cg_centertime
address $152
address $153
byte 4 512
address cg_runpitch
address $154
address $155
byte 4 1
address cg_runroll
address $156
address $157
byte 4 1
address cg_bobup
address $158
address $157
byte 4 1
address cg_bobpitch
address $159
address $155
byte 4 1
address cg_bobroll
address $160
address $155
byte 4 1
address cg_swingSpeed
address $161
address $162
byte 4 512
address cg_animSpeed
address $163
address $103
byte 4 512
address cg_debugAnim
address $164
address $106
byte 4 512
address cg_debugPosition
address $165
address $106
byte 4 512
address cg_debugEvents
address $166
address $106
byte 4 512
address cg_errorDecay
address $167
address $117
byte 4 0
address cg_nopredict
address $168
address $106
byte 4 0
address cg_noPlayerAnims
address $169
address $106
byte 4 512
address cg_showmiss
address $170
address $106
byte 4 0
address cg_footsteps
address $171
address $103
byte 4 512
address cg_tracerChance
address $172
address $173
byte 4 512
address cg_tracerWidth
address $174
address $103
byte 4 512
address cg_tracerLength
address $175
address $117
byte 4 512
address cg_thirdPersonRange
address $176
address $177
byte 4 512
address cg_thirdPersonAngle
address $178
address $106
byte 4 512
address cg_thirdPerson
address $179
address $106
byte 4 0
address laserBeam
address $180
address $106
byte 4 2
address laserBeamStabilized
address $181
address $103
byte 4 2
address showVirtualKeyboard
address $182
address $106
byte 4 2
address VR_hide_torso
address $183
address $106
byte 4 2
address VR_angle_hide_torso
address $184
address $185
byte 4 2
address laserBeamRGBA
address $186
address $187
byte 4 2
address cg_teamChatTime
address $188
address $189
byte 4 1
address cg_teamChatHeight
address $190
address $106
byte 4 1
address cg_forceModel
address $191
address $106
byte 4 1
address cg_predictItems
address $192
address $103
byte 4 1
address cg_deferPlayers
address $193
address $103
byte 4 1
address cg_drawTeamOverlay
address $194
address $106
byte 4 1
address cg_teamOverlayUserinfo
address $195
address $106
byte 4 66
address cg_stats
address $196
address $106
byte 4 0
address cg_drawFriend
address $197
address $103
byte 4 1
address cg_teamChatsOnly
address $198
address $106
byte 4 1
address cg_noVoiceChats
address $199
address $106
byte 4 1
address cg_noVoiceText
address $200
address $106
byte 4 1
address cg_buildScript
address $201
address $106
byte 4 0
address cg_paused
address $202
address $106
byte 4 64
address cg_blood
address $203
address $103
byte 4 1
address cg_currentSelectedPlayer
address $204
address $106
byte 4 1
address cg_hudFiles
address $205
address $206
byte 4 1
address cg_cameraOrbit
address $207
address $106
byte 4 512
address cg_cameraOrbitDelay
address $208
address $209
byte 4 1
address cg_timescaleFadeEnd
address $210
address $103
byte 4 0
address cg_timescaleFadeSpeed
address $211
address $106
byte 4 0
address cg_timescale
address $212
address $103
byte 4 0
address cg_scorePlum
address $213
address $103
byte 4 3
address cg_itemTimer
address $214
address $103
byte 4 4
address cg_smoothClients
address $215
address $106
byte 4 3
address cg_cameraMode
address $216
address $106
byte 4 512
address cg_noTaunt
address $217
address $106
byte 4 1
address cg_noProjectileTrail
address $218
address $106
byte 4 1
address cg_smallFont
address $219
address $220
byte 4 1
address cg_bigFont
address $221
address $173
byte 4 1
address cg_oldRail
address $222
address $103
byte 4 1
address cg_oldRocket
address $223
address $103
byte 4 1
address cg_oldPlasma
address $224
address $103
byte 4 1
address cg_trueLightning
address $225
address $226
byte 4 1
address cg_hitSounds
address $227
address $106
byte 4 1
address cg_enemyModel
address $228
address $229
byte 4 1
address cg_enemyColors
address $230
address $229
byte 4 1
address cg_teamModel
address $231
address $229
byte 4 1
address cg_teamColors
address $232
address $229
byte 4 1
address cg_deadBodyDarken
address $233
address $103
byte 4 1
address cg_fovAdjust
address $234
address $106
byte 4 1
address cg_followKiller
address $235
address $106
byte 4 1
address menu_distance
address $236
address $237
byte 4 1
address vr_controller_type
address $238
address $106
byte 4 1
export CG_RegisterCvars
code
proc CG_RegisterCvars 1036 16
line 448
;95:}
;96:
;97:
;98:cg_t				cg;
;99:cgs_t				cgs;
;100:centity_t			cg_entities[MAX_GENTITIES];
;101:weaponInfo_t		cg_weapons[MAX_WEAPONS];
;102:itemInfo_t			cg_items[MAX_ITEMS];
;103:
;104:#ifdef USE_VR
;105:vmCvar_t	cg_weaponbob;
;106:vmCvar_t	cg_playerShadow;
;107:vmCvar_t	cg_fragMessage;
;108:vmCvar_t	cg_firstPersonBodyScale;
;109:#endif
;110:
;111:#ifdef USE_WEAPON_WHEEL
;112:vmCvar_t	cg_debugWeaponAiming;
;113:vmCvar_t	cg_weaponSelectorSimple2DIcons;
;114:#endif
;115:
;116:#ifdef USE_MEGAGIBS
;117:vmCvar_t	cg_megagibs;
;118:#endif
;119:
;120:vmCvar_t	cg_railTrailTime;
;121:vmCvar_t	cg_railTrailRadius;
;122:vmCvar_t	cg_centertime;
;123:vmCvar_t	cg_runpitch;
;124:vmCvar_t	cg_runroll;
;125:vmCvar_t	cg_bobup;
;126:vmCvar_t	cg_bobpitch;
;127:vmCvar_t	cg_bobroll;
;128:vmCvar_t	cg_swingSpeed;
;129:vmCvar_t	cg_shadows;
;130:vmCvar_t	cg_gibs;
;131:vmCvar_t	cg_drawTimer;
;132:vmCvar_t	cg_drawFPS;
;133:vmCvar_t	cg_drawSnapshot;
;134:vmCvar_t	cg_draw3dIcons;
;135:vmCvar_t	cg_drawIcons;
;136:vmCvar_t	cg_drawAmmoWarning;
;137:vmCvar_t	cg_drawCrosshair;
;138:vmCvar_t	cg_drawCrosshairNames;
;139:vmCvar_t	cg_drawRewards;
;140:vmCvar_t	cg_drawWeaponSelect;
;141:vmCvar_t	cg_crosshairSize;
;142:vmCvar_t	cg_crosshairX;
;143:vmCvar_t	cg_crosshairY;
;144:vmCvar_t	cg_crosshairHealth;
;145:vmCvar_t	cg_draw2D;
;146:vmCvar_t	cg_drawStatus;
;147:vmCvar_t	cg_animSpeed;
;148:vmCvar_t	cg_debugAnim;
;149:vmCvar_t	cg_debugPosition;
;150:vmCvar_t	cg_debugEvents;
;151:vmCvar_t	cg_errorDecay;
;152:vmCvar_t	cg_nopredict;
;153:vmCvar_t	cg_noPlayerAnims;
;154:vmCvar_t	cg_showmiss;
;155:vmCvar_t	cg_footsteps;
;156:vmCvar_t	cg_addMarks;
;157:vmCvar_t	cg_brassTime;
;158:vmCvar_t	cg_viewsize;
;159:vmCvar_t	cg_drawGun;
;160:vmCvar_t	cg_gun_frame;
;161:vmCvar_t	cg_gun_x;
;162:vmCvar_t	cg_gun_y;
;163:vmCvar_t	cg_gun_z;
;164:vmCvar_t	cg_tracerChance;
;165:vmCvar_t	cg_tracerWidth;
;166:vmCvar_t	cg_tracerLength;
;167:vmCvar_t	cg_autoswitch;
;168:vmCvar_t	cg_ignore;
;169:vmCvar_t	cg_simpleItems;
;170:vmCvar_t	cg_fov;
;171:vmCvar_t	cg_zoomFov;
;172:vmCvar_t	cg_thirdPerson;
;173:vmCvar_t	cg_thirdPersonRange;
;174:vmCvar_t	cg_thirdPersonAngle;
;175:vmCvar_t	cg_lagometer;
;176:vmCvar_t	cg_drawPing;
;177:vmCvar_t	cg_drawAttacker;
;178:vmCvar_t	cg_drawSpeed;
;179:vmCvar_t 	cg_teamChatTime;
;180:vmCvar_t 	cg_teamChatHeight;
;181:vmCvar_t 	cg_stats;
;182:vmCvar_t 	cg_buildScript;
;183:vmCvar_t 	cg_forceModel;
;184:vmCvar_t	cg_paused;
;185:vmCvar_t	cg_blood;
;186:vmCvar_t	cg_predictItems;
;187:vmCvar_t	cg_deferPlayers;
;188:vmCvar_t	cg_drawTeamOverlay;
;189:vmCvar_t	cg_teamOverlayUserinfo;
;190:vmCvar_t	cg_drawFriend;
;191:vmCvar_t	cg_teamChatsOnly;
;192:#if defined MISSIONPACK || defined USE_NEOHUD
;193:vmCvar_t	cg_noVoiceChats;
;194:vmCvar_t	cg_noVoiceText;
;195:#endif
;196:vmCvar_t	cg_hudFiles;
;197:vmCvar_t 	cg_scorePlum;
;198:
;199:#ifdef USE_ITEM_TIMERS
;200:vmCvar_t 	cg_itemTimer;
;201:#endif
;202:
;203:vmCvar_t 	cg_smoothClients;
;204:vmCvar_t	cg_cameraMode;
;205:vmCvar_t	cg_cameraOrbit;
;206:vmCvar_t	cg_cameraOrbitDelay;
;207:vmCvar_t	cg_timescaleFadeEnd;
;208:vmCvar_t	cg_timescaleFadeSpeed;
;209:vmCvar_t	cg_timescale;
;210:vmCvar_t	cg_smallFont;
;211:vmCvar_t	cg_bigFont;
;212:vmCvar_t	cg_noTaunt;
;213:vmCvar_t	cg_noProjectileTrail;
;214:vmCvar_t	cg_oldRail;
;215:vmCvar_t	cg_oldRocket;
;216:vmCvar_t	cg_oldPlasma;
;217:vmCvar_t	cg_trueLightning;
;218:
;219:#if defined MISSIONPACK || defined USE_NEOHUD
;220:vmCvar_t	cg_currentSelectedPlayer;
;221:#endif
;222:#ifdef MISSIONPACK
;223:vmCvar_t 	cg_redTeamName;
;224:vmCvar_t 	cg_blueTeamName;
;225:
;226:vmCvar_t	cg_currentSelectedPlayerName;
;227:vmCvar_t	cg_singlePlayer;
;228:vmCvar_t	cg_enableDust;
;229:vmCvar_t	cg_enableBreath;
;230:vmCvar_t	cg_singlePlayerActive;
;231:vmCvar_t	cg_recordSPDemo;
;232:vmCvar_t	cg_recordSPDemoName;
;233:vmCvar_t	cg_obeliskRespawnDelay;
;234:#endif
;235:
;236:#ifdef USE_GRAPPLING_HOOK
;237://vmCvar_t	cg_cyclegrapple;//GUNNM TODO ?
;238:#endif
;239:#ifdef USE_VIRTUAL_KEYBOARD
;240:vmCvar_t	showVirtualKeyboard;
;241:#endif
;242:#ifdef USE_VR
;243:vmCvar_t	VR_hide_torso;
;244:vmCvar_t	VR_angle_hide_torso;
;245:#endif
;246:#ifdef USE_VIRTUAL_MENU
;247:vmCvar_t 	menu_distance;
;248:#endif
;249:
;250:#ifdef USE_LASER_SIGHT
;251:vmCvar_t	laserBeam;
;252:vmCvar_t	laserBeamStabilized;
;253:vmCvar_t 	laserBeamRGBA;
;254:#endif
;255:
;256:vmCvar_t 	vr_controller_type;
;257:
;258:vmCvar_t	cg_hitSounds;
;259:
;260:vmCvar_t	cg_enemyModel;
;261:vmCvar_t	cg_enemyColors;
;262:vmCvar_t	cg_teamModel;
;263:vmCvar_t	cg_teamColors;
;264:
;265:vmCvar_t	cg_deadBodyDarken;
;266:vmCvar_t	cg_fovAdjust;
;267:vmCvar_t	cg_followKiller;
;268:
;269:typedef struct {
;270:	vmCvar_t	*vmCvar;
;271:	const char	*cvarName;
;272:	const char	*defaultString;
;273:	const int	cvarFlags;
;274:} cvarTable_t;
;275:
;276:static const cvarTable_t cvarTable[] = {
;277:
;278:#ifdef USE_VR
;279:	{ &cg_playerShadow, "cg_playerShadow", "1", CVAR_ARCHIVE  },
;280:	{ &cg_fragMessage, "cg_fragMessage", "1", CVAR_ARCHIVE },
;281:	{ &cg_firstPersonBodyScale, "cg_firstPersonBodyScale", "0", CVAR_ARCHIVE },
;282:#endif
;283:
;284:#ifdef USE_WEAPON_WHEEL
;285:	{ &cg_debugWeaponAiming, "cg_debugWeaponAiming", "0", CVAR_ARCHIVE  },
;286:	{ &cg_weaponSelectorSimple2DIcons, "cg_weaponSelectorSimple2DIcons", "0", CVAR_ARCHIVE  },
;287:#endif
;288:
;289:#ifdef USE_MEGAGIBS
;290:	{ &cg_megagibs, "cg_megagibs", "0", CVAR_ARCHIVE  },
;291:#endif
;292:
;293:	{ &cg_ignore, "cg_ignore", "0", 0 }, // used for debugging
;294:	{ &cg_autoswitch, "cg_autoswitch", "1", CVAR_ARCHIVE },
;295:	{ &cg_drawGun, "cg_drawGun", "1", CVAR_ARCHIVE },
;296:	{ &cg_zoomFov, "cg_zoomfov", "22.5", CVAR_ARCHIVE },
;297:	{ &cg_fov, "cg_fov", "90", CVAR_ARCHIVE },
;298:	{ &cg_viewsize, "cg_viewsize", "100", CVAR_ARCHIVE },
;299:	{ &cg_shadows, "cg_shadows", "1", CVAR_ARCHIVE },
;300:	{ &cg_gibs, "cg_gibs", "1", CVAR_ARCHIVE },
;301:	{ &cg_draw2D, "cg_draw2D", "1", CVAR_ARCHIVE },
;302:	{ &cg_drawStatus, "cg_drawStatus", "1", CVAR_ARCHIVE },
;303:	{ &cg_drawTimer, "cg_drawTimer", "0", CVAR_ARCHIVE },
;304:	{ &cg_drawFPS, "cg_drawFPS", "0", CVAR_ARCHIVE },
;305:	{ &cg_drawSnapshot, "cg_drawSnapshot", "0", CVAR_ARCHIVE },
;306:	{ &cg_draw3dIcons, "cg_draw3dIcons", "1", CVAR_ARCHIVE },
;307:	{ &cg_drawIcons, "cg_drawIcons", "1", CVAR_ARCHIVE },
;308:	{ &cg_drawAmmoWarning, "cg_drawAmmoWarning", "1", CVAR_ARCHIVE },
;309:	{ &cg_drawAttacker, "cg_drawAttacker", "1", CVAR_ARCHIVE },
;310:	{ &cg_drawSpeed, "cg_drawSpeed", "0", CVAR_ARCHIVE },
;311:	{ &cg_drawCrosshair, "cg_drawCrosshair", "4", CVAR_ARCHIVE },
;312:	{ &cg_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE },
;313:	{ &cg_drawRewards, "cg_drawRewards", "1", CVAR_ARCHIVE },
;314:	{ &cg_drawWeaponSelect, "cg_drawWeaponSelect", "1", CVAR_ARCHIVE },
;315:#ifdef USE_VR
;316:	{ &cg_crosshairSize, "cg_crosshairSize", "16", CVAR_ARCHIVE },
;317:#else
;318:	{ &cg_crosshairSize, "cg_crosshairSize", "24", CVAR_ARCHIVE },
;319:#endif
;320:	{ &cg_crosshairHealth, "cg_crosshairHealth", "1", CVAR_ARCHIVE },
;321:	{ &cg_crosshairX, "cg_crosshairX", "0", CVAR_ARCHIVE },
;322:	{ &cg_crosshairY, "cg_crosshairY", "0", CVAR_ARCHIVE },
;323:	{ &cg_brassTime, "cg_brassTime", "2500", CVAR_ARCHIVE },
;324:	{ &cg_simpleItems, "cg_simpleItems", "0", CVAR_ARCHIVE },
;325:	{ &cg_addMarks, "cg_marks", "1", CVAR_ARCHIVE },
;326:	{ &cg_lagometer, "cg_lagometer", "1", CVAR_ARCHIVE },
;327:#ifdef USE_NEOHUD
;328:	{ &cg_drawPing, "cg_drawPing", "1", CVAR_ARCHIVE },
;329:#endif
;330:	{ &cg_railTrailTime, "cg_railTrailTime", "400", CVAR_ARCHIVE },
;331:	{ &cg_railTrailRadius, "cg_railTrailRadius", "0", CVAR_ARCHIVE },
;332:	{ &cg_gun_x, "cg_gunX", "0", CVAR_ARCHIVE },
;333:	{ &cg_gun_y, "cg_gunY", "0", CVAR_ARCHIVE },
;334:	{ &cg_gun_z, "cg_gunZ", "0", CVAR_ARCHIVE },
;335:	{ &cg_centertime, "cg_centertime", "3", CVAR_CHEAT },
;336:	{ &cg_runpitch, "cg_runpitch", "0.002", CVAR_ARCHIVE},
;337:	{ &cg_runroll, "cg_runroll", "0.005", CVAR_ARCHIVE },
;338:	{ &cg_bobup , "cg_bobup", "0.005", CVAR_ARCHIVE },
;339:	{ &cg_bobpitch, "cg_bobpitch", "0.002", CVAR_ARCHIVE },
;340:	{ &cg_bobroll, "cg_bobroll", "0.002", CVAR_ARCHIVE },
;341:	{ &cg_swingSpeed, "cg_swingSpeed", "0.3", CVAR_CHEAT },
;342:	{ &cg_animSpeed, "cg_animspeed", "1", CVAR_CHEAT },
;343:	{ &cg_debugAnim, "cg_debuganim", "0", CVAR_CHEAT },
;344:	{ &cg_debugPosition, "cg_debugposition", "0", CVAR_CHEAT },
;345:	{ &cg_debugEvents, "cg_debugevents", "0", CVAR_CHEAT },
;346:	{ &cg_errorDecay, "cg_errordecay", "100", 0 },
;347:	{ &cg_nopredict, "cg_nopredict", "0", 0 },
;348:	{ &cg_noPlayerAnims, "cg_noplayeranims", "0", CVAR_CHEAT },
;349:	{ &cg_showmiss, "cg_showmiss", "0", 0 },
;350:	{ &cg_footsteps, "cg_footsteps", "1", CVAR_CHEAT },
;351:	{ &cg_tracerChance, "cg_tracerchance", "0.4", CVAR_CHEAT },
;352:	{ &cg_tracerWidth, "cg_tracerwidth", "1", CVAR_CHEAT },
;353:	{ &cg_tracerLength, "cg_tracerlength", "100", CVAR_CHEAT },
;354:	{ &cg_thirdPersonRange, "cg_thirdPersonRange", "40", CVAR_CHEAT },
;355:	{ &cg_thirdPersonAngle, "cg_thirdPersonAngle", "0", CVAR_CHEAT },
;356:	{ &cg_thirdPerson, "cg_thirdPerson", "0", 0 },
;357:
;358:	{ &laserBeam, "laserBeam", "0", CVAR_USERINFO },
;359:
;360:	{ &laserBeamStabilized, "laserBeamStabilized", "1", CVAR_USERINFO },
;361:	{ &showVirtualKeyboard, "showVirtualKeyboard", "0", CVAR_USERINFO },
;362:
;363:	{ &VR_hide_torso, "VR_hide_torso", "0", CVAR_USERINFO },
;364:	{ &VR_angle_hide_torso, "VR_angle_hide_torso", "5", CVAR_USERINFO },
;365:	{ &laserBeamRGBA, "laserBeamRGBA", "FFC0C0C0", CVAR_USERINFO },
;366:	{ &cg_teamChatTime, "cg_teamChatTime", "3000", CVAR_ARCHIVE },
;367:	{ &cg_teamChatHeight, "cg_teamChatHeight", "0", CVAR_ARCHIVE },
;368:	{ &cg_forceModel, "cg_forceModel", "0", CVAR_ARCHIVE },
;369:	{ &cg_predictItems, "cg_predictItems", "1", CVAR_ARCHIVE },
;370:#ifdef MISSIONPACK
;371:	{ &cg_deferPlayers, "cg_deferPlayers", "0", CVAR_ARCHIVE },
;372:#else
;373:	{ &cg_deferPlayers, "cg_deferPlayers", "1", CVAR_ARCHIVE },
;374:#endif
;375:	{ &cg_drawTeamOverlay, "cg_drawTeamOverlay", "0", CVAR_ARCHIVE },
;376:	{ &cg_teamOverlayUserinfo, "teamoverlay", "0", CVAR_ROM | CVAR_USERINFO },
;377:	{ &cg_stats, "cg_stats", "0", 0 },
;378:	{ &cg_drawFriend, "cg_drawFriend", "1", CVAR_ARCHIVE },
;379:	{ &cg_teamChatsOnly, "cg_teamChatsOnly", "0", CVAR_ARCHIVE },
;380:#if defined MISSIONPACK || defined USE_NEOHUD
;381:	{ &cg_noVoiceChats, "cg_noVoiceChats", "0", CVAR_ARCHIVE },
;382:	{ &cg_noVoiceText, "cg_noVoiceText", "0", CVAR_ARCHIVE },
;383:#endif
;384:	// the following variables are created in other parts of the system,
;385:	// but we also reference them here
;386:	{ &cg_buildScript, "com_buildScript", "0", 0 },	// force loading of all possible data amd error on failures
;387:	{ &cg_paused, "cl_paused", "0", CVAR_ROM },
;388:	{ &cg_blood, "com_blood", "1", CVAR_ARCHIVE },
;389:#ifdef USE_GRAPPLING_HOOK
;390://	{ &cg_cyclegrapple, "cg_cyclegrapple", "1", CVAR_ARCHIVE},//GUNNM TODO
;391:#endif
;392:#if defined MISSIONPACK || defined USE_NEOHUD
;393:	{ &cg_currentSelectedPlayer, "cg_currentSelectedPlayer", "0", CVAR_ARCHIVE},
;394:	{ &cg_hudFiles, "cg_hudFiles", DEFAULT_HUD, CVAR_ARCHIVE },
;395:#endif
;396:#ifdef MISSIONPACK
;397:	{ &cg_redTeamName, "g_redteam", DEFAULT_REDTEAM_NAME, CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO },
;398:	{ &cg_blueTeamName, "g_blueteam", DEFAULT_BLUETEAM_NAME, CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO },
;399:	{ &cg_currentSelectedPlayerName, "cg_currentSelectedPlayerName", "", CVAR_ARCHIVE},
;400:	{ &cg_singlePlayer, "ui_singlePlayerActive", "0", CVAR_USERINFO},
;401:	{ &cg_enableDust, "g_enableDust", "0", CVAR_SERVERINFO},
;402:	{ &cg_enableBreath, "g_enableBreath", "0", CVAR_SERVERINFO},
;403:	{ &cg_singlePlayerActive, "ui_singlePlayerActive", "0", CVAR_USERINFO},
;404:	{ &cg_recordSPDemo, "ui_recordSPDemo", "0", CVAR_ARCHIVE},
;405:	{ &cg_recordSPDemoName, "ui_recordSPDemoName", "", CVAR_ARCHIVE},
;406:	{ &cg_obeliskRespawnDelay, "g_obeliskRespawnDelay", "10", CVAR_SERVERINFO},
;407:	{ &cg_hudFiles, "cg_hudFiles", "ui/hud.txt", CVAR_ARCHIVE},
;408:#endif
;409:	{ &cg_cameraOrbit, "cg_cameraOrbit", "0", CVAR_CHEAT},
;410:	{ &cg_cameraOrbitDelay, "cg_cameraOrbitDelay", "50", CVAR_ARCHIVE},
;411:	{ &cg_timescaleFadeEnd, "cg_timescaleFadeEnd", "1", 0},
;412:	{ &cg_timescaleFadeSpeed, "cg_timescaleFadeSpeed", "0", 0},
;413:	{ &cg_timescale, "timescale", "1", 0},
;414:	{ &cg_scorePlum, "cg_scorePlums", "1", CVAR_USERINFO | CVAR_ARCHIVE},
;415:#ifdef USE_ITEM_TIMERS
;416:	{ &cg_itemTimer, "g_itemTimer", "1", CVAR_SERVERINFO },
;417:#endif
;418:	{ &cg_smoothClients, "cg_smoothClients", "0", CVAR_USERINFO | CVAR_ARCHIVE},
;419:	{ &cg_cameraMode, "com_cameraMode", "0", CVAR_CHEAT},
;420:	{ &cg_noTaunt, "cg_noTaunt", "0", CVAR_ARCHIVE},
;421:	{ &cg_noProjectileTrail, "cg_noProjectileTrail", "0", CVAR_ARCHIVE},
;422:	{ &cg_smallFont, "ui_smallFont", "0.25", CVAR_ARCHIVE},
;423:	{ &cg_bigFont, "ui_bigFont", "0.4", CVAR_ARCHIVE},
;424:	{ &cg_oldRail, "cg_oldRail", "1", CVAR_ARCHIVE},
;425:	{ &cg_oldRocket, "cg_oldRocket", "1", CVAR_ARCHIVE},
;426:	{ &cg_oldPlasma, "cg_oldPlasma", "1", CVAR_ARCHIVE},
;427:	{ &cg_trueLightning, "cg_trueLightning", "0.0", CVAR_ARCHIVE},
;428:	{ &cg_hitSounds, "cg_hitSounds", "0", CVAR_ARCHIVE},
;429:	{ &cg_enemyModel, "cg_enemyModel", "", CVAR_ARCHIVE},
;430:	{ &cg_enemyColors, "cg_enemyColors", "", CVAR_ARCHIVE},
;431:	{ &cg_teamModel, "cg_teamModel", "", CVAR_ARCHIVE},
;432:	{ &cg_teamColors, "cg_teamColors", "", CVAR_ARCHIVE},
;433:	{ &cg_deadBodyDarken, "cg_deadBodyDarken", "1", CVAR_ARCHIVE},
;434:	{ &cg_fovAdjust, "cg_fovAdjust", "0", CVAR_ARCHIVE},
;435:	{ &cg_followKiller, "cg_followKiller", "0", CVAR_ARCHIVE},
;436:#ifdef USE_VIRTUAL_MENU	
;437:	{ &menu_distance, "menu_distance", "80", CVAR_ARCHIVE },
;438:#endif
;439:	{ &vr_controller_type, "vr_controller_type", "0", CVAR_ARCHIVE },
;440:};
;441:
;442:
;443:/*
;444:=================
;445:CG_RegisterCvars
;446:=================
;447:*/
;448:void CG_RegisterCvars( void ) {
line 453
;449:	int			i;
;450:	const cvarTable_t	*cv;
;451:	char		var[MAX_TOKEN_CHARS];
;452:
;453:	for ( i = 0, cv = cvarTable ; i < ARRAY_LEN( cvarTable ) ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $243
JUMPV
LABELV $240
line 454
;454:		trap_Cvar_Register( cv->vmCvar, cv->cvarName,
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
line 456
;455:			cv->defaultString, cv->cvarFlags );
;456:	}
LABELV $241
line 453
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
LABELV $243
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 113
LTU4 $240
line 459
;457:
;458:	// see if we are also running the server on this machine
;459:	trap_Cvar_VariableStringBuffer( "sv_running", var, sizeof( var ) );
ADDRGP4 $244
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 460
;460:	cgs.localServer = atoi( var );
ADDRLP4 8
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+31492
ADDRLP4 1032
INDIRI4
ASGNI4
line 462
;461:
;462:	forceModelModificationCount = cg_forceModel.modificationCount;
ADDRGP4 forceModelModificationCount
ADDRGP4 cg_forceModel+4
INDIRI4
ASGNI4
line 463
;463:	enemyModelModificationCount = cg_enemyModel.modificationCount;
ADDRGP4 enemyModelModificationCount
ADDRGP4 cg_enemyModel+4
INDIRI4
ASGNI4
line 464
;464:	enemyColorsModificationCount = cg_enemyColors.modificationCount;
ADDRGP4 enemyColorsModificationCount
ADDRGP4 cg_enemyColors+4
INDIRI4
ASGNI4
line 465
;465:	teamModelModificationCount = cg_teamModel.modificationCount;
ADDRGP4 teamModelModificationCount
ADDRGP4 cg_teamModel+4
INDIRI4
ASGNI4
line 466
;466:	teamColorsModificationCount = cg_teamColors.modificationCount;
ADDRGP4 teamColorsModificationCount
ADDRGP4 cg_teamColors+4
INDIRI4
ASGNI4
line 469
;467:
;468:
;469:	trap_Cvar_Register(NULL, "model", DEFAULT_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $251
ARGP4
ADDRGP4 $252
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 470
;470:	trap_Cvar_Register(NULL, "headmodel", DEFAULT_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $253
ARGP4
ADDRGP4 $252
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 473
;471:	//trap_Cvar_Register(NULL, "team_model", DEFAULT_TEAM_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
;472:	//trap_Cvar_Register(NULL, "team_headmodel", DEFAULT_TEAM_HEAD, CVAR_USERINFO | CVAR_ARCHIVE );
;473:}
LABELV $239
endproc CG_RegisterCvars 1036 16
export CG_ForceModelChange
proc CG_ForceModelChange 12 4
line 481
;474:
;475:
;476:/*																																			
;477:===================
;478:CG_ForceModelChange
;479:===================
;480:*/
;481:void CG_ForceModelChange( void ) {
line 485
;482:	const char *clientInfo;
;483:	int i;
;484:
;485:	for ( i = 0 ; i < MAX_CLIENTS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $255
line 486
;486:		clientInfo = CG_ConfigString( CS_PLAYERS + i );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 487
;487:		if ( !clientInfo[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $259
line 488
;488:			continue;
ADDRGP4 $256
JUMPV
LABELV $259
line 490
;489:		}
;490:		CG_NewClientInfo( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 491
;491:	}
LABELV $256
line 485
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $255
line 492
;492:}
LABELV $254
endproc CG_ForceModelChange 12 4
export CG_UpdateCvars
proc CG_UpdateCvars 8 8
line 500
;493:
;494:
;495:/*
;496:=================
;497:CG_UpdateCvars
;498:=================
;499:*/
;500:void CG_UpdateCvars( void ) {
line 504
;501:	int			i;
;502:	const cvarTable_t	*cv;
;503:
;504:	for ( i = 0, cv = cvarTable ; i < ARRAY_LEN( cvarTable ) ; i++, cv++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $265
JUMPV
LABELV $262
line 505
;505:		trap_Cvar_Update( cv->vmCvar );
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 506
;506:	}
LABELV $263
line 504
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
LABELV $265
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 113
LTU4 $262
line 512
;507:
;508:	// check for modications here
;509:
;510:	// If team overlay is on, ask for updates from the server.  If its off,
;511:	// let the server know so we don't receive it
;512:	if ( drawTeamOverlayModificationCount != cg_drawTeamOverlay.modificationCount ) {
ADDRGP4 drawTeamOverlayModificationCount
INDIRI4
ADDRGP4 cg_drawTeamOverlay+4
INDIRI4
EQI4 $266
line 513
;513:		drawTeamOverlayModificationCount = cg_drawTeamOverlay.modificationCount;
ADDRGP4 drawTeamOverlayModificationCount
ADDRGP4 cg_drawTeamOverlay+4
INDIRI4
ASGNI4
line 522
;514:#if 0
;515:		if ( cg_drawTeamOverlay.integer > 0 ) {
;516:			trap_Cvar_Set( "teamoverlay", "1" );
;517:		} else {
;518:			trap_Cvar_Set( "teamoverlay", "0" );
;519:		}
;520:#endif
;521:		// FIXME E3 HACK
;522:		trap_Cvar_Set( "teamoverlay", "1" );
ADDRGP4 $195
ARGP4
ADDRGP4 $103
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 523
;523:	}
LABELV $266
line 526
;524:
;525:	// if model changed
;526:	if ( forceModelModificationCount != cg_forceModel.modificationCount 
ADDRGP4 forceModelModificationCount
INDIRI4
ADDRGP4 cg_forceModel+4
INDIRI4
NEI4 $280
ADDRGP4 enemyModelModificationCount
INDIRI4
ADDRGP4 cg_enemyModel+4
INDIRI4
NEI4 $280
ADDRGP4 enemyColorsModificationCount
INDIRI4
ADDRGP4 cg_enemyColors+4
INDIRI4
NEI4 $280
ADDRGP4 teamModelModificationCount
INDIRI4
ADDRGP4 cg_teamModel+4
INDIRI4
NEI4 $280
ADDRGP4 teamColorsModificationCount
INDIRI4
ADDRGP4 cg_teamColors+4
INDIRI4
EQI4 $270
LABELV $280
line 530
;527:		|| enemyModelModificationCount != cg_enemyModel.modificationCount
;528:		|| enemyColorsModificationCount != cg_enemyColors.modificationCount
;529:		|| teamModelModificationCount != cg_teamModel.modificationCount
;530:		|| teamColorsModificationCount != cg_teamColors.modificationCount ) {
line 532
;531:
;532:		forceModelModificationCount = cg_forceModel.modificationCount;
ADDRGP4 forceModelModificationCount
ADDRGP4 cg_forceModel+4
INDIRI4
ASGNI4
line 533
;533:		enemyModelModificationCount = cg_enemyModel.modificationCount;
ADDRGP4 enemyModelModificationCount
ADDRGP4 cg_enemyModel+4
INDIRI4
ASGNI4
line 534
;534:		enemyColorsModificationCount = cg_enemyColors.modificationCount;
ADDRGP4 enemyColorsModificationCount
ADDRGP4 cg_enemyColors+4
INDIRI4
ASGNI4
line 535
;535:		teamModelModificationCount = cg_teamModel.modificationCount;
ADDRGP4 teamModelModificationCount
ADDRGP4 cg_teamModel+4
INDIRI4
ASGNI4
line 536
;536:		teamColorsModificationCount = cg_teamColors.modificationCount;
ADDRGP4 teamColorsModificationCount
ADDRGP4 cg_teamColors+4
INDIRI4
ASGNI4
line 538
;537:
;538:		CG_ForceModelChange();
ADDRGP4 CG_ForceModelChange
CALLV
pop
line 539
;539:	}
LABELV $270
line 540
;540:}
LABELV $261
endproc CG_UpdateCvars 8 8
export CG_CrosshairPlayer
proc CG_CrosshairPlayer 0 0
line 543
;541:
;542:
;543:int CG_CrosshairPlayer( void ) {
line 544
;544:	if ( cg.time > ( cg.crosshairClientTime + 1000 ) ) {
ADDRGP4 cg+234764
INDIRI4
ADDRGP4 cg+245316
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $287
line 545
;545:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $286
JUMPV
LABELV $287
line 547
;546:	}
;547:	return cg.crosshairClientNum;
ADDRGP4 cg+245312
INDIRI4
RETI4
LABELV $286
endproc CG_CrosshairPlayer 0 0
export CG_LastAttacker
proc CG_LastAttacker 0 0
line 550
;548:}
;549:
;550:int CG_LastAttacker( void ) {
line 551
;551:	if ( !cg.attackerTime ) {
ADDRGP4 cg+245364
INDIRI4
CNSTI4 0
NEI4 $293
line 552
;552:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $292
JUMPV
LABELV $293
line 554
;553:	}
;554:	return cg.snap->ps.persistant[PERS_ATTACKER];
ADDRGP4 cg+36
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
RETI4
LABELV $292
endproc CG_LastAttacker 0 0
export CG_Printf
proc CG_Printf 1028 12
line 557
;555:}
;556:
;557:void QDECL CG_Printf( const char *msg, ... ) {
line 561
;558:	va_list		argptr;
;559:	char		text[1024];
;560:
;561:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 562
;562:	ED_vsprintf (text, msg, argptr);
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
line 563
;563:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 565
;564:
;565:	trap_Print( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 566
;566:}
LABELV $297
endproc CG_Printf 1028 12
export CG_Error
proc CG_Error 1028 12
line 568
;567:
;568:void QDECL CG_Error( const char *msg, ... ) {
line 572
;569:	va_list		argptr;
;570:	char		text[1024];
;571:
;572:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 573
;573:	ED_vsprintf (text, msg, argptr);
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
line 574
;574:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 576
;575:
;576:	trap_Error( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 577
;577:}
LABELV $299
endproc CG_Error 1028 12
export Com_Error
proc Com_Error 1028 12
line 582
;578:
;579:#ifndef CGAME_HARD_LINKED
;580:// this is only here so the functions in q_shared.c and bg_*.c can link (FIXME)
;581:
;582:void QDECL Com_Error( int level, const char *error, ... ) {
line 586
;583:	va_list		argptr;
;584:	char		text[1024];
;585:
;586:	va_start (argptr, error);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 587
;587:	ED_vsprintf (text, error, argptr);
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
line 588
;588:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 590
;589:
;590:	trap_Error( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 591
;591:}
LABELV $301
endproc Com_Error 1028 12
export Com_Printf
proc Com_Printf 1028 12
line 593
;592:
;593:void QDECL Com_Printf( const char *msg, ... ) {
line 597
;594:	va_list		argptr;
;595:	char		text[1024];
;596:
;597:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 598
;598:	ED_vsprintf (text, msg, argptr);
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
line 599
;599:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 601
;600:
;601:	trap_Print( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 602
;602:}
LABELV $303
endproc Com_Printf 1028 12
bss
align 1
LABELV $306
skip 2048
data
align 4
LABELV $307
byte 4 0
export CG_Argv
code
proc CG_Argv 4 12
line 612
;603:
;604:#endif
;605:
;606:/*
;607:================
;608:CG_Argv
;609:================
;610:*/
;611:const char *CG_Argv( int arg ) 
;612:{
line 616
;613:	static char	buffer[ 2 ][ MAX_STRING_CHARS ];
;614:	static int index = 0;
;615:
;616:	index ^= 1;
ADDRLP4 0
ADDRGP4 $307
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 617
;617:	trap_Argv( arg, buffer[ index ], sizeof( buffer[ 0 ] ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $307
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 $306
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 619
;618:
;619:	return buffer[ index ];
ADDRGP4 $307
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 $306
ADDP4
RETP4
LABELV $305
endproc CG_Argv 4 12
proc CG_RegisterItemSounds 96 12
line 632
;620:}
;621:
;622:
;623://========================================================================
;624:
;625:/*
;626:=================
;627:CG_RegisterItemSounds
;628:
;629:The server says this item is used on this level
;630:=================
;631:*/
;632:static void CG_RegisterItemSounds( int itemNum ) {
line 638
;633:	gitem_t			*item;
;634:	char			data[MAX_QPATH];
;635:	const char		*s, *start;
;636:	int				len;
;637:
;638:	item = &bg_itemlist[ itemNum ];
ADDRLP4 76
ADDRFP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 640
;639:
;640:	if( item->pickup_sound ) {
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $309
line 641
;641:		trap_S_RegisterSound( item->pickup_sound, qfalse );
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 642
;642:	}
LABELV $309
line 645
;643:
;644:	// parse the space separated precache string for other media
;645:	s = item->sounds;
ADDRLP4 0
ADDRLP4 76
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
ASGNP4
line 646
;646:	if (!s || !s[0])
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $313
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $315
LABELV $313
line 647
;647:		return;
ADDRGP4 $308
JUMPV
LABELV $314
line 649
;648:
;649:	while (*s) {
line 650
;650:		start = s;
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $318
JUMPV
LABELV $317
line 651
;651:		while (*s && *s != ' ') {
line 652
;652:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 653
;653:		}
LABELV $318
line 651
ADDRLP4 84
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $320
ADDRLP4 84
INDIRI4
CNSTI4 32
NEI4 $317
LABELV $320
line 655
;654:
;655:		len = s-start;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 656
;656:		if (len >= MAX_QPATH || len < 5) {
ADDRLP4 4
INDIRI4
CNSTI4 64
GEI4 $323
ADDRLP4 4
INDIRI4
CNSTI4 5
GEI4 $321
LABELV $323
line 657
;657:			CG_Error( "PrecacheItem: %s has bad precache string", 
ADDRGP4 $324
ARGP4
ADDRLP4 76
INDIRP4
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 659
;658:				item->classname);
;659:			return;
ADDRGP4 $308
JUMPV
LABELV $321
line 661
;660:		}
;661:		memcpy (data, start, len);
ADDRLP4 8
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 662
;662:		data[len] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 663
;663:		if ( *s ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $325
line 664
;664:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 665
;665:		}
LABELV $325
line 667
;666:
;667:		if ( !strcmp(data+len-3, "wav" )) {
ADDRLP4 4
INDIRI4
ADDRLP4 8-3
ADDP4
ARGP4
ADDRGP4 $330
ARGP4
ADDRLP4 92
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $327
line 668
;668:			trap_S_RegisterSound( data, qfalse );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 669
;669:		}
LABELV $327
line 670
;670:	}
LABELV $315
line 649
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $314
line 671
;671:}
LABELV $308
endproc CG_RegisterItemSounds 96 12
proc CG_RegisterSounds 572 16
line 681
;672:
;673:
;674:/*
;675:=================
;676:CG_RegisterSounds
;677:
;678:called during a precache command
;679:=================
;680:*/
;681:static void CG_RegisterSounds( void ) {
line 692
;682:	int		i;
;683:	char	items[MAX_ITEMS+1];
;684:	char	name[MAX_QPATH];
;685:	const char	*soundName;
;686:
;687:	// voice commands
;688:#ifdef MISSIONPACK
;689:	CG_LoadVoiceChats();
;690:#endif
;691:
;692:	cgs.media.oneMinuteSound = trap_S_RegisterSound( "sound/feedback/1_minute.wav", qtrue );
ADDRGP4 $334
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 332
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+800
ADDRLP4 332
INDIRI4
ASGNI4
line 693
;693:	cgs.media.fiveMinuteSound = trap_S_RegisterSound( "sound/feedback/5_minute.wav", qtrue );
ADDRGP4 $337
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 336
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+804
ADDRLP4 336
INDIRI4
ASGNI4
line 694
;694:	cgs.media.suddenDeathSound = trap_S_RegisterSound( "sound/feedback/sudden_death.wav", qtrue );
ADDRGP4 $340
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 340
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+808
ADDRLP4 340
INDIRI4
ASGNI4
line 695
;695:	cgs.media.oneFragSound = trap_S_RegisterSound( "sound/feedback/1_frag.wav", qtrue );
ADDRGP4 $343
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 344
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+820
ADDRLP4 344
INDIRI4
ASGNI4
line 696
;696:	cgs.media.twoFragSound = trap_S_RegisterSound( "sound/feedback/2_frags.wav", qtrue );
ADDRGP4 $346
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 348
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+816
ADDRLP4 348
INDIRI4
ASGNI4
line 697
;697:	cgs.media.threeFragSound = trap_S_RegisterSound( "sound/feedback/3_frags.wav", qtrue );
ADDRGP4 $349
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 352
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+812
ADDRLP4 352
INDIRI4
ASGNI4
line 698
;698:	cgs.media.count3Sound = trap_S_RegisterSound( "sound/feedback/three.wav", qtrue );
ADDRGP4 $352
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 356
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+988
ADDRLP4 356
INDIRI4
ASGNI4
line 699
;699:	cgs.media.count2Sound = trap_S_RegisterSound( "sound/feedback/two.wav", qtrue );
ADDRGP4 $355
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 360
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+992
ADDRLP4 360
INDIRI4
ASGNI4
line 700
;700:	cgs.media.count1Sound = trap_S_RegisterSound( "sound/feedback/one.wav", qtrue );
ADDRGP4 $358
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 364
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+996
ADDRLP4 364
INDIRI4
ASGNI4
line 701
;701:	cgs.media.countFightSound = trap_S_RegisterSound( "sound/feedback/fight.wav", qtrue );
ADDRGP4 $361
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 368
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1000
ADDRLP4 368
INDIRI4
ASGNI4
line 702
;702:	cgs.media.countPrepareSound = trap_S_RegisterSound( "sound/feedback/prepare.wav", qtrue );
ADDRGP4 $364
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 372
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1004
ADDRLP4 372
INDIRI4
ASGNI4
line 707
;703:#ifdef MISSIONPACK
;704:	cgs.media.countPrepareTeamSound = trap_S_RegisterSound( "sound/feedback/prepare_team.wav", qtrue );
;705:#endif
;706:
;707:	if ( cgs.gametype >= GT_TEAM || cg_buildScript.integer ) {
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
GEI4 $369
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $365
LABELV $369
line 709
;708:
;709:		cgs.media.captureAwardSound = trap_S_RegisterSound( "sound/teamplay/flagcapture_yourteam.wav", qtrue );
ADDRGP4 $372
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 376
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+904
ADDRLP4 376
INDIRI4
ASGNI4
line 710
;710:		cgs.media.redLeadsSound = trap_S_RegisterSound( "sound/feedback/redleads.wav", qtrue );
ADDRGP4 $375
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 380
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+916
ADDRLP4 380
INDIRI4
ASGNI4
line 711
;711:		cgs.media.blueLeadsSound = trap_S_RegisterSound( "sound/feedback/blueleads.wav", qtrue );
ADDRGP4 $378
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 384
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+920
ADDRLP4 384
INDIRI4
ASGNI4
line 712
;712:		cgs.media.teamsTiedSound = trap_S_RegisterSound( "sound/feedback/teamstied.wav", qtrue );
ADDRGP4 $381
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 388
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+924
ADDRLP4 388
INDIRI4
ASGNI4
line 713
;713:		cgs.media.hitTeamSound = trap_S_RegisterSound( "sound/feedback/hit_teammate.wav", qtrue );
ADDRGP4 $384
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 392
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+844
ADDRLP4 392
INDIRI4
ASGNI4
line 715
;714:
;715:		cgs.media.redScoredSound = trap_S_RegisterSound( "sound/teamplay/voc_red_scores.wav", qtrue );
ADDRGP4 $387
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 396
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+908
ADDRLP4 396
INDIRI4
ASGNI4
line 716
;716:		cgs.media.blueScoredSound = trap_S_RegisterSound( "sound/teamplay/voc_blue_scores.wav", qtrue );
ADDRGP4 $390
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 400
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+912
ADDRLP4 400
INDIRI4
ASGNI4
line 718
;717:
;718:		cgs.media.captureYourTeamSound = trap_S_RegisterSound( "sound/teamplay/flagcapture_yourteam.wav", qtrue );
ADDRGP4 $372
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 404
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+928
ADDRLP4 404
INDIRI4
ASGNI4
line 719
;719:		cgs.media.captureOpponentSound = trap_S_RegisterSound( "sound/teamplay/flagcapture_opponent.wav", qtrue );
ADDRGP4 $395
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 408
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+932
ADDRLP4 408
INDIRI4
ASGNI4
line 721
;720:
;721:		cgs.media.returnYourTeamSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_yourteam.wav", qtrue );
ADDRGP4 $398
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 412
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+936
ADDRLP4 412
INDIRI4
ASGNI4
line 722
;722:		cgs.media.returnOpponentSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_opponent.wav", qtrue );
ADDRGP4 $401
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 416
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+940
ADDRLP4 416
INDIRI4
ASGNI4
line 724
;723:
;724:		cgs.media.takenYourTeamSound = trap_S_RegisterSound( "sound/teamplay/flagtaken_yourteam.wav", qtrue );
ADDRGP4 $404
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 420
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+944
ADDRLP4 420
INDIRI4
ASGNI4
line 725
;725:		cgs.media.takenOpponentSound = trap_S_RegisterSound( "sound/teamplay/flagtaken_opponent.wav", qtrue );
ADDRGP4 $407
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 424
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+948
ADDRLP4 424
INDIRI4
ASGNI4
line 727
;726:
;727:		if ( cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 4
EQI4 $412
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $408
LABELV $412
line 728
;728:			cgs.media.redFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/voc_red_returned.wav", qtrue );
ADDRGP4 $415
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+952
ADDRLP4 428
INDIRI4
ASGNI4
line 729
;729:			cgs.media.blueFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/voc_blue_returned.wav", qtrue );
ADDRGP4 $418
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+956
ADDRLP4 432
INDIRI4
ASGNI4
line 730
;730:			cgs.media.enemyTookYourFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_enemy_flag.wav", qtrue );
ADDRGP4 $421
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+960
ADDRLP4 436
INDIRI4
ASGNI4
line 731
;731:			cgs.media.yourTeamTookEnemyFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_team_flag.wav", qtrue );
ADDRGP4 $424
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 440
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+968
ADDRLP4 440
INDIRI4
ASGNI4
line 732
;732:		}
LABELV $408
line 752
;733:
;734:#ifdef MISSIONPACK
;735:		if ( cgs.gametype == GT_1FCTF || cg_buildScript.integer ) {
;736:			// FIXME: get a replacement for this sound ?
;737:			cgs.media.neutralFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_opponent.wav", qtrue );
;738:			cgs.media.yourTeamTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_team_1flag.wav", qtrue );
;739:			cgs.media.enemyTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_enemy_1flag.wav", qtrue );
;740:		}
;741:
;742:		if ( cgs.gametype == GT_1FCTF || cgs.gametype == GT_CTF || cg_buildScript.integer ) {
;743:			cgs.media.youHaveFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_you_flag.wav", qtrue );
;744:			cgs.media.holyShitSound = trap_S_RegisterSound("sound/feedback/voc_holyshit.wav", qtrue);
;745:		}
;746:
;747:		if ( cgs.gametype == GT_OBELISK || cg_buildScript.integer ) {
;748:			cgs.media.yourBaseIsUnderAttackSound = trap_S_RegisterSound( "sound/teamplay/voc_base_attack.wav", qtrue );
;749:		}
;750:		cgs.media.neutralFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_opponent.wav", qtrue );
;751:#else
;752:		cgs.media.youHaveFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_you_flag.wav", qtrue );
ADDRGP4 $427
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+976
ADDRLP4 428
INDIRI4
ASGNI4
line 753
;753:		cgs.media.holyShitSound = trap_S_RegisterSound("sound/feedback/voc_holyshit.wav", qtrue);
ADDRGP4 $430
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+984
ADDRLP4 432
INDIRI4
ASGNI4
line 754
;754:		cgs.media.yourTeamTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_team_1flag.wav", qtrue );
ADDRGP4 $433
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+972
ADDRLP4 436
INDIRI4
ASGNI4
line 755
;755:		cgs.media.enemyTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_enemy_1flag.wav", qtrue );
ADDRGP4 $436
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 440
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+964
ADDRLP4 440
INDIRI4
ASGNI4
line 757
;756:#endif
;757:	}
LABELV $365
line 759
;758:
;759:	cgs.media.tracerSound = trap_S_RegisterSound( "sound/weapons/machinegun/buletby1.wav", qfalse );
ADDRGP4 $439
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 376
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+580
ADDRLP4 376
INDIRI4
ASGNI4
line 760
;760:	cgs.media.selectSound = trap_S_RegisterSound( "sound/weapons/change.wav", qfalse );
ADDRGP4 $442
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 380
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+584
ADDRLP4 380
INDIRI4
ASGNI4
line 761
;761:	cgs.media.wearOffSound = trap_S_RegisterSound( "sound/items/wearoff.wav", qfalse );
ADDRGP4 $445
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 384
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+592
ADDRLP4 384
INDIRI4
ASGNI4
line 762
;762:	cgs.media.useNothingSound = trap_S_RegisterSound( "sound/items/use_nothing.wav", qfalse );
ADDRGP4 $448
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 388
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+588
ADDRLP4 388
INDIRI4
ASGNI4
line 763
;763:	cgs.media.gibSound = trap_S_RegisterSound( "sound/player/gibsplt1.wav", qfalse );
ADDRGP4 $451
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 392
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+756
ADDRLP4 392
INDIRI4
ASGNI4
line 764
;764:	cgs.media.gibBounce1Sound = trap_S_RegisterSound( "sound/player/gibimp1.wav", qfalse );
ADDRGP4 $454
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 396
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+760
ADDRLP4 396
INDIRI4
ASGNI4
line 765
;765:	cgs.media.gibBounce2Sound = trap_S_RegisterSound( "sound/player/gibimp2.wav", qfalse );
ADDRGP4 $457
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 400
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+764
ADDRLP4 400
INDIRI4
ASGNI4
line 766
;766:	cgs.media.gibBounce3Sound = trap_S_RegisterSound( "sound/player/gibimp3.wav", qfalse );
ADDRGP4 $460
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 404
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+768
ADDRLP4 404
INDIRI4
ASGNI4
line 785
;767:
;768:#ifdef MISSIONPACK
;769:	cgs.media.useInvulnerabilitySound = trap_S_RegisterSound( "sound/items/invul_activate.wav", qfalse );
;770:	cgs.media.invulnerabilityImpactSound1 = trap_S_RegisterSound( "sound/items/invul_impact_01.wav", qfalse );
;771:	cgs.media.invulnerabilityImpactSound2 = trap_S_RegisterSound( "sound/items/invul_impact_02.wav", qfalse );
;772:	cgs.media.invulnerabilityImpactSound3 = trap_S_RegisterSound( "sound/items/invul_impact_03.wav", qfalse );
;773:	cgs.media.invulnerabilityJuicedSound = trap_S_RegisterSound( "sound/items/invul_juiced.wav", qfalse );
;774:	cgs.media.obeliskHitSound1 = trap_S_RegisterSound( "sound/items/obelisk_hit_01.wav", qfalse );
;775:	cgs.media.obeliskHitSound2 = trap_S_RegisterSound( "sound/items/obelisk_hit_02.wav", qfalse );
;776:	cgs.media.obeliskHitSound3 = trap_S_RegisterSound( "sound/items/obelisk_hit_03.wav", qfalse );
;777:	cgs.media.obeliskRespawnSound = trap_S_RegisterSound( "sound/items/obelisk_respawn.wav", qfalse );
;778:
;779:	cgs.media.ammoregenSound = trap_S_RegisterSound("sound/items/cl_ammoregen.wav", qfalse);
;780:	cgs.media.doublerSound = trap_S_RegisterSound("sound/items/cl_doubler.wav", qfalse);
;781:	cgs.media.guardSound = trap_S_RegisterSound("sound/items/cl_guard.wav", qfalse);
;782:	cgs.media.scoutSound = trap_S_RegisterSound("sound/items/cl_scout.wav", qfalse);
;783:#endif
;784:
;785:	cgs.media.teleInSound = trap_S_RegisterSound( "sound/world/telein.wav", qfalse );
ADDRGP4 $463
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 408
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+772
ADDRLP4 408
INDIRI4
ASGNI4
line 786
;786:	cgs.media.teleOutSound = trap_S_RegisterSound( "sound/world/teleout.wav", qfalse );
ADDRGP4 $466
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 412
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+776
ADDRLP4 412
INDIRI4
ASGNI4
line 787
;787:	cgs.media.respawnSound = trap_S_RegisterSound( "sound/items/respawn1.wav", qfalse );
ADDRGP4 $469
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 416
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+784
ADDRLP4 416
INDIRI4
ASGNI4
line 789
;788:
;789:	cgs.media.noAmmoSound = trap_S_RegisterSound( "sound/weapons/noammo.wav", qfalse );
ADDRGP4 $472
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 420
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+780
ADDRLP4 420
INDIRI4
ASGNI4
line 791
;790:
;791:	cgs.media.talkSound = trap_S_RegisterSound( "sound/player/talk.wav", qfalse );
ADDRGP4 $475
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 424
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+788
ADDRLP4 424
INDIRI4
ASGNI4
line 792
;792:	cgs.media.landSound = trap_S_RegisterSound( "sound/player/land1.wav", qfalse);
ADDRGP4 $478
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+792
ADDRLP4 428
INDIRI4
ASGNI4
line 794
;793:
;794:	cgs.media.hitSounds[0] = trap_S_RegisterSound( "sound/feedback/hit25.wav", qfalse );
ADDRGP4 $481
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+828
ADDRLP4 432
INDIRI4
ASGNI4
line 795
;795:	cgs.media.hitSounds[1] = trap_S_RegisterSound( "sound/feedback/hit50.wav", qfalse );
ADDRGP4 $485
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+828+4
ADDRLP4 436
INDIRI4
ASGNI4
line 796
;796:	cgs.media.hitSounds[2] = trap_S_RegisterSound( "sound/feedback/hit75.wav", qfalse );
ADDRGP4 $489
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 440
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+828+8
ADDRLP4 440
INDIRI4
ASGNI4
line 797
;797:	cgs.media.hitSounds[3] = trap_S_RegisterSound( "sound/feedback/hit100.wav", qfalse );
ADDRGP4 $493
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 444
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+828+12
ADDRLP4 444
INDIRI4
ASGNI4
line 799
;798:
;799:	cgs.media.hitSound = trap_S_RegisterSound( "sound/feedback/hit.wav", qfalse );
ADDRGP4 $496
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 448
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+824
ADDRLP4 448
INDIRI4
ASGNI4
line 806
;800:
;801:#ifdef MISSIONPACK
;802:	cgs.media.hitSoundHighArmor = trap_S_RegisterSound( "sound/feedback/hithi.wav", qfalse );
;803:	cgs.media.hitSoundLowArmor = trap_S_RegisterSound( "sound/feedback/hitlo.wav", qfalse );
;804:#endif
;805:
;806:	cgs.media.impressiveSound = trap_S_RegisterSound( "sound/feedback/impressive.wav", qtrue );
ADDRGP4 $499
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 452
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+848
ADDRLP4 452
INDIRI4
ASGNI4
line 807
;807:	cgs.media.excellentSound = trap_S_RegisterSound( "sound/feedback/excellent.wav", qtrue );
ADDRGP4 $502
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 456
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+852
ADDRLP4 456
INDIRI4
ASGNI4
line 808
;808:	cgs.media.deniedSound = trap_S_RegisterSound( "sound/feedback/denied.wav", qtrue );
ADDRGP4 $505
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 460
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+856
ADDRLP4 460
INDIRI4
ASGNI4
line 809
;809:	cgs.media.humiliationSound = trap_S_RegisterSound( "sound/feedback/humiliation.wav", qtrue );
ADDRGP4 $508
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 464
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+860
ADDRLP4 464
INDIRI4
ASGNI4
line 810
;810:	cgs.media.assistSound = trap_S_RegisterSound( "sound/feedback/assist.wav", qtrue );
ADDRGP4 $511
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 468
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+864
ADDRLP4 468
INDIRI4
ASGNI4
line 811
;811:	cgs.media.defendSound = trap_S_RegisterSound( "sound/feedback/defense.wav", qtrue );
ADDRGP4 $514
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 472
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+868
ADDRLP4 472
INDIRI4
ASGNI4
line 818
;812:#ifdef MISSIONPACK
;813:	cgs.media.firstImpressiveSound = trap_S_RegisterSound( "sound/feedback/first_impressive.wav", qtrue );
;814:	cgs.media.firstExcellentSound = trap_S_RegisterSound( "sound/feedback/first_excellent.wav", qtrue );
;815:	cgs.media.firstHumiliationSound = trap_S_RegisterSound( "sound/feedback/first_gauntlet.wav", qtrue );
;816:#endif
;817:
;818:	cgs.media.takenLeadSound = trap_S_RegisterSound( "sound/feedback/takenlead.wav", qtrue);
ADDRGP4 $517
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 476
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+872
ADDRLP4 476
INDIRI4
ASGNI4
line 819
;819:	cgs.media.tiedLeadSound = trap_S_RegisterSound( "sound/feedback/tiedlead.wav", qtrue);
ADDRGP4 $520
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 480
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+876
ADDRLP4 480
INDIRI4
ASGNI4
line 820
;820:	cgs.media.lostLeadSound = trap_S_RegisterSound( "sound/feedback/lostlead.wav", qtrue);
ADDRGP4 $523
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 484
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+880
ADDRLP4 484
INDIRI4
ASGNI4
line 828
;821:
;822:#ifdef MISSIONPACK
;823:	cgs.media.voteNow = trap_S_RegisterSound( "sound/feedback/vote_now.wav", qtrue);
;824:	cgs.media.votePassed = trap_S_RegisterSound( "sound/feedback/vote_passed.wav", qtrue);
;825:	cgs.media.voteFailed = trap_S_RegisterSound( "sound/feedback/vote_failed.wav", qtrue);
;826:#endif
;827:
;828:	cgs.media.watrInSound = trap_S_RegisterSound( "sound/player/watr_in.wav", qfalse);
ADDRGP4 $526
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 488
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+884
ADDRLP4 488
INDIRI4
ASGNI4
line 829
;829:	cgs.media.watrOutSound = trap_S_RegisterSound( "sound/player/watr_out.wav", qfalse);
ADDRGP4 $529
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 492
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+888
ADDRLP4 492
INDIRI4
ASGNI4
line 830
;830:	cgs.media.watrUnSound = trap_S_RegisterSound( "sound/player/watr_un.wav", qfalse);
ADDRGP4 $532
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 496
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+892
ADDRLP4 496
INDIRI4
ASGNI4
line 832
;831:
;832:	cgs.media.jumpPadSound = trap_S_RegisterSound ("sound/world/jumppad.wav", qfalse );
ADDRGP4 $535
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 500
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+796
ADDRLP4 500
INDIRI4
ASGNI4
line 834
;833:
;834:	for (i=0 ; i<4 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $536
line 835
;835:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/step%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $540
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 836
;836:		cgs.media.footsteps[FOOTSTEP_NORMAL][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 504
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+150560+596
ADDP4
ADDRLP4 504
INDIRI4
ASGNI4
line 838
;837:
;838:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/boot%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $543
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 839
;839:		cgs.media.footsteps[FOOTSTEP_BOOT][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 508
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+150560+596+16
ADDP4
ADDRLP4 508
INDIRI4
ASGNI4
line 841
;840:
;841:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/flesh%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $547
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 842
;842:		cgs.media.footsteps[FOOTSTEP_FLESH][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 512
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+150560+596+32
ADDP4
ADDRLP4 512
INDIRI4
ASGNI4
line 844
;843:
;844:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/mech%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $551
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 845
;845:		cgs.media.footsteps[FOOTSTEP_MECH][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 516
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+150560+596+48
ADDP4
ADDRLP4 516
INDIRI4
ASGNI4
line 847
;846:
;847:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/energy%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $555
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 848
;848:		cgs.media.footsteps[FOOTSTEP_ENERGY][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 520
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+150560+596+64
ADDP4
ADDRLP4 520
INDIRI4
ASGNI4
line 850
;849:
;850:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/splash%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $559
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 851
;851:		cgs.media.footsteps[FOOTSTEP_SPLASH][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 524
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+150560+596+96
ADDP4
ADDRLP4 524
INDIRI4
ASGNI4
line 853
;852:
;853:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/clank%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $563
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 854
;854:		cgs.media.footsteps[FOOTSTEP_METAL][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 528
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+150560+596+80
ADDP4
ADDRLP4 528
INDIRI4
ASGNI4
line 855
;855:	}
LABELV $537
line 834
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $536
line 858
;856:
;857:	// only register the items that the server says we need
;858:	Q_strncpyz(items, CG_ConfigString(CS_ITEMS), sizeof(items));
CNSTI4 27
ARGI4
ADDRLP4 504
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 72
ARGP4
ADDRLP4 504
INDIRP4
ARGP4
CNSTI4 257
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 860
;859:
;860:	for ( i = 1 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $570
JUMPV
LABELV $567
line 862
;861://		if ( items[ i ] == '1' || cg_buildScript.integer ) {
;862:			CG_RegisterItemSounds( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemSounds
CALLV
pop
line 864
;863://		}
;864:	}
LABELV $568
line 860
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $570
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $567
line 866
;865:
;866:	for ( i = 1 ; i < MAX_SOUNDS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $571
line 867
;867:		soundName = CG_ConfigString( CS_SOUNDS+i );
ADDRLP4 0
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 508
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 508
INDIRP4
ASGNP4
line 868
;868:		if ( !soundName[0] ) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $575
line 869
;869:			break;
ADDRGP4 $573
JUMPV
LABELV $575
line 871
;870:		}
;871:		if ( soundName[0] == '*' ) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $577
line 872
;872:			continue;	// custom sound
ADDRGP4 $572
JUMPV
LABELV $577
line 874
;873:		}
;874:		cgs.gameSounds[i] = trap_S_RegisterSound( soundName, qfalse );
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 512
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35888
ADDP4
ADDRLP4 512
INDIRI4
ASGNI4
line 875
;875:	}
LABELV $572
line 866
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $571
LABELV $573
line 879
;876:
;877:#if defined MISSIONPACK || defined USE_GRAPPLING_HOOK
;878:	// reuse the nailgun sounds from the MISSIONPACK for the grappling hook
;879:	cgs.media.sfx_nghit = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpd.wav" , qfalse);
ADDRGP4 $582
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 508
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+744
ADDRLP4 508
INDIRI4
ASGNI4
line 880
;880:	cgs.media.sfx_nghitflesh = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpl.wav" , qfalse);
ADDRGP4 $585
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 512
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+748
ADDRLP4 512
INDIRI4
ASGNI4
line 881
;881:	cgs.media.sfx_nghitmetal = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpm.wav", qfalse );
ADDRGP4 $588
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 516
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+752
ADDRLP4 516
INDIRI4
ASGNI4
line 885
;882:#endif
;883:
;884:	// FIXME: only needed with item
;885:	cgs.media.flightSound = trap_S_RegisterSound( "sound/items/flight.wav", qfalse );
ADDRGP4 $591
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 520
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+896
ADDRLP4 520
INDIRI4
ASGNI4
line 886
;886:	cgs.media.medkitSound = trap_S_RegisterSound ("sound/items/use_medkit.wav", qfalse);
ADDRGP4 $594
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 524
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+900
ADDRLP4 524
INDIRI4
ASGNI4
line 887
;887:	cgs.media.quadSound = trap_S_RegisterSound("sound/items/damage3.wav", qfalse);
ADDRGP4 $597
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 528
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+576
ADDRLP4 528
INDIRI4
ASGNI4
line 888
;888:	cgs.media.sfx_ric1 = trap_S_RegisterSound ("sound/weapons/machinegun/ric1.wav", qfalse);
ADDRGP4 $600
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 532
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+720
ADDRLP4 532
INDIRI4
ASGNI4
line 889
;889:	cgs.media.sfx_ric2 = trap_S_RegisterSound ("sound/weapons/machinegun/ric2.wav", qfalse);
ADDRGP4 $603
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 536
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+724
ADDRLP4 536
INDIRI4
ASGNI4
line 890
;890:	cgs.media.sfx_ric3 = trap_S_RegisterSound ("sound/weapons/machinegun/ric3.wav", qfalse);
ADDRGP4 $606
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 540
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+728
ADDRLP4 540
INDIRI4
ASGNI4
line 892
;891:	//cgs.media.sfx_railg = trap_S_RegisterSound ("sound/weapons/railgun/railgf1a.wav", qfalse);
;892:	cgs.media.sfx_rockexp = trap_S_RegisterSound ("sound/weapons/rocket/rocklx1a.wav", qfalse);
ADDRGP4 $609
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 544
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+736
ADDRLP4 544
INDIRI4
ASGNI4
line 893
;893:	cgs.media.sfx_plasmaexp = trap_S_RegisterSound ("sound/weapons/plasma/plasmx1a.wav", qfalse);
ADDRGP4 $612
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 548
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+740
ADDRLP4 548
INDIRI4
ASGNI4
line 912
;894:#ifdef MISSIONPACK
;895:	cgs.media.sfx_proxexp = trap_S_RegisterSound( "sound/weapons/proxmine/wstbexpl.wav" , qfalse);
;896:	cgs.media.sfx_chghit = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpd.wav", qfalse );
;897:	cgs.media.sfx_chghitflesh = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpl.wav", qfalse );
;898:	cgs.media.sfx_chghitmetal = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpm.wav", qfalse );
;899:	cgs.media.weaponHoverSound = trap_S_RegisterSound( "sound/weapons/weapon_hover.wav", qfalse );
;900:	cgs.media.kamikazeExplodeSound = trap_S_RegisterSound( "sound/items/kam_explode.wav", qfalse );
;901:	cgs.media.kamikazeImplodeSound = trap_S_RegisterSound( "sound/items/kam_implode.wav", qfalse );
;902:	cgs.media.kamikazeFarSound = trap_S_RegisterSound( "sound/items/kam_explode_far.wav", qfalse );
;903:	cgs.media.winnerSound = trap_S_RegisterSound( "sound/feedback/voc_youwin.wav", qfalse );
;904:	cgs.media.loserSound = trap_S_RegisterSound( "sound/feedback/voc_youlose.wav", qfalse );
;905:
;906:	cgs.media.wstbimplSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpl.wav", qfalse);
;907:	cgs.media.wstbimpmSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpm.wav", qfalse);
;908:	cgs.media.wstbimpdSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpd.wav", qfalse);
;909:	cgs.media.wstbactvSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbactv.wav", qfalse);
;910:#endif
;911:
;912:	cgs.media.regenSound = trap_S_RegisterSound("sound/items/regen.wav", qfalse);
ADDRGP4 $615
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 552
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1060
ADDRLP4 552
INDIRI4
ASGNI4
line 913
;913:	cgs.media.protectSound = trap_S_RegisterSound("sound/items/protect3.wav", qfalse);
ADDRGP4 $618
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 556
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1064
ADDRLP4 556
INDIRI4
ASGNI4
line 914
;914:	cgs.media.n_healthSound = trap_S_RegisterSound("sound/items/n_health.wav", qfalse );
ADDRGP4 $621
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 560
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1068
ADDRLP4 560
INDIRI4
ASGNI4
line 915
;915:	cgs.media.hgrenb1aSound = trap_S_RegisterSound("sound/weapons/grenade/hgrenb1a.wav", qfalse);
ADDRGP4 $624
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 564
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1072
ADDRLP4 564
INDIRI4
ASGNI4
line 916
;916:	cgs.media.hgrenb2aSound = trap_S_RegisterSound("sound/weapons/grenade/hgrenb2a.wav", qfalse);
ADDRGP4 $627
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 568
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1076
ADDRLP4 568
INDIRI4
ASGNI4
line 946
;917:
;918:#ifdef MISSIONPACK
;919:	trap_S_RegisterSound("sound/player/james/death1.wav", qfalse );
;920:	trap_S_RegisterSound("sound/player/james/death2.wav", qfalse );
;921:	trap_S_RegisterSound("sound/player/james/death3.wav", qfalse );
;922:	trap_S_RegisterSound("sound/player/james/jump1.wav", qfalse );
;923:	trap_S_RegisterSound("sound/player/james/pain25_1.wav", qfalse );
;924:	trap_S_RegisterSound("sound/player/james/pain75_1.wav", qfalse );
;925:	trap_S_RegisterSound("sound/player/james/pain100_1.wav", qfalse );
;926:	trap_S_RegisterSound("sound/player/james/falling1.wav", qfalse );
;927:	trap_S_RegisterSound("sound/player/james/gasp.wav", qfalse );
;928:	trap_S_RegisterSound("sound/player/james/drown.wav", qfalse );
;929:	trap_S_RegisterSound("sound/player/james/fall1.wav", qfalse );
;930:	trap_S_RegisterSound("sound/player/james/taunt.wav", qfalse );
;931:
;932:	trap_S_RegisterSound("sound/player/janet/death1.wav", qfalse );
;933:	trap_S_RegisterSound("sound/player/janet/death2.wav", qfalse );
;934:	trap_S_RegisterSound("sound/player/janet/death3.wav", qfalse );
;935:	trap_S_RegisterSound("sound/player/janet/jump1.wav", qfalse );
;936:	trap_S_RegisterSound("sound/player/janet/pain25_1.wav", qfalse );
;937:	trap_S_RegisterSound("sound/player/janet/pain75_1.wav", qfalse );
;938:	trap_S_RegisterSound("sound/player/janet/pain100_1.wav", qfalse );
;939:	trap_S_RegisterSound("sound/player/janet/falling1.wav", qfalse );
;940:	trap_S_RegisterSound("sound/player/janet/gasp.wav", qfalse );
;941:	trap_S_RegisterSound("sound/player/janet/drown.wav", qfalse );
;942:	trap_S_RegisterSound("sound/player/janet/fall1.wav", qfalse );
;943:	trap_S_RegisterSound("sound/player/janet/taunt.wav", qfalse );
;944:#endif
;945:
;946:}
LABELV $331
endproc CG_RegisterSounds 572 16
data
align 4
LABELV $629
address $630
address $631
address $632
address $633
address $634
address $635
address $636
address $637
address $638
address $639
address $640
code
proc CG_RegisterGraphics 640 16
line 959
;947:
;948:
;949://===================================================================================
;950:
;951:
;952:/*
;953:=================
;954:CG_RegisterGraphics
;955:
;956:This function may execute for a couple of minutes with a slow disk.
;957:=================
;958:*/
;959:static void CG_RegisterGraphics( void ) {
line 977
;960:	int			i;
;961:	char		items[MAX_ITEMS+1];
;962:	static char		*sb_nums[11] = {
;963:		"gfx/2d/numbers/zero_32b",
;964:		"gfx/2d/numbers/one_32b",
;965:		"gfx/2d/numbers/two_32b",
;966:		"gfx/2d/numbers/three_32b",
;967:		"gfx/2d/numbers/four_32b",
;968:		"gfx/2d/numbers/five_32b",
;969:		"gfx/2d/numbers/six_32b",
;970:		"gfx/2d/numbers/seven_32b",
;971:		"gfx/2d/numbers/eight_32b",
;972:		"gfx/2d/numbers/nine_32b",
;973:		"gfx/2d/numbers/minus_32b",
;974:	};
;975:
;976:	// clear any references to old media
;977:	memset( &cg.refdef, 0, sizeof( cg.refdef ) );
ADDRGP4 cg+236804
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 978
;978:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 980
;979:
;980:	CG_LoadingString( cgs.mapname );
ADDRGP4 cgs+31524
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 982
;981:
;982:	trap_R_LoadWorldMap( cgs.mapname );
ADDRGP4 cgs+31524
ARGP4
ADDRGP4 trap_R_LoadWorldMap
CALLV
pop
line 985
;983:
;984:	// precache status bar pics
;985:	CG_LoadingString( "game media" );
ADDRGP4 $645
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 987
;986:
;987:	for ( i = 0; i < ARRAY_LEN( sb_nums ); i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $649
JUMPV
LABELV $646
line 988
;988:		cgs.media.numberShaders[i] = trap_R_RegisterShader( sb_nums[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $629
ADDP4
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+150560+344
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 989
;989:	}
LABELV $647
line 987
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $649
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 11
LTU4 $646
line 991
;990:#ifdef USE_ITEM_TIMERS
;991:	cgs.media.timerSlices[0] = trap_R_RegisterShader( "gfx/2d/timer/slice_5" );
ADDRGP4 $654
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+388
ADDRLP4 264
INDIRI4
ASGNI4
line 992
;992:	cgs.media.timerSlices[1] = trap_R_RegisterShader( "gfx/2d/timer/slice_7" );
ADDRGP4 $658
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+388+4
ADDRLP4 268
INDIRI4
ASGNI4
line 993
;993:	cgs.media.timerSlices[2] = trap_R_RegisterShader( "gfx/2d/timer/slice_12" );
ADDRGP4 $662
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+388+8
ADDRLP4 272
INDIRI4
ASGNI4
line 994
;994:	cgs.media.timerSlices[3] = trap_R_RegisterShader( "gfx/2d/timer/slice_24" );
ADDRGP4 $666
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+388+12
ADDRLP4 276
INDIRI4
ASGNI4
line 997
;995:#endif
;996:#ifdef USE_VIRTUAL_MENU
;997:	cgs.media.menu_texture_shader = trap_R_RegisterShader( "textures/sfx/logo512.tga" );// menu as seen by others players
ADDRGP4 $669
ARGP4
ADDRLP4 280
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+340
ADDRLP4 280
INDIRI4
ASGNI4
line 999
;998:#endif	
;999:	cgs.media.botSkillShaders[0] = trap_R_RegisterShader( "menu/art/skill1.tga" );
ADDRGP4 $672
ARGP4
ADDRLP4 284
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+408
ADDRLP4 284
INDIRI4
ASGNI4
line 1000
;1000:	cgs.media.botSkillShaders[1] = trap_R_RegisterShader( "menu/art/skill2.tga" );
ADDRGP4 $676
ARGP4
ADDRLP4 288
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+408+4
ADDRLP4 288
INDIRI4
ASGNI4
line 1001
;1001:	cgs.media.botSkillShaders[2] = trap_R_RegisterShader( "menu/art/skill3.tga" );
ADDRGP4 $680
ARGP4
ADDRLP4 292
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+408+8
ADDRLP4 292
INDIRI4
ASGNI4
line 1002
;1002:	cgs.media.botSkillShaders[3] = trap_R_RegisterShader( "menu/art/skill4.tga" );
ADDRGP4 $684
ARGP4
ADDRLP4 296
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+408+12
ADDRLP4 296
INDIRI4
ASGNI4
line 1003
;1003:	cgs.media.botSkillShaders[4] = trap_R_RegisterShader( "menu/art/skill5.tga" );
ADDRGP4 $688
ARGP4
ADDRLP4 300
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+408+16
ADDRLP4 300
INDIRI4
ASGNI4
line 1005
;1004:
;1005:	cgs.media.viewBloodShader = trap_R_RegisterShader( "viewBloodBlend" );
ADDRGP4 $691
ARGP4
ADDRLP4 304
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+216
ADDRLP4 304
INDIRI4
ASGNI4
line 1007
;1006:
;1007:	cgs.media.deferShader = trap_R_RegisterShaderNoMip( "gfx/2d/defer.tga" );
ADDRGP4 $694
ARGP4
ADDRLP4 308
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+132
ADDRLP4 308
INDIRI4
ASGNI4
line 1009
;1008:
;1009:	cgs.media.scoreboardName = trap_R_RegisterShaderNoMip( "menu/tab/name.tga" );
ADDRGP4 $697
ARGP4
ADDRLP4 312
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+536
ADDRLP4 312
INDIRI4
ASGNI4
line 1010
;1010:	cgs.media.scoreboardPing = trap_R_RegisterShaderNoMip( "menu/tab/ping.tga" );
ADDRGP4 $700
ARGP4
ADDRLP4 316
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+540
ADDRLP4 316
INDIRI4
ASGNI4
line 1011
;1011:	cgs.media.scoreboardScore = trap_R_RegisterShaderNoMip( "menu/tab/score.tga" );
ADDRGP4 $703
ARGP4
ADDRLP4 320
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+544
ADDRLP4 320
INDIRI4
ASGNI4
line 1012
;1012:	cgs.media.scoreboardTime = trap_R_RegisterShaderNoMip( "menu/tab/time.tga" );
ADDRGP4 $706
ARGP4
ADDRLP4 324
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+548
ADDRLP4 324
INDIRI4
ASGNI4
line 1014
;1013:
;1014:	cgs.media.smokePuffShader = trap_R_RegisterShader( "smokePuff" );
ADDRGP4 $709
ARGP4
ADDRLP4 328
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+276
ADDRLP4 328
INDIRI4
ASGNI4
line 1015
;1015:	cgs.media.smokePuffRageProShader = trap_R_RegisterShader( "smokePuffRagePro" );
ADDRGP4 $712
ARGP4
ADDRLP4 332
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+280
ADDRLP4 332
INDIRI4
ASGNI4
line 1016
;1016:	cgs.media.shotgunSmokePuffShader = trap_R_RegisterShader( "shotgunSmokePuff" );
ADDRGP4 $715
ARGP4
ADDRLP4 336
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+284
ADDRLP4 336
INDIRI4
ASGNI4
line 1021
;1017:#ifdef MISSIONPACK
;1018:	cgs.media.nailPuffShader = trap_R_RegisterShader( "nailtrail" );
;1019:	cgs.media.blueProxMine = trap_R_RegisterModel( "models/weaphits/proxmineb.md3" );
;1020:#endif
;1021:	cgs.media.plasmaBallShader = trap_R_RegisterShader( "sprites/plasma1" );
ADDRGP4 $718
ARGP4
ADDRLP4 340
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+288
ADDRLP4 340
INDIRI4
ASGNI4
line 1022
;1022:	cgs.media.bloodTrailShader = trap_R_RegisterShader( "bloodTrail" );
ADDRGP4 $721
ARGP4
ADDRLP4 344
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+296
ADDRLP4 344
INDIRI4
ASGNI4
line 1023
;1023:	cgs.media.lagometerShader = trap_R_RegisterShader("lagometer" );
ADDRGP4 $724
ARGP4
ADDRLP4 348
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+264
ADDRLP4 348
INDIRI4
ASGNI4
line 1024
;1024:	cgs.media.connectionShader = trap_R_RegisterShader( "disconnected" );
ADDRGP4 $727
ARGP4
ADDRLP4 352
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+208
ADDRLP4 352
INDIRI4
ASGNI4
line 1026
;1025:
;1026:	cgs.media.waterBubbleShader = trap_R_RegisterShader( "waterBubble" );
ADDRGP4 $730
ARGP4
ADDRLP4 356
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+292
ADDRLP4 356
INDIRI4
ASGNI4
line 1028
;1027:
;1028:	cgs.media.tracerShader = trap_R_RegisterShader( "gfx/misc/tracer" );
ADDRGP4 $733
ARGP4
ADDRLP4 360
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+220
ADDRLP4 360
INDIRI4
ASGNI4
line 1029
;1029:	cgs.media.selectShader = trap_R_RegisterShader( "gfx/2d/select" );
ADDRGP4 $736
ARGP4
ADDRLP4 364
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+212
ADDRLP4 364
INDIRI4
ASGNI4
line 1031
;1030:
;1031:	for ( i = 0 ; i < NUM_CROSSHAIRS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $737
line 1032
;1032:		cgs.media.crosshairShader[i] = trap_R_RegisterShader( va("gfx/2d/crosshair%c", 'a'+i) );
ADDRGP4 $743
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 372
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 372
INDIRP4
ARGP4
ADDRLP4 376
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+150560+224
ADDP4
ADDRLP4 376
INDIRI4
ASGNI4
line 1033
;1033:	}
LABELV $738
line 1031
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $737
line 1035
;1034:
;1035:	cgs.media.backTileShader = trap_R_RegisterShader( "gfx/2d/backtile" );
ADDRGP4 $746
ARGP4
ADDRLP4 368
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+268
ADDRLP4 368
INDIRI4
ASGNI4
line 1036
;1036:	cgs.media.noammoShader = trap_R_RegisterShader( "icons/noammo" );
ADDRGP4 $749
ARGP4
ADDRLP4 372
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+272
ADDRLP4 372
INDIRI4
ASGNI4
line 1039
;1037:
;1038:	// powerup shaders
;1039:	cgs.media.quadShader = trap_R_RegisterShader("powerups/quad" );
ADDRGP4 $752
ARGP4
ADDRLP4 376
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+452
ADDRLP4 376
INDIRI4
ASGNI4
line 1040
;1040:	cgs.media.quadWeaponShader = trap_R_RegisterShader("powerups/quadWeapon" );
ADDRGP4 $755
ARGP4
ADDRLP4 380
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+460
ADDRLP4 380
INDIRI4
ASGNI4
line 1041
;1041:	cgs.media.battleSuitShader = trap_R_RegisterShader("powerups/battleSuit" );
ADDRGP4 $758
ARGP4
ADDRLP4 384
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+472
ADDRLP4 384
INDIRI4
ASGNI4
line 1042
;1042:	cgs.media.battleWeaponShader = trap_R_RegisterShader("powerups/battleWeapon" );
ADDRGP4 $761
ARGP4
ADDRLP4 388
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+476
ADDRLP4 388
INDIRI4
ASGNI4
line 1043
;1043:	cgs.media.invisShader = trap_R_RegisterShader("powerups/invisibility" );
ADDRGP4 $764
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+464
ADDRLP4 392
INDIRI4
ASGNI4
line 1044
;1044:	cgs.media.regenShader = trap_R_RegisterShader("powerups/regen" );
ADDRGP4 $767
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+468
ADDRLP4 396
INDIRI4
ASGNI4
line 1045
;1045:	cgs.media.hastePuffShader = trap_R_RegisterShader("hasteSmokePuff" );
ADDRGP4 $770
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+480
ADDRLP4 400
INDIRI4
ASGNI4
line 1050
;1046:
;1047:#ifdef MISSIONPACK
;1048:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF || cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
;1049:#else
;1050:	if ( cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 4
EQI4 $775
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $771
LABELV $775
line 1052
;1051:#endif
;1052:		cgs.media.redCubeModel = trap_R_RegisterModel( "models/powerups/orb/r_orb.md3" );
ADDRGP4 $778
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+20
ADDRLP4 404
INDIRI4
ASGNI4
line 1053
;1053:		cgs.media.blueCubeModel = trap_R_RegisterModel( "models/powerups/orb/b_orb.md3" );
ADDRGP4 $781
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+24
ADDRLP4 408
INDIRI4
ASGNI4
line 1054
;1054:		cgs.media.redCubeIcon = trap_R_RegisterShader( "icons/skull_red" );
ADDRGP4 $784
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+28
ADDRLP4 412
INDIRI4
ASGNI4
line 1055
;1055:		cgs.media.blueCubeIcon = trap_R_RegisterShader( "icons/skull_blue" );
ADDRGP4 $787
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+32
ADDRLP4 416
INDIRI4
ASGNI4
line 1056
;1056:	}
LABELV $771
line 1061
;1057:
;1058:#ifdef MISSIONPACK
;1059:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF || cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
;1060:#else
;1061:	if ( cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 4
EQI4 $792
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $788
LABELV $792
line 1063
;1062:#endif
;1063:		cgs.media.redFlagModel = trap_R_RegisterModel( "models/flags/r_flag.md3" );
ADDRGP4 $795
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+36
ADDRLP4 404
INDIRI4
ASGNI4
line 1064
;1064:		cgs.media.blueFlagModel = trap_R_RegisterModel( "models/flags/b_flag.md3" );
ADDRGP4 $798
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+40
ADDRLP4 408
INDIRI4
ASGNI4
line 1065
;1065:		cgs.media.redFlagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_red1" );
ADDRGP4 $801
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+48
ADDRLP4 412
INDIRI4
ASGNI4
line 1066
;1066:		cgs.media.redFlagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_red2" );
ADDRGP4 $805
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+48+4
ADDRLP4 416
INDIRI4
ASGNI4
line 1067
;1067:		cgs.media.redFlagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_red3" );
ADDRGP4 $809
ARGP4
ADDRLP4 420
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+48+8
ADDRLP4 420
INDIRI4
ASGNI4
line 1068
;1068:		cgs.media.blueFlagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_blu1" );
ADDRGP4 $812
ARGP4
ADDRLP4 424
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+60
ADDRLP4 424
INDIRI4
ASGNI4
line 1069
;1069:		cgs.media.blueFlagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_blu2" );
ADDRGP4 $816
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+60+4
ADDRLP4 428
INDIRI4
ASGNI4
line 1070
;1070:		cgs.media.blueFlagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_blu3" );
ADDRGP4 $820
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+60+8
ADDRLP4 432
INDIRI4
ASGNI4
line 1072
;1071:
;1072:		cgs.media.flagPoleModel = trap_R_RegisterModel( "models/flag2/flagpole.md3" );
ADDRGP4 $823
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+88
ADDRLP4 436
INDIRI4
ASGNI4
line 1073
;1073:		cgs.media.flagFlapModel = trap_R_RegisterModel( "models/flag2/flagflap3.md3" );
ADDRGP4 $826
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+92
ADDRLP4 440
INDIRI4
ASGNI4
line 1075
;1074:
;1075:		cgs.media.redFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/red.skin" );
ADDRGP4 $829
ARGP4
ADDRLP4 444
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+150560+96
ADDRLP4 444
INDIRI4
ASGNI4
line 1076
;1076:		cgs.media.blueFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/blue.skin" );
ADDRGP4 $832
ARGP4
ADDRLP4 448
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+150560+100
ADDRLP4 448
INDIRI4
ASGNI4
line 1077
;1077:		cgs.media.neutralFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/white.skin" );
ADDRGP4 $835
ARGP4
ADDRLP4 452
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+150560+104
ADDRLP4 452
INDIRI4
ASGNI4
line 1083
;1078:#ifdef MISSIONPACK
;1079:		cgs.media.redFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/red_base.md3" );
;1080:		cgs.media.blueFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/blue_base.md3" );
;1081:		cgs.media.neutralFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/ntrl_base.md3" );
;1082:#endif
;1083:	}
LABELV $788
line 1114
;1084:
;1085:#ifdef MISSIONPACK
;1086:	if ( cgs.gametype == GT_1FCTF || cg_buildScript.integer ) {
;1087:		cgs.media.neutralFlagModel = trap_R_RegisterModel( "models/flags/n_flag.md3" );
;1088:		cgs.media.flagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_neutral1" );
;1089:		cgs.media.flagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_red2" );
;1090:		cgs.media.flagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_blu2" );
;1091:		cgs.media.flagShader[3] = trap_R_RegisterShaderNoMip( "icons/iconf_neutral3" );
;1092:	}
;1093:
;1094:	if ( cgs.gametype == GT_OBELISK || cg_buildScript.integer ) {
;1095:		cgs.media.overloadBaseModel = trap_R_RegisterModel( "models/powerups/overload_base.md3" );
;1096:		cgs.media.overloadTargetModel = trap_R_RegisterModel( "models/powerups/overload_target.md3" );
;1097:		cgs.media.overloadLightsModel = trap_R_RegisterModel( "models/powerups/overload_lights.md3" );
;1098:		cgs.media.overloadEnergyModel = trap_R_RegisterModel( "models/powerups/overload_energy.md3" );
;1099:	}
;1100:
;1101:	if ( cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
;1102:		cgs.media.harvesterModel = trap_R_RegisterModel( "models/powerups/harvester/harvester.md3" );
;1103:		cgs.media.harvesterRedSkin = trap_R_RegisterSkin( "models/powerups/harvester/red.skin" );
;1104:		cgs.media.harvesterBlueSkin = trap_R_RegisterSkin( "models/powerups/harvester/blue.skin" );
;1105:		cgs.media.harvesterNeutralModel = trap_R_RegisterModel( "models/powerups/obelisk/obelisk.md3" );
;1106:	}
;1107:
;1108:	cgs.media.redKamikazeShader = trap_R_RegisterShader( "models/weaphits/kamikred" );
;1109:	cgs.media.dustPuffShader = trap_R_RegisterShader("hasteSmokePuff" );
;1110:#endif
;1111:
;1112:#ifdef USE_WEAPON_WHEEL
;1113:	//cgs.media.needle = trap_R_RegisterShader("gfx/2d/weaponwheel/needle3");
;1114:	cgs.media.needle = trap_R_RegisterShader("gfx/2d/weaponwheel/needle");
ADDRGP4 $838
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+308
ADDRLP4 404
INDIRI4
ASGNI4
line 1115
;1115:	cgs.media.wheelHollow = trap_R_RegisterShader("gfx/2d/weaponwheel/slice_h_7");
ADDRGP4 $841
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+304
ADDRLP4 408
INDIRI4
ASGNI4
line 1118
;1116:#endif
;1117:
;1118:	cgs.media.friendShader = trap_R_RegisterShader("sprites/foe");
ADDRGP4 $844
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+200
ADDRLP4 412
INDIRI4
ASGNI4
line 1119
;1119:	if ( cgs.gametype >= GT_TEAM || cg_buildScript.integer ) {
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
GEI4 $849
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $845
LABELV $849
line 1121
;1120:		//cgs.media.friendShader = trap_R_RegisterShader( "sprites/foe" );
;1121:		cgs.media.redQuadShader = trap_R_RegisterShader("powerups/blueflag" );
ADDRGP4 $852
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+456
ADDRLP4 416
INDIRI4
ASGNI4
line 1122
;1122:		cgs.media.teamStatusBar = trap_R_RegisterShader( "gfx/2d/colorbar.tga" );
ADDRGP4 $855
ARGP4
ADDRLP4 420
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+128
ADDRLP4 420
INDIRI4
ASGNI4
line 1126
;1123:#ifdef MISSIONPACK
;1124:		cgs.media.blueKamikazeShader = trap_R_RegisterShader( "models/weaphits/kamikblu" );
;1125:#endif
;1126:	}
LABELV $845
line 1128
;1127:
;1128:	cgs.media.armorModel = trap_R_RegisterModel( "models/powerups/armor/armor_yel.md3" );
ADDRGP4 $858
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+120
ADDRLP4 416
INDIRI4
ASGNI4
line 1129
;1129:	cgs.media.armorIcon  = trap_R_RegisterShaderNoMip( "icons/iconr_yellow" );
ADDRGP4 $861
ARGP4
ADDRLP4 420
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+124
ADDRLP4 420
INDIRI4
ASGNI4
line 1131
;1130:
;1131:	cgs.media.machinegunBrassModel = trap_R_RegisterModel( "models/weapons2/shells/m_shell.md3" );
ADDRGP4 $864
ARGP4
ADDRLP4 424
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+180
ADDRLP4 424
INDIRI4
ASGNI4
line 1132
;1132:	cgs.media.shotgunBrassModel = trap_R_RegisterModel( "models/weapons2/shells/s_shell.md3" );
ADDRGP4 $867
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+184
ADDRLP4 428
INDIRI4
ASGNI4
line 1134
;1133:
;1134:	cgs.media.gibAbdomen = trap_R_RegisterModel( "models/gibs/abdomen.md3" );
ADDRGP4 $870
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+136
ADDRLP4 432
INDIRI4
ASGNI4
line 1135
;1135:	cgs.media.gibArm = trap_R_RegisterModel( "models/gibs/arm.md3" );
ADDRGP4 $873
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+140
ADDRLP4 436
INDIRI4
ASGNI4
line 1136
;1136:	cgs.media.gibChest = trap_R_RegisterModel( "models/gibs/chest.md3" );
ADDRGP4 $876
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+144
ADDRLP4 440
INDIRI4
ASGNI4
line 1137
;1137:	cgs.media.gibFist = trap_R_RegisterModel( "models/gibs/fist.md3" );
ADDRGP4 $879
ARGP4
ADDRLP4 444
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+148
ADDRLP4 444
INDIRI4
ASGNI4
line 1138
;1138:	cgs.media.gibFoot = trap_R_RegisterModel( "models/gibs/foot.md3" );
ADDRGP4 $882
ARGP4
ADDRLP4 448
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+152
ADDRLP4 448
INDIRI4
ASGNI4
line 1139
;1139:	cgs.media.gibForearm = trap_R_RegisterModel( "models/gibs/forearm.md3" );
ADDRGP4 $885
ARGP4
ADDRLP4 452
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+156
ADDRLP4 452
INDIRI4
ASGNI4
line 1140
;1140:	cgs.media.gibIntestine = trap_R_RegisterModel( "models/gibs/intestine.md3" );
ADDRGP4 $888
ARGP4
ADDRLP4 456
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+160
ADDRLP4 456
INDIRI4
ASGNI4
line 1141
;1141:	cgs.media.gibLeg = trap_R_RegisterModel( "models/gibs/leg.md3" );
ADDRGP4 $891
ARGP4
ADDRLP4 460
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+164
ADDRLP4 460
INDIRI4
ASGNI4
line 1142
;1142:	cgs.media.gibSkull = trap_R_RegisterModel( "models/gibs/skull.md3" );
ADDRGP4 $894
ARGP4
ADDRLP4 464
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+168
ADDRLP4 464
INDIRI4
ASGNI4
line 1143
;1143:	cgs.media.gibBrain = trap_R_RegisterModel( "models/gibs/brain.md3" );
ADDRGP4 $897
ARGP4
ADDRLP4 468
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+172
ADDRLP4 468
INDIRI4
ASGNI4
line 1145
;1144:
;1145:	cgs.media.smoke2 = trap_R_RegisterModel( "models/weapons2/shells/s_shell.md3" );
ADDRGP4 $867
ARGP4
ADDRLP4 472
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+176
ADDRLP4 472
INDIRI4
ASGNI4
line 1147
;1146:
;1147:	cgs.media.balloonShader = trap_R_RegisterShader( "sprites/balloon3" );
ADDRGP4 $902
ARGP4
ADDRLP4 476
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+204
ADDRLP4 476
INDIRI4
ASGNI4
line 1149
;1148:
;1149:	cgs.media.bloodExplosionShader = trap_R_RegisterShader( "bloodExplosion" );
ADDRGP4 $905
ARGP4
ADDRLP4 480
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+524
ADDRLP4 480
INDIRI4
ASGNI4
line 1151
;1150:
;1151:	cgs.media.bulletFlashModel = trap_R_RegisterModel("models/weaphits/bullet.md3");
ADDRGP4 $908
ARGP4
ADDRLP4 484
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+484
ADDRLP4 484
INDIRI4
ASGNI4
line 1152
;1152:	cgs.media.ringFlashModel = trap_R_RegisterModel("models/weaphits/ring02.md3");
ADDRGP4 $911
ARGP4
ADDRLP4 488
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+488
ADDRLP4 488
INDIRI4
ASGNI4
line 1153
;1153:	cgs.media.dishFlashModel = trap_R_RegisterModel("models/weaphits/boom01.md3");
ADDRGP4 $914
ARGP4
ADDRLP4 492
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+492
ADDRLP4 492
INDIRI4
ASGNI4
line 1157
;1154:#ifdef MISSIONPACK
;1155:	cgs.media.teleportEffectModel = trap_R_RegisterModel( "models/powerups/pop.md3" );
;1156:#else
;1157:	cgs.media.teleportEffectModel = trap_R_RegisterModel( "models/misc/telep.md3" );
ADDRGP4 $917
ARGP4
ADDRLP4 496
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+528
ADDRLP4 496
INDIRI4
ASGNI4
line 1158
;1158:	cgs.media.teleportEffectShader = trap_R_RegisterShader( "teleportEffect" );
ADDRGP4 $920
ARGP4
ADDRLP4 500
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+532
ADDRLP4 500
INDIRI4
ASGNI4
line 1176
;1159:#endif
;1160:#ifdef MISSIONPACK
;1161:	cgs.media.kamikazeEffectModel = trap_R_RegisterModel( "models/weaphits/kamboom2.md3" );
;1162:	cgs.media.kamikazeShockWave = trap_R_RegisterModel( "models/weaphits/kamwave.md3" );
;1163:	cgs.media.kamikazeHeadModel = trap_R_RegisterModel( "models/powerups/kamikazi.md3" );
;1164:	cgs.media.kamikazeHeadTrail = trap_R_RegisterModel( "models/powerups/trailtest.md3" );
;1165:	cgs.media.guardPowerupModel = trap_R_RegisterModel( "models/powerups/guard_player.md3" );
;1166:	cgs.media.scoutPowerupModel = trap_R_RegisterModel( "models/powerups/scout_player.md3" );
;1167:	cgs.media.doublerPowerupModel = trap_R_RegisterModel( "models/powerups/doubler_player.md3" );
;1168:	cgs.media.ammoRegenPowerupModel = trap_R_RegisterModel( "models/powerups/ammo_player.md3" );
;1169:	cgs.media.invulnerabilityImpactModel = trap_R_RegisterModel( "models/powerups/shield/impact.md3" );
;1170:	cgs.media.invulnerabilityJuicedModel = trap_R_RegisterModel( "models/powerups/shield/juicer.md3" );
;1171:	cgs.media.medkitUsageModel = trap_R_RegisterModel( "models/powerups/regen.md3" );
;1172:	cgs.media.heartShader = trap_R_RegisterShaderNoMip( "ui/assets/statusbar/selectedhealth.tga" );
;1173:	cgs.media.invulnerabilityPowerupModel = trap_R_RegisterModel( "models/powerups/shield/shield.md3" );
;1174:#endif
;1175:
;1176:	cgs.media.medalImpressive = trap_R_RegisterShaderNoMip( "medal_impressive" );
ADDRGP4 $923
ARGP4
ADDRLP4 504
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+552
ADDRLP4 504
INDIRI4
ASGNI4
line 1177
;1177:	cgs.media.medalExcellent = trap_R_RegisterShaderNoMip( "medal_excellent" );
ADDRGP4 $926
ARGP4
ADDRLP4 508
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+556
ADDRLP4 508
INDIRI4
ASGNI4
line 1178
;1178:	cgs.media.medalGauntlet = trap_R_RegisterShaderNoMip( "medal_gauntlet" );
ADDRGP4 $929
ARGP4
ADDRLP4 512
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+560
ADDRLP4 512
INDIRI4
ASGNI4
line 1179
;1179:	cgs.media.medalDefend = trap_R_RegisterShaderNoMip( "medal_defend" );
ADDRGP4 $932
ARGP4
ADDRLP4 516
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+564
ADDRLP4 516
INDIRI4
ASGNI4
line 1180
;1180:	cgs.media.medalAssist = trap_R_RegisterShaderNoMip( "medal_assist" );
ADDRGP4 $935
ARGP4
ADDRLP4 520
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+568
ADDRLP4 520
INDIRI4
ASGNI4
line 1181
;1181:	cgs.media.medalCapture = trap_R_RegisterShaderNoMip( "medal_capture" );
ADDRGP4 $938
ARGP4
ADDRLP4 524
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+572
ADDRLP4 524
INDIRI4
ASGNI4
line 1185
;1182:
;1183:#ifdef USE_NEOHUD
;1184:	// Quake Live HUD default icons
;1185:	cgs.media.gameTypeShader[GT_FFA] = trap_R_RegisterShaderNoMip("hud/hudQL/ffa");//free for all
ADDRGP4 $941
ARGP4
ADDRLP4 528
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+312
ADDRLP4 528
INDIRI4
ASGNI4
line 1186
;1186:	cgs.media.gameTypeShader[GT_TOURNAMENT] = trap_R_RegisterShaderNoMip("hud/hudQL/duel");//one on one tournament
ADDRGP4 $945
ARGP4
ADDRLP4 532
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+312+4
ADDRLP4 532
INDIRI4
ASGNI4
line 1187
;1187:	cgs.media.gameTypeShader[GT_SINGLE_PLAYER] = trap_R_RegisterShaderNoMip("hud/hudQL/ffa");//single player ffa
ADDRGP4 $941
ARGP4
ADDRLP4 536
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+312+8
ADDRLP4 536
INDIRI4
ASGNI4
line 1188
;1188:	cgs.media.gameTypeShader[GT_TEAM] = trap_R_RegisterShaderNoMip("hud/hudQL/tdm");//team deathmatch
ADDRGP4 $952
ARGP4
ADDRLP4 540
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+312+12
ADDRLP4 540
INDIRI4
ASGNI4
line 1189
;1189:	cgs.media.gameTypeShader[GT_CTF] = trap_R_RegisterShaderNoMip("hud/hudQL/ctf");//capture the flag
ADDRGP4 $956
ARGP4
ADDRLP4 544
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+312+16
ADDRLP4 544
INDIRI4
ASGNI4
line 1197
;1190:#endif
;1191:#ifdef MISSIONPACK
;1192:	cgs.media.gameTypeShader[GT_1FCTF] = trap_R_RegisterShaderNoMip("hud/hudQL/1f");
;1193:	cgs.media.gameTypeShader[GT_OBELISK] = trap_R_RegisterShaderNoMip("hud/hudQL/har");
;1194:	cgs.media.gameTypeShader[GT_HARVESTER] = trap_R_RegisterShaderNoMip("hud/hudQL/har");
;1195:#endif
;1196:
;1197:	memset( cg_items, 0, sizeof( cg_items ) );
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 7168
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1198
;1198:	memset( cg_weapons, 0, sizeof( cg_weapons ) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1201
;1199:
;1200:	// only register the items that the server says we need
;1201:	Q_strncpyz( items, CG_ConfigString(CS_ITEMS), sizeof( items ) );
CNSTI4 27
ARGI4
ADDRLP4 548
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 548
INDIRP4
ARGP4
CNSTI4 257
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1203
;1202:
;1203:	for ( i = 1 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $960
JUMPV
LABELV $957
line 1204
;1204:		if ( items[ i ] == '1' || cg_buildScript.integer ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 49
EQI4 $964
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $961
LABELV $964
line 1205
;1205:			CG_LoadingItem( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_LoadingItem
CALLV
pop
line 1206
;1206:			CG_RegisterItemVisuals( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1207
;1207:		}
LABELV $961
line 1208
;1208:	}
LABELV $958
line 1203
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $960
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $957
line 1210
;1209:
;1210:	cg.skipDFshaders = qfalse;
ADDRGP4 cg+282948
CNSTI4 0
ASGNI4
line 1213
;1211:
;1212:#ifdef USE_WEAPON_WHEEL
;1213:	{
line 1216
;1214:		int weaponId;
;1215:		// register all weapons (as they are used on weapon wheel selector)
;1216:		for (weaponId = 1; weaponId < WP_NUM_WEAPONS; weaponId++) {
ADDRLP4 552
CNSTI4 1
ASGNI4
LABELV $966
line 1227
;1217://#ifdef USE_GRAPPLING_HOOK
;1218:			/*if (weaponId == WP_GRAPPLING_HOOK) {// TODO if allow grapple hook
;1219:				continue;
;1220:			}*/
;1221://#endif
;1222:#ifndef USE_VR
;1223:			if (weaponId == WP_VR_CONTROLLER) {
;1224:				continue;
;1225:			}
;1226:#endif
;1227:			CG_RegisterWeapon(weaponId);
ADDRLP4 552
INDIRI4
ARGI4
ADDRGP4 CG_RegisterWeapon
CALLV
pop
line 1228
;1228:		}
LABELV $967
line 1216
ADDRLP4 552
ADDRLP4 552
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 552
INDIRI4
CNSTI4 12
LTI4 $966
line 1229
;1229:	}
line 1233
;1230:#endif
;1231:
;1232:	// wall marks
;1233:	cgs.media.bulletMarkShader = trap_R_RegisterShader( "gfx/damage/bullet_mrk" );
ADDRGP4 $972
ARGP4
ADDRLP4 552
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+436
ADDRLP4 552
INDIRI4
ASGNI4
line 1234
;1234:	cgs.media.burnMarkShader = trap_R_RegisterShader( "gfx/damage/burn_med_mrk" );
ADDRGP4 $975
ARGP4
ADDRLP4 556
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+440
ADDRLP4 556
INDIRI4
ASGNI4
line 1235
;1235:	cgs.media.holeMarkShader = trap_R_RegisterShader( "gfx/damage/hole_lg_mrk" );
ADDRGP4 $978
ARGP4
ADDRLP4 560
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+444
ADDRLP4 560
INDIRI4
ASGNI4
line 1236
;1236:	cgs.media.energyMarkShader = trap_R_RegisterShader( "gfx/damage/plasma_mrk" );
ADDRGP4 $981
ARGP4
ADDRLP4 564
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+448
ADDRLP4 564
INDIRI4
ASGNI4
line 1237
;1237:	cgs.media.shadowMarkShader = trap_R_RegisterShader( "markShadow" );
ADDRGP4 $984
ARGP4
ADDRLP4 568
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+404
ADDRLP4 568
INDIRI4
ASGNI4
line 1238
;1238:	cgs.media.wakeMarkShader = trap_R_RegisterShader( "wake" );
ADDRGP4 $987
ARGP4
ADDRLP4 572
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+428
ADDRLP4 572
INDIRI4
ASGNI4
line 1239
;1239:	cgs.media.bloodMarkShader = trap_R_RegisterShader( "bloodMark" );
ADDRGP4 $990
ARGP4
ADDRLP4 576
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+432
ADDRLP4 576
INDIRI4
ASGNI4
line 1251
;1240:
;1241:	//Load from pakQ3Q
;1242:#ifdef USE_VR_ZOOM
;1243:	cgs.media.reticleShader = trap_R_RegisterShader("gfx/weapon/scope");
;1244:#endif
;1245:
;1246:#ifdef USE_CONFORT_VIGNETTE
;1247:	cgs.media.vignetteShader = trap_R_RegisterShader("gfx/vignette");
;1248:#endif
;1249:
;1250:#ifdef USE_WEAPON_WHEEL
;1251:	cgs.media.smallSphereModel = trap_R_RegisterModel("models/powerups/health/small_sphere.md3");
ADDRGP4 $993
ARGP4
ADDRLP4 580
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+150560+300
ADDRLP4 580
INDIRI4
ASGNI4
line 1255
;1252:#endif
;1253:
;1254:	// register the inline models
;1255:	cgs.numInlineModels = trap_CM_NumInlineModels();
ADDRLP4 584
ADDRGP4 trap_CM_NumInlineModels
CALLI4
ASGNI4
ADDRGP4 cgs+36912
ADDRLP4 584
INDIRI4
ASGNI4
line 1256
;1256:	for ( i = 1 ; i < cgs.numInlineModels ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $998
JUMPV
LABELV $995
line 1261
;1257:		char	name[10];
;1258:		vec3_t			mins, maxs;
;1259:		int				j;
;1260:
;1261:		Com_sprintf( name, sizeof(name), "*%i", i );
ADDRLP4 616
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 $1000
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1262
;1262:		cgs.inlineDrawModel[i] = trap_R_RegisterModel( name );
ADDRLP4 616
ARGP4
ADDRLP4 628
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36916
ADDP4
ADDRLP4 628
INDIRI4
ASGNI4
line 1263
;1263:		trap_R_ModelBounds( cgs.inlineDrawModel[i], mins, maxs );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36916
ADDP4
INDIRI4
ARGI4
ADDRLP4 592
ARGP4
ADDRLP4 604
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 1264
;1264:		for ( j = 0 ; j < 3 ; j++ ) {
ADDRLP4 588
CNSTI4 0
ASGNI4
LABELV $1003
line 1265
;1265:			cgs.inlineModelMidpoints[i][j] = mins[j] + 0.5 * ( maxs[j] - mins[j] );
ADDRLP4 588
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 cgs+37940
ADDP4
ADDP4
ADDRLP4 588
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 592
ADDP4
INDIRF4
ADDRLP4 588
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 604
ADDP4
INDIRF4
ADDRLP4 588
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 592
ADDP4
INDIRF4
SUBF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 1266
;1266:		}
LABELV $1004
line 1264
ADDRLP4 588
ADDRLP4 588
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 588
INDIRI4
CNSTI4 3
LTI4 $1003
line 1267
;1267:	}
LABELV $996
line 1256
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $998
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+36912
INDIRI4
LTI4 $995
line 1270
;1268:
;1269:	// register all the server specified models
;1270:	for (i=1 ; i<MAX_MODELS ; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $1008
line 1273
;1271:		const char		*modelName;
;1272:
;1273:		modelName = CG_ConfigString( CS_MODELS+i );
ADDRLP4 0
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRLP4 592
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 588
ADDRLP4 592
INDIRP4
ASGNP4
line 1274
;1274:		if ( !modelName[0] ) {
ADDRLP4 588
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1012
line 1275
;1275:			break;
ADDRGP4 $1010
JUMPV
LABELV $1012
line 1277
;1276:		}
;1277:		cgs.gameModels[i] = trap_R_RegisterModel( modelName );
ADDRLP4 588
INDIRP4
ARGP4
ADDRLP4 596
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34864
ADDP4
ADDRLP4 596
INDIRI4
ASGNI4
line 1278
;1278:	}
LABELV $1009
line 1270
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $1008
LABELV $1010
line 1280
;1279:
;1280:	cgs.media.cursor = trap_R_RegisterShaderNoMip( "menu/art/cursor" );
ADDRGP4 $1017
ARGP4
ADDRLP4 588
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1056
ADDRLP4 588
INDIRI4
ASGNI4
line 1282
;1281:#if defined MISSIONPACK || defined USE_NEOHUD
;1282:	cgs.media.menuscreen2 = trap_R_RegisterShader("menuscreen2");
ADDRGP4 $1020
ARGP4
ADDRLP4 592
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1008
ADDRLP4 592
INDIRI4
ASGNI4
line 1284
;1283:	// new stuff
;1284:	cgs.media.patrolShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/patrol.tga");
ADDRGP4 $1023
ARGP4
ADDRLP4 596
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1012
ADDRLP4 596
INDIRI4
ASGNI4
line 1285
;1285:	cgs.media.assaultShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/assault.tga");
ADDRGP4 $1026
ARGP4
ADDRLP4 600
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1016
ADDRLP4 600
INDIRI4
ASGNI4
line 1286
;1286:	cgs.media.campShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/camp.tga");
ADDRGP4 $1029
ARGP4
ADDRLP4 604
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1020
ADDRLP4 604
INDIRI4
ASGNI4
line 1287
;1287:	cgs.media.followShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/follow.tga");
ADDRGP4 $1032
ARGP4
ADDRLP4 608
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1024
ADDRLP4 608
INDIRI4
ASGNI4
line 1288
;1288:	cgs.media.defendShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/defend.tga");
ADDRGP4 $1035
ARGP4
ADDRLP4 612
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1028
ADDRLP4 612
INDIRI4
ASGNI4
line 1289
;1289:	cgs.media.teamLeaderShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/team_leader.tga");
ADDRGP4 $1038
ARGP4
ADDRLP4 616
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1032
ADDRLP4 616
INDIRI4
ASGNI4
line 1290
;1290:	cgs.media.retrieveShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/retrieve.tga");
ADDRGP4 $1041
ARGP4
ADDRLP4 620
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1036
ADDRLP4 620
INDIRI4
ASGNI4
line 1291
;1291:	cgs.media.escortShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/escort.tga");
ADDRGP4 $1044
ARGP4
ADDRLP4 624
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1040
ADDRLP4 624
INDIRI4
ASGNI4
line 1292
;1292:	cgs.media.flagShaders[0] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_in_base.tga");
ADDRGP4 $1047
ARGP4
ADDRLP4 628
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1044
ADDRLP4 628
INDIRI4
ASGNI4
line 1293
;1293:	cgs.media.flagShaders[1] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_capture.tga");
ADDRGP4 $1051
ARGP4
ADDRLP4 632
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1044+4
ADDRLP4 632
INDIRI4
ASGNI4
line 1294
;1294:	cgs.media.flagShaders[2] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_missing.tga");
ADDRGP4 $1055
ARGP4
ADDRLP4 636
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+1044+8
ADDRLP4 636
INDIRI4
ASGNI4
line 1309
;1295:#endif
;1296:
;1297:#ifdef MISSIONPACK
;1298:	cgs.media.sizeCursor 	= trap_R_RegisterShaderNoMip( "ui/assets/sizecursor.tga" );
;1299:	cgs.media.selectCursor 	= trap_R_RegisterShaderNoMip( "ui/assets/selectcursor.tga" );
;1300:	trap_R_RegisterModel( "models/players/james/lower.md3" );
;1301:	trap_R_RegisterModel( "models/players/james/upper.md3" );
;1302:	trap_R_RegisterModel( "models/players/heads/james/james.md3" );
;1303:
;1304:	trap_R_RegisterModel( "models/players/janet/lower.md3" );
;1305:	trap_R_RegisterModel( "models/players/janet/upper.md3" );
;1306:	trap_R_RegisterModel( "models/players/heads/janet/janet.md3" );
;1307:
;1308:#endif
;1309:	CG_ClearParticles ();
ADDRGP4 CG_ClearParticles
CALLV
pop
line 1322
;1310:/*
;1311:	for (i=1; i<MAX_PARTICLES_AREAS; i++)
;1312:	{
;1313:		{
;1314:			int rval;
;1315:
;1316:			rval = CG_NewParticleArea ( CS_PARTICLES + i);
;1317:			if (!rval)
;1318:				break;
;1319:		}
;1320:	}
;1321:*/
;1322:}
LABELV $628
endproc CG_RegisterGraphics 640 16
export CG_BuildSpectatorString
proc CG_BuildSpectatorString 12 12
line 1332
;1323:
;1324:
;1325:
;1326:/*																																			
;1327:=======================
;1328:CG_BuildSpectatorString
;1329:
;1330:=======================
;1331:*/
;1332:void CG_BuildSpectatorString( void ) {
line 1334
;1333:	int i;
;1334:	cg.spectatorList[0] = 0;
ADDRGP4 cg+243196
CNSTI1 0
ASGNI1
line 1335
;1335:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1058
line 1336
;1336:		if (cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1062
ADDRLP4 0
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012+36
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1062
line 1337
;1337:			Q_strcat(cg.spectatorList, sizeof(cg.spectatorList), va("%s     ", cgs.clientinfo[i].name));
ADDRGP4 $1069
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012+4
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 cg+243196
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1338
;1338:		}
LABELV $1062
line 1339
;1339:	}
LABELV $1059
line 1335
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1058
line 1340
;1340:	i = strlen(cg.spectatorList);
ADDRGP4 cg+243196
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1341
;1341:	if (i != cg.spectatorLen) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+244220
INDIRI4
EQI4 $1073
line 1342
;1342:		cg.spectatorLen = i;
ADDRGP4 cg+244220
ADDRLP4 0
INDIRI4
ASGNI4
line 1343
;1343:		cg.spectatorWidth = -1;
ADDRGP4 cg+244224
CNSTF4 3212836864
ASGNF4
line 1344
;1344:	}
LABELV $1073
line 1345
;1345:}
LABELV $1056
endproc CG_BuildSpectatorString 12 12
proc CG_RegisterClients 12 4
line 1353
;1346:
;1347:
;1348:/*																																			
;1349:===================
;1350:CG_RegisterClients
;1351:===================
;1352:*/
;1353:static void CG_RegisterClients( void ) {
line 1356
;1354:	int		i;
;1355:
;1356:	CG_LoadingClient(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1357
;1357:	CG_NewClientInfo(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1359
;1358:
;1359:	cg.heightStand = 0;
ADDRGP4 cg+282960
CNSTF4 0
ASGNF4
line 1360
;1360:	cg.heightCrouch = 0;
ADDRGP4 cg+282964
CNSTF4 0
ASGNF4
line 1363
;1361:
;1362:	// get player stand height vor VR adjust
;1363:	CG_GetModelHeight( 0 );
CNSTI4 0
ARGI4
ADDRGP4 CG_GetModelHeight
CALLV
pop
line 1366
;1364:
;1365:	// get player crouch height
;1366:	CG_GetModelHeight( 1 );
CNSTI4 1
ARGI4
ADDRGP4 CG_GetModelHeight
CALLV
pop
line 1368
;1367:
;1368:	for (i=0 ; i<MAX_CLIENTS ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1083
line 1371
;1369:		const char		*clientInfo;
;1370:
;1371:		if (cg.clientNum == i) {
ADDRGP4 cg+4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1087
line 1372
;1372:			continue;
ADDRGP4 $1084
JUMPV
LABELV $1087
line 1375
;1373:		}
;1374:
;1375:		clientInfo = CG_ConfigString( CS_PLAYERS+i );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 1376
;1376:		if ( !clientInfo[0]) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1090
line 1377
;1377:			continue;
ADDRGP4 $1084
JUMPV
LABELV $1090
line 1379
;1378:		}
;1379:		CG_LoadingClient( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1380
;1380:		CG_NewClientInfo( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1381
;1381:	}
LABELV $1084
line 1368
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1083
line 1382
;1382:	CG_BuildSpectatorString();
ADDRGP4 CG_BuildSpectatorString
CALLV
pop
line 1383
;1383:}
LABELV $1078
endproc CG_RegisterClients 12 4
export CG_ConfigString
proc CG_ConfigString 4 8
line 1392
;1384:
;1385://===========================================================================
;1386:
;1387:/*
;1388:=================
;1389:CG_ConfigString
;1390:=================
;1391:*/
;1392:const char *CG_ConfigString( int index ) {
line 1393
;1393:	if ( index < 0 || index >= MAX_CONFIGSTRINGS ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1095
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $1093
LABELV $1095
line 1394
;1394:		CG_Error( "CG_ConfigString: bad index: %i", index );
ADDRGP4 $1096
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1395
;1395:		return "";
ADDRGP4 $229
RETP4
ADDRGP4 $1092
JUMPV
LABELV $1093
line 1397
;1396:	}
;1397:	return cgs.gameState.stringData + cgs.gameState.stringOffsets[ index ];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs
ADDP4
INDIRI4
ADDRGP4 cgs+4096
ADDP4
RETP4
LABELV $1092
endproc CG_ConfigString 4 8
export CG_StartMusic
proc CG_StartMusic 144 12
line 1408
;1398:}
;1399:
;1400://==================================================================
;1401:
;1402:/*
;1403:======================
;1404:CG_StartMusic
;1405:
;1406:======================
;1407:*/
;1408:void CG_StartMusic( void ) {
line 1413
;1409:	char	*s;
;1410:	char	parm1[MAX_QPATH], parm2[MAX_QPATH];
;1411:
;1412:	// start the background music
;1413:	s = (char *)CG_ConfigString( CS_MUSIC );
CNSTI4 2
ARGI4
ADDRLP4 132
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 132
INDIRP4
ASGNP4
line 1414
;1414:	Q_strncpyz( parm1, COM_Parse( &s ), sizeof( parm1 ) );
ADDRLP4 0
ARGP4
ADDRLP4 136
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1415
;1415:	Q_strncpyz( parm2, COM_Parse( &s ), sizeof( parm2 ) );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 68
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1417
;1416:
;1417:	trap_S_StartBackgroundTrack( parm1, parm2 );
ADDRLP4 4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 trap_S_StartBackgroundTrack
CALLV
pop
line 1418
;1418:}
LABELV $1098
endproc CG_StartMusic 144 12
export CG_Cvar_Get
proc CG_Cvar_Get 132 12
line 1926
;1419:#ifdef MISSIONPACK
;1420:char *CG_GetMenuBuffer(const char *filename) {
;1421:	int	len;
;1422:	fileHandle_t	f;
;1423:	static char buf[MAX_MENUFILE];
;1424:
;1425:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
;1426:	if ( !f ) {
;1427:		trap_Print( va( S_COLOR_RED "menu file not found: %s, using default\n", filename ) );
;1428:		return NULL;
;1429:	}
;1430:	if ( len >= MAX_MENUFILE ) {
;1431:		trap_Print( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i\n", filename, len, MAX_MENUFILE ) );
;1432:		trap_FS_FCloseFile( f );
;1433:		return NULL;
;1434:	}
;1435:
;1436:	trap_FS_Read( buf, len, f );
;1437:	buf[len] = 0;
;1438:	trap_FS_FCloseFile( f );
;1439:
;1440:	return buf;
;1441:}
;1442:
;1443://
;1444:// ==============================
;1445:// new hud stuff ( mission pack )
;1446:// ==============================
;1447://
;1448:qboolean CG_Asset_Parse(int handle) {
;1449:	pc_token_t token;
;1450:	const char *tempStr;
;1451:
;1452:	if (!trap_PC_ReadToken(handle, &token))
;1453:		return qfalse;
;1454:	if (Q_stricmp(token.string, "{") != 0) {
;1455:		return qfalse;
;1456:	}
;1457:
;1458:	while ( 1 ) {
;1459:		if (!trap_PC_ReadToken(handle, &token))
;1460:			return qfalse;
;1461:
;1462:		if (Q_stricmp(token.string, "}") == 0) {
;1463:			return qtrue;
;1464:		}
;1465:
;1466:		// font
;1467:		if (Q_stricmp(token.string, "font") == 0) {
;1468:			int pointSize;
;1469:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1470:				return qfalse;
;1471:			}
;1472:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.textFont);
;1473:			continue;
;1474:		}
;1475:
;1476:		// smallFont
;1477:		if (Q_stricmp(token.string, "smallFont") == 0) {
;1478:			int pointSize;
;1479:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1480:				return qfalse;
;1481:			}
;1482:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.smallFont);
;1483:			continue;
;1484:		}
;1485:
;1486:		// bigfont
;1487:		if (Q_stricmp(token.string, "bigfont") == 0) {
;1488:			int pointSize;
;1489:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1490:				return qfalse;
;1491:			}
;1492:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.bigFont);
;1493:			continue;
;1494:		}
;1495:
;1496:		// gradientbar
;1497:		if (Q_stricmp(token.string, "gradientbar") == 0) {
;1498:			if (!PC_String_Parse(handle, &tempStr)) {
;1499:				return qfalse;
;1500:			}
;1501:			cgDC.Assets.gradientBar = trap_R_RegisterShaderNoMip(tempStr);
;1502:			continue;
;1503:		}
;1504:
;1505:		// enterMenuSound
;1506:		if (Q_stricmp(token.string, "menuEnterSound") == 0) {
;1507:			if (!PC_String_Parse(handle, &tempStr)) {
;1508:				return qfalse;
;1509:			}
;1510:			cgDC.Assets.menuEnterSound = trap_S_RegisterSound( tempStr, qfalse );
;1511:			continue;
;1512:		}
;1513:
;1514:		// exitMenuSound
;1515:		if (Q_stricmp(token.string, "menuExitSound") == 0) {
;1516:			if (!PC_String_Parse(handle, &tempStr)) {
;1517:				return qfalse;
;1518:			}
;1519:			cgDC.Assets.menuExitSound = trap_S_RegisterSound( tempStr, qfalse );
;1520:			continue;
;1521:		}
;1522:
;1523:		// itemFocusSound
;1524:		if (Q_stricmp(token.string, "itemFocusSound") == 0) {
;1525:			if (!PC_String_Parse(handle, &tempStr)) {
;1526:				return qfalse;
;1527:			}
;1528:			cgDC.Assets.itemFocusSound = trap_S_RegisterSound( tempStr, qfalse );
;1529:			continue;
;1530:		}
;1531:
;1532:		// menuBuzzSound
;1533:		if (Q_stricmp(token.string, "menuBuzzSound") == 0) {
;1534:			if (!PC_String_Parse(handle, &tempStr)) {
;1535:				return qfalse;
;1536:			}
;1537:			cgDC.Assets.menuBuzzSound = trap_S_RegisterSound( tempStr, qfalse );
;1538:			continue;
;1539:		}
;1540:
;1541:		if (Q_stricmp(token.string, "cursor") == 0) {
;1542:			if (!PC_String_Parse(handle, &cgDC.Assets.cursorStr)) {
;1543:				return qfalse;
;1544:			}
;1545:			cgDC.Assets.cursor = trap_R_RegisterShaderNoMip( cgDC.Assets.cursorStr);
;1546:			continue;
;1547:		}
;1548:
;1549:		if (Q_stricmp(token.string, "fadeClamp") == 0) {
;1550:			if (!PC_Float_Parse(handle, &cgDC.Assets.fadeClamp)) {
;1551:				return qfalse;
;1552:			}
;1553:			continue;
;1554:		}
;1555:
;1556:		if (Q_stricmp(token.string, "fadeCycle") == 0) {
;1557:			if (!PC_Int_Parse(handle, &cgDC.Assets.fadeCycle)) {
;1558:				return qfalse;
;1559:			}
;1560:			continue;
;1561:		}
;1562:
;1563:		if (Q_stricmp(token.string, "fadeAmount") == 0) {
;1564:			if (!PC_Float_Parse(handle, &cgDC.Assets.fadeAmount)) {
;1565:				return qfalse;
;1566:			}
;1567:			continue;
;1568:		}
;1569:
;1570:		if (Q_stricmp(token.string, "shadowX") == 0) {
;1571:			if (!PC_Float_Parse(handle, &cgDC.Assets.shadowX)) {
;1572:				return qfalse;
;1573:			}
;1574:			continue;
;1575:		}
;1576:
;1577:		if (Q_stricmp(token.string, "shadowY") == 0) {
;1578:			if (!PC_Float_Parse(handle, &cgDC.Assets.shadowY)) {
;1579:				return qfalse;
;1580:			}
;1581:			continue;
;1582:		}
;1583:
;1584:		if (Q_stricmp(token.string, "shadowColor") == 0) {
;1585:			if (!PC_Color_Parse(handle, &cgDC.Assets.shadowColor)) {
;1586:				return qfalse;
;1587:			}
;1588:			cgDC.Assets.shadowFadeClamp = cgDC.Assets.shadowColor[3];
;1589:			continue;
;1590:		}
;1591:	}
;1592:	return qfalse;
;1593:}
;1594:
;1595:void CG_ParseMenu(const char *menuFile) {
;1596:	pc_token_t token;
;1597:	int handle;
;1598:
;1599:	handle = trap_PC_LoadSource(menuFile);
;1600:	if (!handle)
;1601:		handle = trap_PC_LoadSource("ui/testhud.menu");
;1602:	if (!handle)
;1603:		return;
;1604:
;1605:	while ( 1 ) {
;1606:		if (!trap_PC_ReadToken( handle, &token )) {
;1607:			break;
;1608:		}
;1609:
;1610:		//if ( Q_stricmp( token, "{" ) ) {
;1611:		//	Com_Printf( "Missing { in menu file\n" );
;1612:		//	break;
;1613:		//}
;1614:
;1615:		//if ( menuCount == MAX_MENUS ) {
;1616:		//	Com_Printf( "Too many menus!\n" );
;1617:		//	break;
;1618:		//}
;1619:
;1620:		if ( token.string[0] == '}' ) {
;1621:			break;
;1622:		}
;1623:
;1624:		if (Q_stricmp(token.string, "assetGlobalDef") == 0) {
;1625:			if (CG_Asset_Parse(handle)) {
;1626:				continue;
;1627:			} else {
;1628:				break;
;1629:			}
;1630:		}
;1631:
;1632:
;1633:		if (Q_stricmp(token.string, "menudef") == 0) {
;1634:			// start a new menu
;1635:			Menu_New(handle);
;1636:		}
;1637:	}
;1638:	trap_PC_FreeSource(handle);
;1639:}
;1640:
;1641:qboolean CG_Load_Menu(char **p) {
;1642:	char *token;
;1643:
;1644:	token = COM_ParseExt(p, qtrue);
;1645:
;1646:	if (token[0] != '{') {
;1647:		return qfalse;
;1648:	}
;1649:
;1650:	while ( 1 ) {
;1651:
;1652:		token = COM_ParseExt(p, qtrue);
;1653:
;1654:		if (Q_stricmp(token, "}") == 0) {
;1655:			return qtrue;
;1656:		}
;1657:
;1658:		if ( !token || token[0] == 0 ) {
;1659:			return qfalse;
;1660:		}
;1661:
;1662:		CG_ParseMenu(token); 
;1663:	}
;1664:	return qfalse;
;1665:}
;1666:
;1667:
;1668:
;1669:void CG_LoadMenus(const char *menuFile) {
;1670:	char	*token;
;1671:	char *p;
;1672:	int	len, start;
;1673:	fileHandle_t	f;
;1674:	static char buf[MAX_MENUDEFFILE];
;1675:
;1676:	start = trap_Milliseconds();
;1677:
;1678:	len = trap_FS_FOpenFile( menuFile, &f, FS_READ );
;1679:	if ( !f ) {
;1680:		trap_Error( va( S_COLOR_YELLOW "menu file not found: %s, using default\n", menuFile ) );
;1681:		len = trap_FS_FOpenFile( "ui/hud.txt", &f, FS_READ );
;1682:		if (!f) {
;1683:			trap_Error( va( S_COLOR_RED "default menu file not found: ui/hud.txt, unable to continue!\n", menuFile ) );
;1684:		}
;1685:	}
;1686:
;1687:	if ( len >= MAX_MENUDEFFILE ) {
;1688:		trap_FS_FCloseFile( f );
;1689:		trap_Error( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", menuFile, len, MAX_MENUDEFFILE ) );
;1690:		return;
;1691:	}
;1692:
;1693:	trap_FS_Read( buf, len, f );
;1694:	buf[len] = 0;
;1695:	trap_FS_FCloseFile( f );
;1696:	
;1697:	COM_Compress(buf);
;1698:
;1699:	Menu_Reset();
;1700:
;1701:	p = buf;
;1702:
;1703:	while ( 1 ) {
;1704:		token = COM_ParseExt( &p, qtrue );
;1705:		if( !token || token[0] == 0 || token[0] == '}') {
;1706:			break;
;1707:		}
;1708:
;1709:		//if ( Q_stricmp( token, "{" ) ) {
;1710:		//	Com_Printf( "Missing { in menu file\n" );
;1711:		//	break;
;1712:		//}
;1713:
;1714:		//if ( menuCount == MAX_MENUS ) {
;1715:		//	Com_Printf( "Too many menus!\n" );
;1716:		//	break;
;1717:		//}
;1718:
;1719:		if ( Q_stricmp( token, "}" ) == 0 ) {
;1720:			break;
;1721:		}
;1722:
;1723:		if (Q_stricmp(token, "loadmenu") == 0) {
;1724:			if (CG_Load_Menu(&p)) {
;1725:				continue;
;1726:			} else {
;1727:				break;
;1728:			}
;1729:		}
;1730:	}
;1731:
;1732:	Com_Printf("UI menu load time = %d milli seconds\n", trap_Milliseconds() - start);
;1733:
;1734:}
;1735:
;1736:
;1737:
;1738:static qboolean CG_OwnerDrawHandleKey(int ownerDraw, int flags, float *special, int key) {
;1739:	return qfalse;
;1740:}
;1741:
;1742:
;1743:static int CG_FeederCount(float feederID) {
;1744:	int i, count;
;1745:	count = 0;
;1746:	if (feederID == FEEDER_REDTEAM_LIST) {
;1747:		for (i = 0; i < cg.numScores; i++) {
;1748:			if (cg.scores[i].team == TEAM_RED) {
;1749:				count++;
;1750:			}
;1751:		}
;1752:	} else if (feederID == FEEDER_BLUETEAM_LIST) {
;1753:		for (i = 0; i < cg.numScores; i++) {
;1754:			if (cg.scores[i].team == TEAM_BLUE) {
;1755:				count++;
;1756:			}
;1757:		}
;1758:	} else if (feederID == FEEDER_SCOREBOARD) {
;1759:		return cg.numScores;
;1760:	}
;1761:	return count;
;1762:}
;1763:
;1764:
;1765:void CG_SetScoreSelection(void *p) {
;1766:	menuDef_t *menu = (menuDef_t*)p;
;1767:	playerState_t *ps = &cg.snap->ps;
;1768:	int i, red, blue;
;1769:	red = blue = 0;
;1770:	for (i = 0; i < cg.numScores; i++) {
;1771:		if (cg.scores[i].team == TEAM_RED) {
;1772:			red++;
;1773:		} else if (cg.scores[i].team == TEAM_BLUE) {
;1774:			blue++;
;1775:		}
;1776:		if (ps->clientNum == cg.scores[i].client) {
;1777:			cg.selectedScore = i;
;1778:		}
;1779:	}
;1780:
;1781:	if (menu == NULL) {
;1782:		// just interested in setting the selected score
;1783:		return;
;1784:	}
;1785:
;1786:	if ( cgs.gametype >= GT_TEAM ) {
;1787:		int feeder = FEEDER_REDTEAM_LIST;
;1788:		i = red;
;1789:		if (cg.scores[cg.selectedScore].team == TEAM_BLUE) {
;1790:			feeder = FEEDER_BLUETEAM_LIST;
;1791:			i = blue;
;1792:		}
;1793:		Menu_SetFeederSelection(menu, feeder, i, NULL);
;1794:	} else {
;1795:		Menu_SetFeederSelection(menu, FEEDER_SCOREBOARD, cg.selectedScore, NULL);
;1796:	}
;1797:}
;1798:
;1799:// FIXME: might need to cache this info
;1800:static clientInfo_t * CG_InfoFromScoreIndex(int index, int team, int *scoreIndex) {
;1801:	int i, count;
;1802:	if ( cgs.gametype >= GT_TEAM ) {
;1803:		count = 0;
;1804:		for (i = 0; i < cg.numScores; i++) {
;1805:			if (cg.scores[i].team == team) {
;1806:				if (count == index) {
;1807:					*scoreIndex = i;
;1808:					return &cgs.clientinfo[cg.scores[i].client];
;1809:				}
;1810:				count++;
;1811:			}
;1812:		}
;1813:	}
;1814:	*scoreIndex = index;
;1815:	return &cgs.clientinfo[ cg.scores[index].client ];
;1816:}
;1817:
;1818:static const char *CG_FeederItemText(float feederID, int index, int column, qhandle_t *handle) {
;1819:	gitem_t *item;
;1820:	int scoreIndex = 0;
;1821:	clientInfo_t *info = NULL;
;1822:	int team = -1;
;1823:	score_t *sp = NULL;
;1824:
;1825:	*handle = -1;
;1826:
;1827:	if (feederID == FEEDER_REDTEAM_LIST) {
;1828:		team = TEAM_RED;
;1829:	} else if (feederID == FEEDER_BLUETEAM_LIST) {
;1830:		team = TEAM_BLUE;
;1831:	}
;1832:
;1833:	info = CG_InfoFromScoreIndex(index, team, &scoreIndex);
;1834:	sp = &cg.scores[scoreIndex];
;1835:
;1836:	if (info && info->infoValid) {
;1837:		switch (column) {
;1838:			case 0:
;1839:				if ( info->powerups & ( 1 << PW_NEUTRALFLAG ) ) {
;1840:					item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
;1841:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
;1842:				} else if ( info->powerups & ( 1 << PW_REDFLAG ) ) {
;1843:					item = BG_FindItemForPowerup( PW_REDFLAG );
;1844:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
;1845:				} else if ( info->powerups & ( 1 << PW_BLUEFLAG ) ) {
;1846:					item = BG_FindItemForPowerup( PW_BLUEFLAG );
;1847:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
;1848:				} else {
;1849:					if ( info->botSkill > 0 && info->botSkill <= 5 ) {
;1850:						*handle = cgs.media.botSkillShaders[ info->botSkill - 1 ];
;1851:					} else if ( info->handicap < 100 ) {
;1852:					return va("%i", info->handicap );
;1853:					}
;1854:				}
;1855:			break;
;1856:			case 1:
;1857:				if (team == -1) {
;1858:					return "";
;1859:				} else {
;1860:					*handle = CG_StatusHandle(info->teamTask);
;1861:				}
;1862:		  break;
;1863:			case 2:
;1864:				if ( cg.snap->ps.stats[ STAT_CLIENTS_READY ] & ( 1 << sp->client ) ) {
;1865:					return "Ready";
;1866:				}
;1867:				if (team == -1) {
;1868:					if (cgs.gametype == GT_TOURNAMENT) {
;1869:						return va("%i/%i", info->wins, info->losses);
;1870:					} else if (info->infoValid && info->team == TEAM_SPECTATOR ) {
;1871:						return "Spectator";
;1872:					} else {
;1873:						return "";
;1874:					}
;1875:				} else {
;1876:					if (info->teamLeader) {
;1877:						return "Leader";
;1878:					}
;1879:				}
;1880:			break;
;1881:			case 3:
;1882:				return info->name;
;1883:			break;
;1884:			case 4:
;1885:				return va("%i", info->score);
;1886:			break;
;1887:			case 5:
;1888:				return va("%4i", sp->time);
;1889:			break;
;1890:			case 6:
;1891:				if ( sp->ping == -1 ) {
;1892:					return "connecting";
;1893:				} 
;1894:				return va("%4i", sp->ping);
;1895:			break;
;1896:		}
;1897:	}
;1898:
;1899:	return "";
;1900:}
;1901:
;1902:static qhandle_t CG_FeederItemImage(float feederID, int index) {
;1903:	return 0;
;1904:}
;1905:
;1906:static void CG_FeederSelection(float feederID, int index) {
;1907:	if ( cgs.gametype >= GT_TEAM ) {
;1908:		int i, count;
;1909:		int team = (feederID == FEEDER_REDTEAM_LIST) ? TEAM_RED : TEAM_BLUE;
;1910:		count = 0;
;1911:		for (i = 0; i < cg.numScores; i++) {
;1912:			if (cg.scores[i].team == team) {
;1913:				if (index == count) {
;1914:					cg.selectedScore = i;
;1915:				}
;1916:				count++;
;1917:			}
;1918:		}
;1919:	} else {
;1920:		cg.selectedScore = index;
;1921:	}
;1922:}
;1923:#endif
;1924:
;1925:#if defined MISSIONPACK || defined USE_NEOHUD
;1926:/*static*/ float CG_Cvar_Get(const char *cvar) {
line 1928
;1927:	char buff[128];
;1928:	memset(buff, 0, sizeof(buff));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1929
;1929:	trap_Cvar_VariableStringBuffer(cvar, buff, sizeof(buff));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1930
;1930:	return atof(buff);
ADDRLP4 0
ARGP4
ADDRLP4 128
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 128
INDIRF4
RETF4
LABELV $1099
endproc CG_Cvar_Get 132 12
export CG_Init
proc CG_Init 312 12
line 2084
;1931:}
;1932:#endif
;1933:
;1934:#ifdef MISSIONPACK
;1935:void CG_Text_PaintWithCursor(float x, float y, float scale, vec4_t color, const char *text, int cursorPos, char cursor, int limit, int style) {
;1936:	CG_Text_Paint(x, y, scale, color, text, 0, limit, style);
;1937:}
;1938:
;1939:static int CG_OwnerDrawWidth(int ownerDraw, float scale) {
;1940:	switch (ownerDraw) {
;1941:	  case CG_GAME_TYPE:
;1942:			return CG_Text_Width(CG_GameTypeString(), scale, 0);
;1943:	  case CG_GAME_STATUS:
;1944:			return CG_Text_Width(CG_GetGameStatusText(), scale, 0);
;1945:			break;
;1946:	  case CG_KILLER:
;1947:			return CG_Text_Width(CG_GetKillerText(), scale, 0);
;1948:			break;
;1949:	  case CG_RED_NAME:
;1950:			return CG_Text_Width(cg_redTeamName.string, scale, 0);
;1951:			break;
;1952:	  case CG_BLUE_NAME:
;1953:			return CG_Text_Width(cg_blueTeamName.string, scale, 0);
;1954:			break;
;1955:
;1956:
;1957:	}
;1958:	return 0;
;1959:}
;1960:
;1961:static int CG_PlayCinematic(const char *name, float x, float y, float w, float h) {
;1962:  return trap_CIN_PlayCinematic(name, x, y, w, h, CIN_loop);
;1963:}
;1964:
;1965:static void CG_StopCinematic(int handle) {
;1966:  trap_CIN_StopCinematic(handle);
;1967:}
;1968:
;1969:static void CG_DrawCinematic(int handle, float x, float y, float w, float h) {
;1970:  trap_CIN_SetExtents(handle, x, y, w, h);
;1971:  trap_CIN_DrawCinematic(handle);
;1972:}
;1973:
;1974:static void CG_RunCinematicFrame(int handle) {
;1975:  trap_CIN_RunCinematic(handle);
;1976:}
;1977:
;1978:/*
;1979:=================
;1980:CG_LoadHudMenu();
;1981:
;1982:=================
;1983:*/
;1984:void CG_LoadHudMenu( void ) {
;1985:	char buff[1024];
;1986:	const char *hudSet;
;1987:
;1988:	cgDC.registerShaderNoMip = &trap_R_RegisterShaderNoMip;
;1989:	cgDC.setColor = &trap_R_SetColor;
;1990:	cgDC.drawHandlePic = &CG_DrawPic;
;1991:	cgDC.drawStretchPic = &trap_R_DrawStretchPic;
;1992:	cgDC.drawText = &CG_Text_Paint;
;1993:	cgDC.textWidth = &CG_Text_Width;
;1994:	cgDC.textHeight = &CG_Text_Height;
;1995:	cgDC.registerModel = &trap_R_RegisterModel;
;1996:	cgDC.modelBounds = &trap_R_ModelBounds;
;1997:	cgDC.fillRect = &CG_FillRect;
;1998:	cgDC.drawRect = &CG_DrawRect;   
;1999:	cgDC.drawSides = &CG_DrawSides;
;2000:	cgDC.drawTopBottom = &CG_DrawTopBottom;
;2001:	cgDC.clearScene = &trap_R_ClearScene;
;2002:	cgDC.addRefEntityToScene = &trap_R_AddRefEntityToScene;
;2003:	cgDC.renderScene = &trap_R_RenderScene;
;2004:	cgDC.registerFont = &trap_R_RegisterFont;
;2005:	cgDC.ownerDrawItem = &CG_OwnerDraw;
;2006:	cgDC.getValue = &CG_GetValue;
;2007:	cgDC.ownerDrawVisible = &CG_OwnerDrawVisible;
;2008:	cgDC.runScript = &CG_RunMenuScript;
;2009:	cgDC.getTeamColor = &CG_GetTeamColor;
;2010:	cgDC.setCVar = trap_Cvar_Set;
;2011:	cgDC.getCVarString = trap_Cvar_VariableStringBuffer;
;2012:	cgDC.getCVarValue = CG_Cvar_Get;
;2013:	cgDC.drawTextWithCursor = &CG_Text_PaintWithCursor;
;2014:	//cgDC.setOverstrikeMode = &trap_Key_SetOverstrikeMode;
;2015:	//cgDC.getOverstrikeMode = &trap_Key_GetOverstrikeMode;
;2016:	cgDC.startLocalSound = &trap_S_StartLocalSound;
;2017:	cgDC.ownerDrawHandleKey = &CG_OwnerDrawHandleKey;
;2018:	cgDC.feederCount = &CG_FeederCount;
;2019:	cgDC.feederItemImage = &CG_FeederItemImage;
;2020:	cgDC.feederItemText = &CG_FeederItemText;
;2021:	cgDC.feederSelection = &CG_FeederSelection;
;2022:	//cgDC.setBinding = &trap_Key_SetBinding;
;2023:	//cgDC.getBindingBuf = &trap_Key_GetBindingBuf;
;2024:	//cgDC.keynumToStringBuf = &trap_Key_KeynumToStringBuf;
;2025:	//cgDC.executeText = &trap_Cmd_ExecuteText;
;2026:	cgDC.Error = &Com_Error; 
;2027:	cgDC.Print = &Com_Printf; 
;2028:	cgDC.ownerDrawWidth = &CG_OwnerDrawWidth;
;2029:	//cgDC.Pause = &CG_Pause;
;2030:	cgDC.registerSound = &trap_S_RegisterSound;
;2031:	cgDC.startBackgroundTrack = &trap_S_StartBackgroundTrack;
;2032:	cgDC.stopBackgroundTrack = &trap_S_StopBackgroundTrack;
;2033:	cgDC.playCinematic = &CG_PlayCinematic;
;2034:	cgDC.stopCinematic = &CG_StopCinematic;
;2035:	cgDC.drawCinematic = &CG_DrawCinematic;
;2036:	cgDC.runCinematicFrame = &CG_RunCinematicFrame;
;2037:	
;2038:	Init_Display(&cgDC);
;2039:
;2040:	Menu_Reset();
;2041:	
;2042:	trap_Cvar_VariableStringBuffer("cg_hudFiles", buff, sizeof(buff));
;2043:	hudSet = buff;
;2044:	if (hudSet[0] == '\0') {
;2045:		hudSet = "ui/hud.txt";
;2046:	}
;2047:
;2048:	CG_LoadMenus(hudSet);
;2049:}
;2050:
;2051:void CG_AssetCache( void ) {
;2052:	//if (Assets.textFont == NULL) {
;2053:	//  trap_R_RegisterFont("fonts/arial.ttf", 72, &Assets.textFont);
;2054:	//}
;2055:	//Assets.background = trap_R_RegisterShaderNoMip( ASSET_BACKGROUND );
;2056:	//Com_Printf("Menu Size: %i bytes\n", sizeof(Menus));
;2057:	cgDC.Assets.gradientBar = trap_R_RegisterShaderNoMip( ASSET_GRADIENTBAR );
;2058:	cgDC.Assets.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
;2059:	cgDC.Assets.fxPic[0] = trap_R_RegisterShaderNoMip( ART_FX_RED );
;2060:	cgDC.Assets.fxPic[1] = trap_R_RegisterShaderNoMip( ART_FX_YELLOW );
;2061:	cgDC.Assets.fxPic[2] = trap_R_RegisterShaderNoMip( ART_FX_GREEN );
;2062:	cgDC.Assets.fxPic[3] = trap_R_RegisterShaderNoMip( ART_FX_TEAL );
;2063:	cgDC.Assets.fxPic[4] = trap_R_RegisterShaderNoMip( ART_FX_BLUE );
;2064:	cgDC.Assets.fxPic[5] = trap_R_RegisterShaderNoMip( ART_FX_CYAN );
;2065:	cgDC.Assets.fxPic[6] = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
;2066:	cgDC.Assets.scrollBar = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR );
;2067:	cgDC.Assets.scrollBarArrowDown = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWDOWN );
;2068:	cgDC.Assets.scrollBarArrowUp = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWUP );
;2069:	cgDC.Assets.scrollBarArrowLeft = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWLEFT );
;2070:	cgDC.Assets.scrollBarArrowRight = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWRIGHT );
;2071:	cgDC.Assets.scrollBarThumb = trap_R_RegisterShaderNoMip( ASSET_SCROLL_THUMB );
;2072:	cgDC.Assets.sliderBar = trap_R_RegisterShaderNoMip( ASSET_SLIDER_BAR );
;2073:	cgDC.Assets.sliderThumb = trap_R_RegisterShaderNoMip( ASSET_SLIDER_THUMB );
;2074:}
;2075:#endif
;2076:/*
;2077:=================
;2078:CG_Init
;2079:
;2080:Called after every level change or subsystem restart
;2081:Will perform callbacks to make the loading info screen update.
;2082:=================
;2083:*/
;2084:void CG_Init( int serverMessageNum, int serverCommandSequence, int clientNum ) {
line 2089
;2085:	char  value[MAX_CVAR_VALUE_STRING];
;2086:	const char	*s;
;2087:
;2088:	// clear everything
;2089:	memset( &cgs, 0, sizeof( cgs ) );
ADDRGP4 cgs
ARGP4
CNSTI4 0
ARGI4
CNSTI4 151712
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2090
;2090:	memset( &cg, 0, sizeof( cg ) );
ADDRGP4 cg
ARGP4
CNSTI4 0
ARGI4
CNSTI4 283036
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2091
;2091:	memset( cg_entities, 0, sizeof(cg_entities) );
ADDRGP4 cg_entities
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1265664
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2092
;2092:	memset( cg_weapons, 0, sizeof(cg_weapons) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2093
;2093:	memset( cg_items, 0, sizeof(cg_items) );
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 7168
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2095
;2094:
;2095:	cg.clientNum = clientNum;
ADDRGP4 cg+4
ADDRFP4 8
INDIRI4
ASGNI4
line 2097
;2096:
;2097:	cgs.processedSnapshotNum = serverMessageNum;
ADDRGP4 cgs+31488
ADDRFP4 0
INDIRI4
ASGNI4
line 2098
;2098:	cgs.serverCommandSequence = serverCommandSequence;
ADDRGP4 cgs+31484
ADDRFP4 4
INDIRI4
ASGNI4
line 2100
;2099:
;2100:	trap_Cvar_VariableStringBuffer( "//trap_GetValue", value, sizeof( value ) );
ADDRGP4 $1104
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2101
;2101:	if ( value[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1105
line 2103
;2102:#ifdef Q3_VM
;2103:		trap_GetValue = (void*)~atoi( value );
ADDRLP4 0
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
line 2104
;2104:		if ( trap_GetValue( value, sizeof( value ), "trap_R_AddRefEntityToScene2" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $1109
ARGP4
ADDRLP4 264
ADDRGP4 trap_GetValue
INDIRP4
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $1107
line 2105
;2105:			trap_R_AddRefEntityToScene2 = (void*)~atoi( value );
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 trap_R_AddRefEntityToScene2
ADDRLP4 268
INDIRI4
BCOMI4
CVIU4 4
CVUP4 4
ASGNP4
line 2106
;2106:			intShaderTime = qtrue;
ADDRGP4 intShaderTime
CNSTI4 1
ASGNI4
line 2107
;2107:		}
LABELV $1107
line 2108
;2108:		if ( trap_GetValue( value, sizeof( value ), "trap_R_AddLinearLightToScene_Q3E" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $1112
ARGP4
ADDRLP4 268
ADDRGP4 trap_GetValue
INDIRP4
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $1110
line 2109
;2109:			trap_R_AddLinearLightToScene = (void*)~atoi( value );
ADDRLP4 0
ARGP4
ADDRLP4 272
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 trap_R_AddLinearLightToScene
ADDRLP4 272
INDIRI4
BCOMI4
CVIU4 4
CVUP4 4
ASGNP4
line 2110
;2110:			linearLight = qtrue;
ADDRGP4 linearLight
CNSTI4 1
ASGNI4
line 2111
;2111:		}
LABELV $1110
line 2123
;2112:#else
;2113:		dll_com_trapGetValue = atoi( value );
;2114:		if ( trap_GetValue( value, sizeof( value ), "trap_R_AddRefEntityToScene2" ) ) {
;2115:			dll_trap_R_AddRefEntityToScene2 = atoi( value );
;2116:			intShaderTime = qtrue;
;2117:		}
;2118:		if ( trap_GetValue( value, sizeof( value ), "trap_R_AddLinearLightToScene_Q3E" ) ) {
;2119:			dll_trap_R_AddLinearLightToScene = atoi( value );
;2120:			linearLight = qtrue;
;2121:		}
;2122:#endif
;2123:	}
LABELV $1105
line 2126
;2124:
;2125:	// load a few needed things before we do any screen updates
;2126:	cgs.media.charsetShader		= trap_R_RegisterShader( "gfx/2d/bigchars" );
ADDRGP4 $1114
ARGP4
ADDRLP4 260
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560
ADDRLP4 260
INDIRI4
ASGNI4
line 2127
;2127:	cgs.media.whiteShader		= trap_R_RegisterShader( "white" );
ADDRGP4 $1117
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+150560+16
ADDRLP4 264
INDIRI4
ASGNI4
line 2128
;2128:	cgs.media.charsetProp		= trap_R_RegisterShaderNoMip( "menu/art/font1_prop.tga" );
ADDRGP4 $1120
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+4
ADDRLP4 268
INDIRI4
ASGNI4
line 2129
;2129:	cgs.media.charsetPropGlow	= trap_R_RegisterShaderNoMip( "menu/art/font1_prop_glo.tga" );
ADDRGP4 $1123
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+8
ADDRLP4 272
INDIRI4
ASGNI4
line 2130
;2130:	cgs.media.charsetPropB		= trap_R_RegisterShaderNoMip( "menu/art/font2_prop.tga" );
ADDRGP4 $1126
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+150560+12
ADDRLP4 276
INDIRI4
ASGNI4
line 2132
;2131:
;2132:	CG_RegisterCvars();
ADDRGP4 CG_RegisterCvars
CALLV
pop
line 2134
;2133:
;2134:	CG_InitConsoleCommands();
ADDRGP4 CG_InitConsoleCommands
CALLV
pop
line 2136
;2135:
;2136:	cg.weaponSelect = WP_MACHINEGUN;
ADDRGP4 cg+236704
CNSTI4 2
ASGNI4
line 2138
;2137:
;2138:	cgs.redflag = cgs.blueflag = -1; // For compatibily, default to unset for
ADDRLP4 280
CNSTI4 -1
ASGNI4
ADDRGP4 cgs+34852
ADDRLP4 280
INDIRI4
ASGNI4
ADDRGP4 cgs+34848
ADDRLP4 280
INDIRI4
ASGNI4
line 2139
;2139:	cgs.flagStatus = -1;
ADDRGP4 cgs+34856
CNSTI4 -1
ASGNI4
line 2143
;2140:	// old servers
;2141:
;2142:	// get the rendering configuration from the client system
;2143:	trap_GetGlconfig( &cgs.glconfig );
ADDRGP4 cgs+20100
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 2145
;2144:
;2145:	CG_ChangeFrameResolution(cgs.glconfig.vidWidth, cgs.glconfig.vidHeight);
ADDRGP4 cgs+20100+11304
INDIRI4
ARGI4
ADDRGP4 cgs+20100+11308
INDIRI4
ARGI4
ADDRGP4 CG_ChangeFrameResolution
CALLV
pop
line 2148
;2146:
;2147:#ifdef USE_NEW_FONT_RENDERER
;2148:	CG_LoadFonts();
ADDRGP4 CG_LoadFonts
CALLV
pop
line 2152
;2149:#endif
;2150:
;2151:	// get the gamestate from the client system
;2152:	trap_GetGameState( &cgs.gameState );
ADDRGP4 cgs
ARGP4
ADDRGP4 trap_GetGameState
CALLV
pop
line 2155
;2153:
;2154:	// check version
;2155:	s = CG_ConfigString( CS_GAME_VERSION );
CNSTI4 20
ARGI4
ADDRLP4 284
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 256
ADDRLP4 284
INDIRP4
ASGNP4
line 2156
;2156:	if ( strstr( s, "defrag-" ) ) {
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 $1138
ARGP4
ADDRLP4 288
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 288
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1136
line 2157
;2157:		cgs.defrag = qtrue;
ADDRGP4 cgs+151680
CNSTI4 1
ASGNI4
line 2158
;2158:	} else if ( strcmp( s, GAME_VERSION ) ) {
ADDRGP4 $1137
JUMPV
LABELV $1136
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 $1142
ARGP4
ADDRLP4 292
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $1140
line 2159
;2159:		CG_Error( "Client/Server game mismatch: %s/%s", GAME_VERSION, s );
ADDRGP4 $1143
ARGP4
ADDRGP4 $1142
ARGP4
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2160
;2160:	}
LABELV $1140
LABELV $1137
line 2162
;2161:
;2162:	cgs.ospEnc = atoi( CG_ConfigString( 872 ) ) & 1;
CNSTI4 872
ARGI4
ADDRLP4 296
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 296
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+151676
ADDRLP4 300
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 2164
;2163:
;2164:	s = CG_ConfigString( CS_LEVEL_START_TIME );
CNSTI4 21
ARGI4
ADDRLP4 304
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 256
ADDRLP4 304
INDIRP4
ASGNP4
line 2165
;2165:	cgs.levelStartTime = atoi( s );
ADDRLP4 256
INDIRP4
ARGP4
ADDRLP4 308
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+34836
ADDRLP4 308
INDIRI4
ASGNI4
line 2167
;2166:
;2167:	CG_ParseServerinfo();
ADDRGP4 CG_ParseServerinfo
CALLV
pop
line 2168
;2168:	CG_ParseSysteminfo();
ADDRGP4 CG_ParseSysteminfo
CALLV
pop
line 2171
;2169:
;2170:	// load the new map
;2171:	CG_LoadingString( "collision map" );
ADDRGP4 $1146
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2173
;2172:
;2173:	trap_CM_LoadMap( cgs.mapname );
ADDRGP4 cgs+31524
ARGP4
ADDRGP4 trap_CM_LoadMap
CALLV
pop
line 2176
;2174:
;2175:#if defined MISSIONPACK || defined USE_NEOHUD
;2176:	String_Init();
ADDRGP4 String_Init
CALLV
pop
line 2179
;2177:#endif
;2178:
;2179:	cg.loading = qtrue;		// force players to load instead of defer
ADDRGP4 cg+20
CNSTI4 1
ASGNI4
line 2181
;2180:
;2181:	CG_LoadingString( "sounds" );
ADDRGP4 $1149
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2183
;2182:
;2183:	CG_RegisterSounds();
ADDRGP4 CG_RegisterSounds
CALLV
pop
line 2185
;2184:
;2185:	CG_LoadingString( "graphics" );
ADDRGP4 $1150
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2187
;2186:
;2187:	CG_RegisterGraphics();
ADDRGP4 CG_RegisterGraphics
CALLV
pop
line 2189
;2188:
;2189:	CG_LoadingString( "clients" );
ADDRGP4 $1151
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2191
;2190:
;2191:	CG_RegisterClients();	// if low on memory, some clients will be deferred
ADDRGP4 CG_RegisterClients
CALLV
pop
line 2199
;2192:
;2193:#ifdef MISSIONPACK
;2194:	CG_AssetCache();
;2195:	CG_LoadHudMenu();      	// load new hud stuff
;2196:#endif
;2197:
;2198:#ifdef USE_NEOHUD
;2199:	CG_CheckHUD();			// full parse of selected HUD
ADDRGP4 CG_CheckHUD
CALLI4
pop
line 2202
;2200:#endif
;2201:
;2202:	cg.loading = qfalse;	// future players will be deferred
ADDRGP4 cg+20
CNSTI4 0
ASGNI4
line 2204
;2203:
;2204:	CG_InitLocalEntities();
ADDRGP4 CG_InitLocalEntities
CALLV
pop
line 2206
;2205:
;2206:	CG_InitMarkPolys();
ADDRGP4 CG_InitMarkPolys
CALLV
pop
line 2209
;2207:
;2208:	// remove the last loading update
;2209:	cg.infoScreenText[0] = 0;
ADDRGP4 cg+237208
CNSTI1 0
ASGNI1
line 2214
;2210:
;2211:	// Make sure we have update values (scores)
;2212:	// CG_SetConfigValues();
;2213:
;2214:	CG_StartMusic();
ADDRGP4 CG_StartMusic
CALLV
pop
line 2216
;2215:
;2216:	CG_LoadingString( "" );
ADDRGP4 $229
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2222
;2217:
;2218:#ifdef MISSIONPACK
;2219:	CG_InitTeamChat();
;2220:#endif
;2221:
;2222:	CG_ShaderStateChanged();
ADDRGP4 CG_ShaderStateChanged
CALLV
pop
line 2224
;2223:
;2224:	trap_S_ClearLoopingSounds( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 trap_S_ClearLoopingSounds
CALLV
pop
line 2225
;2225:}
LABELV $1100
endproc CG_Init 312 12
export CG_Shutdown
proc CG_Shutdown 0 0
line 2235
;2226:
;2227:
;2228:/*
;2229:=================
;2230:CG_Shutdown
;2231:
;2232:Called before every level change or subsystem restart
;2233:=================
;2234:*/
;2235:void CG_Shutdown( void ) {
line 2238
;2236:	// some mods may need to do cleanup work here,
;2237:	// like closing files or archiving session data
;2238:}
LABELV $1154
endproc CG_Shutdown 0 0
export CG_EventHandling
proc CG_EventHandling 0 0
line 2252
;2239:
;2240:
;2241:/*
;2242:==================
;2243:CG_EventHandling
;2244:==================
;2245: type 0 - no event handling
;2246:      1 - team menu
;2247:      2 - scoreboard
;2248:      3 - hud editor
;2249:*/
;2250:#ifndef MISSIONPACK
;2251:void CG_EventHandling( cgame_event_t type ) 
;2252:{
line 2254
;2253:
;2254:}
LABELV $1155
endproc CG_EventHandling 0 0
export CG_SetScoreCatcher
proc CG_SetScoreCatcher 36 4
line 2258
;2255:
;2256:
;2257:void CG_SetScoreCatcher( qboolean enable )
;2258:{
line 2262
;2259:	int	currentCatcher, newCatcher, old_state, new_state;
;2260:	qboolean spectator;
;2261:
;2262:	currentCatcher = trap_Key_GetCatcher();
ADDRLP4 20
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 2264
;2263:
;2264:	if ( currentCatcher & KEYCATCH_CONSOLE || !cg.snap )
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $1160
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1157
LABELV $1160
line 2265
;2265:		return;
ADDRGP4 $1156
JUMPV
LABELV $1157
line 2267
;2266:	
;2267:	spectator = cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR || cg.demoPlayback || ( cg.snap->ps.pm_flags & PMF_FOLLOW );
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1168
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $1168
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1165
LABELV $1168
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $1166
JUMPV
LABELV $1165
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $1166
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 2269
;2268:
;2269:	if ( enable && spectator ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1169
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1169
line 2270
;2270:		cgs.score_key = trap_Key_GetKey( "+scores" );
ADDRGP4 $1172
ARGP4
ADDRLP4 28
ADDRGP4 trap_Key_GetKey
CALLI4
ASGNI4
ADDRGP4 cgs+151692
ADDRLP4 28
INDIRI4
ASGNI4
line 2271
;2271:		cgs.score_catched = qtrue;
ADDRGP4 cgs+151688
CNSTI4 1
ASGNI4
line 2272
;2272:		newCatcher = currentCatcher | KEYCATCH_CGAME;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 2273
;2273:	} else {
ADDRGP4 $1170
JUMPV
LABELV $1169
line 2274
;2274:		cgs.score_catched = qfalse;
ADDRGP4 cgs+151688
CNSTI4 0
ASGNI4
line 2275
;2275:		newCatcher = currentCatcher & ~KEYCATCH_CGAME;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 2276
;2276:	}
LABELV $1170
line 2278
;2277:
;2278:	if ( newCatcher != currentCatcher ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $1175
line 2279
;2279:		if ( cgs.score_key ) {
ADDRGP4 cgs+151692
INDIRI4
CNSTI4 0
EQI4 $1177
line 2282
;2280:			// keycatcher change may cause reset of all pressed buttons on new engines
;2281:			// so track state of scoreboard key and ignore first upcoming keyup event for it
;2282:			old_state = trap_Key_IsDown( cgs.score_key );
ADDRGP4 cgs+151692
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 trap_Key_IsDown
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 2283
;2283:			trap_Key_SetCatcher( newCatcher );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 2284
;2284:			new_state = trap_Key_IsDown( cgs.score_key );
ADDRGP4 cgs+151692
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 trap_Key_IsDown
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 32
INDIRI4
ASGNI4
line 2285
;2285:			if ( new_state != old_state ) {
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1178
line 2286
;2286:				cgs.filterKeyUpEvent = qtrue;
ADDRGP4 cgs+151684
CNSTI4 1
ASGNI4
line 2287
;2287:			}
line 2288
;2288:		} else {
ADDRGP4 $1178
JUMPV
LABELV $1177
line 2289
;2289:			trap_Key_SetCatcher( newCatcher );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 2290
;2290:		}
LABELV $1178
line 2291
;2291:	}
LABELV $1175
line 2292
;2292:}
LABELV $1156
endproc CG_SetScoreCatcher 36 4
export CG_KeyEvent
proc CG_KeyEvent 0 4
line 2296
;2293:
;2294:
;2295:void CG_KeyEvent( int key, qboolean down ) 
;2296:{
line 2298
;2297:	// process scoreboard clicks etc.
;2298:	if ( cgs.score_catched && down ) 
ADDRGP4 cgs+151688
INDIRI4
CNSTI4 0
EQI4 $1186
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1186
line 2299
;2299:	{
line 2300
;2300:		if ( key == /*K_TAB*/ cgs.score_key )
ADDRFP4 0
INDIRI4
ADDRGP4 cgs+151692
INDIRI4
NEI4 $1189
line 2301
;2301:			return;
ADDRGP4 $1185
JUMPV
LABELV $1189
line 2302
;2302:		if ( key == /*K_MOUSE1*/178 )
ADDRFP4 0
INDIRI4
CNSTI4 178
NEI4 $1192
line 2303
;2303:			CG_ScoreboardClick();
ADDRGP4 CG_ScoreboardClick
CALLV
pop
ADDRGP4 $1193
JUMPV
LABELV $1192
line 2305
;2304:		else
;2305:			CG_SetScoreCatcher( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 CG_SetScoreCatcher
CALLV
pop
LABELV $1193
line 2306
;2306:	}
LABELV $1186
line 2307
;2307:}
LABELV $1185
endproc CG_KeyEvent 0 4
export CG_MouseEvent
proc CG_MouseEvent 12 12
line 2311
;2308:
;2309:
;2310:// The z arg is for getting 3D collision point
;2311:void CG_MouseEvent( int x, int y, int z ) {
line 2312
;2312:	cgs.cursorX += x * cgs.cursorScaleR;
ADDRLP4 0
ADDRGP4 cgs+151696
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+31456
INDIRF4
MULF4
ADDF4
ASGNF4
line 2313
;2313:	cgs.cursorY += y * cgs.cursorScaleR;
ADDRLP4 4
ADDRGP4 cgs+151700
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 cgs+31456
INDIRF4
MULF4
ADDF4
ASGNF4
line 2314
;2314:	cgs.cursorZ = (z < 0) ? 0 : z;
ADDRFP4 8
INDIRI4
CNSTI4 0
GEI4 $1201
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1202
JUMPV
LABELV $1201
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
LABELV $1202
ADDRGP4 cgs+151704
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
line 2316
;2315:
;2316:	ClampFloat(cgs.screenXmin, cgs.screenXmax, cgs.cursorX);
ADDRGP4 cgs+31468
INDIRF4
ARGF4
ADDRGP4 cgs+31472
INDIRF4
ARGF4
ADDRGP4 cgs+151696
INDIRF4
ARGF4
ADDRGP4 ClampFloat
CALLF4
pop
line 2317
;2317:	ClampFloat(cgs.screenYmin, cgs.screenYmax, cgs.cursorY);
ADDRGP4 cgs+31476
INDIRF4
ARGF4
ADDRGP4 cgs+31480
INDIRF4
ARGF4
ADDRGP4 cgs+151700
INDIRF4
ARGF4
ADDRGP4 ClampFloat
CALLF4
pop
line 2318
;2318:}
LABELV $1194
endproc CG_MouseEvent 12 12
bss
export laserBeamRGBA
align 4
LABELV laserBeamRGBA
skip 272
export laserBeamStabilized
align 4
LABELV laserBeamStabilized
skip 272
export cg_hudFiles
align 4
LABELV cg_hudFiles
skip 272
export cg_firstPersonBodyScale
align 4
LABELV cg_firstPersonBodyScale
skip 272
export trap_GetValue
align 4
LABELV trap_GetValue
skip 4
export trap_R_AddLinearLightToScene
align 4
LABELV trap_R_AddLinearLightToScene
skip 4
export trap_R_AddRefEntityToScene2
align 4
LABELV trap_R_AddRefEntityToScene2
skip 4
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
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_LoadMenus
export laserBeam
align 4
LABELV laserBeam
skip 272
export vr_controller_type
align 4
LABELV vr_controller_type
skip 272
export menu_distance
align 4
LABELV menu_distance
skip 272
export VR_angle_hide_torso
align 4
LABELV VR_angle_hide_torso
skip 272
export VR_hide_torso
align 4
LABELV VR_hide_torso
skip 272
export showVirtualKeyboard
align 4
LABELV showVirtualKeyboard
skip 272
import eventnames
export cg_followKiller
align 4
LABELV cg_followKiller
skip 272
export cg_fovAdjust
align 4
LABELV cg_fovAdjust
skip 272
export cg_deadBodyDarken
align 4
LABELV cg_deadBodyDarken
skip 272
export cg_teamColors
align 4
LABELV cg_teamColors
skip 272
export cg_teamModel
align 4
LABELV cg_teamModel
skip 272
export cg_enemyColors
align 4
LABELV cg_enemyColors
skip 272
export cg_enemyModel
align 4
LABELV cg_enemyModel
skip 272
export cg_hitSounds
align 4
LABELV cg_hitSounds
skip 272
export cg_currentSelectedPlayer
align 4
LABELV cg_currentSelectedPlayer
skip 272
export cg_trueLightning
align 4
LABELV cg_trueLightning
skip 272
export cg_oldPlasma
align 4
LABELV cg_oldPlasma
skip 272
export cg_oldRocket
align 4
LABELV cg_oldRocket
skip 272
export cg_oldRail
align 4
LABELV cg_oldRail
skip 272
export cg_noProjectileTrail
align 4
LABELV cg_noProjectileTrail
skip 272
export cg_noTaunt
align 4
LABELV cg_noTaunt
skip 272
export cg_bigFont
align 4
LABELV cg_bigFont
skip 272
export cg_smallFont
align 4
LABELV cg_smallFont
skip 272
export cg_cameraMode
align 4
LABELV cg_cameraMode
skip 272
export cg_timescale
align 4
LABELV cg_timescale
skip 272
export cg_timescaleFadeSpeed
align 4
LABELV cg_timescaleFadeSpeed
skip 272
export cg_timescaleFadeEnd
align 4
LABELV cg_timescaleFadeEnd
skip 272
export cg_cameraOrbitDelay
align 4
LABELV cg_cameraOrbitDelay
skip 272
export cg_cameraOrbit
align 4
LABELV cg_cameraOrbit
skip 272
export cg_smoothClients
align 4
LABELV cg_smoothClients
skip 272
import cg_allowDeathCam
export cg_itemTimer
align 4
LABELV cg_itemTimer
skip 272
export cg_scorePlum
align 4
LABELV cg_scorePlum
skip 272
export cg_noVoiceText
align 4
LABELV cg_noVoiceText
skip 272
export cg_noVoiceChats
align 4
LABELV cg_noVoiceChats
skip 272
export cg_teamChatsOnly
align 4
LABELV cg_teamChatsOnly
skip 272
export cg_drawFriend
align 4
LABELV cg_drawFriend
skip 272
export cg_deferPlayers
align 4
LABELV cg_deferPlayers
skip 272
export cg_predictItems
align 4
LABELV cg_predictItems
skip 272
export cg_blood
align 4
LABELV cg_blood
skip 272
export cg_paused
align 4
LABELV cg_paused
skip 272
export cg_buildScript
align 4
LABELV cg_buildScript
skip 272
export cg_forceModel
align 4
LABELV cg_forceModel
skip 272
export cg_stats
align 4
LABELV cg_stats
skip 272
export cg_teamChatHeight
align 4
LABELV cg_teamChatHeight
skip 272
export cg_teamChatTime
align 4
LABELV cg_teamChatTime
skip 272
export cg_drawSpeed
align 4
LABELV cg_drawSpeed
skip 272
export cg_drawAttacker
align 4
LABELV cg_drawAttacker
skip 272
export cg_drawPing
align 4
LABELV cg_drawPing
skip 272
export cg_lagometer
align 4
LABELV cg_lagometer
skip 272
export cg_thirdPerson
align 4
LABELV cg_thirdPerson
skip 272
export cg_thirdPersonAngle
align 4
LABELV cg_thirdPersonAngle
skip 272
export cg_thirdPersonRange
align 4
LABELV cg_thirdPersonRange
skip 272
export cg_zoomFov
align 4
LABELV cg_zoomFov
skip 272
export cg_fov
align 4
LABELV cg_fov
skip 272
export cg_simpleItems
align 4
LABELV cg_simpleItems
skip 272
export cg_ignore
align 4
LABELV cg_ignore
skip 272
export cg_autoswitch
align 4
LABELV cg_autoswitch
skip 272
export cg_tracerLength
align 4
LABELV cg_tracerLength
skip 272
export cg_tracerWidth
align 4
LABELV cg_tracerWidth
skip 272
export cg_tracerChance
align 4
LABELV cg_tracerChance
skip 272
export cg_viewsize
align 4
LABELV cg_viewsize
skip 272
export cg_drawGun
align 4
LABELV cg_drawGun
skip 272
export cg_gun_z
align 4
LABELV cg_gun_z
skip 272
export cg_gun_y
align 4
LABELV cg_gun_y
skip 272
export cg_gun_x
align 4
LABELV cg_gun_x
skip 272
export cg_gun_frame
align 4
LABELV cg_gun_frame
skip 272
export cg_brassTime
align 4
LABELV cg_brassTime
skip 272
export cg_addMarks
align 4
LABELV cg_addMarks
skip 272
export cg_footsteps
align 4
LABELV cg_footsteps
skip 272
export cg_showmiss
align 4
LABELV cg_showmiss
skip 272
export cg_noPlayerAnims
align 4
LABELV cg_noPlayerAnims
skip 272
export cg_nopredict
align 4
LABELV cg_nopredict
skip 272
export cg_errorDecay
align 4
LABELV cg_errorDecay
skip 272
export cg_railTrailRadius
align 4
LABELV cg_railTrailRadius
skip 272
export cg_railTrailTime
align 4
LABELV cg_railTrailTime
skip 272
export cg_debugEvents
align 4
LABELV cg_debugEvents
skip 272
export cg_debugPosition
align 4
LABELV cg_debugPosition
skip 272
export cg_debugAnim
align 4
LABELV cg_debugAnim
skip 272
export cg_animSpeed
align 4
LABELV cg_animSpeed
skip 272
export cg_draw2D
align 4
LABELV cg_draw2D
skip 272
export cg_drawStatus
align 4
LABELV cg_drawStatus
skip 272
export cg_crosshairHealth
align 4
LABELV cg_crosshairHealth
skip 272
export cg_crosshairSize
align 4
LABELV cg_crosshairSize
skip 272
export cg_crosshairY
align 4
LABELV cg_crosshairY
skip 272
export cg_crosshairX
align 4
LABELV cg_crosshairX
skip 272
export cg_drawWeaponSelect
align 4
LABELV cg_drawWeaponSelect
skip 272
export cg_teamOverlayUserinfo
align 4
LABELV cg_teamOverlayUserinfo
skip 272
export cg_drawTeamOverlay
align 4
LABELV cg_drawTeamOverlay
skip 272
export cg_drawRewards
align 4
LABELV cg_drawRewards
skip 272
export cg_drawCrosshairNames
align 4
LABELV cg_drawCrosshairNames
skip 272
export cg_drawCrosshair
align 4
LABELV cg_drawCrosshair
skip 272
export cg_drawAmmoWarning
align 4
LABELV cg_drawAmmoWarning
skip 272
export cg_drawIcons
align 4
LABELV cg_drawIcons
skip 272
export cg_draw3dIcons
align 4
LABELV cg_draw3dIcons
skip 272
export cg_drawSnapshot
align 4
LABELV cg_drawSnapshot
skip 272
export cg_drawFPS
align 4
LABELV cg_drawFPS
skip 272
export cg_drawTimer
align 4
LABELV cg_drawTimer
skip 272
export cg_gibs
align 4
LABELV cg_gibs
skip 272
export cg_shadows
align 4
LABELV cg_shadows
skip 272
export cg_swingSpeed
align 4
LABELV cg_swingSpeed
skip 272
export cg_bobroll
align 4
LABELV cg_bobroll
skip 272
export cg_bobpitch
align 4
LABELV cg_bobpitch
skip 272
export cg_bobup
align 4
LABELV cg_bobup
skip 272
export cg_runroll
align 4
LABELV cg_runroll
skip 272
export cg_runpitch
align 4
LABELV cg_runpitch
skip 272
export cg_centertime
align 4
LABELV cg_centertime
skip 272
import cg_markPolys
export cg_items
align 4
LABELV cg_items
skip 7168
export cg_weapons
align 4
LABELV cg_weapons
skip 2176
export cg_entities
align 4
LABELV cg_entities
skip 1265664
export cg
align 4
LABELV cg
skip 283036
export cgs
align 4
LABELV cgs
skip 151712
export cg_weaponSelectorSimple2DIcons
align 4
LABELV cg_weaponSelectorSimple2DIcons
skip 272
export cg_debugWeaponAiming
align 4
LABELV cg_debugWeaponAiming
skip 272
export cg_fragMessage
align 4
LABELV cg_fragMessage
skip 272
export cg_playerShadow
align 4
LABELV cg_playerShadow
skip 272
export cg_weaponbob
align 4
LABELV cg_weaponbob
skip 272
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
LABELV $1172
byte 1 43
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $1151
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1150
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $1149
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $1146
byte 1 99
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $1143
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 47
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1142
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 113
byte 1 51
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $1138
byte 1 100
byte 1 101
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 45
byte 1 0
align 1
LABELV $1126
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 50
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1123
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 49
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 95
byte 1 103
byte 1 108
byte 1 111
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1120
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 49
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1117
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1114
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 105
byte 1 103
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $1112
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 95
byte 1 82
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 76
byte 1 105
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 84
byte 1 111
byte 1 83
byte 1 99
byte 1 101
byte 1 110
byte 1 101
byte 1 95
byte 1 81
byte 1 51
byte 1 69
byte 1 0
align 1
LABELV $1109
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 95
byte 1 82
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 82
byte 1 101
byte 1 102
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 84
byte 1 111
byte 1 83
byte 1 99
byte 1 101
byte 1 110
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $1104
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
LABELV $1096
byte 1 67
byte 1 71
byte 1 95
byte 1 67
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1069
byte 1 37
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $1055
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1051
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1047
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1044
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 101
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1041
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 118
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1038
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1035
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1032
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1029
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1026
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1023
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 98
byte 1 97
byte 1 114
byte 1 47
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1020
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 50
byte 1 0
align 1
LABELV $1017
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1000
byte 1 42
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $993
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 47
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 95
byte 1 115
byte 1 112
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $990
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 77
byte 1 97
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $987
byte 1 119
byte 1 97
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $984
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $981
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $978
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 95
byte 1 108
byte 1 103
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $975
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $972
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $956
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 81
byte 1 76
byte 1 47
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $952
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 81
byte 1 76
byte 1 47
byte 1 116
byte 1 100
byte 1 109
byte 1 0
align 1
LABELV $945
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 81
byte 1 76
byte 1 47
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $941
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 81
byte 1 76
byte 1 47
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $938
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $935
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $932
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $929
byte 1 109
byte 1 101
byte 1 100
byte 1 97
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
LABELV $926
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
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
LABELV $923
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
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
LABELV $920
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 69
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $917
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $914
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 111
byte 1 109
byte 1 48
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $911
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 48
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $908
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $905
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 69
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $902
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 111
byte 1 110
byte 1 51
byte 1 0
align 1
LABELV $897
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 98
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $894
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $891
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 108
byte 1 101
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $888
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $885
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 97
byte 1 114
byte 1 109
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $882
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $879
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 102
byte 1 105
byte 1 115
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $876
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 101
byte 1 115
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $873
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $870
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 97
byte 1 98
byte 1 100
byte 1 111
byte 1 109
byte 1 101
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $867
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 47
byte 1 115
byte 1 95
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $864
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 95
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $861
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 114
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $858
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $855
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 98
byte 1 97
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $852
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
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
LABELV $844
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 101
byte 1 0
align 1
LABELV $841
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 119
byte 1 104
byte 1 101
byte 1 101
byte 1 108
byte 1 47
byte 1 115
byte 1 108
byte 1 105
byte 1 99
byte 1 101
byte 1 95
byte 1 104
byte 1 95
byte 1 55
byte 1 0
align 1
LABELV $838
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 119
byte 1 104
byte 1 101
byte 1 101
byte 1 108
byte 1 47
byte 1 110
byte 1 101
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $835
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $832
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $829
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 114
byte 1 101
byte 1 100
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $826
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 102
byte 1 108
byte 1 97
byte 1 112
byte 1 51
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $823
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 112
byte 1 111
byte 1 108
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $820
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 51
byte 1 0
align 1
LABELV $816
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 50
byte 1 0
align 1
LABELV $812
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 49
byte 1 0
align 1
LABELV $809
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $805
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 50
byte 1 0
align 1
LABELV $801
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 49
byte 1 0
align 1
LABELV $798
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 98
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $795
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 114
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $787
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $784
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $781
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 114
byte 1 98
byte 1 47
byte 1 98
byte 1 95
byte 1 111
byte 1 114
byte 1 98
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $778
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 114
byte 1 98
byte 1 47
byte 1 114
byte 1 95
byte 1 111
byte 1 114
byte 1 98
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $770
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 83
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $767
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $764
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $761
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $758
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 83
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $755
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $752
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $749
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 111
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $746
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $743
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $736
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $733
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $730
byte 1 119
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 66
byte 1 117
byte 1 98
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $727
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
LABELV $724
byte 1 108
byte 1 97
byte 1 103
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $721
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $718
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 49
byte 1 0
align 1
LABELV $715
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 83
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $712
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 82
byte 1 97
byte 1 103
byte 1 101
byte 1 80
byte 1 114
byte 1 111
byte 1 0
align 1
LABELV $709
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $706
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $703
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $700
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $697
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $694
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $691
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 66
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 66
byte 1 108
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $688
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 53
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $684
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 52
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $680
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 51
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $676
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $672
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $669
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 115
byte 1 47
byte 1 115
byte 1 102
byte 1 120
byte 1 47
byte 1 108
byte 1 111
byte 1 103
byte 1 111
byte 1 53
byte 1 49
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $666
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 108
byte 1 105
byte 1 99
byte 1 101
byte 1 95
byte 1 50
byte 1 52
byte 1 0
align 1
LABELV $662
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 108
byte 1 105
byte 1 99
byte 1 101
byte 1 95
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $658
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 108
byte 1 105
byte 1 99
byte 1 101
byte 1 95
byte 1 55
byte 1 0
align 1
LABELV $654
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 108
byte 1 105
byte 1 99
byte 1 101
byte 1 95
byte 1 53
byte 1 0
align 1
LABELV $645
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 97
byte 1 0
align 1
LABELV $640
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 115
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $639
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 110
byte 1 105
byte 1 110
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $638
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $637
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $636
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 105
byte 1 120
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $635
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $634
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 117
byte 1 114
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $633
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $632
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 119
byte 1 111
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $631
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 111
byte 1 110
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $630
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 122
byte 1 101
byte 1 114
byte 1 111
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $627
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 47
byte 1 104
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 98
byte 1 50
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $624
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 47
byte 1 104
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 98
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $621
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
byte 1 110
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $618
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
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $615
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
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $612
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 120
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $609
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 108
byte 1 120
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $606
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
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
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $603
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
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
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $600
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
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
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $597
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
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $594
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
byte 1 117
byte 1 115
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $591
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
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $588
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 119
byte 1 110
byte 1 97
byte 1 108
byte 1 105
byte 1 109
byte 1 112
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $585
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 119
byte 1 110
byte 1 97
byte 1 108
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $582
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 119
byte 1 110
byte 1 97
byte 1 108
byte 1 105
byte 1 109
byte 1 112
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $563
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
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 99
byte 1 108
byte 1 97
byte 1 110
byte 1 107
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $559
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
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $555
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
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 103
byte 1 121
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $551
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
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 99
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $547
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
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $543
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
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 111
byte 1 116
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $540
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
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $535
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 112
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $532
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
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 117
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $529
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
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $526
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
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $523
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $520
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 105
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $517
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $514
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $511
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $508
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 117
byte 1 109
byte 1 105
byte 1 108
byte 1 105
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $505
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 100
byte 1 101
byte 1 110
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $502
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $499
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
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
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $496
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $493
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 49
byte 1 48
byte 1 48
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $489
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 55
byte 1 53
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $485
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 53
byte 1 48
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $481
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 50
byte 1 53
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $478
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
byte 1 108
byte 1 97
byte 1 110
byte 1 100
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $475
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
byte 1 116
byte 1 97
byte 1 108
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $472
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 111
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $469
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
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $466
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $463
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $460
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
byte 1 105
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $457
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
byte 1 105
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $454
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
byte 1 105
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $451
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
byte 1 105
byte 1 98
byte 1 115
byte 1 112
byte 1 108
byte 1 116
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $448
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
byte 1 117
byte 1 115
byte 1 101
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $445
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
byte 1 119
byte 1 101
byte 1 97
byte 1 114
byte 1 111
byte 1 102
byte 1 102
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $442
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $439
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
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
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 101
byte 1 116
byte 1 98
byte 1 121
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $436
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 95
byte 1 49
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $433
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 49
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $430
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 104
byte 1 111
byte 1 108
byte 1 121
byte 1 115
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $427
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $424
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $421
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $418
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $415
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $407
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $404
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $401
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $398
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $395
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $390
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $387
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
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
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $381
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 116
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $378
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $375
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 114
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $372
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $364
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 112
byte 1 114
byte 1 101
byte 1 112
byte 1 97
byte 1 114
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $361
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $358
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 111
byte 1 110
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $355
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 119
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $352
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $349
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 51
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $346
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 50
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $343
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 49
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $340
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 115
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $337
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 53
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $334
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 49
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $330
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $324
byte 1 80
byte 1 114
byte 1 101
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $253
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
LABELV $252
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $251
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $244
byte 1 115
byte 1 118
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $238
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
LABELV $237
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $236
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $235
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $234
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 118
byte 1 65
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $233
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 66
byte 1 111
byte 1 100
byte 1 121
byte 1 68
byte 1 97
byte 1 114
byte 1 107
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $232
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $231
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $230
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $229
byte 1 0
align 1
LABELV $228
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $227
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 105
byte 1 116
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $226
byte 1 48
byte 1 46
byte 1 48
byte 1 0
align 1
LABELV $225
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 117
byte 1 101
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $224
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $223
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $222
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $221
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $220
byte 1 48
byte 1 46
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $219
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $218
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 80
byte 1 114
byte 1 111
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $217
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 84
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $216
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $215
byte 1 99
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
LABELV $214
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
LABELV $213
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 80
byte 1 108
byte 1 117
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $212
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $211
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 70
byte 1 97
byte 1 100
byte 1 101
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $210
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 70
byte 1 97
byte 1 100
byte 1 101
byte 1 69
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $209
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $208
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
byte 1 68
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $207
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
LABELV $206
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 95
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 99
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $205
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $204
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
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
LABELV $203
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
LABELV $202
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $201
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
LABELV $200
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 86
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $199
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 86
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $198
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 115
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $197
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $196
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $195
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
LABELV $194
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $193
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $192
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
LABELV $191
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $190
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 72
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $189
byte 1 51
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $188
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $187
byte 1 70
byte 1 70
byte 1 67
byte 1 48
byte 1 67
byte 1 48
byte 1 67
byte 1 48
byte 1 0
align 1
LABELV $186
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
LABELV $185
byte 1 53
byte 1 0
align 1
LABELV $184
byte 1 86
byte 1 82
byte 1 95
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 95
byte 1 104
byte 1 105
byte 1 100
byte 1 101
byte 1 95
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $183
byte 1 86
byte 1 82
byte 1 95
byte 1 104
byte 1 105
byte 1 100
byte 1 101
byte 1 95
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $182
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 86
byte 1 105
byte 1 114
byte 1 116
byte 1 117
byte 1 97
byte 1 108
byte 1 75
byte 1 101
byte 1 121
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $181
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 66
byte 1 101
byte 1 97
byte 1 109
byte 1 83
byte 1 116
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $180
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 66
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $179
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
LABELV $178
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
LABELV $177
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $176
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
LABELV $175
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $174
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $173
byte 1 48
byte 1 46
byte 1 52
byte 1 0
align 1
LABELV $172
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $171
byte 1 99
byte 1 103
byte 1 95
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
LABELV $170
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $169
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $168
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $167
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 99
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $166
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $165
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
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
LABELV $164
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 0
align 1
LABELV $163
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $162
byte 1 48
byte 1 46
byte 1 51
byte 1 0
align 1
LABELV $161
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $160
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $159
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $158
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $157
byte 1 48
byte 1 46
byte 1 48
byte 1 48
byte 1 53
byte 1 0
align 1
LABELV $156
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $155
byte 1 48
byte 1 46
byte 1 48
byte 1 48
byte 1 50
byte 1 0
align 1
LABELV $154
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $153
byte 1 51
byte 1 0
align 1
LABELV $152
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $151
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 90
byte 1 0
align 1
LABELV $150
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 89
byte 1 0
align 1
LABELV $149
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 88
byte 1 0
align 1
LABELV $148
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 82
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $147
byte 1 52
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $146
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $145
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $144
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 103
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $143
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
LABELV $142
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $141
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $140
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
LABELV $139
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 89
byte 1 0
align 1
LABELV $138
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 88
byte 1 0
align 1
LABELV $137
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $136
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $135
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $134
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $133
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 82
byte 1 101
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $132
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
LABELV $131
byte 1 52
byte 1 0
align 1
LABELV $130
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
LABELV $129
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $128
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $127
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $126
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $125
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 51
byte 1 100
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $124
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $123
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 80
byte 1 83
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
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
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
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $120
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 50
byte 1 68
byte 1 0
align 1
LABELV $119
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 0
align 1
LABELV $118
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 115
byte 1 0
align 1
LABELV $117
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $116
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
LABELV $115
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $114
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $113
byte 1 50
byte 1 50
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $112
byte 1 99
byte 1 103
byte 1 95
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $111
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $110
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $109
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $108
byte 1 99
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 83
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 50
byte 1 68
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $107
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 65
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $106
byte 1 48
byte 1 0
align 1
LABELV $105
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 66
byte 1 111
byte 1 100
byte 1 121
byte 1 83
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $104
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 77
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $103
byte 1 49
byte 1 0
align 1
LABELV $102
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $99
byte 1 118
byte 1 109
byte 1 77
byte 1 97
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 0
