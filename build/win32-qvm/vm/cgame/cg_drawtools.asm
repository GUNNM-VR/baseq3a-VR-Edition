export CG_AdjustFrom640
code
proc CG_AdjustFrom640 60 0
file "..\..\..\..\code\cgame\cg_drawtools.c"
line 38
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_drawtools.c -- helper functions called by cg_draw, cg_scoreboard, cg_info, etc
;4:#include "cg_local.h"
;5:
;6:#ifdef USE_HUD_FLAG
;7:static int hudflags = 0;
;8:
;9:void CG_SetHUDFlags( int flags )
;10:{
;11:	hudflags |= flags;
;12:}
;13:
;14:void CG_RemoveHUDFlags( int flags )
;15:{
;16:	hudflags &= ~flags;
;17:}
;18:#endif
;19:
;20:/*
;21:================
;22:CG_AdjustFrom640
;23:
;24:Adjusted for resolution and screen aspect ratio
;25:================
;26:*/
;27:#ifndef USE_VIRTUAL_MENU
;28:void CG_AdjustFrom640( float *x, float *y, float *w, float *h )
;29:{
;30:	// scale for screen sizes
;31:	*x = *x * cgs.screenXScale + cgs.screenXBias;
;32:	*y = *y * cgs.screenYScale + cgs.screenYBias;
;33:	*w *= cgs.screenXScale;
;34:	*h *= cgs.screenYScale;
;35:}
;36:#else
;37:void CG_AdjustFrom640( float *x, float *y, float *w, float *h )
;38:{
line 39
;39:	float screenXScale	= cgs.screenXScale;
ADDRLP4 0
ADDRGP4 cgs+31448
INDIRF4
ASGNF4
line 40
;40:	float screenYScale	= cgs.screenYScale;
ADDRLP4 4
ADDRGP4 cgs+31452
INDIRF4
ASGNF4
line 41
;41:	float screenXBias	= cgs.screenXBias;
ADDRLP4 12
ADDRGP4 cgs+31460
INDIRF4
ASGNF4
line 42
;42:	float screenYBias	= cgs.screenYBias;
ADDRLP4 16
ADDRGP4 cgs+31464
INDIRF4
ASGNF4
line 43
;43:	int xoffset			= 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 44
;44:	int yoffset			= 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 45
;45:	const auto depth	= 3;
ADDRLP4 32
CNSTI4 3
ASGNI4
line 48
;46:	//const auto depth	= (int)trap_Cvar_VariableValue("vr_hudDepth"); // TODO
;47:
;48:	float scaleX = 2.0f;
ADDRLP4 8
CNSTF4 1073741824
ASGNF4
line 49
;49:	float scaleY = scaleX * 480.0f / 640.0f;
ADDRLP4 28
ADDRLP4 8
INDIRF4
CNSTF4 1061158912
MULF4
ASGNF4
line 52
;50:
;51:#ifdef USE_VR
;52:	if (cg.vr_controller_type) {
ADDRGP4 cg+282972
INDIRI4
CNSTI4 0
EQI4 $92
line 53
;53:		screenXScale /= scaleX;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
ASGNF4
line 54
;54:		screenYScale /= scaleY;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 28
INDIRF4
DIVF4
ASGNF4
line 55
;55:		screenXBias  /= scaleX;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
ASGNF4
line 56
;56:		screenYBias  /= scaleY;
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 28
INDIRF4
DIVF4
ASGNF4
line 57
;57:	}
LABELV $92
line 60
;58:#endif
;59:	// scale for screen sizes
;60:	*x = *x * screenXScale + screenXBias;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
line 61
;61:	*y = *y * screenYScale + screenYBias;
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 16
INDIRF4
ADDF4
ASGNF4
line 62
;62:	*w *= screenXScale;
ADDRLP4 44
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 63
;63:	*h *= screenYScale;
ADDRLP4 48
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 66
;64:#ifdef USE_VR
;65:	// Recenter scaled screen
;66:	if ( cg.vr_controller_type )
ADDRGP4 cg+282972
INDIRI4
CNSTI4 0
EQI4 $95
line 67
;67:	{
line 78
;68:#ifdef USE_HUD_FLAG
;69:		if (hudflags & HUD_FLAGS_DRAWMODEL)
;70:		{
;71:			*w *= (cgs.screenXScale * 2.0f);
;72:			*x -= (*w / 3);
;73:			*h *= (cgs.screenYScale * 2.0f);
;74:			*y -= (*h / 3);
;75:		}
;76:		else
;77:#endif
;78:		{
line 79
;79:			yoffset = -100.0f;
ADDRLP4 24
CNSTI4 -100
ASGNI4
line 81
;80:			//yoffset = - trap_Cvar_VariableValue("vr_hudYOffset"); // TODO
;81:			xoffset = 120 - (depth * 20);
ADDRLP4 20
CNSTI4 120
ADDRLP4 32
INDIRI4
CNSTI4 20
MULI4
SUBI4
ASGNI4
line 83
;82:
;83:			if (cg.stereoView == STEREO_RIGHT) {
ADDRGP4 cg+282968
INDIRI4
CNSTI4 2
NEI4 $98
line 84
;84:				xoffset *= -1;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 -1
MULI4
ASGNI4
line 85
;85:			}
LABELV $98
line 87
;86:
;87:			*x += (cg.refdef.width  - (640 * screenXScale)) * 0.5f + xoffset;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
ADDRGP4 cg+236804+8
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRF4
CNSTF4 1142947840
MULF4
SUBF4
CNSTF4 1056964608
MULF4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDF4
ADDF4
ASGNF4
line 88
;88:			*y += (cg.refdef.height - (480 * screenYScale)) * 0.5f + yoffset;
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRGP4 cg+236804+12
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
CNSTF4 1139802112
MULF4
SUBF4
CNSTF4 1056964608
MULF4
ADDRLP4 24
INDIRI4
CVIF4 4
ADDF4
ADDF4
ASGNF4
line 89
;89:		}
line 90
;90:	}
LABELV $95
line 92
;91:#endif
;92:}
LABELV $87
endproc CG_AdjustFrom640 60 0
export CG_FillRect
proc CG_FillRect 0 36
line 103
;93:#endif
;94:
;95:
;96:/*
;97:================
;98:CG_FillRect
;99:
;100:Coordinates are 640*480 virtual values
;101:=================
;102:*/
;103:void CG_FillRect( float x, float y, float width, float height, const float *color ) {
line 104
;104:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 106
;105:
;106:	CG_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 107
;107:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cgs+150560+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 109
;108:
;109:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 110
;110:}
LABELV $105
endproc CG_FillRect 0 36
export CG_FillScreen
proc CG_FillScreen 0 36
line 119
;111:
;112:
;113:/*
;114:================
;115:CG_FillScreen
;116:================
;117:*/
;118:void CG_FillScreen( const float *color )
;119:{
line 120
;120:	trap_R_SetColor( color );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 121
;121:	trap_R_DrawStretchPic( 0, 0, cgs.glconfig.vidWidth, cgs.glconfig.vidHeight, 0, 0, 0, 0, cgs.media.whiteShader );
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cgs+150560+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 122
;122:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 123
;123:}
LABELV $108
endproc CG_FillScreen 0 36
export CG_DrawSides
proc CG_DrawSides 4 36
line 133
;124:
;125:
;126:/*
;127:================
;128:CG_DrawSides
;129:
;130:Coords are virtual 640x480
;131:================
;132:*/
;133:void CG_DrawSides(float x, float y, float w, float h, float size) {
line 134
;134:	CG_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 135
;135:	size *= cgs.screenXScale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 cgs+31448
INDIRF4
MULF4
ASGNF4
line 136
;136:	trap_R_DrawStretchPic( x, y, size, h, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cgs+150560+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 137
;137:	trap_R_DrawStretchPic( x + w - size, y, size, h, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 0
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cgs+150560+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 138
;138:}
LABELV $115
endproc CG_DrawSides 4 36
export CG_DrawTopBottom
proc CG_DrawTopBottom 4 36
line 141
;139:
;140:
;141:void CG_DrawTopBottom(float x, float y, float w, float h, float size) {
line 142
;142:	CG_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 143
;143:	size *= cgs.screenYScale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 cgs+31452
INDIRF4
MULF4
ASGNF4
line 144
;144:	trap_R_DrawStretchPic( x, y, w, size, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cgs+150560+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 145
;145:	trap_R_DrawStretchPic( x, y + h - size, w, size, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 0
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cgs+150560+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 146
;146:}
LABELV $121
endproc CG_DrawTopBottom 4 36
export CG_DrawRect
proc CG_DrawRect 0 20
line 156
;147:
;148:
;149:/*
;150:================
;151:UI_DrawRect
;152:
;153:Coordinates are 640*480 virtual values
;154:=================
;155:*/
;156:void CG_DrawRect( float x, float y, float width, float height, float size, const float *color ) {
line 157
;157:	trap_R_SetColor( color );
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 159
;158:
;159:	CG_DrawTopBottom(x, y, width, height, size);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 CG_DrawTopBottom
CALLV
pop
line 160
;160:	CG_DrawSides(x, y, width, height, size);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 CG_DrawSides
CALLV
pop
line 162
;161:
;162:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 163
;163:}
LABELV $127
endproc CG_DrawRect 0 20
export CG_DrawPic
proc CG_DrawPic 0 36
line 173
;164:
;165:
;166:/*
;167:================
;168:CG_DrawPic
;169:
;170:Coordinates are 640*480 virtual values
;171:=================
;172:*/
;173:void CG_DrawPic( float x, float y, float width, float height, qhandle_t hShader ) {
line 174
;174:	CG_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 175
;175:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 1, 1, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 176
;176:}
LABELV $128
endproc CG_DrawPic 0 36
export CG_DrawGradientPic
proc CG_DrawGradientPic 16 36
line 184
;177:
;178:#ifdef USE_NEOHUD
;179:/*
;180:================
;181:CG_DrawGradientPic
;182:=================
;183:*/
;184:void CG_DrawGradientPic(item_t *itm, float x, float y, float width, float height, float s1, float t1, float s2, float t2, qhandle_t hShader) {
line 186
;185:	float _s1, _s2, _t1, _t2;
;186:	_s1 = s1;
ADDRLP4 0
ADDRFP4 20
INDIRF4
ASGNF4
line 187
;187:	_s2 = s2;
ADDRLP4 4
ADDRFP4 28
INDIRF4
ASGNF4
line 188
;188:	_t1 = t1;
ADDRLP4 8
ADDRFP4 24
INDIRF4
ASGNF4
line 189
;189:	_t2 = t2;
ADDRLP4 12
ADDRFP4 32
INDIRF4
ASGNF4
line 190
;190:	if (itm->iconFlags & ICON_INVERT_W) {
ADDRFP4 0
INDIRP4
CNSTI4 1056
ADDP4
INDIRU4
CNSTU4 16
BANDU4
CNSTU4 0
EQU4 $130
line 191
;191:		_s1 = s2;
ADDRLP4 0
ADDRFP4 28
INDIRF4
ASGNF4
line 192
;192:		_s2 = s1;
ADDRLP4 4
ADDRFP4 20
INDIRF4
ASGNF4
line 194
;193:		//x += width;
;194:	}
LABELV $130
line 195
;195:	if (itm->iconFlags & ICON_INVERT_H) {
ADDRFP4 0
INDIRP4
CNSTI4 1056
ADDP4
INDIRU4
CNSTU4 32
BANDU4
CNSTU4 0
EQU4 $132
line 196
;196:		_t1 = t2;
ADDRLP4 8
ADDRFP4 32
INDIRF4
ASGNF4
line 197
;197:		_t2 = t1;
ADDRLP4 12
ADDRFP4 24
INDIRF4
ASGNF4
line 198
;198:		y += height;
ADDRFP4 8
ADDRFP4 8
INDIRF4
ADDRFP4 16
INDIRF4
ADDF4
ASGNF4
line 199
;199:	}
LABELV $132
line 200
;200:	CG_AdjustFrom640(&x, &y, &width, &height);
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRFP4 16
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 201
;201:	trap_R_DrawStretchPic(x, y, width, height, _s1, _t1, _s2, _t2, hShader);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 202
;202:}
LABELV $129
endproc CG_DrawGradientPic 16 36
proc CG_DrawChar 48 36
line 212
;203:#endif
;204:
;205:/*
;206:===============
;207:CG_DrawChar
;208:
;209:Coordinates and size in 640*480 virtual screen size
;210:===============
;211:*/
;212:static void CG_DrawChar( int x, int y, int width, int height, int ch ) {
line 218
;213:	int row, col;
;214:	float frow, fcol;
;215:	float size;
;216:	float	ax, ay, aw, ah;
;217:
;218:	ch &= 255;
ADDRFP4 16
ADDRFP4 16
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 220
;219:
;220:	if ( ch == ' ' ) {
ADDRFP4 16
INDIRI4
CNSTI4 32
NEI4 $135
line 221
;221:		return;
ADDRGP4 $134
JUMPV
LABELV $135
line 224
;222:	}
;223:
;224:	ax = x;
ADDRLP4 12
ADDRFP4 0
INDIRI4
CVIF4 4
ASGNF4
line 225
;225:	ay = y;
ADDRLP4 16
ADDRFP4 4
INDIRI4
CVIF4 4
ASGNF4
line 226
;226:	aw = width;
ADDRLP4 20
ADDRFP4 8
INDIRI4
CVIF4 4
ASGNF4
line 227
;227:	ah = height;
ADDRLP4 24
ADDRFP4 12
INDIRI4
CVIF4 4
ASGNF4
line 228
;228:	CG_AdjustFrom640( &ax, &ay, &aw, &ah );
ADDRLP4 12
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 230
;229:
;230:	row = ch>>4;
ADDRLP4 28
ADDRFP4 16
INDIRI4
CNSTI4 4
RSHI4
ASGNI4
line 231
;231:	col = ch&15;
ADDRLP4 32
ADDRFP4 16
INDIRI4
CNSTI4 15
BANDI4
ASGNI4
line 233
;232:
;233:	frow = row*0.0625;
ADDRLP4 0
ADDRLP4 28
INDIRI4
CVIF4 4
CNSTF4 1031798784
MULF4
ASGNF4
line 234
;234:	fcol = col*0.0625;
ADDRLP4 4
ADDRLP4 32
INDIRI4
CVIF4 4
CNSTF4 1031798784
MULF4
ASGNF4
line 235
;235:	size = 0.0625;
ADDRLP4 8
CNSTF4 1031798784
ASGNF4
line 237
;236:
;237:	trap_R_DrawStretchPic( ax, ay, aw, ah,
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRGP4 cgs+150560
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 241
;238:					   fcol, frow, 
;239:					   fcol + size, frow + size, 
;240:					   cgs.media.charsetShader );
;241:}
LABELV $134
endproc CG_DrawChar 48 36
export CG_DrawStringExt
proc CG_DrawStringExt 36 20
line 255
;242:
;243:
;244:/*
;245:==================
;246:CG_DrawStringExt
;247:
;248:Draws a multi-colored string with a drop shadow, optionally forcing
;249:to a fixed color.
;250:
;251:Coordinates are at 640 by 480 virtual resolution
;252:==================
;253:*/
;254:void CG_DrawStringExt( int x, int y, const char *string, const float *setColor, 
;255:		qboolean forceColor, qboolean shadow, int charWidth, int charHeight, int maxChars ) {
line 261
;256:	vec4_t		color;
;257:	const char	*s;
;258:	int			xx;
;259:	int			cnt;
;260:
;261:	if (maxChars <= 0)
ADDRFP4 32
INDIRI4
CNSTI4 0
GTI4 $139
line 262
;262:		maxChars = 32767; // do them all!
ADDRFP4 32
CNSTI4 32767
ASGNI4
LABELV $139
line 265
;263:
;264:	// draw the drop shadow
;265:	if (shadow) {
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $141
line 266
;266:		color[0] = color[1] = color[2] = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 28
INDIRF4
ASGNF4
line 267
;267:		color[3] = setColor[3];
ADDRLP4 12+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 268
;268:		trap_R_SetColor( color );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 269
;269:		s = string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 270
;270:		xx = x;
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
line 271
;271:		cnt = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $147
JUMPV
LABELV $146
line 272
;272:		while ( *s && cnt < maxChars) {
line 273
;273:			if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $149
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $149
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $149
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $149
line 274
;274:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 275
;275:				continue;
ADDRGP4 $147
JUMPV
LABELV $149
line 277
;276:			}
;277:			CG_DrawChar( xx + 2, y + 2, charWidth, charHeight, *s );
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 278
;278:			cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 279
;279:			xx += charWidth;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRFP4 24
INDIRI4
ADDI4
ASGNI4
line 280
;280:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 281
;281:		}
LABELV $147
line 272
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $151
ADDRLP4 8
INDIRI4
ADDRFP4 32
INDIRI4
LTI4 $146
LABELV $151
line 282
;282:	}
LABELV $141
line 285
;283:
;284:	// draw the colored text
;285:	s = string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 286
;286:	xx = x;
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
line 287
;287:	cnt = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 288
;288:	trap_R_SetColor( setColor );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
ADDRGP4 $153
JUMPV
LABELV $152
line 289
;289:	while ( *s && cnt < maxChars) {
line 290
;290:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $155
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $155
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $155
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $155
line 291
;291:			if ( !forceColor ) {
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $157
line 292
;292:				memcpy( color, g_color_table[ColorIndex(*(s+1))], sizeof( color ) );
ADDRLP4 12
ARGP4
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
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 293
;293:				color[3] = setColor[3];
ADDRLP4 12+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 294
;294:				trap_R_SetColor( color );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 295
;295:			}
LABELV $157
line 296
;296:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 297
;297:			continue;
ADDRGP4 $153
JUMPV
LABELV $155
line 299
;298:		}
;299:		CG_DrawChar( xx, y, charWidth, charHeight, *s );
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 300
;300:		xx += charWidth;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRFP4 24
INDIRI4
ADDI4
ASGNI4
line 301
;301:		cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 302
;302:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 303
;303:	}
LABELV $153
line 289
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $160
ADDRLP4 8
INDIRI4
ADDRFP4 32
INDIRI4
LTI4 $152
LABELV $160
line 304
;304:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 305
;305:}
LABELV $138
endproc CG_DrawStringExt 36 20
data
align 4
LABELV font
address bigchars
align 4
LABELV metrics
address bigchars
export CG_SelectFont
code
proc CG_SelectFont 0 0
line 336
;306:
;307:
;308:// new font renderer
;309:
;310:#ifdef USE_NEW_FONT_RENDERER
;311:
;312:#define MAX_FONT_SHADERS 4
;313:
;314:typedef struct {
;315:	float tc_prop[4];
;316:	float tc_mono[4];
;317:	float space1;
;318:	float space2;
;319:	float width;
;320:} font_metric_t;
;321:
;322:typedef struct {
;323:	font_metric_t	metrics[256];
;324:	qhandle_t		shader[ MAX_FONT_SHADERS ];
;325:	int				shaderThreshold[ MAX_FONT_SHADERS ];
;326:	int				shaderCount;
;327:} font_t;
;328:
;329:static font_t bigchars;
;330:static font_t numbers;
;331:static const font_t *font = &bigchars;
;332:static const font_metric_t *metrics = &bigchars.metrics[0];
;333:
;334:#ifdef USE_NEOHUD
;335:void CG_SelectFont( int textFlags ) 
;336:{
line 337
;337:	if ( textFlags & DS_FONT_NUMBER )
ADDRFP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $164
line 338
;338:		font = &numbers;
ADDRGP4 font
ADDRGP4 numbers
ASGNP4
ADDRGP4 $165
JUMPV
LABELV $164
line 340
;339:	else //if(textFlags & DS_FONT_LETTER)
;340:		font = &bigchars;
ADDRGP4 font
ADDRGP4 bigchars
ASGNP4
LABELV $165
line 342
;341:
;342:	metrics = &font->metrics[0];
ADDRGP4 metrics
ADDRGP4 font
INDIRP4
ASGNP4
line 343
;343:}
LABELV $163
endproc CG_SelectFont 0 0
proc CG_FileExist 8 12
line 358
;344:#else
;345:void CG_SelectFont( int index ) 
;346:{
;347:	if ( index == 0 )
;348:		font = &bigchars;
;349:	else
;350:		font = &numbers;
;351:
;352:	metrics = &font->metrics[0];
;353:}
;354:
;355:#endif
;356:
;357:static qboolean CG_FileExist( const char *file )
;358:{
line 361
;359:	fileHandle_t	f;
;360:
;361:	if ( !file || !file[0] )
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $169
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $167
LABELV $169
line 362
;362:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $166
JUMPV
LABELV $167
line 364
;363:	
;364:	trap_FS_FOpenFile( file, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 365
;365:	if ( f == FS_INVALID_HANDLE )
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $170
line 366
;366:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $166
JUMPV
LABELV $170
line 367
;367:	else {
line 368
;368:		trap_FS_FCloseFile( f );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 369
;369:		return qtrue;
CNSTI4 1
RETI4
LABELV $166
endproc CG_FileExist 8 12
proc CG_LoadFont 8508 16
line 375
;370:	}
;371:}
;372:
;373:
;374:static void CG_LoadFont( font_t *fnt, const char *fontName )
;375:{
line 392
;376:	char buf[ 8000 ];
;377:	fileHandle_t f;
;378:	char *token, *text;
;379:	float width, height, r_width, r_height;
;380:	float char_width;
;381:	float char_height;
;382:	char shaderName[ MAX_FONT_SHADERS ][ MAX_QPATH ], tmpName[ MAX_QPATH ];
;383:	int shaderCount;
;384:	int shaderThreshold[ MAX_FONT_SHADERS ];
;385:	font_metric_t *fm;
;386:	int i, tmp, len, chars;
;387:	float w1, w2;
;388:	float s1, s2;
;389:	float x0, y0;
;390:	qboolean swapped;
;391:
;392:	memset( fnt, 0, sizeof( *fnt ) );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 11300
ARGI4
ADDRGP4 memset
CALLP4
pop
line 394
;393:
;394:	len = trap_FS_FOpenFile( fontName, &f, FS_READ );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8420
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8424
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 416
ADDRLP4 8424
INDIRI4
ASGNI4
line 395
;395:	if ( f == FS_INVALID_HANDLE ) {
ADDRLP4 8420
INDIRI4
CNSTI4 0
NEI4 $173
line 396
;396:		CG_Printf( S_COLOR_YELLOW "CG_LoadFont: error opening %s\n", fontName );
ADDRGP4 $175
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 397
;397:		return;
ADDRGP4 $172
JUMPV
LABELV $173
line 400
;398:	}
;399:
;400:	if ( len >= sizeof( buf ) ) {
ADDRLP4 416
INDIRI4
CVIU4 4
CNSTU4 8000
LTU4 $176
line 401
;401:		CG_Printf( S_COLOR_YELLOW "CG_LoadFont: font file is too long: %i\n", len );
ADDRGP4 $178
ARGP4
ADDRLP4 416
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 402
;402:		len = sizeof( buf )-1;
ADDRLP4 416
CNSTI4 7999
ASGNI4
line 403
;403:	}
LABELV $176
line 405
;404:
;405:	trap_FS_Read( buf, len, f );
ADDRLP4 420
ARGP4
ADDRLP4 416
INDIRI4
ARGI4
ADDRLP4 8420
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 406
;406:	trap_FS_FCloseFile( f );
ADDRLP4 8420
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 407
;407:	buf[ len ] = '\0';
ADDRLP4 416
INDIRI4
ADDRLP4 420
ADDP4
CNSTI1 0
ASGNI1
line 409
;408:
;409:	shaderCount = 0;
ADDRLP4 284
CNSTI4 0
ASGNI4
line 411
;410:
;411:	text = buf; // initialize parser
ADDRLP4 288
ADDRLP4 420
ASGNP4
line 412
;412:	COM_BeginParseSession( fontName );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 COM_BeginParseSession
CALLV
pop
ADDRGP4 $180
JUMPV
LABELV $179
line 415
;413:
;414:	while ( 1 )
;415:	{
line 416
;416:		token = COM_ParseExt( &text, qtrue );
ADDRLP4 288
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8428
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8428
INDIRP4
ASGNP4
line 417
;417:		if ( token[0] == '\0' ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $182
line 418
;418:			Com_Printf( S_COLOR_RED "CG_LoadFont: parse error.\n" );
ADDRGP4 $184
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 419
;419:			return;
ADDRGP4 $172
JUMPV
LABELV $182
line 423
;420:		}
;421:
;422:		// font image
;423:		if ( strcmp( token, "img" ) == 0 ) {
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 $187
ARGP4
ADDRLP4 8432
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8432
INDIRI4
CNSTI4 0
NEI4 $185
line 424
;424:			if ( shaderCount >= MAX_FONT_SHADERS ) {
ADDRLP4 284
INDIRI4
CNSTI4 4
LTI4 $188
line 425
;425:				Com_Printf( "CG_LoadFont: too many font images, ignoring.\n" );
ADDRGP4 $190
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 426
;426:				SkipRestOfLine( &text );
ADDRLP4 288
ARGP4
ADDRGP4 SkipRestOfLine
CALLV
pop
line 427
;427:				continue;
ADDRGP4 $180
JUMPV
LABELV $188
line 429
;428:			}
;429:			token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8436
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8436
INDIRP4
ASGNP4
line 430
;430:			if ( !CG_FileExist( token ) ) {
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8440
ADDRGP4 CG_FileExist
CALLI4
ASGNI4
ADDRLP4 8440
INDIRI4
CNSTI4 0
NEI4 $191
line 431
;431:				Com_Printf( "CG_LoadFont: font image '%s' doesn't exist.\n", token );
ADDRGP4 $193
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 432
;432:				return;
ADDRGP4 $172
JUMPV
LABELV $191
line 435
;433:			}
;434:			// save shader name
;435:			Q_strncpyz( shaderName[ shaderCount ], token, sizeof( shaderName[ shaderCount ] ) );
ADDRLP4 284
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 24
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 437
;436:			// get threshold
;437:			token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8444
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8444
INDIRP4
ASGNP4
line 438
;438:			shaderThreshold[ shaderCount ] = atoi( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8448
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 8448
INDIRI4
ASGNI4
line 441
;439:
;440:			//Com_Printf( S_COLOR_CYAN "img: %s, threshold: %i\n", shaderName[ shaderCount ], shaderThreshold[ shaderCount ] );
;441:			shaderCount++;
ADDRLP4 284
ADDRLP4 284
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 443
;442:			
;443:			SkipRestOfLine( &text );
ADDRLP4 288
ARGP4
ADDRGP4 SkipRestOfLine
CALLV
pop
line 444
;444:			continue;
ADDRGP4 $180
JUMPV
LABELV $185
line 448
;445:		}
;446:
;447:		// font parameters
;448:		if ( strcmp( token, "fnt" ) == 0 ) {
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 $196
ARGP4
ADDRLP4 8436
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8436
INDIRI4
CNSTI4 0
NEI4 $194
line 449
;449:			token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8440
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8440
INDIRP4
ASGNP4
line 450
;450:			if ( token[0] == '\0' || (width = atof( token )) <= 0.0 ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $199
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8448
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 408
ADDRLP4 8448
INDIRF4
ASGNF4
ADDRLP4 8448
INDIRF4
CNSTF4 0
GTF4 $197
LABELV $199
line 451
;451:				Com_Printf( "CG_LoadFont: error reading image width.\n" );
ADDRGP4 $200
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 452
;452:				return;
ADDRGP4 $172
JUMPV
LABELV $197
line 454
;453:			}
;454:			r_width = 1.0 / width;
ADDRLP4 364
CNSTF4 1065353216
ADDRLP4 408
INDIRF4
DIVF4
ASGNF4
line 456
;455:
;456:			token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8452
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8452
INDIRP4
ASGNP4
line 457
;457:			if ( token[0] == '\0' || (height = atof( token )) <= 0.0 ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $203
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8460
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 412
ADDRLP4 8460
INDIRF4
ASGNF4
ADDRLP4 8460
INDIRF4
CNSTF4 0
GTF4 $201
LABELV $203
line 458
;458:				Com_Printf( "CG_LoadFont: error reading image height.\n" );
ADDRGP4 $204
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 459
;459:				return;
ADDRGP4 $172
JUMPV
LABELV $201
line 461
;460:			}
;461:			r_height = 1.0 / height;
ADDRLP4 384
CNSTF4 1065353216
ADDRLP4 412
INDIRF4
DIVF4
ASGNF4
line 463
;462:			
;463:			token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8464
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8464
INDIRP4
ASGNP4
line 464
;464:			if ( token[0] == '\0' ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $205
line 465
;465:				Com_Printf( "CG_LoadFont: error reading char widht.\n" );
ADDRGP4 $207
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 466
;466:				return;
ADDRGP4 $172
JUMPV
LABELV $205
line 468
;467:			}
;468:			char_width = atof( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8468
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 368
ADDRLP4 8468
INDIRF4
ASGNF4
line 470
;469:
;470:			token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8472
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8472
INDIRP4
ASGNP4
line 471
;471:			if ( token[0] == '\0' ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $208
line 472
;472:				Com_Printf( "CG_LoadFont: error reading char height.\n" );
ADDRGP4 $210
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 473
;473:				return;
ADDRGP4 $172
JUMPV
LABELV $208
line 475
;474:			}
;475:			char_height = atof( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8476
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 400
ADDRLP4 8476
INDIRF4
ASGNF4
line 477
;476:
;477:			break; // parse char metrics
ADDRGP4 $181
JUMPV
LABELV $194
line 479
;478:		}
;479:	}
LABELV $180
line 414
ADDRGP4 $179
JUMPV
LABELV $181
line 481
;480:
;481:	if ( shaderCount == 0 ) {
ADDRLP4 284
INDIRI4
CNSTI4 0
NEI4 $211
line 482
;482:		Com_Printf( "CG_LoadFont: no font images specified in %s.\n", fontName );
ADDRGP4 $213
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 483
;483:		return;
ADDRGP4 $172
JUMPV
LABELV $211
line 486
;484:	}
;485:
;486:	fm = fnt->metrics;
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
line 488
;487:
;488:	chars = 0;
ADDRLP4 404
CNSTI4 0
ASGNI4
line 489
;489:	for ( ;; ) {
LABELV $214
line 491
;490:		// char index
;491:		token = COM_ParseExt( &text, qtrue );
ADDRLP4 288
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8428
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8428
INDIRP4
ASGNP4
line 492
;492:		if ( !token[0] )
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $218
line 493
;493:			break;
ADDRGP4 $216
JUMPV
LABELV $218
line 495
;494:
;495:		if ( token[0] == '\'' && token[1] && token[2] == '\'' ) // char code in form 'X'
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 39
NEI4 $220
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $220
ADDRLP4 20
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 39
NEI4 $220
line 496
;496:			i = token[1] & 255;
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 255
BANDI4
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $220
line 498
;497:		else // integer code
;498:			i = atoi( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8436
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8436
INDIRI4
ASGNI4
LABELV $221
line 500
;499:
;500:		if ( i < 0 || i > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $224
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $222
LABELV $224
line 501
;501:			CG_Printf( S_COLOR_RED "CG_LoadFont: bad char index %i.\n", i );
ADDRGP4 $225
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 502
;502:			return;
ADDRGP4 $172
JUMPV
LABELV $222
line 504
;503:		}
;504:		fm = fnt->metrics + i;
ADDRLP4 280
ADDRLP4 0
INDIRI4
CNSTI4 44
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
line 507
;505:
;506:		// x0
;507:		token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8444
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8444
INDIRP4
ASGNP4
line 508
;508:		if ( !token[0] ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $226
line 509
;509:			CG_Printf( S_COLOR_RED "CG_LoadFont: error reading x0.\n" );
ADDRGP4 $228
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 510
;510:			return;
ADDRGP4 $172
JUMPV
LABELV $226
line 512
;511:		}
;512:		x0 = atof( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8448
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 376
ADDRLP4 8448
INDIRF4
ASGNF4
line 515
;513:	
;514:		// y0
;515:		token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8452
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8452
INDIRP4
ASGNP4
line 516
;516:		if ( !token[0] ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $229
line 517
;517:			CG_Printf( S_COLOR_RED "CG_LoadFont: error reading y0.\n" );
ADDRGP4 $231
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 518
;518:			return;
ADDRGP4 $172
JUMPV
LABELV $229
line 520
;519:		}
;520:		y0 = atof( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8456
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 380
ADDRLP4 8456
INDIRF4
ASGNF4
line 523
;521:		
;522:		// w1-offset
;523:		token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8460
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8460
INDIRP4
ASGNP4
line 524
;524:		if ( !token[0] ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $232
line 525
;525:			CG_Printf( S_COLOR_RED "CG_LoadFont: error reading x-offset.\n" );
ADDRGP4 $234
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 526
;526:			return;
ADDRGP4 $172
JUMPV
LABELV $232
line 528
;527:		}
;528:		w1 = atof( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8464
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 388
ADDRLP4 8464
INDIRF4
ASGNF4
line 531
;529:
;530:		// w2-offset
;531:		token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8468
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8468
INDIRP4
ASGNP4
line 532
;532:		if ( !token[0] ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $235
line 533
;533:			CG_Printf( S_COLOR_RED "CG_LoadFont: error reading x-length.\n" );
ADDRGP4 $237
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 534
;534:			return;
ADDRGP4 $172
JUMPV
LABELV $235
line 536
;535:		}
;536:		w2 = atof( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8472
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 372
ADDRLP4 8472
INDIRF4
ASGNF4
line 539
;537:
;538:		// space1
;539:		token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8476
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8476
INDIRP4
ASGNP4
line 540
;540:		if ( !token[0] ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $238
line 541
;541:			CG_Printf( S_COLOR_RED "CG_LoadFont: error reading space1.\n" );
ADDRGP4 $240
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 542
;542:			return;
ADDRGP4 $172
JUMPV
LABELV $238
line 544
;543:		}
;544:		s1 = atof( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8480
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 392
ADDRLP4 8480
INDIRF4
ASGNF4
line 547
;545:
;546:		// space2
;547:		token = COM_ParseExt( &text, qfalse );
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8484
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8484
INDIRP4
ASGNP4
line 548
;548:		if ( !token[0] ) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $241
line 549
;549:			CG_Printf( S_COLOR_RED "CG_LoadFont: error reading space2.\n" );
ADDRGP4 $243
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 550
;550:			return;
ADDRGP4 $172
JUMPV
LABELV $241
line 552
;551:		}
;552:		s2 = atof( token );
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8488
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 396
ADDRLP4 8488
INDIRF4
ASGNF4
line 554
;553:
;554:		fm->tc_mono[0] = x0 * r_width;
ADDRLP4 280
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 376
INDIRF4
ADDRLP4 364
INDIRF4
MULF4
ASGNF4
line 555
;555:		fm->tc_mono[1] = y0 * r_height;
ADDRLP4 280
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 380
INDIRF4
ADDRLP4 384
INDIRF4
MULF4
ASGNF4
line 556
;556:		fm->tc_mono[2] = ( x0 + char_width ) * r_width;
ADDRLP4 280
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 376
INDIRF4
ADDRLP4 368
INDIRF4
ADDF4
ADDRLP4 364
INDIRF4
MULF4
ASGNF4
line 557
;557:		fm->tc_mono[3] = ( y0 + char_height ) * r_height;
ADDRLP4 280
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 380
INDIRF4
ADDRLP4 400
INDIRF4
ADDF4
ADDRLP4 384
INDIRF4
MULF4
ASGNF4
line 560
;558:
;559:		// proportional y-coords is matching with mono
;560:		fm->tc_prop[1] = fm->tc_mono[1];
ADDRLP4 280
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 280
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 561
;561:		fm->tc_prop[3] = fm->tc_mono[3];
ADDRLP4 280
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 280
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 563
;562:
;563:		fm->width = w2 / char_width;
ADDRLP4 280
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 372
INDIRF4
ADDRLP4 368
INDIRF4
DIVF4
ASGNF4
line 564
;564:		fm->space1 = s1 / char_width;
ADDRLP4 280
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 392
INDIRF4
ADDRLP4 368
INDIRF4
DIVF4
ASGNF4
line 565
;565:		fm->space2 = (s2 + w2) / char_width;
ADDRLP4 280
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 396
INDIRF4
ADDRLP4 372
INDIRF4
ADDF4
ADDRLP4 368
INDIRF4
DIVF4
ASGNF4
line 566
;566:		fm->tc_prop[0] = fm->tc_mono[0] + (w1 * r_width);
ADDRLP4 280
INDIRP4
ADDRLP4 280
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 388
INDIRF4
ADDRLP4 364
INDIRF4
MULF4
ADDF4
ASGNF4
line 567
;567:		fm->tc_prop[2] = fm->tc_prop[0] + (w2 * r_width);
ADDRLP4 280
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 280
INDIRP4
INDIRF4
ADDRLP4 372
INDIRF4
ADDRLP4 364
INDIRF4
MULF4
ADDF4
ASGNF4
line 569
;568:
;569:		chars++;
ADDRLP4 404
ADDRLP4 404
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 571
;570:
;571:		SkipRestOfLine( &text );
ADDRLP4 288
ARGP4
ADDRGP4 SkipRestOfLine
CALLV
pop
line 572
;572:	}
line 489
ADDRGP4 $214
JUMPV
LABELV $216
LABELV $244
line 575
;573:
;574:	// sort images by threshold
;575:	do {
line 576
;576:		for ( swapped = qfalse, i = 1 ; i < shaderCount; i++ ) {
ADDRLP4 360
CNSTI4 0
ASGNI4
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $250
JUMPV
LABELV $247
line 577
;577:			if ( shaderThreshold[i-1] > shaderThreshold[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
LEI4 $251
line 578
;578:				tmp = shaderThreshold[i-1];
ADDRLP4 356
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ASGNI4
line 579
;579:				shaderThreshold[i-1] = shaderThreshold[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
line 580
;580:				shaderThreshold[i] = tmp;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 356
INDIRI4
ASGNI4
line 581
;581:				strcpy( tmpName, shaderName[i-1] );
ADDRLP4 292
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 24-64
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 582
;582:				strcpy( shaderName[i-1], shaderName[i] );
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 24-64
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 24
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 583
;583:				strcpy( shaderName[i], tmpName );
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 24
ADDP4
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 584
;584:				swapped = qtrue;
ADDRLP4 360
CNSTI4 1
ASGNI4
line 585
;585:			}
LABELV $251
line 586
;586:		}
LABELV $248
line 576
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $250
ADDRLP4 0
INDIRI4
ADDRLP4 284
INDIRI4
LTI4 $247
line 587
;587:	} while ( swapped );
LABELV $245
ADDRLP4 360
INDIRI4
CNSTI4 0
NEI4 $244
line 590
;588:
;589:	// always assume zero threshold for lowest-quality shader
;590:	shaderThreshold[0] = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 592
;591:	
;592:	fnt->shaderCount = shaderCount;
ADDRFP4 0
INDIRP4
CNSTI4 11296
ADDP4
ADDRLP4 284
INDIRI4
ASGNI4
line 593
;593:	for ( i = 0; i < shaderCount; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $261
JUMPV
LABELV $258
line 594
;594:		fnt->shader[i] = trap_R_RegisterShaderNoMip( shaderName[i] );
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 24
ADDP4
ARGP4
ADDRLP4 8432
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 11264
ADDP4
ADDP4
ADDRLP4 8432
INDIRI4
ASGNI4
line 595
;595:		fnt->shaderThreshold[i] = shaderThreshold[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 11280
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
line 596
;596:	}
LABELV $259
line 593
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $261
ADDRLP4 0
INDIRI4
ADDRLP4 284
INDIRI4
LTI4 $258
line 598
;597:
;598:	CG_Printf( "Font '%s' loaded with %i chars and %i images\n", fontName, chars, shaderCount );
ADDRGP4 $262
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 404
INDIRI4
ARGI4
ADDRLP4 284
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 599
;599:}
LABELV $172
endproc CG_LoadFont 8508 16
export CG_LoadFonts
proc CG_LoadFonts 0 8
line 603
;600:
;601:
;602:void CG_LoadFonts( void ) 
;603:{
line 604
;604:	CG_LoadFont( &bigchars, "gfx/2d/bigchars.cfg" );
ADDRGP4 bigchars
ARGP4
ADDRGP4 $264
ARGP4
ADDRGP4 CG_LoadFont
CALLV
pop
line 605
;605:	CG_LoadFont( &numbers, "gfx/2d/numbers.cfg" );
ADDRGP4 numbers
ARGP4
ADDRGP4 $265
ARGP4
ADDRGP4 CG_LoadFont
CALLV
pop
line 606
;606:}
LABELV $263
endproc CG_LoadFonts 0 8
proc DrawStringLength 20 0
line 610
;607:
;608:
;609:static float DrawStringLength( const char *string, float ax, float aw, float max_ax, int proportional )
;610:{
line 617
;611:	const font_metric_t	*fm;
;612:	//float			aw1;
;613:	float			x_end;
;614:	const byte		*s;
;615:	float			xx;
;616:
;617:	if ( !string )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $267
line 618
;618:		return 0.0f;
CNSTF4 0
RETF4
ADDRGP4 $266
JUMPV
LABELV $267
line 620
;619:
;620:	s = (const byte*)string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 622
;621:
;622:	xx = ax;
ADDRLP4 12
ADDRFP4 4
INDIRF4
ASGNF4
ADDRGP4 $270
JUMPV
LABELV $269
line 624
;623:
;624:	while ( *s != '\0' ) {
line 626
;625:
;626:		if ( *s == Q_COLOR_ESCAPE && s[1] != '\0' && s[1] != '^' ) {
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 94
NEI4 $272
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 0
EQI4 $272
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 94
EQI4 $272
line 628
;627:			//if ( !(flags & DS_SHOW_CODE) ) {
;628:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 629
;629:			continue;
ADDRGP4 $270
JUMPV
LABELV $272
line 634
;630:			//}
;631:		}
;632:
;633:		//fm = &font->metrics[ *s ];
;634:		fm = &metrics[ *s ];
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 44
MULI4
ADDRGP4 metrics
INDIRP4
ADDP4
ASGNP4
line 635
;635:		if ( proportional ) {
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $274
line 637
;636:			//aw1 = fm->width * aw;
;637:			ax += fm->space1 * aw;			// add extra space if required by metrics
ADDRFP4 4
ADDRFP4 4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 638
;638:			x_end = ax + fm->space2 * aw;	// final position
ADDRLP4 4
ADDRFP4 4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 639
;639:		} else {
ADDRGP4 $275
JUMPV
LABELV $274
line 641
;640:			//aw1 = aw;
;641:			x_end = ax + aw;
ADDRLP4 4
ADDRFP4 4
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ASGNF4
line 642
;642:		}
LABELV $275
line 644
;643:
;644:		if ( x_end > max_ax ) 
ADDRLP4 4
INDIRF4
ADDRFP4 12
INDIRF4
LEF4 $276
line 645
;645:			break;
ADDRGP4 $271
JUMPV
LABELV $276
line 647
;646:
;647:		ax = x_end;
ADDRFP4 4
ADDRLP4 4
INDIRF4
ASGNF4
line 648
;648:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 649
;649:	}
LABELV $270
line 624
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 0
NEI4 $269
LABELV $271
line 651
;650:
;651:	return (ax - xx);
ADDRFP4 4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
RETF4
LABELV $266
endproc DrawStringLength 20 0
export CG_DrawString
proc CG_DrawString 96 36
line 656
;652:}
;653:
;654:
;655:void CG_DrawString( float x, float y, const char *string, const vec4_t setColor, float charWidth, float charHeight, int maxChars, int flags ) 
;656:{
line 670
;657:	const font_metric_t *fm;
;658:	const float		*tc; // texture coordinates for char
;659:	float			ax, ay, aw, aw1, ah; // absolute positions/dimensions
;660:	float			scale;
;661:	float			x_end, xx;
;662:	vec4_t			color;
;663:	const byte		*s;
;664:	float			xx_add, yy_add;
;665:	float			max_ax;
;666:	int				i;
;667:	qhandle_t		sh;
;668:	int				proportional;
;669:
;670:	if ( !string )
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $279
line 671
;671:		return;
ADDRGP4 $278
JUMPV
LABELV $279
line 673
;672:
;673:	s = (const byte *)string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 681
;674:#ifndef USE_NEOHUD
;675:	ax = x * cgs.screenXScale + cgs.screenXBias;
;676:	ay = y * cgs.screenYScale + cgs.screenYBias;
;677:
;678:	aw = charWidth * cgs.screenXScale;
;679:	ah = charHeight * cgs.screenYScale;
;680:#else
;681:	ax = x;
ADDRLP4 8
ADDRFP4 0
INDIRF4
ASGNF4
line 682
;682:	ay = y;
ADDRLP4 40
ADDRFP4 4
INDIRF4
ASGNF4
line 683
;683:	aw = charWidth;
ADDRLP4 20
ADDRFP4 16
INDIRF4
ASGNF4
line 684
;684:	ah = charHeight;
ADDRLP4 32
ADDRFP4 20
INDIRF4
ASGNF4
line 686
;685:
;686:	CG_AdjustFrom640(&ax, &ay, &aw, &ah);
ADDRLP4 8
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 689
;687:#endif
;688:
;689:	if ( maxChars <= 0 ) {
ADDRFP4 24
INDIRI4
CNSTI4 0
GTI4 $281
line 690
;690:		max_ax = 9999999.0f;
ADDRLP4 44
CNSTF4 1259902591
ASGNF4
line 691
;691:	} else {
ADDRGP4 $282
JUMPV
LABELV $281
line 692
;692:		max_ax = ax + aw * maxChars;
ADDRLP4 44
ADDRLP4 8
INDIRF4
ADDRLP4 20
INDIRF4
ADDRFP4 24
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 693
;693:	}
LABELV $282
line 695
;694:
;695:	proportional = (flags & DS_PROPORTIONAL);
ADDRLP4 48
ADDRFP4 28
INDIRI4
CNSTI4 4
BANDI4
ASGNI4
line 697
;696:
;697:	if ( flags & ( DS_CENTER | DS_RIGHT ) ) {
ADDRFP4 28
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
EQI4 $283
line 698
;698:		if ( flags & DS_CENTER ) {
ADDRFP4 28
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $285
line 699
;699:			ax -= 0.5f * DrawStringLength( string, ax, aw, max_ax, proportional );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 84
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 DrawStringLength
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 84
INDIRF4
ADDRLP4 88
INDIRF4
CNSTF4 1056964608
MULF4
SUBF4
ASGNF4
line 700
;700:		} else {
ADDRGP4 $286
JUMPV
LABELV $285
line 701
;701:			ax -= DrawStringLength( string, ax, aw, max_ax, proportional );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 84
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 DrawStringLength
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 84
INDIRF4
ADDRLP4 88
INDIRF4
SUBF4
ASGNF4
line 702
;702:		}
LABELV $286
line 703
;703:	}
LABELV $283
line 705
;704:
;705:	sh = font->shader[0]; // low-res shader by default
ADDRLP4 36
ADDRGP4 font
INDIRP4
CNSTI4 11264
ADDP4
INDIRI4
ASGNI4
line 707
;706:
;707:	if ( flags & DS_SHADOW ) { 
ADDRFP4 28
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $287
line 708
;708:		xx = ax;
ADDRLP4 80
ADDRLP4 8
INDIRF4
ASGNF4
line 711
;709:
;710:		// calculate shadow offsets
;711:		scale = charWidth * 0.075f; // charWidth/15
ADDRLP4 76
ADDRFP4 16
INDIRF4
CNSTF4 1033476506
MULF4
ASGNF4
line 712
;712:		xx_add = scale * cgs.screenXScale;
ADDRLP4 68
ADDRLP4 76
INDIRF4
ADDRGP4 cgs+31448
INDIRF4
MULF4
ASGNF4
line 713
;713:		yy_add = scale * cgs.screenYScale;
ADDRLP4 72
ADDRLP4 76
INDIRF4
ADDRGP4 cgs+31452
INDIRF4
MULF4
ASGNF4
line 715
;714:
;715:		color[0] = color[1] = color[2] = 0.0f;
ADDRLP4 84
CNSTF4 0
ASGNF4
ADDRLP4 52+8
ADDRLP4 84
INDIRF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 84
INDIRF4
ASGNF4
ADDRLP4 52
ADDRLP4 84
INDIRF4
ASGNF4
line 716
;716:		color[3] = setColor[3] * 0.5f;
ADDRLP4 52+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 717
;717:		trap_R_SetColor( color );
ADDRLP4 52
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
ADDRGP4 $295
JUMPV
LABELV $294
line 719
;718:
;719:		while ( *s != '\0' ) {
line 720
;720:			if ( *s == Q_COLOR_ESCAPE && s[1] != '\0' && s[1] != '^' ) {
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 94
NEI4 $297
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 0
EQI4 $297
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 94
EQI4 $297
line 722
;721:				//if ( !(options & DS_SHOW_CODE) ) {
;722:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 723
;723:				continue;
ADDRGP4 $295
JUMPV
LABELV $297
line 727
;724:				//}
;725:			}
;726:			//fm = &font->metrics[ *s ];
;727:			fm = &metrics[ *s ];
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 44
MULI4
ADDRGP4 metrics
INDIRP4
ADDP4
ASGNP4
line 728
;728:			if ( proportional ) {
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $299
line 729
;729:				tc = fm->tc_prop;
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 730
;730:				aw1 = fm->width * aw;
ADDRLP4 28
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 731
;731:				ax += fm->space1 * aw;			// add extra space if required by metrics
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 732
;732:				x_end = ax + fm->space2 * aw;	// final position
ADDRLP4 16
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 733
;733:			} else {
ADDRGP4 $300
JUMPV
LABELV $299
line 734
;734:				tc = fm->tc_mono;
ADDRLP4 4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
line 735
;735:				aw1 = aw;
ADDRLP4 28
ADDRLP4 20
INDIRF4
ASGNF4
line 736
;736:				x_end = ax + aw;
ADDRLP4 16
ADDRLP4 8
INDIRF4
ADDRLP4 20
INDIRF4
ADDF4
ASGNF4
line 737
;737:			}
LABELV $300
line 739
;738:
;739:			if ( x_end > max_ax || ax >= cgs.glconfig.vidWidth )
ADDRLP4 16
INDIRF4
ADDRLP4 44
INDIRF4
GTF4 $305
ADDRLP4 8
INDIRF4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
LTF4 $301
LABELV $305
line 740
;740:				break;
ADDRGP4 $296
JUMPV
LABELV $301
line 742
;741:
;742:			trap_R_DrawStretchPic( ax + xx_add, ay + yy_add, aw1, ah, tc[0], tc[1], tc[2], tc[3], sh );
ADDRLP4 8
INDIRF4
ADDRLP4 68
INDIRF4
ADDF4
ARGF4
ADDRLP4 40
INDIRF4
ADDRLP4 72
INDIRF4
ADDF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 744
;743:
;744:			ax = x_end;
ADDRLP4 8
ADDRLP4 16
INDIRF4
ASGNF4
line 745
;745:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 746
;746:		}
LABELV $295
line 719
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 0
NEI4 $294
LABELV $296
line 749
;747:
;748:		// recover altered parameters
;749:		s = (const byte*)string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 750
;750:		ax = xx;
ADDRLP4 8
ADDRLP4 80
INDIRF4
ASGNF4
line 751
;751:	}
LABELV $287
line 754
;752:
;753:	// select hi-res shader if accepted
;754:	for ( i = 1; i < font->shaderCount; i++ ) {
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $309
JUMPV
LABELV $306
line 755
;755:		if ( ah >= font->shaderThreshold[i] ) {
ADDRLP4 32
INDIRF4
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 font
INDIRP4
CNSTI4 11280
ADDP4
ADDP4
INDIRI4
CVIF4 4
LTF4 $310
line 756
;756:			sh = font->shader[i];
ADDRLP4 36
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 font
INDIRP4
CNSTI4 11264
ADDP4
ADDP4
INDIRI4
ASGNI4
line 757
;757:		}
LABELV $310
line 758
;758:	}
LABELV $307
line 754
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $309
ADDRLP4 24
INDIRI4
ADDRGP4 font
INDIRP4
CNSTI4 11296
ADDP4
INDIRI4
LTI4 $306
line 760
;759:	
;760:	Vector4Copy( setColor, color );
ADDRLP4 84
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 84
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 84
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 52+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 52+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 761
;761:	trap_R_SetColor( color );
ADDRLP4 52
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
ADDRGP4 $316
JUMPV
LABELV $315
line 763
;762:	
;763:	while ( *s != '\0' ) {
line 765
;764:
;765:		if ( *s == Q_COLOR_ESCAPE && s[1] != '\0' && s[1] != '^' ) {
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 94
NEI4 $318
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 0
EQI4 $318
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 94
EQI4 $318
line 766
;766:			if ( !( flags & DS_FORCE_COLOR ) ) {
ADDRFP4 28
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $320
line 767
;767:				VectorCopy( g_color_table[ ColorIndex( s[1] ) ], color );
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
INDIRB
ASGNB 12
line 768
;768:				trap_R_SetColor( color );
ADDRLP4 52
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 769
;769:			}
LABELV $320
line 771
;770:			//if ( !(options & DS_SHOW_CODE) ) {
;771:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 772
;772:			continue;
ADDRGP4 $316
JUMPV
LABELV $318
line 777
;773:			//}
;774:		}
;775:
;776:		//fm = &font->metrics[ *s ];
;777:		fm = &metrics[ *s ];
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 44
MULI4
ADDRGP4 metrics
INDIRP4
ADDP4
ASGNP4
line 778
;778:		if ( proportional ) {
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $322
line 779
;779:			tc = fm->tc_prop;
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 780
;780:			aw1 = fm->width * aw;
ADDRLP4 28
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 781
;781:			ax += fm->space1 * aw;			// add extra space if required by metrics
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 782
;782:			x_end = ax + fm->space2 * aw;	// final position
ADDRLP4 16
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 783
;783:		} else {
ADDRGP4 $323
JUMPV
LABELV $322
line 784
;784:			tc = fm->tc_mono;
ADDRLP4 4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
line 785
;785:			aw1 = aw;
ADDRLP4 28
ADDRLP4 20
INDIRF4
ASGNF4
line 786
;786:			x_end = ax + aw;
ADDRLP4 16
ADDRLP4 8
INDIRF4
ADDRLP4 20
INDIRF4
ADDF4
ASGNF4
line 787
;787:		}
LABELV $323
line 789
;788:
;789:		if ( x_end > max_ax || ax >= cgs.glconfig.vidWidth )
ADDRLP4 16
INDIRF4
ADDRLP4 44
INDIRF4
GTF4 $328
ADDRLP4 8
INDIRF4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
LTF4 $324
LABELV $328
line 790
;790:			break;
ADDRGP4 $317
JUMPV
LABELV $324
line 792
;791:
;792:		trap_R_DrawStretchPic( ax, ay, aw1, ah, tc[0], tc[1], tc[2], tc[3], sh );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 794
;793:
;794:		ax = x_end;
ADDRLP4 8
ADDRLP4 16
INDIRF4
ASGNF4
line 795
;795:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 796
;796:	}
LABELV $316
line 763
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 0
NEI4 $315
LABELV $317
line 799
;797:
;798:	//trap_R_SetColor( NULL );// already commented out in q3e
;799:}
LABELV $278
endproc CG_DrawString 96 36
export CG_DrawStrlen
proc CG_DrawStrlen 12 0
line 848
;800:#else
;801:
;802:
;803:static float DrawStringLen( const char *s, float charWidth ) 
;804:{
;805:	int count;
;806:	count = 0;
;807:	while ( *s ) {
;808:		if ( Q_IsColorString( s ) ) {
;809:			s += 2;
;810:		} else {
;811:			count++;
;812:			s++;
;813:		}
;814:	}
;815:	return count * charWidth;
;816:}
;817:
;818:
;819:void CG_DrawString( float x, float y, const char *s, const vec4_t color, float charWidth, float charHeight, int maxChars, int flags )
;820:{
;821:	if ( !color ) 
;822:	{
;823:		color = g_color_table[ ColorIndex( COLOR_WHITE ) ];
;824:	}
;825:
;826:	if ( flags & ( DS_CENTER | DS_RIGHT ) )
;827:	{
;828:		float w;
;829:		w = DrawStringLen( s, charWidth );
;830:		if ( flags & DS_CENTER )
;831:			x -= w * 0.5f;
;832:		else
;833:			x -= w;
;834:	}
;835:
;836:	CG_DrawStringExt( x, y, s, color, flags & DS_FORCE_COLOR, flags & DS_SHADOW, charWidth, charHeight, maxChars );
;837:}
;838:#endif
;839:
;840:
;841:/*
;842:=================
;843:CG_DrawStrlen
;844:
;845:Returns character count, skiping color escape codes
;846:=================
;847:*/
;848:int CG_DrawStrlen( const char *str ) {
line 849
;849:	const char *s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 850
;850:	int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $331
JUMPV
LABELV $330
line 852
;851:
;852:	while ( *s ) {
line 853
;853:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $333
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $333
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $333
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $333
line 854
;854:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 855
;855:		} else {
ADDRGP4 $334
JUMPV
LABELV $333
line 856
;856:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 857
;857:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 858
;858:		}
LABELV $334
line 859
;859:	}
LABELV $331
line 852
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $330
line 861
;860:
;861:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $329
endproc CG_DrawStrlen 12 0
proc CG_TileClearBox 16 36
line 873
;862:}
;863:
;864:
;865:/*
;866:=============
;867:CG_TileClearBox
;868:
;869:This repeats a 64*64 tile graphic to fill the screen around a sized down
;870:refresh window.
;871:=============
;872:*/
;873:static void CG_TileClearBox( int x, int y, int w, int h, qhandle_t hShader ) {
line 876
;874:	float	s1, t1, s2, t2;
;875:
;876:	s1 = x/64.0;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1015021568
MULF4
ASGNF4
line 877
;877:	t1 = y/64.0;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1015021568
MULF4
ASGNF4
line 878
;878:	s2 = (x+w)/64.0;
ADDRLP4 8
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1015021568
MULF4
ASGNF4
line 879
;879:	t2 = (y+h)/64.0;
ADDRLP4 12
ADDRFP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1015021568
MULF4
ASGNF4
line 880
;880:	trap_R_DrawStretchPic( x, y, w, h, s1, t1, s2, t2, hShader );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 881
;881:}
LABELV $335
endproc CG_TileClearBox 16 36
export CG_TileClear
proc CG_TileClear 40 20
line 891
;882:
;883:
;884:/*
;885:==============
;886:CG_TileClear
;887:
;888:Clear around a sized down screen
;889:==============
;890:*/
;891:void CG_TileClear( void ) {
line 895
;892:	int		top, bottom, left, right;
;893:	int		w, h;
;894:
;895:	w = cgs.glconfig.vidWidth;
ADDRLP4 8
ADDRGP4 cgs+20100+11304
INDIRI4
ASGNI4
line 896
;896:	h = cgs.glconfig.vidHeight;
ADDRLP4 20
ADDRGP4 cgs+20100+11308
INDIRI4
ASGNI4
line 898
;897:
;898:	if ( cg.refdef.x == 0 && cg.refdef.y == 0 && 
ADDRGP4 cg+236804
INDIRI4
CNSTI4 0
NEI4 $341
ADDRGP4 cg+236804+4
INDIRI4
CNSTI4 0
NEI4 $341
ADDRGP4 cg+236804+8
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $341
ADDRGP4 cg+236804+12
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $341
line 899
;899:		cg.refdef.width == w && cg.refdef.height == h ) {
line 900
;900:		return;		// full screen rendering
ADDRGP4 $336
JUMPV
LABELV $341
line 903
;901:	}
;902:
;903:	top = cg.refdef.y;
ADDRLP4 0
ADDRGP4 cg+236804+4
INDIRI4
ASGNI4
line 904
;904:	bottom = top + cg.refdef.height-1;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRGP4 cg+236804+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 905
;905:	left = cg.refdef.x;
ADDRLP4 12
ADDRGP4 cg+236804
INDIRI4
ASGNI4
line 906
;906:	right = left + cg.refdef.width-1;
ADDRLP4 16
ADDRLP4 12
INDIRI4
ADDRGP4 cg+236804+8
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 909
;907:
;908:	// clear above view screen
;909:	CG_TileClearBox( 0, 0, w, top, cgs.media.backTileShader );
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cgs+150560+268
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 912
;910:
;911:	// clear below view screen
;912:	CG_TileClearBox( 0, bottom, w, h - bottom, cgs.media.backTileShader );
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ARGI4
ADDRGP4 cgs+150560+268
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 915
;913:
;914:	// clear left of view screen
;915:	CG_TileClearBox( 0, top, left, bottom - top + 1, cgs.media.backTileShader );
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 cgs+150560+268
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 918
;916:
;917:	// clear right of view screen
;918:	CG_TileClearBox( right, top, w - right, bottom - top + 1, cgs.media.backTileShader );
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 cgs+150560+268
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 919
;919:}
LABELV $336
endproc CG_TileClear 40 20
bss
align 4
LABELV $366
skip 16
export CG_FadeColor
code
proc CG_FadeColor 4 0
line 928
;920:
;921:
;922:/*
;923:================
;924:CG_FadeColor
;925:================
;926:*/
;927:#ifdef USE_NEOHUD
;928:float *CG_FadeColor( int startMsec, int totalMsec, vec4_t color ) {
line 932
;929:	static vec4_t	col;
;930:	int				t;
;931:
;932:	if ( startMsec == 0 ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $367
line 933
;933:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $365
JUMPV
LABELV $367
line 936
;934:	}
;935:
;936:	t = cg.time - startMsec;
ADDRLP4 0
ADDRGP4 cg+234764
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ASGNI4
line 938
;937:
;938:	if ( t >= totalMsec ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $370
line 939
;939:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $365
JUMPV
LABELV $370
line 942
;940:	}
;941:
;942:	col[0] = color[0];
ADDRGP4 $366
ADDRFP4 8
INDIRP4
INDIRF4
ASGNF4
line 943
;943:	col[1] = color[1];
ADDRGP4 $366+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 944
;944:	col[2] = color[2];
ADDRGP4 $366+8
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 947
;945:
;946:	// fade out
;947:	if ( totalMsec - t < FADE_TIME ) {
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 200
GEI4 $374
line 948
;948:		col[3] = (totalMsec - t) * 1.0 / FADE_TIME;
ADDRGP4 $366+12
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1000593162
MULF4
ASGNF4
line 949
;949:	}
ADDRGP4 $375
JUMPV
LABELV $374
line 950
;950:	else {
line 951
;951:		col[3] = 1.0;
ADDRGP4 $366+12
CNSTF4 1065353216
ASGNF4
line 952
;952:	}
LABELV $375
line 954
;953:
;954:	return col;
ADDRGP4 $366
RETP4
LABELV $365
endproc CG_FadeColor 4 0
bss
align 4
LABELV $379
skip 16
export CG_FadeColorTime
code
proc CG_FadeColorTime 4 0
line 989
;955:}
;956:#else
;957:float *CG_FadeColor( int startMsec, int totalMsec ) {
;958:	static vec4_t		color;
;959:	int			t;
;960:
;961:	if ( startMsec == 0 ) {
;962:		return NULL;
;963:	}
;964:
;965:	t = cg.time - startMsec;
;966:
;967:	if ( t >= totalMsec ) {
;968:		return NULL;
;969:	}
;970:
;971:	// fade out
;972:	if ( totalMsec - t < FADE_TIME ) {
;973:		color[3] = ( totalMsec - t ) * 1.0/FADE_TIME;
;974:	} else {
;975:		color[3] = 1.0;
;976:	}
;977:	color[0] = color[1] = color[2] = 1;
;978:
;979:	return color;
;980:}
;981:#endif
;982:
;983:/*
;984:================
;985:CG_FadeColorTime
;986:================
;987:*/
;988:#ifdef USE_NEOHUD
;989:float *CG_FadeColorTime( int startMsec, int totalMsec, int fadeMsec, vec4_t color ) {
line 993
;990:	static vec4_t	col;
;991:	int				t;
;992:
;993:	if ( startMsec == 0 ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $380
line 994
;994:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $378
JUMPV
LABELV $380
line 997
;995:	}
;996:
;997:	t = cg.time - startMsec;
ADDRLP4 0
ADDRGP4 cg+234764
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ASGNI4
line 999
;998:
;999:	if ( t >= totalMsec ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $383
line 1000
;1000:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $378
JUMPV
LABELV $383
line 1004
;1001:	}
;1002:
;1003:	//Vector4Copy(col, color);
;1004:	col[0] = color[0];
ADDRGP4 $379
ADDRFP4 12
INDIRP4
INDIRF4
ASGNF4
line 1005
;1005:	col[1] = color[1];
ADDRGP4 $379+4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1006
;1006:	col[2] = color[2];
ADDRGP4 $379+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 1009
;1007:
;1008:	// fade out
;1009:	if ( totalMsec - t < fadeMsec ) {
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ADDRFP4 8
INDIRI4
GEI4 $387
line 1010
;1010:		col[3] = ( totalMsec - t ) * 1.0f/(float)fadeMsec;
ADDRGP4 $379+12
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
ADDRFP4 8
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1011
;1011:	} else {
ADDRGP4 $388
JUMPV
LABELV $387
line 1012
;1012:		col[3] = 1.0f;
ADDRGP4 $379+12
CNSTF4 1065353216
ASGNF4
line 1013
;1013:	}
LABELV $388
line 1015
;1014:
;1015:	return col;
ADDRGP4 $379
RETP4
LABELV $378
endproc CG_FadeColorTime 4 0
data
align 4
LABELV $392
byte 4 1065353216
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
align 4
LABELV $393
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $394
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $395
byte 4 1060320051
byte 4 1060320051
byte 4 1060320051
byte 4 1065353216
export CG_TeamColor
code
proc CG_TeamColor 8 0
line 1049
;1016:}
;1017:#else
;1018:float *CG_FadeColorTime( int startMsec, int totalMsec, int fadeMsec ) {
;1019:	static vec4_t		color;
;1020:	int			t;
;1021:
;1022:	if ( startMsec == 0 ) {
;1023:		return NULL;
;1024:	}
;1025:
;1026:	t = cg.time - startMsec;
;1027:
;1028:	if ( t >= totalMsec ) {
;1029:		return NULL;
;1030:	}
;1031:
;1032:	// fade out
;1033:	if ( totalMsec - t < fadeMsec ) {
;1034:		color[3] = ( totalMsec - t ) * 1.0f/(float)fadeMsec;
;1035:	} else {
;1036:		color[3] = 1.0f;
;1037:	}
;1038:	color[0] = color[1] = color[2] = 1.0f;
;1039:
;1040:	return color;
;1041:}
;1042:#endif
;1043:
;1044:/*
;1045:================
;1046:CG_TeamColor
;1047:================
;1048:*/
;1049:const float *CG_TeamColor( team_t team ) {
line 1055
;1050:	static vec4_t	red = {1, 0.2f, 0.2f, 1};
;1051:	static vec4_t	blue = {0.2f, 0.2f, 1, 1};
;1052:	static vec4_t	other = {1, 1, 1, 1};
;1053:	static vec4_t	spectator = {0.7f, 0.7f, 0.7f, 1};
;1054:
;1055:	switch ( team ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $399
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $400
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $401
ADDRGP4 $396
JUMPV
LABELV $399
line 1057
;1056:	case TEAM_RED:
;1057:		return red;
ADDRGP4 $392
RETP4
ADDRGP4 $391
JUMPV
LABELV $400
line 1059
;1058:	case TEAM_BLUE:
;1059:		return blue;
ADDRGP4 $393
RETP4
ADDRGP4 $391
JUMPV
LABELV $401
line 1061
;1060:	case TEAM_SPECTATOR:
;1061:		return spectator;
ADDRGP4 $395
RETP4
ADDRGP4 $391
JUMPV
LABELV $396
line 1063
;1062:	default:
;1063:		return other;
ADDRGP4 $394
RETP4
LABELV $391
endproc CG_TeamColor 8 0
export CG_GetColorForHealth
proc CG_GetColorForHealth 8 0
line 1074
;1064:	}
;1065:}
;1066:
;1067:
;1068:
;1069:/*
;1070:=================
;1071:CG_GetColorForHealth
;1072:=================
;1073:*/
;1074:void CG_GetColorForHealth( int health, int armor, vec4_t hcolor ) {
line 1080
;1075:	int		count;
;1076:	int		max;
;1077:
;1078:	// calculate the total points of damage that can
;1079:	// be sustained at the current health / armor level
;1080:	if ( health <= 0 ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
GTI4 $403
line 1081
;1081:		VectorClear( hcolor );	// black
ADDRFP4 8
INDIRP4
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 1082
;1082:		hcolor[3] = 1;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 1083
;1083:		return;
ADDRGP4 $402
JUMPV
LABELV $403
line 1085
;1084:	}
;1085:	count = armor;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 1086
;1086:	max = health * ARMOR_PROTECTION / ( 1.0 - ARMOR_PROTECTION );
ADDRLP4 4
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1073248376
MULF4
CVFI4 4
ASGNI4
line 1087
;1087:	if ( max < count ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $405
line 1088
;1088:		count = max;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1089
;1089:	}
LABELV $405
line 1090
;1090:	health += count;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 1093
;1091:
;1092:	// set the color based on health
;1093:	hcolor[0] = 1.0;
ADDRFP4 8
INDIRP4
CNSTF4 1065353216
ASGNF4
line 1094
;1094:	hcolor[3] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 1095
;1095:	if ( health >= 100 ) {
ADDRFP4 0
INDIRI4
CNSTI4 100
LTI4 $407
line 1096
;1096:		hcolor[2] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 1097
;1097:	} else if ( health < 66 ) {
ADDRGP4 $408
JUMPV
LABELV $407
ADDRFP4 0
INDIRI4
CNSTI4 66
GEI4 $409
line 1098
;1098:		hcolor[2] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 1099
;1099:	} else {
ADDRGP4 $410
JUMPV
LABELV $409
line 1100
;1100:		hcolor[2] = ( health - 66 ) / 33.0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 66
SUBI4
CVIF4 4
CNSTF4 1022901776
MULF4
ASGNF4
line 1101
;1101:	}
LABELV $410
LABELV $408
line 1103
;1102:
;1103:	if ( health > 60 ) {
ADDRFP4 0
INDIRI4
CNSTI4 60
LEI4 $411
line 1104
;1104:		hcolor[1] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
line 1105
;1105:	} else if ( health < 30 ) {
ADDRGP4 $412
JUMPV
LABELV $411
ADDRFP4 0
INDIRI4
CNSTI4 30
GEI4 $413
line 1106
;1106:		hcolor[1] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 1107
;1107:	} else {
ADDRGP4 $414
JUMPV
LABELV $413
line 1108
;1108:		hcolor[1] = ( health - 30 ) / 30.0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 30
SUBI4
CVIF4 4
CNSTF4 1023969417
MULF4
ASGNF4
line 1109
;1109:	}
LABELV $414
LABELV $412
line 1110
;1110:}
LABELV $402
endproc CG_GetColorForHealth 8 0
export CG_ColorForHealth
proc CG_ColorForHealth 0 12
line 1118
;1111:
;1112:
;1113:/*
;1114:=================
;1115:CG_ColorForHealth
;1116:=================
;1117:*/
;1118:void CG_ColorForHealth( vec4_t hcolor ) {
line 1120
;1119:
;1120:	CG_GetColorForHealth( cg.snap->ps.stats[STAT_HEALTH], 
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_GetColorForHealth
CALLV
pop
line 1122
;1121:		cg.snap->ps.stats[STAT_ARMOR], hcolor );
;1122:}
LABELV $415
endproc CG_ColorForHealth 0 12
data
align 4
LABELV propMap
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 8
byte 4 11
byte 4 122
byte 4 7
byte 4 154
byte 4 181
byte 4 14
byte 4 55
byte 4 122
byte 4 17
byte 4 79
byte 4 122
byte 4 18
byte 4 101
byte 4 122
byte 4 23
byte 4 153
byte 4 122
byte 4 18
byte 4 9
byte 4 93
byte 4 7
byte 4 207
byte 4 122
byte 4 8
byte 4 230
byte 4 122
byte 4 9
byte 4 177
byte 4 122
byte 4 18
byte 4 30
byte 4 152
byte 4 18
byte 4 85
byte 4 181
byte 4 7
byte 4 34
byte 4 93
byte 4 11
byte 4 110
byte 4 181
byte 4 6
byte 4 130
byte 4 152
byte 4 14
byte 4 22
byte 4 64
byte 4 17
byte 4 41
byte 4 64
byte 4 12
byte 4 58
byte 4 64
byte 4 17
byte 4 78
byte 4 64
byte 4 18
byte 4 98
byte 4 64
byte 4 19
byte 4 120
byte 4 64
byte 4 18
byte 4 141
byte 4 64
byte 4 18
byte 4 204
byte 4 64
byte 4 16
byte 4 162
byte 4 64
byte 4 17
byte 4 182
byte 4 64
byte 4 18
byte 4 59
byte 4 181
byte 4 7
byte 4 35
byte 4 181
byte 4 7
byte 4 203
byte 4 152
byte 4 14
byte 4 56
byte 4 93
byte 4 14
byte 4 228
byte 4 152
byte 4 14
byte 4 177
byte 4 181
byte 4 18
byte 4 28
byte 4 122
byte 4 22
byte 4 5
byte 4 4
byte 4 18
byte 4 27
byte 4 4
byte 4 18
byte 4 48
byte 4 4
byte 4 18
byte 4 69
byte 4 4
byte 4 17
byte 4 90
byte 4 4
byte 4 13
byte 4 106
byte 4 4
byte 4 13
byte 4 121
byte 4 4
byte 4 18
byte 4 143
byte 4 4
byte 4 17
byte 4 164
byte 4 4
byte 4 8
byte 4 175
byte 4 4
byte 4 16
byte 4 195
byte 4 4
byte 4 18
byte 4 216
byte 4 4
byte 4 12
byte 4 230
byte 4 4
byte 4 23
byte 4 6
byte 4 34
byte 4 18
byte 4 27
byte 4 34
byte 4 18
byte 4 48
byte 4 34
byte 4 18
byte 4 68
byte 4 34
byte 4 18
byte 4 90
byte 4 34
byte 4 17
byte 4 110
byte 4 34
byte 4 18
byte 4 130
byte 4 34
byte 4 14
byte 4 146
byte 4 34
byte 4 18
byte 4 166
byte 4 34
byte 4 19
byte 4 185
byte 4 34
byte 4 29
byte 4 215
byte 4 34
byte 4 18
byte 4 234
byte 4 34
byte 4 18
byte 4 5
byte 4 64
byte 4 14
byte 4 60
byte 4 152
byte 4 7
byte 4 106
byte 4 151
byte 4 13
byte 4 83
byte 4 152
byte 4 7
byte 4 128
byte 4 122
byte 4 17
byte 4 4
byte 4 152
byte 4 21
byte 4 134
byte 4 181
byte 4 5
byte 4 5
byte 4 4
byte 4 18
byte 4 27
byte 4 4
byte 4 18
byte 4 48
byte 4 4
byte 4 18
byte 4 69
byte 4 4
byte 4 17
byte 4 90
byte 4 4
byte 4 13
byte 4 106
byte 4 4
byte 4 13
byte 4 121
byte 4 4
byte 4 18
byte 4 143
byte 4 4
byte 4 17
byte 4 164
byte 4 4
byte 4 8
byte 4 175
byte 4 4
byte 4 16
byte 4 195
byte 4 4
byte 4 18
byte 4 216
byte 4 4
byte 4 12
byte 4 230
byte 4 4
byte 4 23
byte 4 6
byte 4 34
byte 4 18
byte 4 27
byte 4 34
byte 4 18
byte 4 48
byte 4 34
byte 4 18
byte 4 68
byte 4 34
byte 4 18
byte 4 90
byte 4 34
byte 4 17
byte 4 110
byte 4 34
byte 4 18
byte 4 130
byte 4 34
byte 4 14
byte 4 146
byte 4 34
byte 4 18
byte 4 166
byte 4 34
byte 4 19
byte 4 185
byte 4 34
byte 4 29
byte 4 215
byte 4 34
byte 4 18
byte 4 234
byte 4 34
byte 4 18
byte 4 5
byte 4 64
byte 4 14
byte 4 153
byte 4 152
byte 4 13
byte 4 11
byte 4 181
byte 4 5
byte 4 180
byte 4 152
byte 4 13
byte 4 79
byte 4 93
byte 4 17
byte 4 0
byte 4 0
byte 4 -1
align 4
LABELV propMapB
byte 4 11
byte 4 12
byte 4 33
byte 4 49
byte 4 12
byte 4 31
byte 4 85
byte 4 12
byte 4 31
byte 4 120
byte 4 12
byte 4 30
byte 4 156
byte 4 12
byte 4 21
byte 4 183
byte 4 12
byte 4 21
byte 4 207
byte 4 12
byte 4 32
byte 4 13
byte 4 55
byte 4 30
byte 4 49
byte 4 55
byte 4 13
byte 4 66
byte 4 55
byte 4 29
byte 4 101
byte 4 55
byte 4 31
byte 4 135
byte 4 55
byte 4 21
byte 4 158
byte 4 55
byte 4 40
byte 4 204
byte 4 55
byte 4 32
byte 4 12
byte 4 97
byte 4 31
byte 4 48
byte 4 97
byte 4 31
byte 4 82
byte 4 97
byte 4 30
byte 4 118
byte 4 97
byte 4 30
byte 4 153
byte 4 97
byte 4 30
byte 4 185
byte 4 97
byte 4 25
byte 4 213
byte 4 97
byte 4 30
byte 4 11
byte 4 139
byte 4 32
byte 4 42
byte 4 139
byte 4 51
byte 4 93
byte 4 139
byte 4 32
byte 4 126
byte 4 139
byte 4 31
byte 4 158
byte 4 139
byte 4 25
code
proc UI_DrawBannerString2 52 36
line 1287
;1123:
;1124:
;1125:
;1126:// bk001205 - code below duplicated in q3_ui/ui-atoms.c
;1127:// bk001205 - FIXME: does this belong in ui_shared.c?
;1128:// bk001205 - FIXME: HARD_LINKED flags not visible here
;1129:#ifndef Q3_STATIC // bk001205 - q_shared defines not visible here 
;1130:/*
;1131:=================
;1132:UI_DrawProportionalString2
;1133:=================
;1134:*/
;1135:static int	propMap[128][3] = {
;1136:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;1137:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;1138:
;1139:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;1140:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;1141:
;1142:{0, 0, PROP_SPACE_WIDTH},		// SPACE
;1143:{11, 122, 7},	// !
;1144:{154, 181, 14},	// "
;1145:{55, 122, 17},	// #
;1146:{79, 122, 18},	// $
;1147:{101, 122, 23},	// %
;1148:{153, 122, 18},	// &
;1149:{9, 93, 7},		// '
;1150:{207, 122, 8},	// (
;1151:{230, 122, 9},	// )
;1152:{177, 122, 18},	// *
;1153:{30, 152, 18},	// +
;1154:{85, 181, 7},	// ,
;1155:{34, 93, 11},	// -
;1156:{110, 181, 6},	// .
;1157:{130, 152, 14},	// /
;1158:
;1159:{22, 64, 17},	// 0
;1160:{41, 64, 12},	// 1
;1161:{58, 64, 17},	// 2
;1162:{78, 64, 18},	// 3
;1163:{98, 64, 19},	// 4
;1164:{120, 64, 18},	// 5
;1165:{141, 64, 18},	// 6
;1166:{204, 64, 16},	// 7
;1167:{162, 64, 17},	// 8
;1168:{182, 64, 18},	// 9
;1169:{59, 181, 7},	// :
;1170:{35,181, 7},	// ;
;1171:{203, 152, 14},	// <
;1172:{56, 93, 14},	// =
;1173:{228, 152, 14},	// >
;1174:{177, 181, 18},	// ?
;1175:
;1176:{28, 122, 22},	// @
;1177:{5, 4, 18},		// A
;1178:{27, 4, 18},	// B
;1179:{48, 4, 18},	// C
;1180:{69, 4, 17},	// D
;1181:{90, 4, 13},	// E
;1182:{106, 4, 13},	// F
;1183:{121, 4, 18},	// G
;1184:{143, 4, 17},	// H
;1185:{164, 4, 8},	// I
;1186:{175, 4, 16},	// J
;1187:{195, 4, 18},	// K
;1188:{216, 4, 12},	// L
;1189:{230, 4, 23},	// M
;1190:{6, 34, 18},	// N
;1191:{27, 34, 18},	// O
;1192:
;1193:{48, 34, 18},	// P
;1194:{68, 34, 18},	// Q
;1195:{90, 34, 17},	// R
;1196:{110, 34, 18},	// S
;1197:{130, 34, 14},	// T
;1198:{146, 34, 18},	// U
;1199:{166, 34, 19},	// V
;1200:{185, 34, 29},	// W
;1201:{215, 34, 18},	// X
;1202:{234, 34, 18},	// Y
;1203:{5, 64, 14},	// Z
;1204:{60, 152, 7},	// [
;1205:{106, 151, 13},	// '\'
;1206:{83, 152, 7},	// ]
;1207:{128, 122, 17},	// ^
;1208:{4, 152, 21},	// _
;1209:
;1210:{134, 181, 5},	// '
;1211:{5, 4, 18},		// A
;1212:{27, 4, 18},	// B
;1213:{48, 4, 18},	// C
;1214:{69, 4, 17},	// D
;1215:{90, 4, 13},	// E
;1216:{106, 4, 13},	// F
;1217:{121, 4, 18},	// G
;1218:{143, 4, 17},	// H
;1219:{164, 4, 8},	// I
;1220:{175, 4, 16},	// J
;1221:{195, 4, 18},	// K
;1222:{216, 4, 12},	// L
;1223:{230, 4, 23},	// M
;1224:{6, 34, 18},	// N
;1225:{27, 34, 18},	// O
;1226:
;1227:{48, 34, 18},	// P
;1228:{68, 34, 18},	// Q
;1229:{90, 34, 17},	// R
;1230:{110, 34, 18},	// S
;1231:{130, 34, 14},	// T
;1232:{146, 34, 18},	// U
;1233:{166, 34, 19},	// V
;1234:{185, 34, 29},	// W
;1235:{215, 34, 18},	// X
;1236:{234, 34, 18},	// Y
;1237:{5, 64, 14},	// Z
;1238:{153, 152, 13},	// {
;1239:{11, 181, 5},	// |
;1240:{180, 152, 13},	// }
;1241:{79, 93, 17},	// ~
;1242:{0, 0, -1}		// DEL
;1243:};
;1244:
;1245:static int propMapB[26][3] = {
;1246:{11, 12, 33},
;1247:{49, 12, 31},
;1248:{85, 12, 31},
;1249:{120, 12, 30},
;1250:{156, 12, 21},
;1251:{183, 12, 21},
;1252:{207, 12, 32},
;1253:
;1254:{13, 55, 30},
;1255:{49, 55, 13},
;1256:{66, 55, 29},
;1257:{101, 55, 31},
;1258:{135, 55, 21},
;1259:{158, 55, 40},
;1260:{204, 55, 32},
;1261:
;1262:{12, 97, 31},
;1263:{48, 97, 31},
;1264:{82, 97, 30},
;1265:{118, 97, 30},
;1266:{153, 97, 30},
;1267:{185, 97, 25},
;1268:{213, 97, 30},
;1269:
;1270:{11, 139, 32},
;1271:{42, 139, 51},
;1272:{93, 139, 32},
;1273:{126, 139, 31},
;1274:{158, 139, 25},
;1275:};
;1276:
;1277:#define PROPB_GAP_WIDTH		4
;1278:#define PROPB_SPACE_WIDTH	12
;1279:#define PROPB_HEIGHT		36
;1280:
;1281:/*
;1282:=================
;1283:UI_DrawBannerString
;1284:=================
;1285:*/
;1286:static void UI_DrawBannerString2( int x, int y, const char* str, vec4_t color )
;1287:{
line 1300
;1288:	const char* s;
;1289:	unsigned char	ch; // bk001204 : array subscript
;1290:	float	ax;
;1291:	float	ay;
;1292:	float	aw;
;1293:	float	ah;
;1294:	float	frow;
;1295:	float	fcol;
;1296:	float	fwidth;
;1297:	float	fheight;
;1298:
;1299:	// draw the colored text
;1300:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1302
;1301:	
;1302:	ax = x * cgs.screenXScale + cgs.screenXBias;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+31448
INDIRF4
MULF4
ADDRGP4 cgs+31460
INDIRF4
ADDF4
ASGNF4
line 1303
;1303:	ay = y * cgs.screenYScale + cgs.screenYBias;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 cgs+31452
INDIRF4
MULF4
ADDRGP4 cgs+31464
INDIRF4
ADDF4
ASGNF4
line 1305
;1304:
;1305:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $424
JUMPV
LABELV $423
line 1307
;1306:	while ( *s )
;1307:	{
line 1308
;1308:		ch = *s & 127;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 1309
;1309:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $426
line 1310
;1310:			ax += ((float)PROPB_SPACE_WIDTH + (float)PROPB_GAP_WIDTH)* cgs.screenXScale;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRGP4 cgs+31448
INDIRF4
CNSTF4 1098907648
MULF4
ADDF4
ASGNF4
line 1311
;1311:		}
ADDRGP4 $427
JUMPV
LABELV $426
line 1312
;1312:		else if ( ch >= 'A' && ch <= 'Z' ) {
ADDRLP4 40
ADDRLP4 0
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 65
LTI4 $429
ADDRLP4 40
INDIRI4
CNSTI4 90
GTI4 $429
line 1313
;1313:			ch -= 'A';
ADDRLP4 0
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 65
SUBI4
CVIU4 4
CVUU1 4
ASGNU1
line 1314
;1314:			fcol = (float)propMapB[ch][0] / 256.0f;
ADDRLP4 20
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMapB
ADDP4
INDIRI4
CVIF4 4
CNSTF4 998244352
MULF4
ASGNF4
line 1315
;1315:			frow = (float)propMapB[ch][1] / 256.0f;
ADDRLP4 16
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMapB+4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 998244352
MULF4
ASGNF4
line 1316
;1316:			fwidth = (float)propMapB[ch][2] / 256.0f;
ADDRLP4 28
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMapB+8
ADDP4
INDIRI4
CVIF4 4
CNSTF4 998244352
MULF4
ASGNF4
line 1317
;1317:			fheight = (float)PROPB_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1041235968
ASGNF4
line 1318
;1318:			aw = (float)propMapB[ch][2] * cgs.screenXScale;
ADDRLP4 12
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMapB+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 cgs+31448
INDIRF4
MULF4
ASGNF4
line 1319
;1319:			ah = (float)PROPB_HEIGHT * cgs.screenXScale;
ADDRLP4 24
ADDRGP4 cgs+31448
INDIRF4
CNSTF4 1108344832
MULF4
ASGNF4
line 1320
;1320:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol+fwidth, frow+fheight, cgs.media.charsetPropB );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ARGF4
ADDRGP4 cgs+150560+12
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1321
;1321:			ax += (aw + (float)PROPB_GAP_WIDTH * cgs.screenXScale);
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
ADDRGP4 cgs+31448
INDIRF4
CNSTF4 1082130432
MULF4
ADDF4
ADDF4
ASGNF4
line 1322
;1322:		}
LABELV $429
LABELV $427
line 1323
;1323:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1324
;1324:	}
LABELV $424
line 1306
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $423
line 1326
;1325:
;1326:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1327
;1327:}
LABELV $418
endproc UI_DrawBannerString2 52 36
export UI_DrawBannerString
proc UI_DrawBannerString 40 16
line 1329
;1328:
;1329:void UI_DrawBannerString( int x, int y, const char* str, int style, vec4_t color ) {
line 1336
;1330:	const char *	s;
;1331:	int				ch;
;1332:	int				width;
;1333:	vec4_t			drawcolor;
;1334:
;1335:	// find the width of the drawn text
;1336:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 1337
;1337:	width = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $441
JUMPV
LABELV $440
line 1338
;1338:	while ( *s ) {
line 1339
;1339:		ch = *s;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 1340
;1340:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRI4
CNSTI4 32
NEI4 $443
line 1341
;1341:			width += PROPB_SPACE_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 1342
;1342:		}
ADDRGP4 $444
JUMPV
LABELV $443
line 1343
;1343:		else if ( ch >= 'A' && ch <= 'Z' ) {
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $445
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $445
line 1344
;1344:			width += propMapB[ch - 'A'][2] + PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 propMapB-780+8
ADDP4
INDIRI4
CNSTI4 4
ADDI4
ADDI4
ASGNI4
line 1345
;1345:		}
LABELV $445
LABELV $444
line 1346
;1346:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1347
;1347:	}
LABELV $441
line 1338
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $440
line 1348
;1348:	width -= PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
SUBI4
ASGNI4
line 1350
;1349:
;1350:	switch( style & UI_FORMATMASK ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $450
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $452
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $453
ADDRGP4 $450
JUMPV
LABELV $452
line 1352
;1351:		case UI_CENTER:
;1352:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1353
;1353:			break;
ADDRGP4 $450
JUMPV
LABELV $453
line 1356
;1354:
;1355:		case UI_RIGHT:
;1356:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1357
;1357:			break;
line 1361
;1358:
;1359:		case UI_LEFT:
;1360:		default:
;1361:			break;
LABELV $450
line 1364
;1362:	}
;1363:
;1364:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $455
line 1365
;1365:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
ASGNF4
line 1366
;1366:		drawcolor[3] = color[3];
ADDRLP4 12+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1367
;1367:		UI_DrawBannerString2( x+2, y+2, str, drawcolor );
ADDRFP4 0
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 UI_DrawBannerString2
CALLV
pop
line 1368
;1368:	}
LABELV $455
line 1370
;1369:
;1370:	UI_DrawBannerString2( x, y, str, color );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawBannerString2
CALLV
pop
line 1371
;1371:}
LABELV $439
endproc UI_DrawBannerString 40 16
export UI_ProportionalStringWidth
proc UI_ProportionalStringWidth 16 0
line 1374
;1372:
;1373:
;1374:int UI_ProportionalStringWidth( const char* str ) {
line 1380
;1375:	const char *	s;
;1376:	int				ch;
;1377:	int				charWidth;
;1378:	int				width;
;1379:
;1380:	s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1381
;1381:	width = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $462
JUMPV
LABELV $461
line 1382
;1382:	while ( *s ) {
line 1383
;1383:		ch = *s & 127;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
ASGNI4
line 1384
;1384:		charWidth = propMap[ch][2];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
ASGNI4
line 1385
;1385:		if ( charWidth != -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $465
line 1386
;1386:			width += charWidth;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1387
;1387:			width += PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 1388
;1388:		}
LABELV $465
line 1389
;1389:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1390
;1390:	}
LABELV $462
line 1382
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $461
line 1392
;1391:
;1392:	width -= PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
SUBI4
ASGNI4
line 1393
;1393:	return width;
ADDRLP4 12
INDIRI4
RETI4
LABELV $460
endproc UI_ProportionalStringWidth 16 0
proc UI_DrawProportionalString2 48 36
line 1397
;1394:}
;1395:
;1396:static void UI_DrawProportionalString2( int x, int y, const char* str, vec4_t color, float sizeScale, qhandle_t charset )
;1397:{
line 1410
;1398:	const char* s;
;1399:	unsigned char	ch; // bk001204 - unsigned
;1400:	float	ax;
;1401:	float	ay;
;1402:	float	aw;
;1403:	float	ah;
;1404:	float	frow;
;1405:	float	fcol;
;1406:	float	fwidth;
;1407:	float	fheight;
;1408:
;1409:	// draw the colored text
;1410:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1412
;1411:	
;1412:	ax = x * cgs.screenXScale + cgs.screenXBias;
ADDRLP4 12
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+31448
INDIRF4
MULF4
ADDRGP4 cgs+31460
INDIRF4
ADDF4
ASGNF4
line 1413
;1413:	ay = y * cgs.screenYScale + cgs.screenYBias;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 cgs+31452
INDIRF4
MULF4
ADDRGP4 cgs+31464
INDIRF4
ADDF4
ASGNF4
line 1415
;1414:
;1415:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $473
JUMPV
LABELV $472
line 1417
;1416:	while ( *s )
;1417:	{
line 1418
;1418:		ch = *s & 127;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 1419
;1419:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $475
line 1420
;1420:			aw = (float)PROP_SPACE_WIDTH * cgs.screenXScale * sizeScale;
ADDRLP4 8
ADDRGP4 cgs+31448
INDIRF4
CNSTF4 1090519040
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 1421
;1421:		} else if ( propMap[ch][2] != -1 ) {
ADDRGP4 $476
JUMPV
LABELV $475
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $478
line 1422
;1422:			fcol = (float)propMap[ch][0] / 256.0f;
ADDRLP4 20
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMap
ADDP4
INDIRI4
CVIF4 4
CNSTF4 998244352
MULF4
ASGNF4
line 1423
;1423:			frow = (float)propMap[ch][1] / 256.0f;
ADDRLP4 16
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMap+4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 998244352
MULF4
ASGNF4
line 1424
;1424:			fwidth = (float)propMap[ch][2] / 256.0f;
ADDRLP4 28
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CVIF4 4
CNSTF4 998244352
MULF4
ASGNF4
line 1425
;1425:			fheight = (float)PROP_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1037565952
ASGNF4
line 1426
;1426:			aw = (float)propMap[ch][2] * cgs.screenXScale * sizeScale;
ADDRLP4 8
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 cgs+31448
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 1427
;1427:			ah = (float)PROP_HEIGHT * cgs.screenXScale * sizeScale;
ADDRLP4 24
ADDRGP4 cgs+31448
INDIRF4
CNSTF4 1104674816
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 1428
;1428:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol+fwidth, frow+fheight, charset );
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ARGF4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1429
;1429:		} else {
ADDRGP4 $479
JUMPV
LABELV $478
line 1430
;1430:			aw = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 1431
;1431:		}
LABELV $479
LABELV $476
line 1433
;1432:
;1433:		ax += (aw + (float)PROP_GAP_WIDTH * cgs.screenXScale * sizeScale);
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 cgs+31448
INDIRF4
CNSTF4 1077936128
MULF4
ADDRFP4 16
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 1434
;1434:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1435
;1435:	}
LABELV $473
line 1416
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $472
line 1437
;1436:
;1437:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1438
;1438:}
LABELV $467
endproc UI_DrawProportionalString2 48 36
export UI_ProportionalSizeScale
proc UI_ProportionalSizeScale 0 0
line 1445
;1439:
;1440:/*
;1441:=================
;1442:UI_ProportionalSizeScale
;1443:=================
;1444:*/
;1445:float UI_ProportionalSizeScale( int style ) {
line 1446
;1446:	if(  style & UI_SMALLFONT ) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $488
line 1447
;1447:		return 0.75;
CNSTF4 1061158912
RETF4
ADDRGP4 $487
JUMPV
LABELV $488
line 1450
;1448:	}
;1449:
;1450:	return 1.00;
CNSTF4 1065353216
RETF4
LABELV $487
endproc UI_ProportionalSizeScale 0 0
export UI_DrawProportionalString
proc UI_DrawProportionalString 44 24
line 1459
;1451:}
;1452:
;1453:
;1454:/*
;1455:=================
;1456:UI_DrawProportionalString
;1457:=================
;1458:*/
;1459:void UI_DrawProportionalString( int x, int y, const char* str, int style, vec4_t color ) {
line 1464
;1460:	vec4_t	drawcolor;
;1461:	int		width;
;1462:	float	sizeScale;
;1463:
;1464:	sizeScale = UI_ProportionalSizeScale( style );
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 24
INDIRF4
ASGNF4
line 1466
;1465:
;1466:	switch( style & UI_FORMATMASK ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $492
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $494
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $495
ADDRGP4 $492
JUMPV
LABELV $494
line 1468
;1467:		case UI_CENTER:
;1468:			width = UI_ProportionalStringWidth( str ) * sizeScale;
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 36
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1469
;1469:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1470
;1470:			break;
ADDRGP4 $492
JUMPV
LABELV $495
line 1473
;1471:
;1472:		case UI_RIGHT:
;1473:			width = UI_ProportionalStringWidth( str ) * sizeScale;
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 40
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1474
;1474:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1475
;1475:			break;
line 1479
;1476:
;1477:		case UI_LEFT:
;1478:		default:
;1479:			break;
LABELV $492
line 1482
;1480:	}
;1481:
;1482:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $497
line 1483
;1483:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 36
INDIRF4
ASGNF4
line 1484
;1484:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1485
;1485:		UI_DrawProportionalString2( x+2, y+2, str, drawcolor, sizeScale, cgs.media.charsetProp );
ADDRFP4 0
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cgs+150560+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1486
;1486:	}
LABELV $497
line 1488
;1487:
;1488:	if ( style & UI_INVERSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $504
line 1489
;1489:		drawcolor[0] = color[0] * 0.8;
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 1490
;1490:		drawcolor[1] = color[1] * 0.8;
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 1491
;1491:		drawcolor[2] = color[2] * 0.8;
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 1492
;1492:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1493
;1493:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, cgs.media.charsetProp );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cgs+150560+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1494
;1494:		return;
ADDRGP4 $490
JUMPV
LABELV $504
line 1497
;1495:	}
;1496:
;1497:	if ( style & UI_PULSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $511
line 1498
;1498:		drawcolor[0] = color[0] * 0.8;
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 1499
;1499:		drawcolor[1] = color[1] * 0.8;
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 1500
;1500:		drawcolor[2] = color[2] * 0.8;
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 1501
;1501:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1502
;1502:		UI_DrawProportionalString2( x, y, str, color, sizeScale, cgs.media.charsetProp );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cgs+150560+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1504
;1503:
;1504:		drawcolor[0] = color[0];
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
ASGNF4
line 1505
;1505:		drawcolor[1] = color[1];
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1506
;1506:		drawcolor[2] = color[2];
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 1507
;1507:		drawcolor[3] = 0.5 + 0.5 * sin( ( cg.time % TMOD_075 ) / PULSE_DIVISOR );
ADDRGP4 cg+234764
INDIRI4
CNSTI4 2292106
MODI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 36
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+12
ADDRLP4 36
INDIRF4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 1508
;1508:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, cgs.media.charsetPropGlow );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cgs+150560+8
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1509
;1509:		return;
ADDRGP4 $490
JUMPV
LABELV $511
line 1512
;1510:	}
;1511:
;1512:	UI_DrawProportionalString2( x, y, str, color, sizeScale, cgs.media.charsetProp );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cgs+150560+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1513
;1513:}
LABELV $490
endproc UI_DrawProportionalString 44 24
bss
align 4
LABELV numbers
skip 11300
align 4
LABELV bigchars
skip 11300
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
LABELV $265
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
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $264
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
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $262
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $243
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 50
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $240
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 49
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $237
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 120
byte 1 45
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $234
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 120
byte 1 45
byte 1 111
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $231
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 121
byte 1 48
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $228
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 120
byte 1 48
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $225
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $213
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $210
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 32
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $207
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 100
byte 1 104
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $204
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $200
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $196
byte 1 102
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $193
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $190
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
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
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $187
byte 1 105
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $184
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $178
byte 1 94
byte 1 51
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 105
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
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $175
byte 1 94
byte 1 51
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
