data
align 4
LABELV gametype_items
address $69
address $70
address $71
address $72
byte 4 0
align 4
LABELV gametype_remap
byte 4 0
byte 4 1
byte 4 3
byte 4 4
align 4
LABELV gametype_remap2
byte 4 0
byte 4 1
byte 4 0
byte 4 2
byte 4 3
code
proc GametypeBits 36 8
file "..\..\..\..\code\q3_ui\ui_startserver.c"
line 94
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=============================================================================
;5:
;6:START SERVER MENU *****
;7:
;8:=============================================================================
;9:*/
;10:
;11:// GUNNM TODO : g_allowDeathCam & cg_allowDeathCam are not tested in game at the moment
;12:
;13:#include "ui_local.h"
;14:
;15:#define GAMESERVER_BACK0		"menu/art/back_0"
;16:#define GAMESERVER_BACK1		"menu/art/back_1"
;17:#define GAMESERVER_NEXT0		"menu/art/next_0"
;18:#define GAMESERVER_NEXT1		"menu/art/next_1"
;19:#define GAMESERVER_FRAMEL		"menu/art/frame2_l"
;20:#define GAMESERVER_FRAMER		"menu/art/frame1_r"
;21:#define GAMESERVER_SELECT		"menu/art/maps_select"
;22:#define GAMESERVER_SELECTED		"menu/art/maps_selected"
;23:#define GAMESERVER_FIGHT0		"menu/art/fight_0"
;24:#define GAMESERVER_FIGHT1		"menu/art/fight_1"
;25:#define GAMESERVER_UNKNOWNMAP	"menu/art/unknownmap"
;26:#define GAMESERVER_ARROWS		"menu/art/gs_arrows_0"
;27:#define GAMESERVER_ARROWSL		"menu/art/gs_arrows_l"
;28:#define GAMESERVER_ARROWSR		"menu/art/gs_arrows_r"
;29:
;30:#define MAX_MAPROWS		2
;31:#define MAX_MAPCOLS		2
;32:#define MAX_MAPSPERPAGE	4
;33:
;34:#define MAX_NAMELENGTH	16
;35:
;36:#define ID_GAMETYPE				10
;37:#define ID_PICTURES				11	// 12, 13, 14
;38:#define ID_PREVPAGE				15
;39:#define ID_NEXTPAGE				16
;40:#define ID_STARTSERVERBACK		17
;41:#define ID_STARTSERVERNEXT		18
;42:
;43:typedef struct {
;44:	menuframework_s	menu;
;45:
;46:	menutext_s		banner;
;47:	menubitmap_s	framel;
;48:	menubitmap_s	framer;
;49:
;50:	menulist_s		gametype;
;51:	menubitmap_s	mappics[MAX_MAPSPERPAGE];
;52:	menubitmap_s	mapbuttons[MAX_MAPSPERPAGE];
;53:	menubitmap_s	arrows;
;54:	menubitmap_s	prevpage;
;55:	menubitmap_s	nextpage;
;56:	menubitmap_s	back;
;57:	menubitmap_s	next;
;58:
;59:	menutext_s		mapname;
;60:	menubitmap_s	item_null;
;61:
;62:	qboolean		multiplayer;
;63:	int				currentmap;
;64:	int				nummaps;
;65:	int				page;
;66:	int				maxpages;
;67:	int 			maplist[MAX_ARENAS];
;68:} startserver_t;
;69:
;70:static startserver_t s_startserver;
;71:
;72:static const char *gametype_items[] = {
;73:	"Free For All",
;74:	"Tournament",
;75:	"Team Deathmatch",
;76:	"Capture the Flag",
;77:	NULL
;78:};
;79:
;80:static int gametype_remap[] = { GT_FFA, GT_TOURNAMENT, GT_TEAM, GT_CTF };
;81:static int gametype_remap2[] = { 0, 1, 0, 2, 3 };
;82:
;83:// use ui_servers2.c definition
;84:extern const char* punkbuster_items[];
;85:
;86:static void UI_ServerOptionsMenu( qboolean multiplayer );
;87:
;88:
;89:/*
;90:=================
;91:GametypeBits
;92:=================
;93:*/
;94:static int GametypeBits( char *string ) {
line 99
;95:	int		bits;
;96:	char	*p;
;97:	char	*token;
;98:
;99:	bits = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 100
;100:	p = string;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $75
JUMPV
LABELV $74
line 101
;101:	while( 1 ) {
line 102
;102:		token = COM_ParseExt( &p, qfalse );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 103
;103:		if( token[0] == 0 ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $77
line 104
;104:			break;
ADDRGP4 $76
JUMPV
LABELV $77
line 107
;105:		}
;106:
;107:		if( Q_stricmp( token, "ffa" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $81
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $79
line 108
;108:			bits |= 1 << GT_FFA;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 109
;109:			continue;
ADDRGP4 $75
JUMPV
LABELV $79
line 112
;110:		}
;111:
;112:		if( Q_stricmp( token, "tourney" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $84
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $82
line 113
;113:			bits |= 1 << GT_TOURNAMENT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 114
;114:			continue;
ADDRGP4 $75
JUMPV
LABELV $82
line 117
;115:		}
;116:
;117:		if( Q_stricmp( token, "single" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $87
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $85
line 118
;118:			bits |= 1 << GT_SINGLE_PLAYER;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 119
;119:			continue;
ADDRGP4 $75
JUMPV
LABELV $85
line 122
;120:		}
;121:
;122:		if( Q_stricmp( token, "team" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $90
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $88
line 123
;123:			bits |= 1 << GT_TEAM;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 124
;124:			continue;
ADDRGP4 $75
JUMPV
LABELV $88
line 127
;125:		}
;126:
;127:		if( Q_stricmp( token, "ctf" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $93
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $91
line 128
;128:			bits |= 1 << GT_CTF;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 129
;129:			continue;
LABELV $91
line 131
;130:		}
;131:	}
LABELV $75
line 101
ADDRGP4 $74
JUMPV
LABELV $76
line 133
;132:
;133:	return bits;
ADDRLP4 4
INDIRI4
RETI4
LABELV $73
endproc GametypeBits 36 8
bss
align 1
LABELV $95
skip 256
code
proc StartServer_Update 52 16
line 142
;134:}
;135:
;136:
;137:/*
;138:=================
;139:StartServer_Update
;140:=================
;141:*/
;142:static void StartServer_Update( void ) {
line 149
;143:	int				i;
;144:	int				top;
;145:	static	char	picname[MAX_MAPSPERPAGE][MAX_QPATH];
;146:	const char		*info;
;147:	char			mapname[MAX_NAMELENGTH];
;148:
;149:	top = s_startserver.page*MAX_MAPSPERPAGE;
ADDRLP4 20
ADDRGP4 s_startserver+2032
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
line 151
;150:
;151:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $97
line 152
;152:	{
line 153
;153:		if (top+i >= s_startserver.nummaps)
ADDRLP4 20
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRGP4 s_startserver+2028
INDIRI4
LTI4 $101
line 154
;154:			break;
ADDRGP4 $120
JUMPV
LABELV $101
line 156
;155:
;156:		info = UI_GetArenaInfoByNumber( s_startserver.maplist[ top + i ]);
ADDRLP4 20
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2040
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 28
INDIRP4
ASGNP4
line 157
;157:		Q_strncpyz( mapname, Info_ValueForKey( info, "map"), MAX_NAMELENGTH );
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 $105
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 158
;158:		Q_strupr( mapname );
ADDRLP4 4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 160
;159:
;160:		Com_sprintf( picname[i], sizeof(picname[i]), "levelshots/%s", mapname );
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 $95
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $106
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 162
;161:
;162:		s_startserver.mappics[i].generic.flags &= ~QMF_HIGHLIGHT;
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+44
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 163
;163:		s_startserver.mappics[i].generic.name   = picname[i];
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 $95
ADDP4
ASGNP4
line 164
;164:		s_startserver.mappics[i].shader         = 0;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+72
ADDP4
CNSTI4 0
ASGNI4
line 167
;165:
;166:		// reset
;167:		s_startserver.mapbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 44
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+44
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 168
;168:		s_startserver.mapbuttons[i].generic.flags &= ~QMF_INACTIVE;
ADDRLP4 48
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+44
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 169
;169:	}
LABELV $98
line 151
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $97
line 171
;170:
;171:	for (; i<MAX_MAPSPERPAGE; i++)
ADDRGP4 $120
JUMPV
LABELV $117
line 172
;172:	{
line 173
;173:		s_startserver.mappics[i].generic.flags &= ~QMF_HIGHLIGHT;
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+44
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 174
;174:		s_startserver.mappics[i].generic.name   = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+4
ADDP4
CNSTP4 0
ASGNP4
line 175
;175:		s_startserver.mappics[i].shader         = 0;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+72
ADDP4
CNSTI4 0
ASGNI4
line 178
;176:
;177:		// disable
;178:		s_startserver.mapbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+44
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 179
;179:		s_startserver.mapbuttons[i].generic.flags |= QMF_INACTIVE;
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+44
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 180
;180:	}
LABELV $118
line 171
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $120
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $117
line 184
;181:
;182:
;183:	// no servers to start
;184:	if( !s_startserver.nummaps ) {
ADDRGP4 s_startserver+2028
INDIRI4
CNSTI4 0
NEI4 $131
line 185
;185:		s_startserver.next.generic.flags |= QMF_INACTIVE;
ADDRLP4 28
ADDRGP4 s_startserver+1760+44
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 188
;186:
;187:		// set the map name
;188:		strcpy( s_startserver.mapname.string, "NO MAPS FOUND" );
ADDRGP4 s_startserver+1852+64
INDIRP4
ARGP4
ADDRGP4 $138
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 189
;189:	}
ADDRGP4 $132
JUMPV
LABELV $131
line 190
;190:	else {
line 192
;191:		// set the highlight
;192:		s_startserver.next.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 28
ADDRGP4 s_startserver+1760+44
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 193
;193:		i = s_startserver.currentmap - top;
ADDRLP4 0
ADDRGP4 s_startserver+2024
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 194
;194:		if ( i >=0 && i < MAX_MAPSPERPAGE ) 
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $142
ADDRLP4 0
INDIRI4
CNSTI4 4
GEI4 $142
line 195
;195:		{
line 196
;196:			s_startserver.mappics[i].generic.flags    |= QMF_HIGHLIGHT;
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+44
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 197
;197:			s_startserver.mapbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 40
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+44
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 198
;198:		}
LABELV $142
line 201
;199:
;200:		// set the map name
;201:		info = UI_GetArenaInfoByNumber( s_startserver.maplist[ s_startserver.currentmap ]);
ADDRGP4 s_startserver+2024
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2040
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 36
INDIRP4
ASGNP4
line 202
;202:		Q_strncpyz( s_startserver.mapname.string, Info_ValueForKey( info, "map" ), MAX_NAMELENGTH);
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 $105
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 s_startserver+1852+64
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 203
;203:	}
LABELV $132
line 205
;204:	
;205:	Q_strupr( s_startserver.mapname.string );
ADDRGP4 s_startserver+1852+64
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 206
;206:}
LABELV $94
endproc StartServer_Update 52 16
proc StartServer_MapEvent 0 0
line 214
;207:
;208:
;209:/*
;210:=================
;211:StartServer_MapEvent
;212:=================
;213:*/
;214:static void StartServer_MapEvent( void* ptr, int event ) {
line 215
;215:	if( event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $155
line 216
;216:		return;
ADDRGP4 $154
JUMPV
LABELV $155
line 219
;217:	}
;218:
;219:	s_startserver.currentmap = (s_startserver.page*MAX_MAPSPERPAGE) + (((menucommon_s*)ptr)->id - ID_PICTURES);
ADDRGP4 s_startserver+2024
ADDRGP4 s_startserver+2032
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 11
SUBI4
ADDI4
ASGNI4
line 220
;220:	StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 221
;221:}
LABELV $154
endproc StartServer_MapEvent 0 0
proc StartServer_GametypeEvent 40 8
line 229
;222:
;223:
;224:/*
;225:=================
;226:StartServer_GametypeEvent
;227:=================
;228:*/
;229:static void StartServer_GametypeEvent( void* ptr, int event ) {
line 236
;230:	int			i;
;231:	int			count;
;232:	int			gamebits;
;233:	int			matchbits;
;234:	const char	*info;
;235:
;236:	if( event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $160
line 237
;237:		return;
ADDRGP4 $159
JUMPV
LABELV $160
line 240
;238:	}
;239:
;240:	count = UI_GetNumArenas();
ADDRLP4 20
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 241
;241:	s_startserver.nummaps = 0;
ADDRGP4 s_startserver+2028
CNSTI4 0
ASGNI4
line 242
;242:	matchbits = 1 << gametype_remap[s_startserver.gametype.curvalue];
ADDRLP4 12
CNSTI4 1
ADDRGP4 s_startserver+548+68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_remap
ADDP4
INDIRI4
LSHI4
ASGNI4
line 243
;243:	if( gametype_remap[s_startserver.gametype.curvalue] == GT_FFA ) {
ADDRGP4 s_startserver+548+68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_remap
ADDP4
INDIRI4
CNSTI4 0
NEI4 $165
line 244
;244:		matchbits |= ( 1 << GT_SINGLE_PLAYER );
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 245
;245:	}
LABELV $165
line 246
;246:	for( i = 0; i < count; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $172
JUMPV
LABELV $169
line 247
;247:		info = UI_GetArenaInfoByNumber( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 249
;248:
;249:		gamebits = GametypeBits( Info_ValueForKey( info, "type") );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $173
ARGP4
ADDRLP4 28
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 GametypeBits
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 250
;250:		if( !( gamebits & matchbits ) ) {
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
BANDI4
CNSTI4 0
NEI4 $174
line 251
;251:			continue;
ADDRGP4 $170
JUMPV
LABELV $174
line 254
;252:		}
;253:
;254:		s_startserver.maplist[ s_startserver.nummaps ] = i;
ADDRGP4 s_startserver+2028
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2040
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 255
;255:		s_startserver.nummaps++;
ADDRLP4 36
ADDRGP4 s_startserver+2028
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 256
;256:	}
LABELV $170
line 246
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $172
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $169
line 257
;257:	s_startserver.maxpages = (s_startserver.nummaps + MAX_MAPSPERPAGE-1)/MAX_MAPSPERPAGE;
ADDRGP4 s_startserver+2036
ADDRGP4 s_startserver+2028
INDIRI4
CNSTI4 4
ADDI4
CNSTI4 1
SUBI4
CNSTI4 4
DIVI4
ASGNI4
line 258
;258:	s_startserver.page = 0;
ADDRGP4 s_startserver+2032
CNSTI4 0
ASGNI4
line 259
;259:	s_startserver.currentmap = 0;
ADDRGP4 s_startserver+2024
CNSTI4 0
ASGNI4
line 261
;260:
;261:	StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 262
;262:}
LABELV $159
endproc StartServer_GametypeEvent 40 8
proc StartServer_MenuEvent 12 8
line 270
;263:
;264:
;265:/*
;266:=================
;267:StartServer_MenuEvent
;268:=================
;269:*/
;270:static void StartServer_MenuEvent( void* ptr, int event ) {
line 271
;271:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $184
line 272
;272:		return;
ADDRGP4 $183
JUMPV
LABELV $184
line 275
;273:	}
;274:
;275:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LTI4 $186
ADDRLP4 0
INDIRI4
CNSTI4 18
GTI4 $186
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $206-60
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $206
address $189
address $194
address $205
address $200
code
LABELV $189
line 277
;276:	case ID_PREVPAGE:
;277:		if( s_startserver.page > 0 ) {
ADDRGP4 s_startserver+2032
INDIRI4
CNSTI4 0
LEI4 $187
line 278
;278:			s_startserver.page--;
ADDRLP4 8
ADDRGP4 s_startserver+2032
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 279
;279:			StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 280
;280:		}
line 281
;281:		break;
ADDRGP4 $187
JUMPV
LABELV $194
line 284
;282:
;283:	case ID_NEXTPAGE:
;284:		if( s_startserver.page < s_startserver.maxpages - 1 ) {
ADDRGP4 s_startserver+2032
INDIRI4
ADDRGP4 s_startserver+2036
INDIRI4
CNSTI4 1
SUBI4
GEI4 $187
line 285
;285:			s_startserver.page++;
ADDRLP4 8
ADDRGP4 s_startserver+2032
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 286
;286:			StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 287
;287:		}
line 288
;288:		break;
ADDRGP4 $187
JUMPV
LABELV $200
line 291
;289:
;290:	case ID_STARTSERVERNEXT:
;291:		trap_Cvar_SetValue( "g_gameType", gametype_remap[s_startserver.gametype.curvalue] );
ADDRGP4 $201
ARGP4
ADDRGP4 s_startserver+548+68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_remap
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 292
;292:		UI_ServerOptionsMenu( s_startserver.multiplayer );
ADDRGP4 s_startserver+2020
INDIRI4
ARGI4
ADDRGP4 UI_ServerOptionsMenu
CALLV
pop
line 293
;293:		break;
ADDRGP4 $187
JUMPV
LABELV $205
line 296
;294:
;295:	case ID_STARTSERVERBACK:
;296:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 297
;297:		break;
LABELV $186
LABELV $187
line 299
;298:	}
;299:}
LABELV $183
endproc StartServer_MenuEvent 12 8
proc StartServer_LevelshotDraw 52 20
line 307
;300:
;301:
;302:/*
;303:===============
;304:StartServer_LevelshotDraw
;305:===============
;306:*/
;307:static void StartServer_LevelshotDraw( void *self ) {
line 316
;308:	menubitmap_s	*b;
;309:	int				x;
;310:	int				y;
;311:	int				w;
;312:	int				h;
;313:	int				n;
;314:	const char		*info;
;315:
;316:	b = (menubitmap_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 318
;317:
;318:	if( !b->generic.name ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $209
line 319
;319:		return;
ADDRGP4 $208
JUMPV
LABELV $209
line 322
;320:	}
;321:
;322:	if( b->generic.name && !b->shader ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $211
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
NEI4 $211
line 323
;323:		b->shader = trap_R_RegisterShaderNoMip( b->generic.name );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 324
;324:		if( !b->shader && b->errorpic ) {
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
NEI4 $213
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $213
line 325
;325:			b->shader = trap_R_RegisterShaderNoMip( b->errorpic );
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 326
;326:		}
LABELV $213
line 327
;327:	}
LABELV $211
line 329
;328:
;329:	if( b->focuspic && !b->focusshader ) {
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $215
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 0
NEI4 $215
line 330
;330:		b->focusshader = trap_R_RegisterShaderNoMip( b->focuspic );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 331
;331:	}
LABELV $215
line 333
;332:
;333:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 334
;334:	y = b->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 335
;335:	w = b->width;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 336
;336:	h =	b->height;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 337
;337:	if( b->shader ) {
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
EQI4 $217
line 338
;338:		UI_DrawHandlePic( x, y, w, h, b->shader );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 339
;339:	}
LABELV $217
line 341
;340:
;341:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 342
;342:	y = b->generic.y + b->height;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDI4
ASGNI4
line 343
;343:	UI_FillRect( x, y, b->width, 28, colorBlack );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
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
CNSTF4 1105199104
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 345
;344:
;345:	x += b->width / 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 346
;346:	y += 4;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 347
;347:	n = s_startserver.page * MAX_MAPSPERPAGE + b->generic.id - ID_PICTURES;
ADDRLP4 20
ADDRGP4 s_startserver+2032
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
CNSTI4 11
SUBI4
ASGNI4
line 349
;348:
;349:	info = UI_GetArenaInfoByNumber( s_startserver.maplist[ n ]);
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2040
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 40
INDIRP4
ASGNP4
line 350
;350:	UI_DrawString( x, y, Info_ValueForKey( info, "map" ), UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 $105
ARGP4
ADDRLP4 44
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 352
;351:
;352:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 353
;353:	y = b->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 354
;354:	w = b->width;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 355
;355:	h =	b->height + 28;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 356
;356:	if( b->generic.flags & QMF_HIGHLIGHT ) {	
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 64
BANDU4
CNSTU4 0
EQU4 $221
line 357
;357:		UI_DrawHandlePic( x, y, w, h, b->focusshader );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 358
;358:	}
LABELV $221
line 359
;359:}
LABELV $208
endproc StartServer_LevelshotDraw 52 20
bss
align 1
LABELV $224
skip 64
code
proc StartServer_MenuInit 20 12
line 367
;360:
;361:
;362:/*
;363:=================
;364:StartServer_MenuInit
;365:=================
;366:*/
;367:static void StartServer_MenuInit( void ) {
line 374
;368:	int	i;
;369:	int	x;
;370:	int	y;
;371:	static char mapnamebuffer[64];
;372:
;373:	// zero set all our globals
;374:	memset( &s_startserver, 0 ,sizeof(startserver_t) );
ADDRGP4 s_startserver
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6136
ARGI4
ADDRGP4 memset
CALLP4
pop
line 376
;375:
;376:	StartServer_Cache();
ADDRGP4 StartServer_Cache
CALLV
pop
line 378
;377:
;378:	s_startserver.menu.wrapAround = qtrue;
ADDRGP4 s_startserver+276
CNSTI4 1
ASGNI4
line 379
;379:	s_startserver.menu.fullscreen = qtrue;
ADDRGP4 s_startserver+280
CNSTI4 1
ASGNI4
line 381
;380:
;381:	s_startserver.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_startserver+288
CNSTI4 10
ASGNI4
line 382
;382:	s_startserver.banner.generic.x	   = 320;
ADDRGP4 s_startserver+288+12
CNSTI4 320
ASGNI4
line 383
;383:	s_startserver.banner.generic.y	   = 16;
ADDRGP4 s_startserver+288+16
CNSTI4 16
ASGNI4
line 384
;384:	s_startserver.banner.string        = "GAME SERVER";
ADDRGP4 s_startserver+288+64
ADDRGP4 $234
ASGNP4
line 385
;385:	s_startserver.banner.color         = color_white;
ADDRGP4 s_startserver+288+72
ADDRGP4 color_white
ASGNP4
line 386
;386:	s_startserver.banner.style         = UI_CENTER;
ADDRGP4 s_startserver+288+68
CNSTI4 1
ASGNI4
line 388
;387:
;388:	s_startserver.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_startserver+364
CNSTI4 6
ASGNI4
line 389
;389:	s_startserver.framel.generic.name  = GAMESERVER_FRAMEL;
ADDRGP4 s_startserver+364+4
ADDRGP4 $242
ASGNP4
line 390
;390:	s_startserver.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_startserver+364+44
CNSTU4 16384
ASGNU4
line 391
;391:	s_startserver.framel.generic.x	   = 0;  
ADDRGP4 s_startserver+364+12
CNSTI4 0
ASGNI4
line 392
;392:	s_startserver.framel.generic.y	   = 78;
ADDRGP4 s_startserver+364+16
CNSTI4 78
ASGNI4
line 393
;393:	s_startserver.framel.width  	   = 256;
ADDRGP4 s_startserver+364+80
CNSTI4 256
ASGNI4
line 394
;394:	s_startserver.framel.height  	   = 329;
ADDRGP4 s_startserver+364+84
CNSTI4 329
ASGNI4
line 396
;395:
;396:	s_startserver.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_startserver+456
CNSTI4 6
ASGNI4
line 397
;397:	s_startserver.framer.generic.name  = GAMESERVER_FRAMER;
ADDRGP4 s_startserver+456+4
ADDRGP4 $256
ASGNP4
line 398
;398:	s_startserver.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_startserver+456+44
CNSTU4 16384
ASGNU4
line 399
;399:	s_startserver.framer.generic.x	   = 376;
ADDRGP4 s_startserver+456+12
CNSTI4 376
ASGNI4
line 400
;400:	s_startserver.framer.generic.y	   = 76;
ADDRGP4 s_startserver+456+16
CNSTI4 76
ASGNI4
line 401
;401:	s_startserver.framer.width  	   = 256;
ADDRGP4 s_startserver+456+80
CNSTI4 256
ASGNI4
line 402
;402:	s_startserver.framer.height  	   = 334;
ADDRGP4 s_startserver+456+84
CNSTI4 334
ASGNI4
line 404
;403:
;404:	s_startserver.gametype.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_startserver+548
CNSTI4 3
ASGNI4
line 405
;405:	s_startserver.gametype.generic.name		= "Game Type:";
ADDRGP4 s_startserver+548+4
ADDRGP4 $270
ASGNP4
line 406
;406:	s_startserver.gametype.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_startserver+548+44
CNSTU4 258
ASGNU4
line 407
;407:	s_startserver.gametype.generic.callback	= StartServer_GametypeEvent;
ADDRGP4 s_startserver+548+48
ADDRGP4 StartServer_GametypeEvent
ASGNP4
line 408
;408:	s_startserver.gametype.generic.id		= ID_GAMETYPE;
ADDRGP4 s_startserver+548+8
CNSTI4 10
ASGNI4
line 409
;409:	s_startserver.gametype.generic.x		= 320 - 24;
ADDRGP4 s_startserver+548+12
CNSTI4 296
ASGNI4
line 410
;410:	s_startserver.gametype.generic.y		= 368;
ADDRGP4 s_startserver+548+16
CNSTI4 368
ASGNI4
line 411
;411:	s_startserver.gametype.itemnames		= gametype_items;
ADDRGP4 s_startserver+548+88
ADDRGP4 gametype_items
ASGNP4
line 413
;412:
;413:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $283
line 414
;414:	{
line 415
;415:		x =	(i % MAX_MAPCOLS) * (128+8) + 188;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
MODI4
CNSTI4 136
MULI4
CNSTI4 188
ADDI4
ASGNI4
line 416
;416:		y = (i / MAX_MAPROWS) * (128+8) + 96;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 136
MULI4
CNSTI4 96
ADDI4
ASGNI4
line 418
;417:
;418:		s_startserver.mappics[i].generic.type   = MTYPE_BITMAP;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656
ADDP4
CNSTI4 6
ASGNI4
line 419
;419:		s_startserver.mappics[i].generic.flags  = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+44
ADDP4
CNSTU4 16388
ASGNU4
line 420
;420:		s_startserver.mappics[i].generic.x	    = x;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 421
;421:		s_startserver.mappics[i].generic.y	    = y;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 422
;422:		s_startserver.mappics[i].generic.id		= ID_PICTURES+i;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 11
ADDI4
ASGNI4
line 423
;423:		s_startserver.mappics[i].width  		= 128;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+80
ADDP4
CNSTI4 128
ASGNI4
line 424
;424:		s_startserver.mappics[i].height  	    = 96;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+84
ADDP4
CNSTI4 96
ASGNI4
line 425
;425:		s_startserver.mappics[i].focuspic       = GAMESERVER_SELECTED;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+64
ADDP4
ADDRGP4 $302
ASGNP4
line 426
;426:		s_startserver.mappics[i].errorpic       = GAMESERVER_UNKNOWNMAP;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+68
ADDP4
ADDRGP4 $305
ASGNP4
line 427
;427:		s_startserver.mappics[i].generic.ownerdraw = StartServer_LevelshotDraw;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656+56
ADDP4
ADDRGP4 StartServer_LevelshotDraw
ASGNP4
line 429
;428:
;429:		s_startserver.mapbuttons[i].generic.type     = MTYPE_BITMAP;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024
ADDP4
CNSTI4 6
ASGNI4
line 430
;430:		s_startserver.mapbuttons[i].generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_NODEFAULTINIT;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+44
ADDP4
CNSTU4 33028
ASGNU4
line 431
;431:		s_startserver.mapbuttons[i].generic.id       = ID_PICTURES+i;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 11
ADDI4
ASGNI4
line 432
;432:		s_startserver.mapbuttons[i].generic.callback = StartServer_MapEvent;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+48
ADDP4
ADDRGP4 StartServer_MapEvent
ASGNP4
line 433
;433:		s_startserver.mapbuttons[i].generic.x	     = x - 30;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 30
SUBI4
ASGNI4
line 434
;434:		s_startserver.mapbuttons[i].generic.y	     = y - 32;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 435
;435:		s_startserver.mapbuttons[i].width  		     = 256;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+80
ADDP4
CNSTI4 256
ASGNI4
line 436
;436:		s_startserver.mapbuttons[i].height  	     = 248;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+84
ADDP4
CNSTI4 248
ASGNI4
line 437
;437:		s_startserver.mapbuttons[i].generic.left     = x;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 438
;438:		s_startserver.mapbuttons[i].generic.top  	 = y;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+24
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 439
;439:		s_startserver.mapbuttons[i].generic.right    = x + 128;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+28
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 440
;440:		s_startserver.mapbuttons[i].generic.bottom   = y + 128;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+32
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 441
;441:		s_startserver.mapbuttons[i].focuspic         = GAMESERVER_SELECT;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024+64
ADDP4
ADDRGP4 $333
ASGNP4
line 442
;442:	}
LABELV $284
line 413
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $283
line 444
;443:
;444:	s_startserver.arrows.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_startserver+1392
CNSTI4 6
ASGNI4
line 445
;445:	s_startserver.arrows.generic.name  = GAMESERVER_ARROWS;
ADDRGP4 s_startserver+1392+4
ADDRGP4 $337
ASGNP4
line 446
;446:	s_startserver.arrows.generic.flags = QMF_INACTIVE;
ADDRGP4 s_startserver+1392+44
CNSTU4 16384
ASGNU4
line 447
;447:	s_startserver.arrows.generic.x	   = 260;
ADDRGP4 s_startserver+1392+12
CNSTI4 260
ASGNI4
line 448
;448:	s_startserver.arrows.generic.y	   = 400;
ADDRGP4 s_startserver+1392+16
CNSTI4 400
ASGNI4
line 449
;449:	s_startserver.arrows.width  	   = 128;
ADDRGP4 s_startserver+1392+80
CNSTI4 128
ASGNI4
line 450
;450:	s_startserver.arrows.height  	   = 32;
ADDRGP4 s_startserver+1392+84
CNSTI4 32
ASGNI4
line 452
;451:
;452:	s_startserver.prevpage.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1484
CNSTI4 6
ASGNI4
line 453
;453:	s_startserver.prevpage.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1484+44
CNSTU4 260
ASGNU4
line 454
;454:	s_startserver.prevpage.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1484+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 455
;455:	s_startserver.prevpage.generic.id	    = ID_PREVPAGE;
ADDRGP4 s_startserver+1484+8
CNSTI4 15
ASGNI4
line 456
;456:	s_startserver.prevpage.generic.x		= 260;
ADDRGP4 s_startserver+1484+12
CNSTI4 260
ASGNI4
line 457
;457:	s_startserver.prevpage.generic.y		= 400;
ADDRGP4 s_startserver+1484+16
CNSTI4 400
ASGNI4
line 458
;458:	s_startserver.prevpage.width  		    = 64;
ADDRGP4 s_startserver+1484+80
CNSTI4 64
ASGNI4
line 459
;459:	s_startserver.prevpage.height  		    = 32;
ADDRGP4 s_startserver+1484+84
CNSTI4 32
ASGNI4
line 460
;460:	s_startserver.prevpage.focuspic         = GAMESERVER_ARROWSL;
ADDRGP4 s_startserver+1484+64
ADDRGP4 $365
ASGNP4
line 462
;461:
;462:	s_startserver.nextpage.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1576
CNSTI4 6
ASGNI4
line 463
;463:	s_startserver.nextpage.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1576+44
CNSTU4 260
ASGNU4
line 464
;464:	s_startserver.nextpage.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1576+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 465
;465:	s_startserver.nextpage.generic.id	    = ID_NEXTPAGE;
ADDRGP4 s_startserver+1576+8
CNSTI4 16
ASGNI4
line 466
;466:	s_startserver.nextpage.generic.x		= 321;
ADDRGP4 s_startserver+1576+12
CNSTI4 321
ASGNI4
line 467
;467:	s_startserver.nextpage.generic.y		= 400;
ADDRGP4 s_startserver+1576+16
CNSTI4 400
ASGNI4
line 468
;468:	s_startserver.nextpage.width  		    = 64;
ADDRGP4 s_startserver+1576+80
CNSTI4 64
ASGNI4
line 469
;469:	s_startserver.nextpage.height  		    = 32;
ADDRGP4 s_startserver+1576+84
CNSTI4 32
ASGNI4
line 470
;470:	s_startserver.nextpage.focuspic         = GAMESERVER_ARROWSR;
ADDRGP4 s_startserver+1576+64
ADDRGP4 $383
ASGNP4
line 472
;471:
;472:	s_startserver.mapname.generic.type  = MTYPE_PTEXT;
ADDRGP4 s_startserver+1852
CNSTI4 9
ASGNI4
line 473
;473:	s_startserver.mapname.generic.flags = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_startserver+1852+44
CNSTU4 16392
ASGNU4
line 474
;474:	s_startserver.mapname.generic.x	    = 320;
ADDRGP4 s_startserver+1852+12
CNSTI4 320
ASGNI4
line 475
;475:	s_startserver.mapname.generic.y	    = 440;
ADDRGP4 s_startserver+1852+16
CNSTI4 440
ASGNI4
line 476
;476:	s_startserver.mapname.string        = mapnamebuffer;
ADDRGP4 s_startserver+1852+64
ADDRGP4 $224
ASGNP4
line 477
;477:	s_startserver.mapname.style         = UI_CENTER|UI_BIGFONT;
ADDRGP4 s_startserver+1852+68
CNSTI4 33
ASGNI4
line 478
;478:	s_startserver.mapname.color         = text_color_normal;
ADDRGP4 s_startserver+1852+72
ADDRGP4 text_color_normal
ASGNP4
line 480
;479:
;480:	s_startserver.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1668
CNSTI4 6
ASGNI4
line 481
;481:	s_startserver.back.generic.name     = GAMESERVER_BACK0;
ADDRGP4 s_startserver+1668+4
ADDRGP4 $400
ASGNP4
line 482
;482:	s_startserver.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1668+44
CNSTU4 260
ASGNU4
line 483
;483:	s_startserver.back.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1668+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 484
;484:	s_startserver.back.generic.id	    = ID_STARTSERVERBACK;
ADDRGP4 s_startserver+1668+8
CNSTI4 17
ASGNI4
line 485
;485:	s_startserver.back.generic.x		= 0;
ADDRGP4 s_startserver+1668+12
CNSTI4 0
ASGNI4
line 486
;486:	s_startserver.back.generic.y		= 480-64;
ADDRGP4 s_startserver+1668+16
CNSTI4 416
ASGNI4
line 487
;487:	s_startserver.back.width  		    = 128;
ADDRGP4 s_startserver+1668+80
CNSTI4 128
ASGNI4
line 488
;488:	s_startserver.back.height  		    = 64;
ADDRGP4 s_startserver+1668+84
CNSTI4 64
ASGNI4
line 489
;489:	s_startserver.back.focuspic         = GAMESERVER_BACK1;
ADDRGP4 s_startserver+1668+64
ADDRGP4 $417
ASGNP4
line 491
;490:
;491:	s_startserver.next.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1760
CNSTI4 6
ASGNI4
line 492
;492:	s_startserver.next.generic.name     = GAMESERVER_NEXT0;
ADDRGP4 s_startserver+1760+4
ADDRGP4 $421
ASGNP4
line 493
;493:	s_startserver.next.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1760+44
CNSTU4 272
ASGNU4
line 494
;494:	s_startserver.next.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1760+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 495
;495:	s_startserver.next.generic.id	    = ID_STARTSERVERNEXT;
ADDRGP4 s_startserver+1760+8
CNSTI4 18
ASGNI4
line 496
;496:	s_startserver.next.generic.x		= 640;
ADDRGP4 s_startserver+1760+12
CNSTI4 640
ASGNI4
line 497
;497:	s_startserver.next.generic.y		= 480-64;
ADDRGP4 s_startserver+1760+16
CNSTI4 416
ASGNI4
line 498
;498:	s_startserver.next.width  		    = 128;
ADDRGP4 s_startserver+1760+80
CNSTI4 128
ASGNI4
line 499
;499:	s_startserver.next.height  		    = 64;
ADDRGP4 s_startserver+1760+84
CNSTI4 64
ASGNI4
line 500
;500:	s_startserver.next.focuspic         = GAMESERVER_NEXT1;
ADDRGP4 s_startserver+1760+64
ADDRGP4 $438
ASGNP4
line 502
;501:
;502:	s_startserver.item_null.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_startserver+1928
CNSTI4 6
ASGNI4
line 503
;503:	s_startserver.item_null.generic.flags	= QMF_LEFT_JUSTIFY|QMF_MOUSEONLY|QMF_SILENT;
ADDRGP4 s_startserver+1928+44
CNSTU4 1050628
ASGNU4
line 504
;504:	s_startserver.item_null.generic.x		= 0;
ADDRGP4 s_startserver+1928+12
CNSTI4 0
ASGNI4
line 505
;505:	s_startserver.item_null.generic.y		= 0;
ADDRGP4 s_startserver+1928+16
CNSTI4 0
ASGNI4
line 506
;506:	s_startserver.item_null.width			= 640;
ADDRGP4 s_startserver+1928+80
CNSTI4 640
ASGNI4
line 507
;507:	s_startserver.item_null.height			= 480;
ADDRGP4 s_startserver+1928+84
CNSTI4 480
ASGNI4
line 509
;508:
;509:	Menu_AddItem( &s_startserver.menu, &s_startserver.banner );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 510
;510:	Menu_AddItem( &s_startserver.menu, &s_startserver.framel );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 511
;511:	Menu_AddItem( &s_startserver.menu, &s_startserver.framer );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 513
;512:
;513:	Menu_AddItem( &s_startserver.menu, &s_startserver.gametype );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 514
;514:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $454
line 515
;515:	{
line 516
;516:		Menu_AddItem( &s_startserver.menu, &s_startserver.mappics[i] );
ADDRGP4 s_startserver
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+656
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 517
;517:		Menu_AddItem( &s_startserver.menu, &s_startserver.mapbuttons[i] );
ADDRGP4 s_startserver
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_startserver+1024
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 518
;518:	}
LABELV $455
line 514
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $454
line 520
;519:
;520:	Menu_AddItem( &s_startserver.menu, &s_startserver.arrows );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1392
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 521
;521:	Menu_AddItem( &s_startserver.menu, &s_startserver.prevpage );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1484
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 522
;522:	Menu_AddItem( &s_startserver.menu, &s_startserver.nextpage );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 523
;523:	Menu_AddItem( &s_startserver.menu, &s_startserver.back );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1668
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 524
;524:	Menu_AddItem( &s_startserver.menu, &s_startserver.next );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1760
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 525
;525:	Menu_AddItem( &s_startserver.menu, &s_startserver.mapname );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1852
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 526
;526:	Menu_AddItem( &s_startserver.menu, &s_startserver.item_null );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1928
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 528
;527:
;528:	StartServer_GametypeEvent( NULL, QM_ACTIVATED );
CNSTP4 0
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 StartServer_GametypeEvent
CALLV
pop
line 529
;529:}
LABELV $223
endproc StartServer_MenuInit 20 12
export StartServer_Cache
proc StartServer_Cache 104 16
line 538
;530:
;531:
;532:/*
;533:=================
;534:StartServer_Cache
;535:=================
;536:*/
;537:void StartServer_Cache( void )
;538:{
line 545
;539:	int				i;
;540:	const char		*info;
;541:	qboolean		precache;
;542:	char			picname[ MAX_QPATH ];
;543:	char			mapname[ MAX_NAMELENGTH ];
;544:
;545:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK0 );	
ADDRGP4 $400
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 546
;546:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK1 );	
ADDRGP4 $417
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 547
;547:	trap_R_RegisterShaderNoMip( GAMESERVER_NEXT0 );	
ADDRGP4 $421
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 548
;548:	trap_R_RegisterShaderNoMip( GAMESERVER_NEXT1 );	
ADDRGP4 $438
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 549
;549:	trap_R_RegisterShaderNoMip( GAMESERVER_FRAMEL );	
ADDRGP4 $242
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 550
;550:	trap_R_RegisterShaderNoMip( GAMESERVER_FRAMER );	
ADDRGP4 $256
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 551
;551:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECT );	
ADDRGP4 $333
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 552
;552:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECTED );	
ADDRGP4 $302
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 553
;553:	trap_R_RegisterShaderNoMip( GAMESERVER_UNKNOWNMAP );
ADDRGP4 $305
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 554
;554:	trap_R_RegisterShaderNoMip( GAMESERVER_ARROWS );
ADDRGP4 $337
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 555
;555:	trap_R_RegisterShaderNoMip( GAMESERVER_ARROWSL );
ADDRGP4 $365
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 556
;556:	trap_R_RegisterShaderNoMip( GAMESERVER_ARROWSR );
ADDRGP4 $383
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 558
;557:
;558:	precache = trap_Cvar_VariableValue("com_buildscript");
ADDRGP4 $468
ARGP4
ADDRLP4 92
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 88
ADDRLP4 92
INDIRF4
CVFI4 4
ASGNI4
line 560
;559:
;560:	if( precache ) {
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $469
line 561
;561:		for( i = 0; i < UI_GetNumArenas(); i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $474
JUMPV
LABELV $471
line 562
;562:			info = UI_GetArenaInfoByNumber( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 96
INDIRP4
ASGNP4
line 563
;563:			Q_strncpyz( mapname, Info_ValueForKey( info, "map"), MAX_NAMELENGTH );
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 $105
ARGP4
ADDRLP4 100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 68
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 564
;564:			Q_strupr( mapname );
ADDRLP4 68
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 566
;565:
;566:			Com_sprintf( picname, sizeof(picname), "levelshots/%s", mapname );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $106
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 567
;567:			trap_R_RegisterShaderNoMip(picname);
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 568
;568:		}
LABELV $472
line 561
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $474
ADDRLP4 96
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $471
line 569
;569:	}
LABELV $469
line 570
;570:}
LABELV $467
endproc StartServer_Cache 104 16
export UI_StartServerMenu
proc UI_StartServerMenu 0 4
line 578
;571:
;572:
;573:/*
;574:=================
;575:UI_StartServerMenu
;576:=================
;577:*/
;578:void UI_StartServerMenu( qboolean multiplayer ) {
line 579
;579:	StartServer_MenuInit();
ADDRGP4 StartServer_MenuInit
CALLV
pop
line 580
;580:	s_startserver.multiplayer = multiplayer;
ADDRGP4 s_startserver+2020
ADDRFP4 0
INDIRI4
ASGNI4
line 581
;581:	UI_PushMenu( &s_startserver.menu );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 582
;582:}
LABELV $475
endproc UI_StartServerMenu 0 4
data
align 4
LABELV dedicated_list
address $478
address $479
address $480
byte 4 0
align 4
LABELV playerType_list
address $481
address $482
address $483
byte 4 0
align 4
LABELV playerTeam_list
address $484
address $485
byte 4 0
align 4
LABELV botSkill_list
address $486
address $487
address $488
address $489
address $490
byte 4 0
code
proc BotAlreadySelected 8 8
line 687
;583:
;584:
;585:
;586:/*
;587:=============================================================================
;588:
;589:SERVER OPTIONS MENU *****
;590:
;591:=============================================================================
;592:*/
;593:
;594:#define ID_PLAYER_TYPE			20
;595:#define ID_MAXCLIENTS			21
;596:#define ID_DEDICATED			22
;597:#define ID_GO					23
;598:#define ID_BACK					24
;599:
;600:#define PLAYER_SLOTS			12
;601:
;602:
;603:typedef struct {
;604:	menuframework_s		menu;
;605:
;606:	menutext_s			banner;
;607:
;608:	menubitmap_s		mappic;
;609:	menubitmap_s		picframe;
;610:
;611:	menulist_s			dedicated;
;612:	menufield_s			timelimit;
;613:	menufield_s			fraglimit;
;614:	menufield_s			flaglimit;
;615:	menuradiobutton_s	friendlyfire;
;616:	menufield_s			hostname;
;617:	menuradiobutton_s	pure;
;618:	menulist_s			botSkill;
;619:
;620:	menutext_s			player0;
;621:	menulist_s			playerType[PLAYER_SLOTS];
;622:	menutext_s			playerName[PLAYER_SLOTS];
;623:	menulist_s			playerTeam[PLAYER_SLOTS];
;624:
;625:	menubitmap_s		go;
;626:	menubitmap_s		next;
;627:	menubitmap_s		back;
;628:
;629:	qboolean			multiplayer;
;630:	int					gametype;
;631:	char				mapnamebuffer[32];
;632:	char				playerNameBuffers[PLAYER_SLOTS][16];
;633:
;634:	qboolean			newBot;
;635:	int					newBotIndex;
;636:	char				newBotName[16];
;637:	
;638:	menulist_s			punkbuster;
;639:#ifdef USE_GRAPPLING_HOOK	
;640:	menuradiobutton_s	grapple;
;641:#endif
;642:#ifdef USE_ITEM_TIMERS
;643:	menuradiobutton_s	itemTimer;
;644:#endif
;645:#ifdef USE_DEATHCAM
;646:	menuradiobutton_s	allowDeathCam;
;647:#endif
;648:} serveroptions_t;
;649:
;650:static serveroptions_t s_serveroptions;
;651:
;652:static const char *dedicated_list[] = {
;653:	"No",
;654:	"LAN",
;655:	"Internet",
;656:	NULL
;657:};
;658:
;659:static const char *playerType_list[] = {
;660:	"Open",
;661:	"Bot",
;662:	"----",
;663:	NULL
;664:};
;665:
;666:static const char *playerTeam_list[] = {
;667:	"Blue",
;668:	"Red",
;669:	NULL
;670:};
;671:
;672:static const char *botSkill_list[] = {
;673:	"I Can Win",
;674:	"Bring It On",
;675:	"Hurt Me Plenty",
;676:	"Hardcore",
;677:	"Nightmare!",
;678:	NULL
;679:};
;680:
;681:
;682:/*
;683:=================
;684:BotAlreadySelected
;685:=================
;686:*/
;687:static qboolean BotAlreadySelected( const char *checkName ) {
line 690
;688:	int		n;
;689:
;690:	for( n = 1; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $492
line 691
;691:		if( s_serveroptions.playerType[n].curvalue != 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
INDIRI4
CNSTI4 1
EQI4 $496
line 692
;692:			continue;
ADDRGP4 $493
JUMPV
LABELV $496
line 694
;693:		}
;694:		if( (s_serveroptions.gametype >= GT_TEAM) &&
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
LTI4 $500
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+68
ADDP4
INDIRI4
ADDRGP4 s_serveroptions+6352
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+68
ADDP4
INDIRI4
EQI4 $500
line 695
;695:			(s_serveroptions.playerTeam[n].curvalue != s_serveroptions.playerTeam[s_serveroptions.newBotIndex].curvalue ) ) {
line 696
;696:			continue;
ADDRGP4 $493
JUMPV
LABELV $500
line 698
;697:		}
;698:		if( Q_stricmp( checkName, s_serveroptions.playerNameBuffers[n] ) == 0 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $508
line 699
;699:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $491
JUMPV
LABELV $508
line 701
;700:		}
;701:	}
LABELV $493
line 690
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $492
line 703
;702:
;703:	return qfalse;
CNSTI4 0
RETI4
LABELV $491
endproc BotAlreadySelected 8 8
proc ServerOptions_Start 180 24
line 712
;704:}
;705:
;706:
;707:/*
;708:=================
;709:ServerOptions_Start
;710:=================
;711:*/
;712:static void ServerOptions_Start( void ) {
line 734
;713:	int		timelimit;
;714:	int		fraglimit;
;715:	int		maxclients;
;716:	int		dedicated;
;717:	int		friendlyfire;
;718:	int		flaglimit;
;719:	int		pure;
;720:#ifdef USE_GRAPPLING_HOOK
;721:	int		grapple;
;722:#endif
;723:#ifdef USE_ITEM_TIMERS
;724:	int		itemTimer;
;725:#endif
;726:#ifdef USE_DEATHCAM
;727:	int		allowDeathCam;
;728:#endif
;729:	int		skill;
;730:	int		n;
;731:	char	buf[64];
;732:	const char *info;
;733:
;734:	timelimit	 = atoi( s_serveroptions.timelimit.field.buffer );
ADDRGP4 s_serveroptions+656+64+12
ARGP4
ADDRLP4 116
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 116
INDIRI4
ASGNI4
line 735
;735:	fraglimit	 = atoi( s_serveroptions.fraglimit.field.buffer );
ADDRGP4 s_serveroptions+996+64+12
ARGP4
ADDRLP4 120
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 120
INDIRI4
ASGNI4
line 736
;736:	flaglimit	 = atoi( s_serveroptions.flaglimit.field.buffer );
ADDRGP4 s_serveroptions+1336+64+12
ARGP4
ADDRLP4 124
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 124
INDIRI4
ASGNI4
line 737
;737:	dedicated	 = s_serveroptions.dedicated.curvalue;
ADDRLP4 88
ADDRGP4 s_serveroptions+548+68
INDIRI4
ASGNI4
line 738
;738:	friendlyfire = s_serveroptions.friendlyfire.curvalue;
ADDRLP4 92
ADDRGP4 s_serveroptions+1676+64
INDIRI4
ASGNI4
line 739
;739:	pure		 = s_serveroptions.pure.curvalue;
ADDRLP4 96
ADDRGP4 s_serveroptions+2084+64
INDIRI4
ASGNI4
line 740
;740:	skill		 = s_serveroptions.botSkill.curvalue + 1;
ADDRLP4 72
ADDRGP4 s_serveroptions+2152+68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 742
;741:#ifdef USE_GRAPPLING_HOOK
;742:	grapple		 = s_serveroptions.grapple.curvalue;
ADDRLP4 100
ADDRGP4 s_serveroptions+6480+64
INDIRI4
ASGNI4
line 745
;743:#endif
;744:#ifdef USE_ITEM_TIMERS
;745:	itemTimer	 = s_serveroptions.itemTimer.curvalue;
ADDRLP4 104
ADDRGP4 s_serveroptions+6548+64
INDIRI4
ASGNI4
line 748
;746:#endif
;747:#ifdef USE_DEATHCAM
;748:	allowDeathCam = s_serveroptions.allowDeathCam.curvalue;
ADDRLP4 108
ADDRGP4 s_serveroptions+6616+64
INDIRI4
ASGNI4
line 751
;749:#endif
;750:	//set maxclients
;751:	for( n = 0, maxclients = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $538
JUMPV
LABELV $535
line 752
;752:		if( s_serveroptions.playerType[n].curvalue == 2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $539
line 753
;753:			continue;
ADDRGP4 $536
JUMPV
LABELV $539
line 755
;754:		}
;755:		if( (s_serveroptions.playerType[n].curvalue == 1) && (s_serveroptions.playerNameBuffers[n][0] == 0) ) {
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $543
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $543
line 756
;756:			continue;
ADDRGP4 $536
JUMPV
LABELV $543
line 758
;757:		}
;758:		maxclients++;
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 759
;759:	}
LABELV $536
line 751
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $538
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $535
line 761
;760:
;761:	switch( s_serveroptions.gametype ) {
ADDRLP4 128
ADDRGP4 s_serveroptions+6120
INDIRI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
LTI4 $548
ADDRLP4 128
INDIRI4
CNSTI4 4
GTI4 $548
ADDRLP4 128
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $565
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $565
address $551
address $554
address $548
address $557
address $561
code
LABELV $551
LABELV $548
line 764
;762:	case GT_FFA:
;763:	default:
;764:		trap_Cvar_SetValue( "ui_ffa_fraglimit", fraglimit );
ADDRGP4 $552
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 765
;765:		trap_Cvar_SetValue( "ui_ffa_timelimit", timelimit );
ADDRGP4 $553
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 766
;766:		break;
ADDRGP4 $549
JUMPV
LABELV $554
line 769
;767:
;768:	case GT_TOURNAMENT:
;769:		trap_Cvar_SetValue( "ui_tourney_fraglimit", fraglimit );
ADDRGP4 $555
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 770
;770:		trap_Cvar_SetValue( "ui_tourney_timelimit", timelimit );
ADDRGP4 $556
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 771
;771:		break;
ADDRGP4 $549
JUMPV
LABELV $557
line 774
;772:
;773:	case GT_TEAM:
;774:		trap_Cvar_SetValue( "ui_team_fraglimit", fraglimit );
ADDRGP4 $558
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 775
;775:		trap_Cvar_SetValue( "ui_team_timelimit", timelimit );
ADDRGP4 $559
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 776
;776:		trap_Cvar_SetValue( "ui_team_friendly", friendlyfire );
ADDRGP4 $560
ARGP4
ADDRLP4 92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 777
;777:		break;
ADDRGP4 $549
JUMPV
LABELV $561
line 780
;778:
;779:	case GT_CTF:
;780:		trap_Cvar_SetValue( "ui_ctf_capturelimit", flaglimit );
ADDRGP4 $562
ARGP4
ADDRLP4 84
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 781
;781:		trap_Cvar_SetValue( "ui_ctf_timelimit", timelimit );
ADDRGP4 $563
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 782
;782:		trap_Cvar_SetValue( "ui_ctf_friendly", friendlyfire );
ADDRGP4 $564
ARGP4
ADDRLP4 92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 783
;783:		break;
LABELV $549
line 786
;784:	}
;785:
;786:	trap_Cvar_SetValue( "sv_maxclients", Com_Clamp( 0, 12, maxclients ) );
CNSTF4 0
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 68
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 132
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $566
ARGP4
ADDRLP4 132
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 787
;787:	trap_Cvar_SetValue( "dedicated", Com_Clamp( 0, 2, dedicated ) );
CNSTF4 0
ARGF4
CNSTF4 1073741824
ARGF4
ADDRLP4 88
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 136
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $567
ARGP4
ADDRLP4 136
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 788
;788:	trap_Cvar_SetValue ("timelimit", Com_Clamp( 0, timelimit, timelimit ) );
CNSTF4 0
ARGF4
ADDRLP4 140
ADDRLP4 76
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 140
INDIRF4
ARGF4
ADDRLP4 140
INDIRF4
ARGF4
ADDRLP4 144
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $568
ARGP4
ADDRLP4 144
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 789
;789:	trap_Cvar_SetValue ("fraglimit", Com_Clamp( 0, fraglimit, fraglimit ) );
CNSTF4 0
ARGF4
ADDRLP4 148
ADDRLP4 80
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 148
INDIRF4
ARGF4
ADDRLP4 148
INDIRF4
ARGF4
ADDRLP4 152
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $569
ARGP4
ADDRLP4 152
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 790
;790:	trap_Cvar_SetValue ("capturelimit", Com_Clamp( 0, flaglimit, flaglimit ) );
CNSTF4 0
ARGF4
ADDRLP4 156
ADDRLP4 84
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 156
INDIRF4
ARGF4
ADDRLP4 156
INDIRF4
ARGF4
ADDRLP4 160
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $570
ARGP4
ADDRLP4 160
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 791
;791:	trap_Cvar_SetValue( "g_friendlyfire", friendlyfire );
ADDRGP4 $571
ARGP4
ADDRLP4 92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 792
;792:	trap_Cvar_SetValue( "sv_pure", pure );
ADDRGP4 $572
ARGP4
ADDRLP4 96
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 793
;793:	trap_Cvar_Set("sv_hostname", s_serveroptions.hostname.field.buffer );
ADDRGP4 $573
ARGP4
ADDRGP4 s_serveroptions+1744+64+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 795
;794:	
;795:	trap_Cvar_SetValue( "sv_punkbuster", s_serveroptions.punkbuster.curvalue );
ADDRGP4 $577
ARGP4
ADDRGP4 s_serveroptions+6372+68
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 798
;796:
;797:#ifdef USE_GRAPPLING_HOOK
;798:	trap_Cvar_SetValue("g_PureAllowHook", grapple);
ADDRGP4 $580
ARGP4
ADDRLP4 100
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 801
;799:#endif
;800:#ifdef USE_ITEM_TIMERS
;801:	trap_Cvar_SetValue("g_itemTimer", itemTimer);
ADDRGP4 $581
ARGP4
ADDRLP4 104
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 804
;802:#endif
;803:#ifdef USE_DEATHCAM
;804:	trap_Cvar_SetValue("g_allowDeathCam", allowDeathCam);
ADDRGP4 $582
ARGP4
ADDRLP4 108
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 807
;805:#endif
;806:	// the wait commands will allow the dedicated to take effect
;807:	info = UI_GetArenaInfoByNumber( s_startserver.maplist[ s_startserver.currentmap ]);
ADDRGP4 s_startserver+2024
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2040
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 112
ADDRLP4 164
INDIRP4
ASGNP4
line 808
;808:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", Info_ValueForKey( info, "map" )));
ADDRLP4 112
INDIRP4
ARGP4
ADDRGP4 $105
ARGP4
ADDRLP4 168
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $585
ARGP4
ADDRLP4 168
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 172
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 811
;809:
;810:	// add bots
;811:	trap_Cmd_ExecuteText( EXEC_APPEND, "wait 3\n" );
CNSTI4 2
ARGI4
ADDRGP4 $586
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 812
;812:	for( n = 1; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $587
line 813
;813:		if( s_serveroptions.playerType[n].curvalue != 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
INDIRI4
CNSTI4 1
EQI4 $591
line 814
;814:			continue;
ADDRGP4 $588
JUMPV
LABELV $591
line 816
;815:		}
;816:		if( s_serveroptions.playerNameBuffers[n][0] == 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $595
line 817
;817:			continue;
ADDRGP4 $588
JUMPV
LABELV $595
line 819
;818:		}
;819:		if( s_serveroptions.playerNameBuffers[n][0] == '-' ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $598
line 820
;820:			continue;
ADDRGP4 $588
JUMPV
LABELV $598
line 822
;821:		}
;822:		if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
LTI4 $601
line 823
;823:			Com_sprintf( buf, sizeof(buf), "addbot %s %i %s\n", s_serveroptions.playerNameBuffers[n], skill,
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $604
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+68
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 playerTeam_list
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 825
;824:				playerTeam_list[s_serveroptions.playerTeam[n].curvalue] );
;825:		}
ADDRGP4 $602
JUMPV
LABELV $601
line 826
;826:		else {
line 827
;827:			Com_sprintf( buf, sizeof(buf), "addbot %s %i\n", s_serveroptions.playerNameBuffers[n], skill );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $608
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 828
;828:		}
LABELV $602
line 829
;829:		trap_Cmd_ExecuteText( EXEC_APPEND, buf );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 830
;830:	}
LABELV $588
line 812
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $587
line 833
;831:
;832:	// set player's team
;833:	if( dedicated == 0 && s_serveroptions.gametype >= GT_TEAM ) {
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $610
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
LTI4 $610
line 834
;834:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "team %s\n", playerTeam_list[s_serveroptions.playerTeam[0].curvalue] ) );
ADDRGP4 $613
ARGP4
ADDRGP4 s_serveroptions+4544+68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 playerTeam_list
ADDP4
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 176
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 835
;835:	}
LABELV $610
line 836
;836:}
LABELV $511
endproc ServerOptions_Start 180 24
proc ServerOptions_InitPlayerItems 12 12
line 844
;837:
;838:
;839:/*
;840:=================
;841:ServerOptions_InitPlayerItems
;842:=================
;843:*/
;844:static void ServerOptions_InitPlayerItems( void ) {
line 849
;845:	int		n;
;846:	int		v;
;847:
;848:	// init types
;849:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+6116
INDIRI4
CNSTI4 0
EQI4 $617
line 850
;850:		v = 0;	// open
ADDRLP4 4
CNSTI4 0
ASGNI4
line 851
;851:	}
ADDRGP4 $618
JUMPV
LABELV $617
line 852
;852:	else {
line 853
;853:		v = 1;	// bot
ADDRLP4 4
CNSTI4 1
ASGNI4
line 854
;854:	}
LABELV $618
line 856
;855:	
;856:	for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $620
line 857
;857:		s_serveroptions.playerType[n].curvalue = v;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 858
;858:	}
LABELV $621
line 856
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $620
line 860
;859:
;860:	if( s_serveroptions.multiplayer && (s_serveroptions.gametype < GT_TEAM) ) {
ADDRGP4 s_serveroptions+6116
INDIRI4
CNSTI4 0
EQI4 $626
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
GEI4 $626
line 861
;861:		for( n = 8; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 8
ASGNI4
LABELV $630
line 862
;862:			s_serveroptions.playerType[n].curvalue = 2;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
CNSTI4 2
ASGNI4
line 863
;863:		}
LABELV $631
line 861
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $630
line 864
;864:	}
LABELV $626
line 867
;865:
;866:	// if not a dedicated server, first slot is reserved for the human on the server
;867:	if( s_serveroptions.dedicated.curvalue == 0 ) {
ADDRGP4 s_serveroptions+548+68
INDIRI4
CNSTI4 0
NEI4 $636
line 869
;868:		// human
;869:		s_serveroptions.playerType[0].generic.flags |= QMF_INACTIVE;
ADDRLP4 8
ADDRGP4 s_serveroptions+2336+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 870
;870:		s_serveroptions.playerType[0].curvalue = 0;
ADDRGP4 s_serveroptions+2336+68
CNSTI4 0
ASGNI4
line 871
;871:		trap_Cvar_VariableStringBuffer( "name", s_serveroptions.playerNameBuffers[0], sizeof(s_serveroptions.playerNameBuffers[0]) );
ADDRGP4 $644
ARGP4
ADDRGP4 s_serveroptions+6156
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 872
;872:		Q_CleanStr( s_serveroptions.playerNameBuffers[0] );
ADDRGP4 s_serveroptions+6156
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 873
;873:	}
LABELV $636
line 876
;874:
;875:	// init teams
;876:	if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
LTI4 $648
line 877
;877:		for( n = 0; n < (PLAYER_SLOTS / 2); n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $651
line 878
;878:			s_serveroptions.playerTeam[n].curvalue = 0;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+68
ADDP4
CNSTI4 0
ASGNI4
line 879
;879:		}
LABELV $652
line 877
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $651
line 880
;880:		for( ; n < PLAYER_SLOTS; n++ ) {
ADDRGP4 $660
JUMPV
LABELV $657
line 881
;881:			s_serveroptions.playerTeam[n].curvalue = 1;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+68
ADDP4
CNSTI4 1
ASGNI4
line 882
;882:		}
LABELV $658
line 880
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $660
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $657
line 883
;883:	}
ADDRGP4 $649
JUMPV
LABELV $648
line 884
;884:	else {
line 885
;885:		for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $663
line 886
;886:			s_serveroptions.playerTeam[n].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 887
;887:		}
LABELV $664
line 885
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $663
line 888
;888:	}
LABELV $649
line 889
;889:}
LABELV $616
endproc ServerOptions_InitPlayerItems 12 12
proc ServerOptions_SetPlayerItems 12 0
line 897
;890:
;891:
;892:/*
;893:=================
;894:ServerOptions_SetPlayerItems
;895:=================
;896:*/
;897:static void ServerOptions_SetPlayerItems( void ) {
line 909
;898:	int		start;
;899:	int		n;
;900:
;901:	// types
;902://	for( n = 0; n < PLAYER_SLOTS; n++ ) {
;903://		if( (!s_serveroptions.multiplayer) && (n > 0) && (s_serveroptions.playerType[n].curvalue == 0) ) {
;904://			s_serveroptions.playerType[n].curvalue = 1;
;905://		}
;906://	}
;907:
;908:	// names
;909:	if( s_serveroptions.dedicated.curvalue == 0 ) {
ADDRGP4 s_serveroptions+548+68
INDIRI4
CNSTI4 0
NEI4 $670
line 910
;910:		s_serveroptions.player0.string = "Human";
ADDRGP4 s_serveroptions+2260+64
ADDRGP4 $676
ASGNP4
line 911
;911:		s_serveroptions.playerName[0].generic.flags &= ~QMF_HIDDEN;
ADDRLP4 8
ADDRGP4 s_serveroptions+3632+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294963199
BANDU4
ASGNU4
line 913
;912:
;913:		start = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 914
;914:	}
ADDRGP4 $671
JUMPV
LABELV $670
line 915
;915:	else {
line 916
;916:		s_serveroptions.player0.string = "Open";
ADDRGP4 s_serveroptions+2260+64
ADDRGP4 $481
ASGNP4
line 917
;917:		start = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 918
;918:	}
LABELV $671
line 919
;919:	for( n = start; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $684
JUMPV
LABELV $681
line 920
;920:		if( s_serveroptions.playerType[n].curvalue == 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $685
line 921
;921:			s_serveroptions.playerName[n].generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 922
;922:		}
ADDRGP4 $686
JUMPV
LABELV $685
line 923
;923:		else {
line 924
;924:			s_serveroptions.playerName[n].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 925
;925:		}
LABELV $686
line 926
;926:	}
LABELV $682
line 919
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $684
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $681
line 929
;927:
;928:	// teams
;929:	if( s_serveroptions.gametype < GT_TEAM ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
GEI4 $693
line 930
;930:		return;
ADDRGP4 $669
JUMPV
LABELV $693
line 932
;931:	}
;932:	for( n = start; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $699
JUMPV
LABELV $696
line 933
;933:		if( s_serveroptions.playerType[n].curvalue == 2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $700
line 934
;934:			s_serveroptions.playerTeam[n].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 935
;935:		}
ADDRGP4 $701
JUMPV
LABELV $700
line 936
;936:		else {
line 937
;937:			s_serveroptions.playerTeam[n].generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 938
;938:		}
LABELV $701
line 939
;939:	}
LABELV $697
line 932
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $699
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $696
line 940
;940:}
LABELV $669
endproc ServerOptions_SetPlayerItems 12 0
proc ServerOptions_Event 8 0
line 948
;941:
;942:
;943:/*
;944:=================
;945:ServerOptions_Event
;946:=================
;947:*/
;948:static void ServerOptions_Event( void* ptr, int event ) {
line 949
;949:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $709
ADDRLP4 0
INDIRI4
CNSTI4 24
GTI4 $709
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $725-72
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $725
address $719
address $709
address $712
address $715
address $715
address $716
address $722
code
LABELV $712
line 955
;950:	
;951:	//if( event != QM_ACTIVATED && event != QM_LOSTFOCUS) {
;952:	//	return;
;953:	//}
;954:	case ID_PLAYER_TYPE:
;955:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $713
line 956
;956:			break;
ADDRGP4 $710
JUMPV
LABELV $713
line 958
;957:		}
;958:		ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 959
;959:		break;
ADDRGP4 $710
JUMPV
LABELV $715
line 963
;960:
;961:	case ID_MAXCLIENTS:
;962:	case ID_DEDICATED:
;963:		ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 964
;964:		break;
ADDRGP4 $710
JUMPV
LABELV $716
line 966
;965:	case ID_GO:
;966:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $717
line 967
;967:			break;
ADDRGP4 $710
JUMPV
LABELV $717
line 969
;968:		}
;969:		ServerOptions_Start();
ADDRGP4 ServerOptions_Start
CALLV
pop
line 970
;970:		break;
ADDRGP4 $710
JUMPV
LABELV $719
line 973
;971:
;972:	case ID_STARTSERVERNEXT:
;973:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $710
line 974
;974:			break;
ADDRGP4 $710
JUMPV
line 976
;975:		}
;976:		break;
LABELV $722
line 978
;977:	case ID_BACK:
;978:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $723
line 979
;979:			break;
ADDRGP4 $710
JUMPV
LABELV $723
line 981
;980:		}
;981:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 982
;982:		break;
LABELV $709
LABELV $710
line 984
;983:	}
;984:}
LABELV $708
endproc ServerOptions_Event 8 0
proc ServerOptions_PlayerNameEvent 4 4
line 987
;985:
;986:
;987:static void ServerOptions_PlayerNameEvent( void* ptr, int event ) {
line 990
;988:	int		n;
;989:
;990:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $728
line 991
;991:		return;
ADDRGP4 $727
JUMPV
LABELV $728
line 993
;992:	}
;993:	n = ((menutext_s*)ptr)->generic.id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 994
;994:	s_serveroptions.newBotIndex = n;
ADDRGP4 s_serveroptions+6352
ADDRLP4 0
INDIRI4
ASGNI4
line 995
;995:	UI_BotSelectMenu( s_serveroptions.playerNameBuffers[n] );
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
ARGP4
ADDRGP4 UI_BotSelectMenu
CALLV
pop
line 996
;996:}
LABELV $727
endproc ServerOptions_PlayerNameEvent 4 4
proc ServerOptions_StatusBar 4 20
line 1004
;997:
;998:
;999:/*
;1000:=================
;1001:ServerOptions_StatusBar
;1002:=================
;1003:*/
;1004:static void ServerOptions_StatusBar( void* ptr ) {
line 1005
;1005:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $733
JUMPV
LABELV $733
line 1007
;1006:	default:
;1007:		UI_DrawString( 320, 440, "0 = NO LIMIT", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $736
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1008
;1008:		break;
LABELV $734
line 1010
;1009:	}
;1010:}
LABELV $732
endproc ServerOptions_StatusBar 4 20
proc ServerOptions_LevelshotDraw 16 20
line 1018
;1011:
;1012:
;1013:/*
;1014:===============
;1015:ServerOptions_LevelshotDraw
;1016:===============
;1017:*/
;1018:static void ServerOptions_LevelshotDraw( void *self ) {
line 1024
;1019:	menubitmap_s	*b;
;1020:	int				x;
;1021:	int				y;
;1022:
;1023:	// strange place for this, but it works
;1024:	if( s_serveroptions.newBot ) {
ADDRGP4 s_serveroptions+6348
INDIRI4
CNSTI4 0
EQI4 $738
line 1025
;1025:		Q_strncpyz( s_serveroptions.playerNameBuffers[s_serveroptions.newBotIndex], s_serveroptions.newBotName, 16 );
ADDRGP4 s_serveroptions+6352
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
ARGP4
ADDRGP4 s_serveroptions+6356
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1026
;1026:		s_serveroptions.newBot = qfalse;
ADDRGP4 s_serveroptions+6348
CNSTI4 0
ASGNI4
line 1027
;1027:	}
LABELV $738
line 1029
;1028:
;1029:	b = (menubitmap_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1031
;1030:
;1031:	Bitmap_Draw( b );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Bitmap_Draw
CALLV
pop
line 1033
;1032:
;1033:	x = b->generic.x;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1034
;1034:	y = b->generic.y + b->height;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1035
;1035:	UI_FillRect( x, y, b->width, 40, colorBlack );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
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
CNSTF4 1109393408
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 1037
;1036:
;1037:	x += b->width / 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 1038
;1038:	y += 4;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 1039
;1039:	UI_DrawString( x, y, s_serveroptions.mapnamebuffer, UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 s_serveroptions+6124
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1041
;1040:
;1041:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1042
;1042:	UI_DrawString( x, y, gametype_items[gametype_remap2[s_serveroptions.gametype]], UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_remap2
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_items
ADDP4
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1043
;1043:}
LABELV $737
endproc ServerOptions_LevelshotDraw 16 20
proc ServerOptions_InitBotNames 1068 12
line 1046
;1044:
;1045:
;1046:static void ServerOptions_InitBotNames( void ) {
line 1055
;1047:	int			count;
;1048:	int			n;
;1049:	const char	*arenaInfo;
;1050:	const char	*botInfo;
;1051:	char		*p;
;1052:	char		*bot;
;1053:	char		bots[MAX_INFO_STRING];
;1054:
;1055:	if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
LTI4 $748
line 1056
;1056:		Q_strncpyz( s_serveroptions.playerNameBuffers[1], "grunt", 16 );
ADDRGP4 s_serveroptions+6156+16
ARGP4
ADDRGP4 $753
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1057
;1057:		Q_strncpyz( s_serveroptions.playerNameBuffers[2], "major", 16 );
ADDRGP4 s_serveroptions+6156+32
ARGP4
ADDRGP4 $756
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1058
;1058:		if( s_serveroptions.gametype == GT_TEAM ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
NEI4 $757
line 1059
;1059:			Q_strncpyz( s_serveroptions.playerNameBuffers[3], "visor", 16 );
ADDRGP4 s_serveroptions+6156+48
ARGP4
ADDRGP4 $762
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1060
;1060:		}
ADDRGP4 $758
JUMPV
LABELV $757
line 1061
;1061:		else {
line 1062
;1062:			s_serveroptions.playerType[3].curvalue = 2;
ADDRGP4 s_serveroptions+2336+324+68
CNSTI4 2
ASGNI4
line 1063
;1063:		}
LABELV $758
line 1064
;1064:		s_serveroptions.playerType[4].curvalue = 2;
ADDRGP4 s_serveroptions+2336+432+68
CNSTI4 2
ASGNI4
line 1065
;1065:		s_serveroptions.playerType[5].curvalue = 2;
ADDRGP4 s_serveroptions+2336+540+68
CNSTI4 2
ASGNI4
line 1067
;1066:
;1067:		Q_strncpyz( s_serveroptions.playerNameBuffers[6], "sarge", 16 );
ADDRGP4 s_serveroptions+6156+96
ARGP4
ADDRGP4 $774
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1068
;1068:		Q_strncpyz( s_serveroptions.playerNameBuffers[7], "grunt", 16 );
ADDRGP4 s_serveroptions+6156+112
ARGP4
ADDRGP4 $753
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1069
;1069:		Q_strncpyz( s_serveroptions.playerNameBuffers[8], "major", 16 );
ADDRGP4 s_serveroptions+6156+128
ARGP4
ADDRGP4 $756
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1070
;1070:		if( s_serveroptions.gametype == GT_TEAM ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
NEI4 $779
line 1071
;1071:			Q_strncpyz( s_serveroptions.playerNameBuffers[9], "visor", 16 );
ADDRGP4 s_serveroptions+6156+144
ARGP4
ADDRGP4 $762
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1072
;1072:		}
ADDRGP4 $780
JUMPV
LABELV $779
line 1073
;1073:		else {
line 1074
;1074:			s_serveroptions.playerType[9].curvalue = 2;
ADDRGP4 s_serveroptions+2336+972+68
CNSTI4 2
ASGNI4
line 1075
;1075:		}
LABELV $780
line 1076
;1076:		s_serveroptions.playerType[10].curvalue = 2;
ADDRGP4 s_serveroptions+2336+1080+68
CNSTI4 2
ASGNI4
line 1077
;1077:		s_serveroptions.playerType[11].curvalue = 2;
ADDRGP4 s_serveroptions+2336+1188+68
CNSTI4 2
ASGNI4
line 1079
;1078:
;1079:		return;
ADDRGP4 $747
JUMPV
LABELV $748
line 1082
;1080:	}
;1081:
;1082:	count = 1;	// skip the first slot, reserved for a human
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1085
;1083:
;1084:	// get info for this map
;1085:	arenaInfo = UI_GetArenaInfoByMap( s_serveroptions.mapnamebuffer );
ADDRGP4 s_serveroptions+6124
ARGP4
ADDRLP4 1048
ADDRGP4 UI_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1048
INDIRP4
ASGNP4
line 1088
;1086:
;1087:	// get the bot info - we'll seed with them if any are listed
;1088:	Q_strncpyz( bots, Info_ValueForKey( arenaInfo, "bots" ), sizeof(bots) );
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 $794
ARGP4
ADDRLP4 1052
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1089
;1089:	p = &bots[0];
ADDRLP4 0
ADDRLP4 20
ASGNP4
ADDRGP4 $796
JUMPV
line 1090
;1090:	while( *p && count < PLAYER_SLOTS ) {
LABELV $798
line 1092
;1091:		//skip spaces
;1092:		while( *p == ' ' ) {
line 1093
;1093:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1094
;1094:		}
LABELV $799
line 1092
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $798
line 1095
;1095:		if( !*p ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $801
line 1096
;1096:			break;
ADDRGP4 $797
JUMPV
LABELV $801
line 1100
;1097:		}
;1098:
;1099:		// mark start of bot name
;1100:		bot = p;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $804
JUMPV
LABELV $803
line 1103
;1101:
;1102:		// skip until space of null
;1103:		while( *p && *p != ' ' ) {
line 1104
;1104:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1105
;1105:		}
LABELV $804
line 1103
ADDRLP4 1056
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $806
ADDRLP4 1056
INDIRI4
CNSTI4 32
NEI4 $803
LABELV $806
line 1106
;1106:		if( *p ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $807
line 1107
;1107:			*p++ = 0;
ADDRLP4 1060
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1060
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1060
INDIRP4
CNSTI1 0
ASGNI1
line 1108
;1108:		}
LABELV $807
line 1110
;1109:
;1110:		botInfo = UI_GetBotInfoByName( bot );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 UI_GetBotInfoByName
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 1060
INDIRP4
ASGNP4
line 1111
;1111:		bot = Info_ValueForKey( botInfo, "name" );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $644
ARGP4
ADDRLP4 1064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1064
INDIRP4
ASGNP4
line 1113
;1112:
;1113:		Q_strncpyz( s_serveroptions.playerNameBuffers[count], bot, sizeof(s_serveroptions.playerNameBuffers[count]) );
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1114
;1114:		count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1115
;1115:	}
LABELV $796
line 1090
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $811
ADDRLP4 4
INDIRI4
CNSTI4 12
LTI4 $799
LABELV $811
LABELV $797
line 1118
;1116:
;1117:	// set the rest of the bot slots to "---"
;1118:	for( n = count; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 12
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $815
JUMPV
LABELV $812
line 1119
;1119:		strcpy( s_serveroptions.playerNameBuffers[n], "--------" );
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
ARGP4
ADDRGP4 $817
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1120
;1120:	}
LABELV $813
line 1118
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $815
ADDRLP4 12
INDIRI4
CNSTI4 12
LTI4 $812
line 1123
;1121:
;1122:	// pad up to #8 as open slots
;1123:	for( ;count < 8; count++ ) {
ADDRGP4 $821
JUMPV
LABELV $818
line 1124
;1124:		s_serveroptions.playerType[count].curvalue = 0;
ADDRLP4 4
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
CNSTI4 0
ASGNI4
line 1125
;1125:	}
LABELV $819
line 1123
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $821
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $818
line 1128
;1126:
;1127:	// close off the rest by default
;1128:	for( ;count < PLAYER_SLOTS; count++ ) {
ADDRGP4 $827
JUMPV
LABELV $824
line 1129
;1129:		if( s_serveroptions.playerType[count].curvalue == 1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $828
line 1130
;1130:			s_serveroptions.playerType[count].curvalue = 2;
ADDRLP4 4
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+68
ADDP4
CNSTI4 2
ASGNI4
line 1131
;1131:		}
LABELV $828
line 1132
;1132:	}
LABELV $825
line 1128
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $827
ADDRLP4 4
INDIRI4
CNSTI4 12
LTI4 $824
line 1133
;1133:}
LABELV $747
endproc ServerOptions_InitBotNames 1068 12
bss
align 1
LABELV $835
skip 64
code
proc ServerOptions_SetMenuItems 104 16
line 1141
;1134:
;1135:
;1136:/*
;1137:=================
;1138:ServerOptions_SetMenuItems
;1139:=================
;1140:*/
;1141:static void ServerOptions_SetMenuItems( void ) {
line 1146
;1142:	static char picname[MAX_QPATH];
;1143:	char		mapname[MAX_NAMELENGTH];
;1144:	const char	*info;
;1145:
;1146:	switch( s_serveroptions.gametype ) {
ADDRLP4 20
ADDRGP4 s_serveroptions+6120
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $836
ADDRLP4 20
INDIRI4
CNSTI4 4
GTI4 $836
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $872
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $872
address $839
address $847
address $836
address $854
address $863
code
LABELV $839
LABELV $836
line 1149
;1147:	case GT_FFA:
;1148:	default:
;1149:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ffa_fraglimit" ) ) );
ADDRGP4 $552
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+996+64+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $843
ARGP4
ADDRLP4 28
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1150
;1150:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ffa_timelimit" ) ) );
ADDRGP4 $553
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+656+64+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $843
ARGP4
ADDRLP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1151
;1151:		break;
ADDRGP4 $837
JUMPV
LABELV $847
line 1154
;1152:
;1153:	case GT_TOURNAMENT:
;1154:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_tourney_fraglimit" ) ) );
ADDRGP4 $555
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+996+64+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $843
ARGP4
ADDRLP4 44
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1155
;1155:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_tourney_timelimit" ) ) );
ADDRGP4 $556
ARGP4
ADDRLP4 48
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+656+64+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $843
ARGP4
ADDRLP4 52
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1156
;1156:		break;
ADDRGP4 $837
JUMPV
LABELV $854
line 1159
;1157:
;1158:	case GT_TEAM:
;1159:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_team_fraglimit" ) ) );
ADDRGP4 $558
ARGP4
ADDRLP4 56
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+996+64+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $843
ARGP4
ADDRLP4 60
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1160
;1160:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_team_timelimit" ) ) );
ADDRGP4 $559
ARGP4
ADDRLP4 64
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+656+64+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $843
ARGP4
ADDRLP4 68
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1161
;1161:		s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_team_friendly" ) );
ADDRGP4 $560
ARGP4
ADDRLP4 72
ADDRGP4 trap_Cvar_VariableValue
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
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1676+64
ADDRLP4 76
INDIRF4
CVFI4 4
ASGNI4
line 1162
;1162:		break;
ADDRGP4 $837
JUMPV
LABELV $863
line 1165
;1163:
;1164:	case GT_CTF:
;1165:		Com_sprintf( s_serveroptions.flaglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 100, trap_Cvar_VariableValue( "ui_ctf_capturelimit" ) ) );
ADDRGP4 $562
ARGP4
ADDRLP4 80
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 84
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1336+64+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $843
ARGP4
ADDRLP4 84
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1166
;1166:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ctf_timelimit" ) ) );
ADDRGP4 $563
ARGP4
ADDRLP4 88
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 92
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+656+64+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $843
ARGP4
ADDRLP4 92
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1167
;1167:		s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_ctf_friendly" ) );
ADDRGP4 $564
ARGP4
ADDRLP4 96
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 96
INDIRF4
ARGF4
ADDRLP4 100
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1676+64
ADDRLP4 100
INDIRF4
CVFI4 4
ASGNI4
line 1168
;1168:		break;
LABELV $837
line 1171
;1169:	}
;1170:
;1171:	Q_strncpyz( s_serveroptions.hostname.field.buffer, UI_Cvar_VariableString( "sv_hostname" ), sizeof( s_serveroptions.hostname.field.buffer ) );
ADDRGP4 $573
ARGP4
ADDRLP4 24
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_serveroptions+1744+64+12
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1172
;1172:	s_serveroptions.pure.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "sv_pure" ) );
ADDRGP4 $572
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+2084+64
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 1175
;1173:
;1174:#ifdef USE_GRAPPLING_HOOK
;1175:	s_serveroptions.grapple.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "g_PureAllowHook" ) );
ADDRGP4 $580
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+6480+64
ADDRLP4 40
INDIRF4
CVFI4 4
ASGNI4
line 1178
;1176:#endif
;1177:#ifdef USE_ITEM_TIMERS
;1178:	s_serveroptions.itemTimer.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "cg_itemTimer" ) );
ADDRGP4 $885
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
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
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+6548+64
ADDRLP4 48
INDIRF4
CVFI4 4
ASGNI4
line 1181
;1179:#endif
;1180:#ifdef USE_DEATHCAM
;1181:	s_serveroptions.allowDeathCam.curvalue = Com_Clamp(0, 1, trap_Cvar_VariableValue("cg_allowDeathCam"));
ADDRGP4 $888
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableValue
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
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+6616+64
ADDRLP4 56
INDIRF4
CVFI4 4
ASGNI4
line 1184
;1182:#endif
;1183:	// set the map pic
;1184:	info = UI_GetArenaInfoByNumber( s_startserver.maplist[ s_startserver.currentmap ]);
ADDRGP4 s_startserver+2024
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2040
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 60
INDIRP4
ASGNP4
line 1185
;1185:	Q_strncpyz( mapname, Info_ValueForKey( info, "map" ), sizeof( mapname ) );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $105
ARGP4
ADDRLP4 64
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1186
;1186:	Q_strupr( mapname );
ADDRLP4 0
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 1187
;1187:	Com_sprintf( picname, sizeof( picname ), "levelshots/%s", mapname );
ADDRGP4 $835
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $106
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1188
;1188:	s_serveroptions.mappic.generic.name = picname;
ADDRGP4 s_serveroptions+364+4
ADDRGP4 $835
ASGNP4
line 1191
;1189:
;1190:	// set the map name
;1191:	strcpy( s_serveroptions.mapnamebuffer, s_startserver.mapname.string );
ADDRGP4 s_serveroptions+6124
ARGP4
ADDRGP4 s_startserver+1852+64
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1192
;1192:	Q_strupr( s_serveroptions.mapnamebuffer );
ADDRGP4 s_serveroptions+6124
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 1195
;1193:
;1194:	// get the player selections initialized
;1195:	ServerOptions_InitPlayerItems();
ADDRGP4 ServerOptions_InitPlayerItems
CALLV
pop
line 1196
;1196:	ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 1199
;1197:
;1198:	// seed bot names
;1199:	ServerOptions_InitBotNames();
ADDRGP4 ServerOptions_InitBotNames
CALLV
pop
line 1200
;1200:	ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 1201
;1201:}
LABELV $834
endproc ServerOptions_SetMenuItems 104 16
proc PlayerName_Draw 36 20
line 1208
;1202:
;1203:/*
;1204:=================
;1205:PlayerName_Draw
;1206:=================
;1207:*/
;1208:static void PlayerName_Draw( void *item ) {
line 1215
;1209:	menutext_s	*s;
;1210:	float		*color;
;1211:	int			x, y;
;1212:	int			style;
;1213:	qboolean	focus;
;1214:
;1215:	s = (menutext_s *)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1217
;1216:
;1217:	x = s->generic.x;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1218
;1218:	y =	s->generic.y;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 1220
;1219:
;1220:	style = UI_SMALLFONT;
ADDRLP4 16
CNSTI4 16
ASGNI4
line 1221
;1221:	focus = (s->generic.parent->cursor == s->generic.menuPosition);
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
NEI4 $899
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $900
JUMPV
LABELV $899
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $900
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 1223
;1222:
;1223:	if ( s->generic.flags & QMF_GRAYED )
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $901
line 1224
;1224:		color = text_color_disabled;
ADDRLP4 4
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $902
JUMPV
LABELV $901
line 1225
;1225:	else if ( focus )
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $903
line 1226
;1226:	{
line 1227
;1227:		color = text_color_highlight;
ADDRLP4 4
ADDRGP4 text_color_highlight
ASGNP4
line 1228
;1228:		style |= UI_PULSE;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1229
;1229:	}
ADDRGP4 $904
JUMPV
LABELV $903
line 1230
;1230:	else if ( s->generic.flags & QMF_BLINK )
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 1
BANDU4
CNSTU4 0
EQU4 $905
line 1231
;1231:	{
line 1232
;1232:		color = text_color_highlight;
ADDRLP4 4
ADDRGP4 text_color_highlight
ASGNP4
line 1233
;1233:		style |= UI_BLINK;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1234
;1234:	}
ADDRGP4 $906
JUMPV
LABELV $905
line 1236
;1235:	else
;1236:		color = text_color_normal;
ADDRLP4 4
ADDRGP4 text_color_normal
ASGNP4
LABELV $906
LABELV $904
LABELV $902
line 1238
;1237:
;1238:	if ( focus )
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $907
line 1239
;1239:	{
line 1241
;1240:		// draw cursor
;1241:		UI_FillRect( s->generic.left, s->generic.top, s->generic.right-s->generic.left+1, s->generic.bottom-s->generic.top+1, listbar_color ); 
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
CVIF4 4
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 1242
;1242:		UI_DrawChar( x, y, 13, UI_CENTER|UI_BLINK|UI_SMALLFONT, color);
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTI4 4113
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 1243
;1243:	}
LABELV $907
line 1245
;1244:
;1245:	UI_DrawString( x - SMALLCHAR_WIDTH, y, s->generic.name, style|UI_RIGHT, color );
ADDRLP4 8
INDIRI4
CNSTI4 8
SUBI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
CNSTI4 2
BORI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1246
;1246:	UI_DrawString( x + SMALLCHAR_WIDTH, y, s->string, style|UI_LEFT, color );
ADDRLP4 8
INDIRI4
CNSTI4 8
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1247
;1247:}
LABELV $897
endproc PlayerName_Draw 36 20
proc ServerOptions_MenuInit 52 12
line 1257
;1248:
;1249:
;1250:/*
;1251:=================
;1252:ServerOptions_MenuInit
;1253:=================
;1254:*/
;1255:#define OPTIONS_X	456
;1256:
;1257:static void ServerOptions_MenuInit( qboolean multiplayer ) {
line 1261
;1258:	int		y;
;1259:	int		n;
;1260:
;1261:	memset( &s_serveroptions, 0 ,sizeof(serveroptions_t) );
ADDRGP4 s_serveroptions
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6684
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1262
;1262:	s_serveroptions.multiplayer = multiplayer;
ADDRGP4 s_serveroptions+6116
ADDRFP4 0
INDIRI4
ASGNI4
line 1263
;1263:	s_serveroptions.gametype = (int)Com_Clamp( 0, GT_MAX_GAME_TYPE-1, trap_Cvar_VariableValue( "g_gameType" ) );
ADDRGP4 $201
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1082130432
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+6120
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1264
;1264:	s_serveroptions.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "sv_punkbuster" ) );
ADDRGP4 $577
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+6372+68
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 1266
;1265:
;1266:	ServerOptions_Cache();
ADDRGP4 ServerOptions_Cache
CALLV
pop
line 1268
;1267:
;1268:	s_serveroptions.menu.wrapAround = qtrue;
ADDRGP4 s_serveroptions+276
CNSTI4 1
ASGNI4
line 1269
;1269:	s_serveroptions.menu.fullscreen = qtrue;
ADDRGP4 s_serveroptions+280
CNSTI4 1
ASGNI4
line 1271
;1270:
;1271:	s_serveroptions.banner.generic.type			= MTYPE_BTEXT;
ADDRGP4 s_serveroptions+288
CNSTI4 10
ASGNI4
line 1272
;1272:	s_serveroptions.banner.generic.x			= 320;
ADDRGP4 s_serveroptions+288+12
CNSTI4 320
ASGNI4
line 1273
;1273:	s_serveroptions.banner.generic.y			= 16;
ADDRGP4 s_serveroptions+288+16
CNSTI4 16
ASGNI4
line 1274
;1274:	s_serveroptions.banner.string  				= "GAME SERVER";
ADDRGP4 s_serveroptions+288+64
ADDRGP4 $234
ASGNP4
line 1275
;1275:	s_serveroptions.banner.color  				= color_white;
ADDRGP4 s_serveroptions+288+72
ADDRGP4 color_white
ASGNP4
line 1276
;1276:	s_serveroptions.banner.style  				= UI_CENTER;
ADDRGP4 s_serveroptions+288+68
CNSTI4 1
ASGNI4
line 1278
;1277:
;1278:	s_serveroptions.mappic.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_serveroptions+364
CNSTI4 6
ASGNI4
line 1279
;1279:	s_serveroptions.mappic.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_serveroptions+364+44
CNSTU4 16388
ASGNU4
line 1280
;1280:	s_serveroptions.mappic.generic.x			= 352;
ADDRGP4 s_serveroptions+364+12
CNSTI4 352
ASGNI4
line 1281
;1281:	s_serveroptions.mappic.generic.y			= 80;
ADDRGP4 s_serveroptions+364+16
CNSTI4 80
ASGNI4
line 1282
;1282:	s_serveroptions.mappic.width				= 160;
ADDRGP4 s_serveroptions+364+80
CNSTI4 160
ASGNI4
line 1283
;1283:	s_serveroptions.mappic.height				= 120;
ADDRGP4 s_serveroptions+364+84
CNSTI4 120
ASGNI4
line 1284
;1284:	s_serveroptions.mappic.errorpic				= GAMESERVER_UNKNOWNMAP;
ADDRGP4 s_serveroptions+364+68
ADDRGP4 $305
ASGNP4
line 1285
;1285:	s_serveroptions.mappic.generic.ownerdraw	= ServerOptions_LevelshotDraw;
ADDRGP4 s_serveroptions+364+56
ADDRGP4 ServerOptions_LevelshotDraw
ASGNP4
line 1287
;1286:
;1287:	s_serveroptions.picframe.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_serveroptions+456
CNSTI4 6
ASGNI4
line 1288
;1288:	s_serveroptions.picframe.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE|QMF_HIGHLIGHT;
ADDRGP4 s_serveroptions+456+44
CNSTU4 16452
ASGNU4
line 1289
;1289:	s_serveroptions.picframe.generic.x			= 352 - 38;
ADDRGP4 s_serveroptions+456+12
CNSTI4 314
ASGNI4
line 1290
;1290:	s_serveroptions.picframe.generic.y			= 80 - 40;
ADDRGP4 s_serveroptions+456+16
CNSTI4 40
ASGNI4
line 1291
;1291:	s_serveroptions.picframe.width  			= 320;
ADDRGP4 s_serveroptions+456+80
CNSTI4 320
ASGNI4
line 1292
;1292:	s_serveroptions.picframe.height  			= 320;
ADDRGP4 s_serveroptions+456+84
CNSTI4 320
ASGNI4
line 1293
;1293:	s_serveroptions.picframe.focuspic			= GAMESERVER_SELECT;
ADDRGP4 s_serveroptions+456+64
ADDRGP4 $333
ASGNP4
line 1295
;1294:
;1295:	y = 272;
ADDRLP4 4
CNSTI4 272
ASGNI4
line 1296
;1296:	if( s_serveroptions.gametype != GT_CTF ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 4
EQI4 $955
line 1297
;1297:		s_serveroptions.fraglimit.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+996
CNSTI4 4
ASGNI4
line 1298
;1298:		s_serveroptions.fraglimit.generic.name       = "Frag Limit:";
ADDRGP4 s_serveroptions+996+4
ADDRGP4 $961
ASGNP4
line 1299
;1299:		s_serveroptions.fraglimit.generic.flags      = QMF_NUMBERSONLY|QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+996+44
CNSTU4 290
ASGNU4
line 1300
;1300:		s_serveroptions.fraglimit.generic.x	         = OPTIONS_X;
ADDRGP4 s_serveroptions+996+12
CNSTI4 456
ASGNI4
line 1301
;1301:		s_serveroptions.fraglimit.generic.y	         = y;
ADDRGP4 s_serveroptions+996+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1302
;1302:		s_serveroptions.fraglimit.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+996+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1303
;1303:		s_serveroptions.fraglimit.field.widthInChars = 3;
ADDRGP4 s_serveroptions+996+64+8
CNSTI4 3
ASGNI4
line 1304
;1304:		s_serveroptions.fraglimit.field.maxchars     = 3;
ADDRGP4 s_serveroptions+996+64+268
CNSTI4 3
ASGNI4
line 1305
;1305:	}
ADDRGP4 $956
JUMPV
LABELV $955
line 1306
;1306:	else {
line 1307
;1307:		s_serveroptions.flaglimit.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+1336
CNSTI4 4
ASGNI4
line 1308
;1308:		s_serveroptions.flaglimit.generic.name       = "Capture Limit:";
ADDRGP4 s_serveroptions+1336+4
ADDRGP4 $979
ASGNP4
line 1309
;1309:		s_serveroptions.flaglimit.generic.flags      = QMF_NUMBERSONLY|QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1336+44
CNSTU4 290
ASGNU4
line 1310
;1310:		s_serveroptions.flaglimit.generic.x	         = OPTIONS_X;
ADDRGP4 s_serveroptions+1336+12
CNSTI4 456
ASGNI4
line 1311
;1311:		s_serveroptions.flaglimit.generic.y	         = y;
ADDRGP4 s_serveroptions+1336+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1312
;1312:		s_serveroptions.flaglimit.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+1336+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1313
;1313:		s_serveroptions.flaglimit.field.widthInChars = 3;
ADDRGP4 s_serveroptions+1336+64+8
CNSTI4 3
ASGNI4
line 1314
;1314:		s_serveroptions.flaglimit.field.maxchars     = 3;
ADDRGP4 s_serveroptions+1336+64+268
CNSTI4 3
ASGNI4
line 1315
;1315:	}
LABELV $956
line 1317
;1316:
;1317:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1318
;1318:	s_serveroptions.timelimit.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+656
CNSTI4 4
ASGNI4
line 1319
;1319:	s_serveroptions.timelimit.generic.name       = "Time Limit:";
ADDRGP4 s_serveroptions+656+4
ADDRGP4 $997
ASGNP4
line 1320
;1320:	s_serveroptions.timelimit.generic.flags      = QMF_NUMBERSONLY|QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+656+44
CNSTU4 290
ASGNU4
line 1321
;1321:	s_serveroptions.timelimit.generic.x	         = OPTIONS_X;
ADDRGP4 s_serveroptions+656+12
CNSTI4 456
ASGNI4
line 1322
;1322:	s_serveroptions.timelimit.generic.y	         = y;
ADDRGP4 s_serveroptions+656+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1323
;1323:	s_serveroptions.timelimit.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+656+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1324
;1324:	s_serveroptions.timelimit.field.widthInChars = 3;
ADDRGP4 s_serveroptions+656+64+8
CNSTI4 3
ASGNI4
line 1325
;1325:	s_serveroptions.timelimit.field.maxchars     = 3;
ADDRGP4 s_serveroptions+656+64+268
CNSTI4 3
ASGNI4
line 1327
;1326:
;1327:	if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
LTI4 $1012
line 1328
;1328:		y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1329
;1329:		s_serveroptions.friendlyfire.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+1676
CNSTI4 5
ASGNI4
line 1330
;1330:		s_serveroptions.friendlyfire.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1676+44
CNSTU4 258
ASGNU4
line 1331
;1331:		s_serveroptions.friendlyfire.generic.x	      = OPTIONS_X;
ADDRGP4 s_serveroptions+1676+12
CNSTI4 456
ASGNI4
line 1332
;1332:		s_serveroptions.friendlyfire.generic.y	      = y;
ADDRGP4 s_serveroptions+1676+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1333
;1333:		s_serveroptions.friendlyfire.generic.name	  = "Friendly Fire:";
ADDRGP4 s_serveroptions+1676+4
ADDRGP4 $1024
ASGNP4
line 1334
;1334:	}
LABELV $1012
line 1336
;1335:
;1336:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1337
;1337:	s_serveroptions.pure.generic.type			= MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+2084
CNSTI4 5
ASGNI4
line 1338
;1338:	s_serveroptions.pure.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2084+44
CNSTU4 258
ASGNU4
line 1339
;1339:	s_serveroptions.pure.generic.x				= OPTIONS_X;
ADDRGP4 s_serveroptions+2084+12
CNSTI4 456
ASGNI4
line 1340
;1340:	s_serveroptions.pure.generic.y				= y;
ADDRGP4 s_serveroptions+2084+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1341
;1341:	s_serveroptions.pure.generic.name			= "Pure Server:";
ADDRGP4 s_serveroptions+2084+4
ADDRGP4 $1034
ASGNP4
line 1343
;1342:
;1343:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+6116
INDIRI4
CNSTI4 0
EQI4 $1035
line 1344
;1344:		y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1345
;1345:		s_serveroptions.dedicated.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_serveroptions+548
CNSTI4 3
ASGNI4
line 1346
;1346:		s_serveroptions.dedicated.generic.id		= ID_DEDICATED;
ADDRGP4 s_serveroptions+548+8
CNSTI4 22
ASGNI4
line 1347
;1347:		s_serveroptions.dedicated.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+548+44
CNSTU4 258
ASGNU4
line 1348
;1348:		s_serveroptions.dedicated.generic.callback	= ServerOptions_Event;
ADDRGP4 s_serveroptions+548+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1349
;1349:		s_serveroptions.dedicated.generic.x			= OPTIONS_X;
ADDRGP4 s_serveroptions+548+12
CNSTI4 456
ASGNI4
line 1350
;1350:		s_serveroptions.dedicated.generic.y			= y;
ADDRGP4 s_serveroptions+548+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1351
;1351:		s_serveroptions.dedicated.generic.name		= "Dedicated:";
ADDRGP4 s_serveroptions+548+4
ADDRGP4 $1051
ASGNP4
line 1352
;1352:		s_serveroptions.dedicated.itemnames			= dedicated_list;
ADDRGP4 s_serveroptions+548+88
ADDRGP4 dedicated_list
ASGNP4
line 1353
;1353:	}
LABELV $1035
line 1355
;1354:
;1355:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+6116
INDIRI4
CNSTI4 0
EQI4 $1054
line 1356
;1356:		y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1357
;1357:		s_serveroptions.hostname.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+1744
CNSTI4 4
ASGNI4
line 1358
;1358:		s_serveroptions.hostname.generic.name       = "Hostname:";
ADDRGP4 s_serveroptions+1744+4
ADDRGP4 $1060
ASGNP4
line 1359
;1359:		s_serveroptions.hostname.generic.flags      = QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1744+44
CNSTU4 2
ASGNU4
line 1360
;1360:		s_serveroptions.hostname.generic.x          = OPTIONS_X;
ADDRGP4 s_serveroptions+1744+12
CNSTI4 456
ASGNI4
line 1361
;1361:		s_serveroptions.hostname.generic.y	        = y;
ADDRGP4 s_serveroptions+1744+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1362
;1362:		s_serveroptions.hostname.field.widthInChars = 18;
ADDRGP4 s_serveroptions+1744+64+8
CNSTI4 18
ASGNI4
line 1363
;1363:		s_serveroptions.hostname.field.maxchars     = 64;
ADDRGP4 s_serveroptions+1744+64+268
CNSTI4 64
ASGNI4
line 1364
;1364:	}
LABELV $1054
line 1366
;1365:
;1366:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1367
;1367:	s_serveroptions.punkbuster.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 s_serveroptions+6372
CNSTI4 3
ASGNI4
line 1368
;1368:	s_serveroptions.punkbuster.generic.name			= "Punkbuster:";
ADDRGP4 s_serveroptions+6372+4
ADDRGP4 $1076
ASGNP4
line 1369
;1369:	s_serveroptions.punkbuster.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+6372+44
CNSTU4 258
ASGNU4
line 1370
;1370:	s_serveroptions.punkbuster.generic.id			= 0;
ADDRGP4 s_serveroptions+6372+8
CNSTI4 0
ASGNI4
line 1371
;1371:	s_serveroptions.punkbuster.generic.x				= OPTIONS_X;
ADDRGP4 s_serveroptions+6372+12
CNSTI4 456
ASGNI4
line 1372
;1372:	s_serveroptions.punkbuster.generic.y				= y;
ADDRGP4 s_serveroptions+6372+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1373
;1373:	s_serveroptions.punkbuster.itemnames				= punkbuster_items;
ADDRGP4 s_serveroptions+6372+88
ADDRGP4 punkbuster_items
ASGNP4
line 1377
;1374:	
;1375:	// Experimental
;1376:#ifdef USE_GRAPPLING_HOOK
;1377:	y += BIGCHAR_HEIGHT + 10;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 26
ADDI4
ASGNI4
line 1378
;1378:	s_serveroptions.grapple.generic.type = MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+6480
CNSTI4 5
ASGNI4
line 1379
;1379:	s_serveroptions.grapple.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 s_serveroptions+6480+44
CNSTU4 258
ASGNU4
line 1380
;1380:	s_serveroptions.grapple.generic.x = OPTIONS_X;
ADDRGP4 s_serveroptions+6480+12
CNSTI4 456
ASGNI4
line 1381
;1381:	s_serveroptions.grapple.generic.y = y;
ADDRGP4 s_serveroptions+6480+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1382
;1382:	s_serveroptions.grapple.generic.name = "Grapple:";
ADDRGP4 s_serveroptions+6480+4
ADDRGP4 $1096
ASGNP4
line 1385
;1383:#endif
;1384:#ifdef USE_ITEM_TIMERS
;1385:	y += BIGCHAR_HEIGHT + 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1386
;1386:	s_serveroptions.itemTimer.generic.type = MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+6548
CNSTI4 5
ASGNI4
line 1387
;1387:	s_serveroptions.itemTimer.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 s_serveroptions+6548+44
CNSTU4 258
ASGNU4
line 1388
;1388:	s_serveroptions.itemTimer.generic.x = OPTIONS_X;
ADDRGP4 s_serveroptions+6548+12
CNSTI4 456
ASGNI4
line 1389
;1389:	s_serveroptions.itemTimer.generic.y = y;
ADDRGP4 s_serveroptions+6548+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1390
;1390:	s_serveroptions.itemTimer.generic.name = "PowerUp counter:";
ADDRGP4 s_serveroptions+6548+4
ADDRGP4 $1106
ASGNP4
line 1393
;1391:#endif
;1392:#ifdef USE_DEATHCAM
;1393:	y += BIGCHAR_HEIGHT + 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1394
;1394:	s_serveroptions.allowDeathCam.generic.type = MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+6616
CNSTI4 5
ASGNI4
line 1395
;1395:	s_serveroptions.allowDeathCam.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 s_serveroptions+6616+44
CNSTU4 258
ASGNU4
line 1396
;1396:	s_serveroptions.allowDeathCam.generic.x = OPTIONS_X;
ADDRGP4 s_serveroptions+6616+12
CNSTI4 456
ASGNI4
line 1397
;1397:	s_serveroptions.allowDeathCam.generic.y = y;
ADDRGP4 s_serveroptions+6616+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1398
;1398:	s_serveroptions.allowDeathCam.generic.name = "Allow deathcam:";
ADDRGP4 s_serveroptions+6616+4
ADDRGP4 $1116
ASGNP4
line 1401
;1399:#endif
;1400:
;1401:	y = 80;
ADDRLP4 4
CNSTI4 80
ASGNI4
line 1402
;1402:	s_serveroptions.botSkill.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 s_serveroptions+2152
CNSTI4 3
ASGNI4
line 1403
;1403:	s_serveroptions.botSkill.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2152+44
CNSTU4 258
ASGNU4
line 1404
;1404:	s_serveroptions.botSkill.generic.name			= "Bot Skill:  ";
ADDRGP4 s_serveroptions+2152+4
ADDRGP4 $1122
ASGNP4
line 1405
;1405:	s_serveroptions.botSkill.generic.x				= 32 + (strlen(s_serveroptions.botSkill.generic.name) + 2 ) * SMALLCHAR_WIDTH;
ADDRGP4 s_serveroptions+2152+4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 s_serveroptions+2152+12
ADDRLP4 24
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 16
ADDI4
CNSTI4 32
ADDI4
ASGNI4
line 1406
;1406:	s_serveroptions.botSkill.generic.y				= y;
ADDRGP4 s_serveroptions+2152+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1407
;1407:	s_serveroptions.botSkill.itemnames				= botSkill_list;
ADDRGP4 s_serveroptions+2152+88
ADDRGP4 botSkill_list
ASGNP4
line 1408
;1408:	s_serveroptions.botSkill.curvalue				= 1;
ADDRGP4 s_serveroptions+2152+68
CNSTI4 1
ASGNI4
line 1410
;1409:
;1410:	y += ( 2 * SMALLCHAR_HEIGHT );
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 1411
;1411:	s_serveroptions.player0.generic.type			= MTYPE_TEXT;
ADDRGP4 s_serveroptions+2260
CNSTI4 7
ASGNI4
line 1412
;1412:	s_serveroptions.player0.generic.flags			= QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2260+44
CNSTU4 2
ASGNU4
line 1413
;1413:	s_serveroptions.player0.generic.x				= 32 + SMALLCHAR_WIDTH;
ADDRGP4 s_serveroptions+2260+12
CNSTI4 40
ASGNI4
line 1414
;1414:	s_serveroptions.player0.generic.y				= y;
ADDRGP4 s_serveroptions+2260+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1415
;1415:	s_serveroptions.player0.color					= color_orange;
ADDRGP4 s_serveroptions+2260+72
ADDRGP4 color_orange
ASGNP4
line 1416
;1416:	s_serveroptions.player0.style					= UI_LEFT|UI_SMALLFONT;
ADDRGP4 s_serveroptions+2260+68
CNSTI4 16
ASGNI4
line 1418
;1417:
;1418:	for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1144
line 1419
;1419:		s_serveroptions.playerType[n].generic.type		= MTYPE_SPINCONTROL;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336
ADDP4
CNSTI4 3
ASGNI4
line 1420
;1420:		s_serveroptions.playerType[n].generic.flags		= QMF_SMALLFONT;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+44
ADDP4
CNSTU4 2
ASGNU4
line 1421
;1421:		s_serveroptions.playerType[n].generic.id		= ID_PLAYER_TYPE;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+8
ADDP4
CNSTI4 20
ASGNI4
line 1422
;1422:		s_serveroptions.playerType[n].generic.callback	= ServerOptions_Event;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+48
ADDP4
ADDRGP4 ServerOptions_Event
ASGNP4
line 1423
;1423:		s_serveroptions.playerType[n].generic.x			= 32;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+12
ADDP4
CNSTI4 32
ASGNI4
line 1424
;1424:		s_serveroptions.playerType[n].generic.y			= y;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1425
;1425:		s_serveroptions.playerType[n].itemnames			= playerType_list;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336+88
ADDP4
ADDRGP4 playerType_list
ASGNP4
line 1427
;1426:
;1427:		s_serveroptions.playerName[n].generic.type		= MTYPE_TEXT;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632
ADDP4
CNSTI4 7
ASGNI4
line 1428
;1428:		s_serveroptions.playerName[n].generic.flags		= QMF_SMALLFONT;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+44
ADDP4
CNSTU4 2
ASGNU4
line 1429
;1429:		s_serveroptions.playerName[n].generic.x			= 96;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+12
ADDP4
CNSTI4 96
ASGNI4
line 1430
;1430:		s_serveroptions.playerName[n].generic.y			= y;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1431
;1431:		s_serveroptions.playerName[n].generic.callback	= ServerOptions_PlayerNameEvent;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+48
ADDP4
ADDRGP4 ServerOptions_PlayerNameEvent
ASGNP4
line 1432
;1432:		s_serveroptions.playerName[n].generic.id		= n;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1433
;1433:		s_serveroptions.playerName[n].generic.ownerdraw	= PlayerName_Draw;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+56
ADDP4
ADDRGP4 PlayerName_Draw
ASGNP4
line 1434
;1434:		s_serveroptions.playerName[n].color				= color_orange;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+72
ADDP4
ADDRGP4 color_orange
ASGNP4
line 1435
;1435:		s_serveroptions.playerName[n].style				= UI_SMALLFONT;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+68
ADDP4
CNSTI4 16
ASGNI4
line 1436
;1436:		s_serveroptions.playerName[n].string			= s_serveroptions.playerNameBuffers[n];
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+64
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+6156
ADDP4
ASGNP4
line 1437
;1437:		s_serveroptions.playerName[n].generic.top		= s_serveroptions.playerName[n].generic.y;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+24
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+16
ADDP4
INDIRI4
ASGNI4
line 1438
;1438:		s_serveroptions.playerName[n].generic.bottom	= s_serveroptions.playerName[n].generic.y + SMALLCHAR_HEIGHT;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+32
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+16
ADDP4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1439
;1439:		s_serveroptions.playerName[n].generic.left		= s_serveroptions.playerName[n].generic.x - SMALLCHAR_HEIGHT/ 2;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+20
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+12
ADDP4
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 1440
;1440:		s_serveroptions.playerName[n].generic.right		= s_serveroptions.playerName[n].generic.x + 16 * SMALLCHAR_WIDTH;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+28
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632+12
ADDP4
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 1442
;1441:
;1442:		s_serveroptions.playerTeam[n].generic.type		= MTYPE_SPINCONTROL;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544
ADDP4
CNSTI4 3
ASGNI4
line 1443
;1443:		s_serveroptions.playerTeam[n].generic.flags		= QMF_SMALLFONT;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+44
ADDP4
CNSTU4 2
ASGNU4
line 1444
;1444:		s_serveroptions.playerTeam[n].generic.x			= 240;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+12
ADDP4
CNSTI4 240
ASGNI4
line 1445
;1445:		s_serveroptions.playerTeam[n].generic.y			= y;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1446
;1446:		s_serveroptions.playerTeam[n].itemnames			= playerTeam_list;
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544+88
ADDP4
ADDRGP4 playerTeam_list
ASGNP4
line 1448
;1447:
;1448:		y += ( SMALLCHAR_HEIGHT + 4 );
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 1449
;1449:	}
LABELV $1145
line 1418
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $1144
line 1451
;1450:
;1451:	s_serveroptions.back.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_serveroptions+6024
CNSTI4 6
ASGNI4
line 1452
;1452:	s_serveroptions.back.generic.name     = GAMESERVER_BACK0;
ADDRGP4 s_serveroptions+6024+4
ADDRGP4 $400
ASGNP4
line 1453
;1453:	s_serveroptions.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serveroptions+6024+44
CNSTU4 260
ASGNU4
line 1454
;1454:	s_serveroptions.back.generic.callback = ServerOptions_Event;
ADDRGP4 s_serveroptions+6024+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1455
;1455:	s_serveroptions.back.generic.id	      = ID_BACK;
ADDRGP4 s_serveroptions+6024+8
CNSTI4 24
ASGNI4
line 1456
;1456:	s_serveroptions.back.generic.x		  = 0;
ADDRGP4 s_serveroptions+6024+12
CNSTI4 0
ASGNI4
line 1457
;1457:	s_serveroptions.back.generic.y		  = 480-64;
ADDRGP4 s_serveroptions+6024+16
CNSTI4 416
ASGNI4
line 1458
;1458:	s_serveroptions.back.width  		  = 128;
ADDRGP4 s_serveroptions+6024+80
CNSTI4 128
ASGNI4
line 1459
;1459:	s_serveroptions.back.height  		  = 64;
ADDRGP4 s_serveroptions+6024+84
CNSTI4 64
ASGNI4
line 1460
;1460:	s_serveroptions.back.focuspic         = GAMESERVER_BACK1;
ADDRGP4 s_serveroptions+6024+64
ADDRGP4 $417
ASGNP4
line 1462
;1461:
;1462:	s_serveroptions.next.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_serveroptions+5932
CNSTI4 6
ASGNI4
line 1463
;1463:	s_serveroptions.next.generic.name     = GAMESERVER_NEXT0;
ADDRGP4 s_serveroptions+5932+4
ADDRGP4 $421
ASGNP4
line 1464
;1464:	s_serveroptions.next.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_INACTIVE|QMF_GRAYED|QMF_HIDDEN;
ADDRGP4 s_serveroptions+5932+44
CNSTU4 28944
ASGNU4
line 1465
;1465:	s_serveroptions.next.generic.callback = ServerOptions_Event;
ADDRGP4 s_serveroptions+5932+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1466
;1466:	s_serveroptions.next.generic.id	      = ID_STARTSERVERNEXT;
ADDRGP4 s_serveroptions+5932+8
CNSTI4 18
ASGNI4
line 1467
;1467:	s_serveroptions.next.generic.x		  = 640;
ADDRGP4 s_serveroptions+5932+12
CNSTI4 640
ASGNI4
line 1468
;1468:	s_serveroptions.next.generic.y		  = 480-64-72;
ADDRGP4 s_serveroptions+5932+16
CNSTI4 344
ASGNI4
line 1469
;1469:	s_serveroptions.next.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+5932+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1470
;1470:	s_serveroptions.next.width  		  = 128;
ADDRGP4 s_serveroptions+5932+80
CNSTI4 128
ASGNI4
line 1471
;1471:	s_serveroptions.next.height  		  = 64;
ADDRGP4 s_serveroptions+5932+84
CNSTI4 64
ASGNI4
line 1472
;1472:	s_serveroptions.next.focuspic         = GAMESERVER_NEXT1;
ADDRGP4 s_serveroptions+5932+64
ADDRGP4 $438
ASGNP4
line 1474
;1473:
;1474:	s_serveroptions.go.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_serveroptions+5840
CNSTI4 6
ASGNI4
line 1475
;1475:	s_serveroptions.go.generic.name     = GAMESERVER_FIGHT0;
ADDRGP4 s_serveroptions+5840+4
ADDRGP4 $1249
ASGNP4
line 1476
;1476:	s_serveroptions.go.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serveroptions+5840+44
CNSTU4 272
ASGNU4
line 1477
;1477:	s_serveroptions.go.generic.callback = ServerOptions_Event;
ADDRGP4 s_serveroptions+5840+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1478
;1478:	s_serveroptions.go.generic.id	    = ID_GO;
ADDRGP4 s_serveroptions+5840+8
CNSTI4 23
ASGNI4
line 1479
;1479:	s_serveroptions.go.generic.x		= 640;
ADDRGP4 s_serveroptions+5840+12
CNSTI4 640
ASGNI4
line 1480
;1480:	s_serveroptions.go.generic.y		= 480-64;
ADDRGP4 s_serveroptions+5840+16
CNSTI4 416
ASGNI4
line 1481
;1481:	s_serveroptions.go.width  		    = 128;
ADDRGP4 s_serveroptions+5840+80
CNSTI4 128
ASGNI4
line 1482
;1482:	s_serveroptions.go.height  		    = 64;
ADDRGP4 s_serveroptions+5840+84
CNSTI4 64
ASGNI4
line 1483
;1483:	s_serveroptions.go.focuspic         = GAMESERVER_FIGHT1;
ADDRGP4 s_serveroptions+5840+64
ADDRGP4 $1266
ASGNP4
line 1485
;1484:
;1485:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.banner );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1487
;1486:
;1487:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.mappic );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1488
;1488:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.picframe );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1490
;1489:
;1490:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.botSkill );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2152
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1491
;1491:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.player0 );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2260
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1492
;1492:	for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1272
line 1493
;1493:		if( n != 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1276
line 1494
;1494:			Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.playerType[n] );
ADDRGP4 s_serveroptions
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+2336
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1495
;1495:		}
LABELV $1276
line 1496
;1496:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.playerName[n] );
ADDRGP4 s_serveroptions
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 s_serveroptions+3632
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1497
;1497:		if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
LTI4 $1280
line 1498
;1498:			Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.playerTeam[n] );
ADDRGP4 s_serveroptions
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 108
MULI4
ADDRGP4 s_serveroptions+4544
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1499
;1499:		}
LABELV $1280
line 1500
;1500:	}
LABELV $1273
line 1492
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $1272
line 1502
;1501:
;1502:	if( s_serveroptions.gametype != GT_CTF ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 4
EQI4 $1284
line 1503
;1503:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.fraglimit );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+996
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1504
;1504:	}
ADDRGP4 $1285
JUMPV
LABELV $1284
line 1505
;1505:	else {
line 1506
;1506:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.flaglimit );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1336
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1507
;1507:	}
LABELV $1285
line 1508
;1508:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.timelimit );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+656
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1509
;1509:	if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+6120
INDIRI4
CNSTI4 3
LTI4 $1290
line 1510
;1510:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.friendlyfire );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1676
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1511
;1511:	}
LABELV $1290
line 1512
;1512:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.pure );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2084
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1513
;1513:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+6116
INDIRI4
CNSTI4 0
EQI4 $1295
line 1514
;1514:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.dedicated );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1515
;1515:	}
LABELV $1295
line 1516
;1516:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+6116
INDIRI4
CNSTI4 0
EQI4 $1299
line 1517
;1517:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.hostname );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1744
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1518
;1518:	}
LABELV $1299
line 1520
;1519:
;1520:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.back );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+6024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1521
;1521:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.next );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+5932
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1522
;1522:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.go );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+5840
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1524
;1523:
;1524:	Menu_AddItem( &s_serveroptions.menu, (void*) &s_serveroptions.punkbuster );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+6372
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1526
;1525:#ifdef USE_GRAPPLING_HOOK
;1526:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.grapple);
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+6480
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1529
;1527:#endif
;1528:#ifdef USE_ITEM_TIMERS
;1529:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.itemTimer);
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+6548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1532
;1530:#endif
;1531:#ifdef USE_DEATHCAM
;1532:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.allowDeathCam);
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+6616
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1535
;1533:#endif
;1534:
;1535:	ServerOptions_SetMenuItems();
ADDRGP4 ServerOptions_SetMenuItems
CALLV
pop
line 1536
;1536:}
LABELV $909
endproc ServerOptions_MenuInit 52 12
export ServerOptions_Cache
proc ServerOptions_Cache 0 4
line 1543
;1537:
;1538:/*
;1539:=================
;1540:ServerOptions_Cache
;1541:=================
;1542:*/
;1543:void ServerOptions_Cache( void ) {
line 1544
;1544:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK0 );
ADDRGP4 $400
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1545
;1545:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK1 );
ADDRGP4 $417
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1546
;1546:	trap_R_RegisterShaderNoMip( GAMESERVER_FIGHT0 );
ADDRGP4 $1249
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1547
;1547:	trap_R_RegisterShaderNoMip( GAMESERVER_FIGHT1 );
ADDRGP4 $1266
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1548
;1548:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECT );
ADDRGP4 $333
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1549
;1549:	trap_R_RegisterShaderNoMip( GAMESERVER_UNKNOWNMAP );
ADDRGP4 $305
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1550
;1550:}
LABELV $1310
endproc ServerOptions_Cache 0 4
proc UI_ServerOptionsMenu 0 4
line 1558
;1551:
;1552:
;1553:/*
;1554:=================
;1555:UI_ServerOptionsMenu
;1556:=================
;1557:*/
;1558:static void UI_ServerOptionsMenu( qboolean multiplayer ) {
line 1559
;1559:	ServerOptions_MenuInit( multiplayer );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ServerOptions_MenuInit
CALLV
pop
line 1560
;1560:	UI_PushMenu( &s_serveroptions.menu );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1561
;1561:}
LABELV $1311
endproc UI_ServerOptionsMenu 0 4
proc UI_BotSelectMenu_SortCompare 44 8
line 1622
;1562:
;1563:
;1564:
;1565:/*
;1566:=============================================================================
;1567:
;1568:BOT SELECT MENU *****
;1569:
;1570:=============================================================================
;1571:*/
;1572:
;1573:
;1574:#define BOTSELECT_BACK0			"menu/art/back_0"
;1575:#define BOTSELECT_BACK1			"menu/art/back_1"
;1576:#define BOTSELECT_ACCEPT0		"menu/art/accept_0"
;1577:#define BOTSELECT_ACCEPT1		"menu/art/accept_1"
;1578:#define BOTSELECT_SELECT		"menu/art/opponents_select"
;1579:#define BOTSELECT_SELECTED		"menu/art/opponents_selected"
;1580:#define BOTSELECT_ARROWS		"menu/art/gs_arrows_0"
;1581:#define BOTSELECT_ARROWSL		"menu/art/gs_arrows_l"
;1582:#define BOTSELECT_ARROWSR		"menu/art/gs_arrows_r"
;1583:
;1584:#define PLAYERGRID_COLS			4
;1585:#define PLAYERGRID_ROWS			4
;1586:#define MAX_MODELSPERPAGE		(PLAYERGRID_ROWS * PLAYERGRID_COLS)
;1587:
;1588:
;1589:typedef struct {
;1590:	menuframework_s	menu;
;1591:
;1592:	menutext_s		banner;
;1593:
;1594:	menubitmap_s	pics[MAX_MODELSPERPAGE];
;1595:	menubitmap_s	picbuttons[MAX_MODELSPERPAGE];
;1596:	menutext_s		picnames[MAX_MODELSPERPAGE];
;1597:
;1598:	menubitmap_s	arrows;
;1599:	menubitmap_s	left;
;1600:	menubitmap_s	right;
;1601:
;1602:	menubitmap_s	go;
;1603:	menubitmap_s	back;
;1604:
;1605:	int				numBots;
;1606:	int				modelpage;
;1607:	int				numpages;
;1608:	int				selectedmodel;
;1609:	int				sortedBotNums[MAX_BOTS];
;1610:	char			boticons[MAX_MODELSPERPAGE][MAX_QPATH];
;1611:	char			botnames[MAX_MODELSPERPAGE][16];
;1612:} botSelectInfo_t;
;1613:
;1614:static botSelectInfo_t	botSelectInfo;
;1615:
;1616:
;1617:/*
;1618:=================
;1619:UI_BotSelectMenu_SortCompare
;1620:=================
;1621:*/
;1622:static int QDECL UI_BotSelectMenu_SortCompare( const void *arg1, const void *arg2 ) {
line 1627
;1623:	int			num1, num2;
;1624:	const char	*info1, *info2;
;1625:	const char	*name1, *name2;
;1626:
;1627:	num1 = *(int *)arg1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1628
;1628:	num2 = *(int *)arg2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 1630
;1629:
;1630:	info1 = UI_GetBotInfoByNumber( num1 );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 1631
;1631:	info2 = UI_GetBotInfoByNumber( num2 );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
ASGNP4
line 1633
;1632:
;1633:	name1 = Info_ValueForKey( info1, "name" );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $644
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 1634
;1634:	name2 = Info_ValueForKey( info2, "name" );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $644
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 36
INDIRP4
ASGNP4
line 1636
;1635:
;1636:	return Q_stricmp( name1, name2 );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
LABELV $1313
endproc UI_BotSelectMenu_SortCompare 44 8
proc UI_BotSelectMenu_BuildList 12 16
line 1645
;1637:}
;1638:
;1639:
;1640:/*
;1641:=================
;1642:UI_BotSelectMenu_BuildList
;1643:=================
;1644:*/
;1645:static void UI_BotSelectMenu_BuildList( void ) {
line 1648
;1646:	int		n;
;1647:
;1648:	botSelectInfo.modelpage = 0;
ADDRGP4 botSelectInfo+4988
CNSTI4 0
ASGNI4
line 1649
;1649:	botSelectInfo.numBots = UI_GetNumBots();
ADDRLP4 4
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRGP4 botSelectInfo+4984
ADDRLP4 4
INDIRI4
ASGNI4
line 1650
;1650:	botSelectInfo.numpages = botSelectInfo.numBots / MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4992
ADDRGP4 botSelectInfo+4984
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 1651
;1651:	if( botSelectInfo.numBots % MAX_MODELSPERPAGE ) {
ADDRGP4 botSelectInfo+4984
INDIRI4
CNSTI4 16
MODI4
CNSTI4 0
EQI4 $1319
line 1652
;1652:		botSelectInfo.numpages++;
ADDRLP4 8
ADDRGP4 botSelectInfo+4992
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1653
;1653:	}
LABELV $1319
line 1656
;1654:
;1655:	// initialize the array
;1656:	for( n = 0; n < botSelectInfo.numBots; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1326
JUMPV
LABELV $1323
line 1657
;1657:		botSelectInfo.sortedBotNums[n] = n;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+5000
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1658
;1658:	}
LABELV $1324
line 1656
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1326
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+4984
INDIRI4
LTI4 $1323
line 1661
;1659:
;1660:	// now sort it
;1661:	qsort( botSelectInfo.sortedBotNums, botSelectInfo.numBots, sizeof(botSelectInfo.sortedBotNums[0]), UI_BotSelectMenu_SortCompare );
ADDRGP4 botSelectInfo+5000
ARGP4
ADDRGP4 botSelectInfo+4984
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 UI_BotSelectMenu_SortCompare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1662
;1662:}
LABELV $1314
endproc UI_BotSelectMenu_BuildList 12 16
proc ServerPlayerIcon 80 20
line 1670
;1663:
;1664:
;1665:/*
;1666:=================
;1667:ServerPlayerIcon
;1668:=================
;1669:*/
;1670:static void ServerPlayerIcon( const char *modelAndSkin, char *iconName, int iconNameMaxSize ) {
line 1674
;1671:	char	*skin;
;1672:	char	model[MAX_QPATH];
;1673:
;1674:	Q_strncpyz( model, modelAndSkin, sizeof(model));
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1675
;1675:	skin = Q_strrchr( model, '/' );
ADDRLP4 4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 68
ADDRGP4 Q_strrchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
line 1676
;1676:	if ( skin ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1333
line 1677
;1677:		*skin++ = '\0';
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI1 0
ASGNI1
line 1678
;1678:	}
ADDRGP4 $1334
JUMPV
LABELV $1333
line 1679
;1679:	else {
line 1680
;1680:		skin = "default";
ADDRLP4 0
ADDRGP4 $1335
ASGNP4
line 1681
;1681:	}
LABELV $1334
line 1683
;1682:
;1683:	Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_%s.tga", model, skin );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $1336
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1685
;1684:
;1685:	if( !trap_R_RegisterShaderNoMip( iconName ) && Q_stricmp( skin, "default" ) != 0 ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $1337
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1335
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $1337
line 1686
;1686:		Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_default.tga", model );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $1339
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1687
;1687:	}
LABELV $1337
line 1688
;1688:}
LABELV $1332
endproc ServerPlayerIcon 80 20
proc UI_BotSelectMenu_UpdateGrid 36 12
line 1696
;1689:
;1690:
;1691:/*
;1692:=================
;1693:UI_BotSelectMenu_UpdateGrid
;1694:=================
;1695:*/
;1696:static void UI_BotSelectMenu_UpdateGrid( void ) {
line 1701
;1697:	const char	*info;
;1698:	int			i;
;1699:    int			j;
;1700:
;1701:	j = botSelectInfo.modelpage * MAX_MODELSPERPAGE;
ADDRLP4 4
ADDRGP4 botSelectInfo+4988
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1702
;1702:	for( i = 0; i < (PLAYERGRID_ROWS * PLAYERGRID_COLS); i++, j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1342
line 1703
;1703:		if( j < botSelectInfo.numBots ) { 
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+4984
INDIRI4
GEI4 $1346
line 1704
;1704:			info = UI_GetBotInfoByNumber( botSelectInfo.sortedBotNums[j] );
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+5000
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 1705
;1705:			ServerPlayerIcon( Info_ValueForKey( info, "model" ), botSelectInfo.boticons[i], MAX_QPATH );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $1350
ARGP4
ADDRLP4 16
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 botSelectInfo+9096
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 ServerPlayerIcon
CALLV
pop
line 1706
;1706:			Q_strncpyz( botSelectInfo.botnames[i], Info_ValueForKey( info, "name" ), 16 );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $644
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+10120
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1707
;1707:			Q_CleanStr( botSelectInfo.botnames[i] );
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+10120
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1708
;1708: 			botSelectInfo.pics[i].generic.name = botSelectInfo.boticons[i];
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 botSelectInfo+9096
ADDP4
ASGNP4
line 1709
;1709:			if( BotAlreadySelected( botSelectInfo.botnames[i] ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+10120
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 BotAlreadySelected
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $1357
line 1710
;1710:				botSelectInfo.picnames[i].color = color_red;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308+72
ADDP4
ADDRGP4 color_red
ASGNP4
line 1711
;1711:			}
ADDRGP4 $1358
JUMPV
LABELV $1357
line 1712
;1712:			else {
line 1713
;1713:				botSelectInfo.picnames[i].color = color_orange;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308+72
ADDP4
ADDRGP4 color_orange
ASGNP4
line 1714
;1714:			}
LABELV $1358
line 1715
;1715:			botSelectInfo.picbuttons[i].generic.flags &= ~QMF_INACTIVE;
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+44
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 1716
;1716:		}
ADDRGP4 $1347
JUMPV
LABELV $1346
line 1717
;1717:		else {
line 1719
;1718:			// dead slot
;1719: 			botSelectInfo.pics[i].generic.name         = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+4
ADDP4
CNSTP4 0
ASGNP4
line 1720
;1720:			botSelectInfo.picbuttons[i].generic.flags |= QMF_INACTIVE;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1721
;1721:			botSelectInfo.botnames[i][0] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+10120
ADDP4
CNSTI1 0
ASGNI1
line 1722
;1722:		}
LABELV $1347
line 1724
;1723:
;1724: 		botSelectInfo.pics[i].generic.flags       &= ~QMF_HIGHLIGHT;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 1725
;1725: 		botSelectInfo.pics[i].shader               = 0;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+72
ADDP4
CNSTI4 0
ASGNI4
line 1726
;1726: 		botSelectInfo.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 1727
;1727:	}
LABELV $1343
line 1702
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1342
line 1730
;1728:
;1729:	// set selected model
;1730:	i = botSelectInfo.selectedmodel % MAX_MODELSPERPAGE;
ADDRLP4 0
ADDRGP4 botSelectInfo+4996
INDIRI4
CNSTI4 16
MODI4
ASGNI4
line 1731
;1731:	botSelectInfo.pics[i].generic.flags |= QMF_HIGHLIGHT;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 1732
;1732:	botSelectInfo.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 1734
;1733:
;1734:	if( botSelectInfo.numpages > 1 ) {
ADDRGP4 botSelectInfo+4992
INDIRI4
CNSTI4 1
LEI4 $1382
line 1735
;1735:		if( botSelectInfo.modelpage > 0 ) {
ADDRGP4 botSelectInfo+4988
INDIRI4
CNSTI4 0
LEI4 $1385
line 1736
;1736:			botSelectInfo.left.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 botSelectInfo+4616+44
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 1737
;1737:		}
ADDRGP4 $1386
JUMPV
LABELV $1385
line 1738
;1738:		else {
line 1739
;1739:			botSelectInfo.left.generic.flags |= QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 botSelectInfo+4616+44
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1740
;1740:		}
LABELV $1386
line 1742
;1741:
;1742:		if( botSelectInfo.modelpage < (botSelectInfo.numpages - 1) ) {
ADDRGP4 botSelectInfo+4988
INDIRI4
ADDRGP4 botSelectInfo+4992
INDIRI4
CNSTI4 1
SUBI4
GEI4 $1392
line 1743
;1743:			botSelectInfo.right.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 botSelectInfo+4708+44
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 1744
;1744:		}
ADDRGP4 $1383
JUMPV
LABELV $1392
line 1745
;1745:		else {
line 1746
;1746:			botSelectInfo.right.generic.flags |= QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 botSelectInfo+4708+44
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1747
;1747:		}
line 1748
;1748:	}
ADDRGP4 $1383
JUMPV
LABELV $1382
line 1749
;1749:	else {
line 1751
;1750:		// hide left/right markers
;1751:		botSelectInfo.left.generic.flags |= QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 botSelectInfo+4616+44
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1752
;1752:		botSelectInfo.right.generic.flags |= QMF_INACTIVE;
ADDRLP4 24
ADDRGP4 botSelectInfo+4708+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1753
;1753:	}
LABELV $1383
line 1754
;1754:}
LABELV $1340
endproc UI_BotSelectMenu_UpdateGrid 36 12
proc UI_BotSelectMenu_Default 28 8
line 1762
;1755:
;1756:
;1757:/*
;1758:=================
;1759:UI_BotSelectMenu_Default
;1760:=================
;1761:*/
;1762:static void UI_BotSelectMenu_Default( char *bot ) {
line 1768
;1763:	const char	*botInfo;
;1764:	const char	*test;
;1765:	int			n;
;1766:	int			i;
;1767:
;1768:	for( n = 0; n < botSelectInfo.numBots; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1408
JUMPV
LABELV $1405
line 1769
;1769:		botInfo = UI_GetBotInfoByNumber( n );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 1770
;1770:		test = Info_ValueForKey( botInfo, "name" );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $644
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 1771
;1771:		if( Q_stricmp( bot, test ) == 0 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $1410
line 1772
;1772:			break;
ADDRGP4 $1407
JUMPV
LABELV $1410
line 1774
;1773:		}
;1774:	}
LABELV $1406
line 1768
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1408
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+4984
INDIRI4
LTI4 $1405
LABELV $1407
line 1775
;1775:	if( n == botSelectInfo.numBots ) {
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+4984
INDIRI4
NEI4 $1412
line 1776
;1776:		botSelectInfo.selectedmodel = 0;
ADDRGP4 botSelectInfo+4996
CNSTI4 0
ASGNI4
line 1777
;1777:		return;
ADDRGP4 $1404
JUMPV
LABELV $1412
line 1780
;1778:	}
;1779:
;1780:	for( i = 0; i < botSelectInfo.numBots; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1419
JUMPV
LABELV $1416
line 1781
;1781:		if( botSelectInfo.sortedBotNums[i] == n ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+5000
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1421
line 1782
;1782:			break;
ADDRGP4 $1418
JUMPV
LABELV $1421
line 1784
;1783:		}
;1784:	}
LABELV $1417
line 1780
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1419
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+4984
INDIRI4
LTI4 $1416
LABELV $1418
line 1785
;1785:	if( i == botSelectInfo.numBots ) {
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+4984
INDIRI4
NEI4 $1424
line 1786
;1786:		botSelectInfo.selectedmodel = 0;
ADDRGP4 botSelectInfo+4996
CNSTI4 0
ASGNI4
line 1787
;1787:		return;
ADDRGP4 $1404
JUMPV
LABELV $1424
line 1790
;1788:	}
;1789:
;1790:	botSelectInfo.selectedmodel = i;
ADDRGP4 botSelectInfo+4996
ADDRLP4 4
INDIRI4
ASGNI4
line 1791
;1791:}
LABELV $1404
endproc UI_BotSelectMenu_Default 28 8
proc UI_BotSelectMenu_LeftEvent 4 0
line 1799
;1792:
;1793:
;1794:/*
;1795:=================
;1796:UI_BotSelectMenu_LeftEvent
;1797:=================
;1798:*/
;1799:static void UI_BotSelectMenu_LeftEvent( void* ptr, int event ) {
line 1800
;1800:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1430
line 1801
;1801:		return;
ADDRGP4 $1429
JUMPV
LABELV $1430
line 1803
;1802:	}
;1803:	if( botSelectInfo.modelpage > 0 ) {
ADDRGP4 botSelectInfo+4988
INDIRI4
CNSTI4 0
LEI4 $1432
line 1804
;1804:		botSelectInfo.modelpage--;
ADDRLP4 0
ADDRGP4 botSelectInfo+4988
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1805
;1805:		botSelectInfo.selectedmodel = botSelectInfo.modelpage * MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4996
ADDRGP4 botSelectInfo+4988
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1806
;1806:		UI_BotSelectMenu_UpdateGrid();
ADDRGP4 UI_BotSelectMenu_UpdateGrid
CALLV
pop
line 1807
;1807:	}
LABELV $1432
line 1808
;1808:}
LABELV $1429
endproc UI_BotSelectMenu_LeftEvent 4 0
proc UI_BotSelectMenu_RightEvent 4 0
line 1816
;1809:
;1810:
;1811:/*
;1812:=================
;1813:UI_BotSelectMenu_RightEvent
;1814:=================
;1815:*/
;1816:static void UI_BotSelectMenu_RightEvent( void* ptr, int event ) {
line 1817
;1817:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1439
line 1818
;1818:		return;
ADDRGP4 $1438
JUMPV
LABELV $1439
line 1820
;1819:	}
;1820:	if( botSelectInfo.modelpage < botSelectInfo.numpages - 1 ) {
ADDRGP4 botSelectInfo+4988
INDIRI4
ADDRGP4 botSelectInfo+4992
INDIRI4
CNSTI4 1
SUBI4
GEI4 $1441
line 1821
;1821:		botSelectInfo.modelpage++;
ADDRLP4 0
ADDRGP4 botSelectInfo+4988
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1822
;1822:		botSelectInfo.selectedmodel = botSelectInfo.modelpage * MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4996
ADDRGP4 botSelectInfo+4988
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1823
;1823:		UI_BotSelectMenu_UpdateGrid();
ADDRGP4 UI_BotSelectMenu_UpdateGrid
CALLV
pop
line 1824
;1824:	}
LABELV $1441
line 1825
;1825:}
LABELV $1438
endproc UI_BotSelectMenu_RightEvent 4 0
proc UI_BotSelectMenu_BotEvent 12 0
line 1833
;1826:
;1827:
;1828:/*
;1829:=================
;1830:UI_BotSelectMenu_BotEvent
;1831:=================
;1832:*/
;1833:static void UI_BotSelectMenu_BotEvent( void* ptr, int event ) {
line 1836
;1834:	int		i;
;1835:
;1836:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1449
line 1837
;1837:		return;
ADDRGP4 $1448
JUMPV
LABELV $1449
line 1840
;1838:	}
;1839:
;1840:	for( i = 0; i < (PLAYERGRID_ROWS * PLAYERGRID_COLS); i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1451
line 1841
;1841: 		botSelectInfo.pics[i].generic.flags &= ~QMF_HIGHLIGHT;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 1842
;1842: 		botSelectInfo.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 1843
;1843:	}
LABELV $1452
line 1840
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1451
line 1846
;1844:
;1845:	// set selected
;1846:	i = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1847
;1847:	botSelectInfo.pics[i].generic.flags |= QMF_HIGHLIGHT;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 1848
;1848:	botSelectInfo.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 1849
;1849:	botSelectInfo.selectedmodel = botSelectInfo.modelpage * MAX_MODELSPERPAGE + i;
ADDRGP4 botSelectInfo+4996
ADDRGP4 botSelectInfo+4988
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 1850
;1850:}
LABELV $1448
endproc UI_BotSelectMenu_BotEvent 12 0
proc UI_BotSelectMenu_BackEvent 0 0
line 1858
;1851:
;1852:
;1853:/*
;1854:=================
;1855:UI_BotSelectMenu_BackEvent
;1856:=================
;1857:*/
;1858:static void UI_BotSelectMenu_BackEvent( void* ptr, int event ) {
line 1859
;1859:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1466
line 1860
;1860:		return;
ADDRGP4 $1465
JUMPV
LABELV $1466
line 1862
;1861:	}
;1862:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1863
;1863:}
LABELV $1465
endproc UI_BotSelectMenu_BackEvent 0 0
proc UI_BotSelectMenu_SelectEvent 0 12
line 1871
;1864:
;1865:
;1866:/*
;1867:=================
;1868:UI_BotSelectMenu_SelectEvent
;1869:=================
;1870:*/
;1871:static void UI_BotSelectMenu_SelectEvent( void* ptr, int event ) {
line 1872
;1872:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1469
line 1873
;1873:		return;
ADDRGP4 $1468
JUMPV
LABELV $1469
line 1875
;1874:	}
;1875:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1877
;1876:
;1877:	s_serveroptions.newBot = qtrue;
ADDRGP4 s_serveroptions+6348
CNSTI4 1
ASGNI4
line 1878
;1878:	Q_strncpyz( s_serveroptions.newBotName, botSelectInfo.botnames[botSelectInfo.selectedmodel % MAX_MODELSPERPAGE], 16 );
ADDRGP4 s_serveroptions+6356
ARGP4
ADDRGP4 botSelectInfo+4996
INDIRI4
CNSTI4 16
MODI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+10120
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1879
;1879:}
LABELV $1468
endproc UI_BotSelectMenu_SelectEvent 0 12
export UI_BotSelectMenu_Cache
proc UI_BotSelectMenu_Cache 0 4
line 1887
;1880:
;1881:
;1882:/*
;1883:=================
;1884:UI_BotSelectMenu_Cache
;1885:=================
;1886:*/
;1887:void UI_BotSelectMenu_Cache( void ) {
line 1888
;1888:	trap_R_RegisterShaderNoMip( BOTSELECT_BACK0 );
ADDRGP4 $400
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1889
;1889:	trap_R_RegisterShaderNoMip( BOTSELECT_BACK1 );
ADDRGP4 $417
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1890
;1890:	trap_R_RegisterShaderNoMip( BOTSELECT_ACCEPT0 );
ADDRGP4 $1476
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1891
;1891:	trap_R_RegisterShaderNoMip( BOTSELECT_ACCEPT1 );
ADDRGP4 $1477
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1892
;1892:	trap_R_RegisterShaderNoMip( BOTSELECT_SELECT );
ADDRGP4 $1478
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1893
;1893:	trap_R_RegisterShaderNoMip( BOTSELECT_SELECTED );
ADDRGP4 $1479
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1894
;1894:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWS );
ADDRGP4 $337
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1895
;1895:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWSL );
ADDRGP4 $365
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1896
;1896:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWSR );
ADDRGP4 $383
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1897
;1897:}
LABELV $1475
endproc UI_BotSelectMenu_Cache 0 4
proc UI_BotSelectMenu_Init 32 12
line 1900
;1898:
;1899:
;1900:static void UI_BotSelectMenu_Init( char *bot ) {
line 1904
;1901:	int		i, j, k;
;1902:	int		x, y;
;1903:
;1904:	memset( &botSelectInfo, 0 ,sizeof(botSelectInfo) );
ADDRGP4 botSelectInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 10376
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1905
;1905:	botSelectInfo.menu.wrapAround = qtrue;
ADDRGP4 botSelectInfo+276
CNSTI4 1
ASGNI4
line 1906
;1906:	botSelectInfo.menu.fullscreen = qtrue;
ADDRGP4 botSelectInfo+280
CNSTI4 1
ASGNI4
line 1908
;1907:
;1908:	UI_BotSelectMenu_Cache();
ADDRGP4 UI_BotSelectMenu_Cache
CALLV
pop
line 1910
;1909:
;1910:	botSelectInfo.banner.generic.type	= MTYPE_BTEXT;
ADDRGP4 botSelectInfo+288
CNSTI4 10
ASGNI4
line 1911
;1911:	botSelectInfo.banner.generic.x		= 320;
ADDRGP4 botSelectInfo+288+12
CNSTI4 320
ASGNI4
line 1912
;1912:	botSelectInfo.banner.generic.y		= 16;
ADDRGP4 botSelectInfo+288+16
CNSTI4 16
ASGNI4
line 1913
;1913:	botSelectInfo.banner.string			= "SELECT BOT";
ADDRGP4 botSelectInfo+288+64
ADDRGP4 $1490
ASGNP4
line 1914
;1914:	botSelectInfo.banner.color			= color_white;
ADDRGP4 botSelectInfo+288+72
ADDRGP4 color_white
ASGNP4
line 1915
;1915:	botSelectInfo.banner.style			= UI_CENTER;
ADDRGP4 botSelectInfo+288+68
CNSTI4 1
ASGNI4
line 1917
;1916:
;1917:	y =	80;
ADDRLP4 8
CNSTI4 80
ASGNI4
line 1918
;1918:	for( i = 0, k = 0; i < PLAYERGRID_ROWS; i++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1498
JUMPV
LABELV $1495
line 1919
;1919:		x =	180;
ADDRLP4 4
CNSTI4 180
ASGNI4
line 1920
;1920:		for( j = 0; j < PLAYERGRID_COLS; j++, k++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $1499
line 1921
;1921:			botSelectInfo.pics[k].generic.type				= MTYPE_BITMAP;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364
ADDP4
CNSTI4 6
ASGNI4
line 1922
;1922:			botSelectInfo.pics[k].generic.flags				= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+44
ADDP4
CNSTU4 16388
ASGNU4
line 1923
;1923:			botSelectInfo.pics[k].generic.x					= x;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1924
;1924:			botSelectInfo.pics[k].generic.y					= y;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1925
;1925: 			botSelectInfo.pics[k].generic.name				= botSelectInfo.boticons[k];
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 botSelectInfo+9096
ADDP4
ASGNP4
line 1926
;1926:			botSelectInfo.pics[k].width						= 64;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+80
ADDP4
CNSTI4 64
ASGNI4
line 1927
;1927:			botSelectInfo.pics[k].height					= 64;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+84
ADDP4
CNSTI4 64
ASGNI4
line 1928
;1928:			botSelectInfo.pics[k].focuspic					= BOTSELECT_SELECTED;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+64
ADDP4
ADDRGP4 $1479
ASGNP4
line 1929
;1929:			botSelectInfo.pics[k].focuscolor				= colorRed;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364+88
ADDP4
ADDRGP4 colorRed
ASGNP4
line 1931
;1930:
;1931:			botSelectInfo.picbuttons[k].generic.type		= MTYPE_BITMAP;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836
ADDP4
CNSTI4 6
ASGNI4
line 1932
;1932:			botSelectInfo.picbuttons[k].generic.flags		= QMF_LEFT_JUSTIFY|QMF_NODEFAULTINIT|QMF_PULSEIFFOCUS;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+44
ADDP4
CNSTU4 33028
ASGNU4
line 1933
;1933:			botSelectInfo.picbuttons[k].generic.callback	= UI_BotSelectMenu_BotEvent;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+48
ADDP4
ADDRGP4 UI_BotSelectMenu_BotEvent
ASGNP4
line 1934
;1934:			botSelectInfo.picbuttons[k].generic.id			= k;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1935
;1935:			botSelectInfo.picbuttons[k].generic.x			= x - 16;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 1936
;1936:			botSelectInfo.picbuttons[k].generic.y			= y - 16;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 1937
;1937:			botSelectInfo.picbuttons[k].generic.left		= x;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1938
;1938:			botSelectInfo.picbuttons[k].generic.top			= y;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+24
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1939
;1939:			botSelectInfo.picbuttons[k].generic.right		= x + 64;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+28
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 1940
;1940:			botSelectInfo.picbuttons[k].generic.bottom		= y + 64;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+32
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 1941
;1941:			botSelectInfo.picbuttons[k].width				= 128;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+80
ADDP4
CNSTI4 128
ASGNI4
line 1942
;1942:			botSelectInfo.picbuttons[k].height				= 128;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+84
ADDP4
CNSTI4 128
ASGNI4
line 1943
;1943:			botSelectInfo.picbuttons[k].focuspic			= BOTSELECT_SELECT;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+64
ADDP4
ADDRGP4 $1478
ASGNP4
line 1944
;1944:			botSelectInfo.picbuttons[k].focuscolor			= colorRed;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836+88
ADDP4
ADDRGP4 colorRed
ASGNP4
line 1946
;1945:
;1946:			botSelectInfo.picnames[k].generic.type			= MTYPE_TEXT;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308
ADDP4
CNSTI4 7
ASGNI4
line 1947
;1947:			botSelectInfo.picnames[k].generic.flags			= QMF_SMALLFONT;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308+44
ADDP4
CNSTU4 2
ASGNU4
line 1948
;1948:			botSelectInfo.picnames[k].generic.x				= x + 32;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 1949
;1949:			botSelectInfo.picnames[k].generic.y				= y + 64;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 1950
;1950:			botSelectInfo.picnames[k].string				= botSelectInfo.botnames[k];
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308+64
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+10120
ADDP4
ASGNP4
line 1951
;1951:			botSelectInfo.picnames[k].color					= color_orange;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308+72
ADDP4
ADDRGP4 color_orange
ASGNP4
line 1952
;1952:			botSelectInfo.picnames[k].style					= UI_CENTER|UI_SMALLFONT;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308+68
ADDP4
CNSTI4 17
ASGNI4
line 1954
;1953:
;1954:			x += (64 + 6);
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 70
ADDI4
ASGNI4
line 1955
;1955:		}
LABELV $1500
line 1920
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4
LTI4 $1499
line 1956
;1956:		y += (64 + SMALLCHAR_HEIGHT + 6);
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 86
ADDI4
ASGNI4
line 1957
;1957:	}
LABELV $1496
line 1918
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1498
ADDRLP4 16
INDIRI4
CNSTI4 4
LTI4 $1495
line 1959
;1958:
;1959:	botSelectInfo.arrows.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4524
CNSTI4 6
ASGNI4
line 1960
;1960:	botSelectInfo.arrows.generic.name		= BOTSELECT_ARROWS;
ADDRGP4 botSelectInfo+4524+4
ADDRGP4 $337
ASGNP4
line 1961
;1961:	botSelectInfo.arrows.generic.flags		= QMF_INACTIVE;
ADDRGP4 botSelectInfo+4524+44
CNSTU4 16384
ASGNU4
line 1962
;1962:	botSelectInfo.arrows.generic.x			= 260;
ADDRGP4 botSelectInfo+4524+12
CNSTI4 260
ASGNI4
line 1963
;1963:	botSelectInfo.arrows.generic.y			= 440;
ADDRGP4 botSelectInfo+4524+16
CNSTI4 440
ASGNI4
line 1964
;1964:	botSelectInfo.arrows.width				= 128;
ADDRGP4 botSelectInfo+4524+80
CNSTI4 128
ASGNI4
line 1965
;1965:	botSelectInfo.arrows.height				= 32;
ADDRGP4 botSelectInfo+4524+84
CNSTI4 32
ASGNI4
line 1967
;1966:
;1967:	botSelectInfo.left.generic.type			= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4616
CNSTI4 6
ASGNI4
line 1968
;1968:	botSelectInfo.left.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4616+44
CNSTU4 260
ASGNU4
line 1969
;1969:	botSelectInfo.left.generic.callback		= UI_BotSelectMenu_LeftEvent;
ADDRGP4 botSelectInfo+4616+48
ADDRGP4 UI_BotSelectMenu_LeftEvent
ASGNP4
line 1970
;1970:	botSelectInfo.left.generic.x			= 260;
ADDRGP4 botSelectInfo+4616+12
CNSTI4 260
ASGNI4
line 1971
;1971:	botSelectInfo.left.generic.y			= 440;
ADDRGP4 botSelectInfo+4616+16
CNSTI4 440
ASGNI4
line 1972
;1972:	botSelectInfo.left.width  				= 64;
ADDRGP4 botSelectInfo+4616+80
CNSTI4 64
ASGNI4
line 1973
;1973:	botSelectInfo.left.height  				= 32;
ADDRGP4 botSelectInfo+4616+84
CNSTI4 32
ASGNI4
line 1974
;1974:	botSelectInfo.left.focuspic				= BOTSELECT_ARROWSL;
ADDRGP4 botSelectInfo+4616+64
ADDRGP4 $365
ASGNP4
line 1976
;1975:
;1976:	botSelectInfo.right.generic.type	    = MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4708
CNSTI4 6
ASGNI4
line 1977
;1977:	botSelectInfo.right.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4708+44
CNSTU4 260
ASGNU4
line 1978
;1978:	botSelectInfo.right.generic.callback	= UI_BotSelectMenu_RightEvent;
ADDRGP4 botSelectInfo+4708+48
ADDRGP4 UI_BotSelectMenu_RightEvent
ASGNP4
line 1979
;1979:	botSelectInfo.right.generic.x			= 321;
ADDRGP4 botSelectInfo+4708+12
CNSTI4 321
ASGNI4
line 1980
;1980:	botSelectInfo.right.generic.y			= 440;
ADDRGP4 botSelectInfo+4708+16
CNSTI4 440
ASGNI4
line 1981
;1981:	botSelectInfo.right.width  				= 64;
ADDRGP4 botSelectInfo+4708+80
CNSTI4 64
ASGNI4
line 1982
;1982:	botSelectInfo.right.height  		    = 32;
ADDRGP4 botSelectInfo+4708+84
CNSTI4 32
ASGNI4
line 1983
;1983:	botSelectInfo.right.focuspic			= BOTSELECT_ARROWSR;
ADDRGP4 botSelectInfo+4708+64
ADDRGP4 $383
ASGNP4
line 1985
;1984:
;1985:	botSelectInfo.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4892
CNSTI4 6
ASGNI4
line 1986
;1986:	botSelectInfo.back.generic.name		= BOTSELECT_BACK0;
ADDRGP4 botSelectInfo+4892+4
ADDRGP4 $400
ASGNP4
line 1987
;1987:	botSelectInfo.back.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4892+44
CNSTU4 260
ASGNU4
line 1988
;1988:	botSelectInfo.back.generic.callback	= UI_BotSelectMenu_BackEvent;
ADDRGP4 botSelectInfo+4892+48
ADDRGP4 UI_BotSelectMenu_BackEvent
ASGNP4
line 1989
;1989:	botSelectInfo.back.generic.x		= 0;
ADDRGP4 botSelectInfo+4892+12
CNSTI4 0
ASGNI4
line 1990
;1990:	botSelectInfo.back.generic.y		= 480-64;
ADDRGP4 botSelectInfo+4892+16
CNSTI4 416
ASGNI4
line 1991
;1991:	botSelectInfo.back.width			= 128;
ADDRGP4 botSelectInfo+4892+80
CNSTI4 128
ASGNI4
line 1992
;1992:	botSelectInfo.back.height			= 64;
ADDRGP4 botSelectInfo+4892+84
CNSTI4 64
ASGNI4
line 1993
;1993:	botSelectInfo.back.focuspic			= BOTSELECT_BACK1;
ADDRGP4 botSelectInfo+4892+64
ADDRGP4 $417
ASGNP4
line 1995
;1994:
;1995:	botSelectInfo.go.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4800
CNSTI4 6
ASGNI4
line 1996
;1996:	botSelectInfo.go.generic.name		= BOTSELECT_ACCEPT0;
ADDRGP4 botSelectInfo+4800+4
ADDRGP4 $1476
ASGNP4
line 1997
;1997:	botSelectInfo.go.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4800+44
CNSTU4 272
ASGNU4
line 1998
;1998:	botSelectInfo.go.generic.callback	= UI_BotSelectMenu_SelectEvent;
ADDRGP4 botSelectInfo+4800+48
ADDRGP4 UI_BotSelectMenu_SelectEvent
ASGNP4
line 1999
;1999:	botSelectInfo.go.generic.x			= 640;
ADDRGP4 botSelectInfo+4800+12
CNSTI4 640
ASGNI4
line 2000
;2000:	botSelectInfo.go.generic.y			= 480-64;
ADDRGP4 botSelectInfo+4800+16
CNSTI4 416
ASGNI4
line 2001
;2001:	botSelectInfo.go.width				= 128;
ADDRGP4 botSelectInfo+4800+80
CNSTI4 128
ASGNI4
line 2002
;2002:	botSelectInfo.go.height				= 64;
ADDRGP4 botSelectInfo+4800+84
CNSTI4 64
ASGNI4
line 2003
;2003:	botSelectInfo.go.focuspic			= BOTSELECT_ACCEPT1;
ADDRGP4 botSelectInfo+4800+64
ADDRGP4 $1477
ASGNP4
line 2005
;2004:
;2005:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.banner );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2006
;2006:	for( i = 0; i < MAX_MODELSPERPAGE; i++ ) {
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $1640
line 2007
;2007:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.pics[i] );
ADDRGP4 botSelectInfo
ARGP4
ADDRLP4 16
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+364
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2008
;2008:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.picbuttons[i] );
ADDRGP4 botSelectInfo
ARGP4
ADDRLP4 16
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 botSelectInfo+1836
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2009
;2009:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.picnames[i] );
ADDRGP4 botSelectInfo
ARGP4
ADDRLP4 16
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 botSelectInfo+3308
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2010
;2010:	}
LABELV $1641
line 2006
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 16
LTI4 $1640
line 2011
;2011:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.arrows );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4524
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2012
;2012:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.left );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4616
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2013
;2013:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.right );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4708
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2014
;2014:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.back );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4892
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2015
;2015:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.go );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4800
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2017
;2016:
;2017:	UI_BotSelectMenu_BuildList();
ADDRGP4 UI_BotSelectMenu_BuildList
CALLV
pop
line 2018
;2018:	UI_BotSelectMenu_Default( bot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_BotSelectMenu_Default
CALLV
pop
line 2019
;2019:	botSelectInfo.modelpage = botSelectInfo.selectedmodel / MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4988
ADDRGP4 botSelectInfo+4996
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 2020
;2020:	UI_BotSelectMenu_UpdateGrid();
ADDRGP4 UI_BotSelectMenu_UpdateGrid
CALLV
pop
line 2021
;2021:}
LABELV $1480
endproc UI_BotSelectMenu_Init 32 12
export UI_BotSelectMenu
proc UI_BotSelectMenu 0 4
line 2029
;2022:
;2023:
;2024:/*
;2025:=================
;2026:UI_BotSelectMenu
;2027:=================
;2028:*/
;2029:void UI_BotSelectMenu( char *bot ) {
line 2030
;2030:	UI_BotSelectMenu_Init( bot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_BotSelectMenu_Init
CALLV
pop
line 2031
;2031:	UI_PushMenu( &botSelectInfo.menu );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 2032
;2032:}
LABELV $1654
endproc UI_BotSelectMenu 0 4
bss
align 4
LABELV botSelectInfo
skip 10376
align 4
LABELV s_serveroptions
skip 6684
import punkbuster_items
align 4
LABELV s_startserver
skip 6136
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
LABELV $1490
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
byte 1 84
byte 1 32
byte 1 66
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $1479
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1478
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $1477
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1476
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1350
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1339
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
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 102
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
LABELV $1336
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
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1335
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $1266
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
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1249
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
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1122
byte 1 66
byte 1 111
byte 1 116
byte 1 32
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $1116
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 99
byte 1 97
byte 1 109
byte 1 58
byte 1 0
align 1
LABELV $1106
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 85
byte 1 112
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $1096
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1076
byte 1 80
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $1060
byte 1 72
byte 1 111
byte 1 115
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1051
byte 1 68
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $1034
byte 1 80
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $1024
byte 1 70
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 32
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $997
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $979
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $961
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 32
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $888
byte 1 99
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
LABELV $885
byte 1 99
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
LABELV $843
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $817
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 0
align 1
LABELV $794
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $774
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $762
byte 1 118
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $756
byte 1 109
byte 1 97
byte 1 106
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $753
byte 1 103
byte 1 114
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $736
byte 1 48
byte 1 32
byte 1 61
byte 1 32
byte 1 78
byte 1 79
byte 1 32
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 84
byte 1 0
align 1
LABELV $676
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $644
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $613
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
LABELV $608
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $604
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $586
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $585
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 59
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $582
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
LABELV $581
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
LABELV $580
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
LABELV $577
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $573
byte 1 115
byte 1 118
byte 1 95
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $572
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $571
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
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $570
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
LABELV $569
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
LABELV $568
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
LABELV $567
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
LABELV $566
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
LABELV $564
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
LABELV $563
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
LABELV $562
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
LABELV $560
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
LABELV $559
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
LABELV $558
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
LABELV $556
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
LABELV $555
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
LABELV $553
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
LABELV $552
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
align 1
LABELV $490
byte 1 78
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 101
byte 1 33
byte 1 0
align 1
LABELV $489
byte 1 72
byte 1 97
byte 1 114
byte 1 100
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $488
byte 1 72
byte 1 117
byte 1 114
byte 1 116
byte 1 32
byte 1 77
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $487
byte 1 66
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 73
byte 1 116
byte 1 32
byte 1 79
byte 1 110
byte 1 0
align 1
LABELV $486
byte 1 73
byte 1 32
byte 1 67
byte 1 97
byte 1 110
byte 1 32
byte 1 87
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $485
byte 1 82
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $484
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $483
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 0
align 1
LABELV $482
byte 1 66
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $481
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $480
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $479
byte 1 76
byte 1 65
byte 1 78
byte 1 0
align 1
LABELV $478
byte 1 78
byte 1 111
byte 1 0
align 1
LABELV $468
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $438
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $421
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $417
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
LABELV $400
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
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $365
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $337
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $333
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
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $305
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $302
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
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $270
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $256
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
LABELV $242
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
LABELV $234
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 32
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $201
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $173
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $138
byte 1 78
byte 1 79
byte 1 32
byte 1 77
byte 1 65
byte 1 80
byte 1 83
byte 1 32
byte 1 70
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $106
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $105
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $93
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $90
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $87
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $84
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $81
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $72
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $71
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
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
LABELV $70
byte 1 84
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $69
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 70
byte 1 111
byte 1 114
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 0
