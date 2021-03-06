data
align 4
LABELV handicap_items
address $69
address $70
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
address $82
address $83
address $84
address $85
address $86
address $87
address $88
byte 4 0
code
proc PlayerSettings_DrawName 88 20
file "..\..\..\..\code\q3_ui\ui_playersettings.c"
line 84
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:#define ART_FRAMEL			"menu/art/frame2_l"
;6:#define ART_FRAMER			"menu/art/frame1_r"
;7:#define ART_MODEL0			"menu/art/model_0"
;8:#define ART_MODEL1			"menu/art/model_1"
;9:#define ART_BACK0			"menu/art/back_0"
;10:#define ART_BACK1			"menu/art/back_1"
;11:#define ART_FX_BASE			"menu/art/fx_base"
;12:#define ART_FX_BLUE			"menu/art/fx_blue"
;13:#define ART_FX_CYAN			"menu/art/fx_cyan"
;14:#define ART_FX_GREEN		"menu/art/fx_grn"
;15:#define ART_FX_RED			"menu/art/fx_red"
;16:#define ART_FX_TEAL			"menu/art/fx_teal"
;17:#define ART_FX_WHITE		"menu/art/fx_white"
;18:#define ART_FX_YELLOW		"menu/art/fx_yel"
;19:
;20:#define ID_NAME			10
;21:#define ID_HANDICAP		11
;22:#define ID_EFFECTS		12
;23:#define ID_BACK			13
;24:#define ID_MODEL		14
;25:
;26:#define MAX_NAMELENGTH	20
;27:
;28:
;29:typedef struct {
;30:	menuframework_s		menu;
;31:
;32:	menutext_s			banner;
;33:	menubitmap_s		framel;
;34:	menubitmap_s		framer;
;35:	menubitmap_s		player;
;36:
;37:	menufield_s			name;
;38:	menulist_s			handicap;
;39:	menulist_s			effects;
;40:
;41:	menubitmap_s		back;
;42:	menubitmap_s		model;
;43:	menubitmap_s		item_null;
;44:
;45:	qhandle_t			fxBasePic;
;46:	qhandle_t			fxPic;
;47:	playerInfo_t		playerinfo;
;48:	int					current_fx;
;49:	char				playerModel[MAX_QPATH];
;50:} playersettings_t;
;51:
;52:static playersettings_t	s_playersettings;
;53:
;54:static const char *handicap_items[] = {
;55:	"None",
;56:	"95",
;57:	"90",
;58:	"85",
;59:	"80",
;60:	"75",
;61:	"70",
;62:	"65",
;63:	"60",
;64:	"55",
;65:	"50",
;66:	"45",
;67:	"40",
;68:	"35",
;69:	"30",
;70:	"25",
;71:	"20",
;72:	"15",
;73:	"10",
;74:	"5",
;75:	NULL
;76:};
;77:
;78:
;79:/*
;80:=================
;81:PlayerSettings_DrawName
;82:=================
;83:*/
;84:static void PlayerSettings_DrawName( void *self ) {
line 95
;85:	menufield_s		*f;
;86:	qboolean		focus;
;87:	int				style;
;88:	char			*txt;
;89:	char			c;
;90:	float			*color;
;91:	int				n;
;92:	int				basex, x, y;
;93:	char			name[32];
;94:
;95:	f = (menufield_s*)self;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
line 96
;96:	basex = f->generic.x;
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 97
;97:	y = f->generic.y;
ADDRLP4 28
ADDRLP4 32
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 98
;98:	focus = (f->generic.parent->cursor == f->generic.menuPosition);
ADDRLP4 32
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $91
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRGP4 $92
JUMPV
LABELV $91
ADDRLP4 72
CNSTI4 0
ASGNI4
LABELV $92
ADDRLP4 20
ADDRLP4 72
INDIRI4
ASGNI4
line 100
;99:#ifdef USE_VIRTUAL_KEYBOARD
;100:	{
line 102
;101:		// when  virtual keyboard is shown, the name is always focused in this property page
;102:		int showVirtualKeyboard = trap_Cvar_VariableValue( "showVirtualKeyboard" );
ADDRGP4 $93
ARGP4
ADDRLP4 84
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 80
ADDRLP4 84
INDIRF4
CVFI4 4
ASGNI4
line 104
;103:		
;104:		if ( !focus && showVirtualKeyboard == 1 ) {
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $94
ADDRLP4 80
INDIRI4
CNSTI4 1
NEI4 $94
line 105
;105:			focus = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 106
;106:		}
LABELV $94
line 107
;107:	}
line 109
;108:#endif	
;109:	style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 24
CNSTI4 16
ASGNI4
line 110
;110:	color = text_color_normal;
ADDRLP4 12
ADDRGP4 text_color_normal
ASGNP4
line 111
;111:	if( focus ) {
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $96
line 112
;112:		style |= UI_PULSE;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 113
;113:		color = text_color_highlight;
ADDRLP4 12
ADDRGP4 text_color_highlight
ASGNP4
line 114
;114:	}
LABELV $96
line 116
;115:
;116:	UI_DrawProportionalString( basex, y, "Name", style, color );
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 $98
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 119
;117:
;118:	// draw the actual name
;119:	basex += 64;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 120
;120:	y += PROP_HEIGHT;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 121
;121:	txt = f->field.buffer;
ADDRLP4 0
ADDRLP4 32
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
line 122
;122:	color = g_color_table[ColorIndex(COLOR_WHITE)];
ADDRLP4 12
ADDRGP4 g_color_table+112
ASGNP4
line 123
;123:	x = basex;
ADDRLP4 8
ADDRLP4 36
INDIRI4
ASGNI4
ADDRGP4 $101
JUMPV
LABELV $100
line 124
;124:	while ( (c = *txt) != 0 ) {
line 125
;125:		if ( !focus && Q_IsColorString( txt ) ) {
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $103
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $103
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $103
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $103
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $103
line 126
;126:			n = ColorIndex( *(txt+1) );
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
ASGNI4
line 127
;127:			if( n == 0 ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $105
line 128
;128:				n = 7;
ADDRLP4 16
CNSTI4 7
ASGNI4
line 129
;129:			}
LABELV $105
line 130
;130:			color = g_color_table[n];
ADDRLP4 12
ADDRLP4 16
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ASGNP4
line 131
;131:			txt += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 132
;132:			continue;
ADDRGP4 $101
JUMPV
LABELV $103
line 134
;133:		}
;134:		UI_DrawChar( x, y, c, style, color );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 135
;135:		txt++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 136
;136:		x += SMALLCHAR_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 137
;137:	}
LABELV $101
line 124
ADDRLP4 80
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 4
ADDRLP4 80
INDIRI1
ASGNI1
ADDRLP4 80
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $100
line 140
;138:
;139:	// draw cursor if we have focus
;140:	if( focus ) {
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $107
line 141
;141:		if ( trap_Key_GetOverstrikeMode() ) {
ADDRLP4 84
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $109
line 142
;142:			c = 11;
ADDRLP4 4
CNSTI1 11
ASGNI1
line 143
;143:		} else {
ADDRGP4 $110
JUMPV
LABELV $109
line 144
;144:			c = 10;
ADDRLP4 4
CNSTI1 10
ASGNI1
line 145
;145:		}
LABELV $110
line 147
;146:
;147:		style &= ~UI_PULSE;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 148
;148:		style |= UI_BLINK;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 150
;149:
;150:		UI_DrawChar( basex + f->field.cursor * SMALLCHAR_WIDTH, y, c, style, color_white );
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 151
;151:	}
LABELV $107
line 154
;152:
;153:	// draw at bottom also using proportional font
;154:	Q_strncpyz( name, f->field.buffer, sizeof(name) );
ADDRLP4 40
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 76
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 155
;155:	Q_CleanStr( name );
ADDRLP4 40
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 156
;156:	UI_DrawProportionalString( 320, 440, name, UI_CENTER|UI_BIGFONT, text_color_normal );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRLP4 40
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 157
;157:}
LABELV $89
endproc PlayerSettings_DrawName 88 20
proc PlayerSettings_DrawHandicap 32 20
line 165
;158:
;159:
;160:/*
;161:=================
;162:PlayerSettings_DrawHandicap
;163:=================
;164:*/
;165:static void PlayerSettings_DrawHandicap( void *self ) {
line 171
;166:	menulist_s		*item;
;167:	qboolean		focus;
;168:	int				style;
;169:	float			*color;
;170:
;171:	item = (menulist_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 172
;172:	focus = (item->generic.parent->cursor == item->generic.menuPosition);
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
NEI4 $113
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $114
JUMPV
LABELV $113
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $114
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 174
;173:
;174:	style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 175
;175:	color = text_color_normal;
ADDRLP4 8
ADDRGP4 text_color_normal
ASGNP4
line 176
;176:	if( focus ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $115
line 177
;177:		style |= UI_PULSE;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 178
;178:		color = text_color_highlight;
ADDRLP4 8
ADDRGP4 text_color_highlight
ASGNP4
line 179
;179:	}
LABELV $115
line 181
;180:
;181:	UI_DrawProportionalString( item->generic.x, item->generic.y, "Handicap", style, color );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 $117
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 182
;182:	UI_DrawProportionalString( item->generic.x + 64, item->generic.y + PROP_HEIGHT, handicap_items[item->curvalue], style, color );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 27
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 handicap_items
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 183
;183:}
LABELV $111
endproc PlayerSettings_DrawHandicap 32 20
proc PlayerSettings_DrawEffects 56 20
line 191
;184:
;185:
;186:/*
;187:=================
;188:PlayerSettings_DrawEffects
;189:=================
;190:*/
;191:static void PlayerSettings_DrawEffects( void *self ) {
line 199
;192:	menulist_s		*item;
;193:	qboolean		focus;
;194:	int				style;
;195:	float			*color;
;196:	vec4_t			colors;
;197:	int				c;
;198:
;199:	item = (menulist_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 200
;200:	focus = (item->generic.parent->cursor == item->generic.menuPosition);
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
NEI4 $120
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $121
JUMPV
LABELV $120
ADDRLP4 36
CNSTI4 0
ASGNI4
LABELV $121
ADDRLP4 32
ADDRLP4 36
INDIRI4
ASGNI4
line 202
;201:
;202:	style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 24
CNSTI4 16
ASGNI4
line 203
;203:	color = text_color_normal;
ADDRLP4 28
ADDRGP4 text_color_normal
ASGNP4
line 204
;204:	if( focus ) {
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $122
line 205
;205:		style |= UI_PULSE;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 206
;206:		color = text_color_highlight;
ADDRLP4 28
ADDRGP4 text_color_highlight
ASGNP4
line 207
;207:	}
LABELV $122
line 209
;208:
;209:	UI_DrawProportionalString( item->generic.x, item->generic.y, "Effects", style, color );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 $124
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 211
;210:
;211:	UI_DrawHandlePic( item->generic.x + 64, item->generic.y + PROP_HEIGHT + 8, 128, 8, s_playersettings.fxBasePic );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 27
ADDI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 s_playersettings+1472
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 212
;212:	c = item->curvalue + 1;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 213
;213:	colors[0] = (c >> 0) & 1;
ADDRLP4 4
ADDRLP4 20
INDIRI4
CNSTI4 1
BANDI4
CVIF4 4
ASGNF4
line 214
;214:	colors[1] = (c >> 1) & 1;
ADDRLP4 4+4
ADDRLP4 20
INDIRI4
CNSTI4 1
RSHI4
CNSTI4 1
BANDI4
CVIF4 4
ASGNF4
line 215
;215:	colors[2] = (c >> 2) & 1;
ADDRLP4 4+8
ADDRLP4 20
INDIRI4
CNSTI4 2
RSHI4
CNSTI4 1
BANDI4
CVIF4 4
ASGNF4
line 216
;216:	colors[3] = 1.0;
ADDRLP4 4+12
CNSTF4 1065353216
ASGNF4
line 217
;217:	UI_SetColor( colors );
ADDRLP4 4
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 218
;218:	UI_DrawHandlePic( item->generic.x + 64 + item->curvalue * 16 + 8, item->generic.y + PROP_HEIGHT + 6, 16, 12, s_playersettings.fxPic );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
ADDI4
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
CNSTI4 27
ADDI4
CNSTI4 6
ADDI4
CVIF4 4
ARGF4
CNSTF4 1098907648
ARGF4
CNSTF4 1094713344
ARGF4
ADDRGP4 s_playersettings+1476
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 219
;219:	UI_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 220
;220:}
LABELV $118
endproc PlayerSettings_DrawEffects 56 20
proc PlayerSettings_DrawPlayer 88 28
line 228
;221:
;222:
;223:/*
;224:=================
;225:PlayerSettings_DrawPlayer
;226:=================
;227:*/
;228:static void PlayerSettings_DrawPlayer( void *self ) {
line 233
;229:	menubitmap_s	*b;
;230:	vec3_t			viewangles;
;231:	char			buf[MAX_QPATH];
;232:
;233:	trap_Cvar_VariableStringBuffer( "model", buf, sizeof( buf ) );
ADDRGP4 $131
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 234
;234:	if ( strcmp( buf, s_playersettings.playerModel ) != 0 ) {
ADDRLP4 4
ARGP4
ADDRGP4 s_playersettings+2596
ARGP4
ADDRLP4 80
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $132
line 235
;235:		UI_PlayerInfo_SetModel( &s_playersettings.playerinfo, buf );
ADDRGP4 s_playersettings+1480
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 236
;236:		strcpy( s_playersettings.playerModel, buf );
ADDRGP4 s_playersettings+2596
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 238
;237:
;238:		viewangles[YAW]   = 180 - 30;
ADDRLP4 68+4
CNSTF4 1125515264
ASGNF4
line 239
;239:		viewangles[PITCH] = 0;
ADDRLP4 68
CNSTF4 0
ASGNF4
line 240
;240:		viewangles[ROLL]  = 0;
ADDRLP4 68+8
CNSTF4 0
ASGNF4
line 241
;241:		UI_PlayerInfo_SetInfo( &s_playersettings.playerinfo, LEGS_IDLE, TORSO_STAND, viewangles, vec3_origin, WP_MACHINEGUN, qfalse );
ADDRGP4 s_playersettings+1480
ARGP4
CNSTI4 22
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 68
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 242
;242:	}
LABELV $132
line 244
;243:
;244:	b = (menubitmap_s*) self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 245
;245:	UI_DrawPlayer( b->generic.x, b->generic.y, b->width, b->height, &s_playersettings.playerinfo, uis.realtime/2 );
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
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 s_playersettings+1480
ARGP4
ADDRGP4 uis+4
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRGP4 UI_DrawPlayer
CALLV
pop
line 246
;246:}
LABELV $130
endproc PlayerSettings_DrawPlayer 88 28
proc PlayerSettings_SaveChanges 0 8
line 254
;247:
;248:
;249:/*
;250:=================
;251:PlayerSettings_SaveChanges
;252:=================
;253:*/
;254:static void PlayerSettings_SaveChanges( void ) {
line 256
;255:	// name
;256:	trap_Cvar_Set( "name", s_playersettings.name.field.buffer );
ADDRGP4 $143
ARGP4
ADDRGP4 s_playersettings+640+64+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 259
;257:
;258:	// handicap
;259:	trap_Cvar_SetValue( "handicap", 100 - s_playersettings.handicap.curvalue * 5 );
ADDRGP4 $147
ARGP4
CNSTI4 100
ADDRGP4 s_playersettings+980+68
INDIRI4
CNSTI4 5
MULI4
SUBI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 262
;260:
;261:	// effects color
;262:	trap_Cvar_SetValue( "color1", s_playersettings.effects.curvalue + 1 );
ADDRGP4 $150
ARGP4
ADDRGP4 s_playersettings+1088+68
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 263
;263:}
LABELV $142
endproc PlayerSettings_SaveChanges 0 8
proc PlayerSettings_MenuKey 8 8
line 271
;264:
;265:
;266:/*
;267:=================
;268:PlayerSettings_MenuKey
;269:=================
;270:*/
;271:static sfxHandle_t PlayerSettings_MenuKey( int key ) {
line 272
;272:	if( key == K_MOUSE2 || key == K_ESCAPE ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $156
ADDRLP4 0
INDIRI4
CNSTI4 27
NEI4 $154
LABELV $156
line 273
;273:		PlayerSettings_SaveChanges();
ADDRGP4 PlayerSettings_SaveChanges
CALLV
pop
line 274
;274:	}
LABELV $154
line 275
;275:	return Menu_DefaultKey( &s_playersettings.menu, key );
ADDRGP4 s_playersettings
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
LABELV $153
endproc PlayerSettings_MenuKey 8 8
proc PlayerSettings_SetMenuItems 44 28
line 284
;276:}
;277:
;278:
;279:/*
;280:=================
;281:PlayerSettings_SetMenuItems
;282:=================
;283:*/
;284:static void PlayerSettings_SetMenuItems( void ) {
line 290
;285:	vec3_t	viewangles;
;286:	int		c;
;287:	int		h;
;288:
;289:	// name
;290:	Q_strncpyz( s_playersettings.name.field.buffer, UI_Cvar_VariableString("name"), sizeof(s_playersettings.name.field.buffer) );
ADDRGP4 $143
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_playersettings+640+64+12
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 293
;291:
;292:	// effects color
;293:	c = trap_Cvar_VariableValue( "color1" ) - 1;
ADDRGP4 $150
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
SUBF4
CVFI4 4
ASGNI4
line 294
;294:	if ( c < 0 || c > 6 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $166
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $164
LABELV $166
line 295
;295:		c = 6;
ADDRLP4 0
CNSTI4 6
ASGNI4
line 296
;296:	}
LABELV $164
line 297
;297:	s_playersettings.effects.curvalue = c;
ADDRGP4 s_playersettings+1088+68
ADDRLP4 0
INDIRI4
ASGNI4
line 300
;298:
;299:	// model/skin
;300:	memset( &s_playersettings.playerinfo, 0, sizeof(playerInfo_t) );
ADDRGP4 s_playersettings+1480
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1112
ARGI4
ADDRGP4 memset
CALLP4
pop
line 302
;301:	
;302:	viewangles[YAW]   = 180 - 30;
ADDRLP4 4+4
CNSTF4 1125515264
ASGNF4
line 303
;303:	viewangles[PITCH] = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 304
;304:	viewangles[ROLL]  = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 306
;305:
;306:	UI_PlayerInfo_SetModel( &s_playersettings.playerinfo, UI_Cvar_VariableString( "model" ) );
ADDRGP4 $131
ARGP4
ADDRLP4 32
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_playersettings+1480
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 307
;307:	UI_PlayerInfo_SetInfo( &s_playersettings.playerinfo, LEGS_IDLE, TORSO_STAND, viewangles, vec3_origin, WP_MACHINEGUN, qfalse );
ADDRGP4 s_playersettings+1480
ARGP4
CNSTI4 22
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 310
;308:
;309:	// handicap
;310:	h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
ADDRGP4 $147
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 40
INDIRF4
CVFI4 4
ASGNI4
line 311
;311:	s_playersettings.handicap.curvalue = 20 - h / 5;
ADDRGP4 s_playersettings+980+68
CNSTI4 20
ADDRLP4 16
INDIRI4
CNSTI4 5
DIVI4
SUBI4
ASGNI4
line 312
;312:}
LABELV $157
endproc PlayerSettings_SetMenuItems 44 28
proc PlayerSettings_MenuEvent 12 8
line 320
;313:
;314:
;315:/*
;316:=================
;317:PlayerSettings_MenuEvent
;318:=================
;319:*/
;320:static void PlayerSettings_MenuEvent( void* ptr, int event ) {
line 321
;321:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $177
line 322
;322:		return;
ADDRGP4 $176
JUMPV
LABELV $177
line 325
;323:	}
;324:
;325:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $179
ADDRLP4 0
INDIRI4
CNSTI4 14
GTI4 $179
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $190-40
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $190
address $188
address $182
address $179
address $187
address $186
code
LABELV $182
line 327
;326:	case ID_HANDICAP:
;327:		trap_Cvar_Set( "handicap", va( "%i", 100 - 25 * s_playersettings.handicap.curvalue ) );
ADDRGP4 $183
ARGP4
CNSTI4 100
ADDRGP4 s_playersettings+980+68
INDIRI4
CNSTI4 25
MULI4
SUBI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $147
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 328
;328:		break;
ADDRGP4 $180
JUMPV
LABELV $186
line 331
;329:
;330:	case ID_MODEL:
;331:		PlayerSettings_SaveChanges();
ADDRGP4 PlayerSettings_SaveChanges
CALLV
pop
line 332
;332:		UI_PlayerModelMenu();
ADDRGP4 UI_PlayerModelMenu
CALLV
pop
line 333
;333:		break;
ADDRGP4 $180
JUMPV
LABELV $187
line 336
;334:
;335:	case ID_BACK:
;336:		PlayerSettings_SaveChanges();
ADDRGP4 PlayerSettings_SaveChanges
CALLV
pop
line 337
;337:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 338
;338:		break;
ADDRGP4 $180
JUMPV
LABELV $188
line 342
;339:
;340:#ifdef USE_VIRTUAL_KEYBOARD
;341:	case ID_NAME:
;342:		set_VR_focusItem((menucommon_s*)ptr);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 set_VR_focusItem
CALLV
pop
line 343
;343:		trap_Cvar_Set("showVirtualKeyboard", "1" );
ADDRGP4 $93
ARGP4
ADDRGP4 $189
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 344
;344:		break;
LABELV $179
LABELV $180
line 347
;345:#endif
;346:	}
;347:}
LABELV $176
endproc PlayerSettings_MenuEvent 12 8
proc PlayerSettings_MenuInit 4 12
line 355
;348:
;349:
;350:/*
;351:=================
;352:PlayerSettings_MenuInit
;353:=================
;354:*/
;355:static void PlayerSettings_MenuInit( void ) {
line 358
;356:	int		y;
;357:
;358:	memset(&s_playersettings,0,sizeof(playersettings_t));
ADDRGP4 s_playersettings
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2660
ARGI4
ADDRGP4 memset
CALLP4
pop
line 360
;359:
;360:	PlayerSettings_Cache();
ADDRGP4 PlayerSettings_Cache
CALLV
pop
line 362
;361:
;362:	s_playersettings.menu.key        = PlayerSettings_MenuKey;
ADDRGP4 s_playersettings+272
ADDRGP4 PlayerSettings_MenuKey
ASGNP4
line 363
;363:	s_playersettings.menu.wrapAround = qtrue;
ADDRGP4 s_playersettings+276
CNSTI4 1
ASGNI4
line 364
;364:	s_playersettings.menu.fullscreen = qtrue;
ADDRGP4 s_playersettings+280
CNSTI4 1
ASGNI4
line 366
;365:
;366:	s_playersettings.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_playersettings+288
CNSTI4 10
ASGNI4
line 367
;367:	s_playersettings.banner.generic.x     = 320;
ADDRGP4 s_playersettings+288+12
CNSTI4 320
ASGNI4
line 368
;368:	s_playersettings.banner.generic.y     = 16;
ADDRGP4 s_playersettings+288+16
CNSTI4 16
ASGNI4
line 369
;369:	s_playersettings.banner.string        = "PLAYER SETTINGS";
ADDRGP4 s_playersettings+288+64
ADDRGP4 $203
ASGNP4
line 370
;370:	s_playersettings.banner.color         = color_white;
ADDRGP4 s_playersettings+288+72
ADDRGP4 color_white
ASGNP4
line 371
;371:	s_playersettings.banner.style         = UI_CENTER;
ADDRGP4 s_playersettings+288+68
CNSTI4 1
ASGNI4
line 373
;372:
;373:	s_playersettings.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playersettings+364
CNSTI4 6
ASGNI4
line 374
;374:	s_playersettings.framel.generic.name  = ART_FRAMEL;
ADDRGP4 s_playersettings+364+4
ADDRGP4 $211
ASGNP4
line 375
;375:	s_playersettings.framel.generic.flags = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playersettings+364+44
CNSTU4 16388
ASGNU4
line 376
;376:	s_playersettings.framel.generic.x     = 0;
ADDRGP4 s_playersettings+364+12
CNSTI4 0
ASGNI4
line 377
;377:	s_playersettings.framel.generic.y     = 78;
ADDRGP4 s_playersettings+364+16
CNSTI4 78
ASGNI4
line 378
;378:	s_playersettings.framel.width         = 256;
ADDRGP4 s_playersettings+364+80
CNSTI4 256
ASGNI4
line 379
;379:	s_playersettings.framel.height        = 329;
ADDRGP4 s_playersettings+364+84
CNSTI4 329
ASGNI4
line 381
;380:
;381:	s_playersettings.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playersettings+456
CNSTI4 6
ASGNI4
line 382
;382:	s_playersettings.framer.generic.name  = ART_FRAMER;
ADDRGP4 s_playersettings+456+4
ADDRGP4 $225
ASGNP4
line 383
;383:	s_playersettings.framer.generic.flags = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playersettings+456+44
CNSTU4 16388
ASGNU4
line 384
;384:	s_playersettings.framer.generic.x     = 376;
ADDRGP4 s_playersettings+456+12
CNSTI4 376
ASGNI4
line 385
;385:	s_playersettings.framer.generic.y     = 76;
ADDRGP4 s_playersettings+456+16
CNSTI4 76
ASGNI4
line 386
;386:	s_playersettings.framer.width         = 256;
ADDRGP4 s_playersettings+456+80
CNSTI4 256
ASGNI4
line 387
;387:	s_playersettings.framer.height        = 334;
ADDRGP4 s_playersettings+456+84
CNSTI4 334
ASGNI4
line 389
;388:
;389:	y = 144;
ADDRLP4 0
CNSTI4 144
ASGNI4
line 390
;390:	s_playersettings.name.generic.type			= MTYPE_FIELD;
ADDRGP4 s_playersettings+640
CNSTI4 4
ASGNI4
line 391
;391:	s_playersettings.name.generic.flags			= QMF_NODEFAULTINIT;
ADDRGP4 s_playersettings+640+44
CNSTU4 32768
ASGNU4
line 392
;392:	s_playersettings.name.generic.ownerdraw		= PlayerSettings_DrawName;
ADDRGP4 s_playersettings+640+56
ADDRGP4 PlayerSettings_DrawName
ASGNP4
line 393
;393:	s_playersettings.name.field.widthInChars	= MAX_NAMELENGTH;
ADDRGP4 s_playersettings+640+64+8
CNSTI4 20
ASGNI4
line 394
;394:	s_playersettings.name.field.maxchars		= MAX_NAMELENGTH;
ADDRGP4 s_playersettings+640+64+268
CNSTI4 20
ASGNI4
line 395
;395:	s_playersettings.name.generic.x				= 192;
ADDRGP4 s_playersettings+640+12
CNSTI4 192
ASGNI4
line 396
;396:	s_playersettings.name.generic.y				= y;
ADDRGP4 s_playersettings+640+16
ADDRLP4 0
INDIRI4
ASGNI4
line 397
;397:	s_playersettings.name.generic.left			= 192 - 8;
ADDRGP4 s_playersettings+640+20
CNSTI4 184
ASGNI4
line 398
;398:	s_playersettings.name.generic.top			= y - 8;
ADDRGP4 s_playersettings+640+24
ADDRLP4 0
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 399
;399:	s_playersettings.name.generic.right			= 192 + 200;
ADDRGP4 s_playersettings+640+28
CNSTI4 392
ASGNI4
line 400
;400:	s_playersettings.name.generic.bottom		= y + 2 * PROP_HEIGHT;
ADDRGP4 s_playersettings+640+32
ADDRLP4 0
INDIRI4
CNSTI4 54
ADDI4
ASGNI4
line 402
;401:#ifdef USE_VIRTUAL_KEYBOARD
;402:	s_playersettings.name.generic.id			= ID_NAME;
ADDRGP4 s_playersettings+640+8
CNSTI4 10
ASGNI4
line 403
;403:	s_playersettings.name.generic.callback		= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+640+48
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 406
;404:#endif
;405:
;406:	y += 3 * PROP_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 81
ADDI4
ASGNI4
line 407
;407:	s_playersettings.handicap.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_playersettings+980
CNSTI4 3
ASGNI4
line 408
;408:	s_playersettings.handicap.generic.flags		= QMF_NODEFAULTINIT;
ADDRGP4 s_playersettings+980+44
CNSTU4 32768
ASGNU4
line 409
;409:	s_playersettings.handicap.generic.id		= ID_HANDICAP;
ADDRGP4 s_playersettings+980+8
CNSTI4 11
ASGNI4
line 410
;410:	s_playersettings.handicap.generic.ownerdraw	= PlayerSettings_DrawHandicap;
ADDRGP4 s_playersettings+980+56
ADDRGP4 PlayerSettings_DrawHandicap
ASGNP4
line 411
;411:	s_playersettings.handicap.generic.x			= 192;
ADDRGP4 s_playersettings+980+12
CNSTI4 192
ASGNI4
line 412
;412:	s_playersettings.handicap.generic.y			= y;
ADDRGP4 s_playersettings+980+16
ADDRLP4 0
INDIRI4
ASGNI4
line 413
;413:	s_playersettings.handicap.generic.left		= 192 - 8;
ADDRGP4 s_playersettings+980+20
CNSTI4 184
ASGNI4
line 414
;414:	s_playersettings.handicap.generic.top		= y - 8;
ADDRGP4 s_playersettings+980+24
ADDRLP4 0
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 415
;415:	s_playersettings.handicap.generic.right		= 192 + 200;
ADDRGP4 s_playersettings+980+28
CNSTI4 392
ASGNI4
line 416
;416:	s_playersettings.handicap.generic.bottom	= y + 2 * PROP_HEIGHT;
ADDRGP4 s_playersettings+980+32
ADDRLP4 0
INDIRI4
CNSTI4 54
ADDI4
ASGNI4
line 417
;417:	s_playersettings.handicap.numitems			= 20;
ADDRGP4 s_playersettings+980+72
CNSTI4 20
ASGNI4
line 419
;418:
;419:	y += 3 * PROP_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 81
ADDI4
ASGNI4
line 420
;420:	s_playersettings.effects.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_playersettings+1088
CNSTI4 3
ASGNI4
line 421
;421:	s_playersettings.effects.generic.flags		= QMF_NODEFAULTINIT;
ADDRGP4 s_playersettings+1088+44
CNSTU4 32768
ASGNU4
line 422
;422:	s_playersettings.effects.generic.id			= ID_EFFECTS;
ADDRGP4 s_playersettings+1088+8
CNSTI4 12
ASGNI4
line 423
;423:	s_playersettings.effects.generic.ownerdraw	= PlayerSettings_DrawEffects;
ADDRGP4 s_playersettings+1088+56
ADDRGP4 PlayerSettings_DrawEffects
ASGNP4
line 424
;424:	s_playersettings.effects.generic.x			= 192;
ADDRGP4 s_playersettings+1088+12
CNSTI4 192
ASGNI4
line 425
;425:	s_playersettings.effects.generic.y			= y;
ADDRGP4 s_playersettings+1088+16
ADDRLP4 0
INDIRI4
ASGNI4
line 426
;426:	s_playersettings.effects.generic.left		= 192 - 8;
ADDRGP4 s_playersettings+1088+20
CNSTI4 184
ASGNI4
line 427
;427:	s_playersettings.effects.generic.top		= y - 8;
ADDRGP4 s_playersettings+1088+24
ADDRLP4 0
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 428
;428:	s_playersettings.effects.generic.right		= 192 + 200;
ADDRGP4 s_playersettings+1088+28
CNSTI4 392
ASGNI4
line 429
;429:	s_playersettings.effects.generic.bottom		= y + 2* PROP_HEIGHT;
ADDRGP4 s_playersettings+1088+32
ADDRLP4 0
INDIRI4
CNSTI4 54
ADDI4
ASGNI4
line 430
;430:	s_playersettings.effects.numitems			= 7;
ADDRGP4 s_playersettings+1088+72
CNSTI4 7
ASGNI4
line 432
;431:
;432:	s_playersettings.model.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_playersettings+1288
CNSTI4 6
ASGNI4
line 433
;433:	s_playersettings.model.generic.name			= ART_MODEL0;
ADDRGP4 s_playersettings+1288+4
ADDRGP4 $308
ASGNP4
line 434
;434:	s_playersettings.model.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_playersettings+1288+44
CNSTU4 272
ASGNU4
line 435
;435:	s_playersettings.model.generic.id			= ID_MODEL;
ADDRGP4 s_playersettings+1288+8
CNSTI4 14
ASGNI4
line 436
;436:	s_playersettings.model.generic.callback		= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+1288+48
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 437
;437:	s_playersettings.model.generic.x			= 640;
ADDRGP4 s_playersettings+1288+12
CNSTI4 640
ASGNI4
line 438
;438:	s_playersettings.model.generic.y			= 480-64;
ADDRGP4 s_playersettings+1288+16
CNSTI4 416
ASGNI4
line 439
;439:	s_playersettings.model.width				= 128;
ADDRGP4 s_playersettings+1288+80
CNSTI4 128
ASGNI4
line 440
;440:	s_playersettings.model.height				= 64;
ADDRGP4 s_playersettings+1288+84
CNSTI4 64
ASGNI4
line 441
;441:	s_playersettings.model.focuspic				= ART_MODEL1;
ADDRGP4 s_playersettings+1288+64
ADDRGP4 $325
ASGNP4
line 443
;442:
;443:	s_playersettings.player.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_playersettings+548
CNSTI4 6
ASGNI4
line 444
;444:	s_playersettings.player.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_playersettings+548+44
CNSTU4 16384
ASGNU4
line 445
;445:	s_playersettings.player.generic.ownerdraw	= PlayerSettings_DrawPlayer;
ADDRGP4 s_playersettings+548+56
ADDRGP4 PlayerSettings_DrawPlayer
ASGNP4
line 446
;446:	s_playersettings.player.generic.x			= 400;
ADDRGP4 s_playersettings+548+12
CNSTI4 400
ASGNI4
line 447
;447:	s_playersettings.player.generic.y			= -40;
ADDRGP4 s_playersettings+548+16
CNSTI4 -40
ASGNI4
line 448
;448:	s_playersettings.player.width				= 32*10;
ADDRGP4 s_playersettings+548+80
CNSTI4 320
ASGNI4
line 449
;449:	s_playersettings.player.height				= 56*10;
ADDRGP4 s_playersettings+548+84
CNSTI4 560
ASGNI4
line 451
;450:
;451:	s_playersettings.back.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_playersettings+1196
CNSTI4 6
ASGNI4
line 452
;452:	s_playersettings.back.generic.name			= ART_BACK0;
ADDRGP4 s_playersettings+1196+4
ADDRGP4 $342
ASGNP4
line 453
;453:	s_playersettings.back.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_playersettings+1196+44
CNSTU4 260
ASGNU4
line 454
;454:	s_playersettings.back.generic.id			= ID_BACK;
ADDRGP4 s_playersettings+1196+8
CNSTI4 13
ASGNI4
line 455
;455:	s_playersettings.back.generic.callback		= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+1196+48
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 456
;456:	s_playersettings.back.generic.x				= 0;
ADDRGP4 s_playersettings+1196+12
CNSTI4 0
ASGNI4
line 457
;457:	s_playersettings.back.generic.y				= 480-64;
ADDRGP4 s_playersettings+1196+16
CNSTI4 416
ASGNI4
line 458
;458:	s_playersettings.back.width					= 128;
ADDRGP4 s_playersettings+1196+80
CNSTI4 128
ASGNI4
line 459
;459:	s_playersettings.back.height				= 64;
ADDRGP4 s_playersettings+1196+84
CNSTI4 64
ASGNI4
line 460
;460:	s_playersettings.back.focuspic				= ART_BACK1;
ADDRGP4 s_playersettings+1196+64
ADDRGP4 $359
ASGNP4
line 462
;461:
;462:	s_playersettings.item_null.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_playersettings+1380
CNSTI4 6
ASGNI4
line 463
;463:	s_playersettings.item_null.generic.flags	= QMF_LEFT_JUSTIFY|QMF_MOUSEONLY|QMF_SILENT;
ADDRGP4 s_playersettings+1380+44
CNSTU4 1050628
ASGNU4
line 464
;464:	s_playersettings.item_null.generic.x		= 0;
ADDRGP4 s_playersettings+1380+12
CNSTI4 0
ASGNI4
line 465
;465:	s_playersettings.item_null.generic.y		= 0;
ADDRGP4 s_playersettings+1380+16
CNSTI4 0
ASGNI4
line 466
;466:	s_playersettings.item_null.width			= 640;
ADDRGP4 s_playersettings+1380+80
CNSTI4 640
ASGNI4
line 467
;467:	s_playersettings.item_null.height			= 480;
ADDRGP4 s_playersettings+1380+84
CNSTI4 480
ASGNI4
line 469
;468:
;469:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.banner );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 470
;470:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.framel );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 471
;471:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.framer );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 473
;472:
;473:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.name );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+640
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 474
;474:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.handicap );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+980
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 475
;475:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.effects );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1088
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 476
;476:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.model );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 477
;477:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.back );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1196
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 479
;478:
;479:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.player );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 481
;480:
;481:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.item_null );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1380
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 483
;482:
;483:	PlayerSettings_SetMenuItems();
ADDRGP4 PlayerSettings_SetMenuItems
CALLV
pop
line 484
;484:}
LABELV $192
endproc PlayerSettings_MenuInit 4 12
export PlayerSettings_Cache
proc PlayerSettings_Cache 8 4
line 492
;485:
;486:
;487:/*
;488:=================
;489:PlayerSettings_Cache
;490:=================
;491:*/
;492:void PlayerSettings_Cache( void ) {
line 493
;493:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $211
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 494
;494:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $225
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 495
;495:	trap_R_RegisterShaderNoMip( ART_MODEL0 );
ADDRGP4 $308
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 496
;496:	trap_R_RegisterShaderNoMip( ART_MODEL1 );
ADDRGP4 $325
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 497
;497:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $342
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 498
;498:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $359
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 500
;499:
;500:	s_playersettings.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
ADDRGP4 $383
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1472
ADDRLP4 0
INDIRI4
ASGNI4
line 501
;501:	s_playersettings.fxPic = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
ADDRGP4 $385
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1476
ADDRLP4 4
INDIRI4
ASGNI4
line 502
;502:}
LABELV $381
endproc PlayerSettings_Cache 8 4
export UI_PlayerSettingsMenu
proc UI_PlayerSettingsMenu 0 4
line 510
;503:
;504:
;505:/*
;506:=================
;507:UI_PlayerSettingsMenu
;508:=================
;509:*/
;510:void UI_PlayerSettingsMenu( void ) {
line 511
;511:	PlayerSettings_MenuInit();
ADDRGP4 PlayerSettings_MenuInit
CALLV
pop
line 512
;512:	UI_PushMenu( &s_playersettings.menu );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 513
;513:}
LABELV $386
endproc UI_PlayerSettingsMenu 0 4
bss
align 4
LABELV s_playersettings
skip 2660
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
LABELV $385
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
LABELV $383
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
LABELV $359
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
LABELV $342
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
LABELV $325
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $308
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $225
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
LABELV $211
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
LABELV $203
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 32
byte 1 83
byte 1 69
byte 1 84
byte 1 84
byte 1 73
byte 1 78
byte 1 71
byte 1 83
byte 1 0
align 1
LABELV $189
byte 1 49
byte 1 0
align 1
LABELV $183
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $150
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $147
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
LABELV $143
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $131
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $124
byte 1 69
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $117
byte 1 72
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $98
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $93
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
LABELV $88
byte 1 53
byte 1 0
align 1
LABELV $87
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $86
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $85
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $84
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $83
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $82
byte 1 51
byte 1 53
byte 1 0
align 1
LABELV $81
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $80
byte 1 52
byte 1 53
byte 1 0
align 1
LABELV $79
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $78
byte 1 53
byte 1 53
byte 1 0
align 1
LABELV $77
byte 1 54
byte 1 48
byte 1 0
align 1
LABELV $76
byte 1 54
byte 1 53
byte 1 0
align 1
LABELV $75
byte 1 55
byte 1 48
byte 1 0
align 1
LABELV $74
byte 1 55
byte 1 53
byte 1 0
align 1
LABELV $73
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $72
byte 1 56
byte 1 53
byte 1 0
align 1
LABELV $71
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $70
byte 1 57
byte 1 53
byte 1 0
align 1
LABELV $69
byte 1 78
byte 1 111
byte 1 110
byte 1 101
byte 1 0
