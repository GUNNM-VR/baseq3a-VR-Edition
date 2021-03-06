data
align 4
LABELV ctfOrders
address $69
address $70
address $71
address $72
address $73
address $74
address $75
byte 4 0
align 4
LABELV ctfMessages
address $76
address $77
address $78
address $79
address $80
address $81
address $82
byte 4 0
align 4
LABELV teamOrders
address $69
address $71
address $83
address $73
address $74
address $75
byte 4 0
align 4
LABELV teamMessages
address $76
address $78
address $84
address $80
address $81
address $82
byte 4 0
code
proc UI_TeamOrdersMenu_BackEvent 0 0
file "..\..\..\..\code\q3_ui\ui_teamorders.c"
line 91
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:TEAM ORDERS MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:
;15:#define ART_FRAME		"menu/art/addbotframe"
;16:#define ART_BACK0		"menu/art/back_0"
;17:#define ART_BACK1		"menu/art/back_1"	
;18:
;19:#define ID_LIST_BOTS		10
;20:#define ID_LIST_CTF_ORDERS	11
;21:#define ID_LIST_TEAM_ORDERS	12
;22:
;23:
;24:typedef struct {
;25:	menuframework_s	menu;
;26:
;27:	menutext_s		banner;
;28:	menubitmap_s	frame;
;29:
;30:	menulist_s		list;
;31:
;32:	menubitmap_s	back;
;33:
;34:	int				gametype;
;35:	int				numBots;
;36:	int				selectedBot;
;37:	char			*bots[9];
;38:	char			botNames[9][16];
;39:} teamOrdersMenuInfo_t;
;40:
;41:static teamOrdersMenuInfo_t	teamOrdersMenuInfo;
;42:
;43:#define NUM_CTF_ORDERS		7
;44:static const char *ctfOrders[] = {
;45:	"I Am the Leader",
;46:	"Defend the Base",
;47:	"Follow Me",
;48:	"Get Enemy Flag",
;49:	"Camp Here",
;50:	"Report",
;51:	"I Relinquish Command",
;52:	NULL
;53:};
;54:static const char *ctfMessages[] = {
;55:	"i am the leader",
;56:	"%s defend the base",
;57:	"%s follow me",
;58:	"%s get enemy flag",
;59:	"%s camp here",
;60:	"%s report",
;61:	"i stop being the leader",
;62:	NULL
;63:};
;64:
;65:#define NUM_TEAM_ORDERS		6
;66:static const char *teamOrders[] = {
;67:	"I Am the Leader",
;68:	"Follow Me",
;69:	"Roam",
;70:	"Camp Here",
;71:	"Report",
;72:	"I Relinquish Command",
;73:	NULL
;74:};
;75:static const char *teamMessages[] = {
;76:	"i am the leader",
;77:	"%s follow me",
;78:	"%s roam",
;79:	"%s camp here",
;80:	"%s report",
;81:	"i stop being the leader",
;82:	NULL
;83:};
;84:
;85:
;86:/*
;87:===============
;88:UI_TeamOrdersMenu_BackEvent
;89:===============
;90:*/
;91:static void UI_TeamOrdersMenu_BackEvent( void *ptr, int event ) {
line 92
;92:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $86
line 93
;93:		return;
ADDRGP4 $85
JUMPV
LABELV $86
line 95
;94:	}
;95:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 96
;96:}
LABELV $85
endproc UI_TeamOrdersMenu_BackEvent 0 0
proc UI_TeamOrdersMenu_SetList 4 0
line 104
;97:
;98:
;99:/*
;100:===============
;101:UI_TeamOrdersMenu_SetList
;102:===============
;103:*/
;104:static void UI_TeamOrdersMenu_SetList( int id ) {
line 105
;105:	switch( id ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $91
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $100
ADDRLP4 0
INDIRI4
CNSTI4 12
EQI4 $107
ADDRGP4 $89
JUMPV
LABELV $89
LABELV $91
line 108
;106:	default:
;107:	case ID_LIST_BOTS:
;108:		teamOrdersMenuInfo.list.generic.id = id;
ADDRGP4 teamOrdersMenuInfo+456+8
ADDRFP4 0
INDIRI4
ASGNI4
line 109
;109:		teamOrdersMenuInfo.list.numitems = teamOrdersMenuInfo.numBots;
ADDRGP4 teamOrdersMenuInfo+456+72
ADDRGP4 teamOrdersMenuInfo+660
INDIRI4
ASGNI4
line 110
;110:		teamOrdersMenuInfo.list.itemnames = (const char **)teamOrdersMenuInfo.bots;
ADDRGP4 teamOrdersMenuInfo+456+88
ADDRGP4 teamOrdersMenuInfo+668
ASGNP4
line 111
;111:		 break;
ADDRGP4 $90
JUMPV
LABELV $100
line 114
;112:
;113:	case ID_LIST_CTF_ORDERS:
;114:		teamOrdersMenuInfo.list.generic.id = id;
ADDRGP4 teamOrdersMenuInfo+456+8
ADDRFP4 0
INDIRI4
ASGNI4
line 115
;115:		teamOrdersMenuInfo.list.numitems = NUM_CTF_ORDERS;
ADDRGP4 teamOrdersMenuInfo+456+72
CNSTI4 7
ASGNI4
line 116
;116:		teamOrdersMenuInfo.list.itemnames = ctfOrders;
ADDRGP4 teamOrdersMenuInfo+456+88
ADDRGP4 ctfOrders
ASGNP4
line 117
;117:		break;
ADDRGP4 $90
JUMPV
LABELV $107
line 120
;118:
;119:	case ID_LIST_TEAM_ORDERS:
;120:		teamOrdersMenuInfo.list.generic.id = id;
ADDRGP4 teamOrdersMenuInfo+456+8
ADDRFP4 0
INDIRI4
ASGNI4
line 121
;121:		teamOrdersMenuInfo.list.numitems = NUM_TEAM_ORDERS;
ADDRGP4 teamOrdersMenuInfo+456+72
CNSTI4 6
ASGNI4
line 122
;122:		teamOrdersMenuInfo.list.itemnames = teamOrders;
ADDRGP4 teamOrdersMenuInfo+456+88
ADDRGP4 teamOrders
ASGNP4
line 123
;123:		break;
LABELV $90
line 126
;124:	}
;125:
;126:	teamOrdersMenuInfo.list.generic.bottom = teamOrdersMenuInfo.list.generic.top + teamOrdersMenuInfo.list.numitems * PROP_HEIGHT;
ADDRGP4 teamOrdersMenuInfo+456+32
ADDRGP4 teamOrdersMenuInfo+456+24
INDIRI4
ADDRGP4 teamOrdersMenuInfo+456+72
INDIRI4
CNSTI4 27
MULI4
ADDI4
ASGNI4
line 127
;127:}
LABELV $88
endproc UI_TeamOrdersMenu_SetList 4 0
export UI_TeamOrdersMenu_Key
proc UI_TeamOrdersMenu_Key 64 16
line 135
;128:
;129:
;130:/*
;131:=================
;132:UI_TeamOrdersMenu_Key
;133:=================
;134:*/
;135:sfxHandle_t UI_TeamOrdersMenu_Key( int key ) {
line 141
;136:	menulist_s	*l;
;137:	int	x;
;138:	int	y;
;139:	int	index;
;140:
;141:	l = (menulist_s	*)Menu_ItemAtCursor( &teamOrdersMenuInfo.menu );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRLP4 16
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 142
;142:	if( l != &teamOrdersMenuInfo.list ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 teamOrdersMenuInfo+456
CVPU4 4
EQU4 $121
line 143
;143:		return Menu_DefaultKey( &teamOrdersMenuInfo.menu, key );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $120
JUMPV
LABELV $121
line 146
;144:	}
;145:
;146:	switch( key ) {
ADDRLP4 20
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 161
EQI4 $132
ADDRLP4 20
INDIRI4
CNSTI4 161
GTI4 $139
LABELV $138
ADDRLP4 24
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 132
EQI4 $132
ADDRLP4 24
INDIRI4
CNSTI4 133
EQI4 $135
ADDRGP4 $124
JUMPV
LABELV $139
ADDRLP4 28
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 167
EQI4 $135
ADDRLP4 28
INDIRI4
CNSTI4 167
LTI4 $124
LABELV $140
ADDRFP4 0
INDIRI4
CNSTI4 178
EQI4 $126
ADDRGP4 $124
JUMPV
LABELV $126
line 148
;147:		case K_MOUSE1:
;148:			x = l->generic.left;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 149
;149:			y = l->generic.top;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 150
;150:			if( UI_CursorInRect( x, y, l->generic.right - x, l->generic.bottom - y ) ) {
ADDRLP4 32
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 36
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
ARGI4
ADDRLP4 44
ADDRGP4 UI_CursorInRect
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $127
line 151
;151:				index = (uis.cursory - y) / PROP_HEIGHT;
ADDRLP4 12
ADDRGP4 uis+12
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1024963622
MULF4
CVFI4 4
ASGNI4
line 152
;152:				l->oldvalue = l->curvalue;
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 153
;153:				l->curvalue = index;
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 155
;154:
;155:				if( l->generic.callback ) {
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $130
line 156
;156:					l->generic.callback( l, QM_ACTIVATED );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
line 157
;157:					return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $120
JUMPV
LABELV $130
line 159
;158:				}
;159:			}
LABELV $127
line 160
;160:			return menu_null_sound;
ADDRGP4 menu_null_sound
INDIRI4
RETI4
ADDRGP4 $120
JUMPV
LABELV $132
line 164
;161:
;162:		case K_KP_UPARROW:
;163:		case K_UPARROW:
;164:			l->oldvalue = l->curvalue;
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 166
;165:
;166:			if( l->curvalue == 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
NEI4 $133
line 167
;167:				l->curvalue = l->numitems - 1;
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 168
;168:			}
ADDRGP4 $134
JUMPV
LABELV $133
line 169
;169:			else {
line 170
;170:				l->curvalue--;
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 171
;171:			}
LABELV $134
line 172
;172:			return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $120
JUMPV
LABELV $135
line 176
;173:
;174:		case K_KP_DOWNARROW:
;175:		case K_DOWNARROW:
;176:			l->oldvalue = l->curvalue;
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 178
;177:
;178:			if( l->curvalue == l->numitems - 1 ) {
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 1
SUBI4
NEI4 $136
line 179
;179:				l->curvalue = 0;;
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 0
ASGNI4
line 180
;180:			}
ADDRGP4 $137
JUMPV
LABELV $136
line 181
;181:			else {
line 182
;182:				l->curvalue++;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 183
;183:			}
LABELV $137
line 184
;184:			return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $120
JUMPV
LABELV $124
line 187
;185:	}
;186:
;187:	return Menu_DefaultKey( &teamOrdersMenuInfo.menu, key );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
RETI4
LABELV $120
endproc UI_TeamOrdersMenu_Key 64 16
proc UI_TeamOrdersMenu_ListDraw 36 20
line 196
;188:}
;189:
;190:
;191:/*
;192:=================
;193:UI_TeamOrdersMenu_ListDraw
;194:=================
;195:*/
;196:static void UI_TeamOrdersMenu_ListDraw( void *self ) {
line 205
;197:	menulist_s	*l;
;198:	int			x;
;199:	int			y;
;200:	int			i;
;201:	float		*color;
;202:	qboolean	hasfocus;
;203:	int			style;
;204:
;205:	l = (menulist_s *)self;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 207
;206:
;207:	hasfocus = (l->generic.parent->cursor == l->generic.menuPosition);
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $143
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRGP4 $144
JUMPV
LABELV $143
ADDRLP4 28
CNSTI4 0
ASGNI4
LABELV $144
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
line 209
;208:
;209:	x =	320;//l->generic.x;
ADDRLP4 20
CNSTI4 320
ASGNI4
line 210
;210:	y =	l->generic.y;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 211
;211:	for( i = 0; i < l->numitems; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $148
JUMPV
LABELV $145
line 212
;212:		style = UI_LEFT|UI_SMALLFONT|UI_CENTER;
ADDRLP4 8
CNSTI4 17
ASGNI4
line 213
;213:		if( i == l->curvalue ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
NEI4 $149
line 214
;214:			color = color_yellow;
ADDRLP4 16
ADDRGP4 color_yellow
ASGNP4
line 215
;215:			if( hasfocus ) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $150
line 216
;216:				style |= UI_PULSE;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 217
;217:			}
line 218
;218:		}
ADDRGP4 $150
JUMPV
LABELV $149
line 219
;219:		else {
line 220
;220:			color = color_orange;
ADDRLP4 16
ADDRGP4 color_orange
ASGNP4
line 221
;221:		}
LABELV $150
line 223
;222:
;223:		UI_DrawProportionalString( x, y, l->itemnames[i], style, color );
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 224
;224:		y += PROP_HEIGHT;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 225
;225:	}
LABELV $146
line 211
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $148
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
LTI4 $145
line 226
;226:}
LABELV $141
endproc UI_TeamOrdersMenu_ListDraw 36 20
proc UI_TeamOrdersMenu_ListEvent 268 16
line 234
;227:
;228:
;229:/*
;230:===============
;231:UI_TeamOrdersMenu_ListEvent
;232:===============
;233:*/
;234:static void UI_TeamOrdersMenu_ListEvent( void *ptr, int event ) {
line 239
;235:	int		id;
;236:	int		selection;
;237:	char	message[256];
;238:
;239:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $154
line 240
;240:		return;
ADDRGP4 $153
JUMPV
LABELV $154
line 242
;241:
;242:	id = ((menulist_s *)ptr)->generic.id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 243
;243:	selection = ((menulist_s *)ptr)->curvalue;
ADDRLP4 260
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 245
;244:
;245:	if( id == ID_LIST_BOTS ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $156
line 246
;246:		teamOrdersMenuInfo.selectedBot = selection;
ADDRGP4 teamOrdersMenuInfo+664
ADDRLP4 260
INDIRI4
ASGNI4
line 247
;247:		if( teamOrdersMenuInfo.gametype == GT_CTF ) {
ADDRGP4 teamOrdersMenuInfo+656
INDIRI4
CNSTI4 4
NEI4 $159
line 248
;248:			UI_TeamOrdersMenu_SetList( ID_LIST_CTF_ORDERS );
CNSTI4 11
ARGI4
ADDRGP4 UI_TeamOrdersMenu_SetList
CALLV
pop
line 249
;249:		}
ADDRGP4 $153
JUMPV
LABELV $159
line 250
;250:		else {
line 251
;251:			UI_TeamOrdersMenu_SetList( ID_LIST_TEAM_ORDERS );
CNSTI4 12
ARGI4
ADDRGP4 UI_TeamOrdersMenu_SetList
CALLV
pop
line 252
;252:		}
line 253
;253:		return;
ADDRGP4 $153
JUMPV
LABELV $156
line 256
;254:	}
;255:
;256:	if( id == ID_LIST_CTF_ORDERS ) {
ADDRLP4 0
INDIRI4
CNSTI4 11
NEI4 $162
line 257
;257:		Com_sprintf( message, sizeof(message), ctfMessages[selection], teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.selectedBot] );
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ctfMessages
ADDP4
INDIRP4
ARGP4
ADDRGP4 teamOrdersMenuInfo+664
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+704
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 258
;258:	}
ADDRGP4 $163
JUMPV
LABELV $162
line 259
;259:	else {
line 260
;260:		Com_sprintf( message, sizeof(message), teamMessages[selection], teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.selectedBot] );
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 teamMessages
ADDP4
INDIRP4
ARGP4
ADDRGP4 teamOrdersMenuInfo+664
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+704
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 261
;261:	}
LABELV $163
line 263
;262:
;263:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "say_team \"%s\"\n", message ) );
ADDRGP4 $168
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 264
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 264
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 264
;264:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 265
;265:}
LABELV $153
endproc UI_TeamOrdersMenu_ListEvent 268 16
proc UI_TeamOrdersMenu_BuildBotList 4156 12
line 273
;266:
;267:
;268:/*
;269:===============
;270:UI_TeamOrdersMenu_BuildBotList
;271:===============
;272:*/
;273:static void UI_TeamOrdersMenu_BuildBotList( void ) {
line 278
;274:	uiClientState_t	cs;
;275:	int		numPlayers;
;276:	int		isBot;
;277:	int		n;
;278:	char	playerTeam = '0' + TEAM_SPECTATOR;
ADDRLP4 1033
CNSTI1 51
ASGNI1
line 282
;279:	char	botTeam;
;280:	char	info[MAX_INFO_STRING];
;281:
;282:	for( n = 0; n < 9; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $170
line 283
;283:		teamOrdersMenuInfo.bots[n] = teamOrdersMenuInfo.botNames[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 teamOrdersMenuInfo+668
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+704
ADDP4
ASGNP4
line 284
;284:	}
LABELV $171
line 282
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 9
LTI4 $170
line 286
;285:
;286:	trap_GetClientState( &cs );
ADDRLP4 1036
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 288
;287:
;288:	Q_strncpyz( teamOrdersMenuInfo.botNames[0], "Everyone", 16 );
ADDRGP4 teamOrdersMenuInfo+704
ARGP4
ADDRGP4 $177
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 289
;289:	teamOrdersMenuInfo.numBots = 1;
ADDRGP4 teamOrdersMenuInfo+660
CNSTI4 1
ASGNI4
line 291
;290:
;291:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 292
;292:	numPlayers = atoi( Info_ValueForKey( info, "sv_maxclients" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $179
ARGP4
ADDRLP4 4124
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4124
INDIRP4
ARGP4
ADDRLP4 4128
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4120
ADDRLP4 4128
INDIRI4
ASGNI4
line 293
;293:	teamOrdersMenuInfo.gametype = trap_Cvar_VariableValue( "ui_gametype" );
ADDRGP4 $181
ARGP4
ADDRLP4 4132
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 teamOrdersMenuInfo+656
ADDRLP4 4132
INDIRF4
CVFI4 4
ASGNI4
line 295
;294:
;295:	for( n = 0; n < numPlayers && teamOrdersMenuInfo.numBots < 9; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $185
JUMPV
LABELV $182
line 296
;296:		trap_GetConfigString( CS_PLAYERS + n, info, MAX_INFO_STRING );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 298
;297:
;298:		if( n == cs.clientNum ) {
ADDRLP4 0
INDIRI4
ADDRLP4 1036+8
INDIRI4
NEI4 $187
line 299
;299:			playerTeam = *Info_ValueForKey( info, "t" );
ADDRLP4 4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 4136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1033
ADDRLP4 4136
INDIRP4
INDIRI1
ASGNI1
line 300
;300:			continue;
ADDRGP4 $183
JUMPV
LABELV $187
line 303
;301:		}
;302:
;303:		isBot = atoi( Info_ValueForKey( info, "skill" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $191
ARGP4
ADDRLP4 4136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4136
INDIRP4
ARGP4
ADDRLP4 4140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 4140
INDIRI4
ASGNI4
line 304
;304:		if( !isBot ) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $192
line 305
;305:			continue;
ADDRGP4 $183
JUMPV
LABELV $192
line 308
;306:		}
;307:
;308:		botTeam = *Info_ValueForKey( info, "t" );
ADDRLP4 4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 4144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 4144
INDIRP4
INDIRI1
ASGNI1
line 309
;309:		if( botTeam != playerTeam ) {
ADDRLP4 1032
INDIRI1
CVII4 1
ADDRLP4 1033
INDIRI1
CVII4 1
EQI4 $194
line 310
;310:			continue;
ADDRGP4 $183
JUMPV
LABELV $194
line 313
;311:		}
;312:
;313:		Q_strncpyz( teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.numBots], Info_ValueForKey( info, "n" ), 16 );
ADDRLP4 4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 4148
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 teamOrdersMenuInfo+660
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+704
ADDP4
ARGP4
ADDRLP4 4148
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 314
;314:		Q_CleanStr( teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.numBots] );
ADDRGP4 teamOrdersMenuInfo+660
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+704
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 315
;315:		teamOrdersMenuInfo.numBots++;
ADDRLP4 4152
ADDRGP4 teamOrdersMenuInfo+660
ASGNP4
ADDRLP4 4152
INDIRP4
ADDRLP4 4152
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 316
;316:	}
LABELV $183
line 295
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $185
ADDRLP4 0
INDIRI4
ADDRLP4 4120
INDIRI4
GEI4 $202
ADDRGP4 teamOrdersMenuInfo+660
INDIRI4
CNSTI4 9
LTI4 $182
LABELV $202
line 317
;317:}
LABELV $169
endproc UI_TeamOrdersMenu_BuildBotList 4156 12
proc UI_TeamOrdersMenu_Init 0 12
line 325
;318:
;319:
;320:/*
;321:===============
;322:UI_TeamOrdersMenu_Init
;323:===============
;324:*/
;325:static void UI_TeamOrdersMenu_Init( void ) {
line 326
;326:	UI_TeamOrdersMenu_Cache();
ADDRGP4 UI_TeamOrdersMenu_Cache
CALLV
pop
line 328
;327:
;328:	memset( &teamOrdersMenuInfo, 0, sizeof(teamOrdersMenuInfo) );
ADDRGP4 teamOrdersMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 848
ARGI4
ADDRGP4 memset
CALLP4
pop
line 329
;329:	teamOrdersMenuInfo.menu.fullscreen = qfalse;
ADDRGP4 teamOrdersMenuInfo+280
CNSTI4 0
ASGNI4
line 330
;330:	teamOrdersMenuInfo.menu.key = UI_TeamOrdersMenu_Key;
ADDRGP4 teamOrdersMenuInfo+272
ADDRGP4 UI_TeamOrdersMenu_Key
ASGNP4
line 332
;331:
;332:	UI_TeamOrdersMenu_BuildBotList();
ADDRGP4 UI_TeamOrdersMenu_BuildBotList
CALLV
pop
line 334
;333:
;334:	teamOrdersMenuInfo.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 teamOrdersMenuInfo+288
CNSTI4 10
ASGNI4
line 335
;335:	teamOrdersMenuInfo.banner.generic.x			= 320;
ADDRGP4 teamOrdersMenuInfo+288+12
CNSTI4 320
ASGNI4
line 336
;336:	teamOrdersMenuInfo.banner.generic.y			= 16;
ADDRGP4 teamOrdersMenuInfo+288+16
CNSTI4 16
ASGNI4
line 337
;337:	teamOrdersMenuInfo.banner.string			= "TEAM ORDERS";
ADDRGP4 teamOrdersMenuInfo+288+64
ADDRGP4 $213
ASGNP4
line 338
;338:	teamOrdersMenuInfo.banner.color				= color_white;
ADDRGP4 teamOrdersMenuInfo+288+72
ADDRGP4 color_white
ASGNP4
line 339
;339:	teamOrdersMenuInfo.banner.style				= UI_CENTER;
ADDRGP4 teamOrdersMenuInfo+288+68
CNSTI4 1
ASGNI4
line 341
;340:
;341:	teamOrdersMenuInfo.frame.generic.type		= MTYPE_BITMAP;
ADDRGP4 teamOrdersMenuInfo+364
CNSTI4 6
ASGNI4
line 342
;342:	teamOrdersMenuInfo.frame.generic.flags		= QMF_INACTIVE;
ADDRGP4 teamOrdersMenuInfo+364+44
CNSTU4 16384
ASGNU4
line 343
;343:	teamOrdersMenuInfo.frame.generic.name		= ART_FRAME;
ADDRGP4 teamOrdersMenuInfo+364+4
ADDRGP4 $223
ASGNP4
line 344
;344:	teamOrdersMenuInfo.frame.generic.x			= 320-233;
ADDRGP4 teamOrdersMenuInfo+364+12
CNSTI4 87
ASGNI4
line 345
;345:	teamOrdersMenuInfo.frame.generic.y			= 240-166;
ADDRGP4 teamOrdersMenuInfo+364+16
CNSTI4 74
ASGNI4
line 346
;346:	teamOrdersMenuInfo.frame.width				= 466;
ADDRGP4 teamOrdersMenuInfo+364+80
CNSTI4 466
ASGNI4
line 347
;347:	teamOrdersMenuInfo.frame.height				= 332;
ADDRGP4 teamOrdersMenuInfo+364+84
CNSTI4 332
ASGNI4
line 349
;348:
;349:	teamOrdersMenuInfo.list.generic.type		= MTYPE_SCROLLLIST;
ADDRGP4 teamOrdersMenuInfo+456
CNSTI4 8
ASGNI4
line 350
;350:	teamOrdersMenuInfo.list.generic.flags		= QMF_PULSEIFFOCUS;
ADDRGP4 teamOrdersMenuInfo+456+44
CNSTU4 256
ASGNU4
line 351
;351:	teamOrdersMenuInfo.list.generic.ownerdraw	= UI_TeamOrdersMenu_ListDraw;
ADDRGP4 teamOrdersMenuInfo+456+56
ADDRGP4 UI_TeamOrdersMenu_ListDraw
ASGNP4
line 352
;352:	teamOrdersMenuInfo.list.generic.callback	= UI_TeamOrdersMenu_ListEvent;
ADDRGP4 teamOrdersMenuInfo+456+48
ADDRGP4 UI_TeamOrdersMenu_ListEvent
ASGNP4
line 353
;353:	teamOrdersMenuInfo.list.generic.x			= 320-64;
ADDRGP4 teamOrdersMenuInfo+456+12
CNSTI4 256
ASGNI4
line 354
;354:	teamOrdersMenuInfo.list.generic.y			= 120;
ADDRGP4 teamOrdersMenuInfo+456+16
CNSTI4 120
ASGNI4
line 356
;355:
;356:	teamOrdersMenuInfo.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 teamOrdersMenuInfo+564
CNSTI4 6
ASGNI4
line 357
;357:	teamOrdersMenuInfo.back.generic.name		= ART_BACK0;
ADDRGP4 teamOrdersMenuInfo+564+4
ADDRGP4 $246
ASGNP4
line 358
;358:	teamOrdersMenuInfo.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 teamOrdersMenuInfo+564+44
CNSTU4 260
ASGNU4
line 359
;359:	teamOrdersMenuInfo.back.generic.callback	= UI_TeamOrdersMenu_BackEvent;
ADDRGP4 teamOrdersMenuInfo+564+48
ADDRGP4 UI_TeamOrdersMenu_BackEvent
ASGNP4
line 360
;360:	teamOrdersMenuInfo.back.generic.x			= 0;
ADDRGP4 teamOrdersMenuInfo+564+12
CNSTI4 0
ASGNI4
line 361
;361:	teamOrdersMenuInfo.back.generic.y			= 480-64;
ADDRGP4 teamOrdersMenuInfo+564+16
CNSTI4 416
ASGNI4
line 362
;362:	teamOrdersMenuInfo.back.width				= 128;
ADDRGP4 teamOrdersMenuInfo+564+80
CNSTI4 128
ASGNI4
line 363
;363:	teamOrdersMenuInfo.back.height				= 64;
ADDRGP4 teamOrdersMenuInfo+564+84
CNSTI4 64
ASGNI4
line 364
;364:	teamOrdersMenuInfo.back.focuspic			= ART_BACK1;
ADDRGP4 teamOrdersMenuInfo+564+64
ADDRGP4 $261
ASGNP4
line 366
;365:
;366:	Menu_AddItem( &teamOrdersMenuInfo.menu, &teamOrdersMenuInfo.banner );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 teamOrdersMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 367
;367:	Menu_AddItem( &teamOrdersMenuInfo.menu, &teamOrdersMenuInfo.frame );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 teamOrdersMenuInfo+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 368
;368:	Menu_AddItem( &teamOrdersMenuInfo.menu, &teamOrdersMenuInfo.list );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 teamOrdersMenuInfo+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 369
;369:	Menu_AddItem( &teamOrdersMenuInfo.menu, &teamOrdersMenuInfo.back );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 teamOrdersMenuInfo+564
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 371
;370:
;371:	teamOrdersMenuInfo.list.generic.left = 220;
ADDRGP4 teamOrdersMenuInfo+456+20
CNSTI4 220
ASGNI4
line 372
;372:	teamOrdersMenuInfo.list.generic.top = teamOrdersMenuInfo.list.generic.y;
ADDRGP4 teamOrdersMenuInfo+456+24
ADDRGP4 teamOrdersMenuInfo+456+16
INDIRI4
ASGNI4
line 373
;373:	teamOrdersMenuInfo.list.generic.right = 420;
ADDRGP4 teamOrdersMenuInfo+456+28
CNSTI4 420
ASGNI4
line 374
;374:	UI_TeamOrdersMenu_SetList( ID_LIST_BOTS );
CNSTI4 10
ARGI4
ADDRGP4 UI_TeamOrdersMenu_SetList
CALLV
pop
line 375
;375:}
LABELV $203
endproc UI_TeamOrdersMenu_Init 0 12
export UI_TeamOrdersMenu_Cache
proc UI_TeamOrdersMenu_Cache 0 4
line 383
;376:
;377:
;378:/*
;379:=================
;380:UI_TeamOrdersMenu_Cache
;381:=================
;382:*/
;383:void UI_TeamOrdersMenu_Cache( void ) {
line 384
;384:	trap_R_RegisterShaderNoMip( ART_FRAME );
ADDRGP4 $223
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 385
;385:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $246
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 386
;386:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $261
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 387
;387:}
LABELV $274
endproc UI_TeamOrdersMenu_Cache 0 4
export UI_TeamOrdersMenu
proc UI_TeamOrdersMenu 0 4
line 395
;388:
;389:
;390:/*
;391:===============
;392:UI_TeamOrdersMenu
;393:===============
;394:*/
;395:void UI_TeamOrdersMenu( void ) {
line 396
;396:	UI_TeamOrdersMenu_Init();
ADDRGP4 UI_TeamOrdersMenu_Init
CALLV
pop
line 397
;397:	UI_PushMenu( &teamOrdersMenuInfo.menu );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 398
;398:}
LABELV $275
endproc UI_TeamOrdersMenu 0 4
export UI_TeamOrdersMenu_f
proc UI_TeamOrdersMenu_f 4124 12
line 406
;399:
;400:
;401:/*
;402:===============
;403:UI_TeamOrdersMenu_f
;404:===============
;405:*/
;406:void UI_TeamOrdersMenu_f( void ) {
line 412
;407:	uiClientState_t	cs;
;408:	char	info[MAX_INFO_STRING];
;409:	int		team;
;410:
;411:	// make sure it's a team game
;412:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 413
;413:	teamOrdersMenuInfo.gametype = trap_Cvar_VariableValue( "ui_gametype" );
ADDRGP4 $181
ARGP4
ADDRLP4 4112
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 teamOrdersMenuInfo+656
ADDRLP4 4112
INDIRF4
CVFI4 4
ASGNI4
line 414
;414:	if( teamOrdersMenuInfo.gametype < GT_TEAM ) {
ADDRGP4 teamOrdersMenuInfo+656
INDIRI4
CNSTI4 3
GEI4 $278
line 415
;415:		return;
ADDRGP4 $276
JUMPV
LABELV $278
line 419
;416:	}
;417:
;418:	// not available to spectators
;419:	trap_GetClientState( &cs );
ADDRLP4 1024
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 420
;420:	trap_GetConfigString( CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING );
ADDRLP4 1024+8
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 421
;421:	team = atoi( Info_ValueForKey( info, "t" ) );
ADDRLP4 0
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 4116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4116
INDIRP4
ARGP4
ADDRLP4 4120
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4108
ADDRLP4 4120
INDIRI4
ASGNI4
line 422
;422:	if( team == TEAM_SPECTATOR ) {
ADDRLP4 4108
INDIRI4
CNSTI4 3
NEI4 $282
line 423
;423:		return;
ADDRGP4 $276
JUMPV
LABELV $282
line 426
;424:	}
;425:
;426:	UI_TeamOrdersMenu();
ADDRGP4 UI_TeamOrdersMenu
CALLV
pop
line 427
;427:}
LABELV $276
endproc UI_TeamOrdersMenu_f 4124 12
bss
align 4
LABELV teamOrdersMenuInfo
skip 848
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
LABELV $261
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
LABELV $246
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
LABELV $223
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $213
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 32
byte 1 79
byte 1 82
byte 1 68
byte 1 69
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $198
byte 1 110
byte 1 0
align 1
LABELV $191
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $190
byte 1 116
byte 1 0
align 1
LABELV $181
byte 1 117
byte 1 105
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
LABELV $179
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
LABELV $177
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $168
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $84
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $83
byte 1 82
byte 1 111
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $82
byte 1 105
byte 1 32
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 32
byte 1 98
byte 1 101
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $81
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $80
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $79
byte 1 37
byte 1 115
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $78
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $77
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $76
byte 1 105
byte 1 32
byte 1 97
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $75
byte 1 73
byte 1 32
byte 1 82
byte 1 101
byte 1 108
byte 1 105
byte 1 110
byte 1 113
byte 1 117
byte 1 105
byte 1 115
byte 1 104
byte 1 32
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $74
byte 1 82
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $73
byte 1 67
byte 1 97
byte 1 109
byte 1 112
byte 1 32
byte 1 72
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $72
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 69
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $71
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 77
byte 1 101
byte 1 0
align 1
LABELV $70
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $69
byte 1 73
byte 1 32
byte 1 65
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 76
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
