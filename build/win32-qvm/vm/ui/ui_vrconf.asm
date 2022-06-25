data
align 4
LABELV align_name
address $70
address $71
address $72
address $73
address $74
byte 4 0
align 4
LABELV g_configcvars2
address $75
byte 4 1117782016
byte 4 1117782016
address $76
byte 4 1092616192
byte 4 1092616192
address $77
byte 4 1107034112
byte 4 1107034112
address $78
byte 4 1099169792
byte 4 1099169792
address $79
byte 4 1065353216
byte 4 1065353216
address $80
byte 4 1065353216
byte 4 1065353216
address $81
byte 4 1065353216
byte 4 1065353216
address $82
byte 4 1065353216
byte 4 1065353216
address $83
byte 4 1084227584
byte 4 1084227584
byte 4 0
byte 4 0
byte 4 0
align 4
LABELV g_menuplane_vrconf
address s_vrconf+856
address s_vrconf+936
address s_vrconf+1016
address s_vrconf+1096
byte 4 0
align 4
LABELV g_beam_vrconf
address s_vrconf+1176
address s_vrconf+1244
address s_vrconf+1312
address s_vrconf+1456
address s_vrconf+1536
byte 4 0
align 4
LABELV g_model_vrconf
address s_vrconf+1604
address s_vrconf+1672
byte 4 0
align 4
LABELV g_section
address g_menuplane_vrconf
address g_beam_vrconf
address g_model_vrconf
code
proc VR_Conf_DrawBeam_color 36 20
file "..\..\..\..\code\q3_ui\ui_vrconf.c"
line 207
;1:/*
;2:=======================================================================
;3:VR CONFIGURATION MENU
;4:=======================================================================
;5:*/
;6:#include "ui_local.h"
;7:
;8:#define ART_BACK0			"menu/art/back_0"
;9:#define ART_BACK1			"menu/art/back_1"
;10:#define ART_FRAMEL			"menu/art/frame2_l"
;11:#define ART_FRAMER			"menu/art/frame1_r"
;12:
;13:typedef struct
;14:{
;15:	char*	name;
;16:	float	defaultvalue;
;17:	float	value;	
;18:} configcvar_t;
;19:
;20:#define ART_FX_BASE			"menu/art/fx_base"
;21:#define ART_FX_BLUE			"menu/art/fx_blue"
;22:#define ART_FX_CYAN			"menu/art/fx_cyan"
;23:#define ART_FX_GREEN		"menu/art/fx_grn"
;24:#define ART_FX_RED			"menu/art/fx_red"
;25:#define ART_FX_TEAL			"menu/art/fx_teal"
;26:#define ART_FX_WHITE		"menu/art/fx_white"
;27:#define ART_FX_YELLOW		"menu/art/fx_yel"
;28:
;29:// VR config sections
;30:#define C_MENUPLANE			0
;31:#define C_BEAM				1
;32:#define C_HUD				2
;33:#define C_MODEL				3
;34:#define C_MAX				4
;35:
;36:#define ID_BEAM				100
;37:#define ID_MENUPLANE		101
;38:#define ID_HUD				102
;39:#define ID_MODEL			103
;40:
;41:// 3D Menu
;42:#define ID_DISTANCE			10
;43:#define ID_PLANESNUMBER		11
;44:#define ID_MENU_H_RADIUS	12
;45:#define ID_MENU_V_RADIUS	13
;46:
;47:// Laser beam
;48:#define ID_BEAM_ENABLE		20
;49:#define ID_BEAM_STABILIZED	21
;50:#define ID_BEAM_COLOR		22
;51:#define ID_BEAM_ALPHA 		23
;52:#define ID_laserBeamOthers 	24
;53:
;54:// Player model
;55:#define ID_HIDE_TORSO		40
;56:#define ID_ANGLE_HIDE_TORSO	41
;57:
;58:#define ID_BACK				106
;59:
;60:typedef struct
;61:{
;62:	menuframework_s		menu;
;63:
;64:	menutext_s			banner;
;65:	menubitmap_s		framel;
;66:	menubitmap_s		framer;
;67:
;68:	int					section;
;69:	menutext_s			menuplane;
;70:	menutext_s			beam;
;71:	menutext_s			hud;
;72:	menutext_s			model;
;73:	//===================
;74:	// 3D Menu
;75:	//===================
;76:	menuslider_s 		distance;
;77:	menuslider_s 		planesNumber;
;78:	menuslider_s 		menu_Hradius;
;79:	menuslider_s 		menu_Vradius;
;80:
;81:	//===================
;82:	// Laser beam
;83:	//===================
;84:	menuradiobutton_s	beam_enable;
;85:	menuradiobutton_s	beam_stabilized;
;86:	menulist_s			beam_color;
;87:	qhandle_t			fxBasePic;
;88:	qhandle_t			fxPic[7];
;89:	int					current_fx;
;90:	menuslider_s 		beam_alpha;
;91:	menuradiobutton_s	laserBeamOthers;
;92:
;93:	//===================
;94:	// HUD
;95:	//===================
;96:	//menulist_s  		hud_align;
;97:	//menuslider_s 		hud_align_dist;
;98:
;99:	//===================
;100:	// MODEL
;101:	//===================
;102:	menuradiobutton_s	hide_torso;
;103:	menuslider_s		angle_hide_torso;
;104:
;105:	//===================
;106:	// ToolsBar
;107:	//===================
;108:	//menuradiobutton_s	toolsbar_enable;
;109:	qboolean			changesmade;
;110:	qboolean			waitingforkey;
;111:	menubitmap_s		back;
;112:} controls_t; 	
;113:
;114:static controls_t s_vrconf;
;115:
;116:static const char *align_name[] =
;117:{
;118:	"No HUD",
;119:	"Left",
;120:	"Right",
;121:	"Top",
;122:	"Bottom",
;123:	NULL
;124:};
;125:
;126:static configcvar_t g_configcvars2[] =
;127:{
;128:	//===================
;129:	// 3d menu
;130:	//===================
;131:	{"menu_distance",		80,			80},
;132:	{"menu_planes_nb",		10,			10},
;133:	{"menu_h_radius",		31.5f,		31.5f},
;134:	{"menu_v_radius",		16.5f,		16.5f},
;135:	//===================
;136:	// Laser beam
;137:	//===================
;138:	{"laserBeamPlayer",		1,			1},
;139:	{"laserBeamStabilized",	1,			1},
;140:	// beam_color & beam_alpha are not real cvar. They will be combined into RGBA laserBeamRGBA
;141:	//{"beam_color",		3,			3}, 
;142:	//{"beam_alpha",		125,		125},
;143:	{"laserBeamOthers",		1,			1}, 
;144:	//===================
;145:	// HUD
;146:	//===================
;147:	// GUNNM TODO do we need those ?
;148:	//{"hud_align",			1,			1}, 	// 0: no HUD, 1: left, 2: right, 3: top, 4: bottom
;149:	//{"hud_align_dist",	110,		110}, 
;150:	//===================
;151:	// MODEL
;152:	//===================
;153:	{"VR_hide_torso",		1,			1},
;154:	{"VR_angle_hide_torso",	5,			5},
;155:
;156:	{NULL,					0,			0}
;157:};
;158:
;159:static menucommon_s *g_menuplane_vrconf[] = {
;160:	(menucommon_s *)&s_vrconf.distance,
;161:	(menucommon_s *)&s_vrconf.planesNumber,
;162:	(menucommon_s *)&s_vrconf.menu_Hradius,
;163:	(menucommon_s *)&s_vrconf.menu_Vradius,
;164:	NULL
;165:};
;166:
;167:static menucommon_s *g_beam_vrconf[] =
;168:{
;169:	(menucommon_s *)&s_vrconf.beam_enable,
;170:	(menucommon_s *)&s_vrconf.beam_stabilized,
;171:	(menucommon_s *)&s_vrconf.beam_color,
;172:	(menucommon_s *)&s_vrconf.beam_alpha,
;173:	(menucommon_s *)&s_vrconf.laserBeamOthers,
;174:	NULL
;175:};
;176:
;177:/*static menucommon_s *g_hud_vrconf[] = {
;178:	(menucommon_s *)&s_vrconf.hud_align,
;179:	(menucommon_s *)&s_vrconf.hud_align_dist,
;180:	NULL
;181:};*/
;182:
;183:static menucommon_s *g_model_vrconf[] = {
;184:	(menucommon_s *)&s_vrconf.hide_torso,
;185:	(menucommon_s *)&s_vrconf.angle_hide_torso,
;186:	NULL
;187:};
;188:
;189:/*static menucommon_s *g_toolsbar_vrconf[] = {
;190:	(menucommon_s *)&s_vrconf.toolsbar_enable, 
;191:	NULL
;192:};*/
;193:
;194:static menucommon_s **g_section[] = {
;195:	g_menuplane_vrconf,
;196:	g_beam_vrconf,
;197:	//g_hud_vrconf,
;198:	g_model_vrconf/*,
;199:	g_toolsbar_vrconf*/
;200:};
;201:
;202:/*
;203:=================
;204:PlayerSettings_DrawEffects
;205:=================
;206:*/
;207:static void VR_Conf_DrawBeam_color( void *self ) {
line 213
;208:	menulist_s		*item;
;209:	qboolean		focus;
;210:	int				style;
;211:	float			*color;
;212:
;213:	item = (menulist_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 214
;214:	focus = (item->generic.parent->cursor == item->generic.menuPosition);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $97
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $98
JUMPV
LABELV $97
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $98
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 216
;215:
;216:	style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 217
;217:	color = text_color_normal;
ADDRLP4 8
ADDRGP4 text_color_normal
ASGNP4
line 219
;218:
;219:	if( focus ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $99
line 220
;220:		style |= UI_PULSE;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 221
;221:		color = text_color_highlight;
ADDRLP4 8
ADDRGP4 text_color_highlight
ASGNP4
line 222
;222:	}
LABELV $99
line 224
;223:
;224:	UI_DrawString( item->generic.x -64, item->generic.y, "color", style, color );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
SUBI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 $101
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 225
;225:	UI_DrawHandlePic( item->generic.x /*+ 64*/, item->generic.y /*+ PROP_HEIGHT*/ + 8, 128, 8, s_vrconf.fxBasePic );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 s_vrconf+1420
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 226
;226:	UI_DrawHandlePic( item->generic.x /*+ 64*/ + item->curvalue * 16 + 8, item->generic.y /*+ PROP_HEIGHT*/ + 6, 16, 12, s_vrconf.fxPic[item->curvalue] );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 6
ADDI4
CVIF4 4
ARGF4
CNSTF4 1098907648
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_vrconf+1424
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 227
;227:}
LABELV $95
endproc VR_Conf_DrawBeam_color 36 20
proc VRconf_InitCvars 28 8
line 235
;228:
;229:/*
;230:=================
;231:VRconf_InitCvars
;232:=================
;233:*/
;234:static void VRconf_InitCvars( void )
;235:{
line 239
;236:	int				i;
;237:	configcvar_t*	cvarptr;
;238:
;239:	cvarptr = g_configcvars2;
ADDRLP4 0
ADDRGP4 g_configcvars2
ASGNP4
line 240
;240:	for (i=0; ;i++,cvarptr++)
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $105
line 241
;241:	{
line 242
;242:		if (!cvarptr->name)
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $109
line 243
;243:			break;
ADDRGP4 $107
JUMPV
LABELV $109
line 246
;244:
;245:		// get current value
;246:		cvarptr->value = trap_Cvar_VariableValue( cvarptr->name );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 249
;247:
;248:		// get default value
;249:		trap_Cvar_Reset( cvarptr->name );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Reset
CALLV
pop
line 250
;250:		cvarptr->defaultvalue = trap_Cvar_VariableValue( cvarptr->name );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 253
;251:
;252:		// restore current value
;253:		trap_Cvar_SetValue( cvarptr->name, cvarptr->value );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 254
;254:	}
LABELV $106
line 240
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRGP4 $105
JUMPV
LABELV $107
line 255
;255:}
LABELV $104
endproc VRconf_InitCvars 28 8
proc VRconf_GetCvarDefault 12 8
line 263
;256:
;257:/*
;258:=================
;259:VRconf_GetCvarDefault
;260:=================
;261:*/
;262:static float VRconf_GetCvarDefault( char* name )
;263:{
line 267
;264:	configcvar_t*	cvarptr;
;265:	int				i;
;266:
;267:	cvarptr = g_configcvars2;
ADDRLP4 0
ADDRGP4 g_configcvars2
ASGNP4
line 268
;268:	for (i=0; ;i++,cvarptr++)
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $112
line 269
;269:	{
line 270
;270:		if (!cvarptr->name)
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $116
line 271
;271:			return (0);
CNSTF4 0
RETF4
ADDRGP4 $111
JUMPV
LABELV $116
line 273
;272:
;273:		if (!strcmp(cvarptr->name, name))
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $118
line 274
;274:			break;
ADDRGP4 $114
JUMPV
LABELV $118
line 275
;275:	}
LABELV $113
line 268
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRGP4 $112
JUMPV
LABELV $114
line 277
;276:
;277:	return (cvarptr->defaultvalue);
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
RETF4
LABELV $111
endproc VRconf_GetCvarDefault 12 8
proc VRconf_GetCvarValue 12 8
line 286
;278:}
;279:
;280:/*
;281:=================
;282:VRconf_GetCvarValue
;283:=================
;284:*/
;285:static float VRconf_GetCvarValue( char* name )
;286:{
line 290
;287:	configcvar_t*	cvarptr;
;288:	int				i;
;289:
;290:	cvarptr = g_configcvars2;
ADDRLP4 0
ADDRGP4 g_configcvars2
ASGNP4
line 291
;291:	for (i=0; ;i++,cvarptr++)
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $121
line 292
;292:	{
line 293
;293:		if (!cvarptr->name)
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $125
line 294
;294:			return (0);
CNSTF4 0
RETF4
ADDRGP4 $120
JUMPV
LABELV $125
line 296
;295:
;296:		if (!strcmp(cvarptr->name,name))
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $127
line 297
;297:			break;
ADDRGP4 $123
JUMPV
LABELV $127
line 298
;298:	}
LABELV $122
line 291
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRGP4 $121
JUMPV
LABELV $123
line 300
;299:
;300:	return (cvarptr->value);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
RETF4
LABELV $120
endproc VRconf_GetCvarValue 12 8
proc VRconf_Update 96 0
line 308
;301:}
;302:
;303:/*
;304:=================
;305:VRconf_Update
;306:=================
;307:*/
;308:static void VRconf_Update( void ) {
line 316
;309:	int		i;
;310:	int		j;
;311:	int		y;
;312:	menucommon_s	**controls;
;313:	menucommon_s	*control;
;314:
;315:	// disable all controls in all groups
;316:	for( i = 0; i < C_MAX; i++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $130
line 317
;317:		controls = g_section[i];
ADDRLP4 8
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_section
ADDP4
INDIRP4
ASGNP4
line 318
;318:		for( j = 0;  (control = controls[j]) ; j++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $137
JUMPV
LABELV $134
line 319
;319:			control->flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 320
;320:		}
LABELV $135
line 318
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $137
ADDRLP4 20
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $134
line 321
;321:	}
LABELV $131
line 316
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4
LTI4 $130
line 323
;322:
;323:	controls = g_section[s_vrconf.section];
ADDRLP4 8
ADDRGP4 s_vrconf+548
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_section
ADDP4
INDIRP4
ASGNP4
line 326
;324:
;325:	// enable controls in active group (and count number of items for vertical centering)
;326:	for( j = 0;  (control = controls[j]) ; j++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $142
JUMPV
LABELV $139
line 327
;327:		control->flags &= ~(QMF_GRAYED|QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294938623
BANDU4
ASGNU4
line 328
;328:	}
LABELV $140
line 326
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $142
ADDRLP4 20
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $139
line 331
;329:
;330:	// position controls
;331:	y = ( SCREEN_HEIGHT - j * SMALLCHAR_HEIGHT ) / 2;
ADDRLP4 16
CNSTI4 480
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 332
;332:	for( j = 0;	(control = controls[j]) ; j++, y += SMALLCHAR_HEIGHT ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $146
JUMPV
LABELV $143
line 333
;333:		control->x      = 320;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 320
ASGNI4
line 334
;334:		control->y      = y;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 335
;335:		control->left   = 320 - 19*SMALLCHAR_WIDTH;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 168
ASGNI4
line 336
;336:		control->right  = 320 + 21*SMALLCHAR_WIDTH;
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTI4 488
ASGNI4
line 337
;337:		control->top    = y;
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 338
;338:		control->bottom = y + SMALLCHAR_HEIGHT;
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 16
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 339
;339:	}
LABELV $144
line 332
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
LABELV $146
ADDRLP4 24
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $143
line 341
;340:
;341:	if( s_vrconf.waitingforkey ) {
ADDRGP4 s_vrconf+1756
INDIRI4
CNSTI4 0
EQI4 $147
line 343
;342:		// disable everybody
;343:		for( i = 0; i < s_vrconf.menu.nitems; i++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $153
JUMPV
LABELV $150
line 344
;344:			((menucommon_s*)(s_vrconf.menu.items[i]))->flags |= QMF_GRAYED;
ADDRLP4 28
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_vrconf+12
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 345
;345:		}
LABELV $151
line 343
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $153
ADDRLP4 12
INDIRI4
ADDRGP4 s_vrconf+8
INDIRI4
LTI4 $150
line 348
;346:
;347:		// enable action item
;348:		((menucommon_s*)(s_vrconf.menu.items[s_vrconf.menu.cursor]))->flags &= ~QMF_GRAYED;
ADDRLP4 28
ADDRGP4 s_vrconf
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_vrconf+12
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 353
;349:
;350:		// don't gray out player's name
;351:		//s_vrconf.name.generic.flags &= ~QMF_GRAYED;
;352:
;353:		return;
ADDRGP4 $129
JUMPV
LABELV $147
line 357
;354:	}
;355:
;356:	// enable everybody
;357:	for( i = 0; i < s_vrconf.menu.nitems; i++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $160
JUMPV
LABELV $157
line 358
;358:		((menucommon_s*)(s_vrconf.menu.items[i]))->flags &= ~QMF_GRAYED;
ADDRLP4 28
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_vrconf+12
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 359
;359:	}
LABELV $158
line 357
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $160
ADDRLP4 12
INDIRI4
ADDRGP4 s_vrconf+8
INDIRI4
LTI4 $157
line 362
;360:
;361:	// makes sure flags are right on the group selection controls
;362:	s_vrconf.menuplane.generic.flags 	&= ~(QMF_GRAYED|QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
ADDRLP4 28
ADDRGP4 s_vrconf+552+44
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 4294958911
BANDU4
ASGNU4
line 363
;363:	s_vrconf.beam.generic.flags 		&= ~(QMF_GRAYED|QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
ADDRLP4 32
ADDRGP4 s_vrconf+628+44
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 4294958911
BANDU4
ASGNU4
line 364
;364:	s_vrconf.hud.generic.flags 			&= ~(QMF_GRAYED|QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
ADDRLP4 36
ADDRGP4 s_vrconf+704+44
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 4294958911
BANDU4
ASGNU4
line 365
;365:	s_vrconf.model.generic.flags 		&= ~(QMF_GRAYED|QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
ADDRLP4 40
ADDRGP4 s_vrconf+780+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 4294958911
BANDU4
ASGNU4
line 367
;366:
;367:	s_vrconf.menuplane.generic.flags 	|= QMF_PULSEIFFOCUS;
ADDRLP4 44
ADDRGP4 s_vrconf+552+44
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 368
;368:	s_vrconf.beam.generic.flags 		|= QMF_PULSEIFFOCUS;
ADDRLP4 48
ADDRGP4 s_vrconf+628+44
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 369
;369:	s_vrconf.hud.generic.flags     		|= QMF_PULSEIFFOCUS;
ADDRLP4 52
ADDRGP4 s_vrconf+704+44
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 370
;370:	s_vrconf.model.generic.flags     	|= QMF_PULSEIFFOCUS;
ADDRLP4 56
ADDRGP4 s_vrconf+780+44
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 377
;371:
;372:	//deactivate some of them
;373:	//s_vrconf.beam_stabilized.generic.flags 	|= QMF_GRAYED;
;374:	//s_vrconf.laserBeamOthers.generic.flags 	|= QMF_GRAYED;
;375:
;376:	// set buttons
;377:	switch( s_vrconf.section ) {
ADDRLP4 60
ADDRGP4 s_vrconf+548
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
LTI4 $179
ADDRLP4 60
INDIRI4
CNSTI4 3
GTI4 $179
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $202
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $202
address $182
address $187
address $192
address $197
code
LABELV $182
line 379
;378:	case C_MENUPLANE:
;379:		s_vrconf.menuplane.generic.flags 	&= ~QMF_PULSEIFFOCUS;
ADDRLP4 64
ADDRGP4 s_vrconf+552+44
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 380
;380:		s_vrconf.menuplane.generic.flags 	|= (QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
ADDRLP4 68
ADDRGP4 s_vrconf+552+44
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRU4
CNSTU4 192
BORU4
ASGNU4
line 381
;381:		break;
ADDRGP4 $180
JUMPV
LABELV $187
line 383
;382:	case C_BEAM:
;383:		s_vrconf.beam.generic.flags 		&= ~QMF_PULSEIFFOCUS;
ADDRLP4 72
ADDRGP4 s_vrconf+628+44
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 384
;384:		s_vrconf.beam.generic.flags 		|= (QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
ADDRLP4 76
ADDRGP4 s_vrconf+628+44
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRU4
CNSTU4 192
BORU4
ASGNU4
line 385
;385:		break;	
ADDRGP4 $180
JUMPV
LABELV $192
line 387
;386:	case C_HUD:
;387:		s_vrconf.hud.generic.flags 			&= ~QMF_PULSEIFFOCUS;
ADDRLP4 80
ADDRGP4 s_vrconf+704+44
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 388
;388:		s_vrconf.hud.generic.flags 			|= (QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
ADDRLP4 84
ADDRGP4 s_vrconf+704+44
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRU4
CNSTU4 192
BORU4
ASGNU4
line 389
;389:		break;
ADDRGP4 $180
JUMPV
LABELV $197
line 391
;390:	case C_MODEL:
;391:		s_vrconf.model.generic.flags 		&= ~QMF_PULSEIFFOCUS;
ADDRLP4 88
ADDRGP4 s_vrconf+780+44
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 392
;392:		s_vrconf.model.generic.flags 		|= (QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
ADDRLP4 92
ADDRGP4 s_vrconf+780+44
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRU4
CNSTU4 192
BORU4
ASGNU4
line 393
;393:		break;
LABELV $179
LABELV $180
line 395
;394:	}
;395:}
LABELV $129
endproc VRconf_Update 96 0
proc VRconf_StatusBar 0 0
line 403
;396:
;397:/*
;398:=================
;399:VRconf_StatusBar
;400:=================
;401:*/
;402:static void VRconf_StatusBar( void *self )
;403:{
line 405
;404:	//UI_DrawString(SCREEN_WIDTH * 0.50, SCREEN_HEIGHT * 0.80, "Use Arrow Keys or CLICK to change", UI_SMALLFONT|UI_CENTER, colorWhite );
;405:}
LABELV $203
endproc VRconf_StatusBar 0 0
export stringHexToQ3Color
proc stringHexToQ3Color 36 12
line 409
;406:
;407:
;408:int stringHexToQ3Color(char * rgba)
;409:{
line 410
;410:	int res = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 411
;411:	char *rgb = "0x000000";
ADDRLP4 0
ADDRGP4 $205
ASGNP4
line 412
;412:	strncpy(rgb, rgba, 8);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 413
;413:	if 	   (strcmp(rgb, "0xFF0000") == 0) // red
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $208
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $206
line 414
;414:		res = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $207
JUMPV
LABELV $206
line 415
;415:	else if(strcmp(rgb, "0xFFD800") == 0) // yellow
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $211
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $209
line 416
;416:		res = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $210
JUMPV
LABELV $209
line 417
;417:	else if(strcmp(rgb, "0x00FF00") == 0) // light green
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $214
ARGP4
ADDRLP4 16
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $212
line 418
;418:		res = 2;
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRGP4 $213
JUMPV
LABELV $212
line 419
;419:	else if(strcmp(rgb, "0x00FFFF") == 0) // light blue
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $217
ARGP4
ADDRLP4 20
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $215
line 420
;420:		res = 3;
ADDRLP4 4
CNSTI4 3
ASGNI4
ADDRGP4 $216
JUMPV
LABELV $215
line 421
;421:	else if(strcmp(rgb, "0x0000FF") == 0) // dark blue
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $220
ARGP4
ADDRLP4 24
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $218
line 422
;422:		res = 4;
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRGP4 $219
JUMPV
LABELV $218
line 423
;423:	else if(strcmp(rgb, "0xFF00FF") == 0) // purple
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $223
ARGP4
ADDRLP4 28
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $221
line 424
;424:		res = 5;
ADDRLP4 4
CNSTI4 5
ASGNI4
ADDRGP4 $222
JUMPV
LABELV $221
line 425
;425:	else if(strcmp(rgb, "0xFFFFFF") == 0) // white
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $226
ARGP4
ADDRLP4 32
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $224
line 426
;426:		res = 6;
ADDRLP4 4
CNSTI4 6
ASGNI4
LABELV $224
LABELV $222
LABELV $219
LABELV $216
LABELV $213
LABELV $210
LABELV $207
line 427
;427:	return res;
ADDRLP4 4
INDIRI4
RETI4
LABELV $204
endproc stringHexToQ3Color 36 12
proc VRconf_GetConfig 88 12
line 437
;428:}
;429:
;430:
;431:/*
;432:=================
;433:VRconf_GetConfig
;434:=================
;435:*/
;436:static void VRconf_GetConfig( void )
;437:{
line 441
;438:	//int		i;
;439:	//int clamp = SCREEN_WIDTH;
;440:
;441:	char * laserBeamRGBA = UI_Cvar_VariableString("laserBeamRGBA");
ADDRGP4 $228
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 443
;442:	//char * laserBeamRGB;
;443:	char * alpha = "0000FFC0";// alloc with the final size
ADDRLP4 4
ADDRGP4 $229
ASGNP4
line 446
;444:
;445:	// get alpha from laserBeamRGBA
;446:	memcpy(alpha, &laserBeamRGBA[8], sizeof(alpha)); 
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 451
;447:	
;448:	//===================
;449:	// 3D Menu
;450:	//===================
;451:	s_vrconf.distance.curvalue 			= UI_ClampCvar( 15, 150,		VRconf_GetCvarValue( "menu_distance" ) );
ADDRGP4 $75
ARGP4
ADDRLP4 12
ADDRGP4 VRconf_GetCvarValue
CALLF4
ASGNF4
CNSTF4 1097859072
ARGF4
CNSTF4 1125515264
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 UI_ClampCvar
CALLF4
ASGNF4
ADDRGP4 s_vrconf+856+72
ADDRLP4 16
INDIRF4
ASGNF4
line 452
;452:	s_vrconf.planesNumber.curvalue 		= UI_ClampCvar( 0, 30,			VRconf_GetCvarValue( "menu_planes_nb" ) );
ADDRGP4 $76
ARGP4
ADDRLP4 20
ADDRGP4 VRconf_GetCvarValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1106247680
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 UI_ClampCvar
CALLF4
ASGNF4
ADDRGP4 s_vrconf+936+72
ADDRLP4 24
INDIRF4
ASGNF4
line 453
;453:	s_vrconf.menu_Hradius.curvalue 		= UI_ClampCvar( -20.0f, 40.0f,	VRconf_GetCvarValue( "menu_h_radius" ) );
ADDRGP4 $77
ARGP4
ADDRLP4 28
ADDRGP4 VRconf_GetCvarValue
CALLF4
ASGNF4
CNSTF4 3248488448
ARGF4
CNSTF4 1109393408
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 UI_ClampCvar
CALLF4
ASGNF4
ADDRGP4 s_vrconf+1016+72
ADDRLP4 32
INDIRF4
ASGNF4
line 454
;454:	s_vrconf.menu_Vradius.curvalue 		= UI_ClampCvar( -20.0, 40.0f,	VRconf_GetCvarValue( "menu_v_radius" ) );
ADDRGP4 $78
ARGP4
ADDRLP4 36
ADDRGP4 VRconf_GetCvarValue
CALLF4
ASGNF4
CNSTF4 3248488448
ARGF4
CNSTF4 1109393408
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 UI_ClampCvar
CALLF4
ASGNF4
ADDRGP4 s_vrconf+1096+72
ADDRLP4 40
INDIRF4
ASGNF4
line 459
;455:
;456:	//===================
;457:	// Laser beam
;458:	//===================
;459:	s_vrconf.beam_enable.curvalue 		= UI_ClampCvar( 0, 1, VRconf_GetCvarValue( "laserBeamPlayer" ) );
ADDRGP4 $79
ARGP4
ADDRLP4 44
ADDRGP4 VRconf_GetCvarValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 UI_ClampCvar
CALLF4
ASGNF4
ADDRGP4 s_vrconf+1176+64
ADDRLP4 48
INDIRF4
CVFI4 4
ASGNI4
line 460
;460:	s_vrconf.beam_stabilized.curvalue 	= UI_ClampCvar( 0, 1, VRconf_GetCvarValue( "laserBeamStabilized" ) );
ADDRGP4 $80
ARGP4
ADDRLP4 52
ADDRGP4 VRconf_GetCvarValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 UI_ClampCvar
CALLF4
ASGNF4
ADDRGP4 s_vrconf+1244+64
ADDRLP4 56
INDIRF4
CVFI4 4
ASGNI4
line 461
;461:	s_vrconf.beam_color.curvalue 		= stringHexToQ3Color(laserBeamRGBA);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 stringHexToQ3Color
CALLI4
ASGNI4
ADDRGP4 s_vrconf+1312+68
ADDRLP4 60
INDIRI4
ASGNI4
line 462
;462:	s_vrconf.beam_alpha.curvalue = 255;// strtol(alpha, NULL, 16);// TODO strtol
ADDRGP4 s_vrconf+1456+72
CNSTF4 1132396544
ASGNF4
line 467
;463:
;464:
;465:
;466:	// others ?
;467:	s_vrconf.laserBeamOthers.curvalue 	= UI_ClampCvar( 0, 1, VRconf_GetCvarValue( "laserBeamOthers" ) );
ADDRGP4 $81
ARGP4
ADDRLP4 64
ADDRGP4 VRconf_GetCvarValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 UI_ClampCvar
CALLF4
ASGNF4
ADDRGP4 s_vrconf+1536+64
ADDRLP4 68
INDIRF4
CVFI4 4
ASGNI4
line 480
;468:	//===================
;469:	// HUD
;470:	//===================
;471:	// hud_align 0: no HUD, 1: left, 2: right, 3: top, 4: bottom
;472:	//s_vrconf.hud_align.curvalue 		= UI_ClampCvar( 0, 4, VRconf_GetCvarValue( "hud_align" ) );
;473:
;474:	/*if (s_vrconf.hud_align.curvalue == 3 || s_vrconf.hud_align.curvalue == 4)
;475:		clamp = SCREEN_HEIGHT;*/
;476:	//s_vrconf.hud_align_dist.curvalue 	= UI_ClampCvar( 0, 128, VRconf_GetCvarValue( "hud_align_dist" ) );
;477:	//===================
;478:	// MODEL
;479:	//===================
;480:	s_vrconf.hide_torso.curvalue 		= UI_ClampCvar( 0, 1, VRconf_GetCvarValue( "VR_hide_torso" ) );
ADDRGP4 $82
ARGP4
ADDRLP4 72
ADDRGP4 VRconf_GetCvarValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRLP4 76
ADDRGP4 UI_ClampCvar
CALLF4
ASGNF4
ADDRGP4 s_vrconf+1604+64
ADDRLP4 76
INDIRF4
CVFI4 4
ASGNI4
line 481
;481:	s_vrconf.angle_hide_torso.curvalue 	= UI_ClampCvar( 0, 45, VRconf_GetCvarValue( "VR_angle_hide_torso" ) );
ADDRGP4 $83
ARGP4
ADDRLP4 80
ADDRGP4 VRconf_GetCvarValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1110704128
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 84
ADDRGP4 UI_ClampCvar
CALLF4
ASGNF4
ADDRGP4 s_vrconf+1672+72
ADDRLP4 84
INDIRF4
ASGNF4
line 482
;482:}
LABELV $227
endproc VRconf_GetConfig 88 12
export intColorToHexString
proc intColorToHexString 12 12
line 486
;483:
;484:
;485:char * intColorToHexString( int q3Color, int alpha )
;486:{
line 487
;487:	char * alphaStr = "FF";
ADDRLP4 4
ADDRGP4 $253
ASGNP4
line 488
;488:	char * res = "0xFFFFFF";
ADDRLP4 0
ADDRGP4 $226
ASGNP4
line 490
;489:
;490:	switch ( q3Color )
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $254
ADDRLP4 8
INDIRI4
CNSTI4 6
GTI4 $254
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $264
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $264
address $256
address $257
address $259
address $260
address $261
address $262
address $263
code
line 491
;491:	{
LABELV $256
line 493
;492:	case 0: // red
;493:		res = "0xFF0000";
ADDRLP4 0
ADDRGP4 $208
ASGNP4
line 494
;494:		break;
ADDRGP4 $255
JUMPV
LABELV $257
line 496
;495:	case 1: // yellow
;496:		res = "0xFFD8008";
ADDRLP4 0
ADDRGP4 $258
ASGNP4
line 497
;497:		break;
ADDRGP4 $255
JUMPV
LABELV $259
line 499
;498:	case 2: // light green
;499:		res = "0x00FF00";
ADDRLP4 0
ADDRGP4 $214
ASGNP4
line 500
;500:		break;
ADDRGP4 $255
JUMPV
LABELV $260
line 502
;501:	case 3: // light blue
;502:		res = "0x00FFFF";
ADDRLP4 0
ADDRGP4 $217
ASGNP4
line 503
;503:		break;
ADDRGP4 $255
JUMPV
LABELV $261
line 505
;504:	case 4: // dark blue
;505:		res = "0x0000FF";
ADDRLP4 0
ADDRGP4 $220
ASGNP4
line 506
;506:		break;
ADDRGP4 $255
JUMPV
LABELV $262
line 508
;507:	case 5: // purple
;508:		res = "0xFF00FF";
ADDRLP4 0
ADDRGP4 $223
ASGNP4
line 509
;509:		break;
ADDRGP4 $255
JUMPV
LABELV $263
line 511
;510:	case 6: // white
;511:		res = "0xFFFFFF";
ADDRLP4 0
ADDRGP4 $226
ASGNP4
line 512
;512:		break;
ADDRGP4 $255
JUMPV
LABELV $254
line 514
;513:	default:// default red
;514:		res = "0xFF0000";
ADDRLP4 0
ADDRGP4 $208
ASGNP4
line 515
;515:		break;
LABELV $255
line 519
;516:	}
;517:
;518:	//add alpha
;519:	BG_sprintf(alphaStr, "%x", alpha);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $265
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BG_sprintf
CALLI4
pop
line 521
;520:
;521:	strcat(res, alphaStr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 522
;522:	return res;
ADDRLP4 0
INDIRP4
RETP4
LABELV $252
endproc intColorToHexString 12 12
proc VRconf_SetConfig 0 0
line 532
;523:}
;524:
;525:/*
;526:=================
;527:VRconf_SetConfig
;528:=================
;529:*/
;530:
;531:static void VRconf_SetConfig( void )
;532:{
line 560
;533:	/*char * rgba_buf;
;534:	//===================
;535:	// 3D Menu
;536:	//===================
;537:	trap_Cvar_SetValue( "menu_distance", s_vrconf.distance.curvalue );
;538:	trap_Cvar_SetValue( "menu_planes_nb", s_vrconf.planesNumber.curvalue );
;539:	trap_Cvar_SetValue( "menu_h_radius", s_vrconf.menu_Hradius.curvalue );
;540:	trap_Cvar_SetValue( "menu_v_radius", s_vrconf.menu_Vradius.curvalue );
;541:
;542:	//===================
;543:	// Laser beam
;544:	//===================
;545:	trap_Cvar_SetValue( "laserBeamPlayer", s_vrconf.beam_enable.curvalue );
;546:	trap_Cvar_SetValue( "laserBeamStabilized", s_vrconf.beam_stabilized.curvalue );
;547:
;548:	// Beam color
;549:	rgba_buf = intColorToHexString( s_vrconf.beam_color.curvalue, s_vrconf.beam_alpha.curvalue );
;550:	trap_Cvar_Set( "laserBeamRGBA", rgba_buf );
;551:	trap_Cvar_SetValue( "laserBeamOthers", s_vrconf.laserBeamOthers.curvalue );
;552:
;553:	//===================
;554:	// HUD
;555:	//===================
;556:	trap_Cvar_SetValue( "hud_align", s_vrconf.hud_align.curvalue );
;557:	trap_Cvar_SetValue( "hud_align_dist", UI_ClampCvar( 0, 128, s_vrconf.hud_align_dist.curvalue ) );
;558:
;559:	trap_Cmd_ExecuteText( EXEC_APPEND, "in_restart\n" );*/
;560:}
LABELV $266
endproc VRconf_SetConfig 0 0
proc VRconf_SetDefaults 40 4
line 568
;561:
;562:/*
;563:=================
;564:VRconf_SetDefaults
;565:=================
;566:*/
;567:static void VRconf_SetDefaults( void )
;568:{
line 572
;569:	//===================
;570:	// menu
;571:	//===================
;572:	s_vrconf.distance.curvalue 			= VRconf_GetCvarDefault( "menu_distance" );
ADDRGP4 $75
ARGP4
ADDRLP4 0
ADDRGP4 VRconf_GetCvarDefault
CALLF4
ASGNF4
ADDRGP4 s_vrconf+856+72
ADDRLP4 0
INDIRF4
ASGNF4
line 573
;573:	s_vrconf.planesNumber.curvalue 		= VRconf_GetCvarDefault( "menu_planes_nb" );
ADDRGP4 $76
ARGP4
ADDRLP4 4
ADDRGP4 VRconf_GetCvarDefault
CALLF4
ASGNF4
ADDRGP4 s_vrconf+936+72
ADDRLP4 4
INDIRF4
ASGNF4
line 574
;574:	s_vrconf.menu_Hradius.curvalue 		= VRconf_GetCvarDefault( "menu_h_radius" );
ADDRGP4 $77
ARGP4
ADDRLP4 8
ADDRGP4 VRconf_GetCvarDefault
CALLF4
ASGNF4
ADDRGP4 s_vrconf+1016+72
ADDRLP4 8
INDIRF4
ASGNF4
line 575
;575:	s_vrconf.menu_Vradius.curvalue 		= VRconf_GetCvarDefault( "menu_v_radius" );
ADDRGP4 $78
ARGP4
ADDRLP4 12
ADDRGP4 VRconf_GetCvarDefault
CALLF4
ASGNF4
ADDRGP4 s_vrconf+1096+72
ADDRLP4 12
INDIRF4
ASGNF4
line 580
;576:
;577:	//===================
;578:	// beam
;579:	//===================
;580:	s_vrconf.beam_enable.curvalue 		= VRconf_GetCvarDefault( "laserBeamPlayer" );
ADDRGP4 $79
ARGP4
ADDRLP4 16
ADDRGP4 VRconf_GetCvarDefault
CALLF4
ASGNF4
ADDRGP4 s_vrconf+1176+64
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 581
;581:	s_vrconf.beam_stabilized.curvalue 	= VRconf_GetCvarDefault( "laserBeamStabilized" );
ADDRGP4 $80
ARGP4
ADDRLP4 20
ADDRGP4 VRconf_GetCvarDefault
CALLF4
ASGNF4
ADDRGP4 s_vrconf+1244+64
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 582
;582:	s_vrconf.beam_color.curvalue 		= VRconf_GetCvarDefault( "laserBeamRGBA" );
ADDRGP4 $228
ARGP4
ADDRLP4 24
ADDRGP4 VRconf_GetCvarDefault
CALLF4
ASGNF4
ADDRGP4 s_vrconf+1312+68
ADDRLP4 24
INDIRF4
CVFI4 4
ASGNI4
line 583
;583:	s_vrconf.laserBeamOthers.curvalue 	= VRconf_GetCvarDefault( "laserBeamOthers" );
ADDRGP4 $81
ARGP4
ADDRLP4 28
ADDRGP4 VRconf_GetCvarDefault
CALLF4
ASGNF4
ADDRGP4 s_vrconf+1536+64
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 593
;584:
;585:	//===================
;586:	// HUD
;587:	//===================
;588:	//s_vrconf.hud_align.curvalue 		= VRconf_GetCvarDefault( "hud_align" );
;589:
;590:	//===================
;591:	// MODEL
;592:	//===================
;593:	s_vrconf.hide_torso.curvalue 		= VRconf_GetCvarDefault( "VR_hide_torso" );
ADDRGP4 $82
ARGP4
ADDRLP4 32
ADDRGP4 VRconf_GetCvarDefault
CALLF4
ASGNF4
ADDRGP4 s_vrconf+1604+64
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 594
;594:	s_vrconf.angle_hide_torso.curvalue 	= VRconf_GetCvarDefault( "VR_angle_hide_torso" );
ADDRGP4 $83
ARGP4
ADDRLP4 36
ADDRGP4 VRconf_GetCvarDefault
CALLF4
ASGNF4
ADDRGP4 s_vrconf+1672+72
ADDRLP4 36
INDIRF4
ASGNF4
line 595
;595:}
LABELV $267
endproc VRconf_SetDefaults 40 4
proc VRconf_MenuKey 16 8
line 603
;596:
;597:/*
;598:=================
;599:VRconf_MenuKey
;600:=================
;601:*/
;602:static sfxHandle_t VRconf_MenuKey( int key )
;603:{
line 607
;604:	//int			id;
;605:	//int			i;
;606:	qboolean	found;
;607:	found = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 609
;608:
;609:	if (!s_vrconf.waitingforkey)
ADDRGP4 s_vrconf+1756
INDIRI4
CNSTI4 0
NEI4 $289
line 610
;610:	{
line 611
;611:		switch (key)
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 140
EQI4 $294
ADDRLP4 4
INDIRI4
CNSTI4 140
GTI4 $301
LABELV $300
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 27
EQI4 $295
ADDRLP4 8
INDIRI4
CNSTI4 27
LTI4 $299
LABELV $302
ADDRFP4 0
INDIRI4
CNSTI4 127
EQI4 $294
ADDRGP4 $299
JUMPV
LABELV $301
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 171
EQI4 $294
ADDRLP4 12
INDIRI4
CNSTI4 171
LTI4 $299
LABELV $303
ADDRFP4 0
INDIRI4
CNSTI4 179
EQI4 $295
ADDRGP4 $299
JUMPV
line 612
;612:		{
LABELV $294
line 616
;613:			case K_BACKSPACE:
;614:			case K_DEL:
;615:			case K_KP_DEL:
;616:				key = -1;
ADDRFP4 0
CNSTI4 -1
ASGNI4
line 617
;617:				break;
ADDRGP4 $290
JUMPV
LABELV $295
line 621
;618:		
;619:			case K_MOUSE2:
;620:			case K_ESCAPE:
;621:				if (s_vrconf.changesmade)
ADDRGP4 s_vrconf+1752
INDIRI4
CNSTI4 0
EQI4 $299
line 622
;622:				{
line 623
;623:					VRconf_SetConfig();
ADDRGP4 VRconf_SetConfig
CALLV
pop
line 624
;624:				}
line 625
;625:				goto ignorekey;	
ADDRGP4 $299
JUMPV
line 628
;626:
;627:			default:
;628:				goto ignorekey;
line 630
;629:		}
;630:	}
LABELV $289
line 632
;631:	else
;632:	{
line 633
;633:		if (key & K_CHAR_FLAG)
ADDRFP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $304
line 634
;634:			goto ignorekey;
ADDRGP4 $299
JUMPV
LABELV $304
line 636
;635:
;636:		switch (key)
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 27
EQI4 $308
ADDRLP4 4
INDIRI4
CNSTI4 27
LTI4 $306
LABELV $311
ADDRFP4 0
INDIRI4
CNSTI4 96
EQI4 $299
ADDRGP4 $306
JUMPV
line 637
;637:		{
LABELV $308
line 639
;638:			case K_ESCAPE:
;639:				s_vrconf.waitingforkey = qfalse;
ADDRGP4 s_vrconf+1756
CNSTI4 0
ASGNI4
line 640
;640:				VRconf_Update();
ADDRGP4 VRconf_Update
CALLV
pop
line 641
;641:				return (menu_out_sound);
ADDRGP4 menu_out_sound
INDIRI4
RETI4
ADDRGP4 $288
JUMPV
line 644
;642:	
;643:			case '`':
;644:				goto ignorekey;
LABELV $306
line 646
;645:		}
;646:	}
LABELV $290
line 648
;647:
;648:	s_vrconf.changesmade = qtrue;
ADDRGP4 s_vrconf+1752
CNSTI4 1
ASGNI4
line 649
;649:	s_vrconf.waitingforkey = qfalse;
ADDRGP4 s_vrconf+1756
CNSTI4 0
ASGNI4
line 651
;650:
;651:	if (found)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $314
line 652
;652:	{	
line 653
;653:		VRconf_Update();
ADDRGP4 VRconf_Update
CALLV
pop
line 654
;654:		return (menu_out_sound);
ADDRGP4 menu_out_sound
INDIRI4
RETI4
ADDRGP4 $288
JUMPV
LABELV $314
LABELV $299
line 658
;655:	}
;656:
;657:ignorekey:
;658:	return Menu_DefaultKey( &s_vrconf.menu, key );
ADDRGP4 s_vrconf
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $288
endproc VRconf_MenuKey 16 8
proc VRconf_ResetDefaults_Action 0 0
line 666
;659:}
;660:
;661:/*
;662:=================
;663:VRconf_ResetDefaults_Action
;664:=================
;665:*/
;666:static void VRconf_ResetDefaults_Action( qboolean result ) {
line 667
;667:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $317
line 668
;668:		return;
ADDRGP4 $316
JUMPV
LABELV $317
line 671
;669:	}
;670:
;671:	s_vrconf.changesmade = qtrue;
ADDRGP4 s_vrconf+1752
CNSTI4 1
ASGNI4
line 672
;672:	VRconf_SetDefaults();
ADDRGP4 VRconf_SetDefaults
CALLV
pop
line 673
;673:	VRconf_Update();
ADDRGP4 VRconf_Update
CALLV
pop
line 674
;674:}
LABELV $316
endproc VRconf_ResetDefaults_Action 0 0
proc VRconf_ResetDefaults_Draw 0 20
line 681
;675:
;676:/*
;677:=================
;678:VRconf_ResetDefaults_Draw
;679:=================
;680:*/
;681:static void VRconf_ResetDefaults_Draw( void ) {
line 682
;682:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 0, "WARNING: This will reset all", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 356
ARGI4
ADDRGP4 $321
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 683
;683:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 1, "controls to their default values.", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 383
ARGI4
ADDRGP4 $322
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 684
;684:}
LABELV $320
endproc VRconf_ResetDefaults_Draw 0 20
proc VRconf_MenuEvent 32 12
line 692
;685:
;686:/*
;687:=================
;688:VRconf_MenuEvent
;689:=================
;690:*/
;691:static void VRconf_MenuEvent( void* ptr, int event )
;692:{
line 695
;693:	char * rgba_buf;
;694:
;695:	if (event == QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $324
line 696
;696:	{
line 697
;697:		s_vrconf.changesmade = qtrue;
ADDRGP4 s_vrconf+1752
CNSTI4 1
ASGNI4
line 698
;698:		switch (((menucommon_s*)ptr)->id)
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 40
EQI4 $382
ADDRLP4 4
INDIRI4
CNSTI4 41
EQI4 $386
ADDRLP4 4
INDIRI4
CNSTI4 41
GTI4 $391
LABELV $390
ADDRLP4 4
INDIRI4
CNSTI4 10
LTI4 $327
ADDRLP4 4
INDIRI4
CNSTI4 24
GTI4 $327
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $392-40
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $392
address $342
address $346
address $350
address $354
address $327
address $327
address $327
address $327
address $327
address $327
address $358
address $362
address $366
address $372
address $378
code
LABELV $391
ADDRLP4 4
INDIRI4
CNSTI4 100
LTI4 $327
ADDRLP4 4
INDIRI4
CNSTI4 106
GTI4 $327
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $394-400
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $394
address $332
address $330
address $334
address $336
address $327
address $327
address $338
code
line 699
;699:		{
LABELV $330
line 704
;700:			//======================================
;701:			// SECTION
;702:			//======================================
;703:			case ID_MENUPLANE:
;704:				s_vrconf.section = C_MENUPLANE; 
ADDRGP4 s_vrconf+548
CNSTI4 0
ASGNI4
line 705
;705:				VRconf_Update();
ADDRGP4 VRconf_Update
CALLV
pop
line 706
;706:				break;
ADDRGP4 $328
JUMPV
LABELV $332
line 708
;707:			case ID_BEAM:
;708:				s_vrconf.section = C_BEAM; 
ADDRGP4 s_vrconf+548
CNSTI4 1
ASGNI4
line 709
;709:				VRconf_Update();
ADDRGP4 VRconf_Update
CALLV
pop
line 710
;710:				break;
ADDRGP4 $328
JUMPV
LABELV $334
line 712
;711:			case ID_HUD:
;712:				s_vrconf.section = C_HUD; 
ADDRGP4 s_vrconf+548
CNSTI4 2
ASGNI4
line 713
;713:				VRconf_Update();
ADDRGP4 VRconf_Update
CALLV
pop
line 714
;714:				break;
ADDRGP4 $328
JUMPV
LABELV $336
line 716
;715:			case ID_MODEL:
;716:				s_vrconf.section = C_MODEL; 
ADDRGP4 s_vrconf+548
CNSTI4 3
ASGNI4
line 717
;717:				VRconf_Update();
ADDRGP4 VRconf_Update
CALLV
pop
line 718
;718:				break;
ADDRGP4 $328
JUMPV
LABELV $338
line 720
;719:			case ID_BACK:
;720:				if (s_vrconf.changesmade)
ADDRGP4 s_vrconf+1752
INDIRI4
CNSTI4 0
EQI4 $339
line 721
;721:				{
line 722
;722:					VRconf_SetConfig();
ADDRGP4 VRconf_SetConfig
CALLV
pop
line 723
;723:				}
LABELV $339
line 724
;724:				UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 725
;725:				break;
ADDRGP4 $328
JUMPV
LABELV $342
line 743
;726:			/*case ID_DEFAULTS:
;727:				UI_ConfirmMenu( "SET TO DEFAULTS?", VRconf_ResetDefaults_Draw, VRconf_ResetDefaults_Action );
;728:				break;
;729:			case ID_SAVEANDEXIT:
;730:				VRconf_SetConfig();
;731:				UI_PopMenu();
;732:				break;
;733:			case ID_EXIT:
;734:				UI_PopMenu();
;735:				break;*/
;736:			//======================================
;737:			// SUB SECTION
;738:			//======================================
;739:			//===================
;740:			// 3D Menu
;741:			//===================
;742:			case ID_DISTANCE:
;743:				s_vrconf.changesmade = qtrue;
ADDRGP4 s_vrconf+1752
CNSTI4 1
ASGNI4
line 744
;744:				trap_Cvar_SetValue( "menu_distance", s_vrconf.distance.curvalue );
ADDRGP4 $75
ARGP4
ADDRGP4 s_vrconf+856+72
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 745
;745:				break;
ADDRGP4 $328
JUMPV
LABELV $346
line 747
;746:			case ID_PLANESNUMBER:
;747:				s_vrconf.changesmade = qtrue;
ADDRGP4 s_vrconf+1752
CNSTI4 1
ASGNI4
line 748
;748:				trap_Cvar_SetValue( "menu_planes_nb", s_vrconf.planesNumber.curvalue );
ADDRGP4 $76
ARGP4
ADDRGP4 s_vrconf+936+72
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 749
;749:				break;
ADDRGP4 $328
JUMPV
LABELV $350
line 751
;750:			case ID_MENU_H_RADIUS:
;751:				s_vrconf.changesmade = qtrue;
ADDRGP4 s_vrconf+1752
CNSTI4 1
ASGNI4
line 752
;752:				trap_Cvar_SetValue( "menu_h_radius", s_vrconf.menu_Hradius.curvalue );
ADDRGP4 $77
ARGP4
ADDRGP4 s_vrconf+1016+72
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 753
;753:				break;
ADDRGP4 $328
JUMPV
LABELV $354
line 755
;754:			case ID_MENU_V_RADIUS:
;755:				s_vrconf.changesmade = qtrue;
ADDRGP4 s_vrconf+1752
CNSTI4 1
ASGNI4
line 756
;756:				trap_Cvar_SetValue( "menu_v_radius", s_vrconf.menu_Vradius.curvalue );
ADDRGP4 $78
ARGP4
ADDRGP4 s_vrconf+1096+72
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 757
;757:				break;
ADDRGP4 $328
JUMPV
LABELV $358
line 762
;758:			//===================
;759:			// Laser beam
;760:			//===================
;761:			case ID_BEAM_ENABLE:
;762:				s_vrconf.changesmade = qtrue;
ADDRGP4 s_vrconf+1752
CNSTI4 1
ASGNI4
line 763
;763:				trap_Cvar_SetValue( "laserBeamPlayer", s_vrconf.beam_enable.curvalue );
ADDRGP4 $79
ARGP4
ADDRGP4 s_vrconf+1176+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 764
;764:				break;
ADDRGP4 $328
JUMPV
LABELV $362
line 766
;765:			case ID_BEAM_STABILIZED:
;766:				s_vrconf.changesmade = qtrue;
ADDRGP4 s_vrconf+1752
CNSTI4 1
ASGNI4
line 767
;767:				trap_Cvar_SetValue( "laserBeamStabilized", s_vrconf.beam_stabilized.curvalue );
ADDRGP4 $80
ARGP4
ADDRGP4 s_vrconf+1244+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 768
;768:				break;
ADDRGP4 $328
JUMPV
LABELV $366
line 770
;769:			case ID_BEAM_COLOR:
;770:				s_vrconf.changesmade = qtrue;
ADDRGP4 s_vrconf+1752
CNSTI4 1
ASGNI4
line 771
;771:				rgba_buf = intColorToHexString( s_vrconf.beam_color.curvalue, s_vrconf.beam_alpha.curvalue );
ADDRGP4 s_vrconf+1312+68
INDIRI4
ARGI4
ADDRGP4 s_vrconf+1456+72
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 20
ADDRGP4 intColorToHexString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 772
;772:				trap_Cvar_Set( "laserBeamRGBA", rgba_buf );
ADDRGP4 $228
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 773
;773:				break;
ADDRGP4 $328
JUMPV
LABELV $372
line 775
;774:			case ID_BEAM_ALPHA:
;775:				s_vrconf.changesmade = qtrue;
ADDRGP4 s_vrconf+1752
CNSTI4 1
ASGNI4
line 776
;776:				rgba_buf = intColorToHexString( s_vrconf.beam_color.curvalue, s_vrconf.beam_alpha.curvalue );
ADDRGP4 s_vrconf+1312+68
INDIRI4
ARGI4
ADDRGP4 s_vrconf+1456+72
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 24
ADDRGP4 intColorToHexString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 777
;777:				trap_Cvar_Set( "laserBeamRGBA", rgba_buf );
ADDRGP4 $228
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 778
;778:				break;
ADDRGP4 $328
JUMPV
LABELV $378
line 780
;779:			case ID_laserBeamOthers:
;780:				s_vrconf.changesmade = qtrue;
ADDRGP4 s_vrconf+1752
CNSTI4 1
ASGNI4
line 781
;781:				trap_Cvar_SetValue( "laserBeamOthers", s_vrconf.laserBeamOthers.curvalue );
ADDRGP4 $81
ARGP4
ADDRGP4 s_vrconf+1536+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 782
;782:				break;
ADDRGP4 $328
JUMPV
LABELV $382
line 799
;783:			//===================
;784:			// HUD
;785:			//===================
;786:			/*case ID_HUD_ALIGN:
;787:				s_vrconf.changesmade = qtrue;
;788:				trap_Cvar_SetValue( "hud_align", s_vrconf.hud_align.curvalue );
;789:				break;
;790:			case ID_HUD_ALIGN_DIST:
;791:				s_vrconf.changesmade = qtrue;*/
;792:				//VRconf_SetConfig();
;793:			/*	trap_Cvar_SetValue( "hud_align_dist", UI_ClampCvar( 0, 128, s_vrconf.hud_align_dist.curvalue ) );
;794:				break;*/
;795:			//===================
;796:			// MODEL
;797:			//===================
;798:			case ID_HIDE_TORSO:
;799:				s_vrconf.changesmade = qtrue;
ADDRGP4 s_vrconf+1752
CNSTI4 1
ASGNI4
line 800
;800:				trap_Cvar_SetValue( "VR_hide_torso", s_vrconf.hide_torso.curvalue );
ADDRGP4 $82
ARGP4
ADDRGP4 s_vrconf+1604+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 801
;801:				break;
ADDRGP4 $328
JUMPV
LABELV $386
line 803
;802:			case ID_ANGLE_HIDE_TORSO:
;803:				s_vrconf.changesmade = qtrue;
ADDRGP4 s_vrconf+1752
CNSTI4 1
ASGNI4
line 804
;804:				trap_Cvar_SetValue( "VR_angle_hide_torso", UI_ClampCvar( 0, 45, s_vrconf.angle_hide_torso.curvalue ) );
CNSTF4 0
ARGF4
CNSTF4 1110704128
ARGF4
ADDRGP4 s_vrconf+1672+72
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 UI_ClampCvar
CALLF4
ASGNF4
ADDRGP4 $83
ARGP4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 805
;805:				break;
LABELV $327
LABELV $328
line 807
;806:		}
;807:	}
LABELV $324
line 808
;808:}
LABELV $323
endproc VRconf_MenuEvent 32 12
bss
align 1
LABELV $397
skip 32
code
proc VRconf_MenuInit 8 12
line 816
;809:
;810:/*
;811:=================
;812:VRconf_MenuInit
;813:=================
;814:*/
;815:static void VRconf_MenuInit( void )
;816:{
line 820
;817:	static char playername[32];
;818:	int x, y;
;819:	// zero set all our globals
;820:	memset( &s_vrconf, 0 ,sizeof(controls_t) );
ADDRGP4 s_vrconf
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1852
ARGI4
ADDRGP4 memset
CALLP4
pop
line 822
;821:
;822:	VRconf_Cache();
ADDRGP4 VRconf_Cache
CALLV
pop
line 824
;823:
;824:	s_vrconf.menu.key        	= VRconf_MenuKey;
ADDRGP4 s_vrconf+272
ADDRGP4 VRconf_MenuKey
ASGNP4
line 825
;825:	s_vrconf.menu.wrapAround 	= qtrue;
ADDRGP4 s_vrconf+276
CNSTI4 1
ASGNI4
line 826
;826:	s_vrconf.menu.fullscreen 	= qtrue;
ADDRGP4 s_vrconf+280
CNSTI4 1
ASGNI4
line 832
;827:
;828:	//==========================================================================
;829:	// 							Title & Background
;830:	//==========================================================================
;831:
;832:	s_vrconf.banner.generic.type	= MTYPE_BTEXT;
ADDRGP4 s_vrconf+288
CNSTI4 10
ASGNI4
line 833
;833:	s_vrconf.banner.generic.flags	= QMF_CENTER_JUSTIFY;
ADDRGP4 s_vrconf+288+44
CNSTU4 8
ASGNU4
line 834
;834:	s_vrconf.banner.generic.x		= 320;
ADDRGP4 s_vrconf+288+12
CNSTI4 320
ASGNI4
line 835
;835:	s_vrconf.banner.generic.y		= 16;
ADDRGP4 s_vrconf+288+16
CNSTI4 16
ASGNI4
line 836
;836:	s_vrconf.banner.string 			= "VR configuration";
ADDRGP4 s_vrconf+288+64
ADDRGP4 $410
ASGNP4
line 837
;837:	s_vrconf.banner.color			= color_white;
ADDRGP4 s_vrconf+288+72
ADDRGP4 color_white
ASGNP4
line 838
;838:	s_vrconf.banner.style			= UI_CENTER;
ADDRGP4 s_vrconf+288+68
CNSTI4 1
ASGNI4
line 841
;839:
;840:
;841:	s_vrconf.framel.generic.type 	= MTYPE_BITMAP;
ADDRGP4 s_vrconf+364
CNSTI4 6
ASGNI4
line 842
;842:	s_vrconf.framel.generic.name 	= ART_FRAMEL;
ADDRGP4 s_vrconf+364+4
ADDRGP4 $418
ASGNP4
line 843
;843:	s_vrconf.framel.generic.flags 	= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_vrconf+364+44
CNSTU4 16388
ASGNU4
line 844
;844:	s_vrconf.framel.generic.x 		= 0;
ADDRGP4 s_vrconf+364+12
CNSTI4 0
ASGNI4
line 845
;845:	s_vrconf.framel.generic.y 		= 78;
ADDRGP4 s_vrconf+364+16
CNSTI4 78
ASGNI4
line 846
;846:	s_vrconf.framel.width 			= 256;
ADDRGP4 s_vrconf+364+80
CNSTI4 256
ASGNI4
line 847
;847:	s_vrconf.framel.height  	    = 329;
ADDRGP4 s_vrconf+364+84
CNSTI4 329
ASGNI4
line 850
;848:
;849:
;850:	s_vrconf.framer.generic.type 	= MTYPE_BITMAP;
ADDRGP4 s_vrconf+456
CNSTI4 6
ASGNI4
line 851
;851:	s_vrconf.framer.generic.name 	= ART_FRAMER;
ADDRGP4 s_vrconf+456+4
ADDRGP4 $432
ASGNP4
line 852
;852:	s_vrconf.framer.generic.flags 	= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_vrconf+456+44
CNSTU4 16388
ASGNU4
line 853
;853:	s_vrconf.framer.generic.x 		= 376;
ADDRGP4 s_vrconf+456+12
CNSTI4 376
ASGNI4
line 854
;854:	s_vrconf.framer.generic.y 		= 76;
ADDRGP4 s_vrconf+456+16
CNSTI4 76
ASGNI4
line 855
;855:	s_vrconf.framer.width 			= 256;
ADDRGP4 s_vrconf+456+80
CNSTI4 256
ASGNI4
line 856
;856:	s_vrconf.framer.height 			= 334;
ADDRGP4 s_vrconf+456+84
CNSTI4 334
ASGNI4
line 862
;857:
;858:	//==========================================================================
;859:	// 							3D Menu
;860:	//==========================================================================
;861:	// Section
;862:	s_vrconf.menuplane.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_vrconf+552
CNSTI4 9
ASGNI4
line 863
;863:	s_vrconf.menuplane.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_vrconf+552+44
CNSTU4 272
ASGNU4
line 864
;864:	s_vrconf.menuplane.generic.id	    = ID_MENUPLANE;
ADDRGP4 s_vrconf+552+8
CNSTI4 101
ASGNI4
line 865
;865:	s_vrconf.menuplane.generic.callback	= VRconf_MenuEvent;
ADDRGP4 s_vrconf+552+48
ADDRGP4 VRconf_MenuEvent
ASGNP4
line 866
;866:	s_vrconf.menuplane.generic.x	    = 152;
ADDRGP4 s_vrconf+552+12
CNSTI4 152
ASGNI4
line 867
;867:	s_vrconf.menuplane.generic.y	    = 240 - 2 * PROP_HEIGHT;
ADDRGP4 s_vrconf+552+16
CNSTI4 186
ASGNI4
line 868
;868:	s_vrconf.menuplane.string			= "MENU";
ADDRGP4 s_vrconf+552+64
ADDRGP4 $456
ASGNP4
line 869
;869:	s_vrconf.menuplane.style			= UI_RIGHT;
ADDRGP4 s_vrconf+552+68
CNSTI4 2
ASGNI4
line 870
;870:	s_vrconf.menuplane.color			= color_red;
ADDRGP4 s_vrconf+552+72
ADDRGP4 color_red
ASGNP4
line 873
;871:
;872:	//Sub-Section
;873:	s_vrconf.distance.generic.type 			= MTYPE_SLIDER;
ADDRGP4 s_vrconf+856
CNSTI4 1
ASGNI4
line 874
;874:	s_vrconf.distance.generic.x	 			= SCREEN_WIDTH/2;
ADDRGP4 s_vrconf+856+12
CNSTI4 320
ASGNI4
line 875
;875:	s_vrconf.distance.generic.flags 		= QMF_SMALLFONT;
ADDRGP4 s_vrconf+856+44
CNSTU4 2
ASGNU4
line 876
;876:	s_vrconf.distance.generic.name 			= "distance";
ADDRGP4 s_vrconf+856+4
ADDRGP4 $468
ASGNP4
line 877
;877:	s_vrconf.distance.generic.id 			= ID_DISTANCE;
ADDRGP4 s_vrconf+856+8
CNSTI4 10
ASGNI4
line 878
;878:	s_vrconf.distance.generic.callback 		= VRconf_MenuEvent;
ADDRGP4 s_vrconf+856+48
ADDRGP4 VRconf_MenuEvent
ASGNP4
line 879
;879:	s_vrconf.distance.minvalue 				= 30;
ADDRGP4 s_vrconf+856+64
CNSTF4 1106247680
ASGNF4
line 880
;880:	s_vrconf.distance.maxvalue 				= 150;
ADDRGP4 s_vrconf+856+68
CNSTF4 1125515264
ASGNF4
line 881
;881:	s_vrconf.distance.generic.statusbar 	= VRconf_StatusBar;
ADDRGP4 s_vrconf+856+52
ADDRGP4 VRconf_StatusBar
ASGNP4
line 883
;882:
;883:	s_vrconf.planesNumber.generic.type 		= MTYPE_SLIDER;
ADDRGP4 s_vrconf+936
CNSTI4 1
ASGNI4
line 884
;884:	s_vrconf.planesNumber.generic.x 		= SCREEN_WIDTH/2;
ADDRGP4 s_vrconf+936+12
CNSTI4 320
ASGNI4
line 885
;885:	s_vrconf.planesNumber.generic.flags 	= QMF_SMALLFONT;
ADDRGP4 s_vrconf+936+44
CNSTU4 2
ASGNU4
line 886
;886:	s_vrconf.planesNumber.generic.name 		= "planes number";
ADDRGP4 s_vrconf+936+4
ADDRGP4 $486
ASGNP4
line 887
;887:	s_vrconf.planesNumber.generic.id 		= ID_PLANESNUMBER;
ADDRGP4 s_vrconf+936+8
CNSTI4 11
ASGNI4
line 888
;888:	s_vrconf.planesNumber.generic.callback 	= VRconf_MenuEvent;
ADDRGP4 s_vrconf+936+48
ADDRGP4 VRconf_MenuEvent
ASGNP4
line 889
;889:	s_vrconf.planesNumber.minvalue 			= 1;
ADDRGP4 s_vrconf+936+64
CNSTF4 1065353216
ASGNF4
line 890
;890:	s_vrconf.planesNumber.maxvalue 			= 30;
ADDRGP4 s_vrconf+936+68
CNSTF4 1106247680
ASGNF4
line 891
;891:	s_vrconf.planesNumber.generic.statusbar = VRconf_StatusBar;
ADDRGP4 s_vrconf+936+52
ADDRGP4 VRconf_StatusBar
ASGNP4
line 893
;892:
;893:	s_vrconf.menu_Hradius.generic.type 		= MTYPE_SLIDER;
ADDRGP4 s_vrconf+1016
CNSTI4 1
ASGNI4
line 894
;894:	s_vrconf.menu_Hradius.generic.x 		= SCREEN_WIDTH/2;
ADDRGP4 s_vrconf+1016+12
CNSTI4 320
ASGNI4
line 895
;895:	s_vrconf.menu_Hradius.generic.flags 	= QMF_SMALLFONT;
ADDRGP4 s_vrconf+1016+44
CNSTU4 2
ASGNU4
line 896
;896:	s_vrconf.menu_Hradius.generic.name 		= "h radius";
ADDRGP4 s_vrconf+1016+4
ADDRGP4 $504
ASGNP4
line 897
;897:	s_vrconf.menu_Hradius.generic.id 		= ID_MENU_H_RADIUS;
ADDRGP4 s_vrconf+1016+8
CNSTI4 12
ASGNI4
line 898
;898:	s_vrconf.menu_Hradius.generic.callback 	= VRconf_MenuEvent;
ADDRGP4 s_vrconf+1016+48
ADDRGP4 VRconf_MenuEvent
ASGNP4
line 899
;899:	s_vrconf.menu_Hradius.minvalue 			= 0.0f;
ADDRGP4 s_vrconf+1016+64
CNSTF4 0
ASGNF4
line 900
;900:	s_vrconf.menu_Hradius.maxvalue 			= 40.0f;
ADDRGP4 s_vrconf+1016+68
CNSTF4 1109393408
ASGNF4
line 901
;901:	s_vrconf.menu_Hradius.generic.statusbar = VRconf_StatusBar;
ADDRGP4 s_vrconf+1016+52
ADDRGP4 VRconf_StatusBar
ASGNP4
line 903
;902:
;903:	s_vrconf.menu_Vradius.generic.type 		= MTYPE_SLIDER;
ADDRGP4 s_vrconf+1096
CNSTI4 1
ASGNI4
line 904
;904:	s_vrconf.menu_Vradius.generic.x 		= SCREEN_WIDTH/2;
ADDRGP4 s_vrconf+1096+12
CNSTI4 320
ASGNI4
line 905
;905:	s_vrconf.menu_Vradius.generic.flags 	= QMF_SMALLFONT;
ADDRGP4 s_vrconf+1096+44
CNSTU4 2
ASGNU4
line 906
;906:	s_vrconf.menu_Vradius.generic.name 		= "v radius";
ADDRGP4 s_vrconf+1096+4
ADDRGP4 $522
ASGNP4
line 907
;907:	s_vrconf.menu_Vradius.generic.id 		= ID_MENU_V_RADIUS;
ADDRGP4 s_vrconf+1096+8
CNSTI4 13
ASGNI4
line 908
;908:	s_vrconf.menu_Vradius.generic.callback 	= VRconf_MenuEvent;
ADDRGP4 s_vrconf+1096+48
ADDRGP4 VRconf_MenuEvent
ASGNP4
line 909
;909:	s_vrconf.menu_Vradius.minvalue 			= 0.0f;
ADDRGP4 s_vrconf+1096+64
CNSTF4 0
ASGNF4
line 910
;910:	s_vrconf.menu_Vradius.maxvalue 			= 40.0f;
ADDRGP4 s_vrconf+1096+68
CNSTF4 1109393408
ASGNF4
line 911
;911:	s_vrconf.menu_Vradius.generic.statusbar = VRconf_StatusBar;
ADDRGP4 s_vrconf+1096+52
ADDRGP4 VRconf_StatusBar
ASGNP4
line 917
;912:
;913:	//==========================================================================
;914:	// 							Laser beam
;915:	//==========================================================================
;916:	// Section
;917:	s_vrconf.beam.generic.type 			= MTYPE_PTEXT;
ADDRGP4 s_vrconf+628
CNSTI4 9
ASGNI4
line 918
;918:	s_vrconf.beam.generic.flags 		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_vrconf+628+44
CNSTU4 272
ASGNU4
line 919
;919:	s_vrconf.beam.generic.id 			= ID_BEAM;
ADDRGP4 s_vrconf+628+8
CNSTI4 100
ASGNI4
line 920
;920:	s_vrconf.beam.generic.callback 		= VRconf_MenuEvent;
ADDRGP4 s_vrconf+628+48
ADDRGP4 VRconf_MenuEvent
ASGNP4
line 921
;921:	s_vrconf.beam.generic.x 			= 152;
ADDRGP4 s_vrconf+628+12
CNSTI4 152
ASGNI4
line 922
;922:	s_vrconf.beam.generic.y 			= 240 - PROP_HEIGHT;
ADDRGP4 s_vrconf+628+16
CNSTI4 213
ASGNI4
line 923
;923:	s_vrconf.beam.string 				= "Beam";
ADDRGP4 s_vrconf+628+64
ADDRGP4 $546
ASGNP4
line 924
;924:	s_vrconf.beam.style 				= UI_RIGHT;
ADDRGP4 s_vrconf+628+68
CNSTI4 2
ASGNI4
line 925
;925:	s_vrconf.beam.color 				= color_red;
ADDRGP4 s_vrconf+628+72
ADDRGP4 color_red
ASGNP4
line 928
;926:
;927:	//Sub-Section
;928:	s_vrconf.beam_enable.generic.type 		= MTYPE_RADIOBUTTON;
ADDRGP4 s_vrconf+1176
CNSTI4 5
ASGNI4
line 929
;929:	s_vrconf.beam_enable.generic.flags 		= QMF_SMALLFONT;
ADDRGP4 s_vrconf+1176+44
CNSTU4 2
ASGNU4
line 930
;930:	s_vrconf.beam_enable.generic.x 			= SCREEN_WIDTH/2;
ADDRGP4 s_vrconf+1176+12
CNSTI4 320
ASGNI4
line 931
;931:	s_vrconf.beam_enable.generic.name 		= "enable";
ADDRGP4 s_vrconf+1176+4
ADDRGP4 $558
ASGNP4
line 932
;932:	s_vrconf.beam_enable.generic.id 		= ID_BEAM_ENABLE;
ADDRGP4 s_vrconf+1176+8
CNSTI4 20
ASGNI4
line 933
;933:	s_vrconf.beam_enable.generic.callback 	= VRconf_MenuEvent;
ADDRGP4 s_vrconf+1176+48
ADDRGP4 VRconf_MenuEvent
ASGNP4
line 934
;934:	s_vrconf.beam_enable.generic.statusbar 	= VRconf_StatusBar;
ADDRGP4 s_vrconf+1176+52
ADDRGP4 VRconf_StatusBar
ASGNP4
line 936
;935:
;936:	s_vrconf.beam_stabilized.generic.type 	= MTYPE_RADIOBUTTON;
ADDRGP4 s_vrconf+1244
CNSTI4 5
ASGNI4
line 937
;937:	s_vrconf.beam_stabilized.generic.flags 	= QMF_SMALLFONT;
ADDRGP4 s_vrconf+1244+44
CNSTU4 2
ASGNU4
line 938
;938:	s_vrconf.beam_stabilized.generic.x 		= SCREEN_WIDTH/2;
ADDRGP4 s_vrconf+1244+12
CNSTI4 320
ASGNI4
line 939
;939:	s_vrconf.beam_stabilized.generic.name 	= "stabilized";
ADDRGP4 s_vrconf+1244+4
ADDRGP4 $572
ASGNP4
line 940
;940:	s_vrconf.beam_stabilized.generic.id 	= ID_BEAM_STABILIZED;
ADDRGP4 s_vrconf+1244+8
CNSTI4 21
ASGNI4
line 941
;941:	s_vrconf.beam_stabilized.generic.callback 	= VRconf_MenuEvent;
ADDRGP4 s_vrconf+1244+48
ADDRGP4 VRconf_MenuEvent
ASGNP4
line 942
;942:	s_vrconf.beam_stabilized.generic.statusbar 	= VRconf_StatusBar;
ADDRGP4 s_vrconf+1244+52
ADDRGP4 VRconf_StatusBar
ASGNP4
line 944
;943:
;944:	y = 170;
ADDRLP4 0
CNSTI4 170
ASGNI4
line 945
;945:	y += 3 * PROP_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 81
ADDI4
ASGNI4
line 946
;946:	x= 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 947
;947:	s_vrconf.beam_color.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_vrconf+1312
CNSTI4 3
ASGNI4
line 948
;948:	s_vrconf.beam_color.generic.flags		= QMF_NODEFAULTINIT;
ADDRGP4 s_vrconf+1312+44
CNSTU4 32768
ASGNU4
line 949
;949:	s_vrconf.beam_color.generic.id			= ID_BEAM_COLOR;
ADDRGP4 s_vrconf+1312+8
CNSTI4 22
ASGNI4
line 950
;950:	s_vrconf.beam_color.generic.ownerdraw	= VR_Conf_DrawBeam_color;
ADDRGP4 s_vrconf+1312+56
ADDRGP4 VR_Conf_DrawBeam_color
ASGNP4
line 951
;951:	s_vrconf.beam_color.generic.x			= x;
ADDRGP4 s_vrconf+1312+12
ADDRLP4 4
INDIRI4
ASGNI4
line 952
;952:	s_vrconf.beam_color.generic.y			= y;
ADDRGP4 s_vrconf+1312+16
ADDRLP4 0
INDIRI4
ASGNI4
line 953
;953:	s_vrconf.beam_color.generic.left		= x;
ADDRGP4 s_vrconf+1312+20
ADDRLP4 4
INDIRI4
ASGNI4
line 954
;954:	s_vrconf.beam_color.generic.top 		= y - 8;
ADDRGP4 s_vrconf+1312+24
ADDRLP4 0
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 955
;955:	s_vrconf.beam_color.generic.right		= x + 200;
ADDRGP4 s_vrconf+1312+28
ADDRLP4 4
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 956
;956:	s_vrconf.beam_color.generic.bottom		= y;
ADDRGP4 s_vrconf+1312+32
ADDRLP4 0
INDIRI4
ASGNI4
line 957
;957:	s_vrconf.beam_color.numitems			= 7;
ADDRGP4 s_vrconf+1312+72
CNSTI4 7
ASGNI4
line 958
;958:	s_vrconf.beam_color.generic.callback 	= VRconf_MenuEvent;
ADDRGP4 s_vrconf+1312+48
ADDRGP4 VRconf_MenuEvent
ASGNP4
line 961
;959:
;960:
;961:	s_vrconf.beam_alpha.generic.type 		= MTYPE_SLIDER;
ADDRGP4 s_vrconf+1456
CNSTI4 1
ASGNI4
line 962
;962:	s_vrconf.beam_alpha.generic.x 			= SCREEN_WIDTH/2;
ADDRGP4 s_vrconf+1456+12
CNSTI4 320
ASGNI4
line 963
;963:	s_vrconf.beam_alpha.generic.flags 		= QMF_SMALLFONT;
ADDRGP4 s_vrconf+1456+44
CNSTU4 2
ASGNU4
line 964
;964:	s_vrconf.beam_alpha.generic.name 		= "transparency";
ADDRGP4 s_vrconf+1456+4
ADDRGP4 $609
ASGNP4
line 965
;965:	s_vrconf.beam_alpha.generic.id 			= ID_BEAM_ALPHA;
ADDRGP4 s_vrconf+1456+8
CNSTI4 23
ASGNI4
line 966
;966:	s_vrconf.beam_alpha.generic.callback 	= VRconf_MenuEvent;
ADDRGP4 s_vrconf+1456+48
ADDRGP4 VRconf_MenuEvent
ASGNP4
line 967
;967:	s_vrconf.beam_alpha.minvalue 			= 0;
ADDRGP4 s_vrconf+1456+64
CNSTF4 0
ASGNF4
line 968
;968:	s_vrconf.beam_alpha.maxvalue 			= 255;
ADDRGP4 s_vrconf+1456+68
CNSTF4 1132396544
ASGNF4
line 969
;969:	s_vrconf.beam_alpha.generic.statusbar 	= VRconf_StatusBar;
ADDRGP4 s_vrconf+1456+52
ADDRGP4 VRconf_StatusBar
ASGNP4
line 972
;970:
;971:
;972:	s_vrconf.laserBeamOthers.generic.type 		= MTYPE_RADIOBUTTON;
ADDRGP4 s_vrconf+1536
CNSTI4 5
ASGNI4
line 973
;973:	s_vrconf.laserBeamOthers.generic.flags 		= QMF_SMALLFONT;
ADDRGP4 s_vrconf+1536+44
CNSTU4 2
ASGNU4
line 974
;974:	s_vrconf.laserBeamOthers.generic.x 			= SCREEN_WIDTH/2;
ADDRGP4 s_vrconf+1536+12
CNSTI4 320
ASGNI4
line 975
;975:	s_vrconf.laserBeamOthers.generic.name 		= "Others players'beam";// (when server allow it)";
ADDRGP4 s_vrconf+1536+4
ADDRGP4 $627
ASGNP4
line 976
;976:	s_vrconf.laserBeamOthers.generic.id 		= ID_laserBeamOthers;
ADDRGP4 s_vrconf+1536+8
CNSTI4 24
ASGNI4
line 977
;977:	s_vrconf.laserBeamOthers.generic.callback 	= VRconf_MenuEvent;
ADDRGP4 s_vrconf+1536+48
ADDRGP4 VRconf_MenuEvent
ASGNP4
line 978
;978:	s_vrconf.laserBeamOthers.generic.statusbar 	= VRconf_StatusBar;
ADDRGP4 s_vrconf+1536+52
ADDRGP4 VRconf_StatusBar
ASGNP4
line 984
;979:
;980:	//==========================================================================
;981:	// 							HUD
;982:	//==========================================================================
;983:	// Section
;984:	s_vrconf.hud.generic.type 			= MTYPE_PTEXT;
ADDRGP4 s_vrconf+704
CNSTI4 9
ASGNI4
line 985
;985:	s_vrconf.hud.generic.flags 			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_vrconf+704+44
CNSTU4 272
ASGNU4
line 986
;986:	s_vrconf.hud.generic.id 			= ID_HUD;
ADDRGP4 s_vrconf+704+8
CNSTI4 102
ASGNI4
line 987
;987:	s_vrconf.hud.generic.callback 		= VRconf_MenuEvent;
ADDRGP4 s_vrconf+704+48
ADDRGP4 VRconf_MenuEvent
ASGNP4
line 988
;988:	s_vrconf.hud.generic.x 				= 152;
ADDRGP4 s_vrconf+704+12
CNSTI4 152
ASGNI4
line 989
;989:	s_vrconf.hud.generic.y	    		= 240;
ADDRGP4 s_vrconf+704+16
CNSTI4 240
ASGNI4
line 990
;990:	s_vrconf.hud.string 				= "HUD";
ADDRGP4 s_vrconf+704+64
ADDRGP4 $647
ASGNP4
line 991
;991:	s_vrconf.hud.style 					= UI_RIGHT;
ADDRGP4 s_vrconf+704+68
CNSTI4 2
ASGNI4
line 992
;992:	s_vrconf.hud.color 					= color_red;
ADDRGP4 s_vrconf+704+72
ADDRGP4 color_red
ASGNP4
line 1020
;993:
;994:	//Sub-Section
;995:	/*y = BIGCHAR_HEIGHT+2;
;996:	s_vrconf.hud_align.generic.type 	= MTYPE_SPINCONTROL;
;997:	s_vrconf.hud_align.generic.id 		= ID_HUD_ALIGN;
;998:	s_vrconf.hud_align.generic.name 	= "HUD align:";
;999:	s_vrconf.hud_align.generic.flags 	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
;1000:	s_vrconf.hud_align.generic.x 		= 400;
;1001:	s_vrconf.hud_align.generic.y 		= y;
;1002:	s_vrconf.hud_align.itemnames 		= align_name;
;1003:	s_vrconf.hud_align.generic.callback	= VRconf_MenuEvent;
;1004:
;1005:
;1006:	s_vrconf.hud_align_dist.generic.type 	= MTYPE_SLIDER;
;1007:	s_vrconf.hud_align_dist.generic.id 		= ID_HUD_ALIGN_DIST;
;1008:	s_vrconf.hud_align_dist.generic.name 	= "Border distance:";
;1009:	s_vrconf.hud_align_dist.generic.flags 	= QMF_SMALLFONT;
;1010:	s_vrconf.hud_align_dist.generic.x 		= SCREEN_WIDTH/2;
;1011:	s_vrconf.hud_align_dist.generic.callback= VRconf_MenuEvent;
;1012:	s_vrconf.hud_align_dist.minvalue 		= 2;
;1013:	s_vrconf.hud_align_dist.maxvalue 		= 128;//SCREEN_WIDTH/4;
;1014:	s_vrconf.hud_align_dist.generic.statusbar = VRconf_StatusBar;*/
;1015:
;1016:	//==========================================================================
;1017:	// 							MODEL
;1018:	//==========================================================================
;1019:	// Section
;1020:	s_vrconf.model.generic.type 		= MTYPE_PTEXT;
ADDRGP4 s_vrconf+780
CNSTI4 9
ASGNI4
line 1021
;1021:	s_vrconf.model.generic.flags 		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_vrconf+780+44
CNSTU4 272
ASGNU4
line 1022
;1022:	s_vrconf.model.generic.id 			= ID_MODEL;
ADDRGP4 s_vrconf+780+8
CNSTI4 103
ASGNI4
line 1023
;1023:	s_vrconf.model.generic.callback 	= VRconf_MenuEvent;
ADDRGP4 s_vrconf+780+48
ADDRGP4 VRconf_MenuEvent
ASGNP4
line 1024
;1024:	s_vrconf.model.generic.x 			= 152;
ADDRGP4 s_vrconf+780+12
CNSTI4 152
ASGNI4
line 1025
;1025:	s_vrconf.model.generic.y	    	= 240 + PROP_HEIGHT;
ADDRGP4 s_vrconf+780+16
CNSTI4 267
ASGNI4
line 1026
;1026:	s_vrconf.model.string 				= "MODEL";
ADDRGP4 s_vrconf+780+64
ADDRGP4 $665
ASGNP4
line 1027
;1027:	s_vrconf.model.style 				= UI_RIGHT;
ADDRGP4 s_vrconf+780+68
CNSTI4 2
ASGNI4
line 1028
;1028:	s_vrconf.model.color 				= color_red;
ADDRGP4 s_vrconf+780+72
ADDRGP4 color_red
ASGNP4
line 1031
;1029:
;1030:	//Sub-Section
;1031:	s_vrconf.hide_torso.generic.type 	= MTYPE_RADIOBUTTON;
ADDRGP4 s_vrconf+1604
CNSTI4 5
ASGNI4
line 1032
;1032:	s_vrconf.hide_torso.generic.flags 	= QMF_SMALLFONT;
ADDRGP4 s_vrconf+1604+44
CNSTU4 2
ASGNU4
line 1033
;1033:	s_vrconf.hide_torso.generic.x 		= SCREEN_WIDTH/2;
ADDRGP4 s_vrconf+1604+12
CNSTI4 320
ASGNI4
line 1034
;1034:	s_vrconf.hide_torso.generic.name 	= "Hide torso";
ADDRGP4 s_vrconf+1604+4
ADDRGP4 $677
ASGNP4
line 1035
;1035:	s_vrconf.hide_torso.generic.id 		= ID_HIDE_TORSO;
ADDRGP4 s_vrconf+1604+8
CNSTI4 40
ASGNI4
line 1036
;1036:	s_vrconf.hide_torso.generic.callback = VRconf_MenuEvent;
ADDRGP4 s_vrconf+1604+48
ADDRGP4 VRconf_MenuEvent
ASGNP4
line 1037
;1037:	s_vrconf.hide_torso.generic.statusbar = VRconf_StatusBar;
ADDRGP4 s_vrconf+1604+52
ADDRGP4 VRconf_StatusBar
ASGNP4
line 1039
;1038:
;1039:	s_vrconf.angle_hide_torso.generic.type 	= MTYPE_SLIDER;
ADDRGP4 s_vrconf+1672
CNSTI4 1
ASGNI4
line 1040
;1040:	s_vrconf.angle_hide_torso.generic.id 	= ID_ANGLE_HIDE_TORSO;
ADDRGP4 s_vrconf+1672+8
CNSTI4 41
ASGNI4
line 1041
;1041:	s_vrconf.angle_hide_torso.generic.name 	= "Auto Hide torso";
ADDRGP4 s_vrconf+1672+4
ADDRGP4 $689
ASGNP4
line 1042
;1042:	s_vrconf.angle_hide_torso.generic.flags = QMF_SMALLFONT;
ADDRGP4 s_vrconf+1672+44
CNSTU4 2
ASGNU4
line 1043
;1043:	s_vrconf.angle_hide_torso.generic.x 	= SCREEN_WIDTH/2;
ADDRGP4 s_vrconf+1672+12
CNSTI4 320
ASGNI4
line 1044
;1044:	s_vrconf.angle_hide_torso.generic.callback = VRconf_MenuEvent;
ADDRGP4 s_vrconf+1672+48
ADDRGP4 VRconf_MenuEvent
ASGNP4
line 1045
;1045:	s_vrconf.angle_hide_torso.minvalue 		= 0;
ADDRGP4 s_vrconf+1672+64
CNSTF4 0
ASGNF4
line 1046
;1046:	s_vrconf.angle_hide_torso.maxvalue 		= 45;
ADDRGP4 s_vrconf+1672+68
CNSTF4 1110704128
ASGNF4
line 1047
;1047:	s_vrconf.angle_hide_torso.generic.statusbar = VRconf_StatusBar;
ADDRGP4 s_vrconf+1672+52
ADDRGP4 VRconf_StatusBar
ASGNP4
line 1052
;1048:
;1049:	//==========================================================================
;1050:	// 							Back Button
;1051:	//==========================================================================
;1052:	s_vrconf.back.generic.type 			= MTYPE_BITMAP;
ADDRGP4 s_vrconf+1760
CNSTI4 6
ASGNI4
line 1053
;1053:	s_vrconf.back.generic.name 			= ART_BACK0;
ADDRGP4 s_vrconf+1760+4
ADDRGP4 $705
ASGNP4
line 1054
;1054:	s_vrconf.back.generic.flags 		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_vrconf+1760+44
CNSTU4 260
ASGNU4
line 1055
;1055:	s_vrconf.back.generic.x 			= 0;
ADDRGP4 s_vrconf+1760+12
CNSTI4 0
ASGNI4
line 1056
;1056:	s_vrconf.back.generic.y 			= 480-64;
ADDRGP4 s_vrconf+1760+16
CNSTI4 416
ASGNI4
line 1057
;1057:	s_vrconf.back.generic.id 			= ID_BACK;
ADDRGP4 s_vrconf+1760+8
CNSTI4 106
ASGNI4
line 1058
;1058:	s_vrconf.back.generic.callback 		= VRconf_MenuEvent;
ADDRGP4 s_vrconf+1760+48
ADDRGP4 VRconf_MenuEvent
ASGNP4
line 1059
;1059:	s_vrconf.back.width 				= 128;
ADDRGP4 s_vrconf+1760+80
CNSTI4 128
ASGNI4
line 1060
;1060:	s_vrconf.back.height 				= 64;
ADDRGP4 s_vrconf+1760+84
CNSTI4 64
ASGNI4
line 1061
;1061:	s_vrconf.back.focuspic 				= ART_BACK1;
ADDRGP4 s_vrconf+1760+64
ADDRGP4 $722
ASGNP4
line 1064
;1062:
;1063:	// add title & background
;1064:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.banner );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1065
;1065:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.framel );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1066
;1066:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.framer );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1069
;1067:
;1068:	// add section
;1069:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.menuplane );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+552
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1070
;1070:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.beam );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+628
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1071
;1071:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.hud );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+704
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1072
;1072:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.model );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+780
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1076
;1073:	//Menu_AddItem( &s_vrconf.menu, &s_vrconf.toolsbar );
;1074:
;1075:	// 3D Menu subsections
;1076:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.distance );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+856
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1077
;1077:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.planesNumber );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+936
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1078
;1078:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.menu_Hradius );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+1016
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1079
;1079:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.menu_Vradius );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+1096
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1082
;1080:
;1081:	// Laser Beam subsections
;1082:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.beam_enable );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+1176
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1083
;1083:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.beam_stabilized );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+1244
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1084
;1084:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.beam_color );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+1312
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1085
;1085:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.beam_alpha );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+1456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1086
;1086:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.laserBeamOthers );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+1536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1093
;1087:
;1088:	// HUD subsections
;1089:	//Menu_AddItem( &s_vrconf.menu, &s_vrconf.hud_align );
;1090:	//Menu_AddItem( &s_vrconf.menu, &s_vrconf.hud_align_dist );
;1091:
;1092:	// MODEL subsections
;1093:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.hide_torso );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+1604
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1094
;1094:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.angle_hide_torso );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+1672
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1096
;1095:
;1096:	Menu_AddItem( &s_vrconf.menu, &s_vrconf.back );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 s_vrconf+1760
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1099
;1097:
;1098:	// initialize the configurable cvars
;1099:	VRconf_InitCvars();
ADDRGP4 VRconf_InitCvars
CALLV
pop
line 1102
;1100:
;1101:	// initialize the current config
;1102:	VRconf_GetConfig();
ADDRGP4 VRconf_GetConfig
CALLV
pop
line 1105
;1103:
;1104:	// initial default section
;1105:	s_vrconf.section = C_MENUPLANE;
ADDRGP4 s_vrconf+548
CNSTI4 0
ASGNI4
line 1108
;1106:
;1107:	// update the ui
;1108:	VRconf_Update();
ADDRGP4 VRconf_Update
CALLV
pop
line 1109
;1109:}
LABELV $396
endproc VRconf_MenuInit 8 12
export VRconf_Cache
proc VRconf_Cache 32 4
line 1116
;1110:
;1111:/*
;1112:=================
;1113:VRconf_Cache
;1114:=================
;1115:*/
;1116:void VRconf_Cache( void ) {
line 1117
;1117:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $705
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1118
;1118:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $722
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1119
;1119:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $418
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1120
;1120:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $432
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1122
;1121:
;1122:	s_vrconf.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
ADDRGP4 $745
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_vrconf+1420
ADDRLP4 0
INDIRI4
ASGNI4
line 1123
;1123:	s_vrconf.fxPic[0] = trap_R_RegisterShaderNoMip( ART_FX_RED );
ADDRGP4 $747
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_vrconf+1424
ADDRLP4 4
INDIRI4
ASGNI4
line 1124
;1124:	s_vrconf.fxPic[1] = trap_R_RegisterShaderNoMip( ART_FX_YELLOW );
ADDRGP4 $750
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_vrconf+1424+4
ADDRLP4 8
INDIRI4
ASGNI4
line 1125
;1125:	s_vrconf.fxPic[2] = trap_R_RegisterShaderNoMip( ART_FX_GREEN );
ADDRGP4 $753
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_vrconf+1424+8
ADDRLP4 12
INDIRI4
ASGNI4
line 1126
;1126:	s_vrconf.fxPic[3] = trap_R_RegisterShaderNoMip( ART_FX_TEAL );
ADDRGP4 $756
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_vrconf+1424+12
ADDRLP4 16
INDIRI4
ASGNI4
line 1127
;1127:	s_vrconf.fxPic[4] = trap_R_RegisterShaderNoMip( ART_FX_BLUE );
ADDRGP4 $759
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_vrconf+1424+16
ADDRLP4 20
INDIRI4
ASGNI4
line 1128
;1128:	s_vrconf.fxPic[5] = trap_R_RegisterShaderNoMip( ART_FX_CYAN );
ADDRGP4 $762
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_vrconf+1424+20
ADDRLP4 24
INDIRI4
ASGNI4
line 1129
;1129:	s_vrconf.fxPic[6] = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
ADDRGP4 $765
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_vrconf+1424+24
ADDRLP4 28
INDIRI4
ASGNI4
line 1130
;1130:}
LABELV $743
endproc VRconf_Cache 32 4
export UI_VRconfMenu
proc UI_VRconfMenu 0 4
line 1137
;1131:
;1132:/*
;1133:=================
;1134:UI_VRconfMenu
;1135:=================
;1136:*/
;1137:void UI_VRconfMenu( void ) {
line 1138
;1138:	VRconf_MenuInit();
ADDRGP4 VRconf_MenuInit
CALLV
pop
line 1139
;1139:	UI_PushMenu( &s_vrconf.menu );
ADDRGP4 s_vrconf
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1140
;1140:}
LABELV $766
endproc UI_VRconfMenu 0 4
bss
align 4
LABELV s_vrconf
skip 1852
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
import UI_UpdateCvars
import UI_RegisterCvars
import UI_MainMenu
import MainMenu_Cache
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import UI_VideoCheck
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
import laserBeamRGBA
import vr_controller_type
import ui_cdkeychecked
import ui_cdkey
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_brassTime
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
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
LABELV $765
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
byte 1 120
byte 1 95
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $762
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
byte 1 120
byte 1 95
byte 1 99
byte 1 121
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $759
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
byte 1 120
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $756
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
byte 1 120
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $753
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
byte 1 120
byte 1 95
byte 1 103
byte 1 114
byte 1 110
byte 1 0
align 1
LABELV $750
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
byte 1 120
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $747
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
byte 1 120
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $745
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
byte 1 120
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $722
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $705
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $689
byte 1 65
byte 1 117
byte 1 116
byte 1 111
byte 1 32
byte 1 72
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $677
byte 1 72
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $665
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 76
byte 1 0
align 1
LABELV $647
byte 1 72
byte 1 85
byte 1 68
byte 1 0
align 1
LABELV $627
byte 1 79
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 39
byte 1 98
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $609
byte 1 116
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 112
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $572
byte 1 115
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
LABELV $558
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $546
byte 1 66
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $522
byte 1 118
byte 1 32
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $504
byte 1 104
byte 1 32
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $486
byte 1 112
byte 1 108
byte 1 97
byte 1 110
byte 1 101
byte 1 115
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $468
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
LABELV $456
byte 1 77
byte 1 69
byte 1 78
byte 1 85
byte 1 0
align 1
LABELV $432
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
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 49
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $418
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
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 50
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $410
byte 1 86
byte 1 82
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $322
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 105
byte 1 114
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $321
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $265
byte 1 37
byte 1 120
byte 1 0
align 1
LABELV $258
byte 1 48
byte 1 120
byte 1 70
byte 1 70
byte 1 68
byte 1 56
byte 1 48
byte 1 48
byte 1 56
byte 1 0
align 1
LABELV $253
byte 1 70
byte 1 70
byte 1 0
align 1
LABELV $229
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 70
byte 1 70
byte 1 67
byte 1 48
byte 1 0
align 1
LABELV $228
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
LABELV $226
byte 1 48
byte 1 120
byte 1 70
byte 1 70
byte 1 70
byte 1 70
byte 1 70
byte 1 70
byte 1 0
align 1
LABELV $223
byte 1 48
byte 1 120
byte 1 70
byte 1 70
byte 1 48
byte 1 48
byte 1 70
byte 1 70
byte 1 0
align 1
LABELV $220
byte 1 48
byte 1 120
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 70
byte 1 70
byte 1 0
align 1
LABELV $217
byte 1 48
byte 1 120
byte 1 48
byte 1 48
byte 1 70
byte 1 70
byte 1 70
byte 1 70
byte 1 0
align 1
LABELV $214
byte 1 48
byte 1 120
byte 1 48
byte 1 48
byte 1 70
byte 1 70
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $211
byte 1 48
byte 1 120
byte 1 70
byte 1 70
byte 1 68
byte 1 56
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $208
byte 1 48
byte 1 120
byte 1 70
byte 1 70
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $205
byte 1 48
byte 1 120
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $101
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $83
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
LABELV $82
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
LABELV $81
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 66
byte 1 101
byte 1 97
byte 1 109
byte 1 79
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $80
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
LABELV $79
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 66
byte 1 101
byte 1 97
byte 1 109
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $78
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 118
byte 1 95
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $77
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 104
byte 1 95
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $76
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 110
byte 1 101
byte 1 115
byte 1 95
byte 1 110
byte 1 98
byte 1 0
align 1
LABELV $75
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
LABELV $74
byte 1 66
byte 1 111
byte 1 116
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $73
byte 1 84
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $72
byte 1 82
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $71
byte 1 76
byte 1 101
byte 1 102
byte 1 116
byte 1 0
align 1
LABELV $70
byte 1 78
byte 1 111
byte 1 32
byte 1 72
byte 1 85
byte 1 68
byte 1 0
