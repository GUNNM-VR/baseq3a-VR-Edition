data
export drawTeamOverlayModificationCount
align 4
LABELV drawTeamOverlayModificationCount
byte 4 -1
export CG_Draw3DModel
code
proc CG_Draw3DModel 508 16
file "..\..\..\..\code\cgame\cg_draw.c"
line 266
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_draw.c -- draw all of the graphical elements during
;4:// active (after loading) gameplay
;5:
;6:#include "cg_local.h"
;7:
;8:#ifdef USE_NEOHUD
;9:#include "cg_drawhud.h"
;10:#endif
;11:
;12:#ifdef USE_NATIVE_HACK
;13:#include "../../../Quake3e-master/code/vrmod/VRMOD_input.h"
;14:extern vr_clientinfo_t *vrinfo;
;15:#endif
;16:
;17:#ifdef USE_VR
;18:#include "vr_helper.h"
;19:#endif
;20:
;21:#ifdef MISSIONPACK
;22:#include "../ui/ui_shared.h"
;23:
;24:// used for scoreboard
;25:extern displayContextDef_t cgDC;
;26:menuDef_t *menuScoreboard = NULL;
;27:#else
;28:int drawTeamOverlayModificationCount = -1;
;29:#endif
;30:
;31:int sortedTeamPlayers[TEAM_MAXOVERLAY];
;32:int	numSortedTeamPlayers;
;33:
;34:char systemChat[256];
;35:char teamChat1[256];
;36:char teamChat2[256];
;37:
;38:#ifdef MISSIONPACK
;39:
;40:int CG_Text_Width(const char *text, float scale, int limit) {
;41:  int count,len;
;42:	float out;
;43:	glyphInfo_t *glyph;
;44:	float useScale;
;45:// FIXME: see ui_main.c, same problem
;46://	const unsigned char *s = text;
;47:	const char *s = text;
;48:	fontInfo_t *font = &cgDC.Assets.textFont;
;49:	if (scale <= cg_smallFont.value) {
;50:		font = &cgDC.Assets.smallFont;
;51:	} else if (scale > cg_bigFont.value) {
;52:		font = &cgDC.Assets.bigFont;
;53:	}
;54:	useScale = scale * font->glyphScale;
;55:  out = 0;
;56:  if (text) {
;57:	len = strlen(text);
;58:		if (limit > 0 && len > limit) {
;59:			len = limit;
;60:		}
;61:		count = 0;
;62:		while (s && *s && count < len) {
;63:			if ( Q_IsColorString(s) ) {
;64:				s += 2;
;65:				continue;
;66:			} else {
;67:				glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
;68:				out += glyph->xSkip;
;69:				s++;
;70:				count++;
;71:			}
;72:		}
;73:	}
;74:	return out * useScale;
;75:}
;76:
;77:int CG_Text_Height(const char *text, float scale, int limit) {
;78:  int len, count;
;79:	float max;
;80:	glyphInfo_t *glyph;
;81:	float useScale;
;82:// TTimo: FIXME
;83://	const unsigned char *s = text;
;84:	const char *s = text;
;85:	fontInfo_t *font = &cgDC.Assets.textFont;
;86:	if (scale <= cg_smallFont.value) {
;87:		font = &cgDC.Assets.smallFont;
;88:	} else if (scale > cg_bigFont.value) {
;89:		font = &cgDC.Assets.bigFont;
;90:	}
;91:	useScale = scale * font->glyphScale;
;92:	max = 0;
;93:	if (text) {
;94:		len = strlen(text);
;95:		if (limit > 0 && len > limit) {
;96:			len = limit;
;97:		}
;98:		count = 0;
;99:		while (s && *s && count < len) {
;100:			if ( Q_IsColorString(s) ) {
;101:				s += 2;
;102:				continue;
;103:			} else {
;104:				glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
;105:				if (max < glyph->height) {
;106:					max = glyph->height;
;107:				}
;108:				s++;
;109:				count++;
;110:			}
;111:		}
;112:	}
;113:  return max * useScale;
;114:}
;115:
;116:void CG_Text_PaintChar(float x, float y, float width, float height, float scale, float s, float t, float s2, float t2, qhandle_t hShader) {
;117:  float w, h;
;118:  w = width * scale;
;119:  h = height * scale;
;120:  CG_AdjustFrom640( &x, &y, &w, &h );
;121:  trap_R_DrawStretchPic( x, y, w, h, s, t, s2, t2, hShader );
;122:}
;123:
;124:void CG_Text_Paint(float x, float y, float scale, vec4_t color, const char *text, float adjust, int limit, int style) {
;125:  int len, count;
;126:	vec4_t newColor;
;127:	glyphInfo_t *glyph;
;128:	float useScale;
;129:	fontInfo_t *font = &cgDC.Assets.textFont;
;130:	if (scale <= cg_smallFont.value) {
;131:		font = &cgDC.Assets.smallFont;
;132:	} else if (scale > cg_bigFont.value) {
;133:		font = &cgDC.Assets.bigFont;
;134:	}
;135:	useScale = scale * font->glyphScale;
;136:  if (text) {
;137:// TTimo: FIXME
;138://		const unsigned char *s = text;
;139:		const char *s = text;
;140:		trap_R_SetColor( color );
;141:		memcpy(&newColor[0], &color[0], sizeof(vec4_t));
;142:		len = strlen(text);
;143:		if (limit > 0 && len > limit) {
;144:			len = limit;
;145:		}
;146:		count = 0;
;147:		while (s && *s && count < len) {
;148:			glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
;149:			//int yadj = Assets.textFont.glyphs[text[i]].bottom + Assets.textFont.glyphs[text[i]].top;
;150:			//float yadj = scale * (Assets.textFont.glyphs[text[i]].imageHeight - Assets.textFont.glyphs[text[i]].height);
;151:			if ( Q_IsColorString( s ) ) {
;152:				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
;153:				newColor[3] = color[3];
;154:				trap_R_SetColor( newColor );
;155:				s += 2;
;156:				continue;
;157:			} else {
;158:				float yadj = useScale * glyph->top;
;159:				if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE) {
;160:					int ofs = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;
;161:					colorBlack[3] = newColor[3];
;162:					trap_R_SetColor( colorBlack );
;163:					CG_Text_PaintChar(x + ofs, y - yadj + ofs, 
;164:														glyph->imageWidth,
;165:														glyph->imageHeight,
;166:														useScale, 
;167:														glyph->s,
;168:														glyph->t,
;169:														glyph->s2,
;170:														glyph->t2,
;171:														glyph->glyph);
;172:					colorBlack[3] = 1.0;
;173:					trap_R_SetColor( newColor );
;174:				}
;175:				CG_Text_PaintChar(x, y - yadj, 
;176:													glyph->imageWidth,
;177:													glyph->imageHeight,
;178:													useScale, 
;179:													glyph->s,
;180:													glyph->t,
;181:													glyph->s2,
;182:													glyph->t2,
;183:													glyph->glyph);
;184:				// CG_DrawPic(x, y - yadj, scale * cgDC.Assets.textFont.glyphs[text[i]].imageWidth, scale * cgDC.Assets.textFont.glyphs[text[i]].imageHeight, cgDC.Assets.textFont.glyphs[text[i]].glyph);
;185:				x += (glyph->xSkip * useScale) + adjust;
;186:				s++;
;187:				count++;
;188:			}
;189:		}
;190:		trap_R_SetColor( NULL );
;191:	}
;192:}
;193:
;194:
;195:#endif
;196:
;197:/*
;198:==============
;199:CG_DrawField
;200:
;201:Draws large numbers for status bar and powerups
;202:==============
;203:*/
;204:#if !defined MISSIONPACK && !defined USE_NEOHUD
;205:static void CG_DrawField (int x, int y, int width, int value) {
;206:	char	num[16], *ptr;
;207:	int		l;
;208:	int		frame;
;209:
;210:	if ( width < 1 ) {
;211:		return;
;212:	}
;213:
;214:	// draw number string
;215:	if ( width > 5 ) {
;216:		width = 5;
;217:	}
;218:
;219:	switch ( width ) {
;220:	case 1:
;221:		value = value > 9 ? 9 : value;
;222:		value = value < 0 ? 0 : value;
;223:		break;
;224:	case 2:
;225:		value = value > 99 ? 99 : value;
;226:		value = value < -9 ? -9 : value;
;227:		break;
;228:	case 3:
;229:		value = value > 999 ? 999 : value;
;230:		value = value < -99 ? -99 : value;
;231:		break;
;232:	case 4:
;233:		value = value > 9999 ? 9999 : value;
;234:		value = value < -999 ? -999 : value;
;235:		break;
;236:	}
;237:
;238:	Com_sprintf (num, sizeof(num), "%i", value);
;239:	l = strlen(num);
;240:	if (l > width)
;241:		l = width;
;242:	x += 2 + CHAR_WIDTH*(width - l);
;243:
;244:	ptr = num;
;245:	while (*ptr && l)
;246:	{
;247:		if (*ptr == '-')
;248:			frame = STAT_MINUS;
;249:		else
;250:			frame = *ptr -'0';
;251:
;252:		CG_DrawPic( x, y, CHAR_WIDTH, CHAR_HEIGHT, cgs.media.numberShaders[frame] );
;253:		x += CHAR_WIDTH;
;254:		ptr++;
;255:		l--;
;256:	}
;257:}
;258:#endif // MISSIONPACK || USE_NEOHUD
;259:
;260:
;261:/*
;262:================
;263:CG_Draw3DModel
;264:================
;265:*/
;266:void CG_Draw3DModel( float x, float y, float w, float h, qhandle_t model, qhandle_t skin, vec3_t origin, vec3_t angles ) {
line 270
;267:	refdef_t		refdef;
;268:	refEntity_t		ent;
;269:
;270:	if ( !cg_draw3dIcons.integer || !cg_drawIcons.integer ) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $92
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
NEI4 $88
LABELV $92
line 271
;271:		return;
ADDRGP4 $87
JUMPV
LABELV $88
line 276
;272:	}
;273:#ifdef USE_HUD_FLAG
;274:	CG_SetHUDFlags(HUD_FLAGS_DRAWMODEL);
;275:#endif
;276:	CG_AdjustFrom640( &x, &y, &w, &h );
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
line 281
;277:#ifdef USE_HUD_FLAG
;278:	CG_RemoveHUDFlags(HUD_FLAGS_DRAWMODEL);
;279:#endif
;280:
;281:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 283
;282:
;283:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 284
;284:	AnglesToAxis( angles, ent.axis );
ADDRFP4 28
INDIRP4
ARGP4
ADDRLP4 368+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 285
;285:	VectorCopy( origin, ent.origin );
ADDRLP4 368+68
ADDRFP4 24
INDIRP4
INDIRB
ASGNB 12
line 286
;286:	ent.hModel = model;
ADDRLP4 368+8
ADDRFP4 16
INDIRI4
ASGNI4
line 287
;287:	ent.customSkin = skin;
ADDRLP4 368+108
ADDRFP4 20
INDIRI4
ASGNI4
line 288
;288:	ent.renderfx = RF_NOSHADOW;		// no stencil shadows
ADDRLP4 368+4
CNSTI4 64
ASGNI4
line 290
;289:
;290:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 292
;291:
;292:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 294
;293:
;294:	refdef.fov_x = 30;
ADDRLP4 0+16
CNSTF4 1106247680
ASGNF4
line 295
;295:	refdef.fov_y = 30;
ADDRLP4 0+20
CNSTF4 1106247680
ASGNF4
line 297
;296:
;297:	refdef.x = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 298
;298:	refdef.y = y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 299
;299:	refdef.width = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
CVFI4 4
ASGNI4
line 300
;300:	refdef.height = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
CVFI4 4
ASGNI4
line 302
;301:
;302:	refdef.time = cg.time;
ADDRLP4 0+72
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 304
;303:
;304:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 305
;305:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 368
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 306
;306:	trap_R_RenderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 307
;307:}
LABELV $87
endproc CG_Draw3DModel 508 16
export CG_Draw3DModelColor
proc CG_Draw3DModelColor 544 16
line 320
;308:
;309:
;310:
;311:/*
;312:================
;313:CG_Draw3DModelColor
;314:================
;315:*/
;316:void CG_Draw3DModelColor( float x, float y, float w, float h, qhandle_t model, qhandle_t skin, vec3_t origin, vec3_t angles, vec3_t color
;317:#ifdef USE_NEOHUD
;318:, qboolean force3D
;319:#endif
;320: ) {
line 325
;321:	refdef_t		refdef;
;322:	refEntity_t		ent;
;323:
;324:#ifdef USE_NEOHUD
;325:	if (!cg_drawIcons.integer || (!cg_draw3dIcons.integer && !force3D)) {
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $112
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
NEI4 $108
ADDRFP4 36
INDIRI4
CNSTI4 0
NEI4 $108
LABELV $112
line 326
;326:		return;
ADDRGP4 $107
JUMPV
LABELV $108
line 334
;327:	}
;328:#else
;329:	if ( !cg_draw3dIcons.integer || !cg_drawIcons.integer ) {
;330:		return;
;331:	}
;332:#endif
;333:
;334:	CG_AdjustFrom640( &x, &y, &w, &h );
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
line 336
;335:
;336:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 338
;337:
;338:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 339
;339:	AnglesToAxis( angles, ent.axis );
ADDRFP4 28
INDIRP4
ARGP4
ADDRLP4 368+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 340
;340:	VectorCopy( origin, ent.origin );
ADDRLP4 368+68
ADDRFP4 24
INDIRP4
INDIRB
ASGNB 12
line 341
;341:	ent.hModel = model;
ADDRLP4 368+8
ADDRFP4 16
INDIRI4
ASGNI4
line 342
;342:	ent.customSkin = skin;
ADDRLP4 368+108
ADDRFP4 20
INDIRI4
ASGNI4
line 343
;343:	ent.renderfx = RF_NOSHADOW;		// no stencil shadows
ADDRLP4 368+4
CNSTI4 64
ASGNI4
line 345
;344:
;345:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 347
;346:
;347:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 349
;348:
;349:	refdef.fov_x = 30;
ADDRLP4 0+16
CNSTF4 1106247680
ASGNF4
line 350
;350:	refdef.fov_y = 30;
ADDRLP4 0+20
CNSTF4 1106247680
ASGNF4
line 352
;351:
;352:	refdef.x = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 353
;353:	refdef.y = y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 354
;354:	refdef.width = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
CVFI4 4
ASGNI4
line 355
;355:	refdef.height = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
CVFI4 4
ASGNI4
line 357
;356:
;357:	refdef.time = cg.time;
ADDRLP4 0+72
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 359
;358:
;359:	ent.shaderRGBA[0] = color[0] * 255;
ADDRLP4 512
ADDRFP4 32
INDIRP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 516
CNSTF4 1325400064
ASGNF4
ADDRLP4 512
INDIRF4
ADDRLP4 516
INDIRF4
LTF4 $129
ADDRLP4 508
ADDRLP4 512
INDIRF4
ADDRLP4 516
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $130
JUMPV
LABELV $129
ADDRLP4 508
ADDRLP4 512
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $130
ADDRLP4 368+116
ADDRLP4 508
INDIRU4
CVUU1 4
ASGNU1
line 360
;360:	ent.shaderRGBA[1] = color[1] * 255;
ADDRLP4 524
ADDRFP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 528
CNSTF4 1325400064
ASGNF4
ADDRLP4 524
INDIRF4
ADDRLP4 528
INDIRF4
LTF4 $134
ADDRLP4 520
ADDRLP4 524
INDIRF4
ADDRLP4 528
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $135
JUMPV
LABELV $134
ADDRLP4 520
ADDRLP4 524
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $135
ADDRLP4 368+116+1
ADDRLP4 520
INDIRU4
CVUU1 4
ASGNU1
line 361
;361:	ent.shaderRGBA[2] = color[2] * 255;
ADDRLP4 536
ADDRFP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 540
CNSTF4 1325400064
ASGNF4
ADDRLP4 536
INDIRF4
ADDRLP4 540
INDIRF4
LTF4 $139
ADDRLP4 532
ADDRLP4 536
INDIRF4
ADDRLP4 540
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $140
JUMPV
LABELV $139
ADDRLP4 532
ADDRLP4 536
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $140
ADDRLP4 368+116+2
ADDRLP4 532
INDIRU4
CVUU1 4
ASGNU1
line 362
;362:	ent.shaderRGBA[3] = 255;
ADDRLP4 368+116+3
CNSTU1 255
ASGNU1
line 364
;363:
;364:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 365
;365:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 368
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 366
;366:	trap_R_RenderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 367
;367:}
LABELV $107
endproc CG_Draw3DModelColor 544 16
export CG_DrawHead
proc CG_DrawHead 56 40
line 381
;368:
;369:
;370:/*
;371:================
;372:CG_DrawHead
;373:
;374:Used for the status bar, the scoreboard and CG_DrawAttacker
;375:================
;376:*/
;377:void CG_DrawHead( float x, float y, float w, float h, int clientNum, vec3_t headAngles
;378:#ifdef USE_NEOHUD
;379:, qboolean force3D
;380:#endif
;381: ) {
line 388
;382:	clipHandle_t	cm;
;383:	clientInfo_t	*ci;
;384:	float			len;
;385:	vec3_t			origin;
;386:	vec3_t			mins, maxs;
;387:
;388:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 0
ADDRFP4 16
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ASGNP4
line 390
;389:
;390:	if ( cg_draw3dIcons.integer
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
NEI4 $148
ADDRFP4 24
INDIRI4
CNSTI4 0
EQI4 $145
LABELV $148
line 394
;391:#ifdef USE_NEOHUD
;392:	 || force3D
;393:#endif
;394:	 ) {
line 396
;395:
;396:		cm = ci->headModel;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ASGNI4
line 397
;397:		if ( !cm ) {
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $149
line 398
;398:			return;
ADDRGP4 $143
JUMPV
LABELV $149
line 402
;399:		}
;400:
;401:		// offset the origin y and z to center the head
;402:		trap_R_ModelBounds( cm, mins, maxs );
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 404
;403:
;404:		origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 4+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDF4
CNSTF4 3204448256
MULF4
ASGNF4
line 405
;405:		origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 4+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ASGNF4
line 409
;406:
;407:		// calculate distance so the head nearly fills the box
;408:		// assume heads are taller than wide
;409:		len = 0.7 * ( maxs[2] - mins[2] );		
ADDRLP4 44
ADDRLP4 28+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
CNSTF4 1060320051
MULF4
ASGNF4
line 410
;410:		origin[0] = len / 0.268;	// len / tan( fov/2 )
ADDRLP4 4
ADDRLP4 44
INDIRF4
CNSTF4 1081003604
MULF4
ASGNF4
line 413
;411:
;412:		// allow per-model tweaking
;413:		VectorAdd( origin, ci->headOffset, origin );
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 400
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 404
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRF4
ADDF4
ASGNF4
line 416
;414:
;415:#ifdef USE_NEOHUD
;416:		CG_Draw3DModelColor( x, y, w, h, ci->headModel, ci->headSkin, origin, headAngles, ci->headColor, force3D);
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
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1616
ADDP4
ARGP4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 CG_Draw3DModelColor
CALLV
pop
line 420
;417:#else
;418:		CG_Draw3DModelColor( x, y, w, h, ci->headModel, ci->headSkin, origin, headAngles, ci->headColor );
;419:#endif
;420:	} else if ( cg_drawIcons.integer ) {
ADDRGP4 $146
JUMPV
LABELV $145
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $163
line 421
;421:		trap_R_SetColor ( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 422
;422:		CG_DrawPic( x, y, w, h, ci->modelIcon );
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
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 423
;423:	}
LABELV $163
LABELV $146
line 426
;424:
;425:	// if they are deferred, draw a cross out
;426:	if ( ci->deferred ) {
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $166
line 427
;427:		trap_R_SetColor ( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 428
;428:		CG_DrawPic( x, y, w, h, cgs.media.deferShader );
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
ADDRGP4 cgs+150560+132
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 429
;429:	}
LABELV $166
line 430
;430:}
LABELV $143
endproc CG_DrawHead 56 40
export CG_DrawFlagModel
proc CG_DrawFlagModel 68 32
line 439
;431:
;432:/*
;433:================
;434:CG_DrawFlagModel
;435:
;436:Used for both the status bar and the scoreboard
;437:================
;438:*/
;439:void CG_DrawFlagModel( float x, float y, float w, float h, int team, qboolean force2D ) {
line 446
;440:	qhandle_t		cm;
;441:	float			len;
;442:	vec3_t			origin, angles;
;443:	vec3_t			mins, maxs;
;444:	qhandle_t		handle;
;445:
;446:	if ( !force2D && cg_draw3dIcons.integer ) {
ADDRFP4 20
INDIRI4
CNSTI4 0
NEI4 $171
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $171
line 448
;447:
;448:		VectorClear( angles );
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0+4
CNSTF4 0
ASGNF4
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 450
;449:
;450:		cm = cgs.media.redFlagModel;
ADDRLP4 48
ADDRGP4 cgs+150560+36
INDIRI4
ASGNI4
line 453
;451:
;452:		// offset the origin y and z to center the flag
;453:		trap_R_ModelBounds( cm, mins, maxs );
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 455
;454:
;455:		origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 12+8
ADDRLP4 24+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
CNSTF4 3204448256
MULF4
ASGNF4
line 456
;456:		origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ASGNF4
line 460
;457:
;458:		// calculate distance so the flag nearly fills the box
;459:		// assume heads are taller than wide
;460:		len = 0.5 * ( maxs[2] - mins[2] );
ADDRLP4 52
ADDRLP4 36+8
INDIRF4
ADDRLP4 24+8
INDIRF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 461
;461:		origin[0] = len / 0.268;	// len / tan( fov/2 )
ADDRLP4 12
ADDRLP4 52
INDIRF4
CNSTF4 1081003604
MULF4
ASGNF4
line 463
;462:
;463:		angles[YAW] = 60 * sin( ( cg.time % TMOD_2000 ) / 2000.0 );
ADDRGP4 cg+234764
INDIRI4
CNSTI4 5730265
MODI4
CVIF4 4
CNSTF4 973279855
MULF4
ARGF4
ADDRLP4 60
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 60
INDIRF4
CNSTF4 1114636288
MULF4
ASGNF4
line 465
;464:
;465:		if( team == TEAM_RED ) {
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $188
line 466
;466:			handle = cgs.media.redFlagModel;
ADDRLP4 56
ADDRGP4 cgs+150560+36
INDIRI4
ASGNI4
line 467
;467:		} else if( team == TEAM_BLUE ) {
ADDRGP4 $189
JUMPV
LABELV $188
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $192
line 468
;468:			handle = cgs.media.blueFlagModel;
ADDRLP4 56
ADDRGP4 cgs+150560+40
INDIRI4
ASGNI4
line 469
;469:		} else if( team == TEAM_FREE ) {
ADDRGP4 $193
JUMPV
LABELV $192
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $170
line 470
;470:			handle = cgs.media.neutralFlagModel;
ADDRLP4 56
ADDRGP4 cgs+150560+44
INDIRI4
ASGNI4
line 471
;471:		} else {
line 472
;472:			return;
LABELV $197
LABELV $193
LABELV $189
line 474
;473:		}
;474:		CG_Draw3DModel( x, y, w, h, handle, 0, origin, angles );
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
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 475
;475:	} else if ( cg_drawIcons.integer ) {
ADDRGP4 $172
JUMPV
LABELV $171
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $200
line 478
;476:		gitem_t *item;
;477:
;478:		if( team == TEAM_RED ) {
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $203
line 479
;479:			item = BG_FindItemForPowerup( PW_REDFLAG );
CNSTI4 7
ARGI4
ADDRLP4 64
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 64
INDIRP4
ASGNP4
line 480
;480:		} else if( team == TEAM_BLUE ) {
ADDRGP4 $204
JUMPV
LABELV $203
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $205
line 481
;481:			item = BG_FindItemForPowerup( PW_BLUEFLAG );
CNSTI4 8
ARGI4
ADDRLP4 64
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 64
INDIRP4
ASGNP4
line 482
;482:		} else if( team == TEAM_FREE ) {
ADDRGP4 $206
JUMPV
LABELV $205
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $170
line 483
;483:			item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
CNSTI4 9
ARGI4
ADDRLP4 64
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 64
INDIRP4
ASGNP4
line 484
;484:		} else {
line 485
;485:			return;
LABELV $208
LABELV $206
LABELV $204
line 487
;486:		}
;487:		if (item) {
ADDRLP4 60
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $209
line 488
;488:			CG_DrawPic( x, y, w, h, cg_items[ ITEM_INDEX(item) ].icon );
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
ADDRLP4 60
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 28
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 489
;489:		}
LABELV $209
line 490
;490:	}
LABELV $200
LABELV $172
line 491
;491:}
LABELV $170
endproc CG_DrawFlagModel 68 32
proc CG_DrawHoldableItem 40 20
line 1616
;492:
;493:/*
;494:================
;495:CG_DrawStatusBarHead
;496:
;497:================
;498:*/
;499:#if !defined MISSIONPACK && !defined USE_NEOHUD
;500:
;501:static void CG_DrawStatusBarHead( float x ) {
;502:	vec3_t		angles;
;503:	float		size, stretch;
;504:	float		frac;
;505:
;506:	VectorClear( angles );
;507:
;508:	if ( cg.damageTime && cg.time - cg.damageTime < DAMAGE_TIME ) {
;509:		frac = (float)(cg.time - cg.damageTime ) / DAMAGE_TIME;
;510:		size = ICON_SIZE * 1.25 * ( 1.5 - frac * 0.5 );
;511:
;512:		stretch = size - ICON_SIZE * 1.25;
;513:		// kick in the direction of damage
;514:		x -= stretch * 0.5 + cg.damageX * stretch * 0.5;
;515:
;516:		cg.headStartYaw = 180 + cg.damageX * 45;
;517:
;518:		cg.headEndYaw = 180 + 20 * cos( crandom()*M_PI );
;519:		cg.headEndPitch = 5 * cos( crandom()*M_PI );
;520:
;521:		cg.headStartTime = cg.time;
;522:		cg.headEndTime = cg.time + 100 + random() * 2000;
;523:	} else {
;524:		if ( cg.time >= cg.headEndTime ) {
;525:			// select a new head angle
;526:			cg.headStartYaw = cg.headEndYaw;
;527:			cg.headStartPitch = cg.headEndPitch;
;528:			cg.headStartTime = cg.headEndTime;
;529:			cg.headEndTime = cg.time + 100 + random() * 2000;
;530:
;531:			cg.headEndYaw = 180 + 20 * cos( crandom()*M_PI );
;532:			cg.headEndPitch = 5 * cos( crandom()*M_PI );
;533:		}
;534:
;535:		size = ICON_SIZE * 1.25;
;536:	}
;537:
;538:	// if the server was frozen for a while we may have a bad head start time
;539:	if ( cg.headStartTime > cg.time ) {
;540:		cg.headStartTime = cg.time;
;541:	}
;542:
;543:	frac = ( cg.time - cg.headStartTime ) / (float)( cg.headEndTime - cg.headStartTime );
;544:	frac = frac * frac * ( 3 - 2 * frac );
;545:	angles[YAW] = cg.headStartYaw + ( cg.headEndYaw - cg.headStartYaw ) * frac;
;546:	angles[PITCH] = cg.headStartPitch + ( cg.headEndPitch - cg.headStartPitch ) * frac;
;547:
;548:	CG_DrawHead( x, cgs.screenYmax + 1 - size, size, size, cg.snap->ps.clientNum, angles );
;549:}
;550:#endif // MISSIONPACK
;551:
;552:
;553:/*
;554:================
;555:CG_DrawStatusBarFlag
;556:
;557:================
;558:*/
;559:#if !defined MISSIONPACK && !defined USE_NEOHUD
;560:static void CG_DrawStatusBarFlag( float x, int team ) {
;561:	CG_DrawFlagModel( x, cgs.screenYmax + 1 - ICON_SIZE, ICON_SIZE, ICON_SIZE, team, qfalse );
;562:}
;563:#endif // MISSIONPACK
;564:
;565:
;566:/*
;567:================
;568:CG_DrawTeamBackground
;569:
;570:================
;571:*/
;572:#ifndef USE_NEOHUD
;573:void CG_DrawTeamBackground( int x, int y, int w, int h, float alpha, int team )
;574:{
;575:	vec4_t		hcolor;
;576:
;577:	hcolor[3] = alpha;
;578:	if ( team == TEAM_RED ) {
;579:		hcolor[0] = 1.0f;
;580:		hcolor[1] = 0.0f;
;581:		hcolor[2] = 0.0f;
;582:	} else if ( team == TEAM_BLUE ) {
;583:		hcolor[0] = 0.0f;
;584:		hcolor[1] = 0.1f;
;585:		hcolor[2] = 1.0f;
;586:	} else {
;587:		return;
;588:	}
;589:	trap_R_SetColor( hcolor );
;590:	CG_DrawPic( x, y, w, h, cgs.media.teamStatusBar );
;591:	trap_R_SetColor( NULL );
;592:}
;593:#endif
;594:
;595:/*
;596:================
;597:CG_DrawStatusBar
;598:================
;599:*/
;600:#if !defined MISSIONPACK && !defined USE_NEOHUD
;601:#define STATUSBAR_HEIGHT 60
;602:static void CG_DrawStatusBar( void ) {
;603:	int			color;
;604:	centity_t	*cent;
;605:	playerState_t	*ps;
;606:	int			value;
;607:	vec4_t		hcolor;
;608:	vec3_t		angles;
;609:	vec3_t		origin;
;610:	float		y;
;611:#ifdef MISSIONPACK
;612:	qhandle_t	handle;
;613:#endif
;614:	static float colors[4][4] = { 
;615://		{ 0.2, 1.0, 0.2, 1.0 } , { 1.0, 0.2, 0.2, 1.0 }, {0.5, 0.5, 0.5, 1} };
;616:		{ 1.0f, 0.69f, 0.0f, 1.0f },    // normal
;617:		{ 1.0f, 0.2f, 0.2f, 1.0f },     // low health
;618:		{ 0.5f, 0.5f, 0.5f, 1.0f },     // weapon firing
;619:		{ 1.0f, 1.0f, 1.0f, 1.0f } };   // health > 100
;620:
;621:	if ( cg_drawStatus.integer == 0 ) {
;622:		return;
;623:	}
;624:
;625:	// draw the team background
;626:	CG_DrawTeamBackground( cgs.screenXmin, cgs.screenYmax - STATUSBAR_HEIGHT + 1,
;627:		cgs.screenXmax - cgs.screenXmin + 1, STATUSBAR_HEIGHT, 
;628:		0.33f, cg.snap->ps.persistant[ PERS_TEAM ] );
;629:
;630:	y = cgs.screenYmax + 1 - ICON_SIZE;
;631:
;632:	cent = &cg_entities[cg.snap->ps.clientNum];
;633:	ps = &cg.snap->ps;
;634:
;635:	VectorClear( angles );
;636:
;637:	// draw any 3D icons first, so the changes back to 2D are minimized
;638:	if ( cent->currentState.weapon && cg_weapons[ cent->currentState.weapon ].ammoModel ) {
;639:		origin[0] = 70;
;640:		origin[1] = 0;
;641:		origin[2] = 0;
;642:		angles[YAW] = 90 + 20 * sin( ( cg.time % TMOD_1000 ) / 1000.0 );
;643:		CG_Draw3DModel( CHAR_WIDTH*3 + TEXT_ICON_SPACE, y, ICON_SIZE, ICON_SIZE,
;644:					   cg_weapons[ cent->currentState.weapon ].ammoModel, 0, origin, angles );
;645:	}
;646:
;647:	CG_DrawStatusBarHead( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE );
;648:
;649:	if( cg.predictedPlayerState.powerups[PW_REDFLAG] ) {
;650:		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_RED );
;651:	} else if( cg.predictedPlayerState.powerups[PW_BLUEFLAG] ) {
;652:		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_BLUE );
;653:	} else if( cg.predictedPlayerState.powerups[PW_NEUTRALFLAG] ) {
;654:		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_FREE );
;655:	}
;656:
;657:	if ( ps->stats[ STAT_ARMOR ] ) {
;658:		origin[0] = 90;
;659:		origin[1] = 0;
;660:		origin[2] = -10;
;661:		angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
;662:		CG_Draw3DModel( 370 + CHAR_WIDTH*3 + TEXT_ICON_SPACE, y, ICON_SIZE, ICON_SIZE,
;663:					   cgs.media.armorModel, 0, origin, angles );
;664:	}
;665:#ifdef MISSIONPACK
;666:	if( cgs.gametype == GT_HARVESTER ) {
;667:		origin[0] = 90;
;668:		origin[1] = 0;
;669:		origin[2] = -10;
;670:		angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
;671:		if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
;672:			handle = cgs.media.redCubeModel;
;673:		} else {
;674:			handle = cgs.media.blueCubeModel;
;675:		}
;676:		CG_Draw3DModel( 640 - (TEXT_ICON_SPACE + ICON_SIZE), 416, ICON_SIZE, ICON_SIZE, handle, 0, origin, angles );
;677:	}
;678:#endif
;679:	//
;680:	// ammo
;681:	//
;682:	if ( cent->currentState.weapon ) {
;683:		value = ps->ammo[cent->currentState.weapon];
;684:		if ( value > -1 ) {
;685:			if ( cg.predictedPlayerState.weaponstate == WEAPON_FIRING
;686:				&& cg.predictedPlayerState.weaponTime > 100 ) {
;687:				// draw as dark grey when reloading
;688:				color = 2;	// dark grey
;689:			} else {
;690:				if ( value >= 0 ) {
;691:					color = 0;	// yellow
;692:				} else {
;693:					color = 1;	// red
;694:				}
;695:			}
;696:#ifdef USE_NEW_FONT_RENDERER
;697:			CG_SelectFont( 1 );
;698:			CG_DrawString( CHAR_WIDTH*3, y, va( "%i", value ), colors[ color ], CHAR_WIDTH, CHAR_HEIGHT, 0, DS_RIGHT | DS_PROPORTIONAL );
;699:			CG_SelectFont( 0 );
;700:#else
;701:			trap_R_SetColor( colors[color] );
;702:			CG_DrawField( 0, y, 3, value );
;703:#endif
;704:			trap_R_SetColor( NULL );
;705:
;706:			// if we didn't draw a 3D icon, draw a 2D icon for ammo
;707:			if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
;708:				qhandle_t	icon;
;709:
;710:				icon = cg_weapons[ cg.predictedPlayerState.weapon ].ammoIcon;
;711:				if ( icon ) {
;712:					CG_DrawPic( CHAR_WIDTH*3 + TEXT_ICON_SPACE, y, ICON_SIZE, ICON_SIZE, icon );
;713:				}
;714:			}
;715:		}
;716:	}
;717:
;718:	//
;719:	// health
;720:	//
;721:	value = ps->stats[STAT_HEALTH];
;722:	if ( value > 100 ) {
;723:		color = 3; // white
;724:	} else if ( value > 25 ) {
;725:		color = 0; 	// yellow
;726:	} else if (value > 0) {
;727:		color = (cg.time >> 8) & 1;	// red/yellow flashing
;728:	} else {
;729:		color = 1; // red
;730:	}
;731:
;732:#ifdef USE_NEW_FONT_RENDERER
;733:	CG_SelectFont( 1 );
;734:	CG_DrawString( 185 + CHAR_WIDTH*3, y, va( "%i", value ), colors[ color ], CHAR_WIDTH, CHAR_HEIGHT, 0, DS_RIGHT | DS_PROPORTIONAL );
;735:	CG_SelectFont( 0 );
;736:#else
;737:	trap_R_SetColor( colors[ color ] );
;738:	// stretch the health up when taking damage
;739:	CG_DrawField( 185, y, 3, value );
;740:#endif
;741:	
;742:	CG_ColorForHealth( hcolor );
;743:	trap_R_SetColor( hcolor );
;744:
;745:	//
;746:	// armor
;747:	//
;748:	value = ps->stats[STAT_ARMOR];
;749:	if ( value > 0 ) {
;750:#ifdef USE_NEW_FONT_RENDERER
;751:		CG_SelectFont( 1 );
;752:		CG_DrawString( 370 + CHAR_WIDTH*3, y, va( "%i", value ), colors[ color ], CHAR_WIDTH, CHAR_HEIGHT, 0, DS_RIGHT | DS_PROPORTIONAL );
;753:		CG_SelectFont( 0 );
;754:#else
;755:		trap_R_SetColor( colors[0] );
;756:		CG_DrawField( 370, y, 3, value );
;757:#endif
;758:		trap_R_SetColor( NULL );
;759:		// if we didn't draw a 3D icon, draw a 2D icon for armor
;760:		if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
;761:			CG_DrawPic( 370 + CHAR_WIDTH*3 + TEXT_ICON_SPACE, y, ICON_SIZE, ICON_SIZE, cgs.media.armorIcon );
;762:		}
;763:	}
;764:
;765:#ifdef MISSIONPACK
;766:	//
;767:	// cubes
;768:	//
;769:	if( cgs.gametype == GT_HARVESTER ) {
;770:		value = ps->generic1;
;771:		if( value > 99 ) {
;772:			value = 99;
;773:		}
;774:		trap_R_SetColor( colors[0] );
;775:		CG_DrawField (640 - (CHAR_WIDTH*2 + TEXT_ICON_SPACE + ICON_SIZE), y, 2, value);
;776:		trap_R_SetColor( NULL );
;777:		// if we didn't draw a 3D icon, draw a 2D icon for armor
;778:		if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
;779:			if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
;780:				handle = cgs.media.redCubeIcon;
;781:			} else {
;782:				handle = cgs.media.blueCubeIcon;
;783:			}
;784:			CG_DrawPic( 640 - (TEXT_ICON_SPACE + ICON_SIZE), y, ICON_SIZE, ICON_SIZE, handle );
;785:		}
;786:	}
;787:#endif
;788:}
;789:#endif
;790:
;791:/*
;792:===========================================================================================
;793:
;794:  UPPER RIGHT CORNER
;795:
;796:===========================================================================================
;797:*/
;798:
;799:/*
;800:================
;801:CG_DrawAttacker
;802:
;803:================
;804:*/
;805:#ifndef USE_NEOHUD
;806:static float CG_DrawAttacker( float y ) {
;807:	int			t;
;808:	float		size;
;809:	vec3_t		angles;
;810:	const char	*info;
;811:	const char	*name;
;812:	int			clientNum;
;813:	vec4_t		color;
;814:
;815:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) {
;816:		return y;
;817:	}
;818:
;819:	if ( !cg.attackerTime ) {
;820:		return y;
;821:	}
;822:
;823:	clientNum = cg.predictedPlayerState.persistant[PERS_ATTACKER];
;824:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS || clientNum == cg.snap->ps.clientNum ) {
;825:		return y;
;826:	}
;827:
;828:	t = cg.time - cg.attackerTime;
;829:	if ( t > ATTACKER_HEAD_TIME ) {
;830:		cg.attackerTime = 0;
;831:		return y;
;832:	}
;833:
;834:	size = ICON_SIZE * 1.25;
;835:
;836:	angles[PITCH] = 0;
;837:	angles[YAW] = 180;
;838:	angles[ROLL] = 0;
;839:	CG_DrawHead( cgs.screenXmax + 1 - size, y, size, size, clientNum, angles );
;840:
;841:	info = CG_ConfigString( CS_PLAYERS + clientNum );
;842:	name = Info_ValueForKey(  info, "n" );
;843:	y += size;
;844:
;845:	VectorSet( color, 1, 1, 1 );
;846:	color[3] = 0.5f;
;847:
;848:	CG_DrawString( cgs.screenXmax - 4, y, name, color, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_PROPORTIONAL | DS_RIGHT );
;849:
;850:	return y + BIGCHAR_HEIGHT + 2;
;851:}
;852:#endif
;853:
;854:/*
;855:================
;856:CG_DrawSpeedMeter
;857:================
;858:*/
;859:#ifndef USE_NEOHUD
;860:static float CG_DrawSpeedMeter( float y ) {
;861:	const char *s;
;862:
;863:	/* speed meter can get in the way of the scoreboard */
;864:	if ( cg.scoreBoardShowing ) {
;865:		return y;
;866:	}
;867:
;868:	s = va( "%1.0fups", cg.xyspeed );
;869:
;870:	if ( cg_drawSpeed.integer == 1 ) {
;871:		/* top left-hand corner of screen */
;872:		CG_DrawString( cgs.screenXmax - 4, y + 2, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT | DS_PROPORTIONAL );
;873:		return y + BIGCHAR_HEIGHT + 4;
;874:	} else {
;875:		/* center of screen */
;876:		CG_DrawString( 320, 300, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL );
;877:		return y;
;878:	}
;879:}
;880:#endif
;881:
;882:/*
;883:==================
;884:CG_DrawSnapshot
;885:==================
;886:*/
;887:#ifndef USE_NEOHUD
;888:static float CG_DrawSnapshot( float y ) {
;889:	const char *s;
;890:
;891:	s = va( "time:%i snap:%i cmd:%i", cg.snap->serverTime, 
;892:		cg.latestSnapshotNum, cgs.serverCommandSequence );
;893:
;894:	CG_DrawString( cgs.screenXmax - 4, y + 2, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
;895:
;896:	return y + BIGCHAR_HEIGHT + 4;
;897:}
;898:#endif
;899:
;900:/*
;901:==================
;902:CG_DrawFPS
;903:==================
;904:*/
;905:#ifndef USE_NEOHUD
;906:#define	FPS_FRAMES	4
;907:static float CG_DrawFPS( float y ) {
;908:	const char	*s;
;909:	static int	previousTimes[FPS_FRAMES];
;910:	static int	index;
;911:	int		i, total;
;912:	int		fps;
;913:	static	int	previous;
;914:	int		t, frameTime;
;915:
;916:	// don't use serverTime, because that will be drifting to
;917:	// correct for internet lag changes, timescales, timedemos, etc
;918:	t = trap_Milliseconds();
;919:	frameTime = t - previous;
;920:	previous = t;
;921:
;922:	previousTimes[index % FPS_FRAMES] = frameTime;
;923:	index++;
;924:	if ( index > FPS_FRAMES ) {
;925:		// average multiple frames together to smooth changes out a bit
;926:		total = 0;
;927:		for ( i = 0 ; i < FPS_FRAMES ; i++ ) {
;928:			total += previousTimes[i];
;929:		}
;930:		if ( !total ) {
;931:			total = 1;
;932:		}
;933:		fps = 1000 * FPS_FRAMES / total;
;934:
;935:		s = va( "%ifps", fps );
;936:		CG_DrawString( cgs.screenXmax - 4, y + 2, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT | DS_PROPORTIONAL );
;937:	}
;938:
;939:	return y + BIGCHAR_HEIGHT + 4;
;940:}
;941:#endif
;942:
;943:/*
;944:=================
;945:CG_DrawTimer
;946:=================
;947:*/
;948:#ifndef USE_NEOHUD
;949:static float CG_DrawTimer( float y ) {
;950:	const char	*s;
;951:	int			mins, seconds;
;952:	int			msec;
;953:
;954:	msec = cg.time - cgs.levelStartTime;
;955:
;956:	seconds = msec / 1000;
;957:	mins = seconds / 60;
;958:	seconds -= mins * 60;
;959:
;960:	s = va( "%i:%02i", mins, seconds );
;961:	CG_DrawString( cgs.screenXmax - 4, y + 2, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT | DS_PROPORTIONAL );
;962:
;963:	return y + BIGCHAR_HEIGHT + 4;
;964:}
;965:#endif
;966:
;967:
;968:/*
;969:=================
;970:CG_DrawTeamOverlay
;971:=================
;972:*/
;973:#ifndef USE_NEOHUD
;974:static float CG_DrawTeamOverlay( float y, qboolean right, qboolean upper ) {
;975:	int x, w, h, xx;
;976:	int i, j, len;
;977:	const char *p;
;978:	vec4_t		hcolor;
;979:	int pwidth, lwidth;
;980:	int plyrs;
;981:	char st[16];
;982:	clientInfo_t *ci;
;983:	gitem_t	*item;
;984:	int ret_y, count;
;985:
;986:	if ( !cg_drawTeamOverlay.integer ) {
;987:		return y;
;988:	}
;989:
;990:	if ( cg.snap->ps.persistant[PERS_TEAM] != TEAM_RED && cg.snap->ps.persistant[PERS_TEAM] != TEAM_BLUE ) {
;991:		return y; // Not on any team
;992:	}
;993:
;994:	plyrs = 0;
;995:
;996:	// max player name width
;997:	pwidth = 0;
;998:	count = (numSortedTeamPlayers > 8) ? 8 : numSortedTeamPlayers;
;999:	for (i = 0; i < count; i++) {
;1000:		ci = cgs.clientinfo + sortedTeamPlayers[i];
;1001:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
;1002:			plyrs++;
;1003:			len = CG_DrawStrlen(ci->name);
;1004:			if (len > pwidth)
;1005:				pwidth = len;
;1006:		}
;1007:	}
;1008:
;1009:	if (!plyrs)
;1010:		return y;
;1011:
;1012:	if (pwidth > TEAM_OVERLAY_MAXNAME_WIDTH)
;1013:		pwidth = TEAM_OVERLAY_MAXNAME_WIDTH;
;1014:
;1015:	// max location name width
;1016:	lwidth = 0;
;1017:	for (i = 1; i < MAX_LOCATIONS; i++) {
;1018:		p = CG_ConfigString(CS_LOCATIONS + i);
;1019:		if (p && *p) {
;1020:			len = CG_DrawStrlen(p);
;1021:			if (len > lwidth)
;1022:				lwidth = len;
;1023:		}
;1024:	}
;1025:
;1026:	if (lwidth > TEAM_OVERLAY_MAXLOCATION_WIDTH)
;1027:		lwidth = TEAM_OVERLAY_MAXLOCATION_WIDTH;
;1028:
;1029:	w = (pwidth + lwidth + 4 + 7) * TINYCHAR_WIDTH;
;1030:
;1031:	if ( right )
;1032:		x = cgs.screenXmax + 1 - w;
;1033:	else
;1034:		x = cgs.screenXmin;
;1035:
;1036:	h = plyrs * TINYCHAR_HEIGHT;
;1037:
;1038:	if ( upper ) {
;1039:		ret_y = y + h;
;1040:	} else {
;1041:		y -= h;
;1042:		ret_y = y;
;1043:	}
;1044:
;1045:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
;1046:		hcolor[0] = 1.0f;
;1047:		hcolor[1] = 0.0f;
;1048:		hcolor[2] = 0.0f;
;1049:		hcolor[3] = 0.33f;
;1050:	} else { // if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
;1051:		hcolor[0] = 0.0f;
;1052:		hcolor[1] = 0.0f;
;1053:		hcolor[2] = 1.0f;
;1054:		hcolor[3] = 0.33f;
;1055:	}
;1056:	trap_R_SetColor( hcolor );
;1057:	CG_DrawPic( x, y, w, h, cgs.media.teamStatusBar );
;1058:	trap_R_SetColor( NULL );
;1059:
;1060:	for (i = 0; i < count; i++) {
;1061:		ci = cgs.clientinfo + sortedTeamPlayers[i];
;1062:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
;1063:
;1064:			hcolor[0] = hcolor[1] = hcolor[2] = hcolor[3] = 1.0;
;1065:
;1066:			xx = x + TINYCHAR_WIDTH;
;1067:
;1068:			CG_DrawString( xx, y, ci->name, hcolor, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, TEAM_OVERLAY_MAXNAME_WIDTH, DS_PROPORTIONAL );
;1069:
;1070:			if (lwidth) {
;1071:				p = CG_ConfigString(CS_LOCATIONS + ci->location);
;1072:				if (!p || !*p)
;1073:					p = "unknown";
;1074:				len = CG_DrawStrlen(p);
;1075:				if (len > lwidth)
;1076:					len = lwidth;
;1077:
;1078://				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth + 
;1079://					((lwidth/2 - len/2) * TINYCHAR_WIDTH);
;1080:				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth;
;1081:				CG_DrawString( xx, y, p, hcolor, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, TEAM_OVERLAY_MAXLOCATION_WIDTH, DS_PROPORTIONAL );
;1082:			}
;1083:
;1084:			CG_GetColorForHealth( ci->health, ci->armor, hcolor );
;1085:
;1086:			Com_sprintf (st, sizeof(st), "%3i %3i", ci->health,	ci->armor);
;1087:
;1088:			xx = x + TINYCHAR_WIDTH * 3 + 
;1089:				TINYCHAR_WIDTH * pwidth + TINYCHAR_WIDTH * lwidth;
;1090:
;1091:			CG_DrawString( xx, y, st, hcolor, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0, 0 );
;1092:
;1093:			// draw weapon icon
;1094:			xx += TINYCHAR_WIDTH * 3;
;1095:
;1096:			if ( cg_weapons[ci->curWeapon].weaponIcon ) {
;1097:				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
;1098:					cg_weapons[ci->curWeapon].weaponIcon );
;1099:			} else {
;1100:				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
;1101:					cgs.media.deferShader );
;1102:			}
;1103:
;1104:			// Draw powerup icons
;1105:			if (right) {
;1106:				xx = x;
;1107:			} else {
;1108:				xx = x + w - TINYCHAR_WIDTH;
;1109:			}
;1110:			for (j = 0; j <= PW_NUM_POWERUPS; j++) {
;1111:				if (ci->powerups & (1 << j)) {
;1112:
;1113:					item = BG_FindItemForPowerup( j );
;1114:
;1115:					if (item) {
;1116:						CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
;1117:						trap_R_RegisterShader( item->icon ) );
;1118:						if (right) {
;1119:							xx -= TINYCHAR_WIDTH;
;1120:						} else {
;1121:							xx += TINYCHAR_WIDTH;
;1122:						}
;1123:					}
;1124:				}
;1125:			}
;1126:
;1127:			y += TINYCHAR_HEIGHT;
;1128:		}
;1129:	}
;1130:
;1131:	return ret_y;
;1132:}
;1133:#endif
;1134:
;1135:/*
;1136:=====================
;1137:CG_DrawUpperRight
;1138:
;1139:=====================
;1140:*/
;1141:#ifndef USE_NEOHUD
;1142:static void CG_DrawUpperRight(stereoFrame_t stereoFrame)
;1143:{
;1144:	float	y;
;1145:
;1146:	y = cgs.screenYmin;
;1147:
;1148:	if ( cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 1 ) {
;1149:		y = CG_DrawTeamOverlay( y, qtrue, qtrue );
;1150:	} 
;1151:	if ( cg_drawSnapshot.integer ) {
;1152:		y = CG_DrawSnapshot( y );
;1153:	}
;1154:	if (cg_drawFPS.integer && (stereoFrame == STEREO_CENTER || stereoFrame == STEREO_RIGHT)) {
;1155:		y = CG_DrawFPS( y );
;1156:	}
;1157:	if ( cg_drawSpeed.integer ) {
;1158:		y = CG_DrawSpeedMeter( y );
;1159:	}	
;1160:	if ( cg_drawTimer.integer ) {
;1161:		y = CG_DrawTimer( y );
;1162:	}
;1163:	if ( cg_drawAttacker.integer ) {
;1164:		y = CG_DrawAttacker( y );
;1165:	}
;1166:}
;1167:#endif
;1168:
;1169:/*
;1170:===========================================================================================
;1171:
;1172:  LOWER RIGHT CORNER
;1173:
;1174:===========================================================================================
;1175:*/
;1176:
;1177:/*
;1178:=================
;1179:CG_DrawScores
;1180:
;1181:Draw the small two score display
;1182:=================
;1183:*/
;1184:#if !defined MISSIONPACK && !defined USE_NEOHUD
;1185:static float CG_DrawScores( float y ) {
;1186:	const char	*s;
;1187:	int			s1, s2, score;
;1188:	int			x, x0, w;
;1189:	int			v;
;1190:	vec4_t		color;
;1191:	float		y1;
;1192:	gitem_t		*item;
;1193:
;1194:	s1 = cgs.scores1;
;1195:	s2 = cgs.scores2;
;1196:
;1197:	y -=  BIGCHAR_HEIGHT + 8 - 4;
;1198:
;1199:	y1 = y;
;1200:
;1201:	// draw from the right side to left
;1202:	if ( cgs.gametype >= GT_TEAM ) {
;1203:		x0 = cgs.screenXmax + 1;
;1204:		color[0] = 0.0f;
;1205:		color[1] = 0.1f;
;1206:		color[2] = 1.0f;
;1207:		color[3] = 0.33f;
;1208:		// second score
;1209:		s = va( "%2i", s2 );
;1210:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
;1211:		x = x0 - w;
;1212:		CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
;1213:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
;1214:			CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
;1215:		}
;1216:		CG_DrawString( x0-4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
;1217:
;1218:		if ( cgs.gametype == GT_CTF ) {
;1219:			// Display flag status
;1220:			item = BG_FindItemForPowerup( PW_BLUEFLAG );
;1221:
;1222:			if (item) {
;1223:				y1 = y - BIGCHAR_HEIGHT - 8;
;1224:				if( cgs.blueflag >= 0 && cgs.blueflag <= 2 ) {
;1225:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.blueFlagShader[cgs.blueflag] );
;1226:				}
;1227:			}
;1228:		}
;1229:		color[0] = 1.0f;
;1230:		color[1] = 0.0f;
;1231:		color[2] = 0.0f;
;1232:		color[3] = 0.33f;
;1233:		// first score
;1234:		x0 = x;
;1235:		s = va( "%2i", s1 );
;1236:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
;1237:		x -= w;
;1238:		CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
;1239:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
;1240:			CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
;1241:		}
;1242:
;1243:		CG_DrawString( x0-4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
;1244:
;1245:		if ( cgs.gametype == GT_CTF ) {
;1246:			// Display flag status
;1247:			item = BG_FindItemForPowerup( PW_REDFLAG );
;1248:
;1249:			if (item) {
;1250:				y1 = y - BIGCHAR_HEIGHT - 8;
;1251:				if( cgs.redflag >= 0 && cgs.redflag <= 2 ) {
;1252:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.redFlagShader[cgs.redflag] );
;1253:				}
;1254:			}
;1255:		}
;1256:
;1257:#ifdef MISSIONPACK
;1258:		if ( cgs.gametype == GT_1FCTF ) {
;1259:			// Display flag status
;1260:			item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
;1261:
;1262:			if (item) {
;1263:				y1 = y - BIGCHAR_HEIGHT - 8;
;1264:				if( cgs.flagStatus >= 0 && cgs.flagStatus <= 3 ) {
;1265:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.flagShader[cgs.flagStatus] );
;1266:				}
;1267:			}
;1268:		}
;1269:#endif
;1270:		if ( cgs.gametype >= GT_CTF ) {
;1271:			v = cgs.capturelimit;
;1272:		} else {
;1273:			v = cgs.fraglimit;
;1274:		}
;1275:		if ( v ) {
;1276:			s = va( "%2i", v );
;1277:			CG_DrawString( x-4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
;1278:		}
;1279:
;1280:	} else {
;1281:		qboolean	spectator;
;1282:
;1283:		x = cgs.screenXmax + 1;
;1284:
;1285:		score = cg.snap->ps.persistant[PERS_SCORE];
;1286:		spectator = ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR );
;1287:
;1288:		// always show your score in the second box if not in first place
;1289:		if ( s1 != score ) {
;1290:			s2 = score;
;1291:		}
;1292:		if ( s2 != SCORE_NOT_PRESENT ) {
;1293:			x0 = x;
;1294:			s = va( "%2i", s2 );
;1295:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
;1296:			x -= w;
;1297:			if ( !spectator && score == s2 && score != s1 ) {
;1298:				color[0] = 1.0f;
;1299:				color[1] = 0.0f;
;1300:				color[2] = 0.0f;
;1301:				color[3] = 0.33f;
;1302:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
;1303:				CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
;1304:			} else {
;1305:				color[0] = 0.5f;
;1306:				color[1] = 0.5f;
;1307:				color[2] = 0.5f;
;1308:				color[3] = 0.33f;
;1309:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
;1310:			}	
;1311:			CG_DrawString( x0-4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
;1312:		}
;1313:
;1314:		// first place
;1315:		if ( s1 != SCORE_NOT_PRESENT ) {
;1316:			x0 = x;
;1317:			s = va( "%2i", s1 );
;1318:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
;1319:			x -= w;
;1320:			if ( !spectator && score == s1 ) {
;1321:				color[0] = 0.0f;
;1322:				color[1] = 0.1f;
;1323:				color[2] = 1.0f;
;1324:				color[3] = 0.33f;
;1325:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
;1326:				CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
;1327:			} else {
;1328:				color[0] = 0.5f;
;1329:				color[1] = 0.5f;
;1330:				color[2] = 0.5f;
;1331:				color[3] = 0.33f;
;1332:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
;1333:			}
;1334:			CG_DrawString( x0-4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
;1335:		}
;1336:
;1337:		if ( cgs.fraglimit ) {
;1338:			s = va( "%2i", cgs.fraglimit );
;1339:			CG_DrawString( x-4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
;1340:		}
;1341:	}
;1342:
;1343:	return y1 - 8;
;1344:}
;1345:#endif // MISSIONPACK
;1346:
;1347:
;1348:/*
;1349:================
;1350:CG_DrawPowerups
;1351:================
;1352:*/
;1353:#if !defined MISSIONPACK && !defined USE_NEOHUD
;1354:static float CG_DrawPowerups( float y ) {
;1355:	int		sorted[MAX_POWERUPS];
;1356:	int		sortedTime[MAX_POWERUPS];
;1357:	int		i, j, k;
;1358:	int		active;
;1359:	playerState_t	*ps;
;1360:	int		t;
;1361:	gitem_t	*item;
;1362:	int		x;
;1363:	int		color;
;1364:	float	size;
;1365:	float	f;
;1366:	static const float colors[2][4] = { 
;1367:		{ 0.2f, 1.0f, 0.2f, 1.0f },
;1368:		{ 1.0f, 0.2f, 0.2f, 1.0f } 
;1369:	};
;1370:
;1371:	ps = &cg.snap->ps;
;1372:
;1373:	if ( ps->stats[STAT_HEALTH] <= 0 ) {
;1374:		return y;
;1375:	}
;1376:
;1377:	// sort the list by time remaining
;1378:	active = 0;
;1379:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
;1380:		if ( !ps->powerups[ i ] ) {
;1381:			continue;
;1382:		}
;1383:		t = ps->powerups[ i ] - cg.time;
;1384:		// ZOID--don't draw if the power up has unlimited time (999 seconds)
;1385:		// This is true of the CTF flags
;1386:		if ( t < 0 || t > 999000) {
;1387:			continue;
;1388:		}
;1389:
;1390:		// insert into the list
;1391:		for ( j = 0 ; j < active ; j++ ) {
;1392:			if ( sortedTime[j] >= t ) {
;1393:				for ( k = active - 1 ; k >= j ; k-- ) {
;1394:					sorted[k+1] = sorted[k];
;1395:					sortedTime[k+1] = sortedTime[k];
;1396:				}
;1397:				break;
;1398:			}
;1399:		}
;1400:		sorted[j] = i;
;1401:		sortedTime[j] = t;
;1402:		active++;
;1403:	}
;1404:
;1405:	// draw the icons and timers
;1406:	x = cgs.screenXmax + 1 - ICON_SIZE - CHAR_WIDTH * 2;
;1407:	for ( i = 0 ; i < active ; i++ ) {
;1408:		item = BG_FindItemForPowerup( sorted[i] );
;1409:
;1410:		if ( item ) {
;1411:
;1412:			color = 1;
;1413:
;1414:			y -= ICON_SIZE;
;1415:
;1416:			trap_R_SetColor( colors[color] );
;1417:			CG_DrawField( x, y, 2, sortedTime[ i ] / 1000 );
;1418:
;1419:			t = ps->powerups[ sorted[i] ];
;1420:			if ( t - cg.time >= POWERUP_BLINKS * POWERUP_BLINK_TIME ) {
;1421:				trap_R_SetColor( NULL );
;1422:			} else {
;1423:				vec4_t	modulate;
;1424:
;1425:				f = (float)( t - cg.time ) / POWERUP_BLINK_TIME;
;1426:				f -= (int)f;
;1427:				modulate[0] = modulate[1] = modulate[2] = modulate[3] = f;
;1428:				trap_R_SetColor( modulate );
;1429:			}
;1430:
;1431:			if ( cg.powerupActive == sorted[i] && 
;1432:				cg.time - cg.powerupTime < PULSE_TIME ) {
;1433:				f = 1.0 - ( (float)( cg.time - cg.powerupTime ) / PULSE_TIME );
;1434:				size = ICON_SIZE * ( 1.0 + ( PULSE_SCALE - 1.0 ) * f );
;1435:			} else {
;1436:				size = ICON_SIZE;
;1437:			}
;1438:
;1439:			CG_DrawPic( cgs.screenXmax + 1 - size, y + ICON_SIZE / 2 - size / 2, 
;1440:				size, size, trap_R_RegisterShader( item->icon ) );
;1441:		} // if ( item )
;1442:	}
;1443:	trap_R_SetColor( NULL );
;1444:
;1445:	return y;
;1446:}
;1447:#endif // MISSIONPACK
;1448:
;1449:
;1450:/*
;1451:=====================
;1452:CG_DrawLowerRight
;1453:
;1454:=====================
;1455:*/
;1456:#if !defined MISSIONPACK && !defined USE_NEOHUD
;1457:static void CG_DrawLowerRight( void ) {
;1458:	float	y;
;1459:
;1460:	y = cgs.screenYmax + 1 - STATUSBAR_HEIGHT;
;1461:
;1462:	if ( cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 2 ) {
;1463:		y = CG_DrawTeamOverlay( y, qtrue, qfalse );
;1464:	} 
;1465:
;1466:	y = CG_DrawScores( y );
;1467:	y = CG_DrawPowerups( y );
;1468:}
;1469:#endif // MISSIONPACK
;1470:
;1471:
;1472:/*
;1473:===================
;1474:CG_DrawPickupItem
;1475:===================
;1476:*/
;1477:#if !defined MISSIONPACK && !defined USE_NEOHUD
;1478:static int CG_DrawPickupItem( int y ) {
;1479:	int		value;
;1480:	float	*fadeColor;
;1481:	const char *text;
;1482:
;1483:	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) {
;1484:		return y;
;1485:	}
;1486:
;1487:	y -= PICKUP_ICON_SIZE;
;1488:
;1489:	value = cg.itemPickup;
;1490:	if ( value ) {
;1491:		fadeColor = CG_FadeColorTime( cg.itemPickupTime, 3000, 250 );
;1492:		if ( fadeColor ) {
;1493:			CG_RegisterItemVisuals( value );
;1494:			trap_R_SetColor( fadeColor );
;1495:			CG_DrawPic( cgs.screenXmin + 8, y, PICKUP_ICON_SIZE, PICKUP_ICON_SIZE, cg_items[ value ].icon );
;1496:			if ( cg.itemPickupCount > 1 ) {
;1497:				text = va( "%s x%i", bg_itemlist[ value ].pickup_name, cg.itemPickupCount );
;1498:			} else {
;1499:				text = bg_itemlist[ value ].pickup_name;
;1500:			}
;1501:
;1502:			CG_DrawString( cgs.screenXmin + PICKUP_ICON_SIZE + 16, y + (PICKUP_ICON_SIZE/2 - PICKUP_TEXT_SIZE/2), 
;1503:				text, fadeColor, PICKUP_TEXT_SIZE, PICKUP_TEXT_SIZE, 0, DS_SHADOW | DS_PROPORTIONAL );
;1504:			
;1505:			trap_R_SetColor( NULL );
;1506:		} else {
;1507:			cg.itemPickupCount = 0;
;1508:		}
;1509:	}
;1510:	
;1511:	return y;
;1512:}
;1513:#endif // MISSIONPACK
;1514:
;1515:
;1516:/*
;1517:=====================
;1518:CG_DrawLowerLeft
;1519:=====================
;1520:*/
;1521:#if !defined MISSIONPACK && !defined USE_NEOHUD
;1522:static void CG_DrawLowerLeft( void ) {
;1523:	float	y;
;1524:
;1525:	y = cgs.screenYmax + 1 - STATUSBAR_HEIGHT;
;1526:
;1527:	if ( cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 3 ) {
;1528:		y = CG_DrawTeamOverlay( y, qfalse, qfalse );
;1529:	} 
;1530:
;1531:	y = CG_DrawPickupItem( y );
;1532:}
;1533:#endif // MISSIONPACK
;1534:
;1535:
;1536://===========================================================================================
;1537:
;1538:/*
;1539:=================
;1540:CG_DrawTeamInfo
;1541:=================
;1542:*/
;1543:#if !defined MISSIONPACK && !defined USE_NEOHUD
;1544:static void CG_DrawTeamInfo( void ) {
;1545:	int w, h;
;1546:	int i, len;
;1547:	vec4_t		hcolor;
;1548:	int		chatHeight;
;1549:
;1550:	#define CHATLOC_Y (cgs.screenYmax + 1 - STATUSBAR_HEIGHT ) // bottom end
;1551:	#define CHATLOC_X (cgs.screenXmin)
;1552:
;1553:	if (cg_teamChatHeight.integer < TEAMCHAT_HEIGHT)
;1554:		chatHeight = cg_teamChatHeight.integer;
;1555:	else
;1556:		chatHeight = TEAMCHAT_HEIGHT;
;1557:	if (chatHeight <= 0)
;1558:		return; // disabled
;1559:
;1560:	if (cgs.teamLastChatPos != cgs.teamChatPos) {
;1561:		if (cg.time - cgs.teamChatMsgTimes[cgs.teamLastChatPos % chatHeight] > cg_teamChatTime.integer) {
;1562:			cgs.teamLastChatPos++;
;1563:		}
;1564:
;1565:		h = (cgs.teamChatPos - cgs.teamLastChatPos) * TINYCHAR_HEIGHT;
;1566:
;1567:		w = 0;
;1568:
;1569:		for (i = cgs.teamLastChatPos; i < cgs.teamChatPos; i++) {
;1570:			len = CG_DrawStrlen(cgs.teamChatMsgs[i % chatHeight]);
;1571:			if (len > w)
;1572:				w = len;
;1573:		}
;1574:		w *= TINYCHAR_WIDTH;
;1575:		w += TINYCHAR_WIDTH * 2;
;1576:
;1577:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
;1578:			hcolor[0] = 1.0f;
;1579:			hcolor[1] = 0.0f;
;1580:			hcolor[2] = 0.0f;
;1581:			hcolor[3] = 0.33f;
;1582:		} else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
;1583:			hcolor[0] = 0.0f;
;1584:			hcolor[1] = 0.0f;
;1585:			hcolor[2] = 1.0f;
;1586:			hcolor[3] = 0.33f;
;1587:		} else {
;1588:			hcolor[0] = 0.0f;
;1589:			hcolor[1] = 1.0f;
;1590:			hcolor[2] = 0.0f;
;1591:			hcolor[3] = 0.33f;
;1592:		}
;1593:
;1594:		trap_R_SetColor( hcolor );
;1595:		CG_DrawPic( CHATLOC_X, CHATLOC_Y - h, w, h, cgs.media.teamStatusBar );
;1596:		trap_R_SetColor( NULL );
;1597:
;1598:		hcolor[0] = hcolor[1] = hcolor[2] = 1.0f;
;1599:		hcolor[3] = 1.0f;
;1600:
;1601:		for ( i = cgs.teamChatPos - 1; i >= cgs.teamLastChatPos; i-- ) {
;1602:			CG_DrawString( CHATLOC_X + TINYCHAR_WIDTH, CHATLOC_Y - (cgs.teamChatPos - i)*TINYCHAR_HEIGHT, 
;1603:				cgs.teamChatMsgs[i % chatHeight], hcolor, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0, DS_PROPORTIONAL );
;1604:		}
;1605:	}
;1606:}
;1607:#endif // MISSIONPACK
;1608:
;1609:
;1610:/*
;1611:===================
;1612:CG_DrawHoldableItem
;1613:===================
;1614:*/
;1615:#ifndef MISSIONPACK
;1616:static void CG_DrawHoldableItem( void ) { 
line 1619
;1617:	int		value;
;1618:
;1619:	value = cg.snap->ps.stats[STAT_HOLDABLE_ITEM];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ASGNI4
line 1620
;1620:	if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $214
line 1621
;1621:		CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1624
;1622:
;1623:#ifdef USE_VR
;1624:	if ( cg.vr_controller_type >= 2 ) {
ADDRGP4 cg+282972
INDIRI4
CNSTI4 2
LTI4 $216
line 1625
;1625:		int vrFlags = VR_get_client_vrFlags();
ADDRLP4 20
ADDRGP4 VR_get_client_vrFlags
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 1628
;1626:
;1627:		//If we are two handing the weapon or show in hand not enabled, move the item icon back to the HUD
;1628:		qboolean show_in_hand_enabled = trap_Cvar_VariableValue("vr_showItemInHand") != 0.0f;
ADDRGP4 $219
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 28
INDIRF4
CNSTF4 0
EQF4 $221
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $222
JUMPV
LABELV $221
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $222
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 1629
;1629:		qboolean two_handed_enabled = trap_Cvar_VariableValue("vr_twoHandedWeapons") != 0.0f;
ADDRGP4 $223
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 0
EQF4 $225
ADDRLP4 32
CNSTI4 1
ASGNI4
ADDRGP4 $226
JUMPV
LABELV $225
ADDRLP4 32
CNSTI4 0
ASGNI4
LABELV $226
ADDRLP4 12
ADDRLP4 32
INDIRI4
ASGNI4
line 1630
;1630:		qboolean weapon_stabilised = (vrFlags & EF_WEAPON_STABILISED);
ADDRLP4 16
ADDRLP4 4
INDIRI4
CNSTI4 128
BANDI4
ASGNI4
line 1632
;1631:
;1632:		if (!show_in_hand_enabled || (two_handed_enabled && weapon_stabilised)) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $229
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $217
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $217
LABELV $229
line 1633
;1633:			CG_DrawPic(640 - ICON_SIZE, (SCREEN_HEIGHT - ICON_SIZE) / 2, ICON_SIZE, ICON_SIZE, cg_items[value].icon);
CNSTF4 1142161408
ARGF4
CNSTF4 1129840640
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 28
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1634
;1634:		}
line 1635
;1635:	} else
ADDRGP4 $217
JUMPV
LABELV $216
line 1637
;1636:#endif
;1637:		CG_DrawPic( cgs.screenXmax + 1 - ICON_SIZE, (SCREEN_HEIGHT-ICON_SIZE)/2, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
ADDRGP4 cgs+31472
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
ARGF4
CNSTF4 1129840640
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 28
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
LABELV $217
line 1638
;1638:	}
LABELV $214
line 1639
;1639:}
LABELV $212
endproc CG_DrawHoldableItem 40 20
export CG_DrawCenterString
proc CG_DrawCenterString 1052 32
line 2008
;1640:#endif // MISSIONPACK
;1641:
;1642:#ifdef MISSIONPACK
;1643:/*
;1644:===================
;1645:CG_DrawPersistantPowerup
;1646:===================
;1647:*/
;1648:#if 0 // sos001208 - DEAD
;1649:static void CG_DrawPersistantPowerup( void ) { 
;1650:	int		value;
;1651:
;1652:	value = cg.snap->ps.stats[STAT_PERSISTANT_POWERUP];
;1653:	if ( value ) {
;1654:		CG_RegisterItemVisuals( value );
;1655:		CG_DrawPic( 640-ICON_SIZE, (SCREEN_HEIGHT-ICON_SIZE)/2 - ICON_SIZE, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
;1656:	}
;1657:}
;1658:#endif
;1659:#endif // MISSIONPACK
;1660:
;1661:
;1662:/*
;1663:===================
;1664:CG_DrawReward
;1665:===================
;1666:*/
;1667:#ifndef USE_NEOHUD
;1668:static void CG_DrawReward( void ) { 
;1669:	float	*color;
;1670:	int		i, count;
;1671:	float	x, y;
;1672:	char	buf[32];
;1673:
;1674:	if ( !cg_drawRewards.integer ) {
;1675:		return;
;1676:	}
;1677:
;1678:	color = CG_FadeColor( cg.rewardTime, REWARD_TIME );
;1679:	if ( !color ) {
;1680:		if (cg.rewardStack > 0) {
;1681:			for(i = 0; i < cg.rewardStack; i++) {
;1682:				cg.rewardSound[i] = cg.rewardSound[i+1];
;1683:				cg.rewardShader[i] = cg.rewardShader[i+1];
;1684:				cg.rewardCount[i] = cg.rewardCount[i+1];
;1685:			}
;1686:			cg.rewardTime = cg.time;
;1687:			cg.rewardStack--;
;1688:			color = CG_FadeColor( cg.rewardTime, REWARD_TIME );
;1689:			trap_S_StartLocalSound(cg.rewardSound[0], CHAN_ANNOUNCER);
;1690:		} else {
;1691:			return;
;1692:		}
;1693:	}
;1694:
;1695:	trap_R_SetColor( color );
;1696:
;1697:	/*
;1698:	count = cg.rewardCount[0]/10;				// number of big rewards to draw
;1699:
;1700:	if (count) {
;1701:		y = 4;
;1702:		x = 320 - count * ICON_SIZE;
;1703:		for ( i = 0 ; i < count ; i++ ) {
;1704:			CG_DrawPic( x, y, (ICON_SIZE*2)-4, (ICON_SIZE*2)-4, cg.rewardShader[0] );
;1705:			x += (ICON_SIZE*2);
;1706:		}
;1707:	}
;1708:
;1709:	count = cg.rewardCount[0] - count*10;		// number of small rewards to draw
;1710:	*/
;1711:
;1712:	if ( cg.rewardCount[0] >= 10 ) {
;1713:		y = 56; // FIXME: cgs.screenYmin + 56?
;1714:		x = 320 - ICON_SIZE/2;
;1715:		CG_DrawPic( x, y, ICON_SIZE-4, ICON_SIZE-4, cg.rewardShader[0] );
;1716:		Com_sprintf( buf, sizeof( buf ), "%d", cg.rewardCount[0] );
;1717:		CG_DrawString( 320, y + ICON_SIZE, buf, color, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER );
;1718:	}
;1719:	else {
;1720:
;1721:		count = cg.rewardCount[0];
;1722:
;1723:		y = 56; // FIXME: cgs.screenYmin + 56?
;1724:		x = 320 - count * ICON_SIZE/2;
;1725:		for ( i = 0 ; i < count ; i++ ) {
;1726:			CG_DrawPic( x, y, ICON_SIZE-4, ICON_SIZE-4, cg.rewardShader[0] );
;1727:			x += ICON_SIZE;
;1728:		}
;1729:	}
;1730:	trap_R_SetColor( NULL );
;1731:}
;1732:#endif
;1733:
;1734:
;1735:/*
;1736:===============================================================================
;1737:
;1738:LAGOMETER
;1739:
;1740:===============================================================================
;1741:*/
;1742:#ifndef USE_NEOHUD
;1743:#define	LAG_SAMPLES		128
;1744:
;1745:
;1746:typedef struct {
;1747:	int		frameSamples[LAG_SAMPLES];
;1748:	int		frameCount;
;1749:	int		snapshotFlags[LAG_SAMPLES];
;1750:	int		snapshotSamples[LAG_SAMPLES];
;1751:	int		snapshotCount;
;1752:} lagometer_t;
;1753:
;1754:lagometer_t		lagometer;
;1755:#endif
;1756:
;1757:/*
;1758:==============
;1759:CG_AddLagometerFrameInfo
;1760:
;1761:Adds the current interpolate / extrapolate bar for this frame
;1762:==============
;1763:*/
;1764:#ifndef USE_NEOHUD
;1765:void CG_AddLagometerFrameInfo( void ) {
;1766:	int			offset;
;1767:
;1768:	offset = cg.time - cg.latestSnapshotTime;
;1769:	lagometer.frameSamples[ lagometer.frameCount & ( LAG_SAMPLES - 1) ] = offset;
;1770:	lagometer.frameCount++;
;1771:}
;1772:#endif
;1773:
;1774:/*
;1775:==============
;1776:CG_AddLagometerSnapshotInfo
;1777:
;1778:Each time a snapshot is received, log its ping time and
;1779:the number of snapshots that were dropped before it.
;1780:
;1781:Pass NULL for a dropped packet.
;1782:==============
;1783:*/
;1784:#ifndef USE_NEOHUD
;1785:void CG_AddLagometerSnapshotInfo( snapshot_t *snap ) {
;1786:	// dropped packet
;1787:	if ( !snap ) {
;1788:		lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = -1;
;1789:		lagometer.snapshotCount++;
;1790:		return;
;1791:	}
;1792:
;1793:	// add this snapshot's info
;1794:	lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->ping;
;1795:	lagometer.snapshotFlags[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->snapFlags;
;1796:	lagometer.snapshotCount++;
;1797:}
;1798:#endif
;1799:
;1800:/*
;1801:==============
;1802:CG_DrawDisconnect
;1803:
;1804:Should we draw something differnet for long lag vs no packets?
;1805:==============
;1806:*/
;1807:#ifndef USE_NEOHUD
;1808:static void CG_DrawDisconnect( void ) {
;1809:	float		x, y;
;1810:	int			cmdNum;
;1811:	usercmd_t	cmd;
;1812:	const char	*s;
;1813:
;1814:	// draw the phone jack if we are completely past our buffers
;1815:	cmdNum = trap_GetCurrentCmdNumber() - CMD_BACKUP + 1;
;1816:	trap_GetUserCmd( cmdNum, &cmd );
;1817:	if ( cmd.serverTime <= cg.snap->ps.commandTime
;1818:		|| cmd.serverTime > cg.time ) {	// special check for map_restart // bk 0102165 - FIXME
;1819:		return;
;1820:	}
;1821:
;1822:	// also add text in center of screen
;1823:	s = "Connection Interrupted";
;1824:	CG_DrawString( 320, cgs.screenYmin + 100, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_PROPORTIONAL | DS_CENTER );
;1825:
;1826:	// blink the icon
;1827:	if ( ( cg.time >> 9 ) & 1 ) {
;1828:		return;
;1829:	}
;1830:
;1831:	x = cgs.screenXmax + 1 - 48;
;1832:	y = cgs.screenYmax + 1 - 48;
;1833:
;1834:	CG_DrawPic( x, y, 48, 48, trap_R_RegisterShader( "gfx/2d/net.tga" ) );
;1835:}
;1836:#endif
;1837:
;1838:#ifndef USE_NEOHUD
;1839:#define	MAX_LAGOMETER_PING	900
;1840:#define	MAX_LAGOMETER_RANGE	300
;1841:
;1842:/*
;1843:==============
;1844:CG_DrawLagometer
;1845:==============
;1846:*/
;1847:static void CG_DrawLagometer( void ) {
;1848:	int		a, x, y, i;
;1849:	float	v;
;1850:	float	ax, ay, aw, ah, mid, range;
;1851:	int		color;
;1852:	float	vscale;
;1853:
;1854:	if ( !cg_lagometer.integer || cgs.localServer ) {
;1855:		CG_DrawDisconnect();
;1856:		return;
;1857:	}
;1858:
;1859:	//
;1860:	// draw the graph
;1861:	//
;1862:#ifdef MISSIONPACK
;1863:	x = cgs.screenXmax + 1 - 48;
;1864:	y = cgs.screenYmax + 1 - 144;
;1865:#else
;1866:	x = cgs.screenXmax + 1 - 48;
;1867:	y = cgs.screenYmax + 1 - 48;
;1868:#endif
;1869:
;1870:	trap_R_SetColor( NULL );
;1871:	CG_DrawPic( x, y, 48, 48, cgs.media.lagometerShader );
;1872:
;1873:	ax = x;
;1874:	ay = y;
;1875:	aw = 48;
;1876:	ah = 48;
;1877:	CG_AdjustFrom640( &ax, &ay, &aw, &ah );
;1878:
;1879:	color = -1;
;1880:	range = ah / 3;
;1881:	mid = ay + range;
;1882:
;1883:	vscale = range / MAX_LAGOMETER_RANGE;
;1884:
;1885:	// draw the frame interpoalte / extrapolate graph
;1886:	for ( a = 0 ; a < aw ; a++ ) {
;1887:		i = ( lagometer.frameCount - 1 - a ) & (LAG_SAMPLES - 1);
;1888:		v = lagometer.frameSamples[i];
;1889:		v *= vscale;
;1890:		if ( v > 0 ) {
;1891:			if ( color != 1 ) {
;1892:				color = 1;
;1893:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
;1894:			}
;1895:			if ( v > range ) {
;1896:				v = range;
;1897:			}
;1898:			trap_R_DrawStretchPic ( ax + aw - a, mid - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
;1899:		} else if ( v < 0 ) {
;1900:			if ( color != 2 ) {
;1901:				color = 2;
;1902:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_BLUE)] );
;1903:			}
;1904:			v = -v;
;1905:			if ( v > range ) {
;1906:				v = range;
;1907:			}
;1908:			trap_R_DrawStretchPic( ax + aw - a, mid, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
;1909:		}
;1910:	}
;1911:
;1912:	// draw the snapshot latency / drop graph
;1913:	range = ah / 2;
;1914:	vscale = range / MAX_LAGOMETER_PING;
;1915:
;1916:	for ( a = 0 ; a < aw ; a++ ) {
;1917:		i = ( lagometer.snapshotCount - 1 - a ) & (LAG_SAMPLES - 1);
;1918:		v = lagometer.snapshotSamples[i];
;1919:		if ( v > 0 ) {
;1920:			if ( lagometer.snapshotFlags[i] & SNAPFLAG_RATE_DELAYED ) {
;1921:				if ( color != 5 ) {
;1922:					color = 5;	// YELLOW for rate delay
;1923:					trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
;1924:				}
;1925:			} else {
;1926:				if ( color != 3 ) {
;1927:					color = 3;
;1928:					trap_R_SetColor( g_color_table[ColorIndex(COLOR_GREEN)] );
;1929:				}
;1930:			}
;1931:			v = v * vscale;
;1932:			if ( v > range ) {
;1933:				v = range;
;1934:			}
;1935:			trap_R_DrawStretchPic( ax + aw - a, ay + ah - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
;1936:		} else if ( v < 0 ) {
;1937:			if ( color != 4 ) {
;1938:				color = 4;		// RED for dropped snapshots
;1939:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_RED)] );
;1940:			}
;1941:			trap_R_DrawStretchPic( ax + aw - a, ay + ah - range, 1, range, 0, 0, 0, 0, cgs.media.whiteShader );
;1942:		}
;1943:	}
;1944:
;1945:	trap_R_SetColor( NULL );
;1946:
;1947:	if ( cg_nopredict.integer || cgs.synchronousClients ) {
;1948:		CG_DrawString( cgs.screenXmax-1, y, "snc", colorWhite, 5, 10, 0, DS_PROPORTIONAL | DS_RIGHT );
;1949:	}
;1950:
;1951:	if ( !cg.demoPlayback ) {
;1952:		CG_DrawString( x+1, y, va( "%ims", cg.meanPing ), colorWhite, 5, 10, 0, DS_PROPORTIONAL );
;1953:	}
;1954:
;1955:	CG_DrawDisconnect();
;1956:}
;1957:#endif
;1958:
;1959:
;1960:
;1961:/*
;1962:===============================================================================
;1963:
;1964:CENTER PRINTING
;1965:
;1966:===============================================================================
;1967:*/
;1968:
;1969:
;1970:/*
;1971:==============
;1972:CG_CenterPrint
;1973:
;1974:Called for important messages that should stay in the center of the screen
;1975:for a few moments
;1976:==============
;1977:*/
;1978:#ifndef USE_NEOHUD
;1979:void CG_CenterPrint( const char *str, int y, int charWidth ) {
;1980:	char	*s;
;1981:
;1982:	Q_strncpyz( cg.centerPrint, str, sizeof(cg.centerPrint) );
;1983:
;1984:	cg.centerPrintTime = cg.time;
;1985:	cg.centerPrintY = y;
;1986:	cg.centerPrintCharWidth = charWidth;
;1987:
;1988:	// count the number of lines for centering
;1989:	cg.centerPrintLines = 1;
;1990:	s = cg.centerPrint;
;1991:	while( *s ) {
;1992:		if (*s == '\n')
;1993:			cg.centerPrintLines++;
;1994:		s++;
;1995:	}
;1996:}
;1997:#endif
;1998:
;1999:
;2000:/*
;2001:===================
;2002:CG_DrawCenterString
;2003:===================
;2004:*/
;2005:#ifndef USE_NEOHUD
;2006:static
;2007:#endif
;2008:void CG_DrawCenterString( void ) {
line 2017
;2009:	char	*start;
;2010:	int		l;
;2011:	int		y;
;2012:#ifdef MISSIONPACK // bk010221 - unused else
;2013:	int h;
;2014:#endif
;2015:	float	*fadeColor;
;2016:
;2017:	if ( !cg.centerPrintTime ) {
ADDRGP4 cg+244248
INDIRI4
CNSTI4 0
NEI4 $234
line 2018
;2018:		return;
ADDRGP4 $233
JUMPV
LABELV $234
line 2021
;2019:	}
;2020:#ifdef USE_NEOHUD
;2021:	fadeColor = CG_FadeColor( cg.centerPrintTime, 1000 * cg_centertime.value, cg.centerPrintColor);
ADDRGP4 cg+244248
INDIRI4
ARGI4
ADDRGP4 cg_centertime+8
INDIRF4
CNSTF4 1148846080
MULF4
CVFI4 4
ARGI4
ADDRGP4 cg+245288
ARGP4
ADDRLP4 16
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 2025
;2022:#else
;2023:	fadeColor = CG_FadeColor( cg.centerPrintTime, 1000 * cg_centertime.value );
;2024:#endif
;2025:	if ( !fadeColor ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $240
line 2026
;2026:		return;
ADDRGP4 $233
JUMPV
LABELV $240
line 2029
;2027:	}
;2028:
;2029:	trap_R_SetColor( fadeColor );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2031
;2030:
;2031:	start = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+244260
ASGNP4
line 2033
;2032:
;2033:	y = cg.centerPrintY - cg.centerPrintLines * BIGCHAR_HEIGHT / 2;
ADDRLP4 8
ADDRGP4 cg+244256
INDIRI4
ADDRGP4 cg+245284
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
ADDRGP4 $246
JUMPV
LABELV $245
line 2035
;2034:
;2035:	while ( 1 ) {
line 2038
;2036:		char linebuffer[1024];
;2037:
;2038:		for ( l = 0; l < 50; l++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $248
line 2039
;2039:			if ( !start[l] || start[l] == '\n' ) {
ADDRLP4 1044
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $254
ADDRLP4 1044
INDIRI4
CNSTI4 10
NEI4 $252
LABELV $254
line 2040
;2040:				break;
ADDRGP4 $250
JUMPV
LABELV $252
line 2042
;2041:			}
;2042:			linebuffer[l] = start[l];
ADDRLP4 4
INDIRI4
ADDRLP4 20
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 2043
;2043:		}
LABELV $249
line 2038
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 50
LTI4 $248
LABELV $250
line 2044
;2044:		linebuffer[l] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 20
ADDP4
CNSTI1 0
ASGNI1
line 2053
;2045:
;2046:#ifdef MISSIONPACK
;2047:		w = CG_Text_Width(linebuffer, 0.5, 0);
;2048:		h = CG_Text_Height(linebuffer, 0.5, 0);
;2049:		x = (SCREEN_WIDTH - w) / 2;
;2050:		CG_Text_Paint(x, y + h, 0.5, color, linebuffer, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2051:		y += h + 6;
;2052:#else
;2053:		CG_DrawString( 320, y, linebuffer, fadeColor, cg.centerPrintCharWidth, cg.centerPrintCharWidth * 1.5, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL );
CNSTF4 1134559232
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 cg+244252
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cg+244252
INDIRI4
CVIF4 4
CNSTF4 1069547520
MULF4
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2055
;2054:
;2055:		y += cg.centerPrintCharWidth * 1.5;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRGP4 cg+244252
INDIRI4
CVIF4 4
CNSTF4 1069547520
MULF4
ADDF4
CVFI4 4
ASGNI4
ADDRGP4 $259
JUMPV
LABELV $258
line 2057
;2056:#endif
;2057:		while ( *start && ( *start != '\n' ) ) {
line 2058
;2058:			start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2059
;2059:		}
LABELV $259
line 2057
ADDRLP4 1044
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $261
ADDRLP4 1044
INDIRI4
CNSTI4 10
NEI4 $258
LABELV $261
line 2060
;2060:		if ( !*start ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $262
line 2061
;2061:			break;
ADDRGP4 $247
JUMPV
LABELV $262
line 2063
;2062:		}
;2063:		start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2064
;2064:	}
LABELV $246
line 2035
ADDRGP4 $245
JUMPV
LABELV $247
line 2066
;2065:
;2066:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2067
;2067:}
LABELV $233
endproc CG_DrawCenterString 1052 32
export CG_DrawCrosshair3D
proc CG_DrawCrosshair3D 452 28
line 2150
;2068:
;2069:
;2070:
;2071:/*
;2072:================================================================================
;2073:
;2074:CROSSHAIR
;2075:
;2076:================================================================================
;2077:*/
;2078:
;2079:
;2080:/*
;2081:=================
;2082:CG_DrawCrosshair
;2083:=================
;2084:*/
;2085:#ifndef USE_NEOHUD
;2086:static void CG_DrawCrosshair( void ) {
;2087:	float		w, h;
;2088:	qhandle_t	hShader;
;2089:	float		f;
;2090:	float		x, y;
;2091:	int			ca;
;2092:
;2093:	if ( !cg_drawCrosshair.integer ) {
;2094:		return;
;2095:	}
;2096:
;2097:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
;2098:		return;
;2099:	}
;2100:
;2101:	if ( cg.renderingThirdPerson ) {
;2102:		return;
;2103:	}
;2104:
;2105:	// set color based on health
;2106:	if ( cg_crosshairHealth.integer ) {
;2107:		vec4_t		hcolor;
;2108:
;2109:		CG_ColorForHealth( hcolor );
;2110:		trap_R_SetColor( hcolor );
;2111:	} else {
;2112:		trap_R_SetColor( NULL );
;2113:	}
;2114:
;2115:	w = h = cg_crosshairSize.value;
;2116:
;2117:	// pulse the size of the crosshair when picking up items
;2118:	f = cg.time - cg.itemPickupBlendTime;
;2119:	if ( f > 0 && f < ITEM_BLOB_TIME ) {
;2120:		f /= ITEM_BLOB_TIME;
;2121:		w *= ( 1 + f );
;2122:		h *= ( 1 + f );
;2123:	}
;2124:
;2125:	x = cg_crosshairX.integer;
;2126:	y = cg_crosshairY.integer;
;2127:
;2128:	CG_AdjustFrom640( &x, &y, &w, &h );
;2129:
;2130:	ca = cg_drawCrosshair.integer;
;2131:	if ( ca < 0 ) {
;2132:		ca = 0;
;2133:	}
;2134:
;2135:	hShader = cgs.media.crosshairShader[ ca % NUM_CROSSHAIRS ];
;2136:
;2137:	trap_R_DrawStretchPic( x + cg.refdef.x + 0.5 * (cg.refdef.width - w) - cgs.screenXBias,
;2138:		y + cg.refdef.y + 0.5 * (cg.refdef.height - h) - cgs.screenYBias,
;2139:		w, h, 0, 0, 1, 1, hShader );
;2140:}
;2141:#endif
;2142:
;2143:
;2144:/*
;2145:=================
;2146:CG_DrawCrosshair3D
;2147:=================
;2148:*/
;2149:void CG_DrawCrosshair3D(centity_t *cent)
;2150:{
line 2161
;2151:	float		w;
;2152:	qhandle_t	hShader;
;2153:	float		f;
;2154:	int			ca;
;2155:	trace_t 	trace;
;2156:	vec3_t 		endpos;
;2157:	float 		stereoSep, zProj, maxdist, xmax;
;2158:	char 		rendererinfos[128];
;2159:	refEntity_t ent;
;2160:
;2161:	if (!cg_drawCrosshair.integer) {
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $265
line 2162
;2162:		return;
ADDRGP4 $264
JUMPV
LABELV $265
line 2165
;2163:	}
;2164:
;2165:	if (cg.snap->ps.pm_type == PM_INTERMISSION) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $268
line 2166
;2166:		return;
ADDRGP4 $264
JUMPV
LABELV $268
line 2169
;2167:	}
;2168:
;2169:	if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $271
line 2170
;2170:		return;
ADDRGP4 $264
JUMPV
LABELV $271
line 2173
;2171:	}
;2172:
;2173:	if (cent->currentState.eFlags & EF_TALK) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $274
line 2174
;2174:		return;
ADDRGP4 $264
JUMPV
LABELV $274
line 2177
;2175:	}
;2176:
;2177:	w = cg_crosshairSize.value;
ADDRLP4 356
ADDRGP4 cg_crosshairSize+8
INDIRF4
ASGNF4
line 2180
;2178:
;2179:	// pulse the size of the crosshair when picking up items
;2180:	f = cg.time - cg.itemPickupBlendTime;
ADDRLP4 276
ADDRGP4 cg+234764
INDIRI4
ADDRGP4 cg+245632
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 2181
;2181:	if (f > 0 && f < ITEM_BLOB_TIME) {
ADDRLP4 276
INDIRF4
CNSTF4 0
LEF4 $279
ADDRLP4 276
INDIRF4
CNSTF4 1128792064
GEF4 $279
line 2182
;2182:		f /= ITEM_BLOB_TIME;
ADDRLP4 276
ADDRLP4 276
INDIRF4
CNSTF4 1000593162
MULF4
ASGNF4
line 2183
;2183:		w *= (1 + f);
ADDRLP4 356
ADDRLP4 356
INDIRF4
ADDRLP4 276
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 2184
;2184:	}
LABELV $279
line 2186
;2185:
;2186:	trap_Cvar_VariableStringBuffer("cg_drawCrosshair", rendererinfos, sizeof(rendererinfos));
ADDRGP4 $281
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2187
;2187:	ca = atof(rendererinfos);
ADDRLP4 0
ARGP4
ADDRLP4 372
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 292
ADDRLP4 372
INDIRF4
CVFI4 4
ASGNI4
line 2189
;2188:	//ca = cg_drawCrosshair.integer; // fixme this doesn't works
;2189:	if (ca < 0) {
ADDRLP4 292
INDIRI4
CNSTI4 0
GEI4 $282
line 2190
;2190:		ca = 0;
ADDRLP4 292
CNSTI4 0
ASGNI4
line 2191
;2191:	}
LABELV $282
line 2192
;2192:	hShader = cgs.media.crosshairShader[ca % NUM_CROSSHAIRS];
ADDRLP4 360
ADDRLP4 292
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+150560+224
ADDP4
INDIRI4
ASGNI4
line 2199
;2193:
;2194:	// Use a different method rendering the crosshair so players don't see two of them when
;2195:	// focusing their eyes at distant objects with high stereo separation
;2196:	// We are going to trace to the next shootable object and place the crosshair in front of it.
;2197:
;2198:	// first get all the important renderer information
;2199:	trap_Cvar_VariableStringBuffer("r_zProj", rendererinfos, sizeof(rendererinfos));
ADDRGP4 $286
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2200
;2200:	zProj = atof(rendererinfos); // r_zproj->value is not accessible
ADDRLP4 0
ARGP4
ADDRLP4 376
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 268
ADDRLP4 376
INDIRF4
ASGNF4
line 2202
;2201:
;2202:	trap_Cvar_VariableStringBuffer("r_stereoSeparation", rendererinfos, sizeof(rendererinfos));
ADDRGP4 $287
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2203
;2203:	stereoSep = zProj / atof(rendererinfos);
ADDRLP4 0
ARGP4
ADDRLP4 380
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 364
ADDRLP4 268
INDIRF4
ADDRLP4 380
INDIRF4
DIVF4
ASGNF4
line 2205
;2204:
;2205:	xmax = zProj * tan(cg.refdef.fov_x * M_PI / 360.0f);
ADDRGP4 cg+236804+16
INDIRF4
CNSTF4 1007614517
MULF4
ARGF4
ADDRLP4 384
ADDRGP4 tan
CALLF4
ASGNF4
ADDRLP4 352
ADDRLP4 268
INDIRF4
ADDRLP4 384
INDIRF4
MULF4
ASGNF4
line 2209
;2206:
;2207:	// let the trace run through until a change in stereo separation of the crosshair becomes less than one pixel.
;2208:#ifdef USE_VR
;2209:	maxdist = cgs.glconfig.vidWidth * stereoSep * zProj / (2 * xmax);
ADDRLP4 272
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
ADDRLP4 364
INDIRF4
MULF4
ADDRLP4 268
INDIRF4
MULF4
ADDRLP4 352
INDIRF4
CNSTF4 1073741824
MULF4
DIVF4
ASGNF4
line 2212
;2210:	//maxdist = (cgs.glconfig.vidWidth * stereoSep * zProj / (2 * xmax)) * 1.5f; // in ioq3Quest
;2211:
;2212:	if ( cg.vr_controller_type == 1 ) {
ADDRGP4 cg+282972
INDIRI4
CNSTI4 1
NEI4 $292
line 2216
;2213:		//=======================================
;2214:		// VR 3 Dof, origin is the weapon muzle
;2215:		//=======================================
;2216:		VectorMA( client_weapon.muzzle, maxdist, client_weapon.vr_controller_3axis_smooth, endpos );
ADDRLP4 280
ADDRGP4 client_weapon+36
INDIRF4
ADDRGP4 client_weapon+48
INDIRF4
ADDRLP4 272
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 280+4
ADDRGP4 client_weapon+36+4
INDIRF4
ADDRGP4 client_weapon+48+4
INDIRF4
ADDRLP4 272
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 280+8
ADDRGP4 client_weapon+36+8
INDIRF4
ADDRGP4 client_weapon+48+8
INDIRF4
ADDRLP4 272
INDIRF4
MULF4
ADDF4
ASGNF4
line 2218
;2217:		// trace a line from weapon muzzle origin to endpos
;2218:		CG_Trace( &trace, client_weapon.muzzle, NULL, NULL, endpos, 0, MASK_SHOT );
ADDRLP4 296
ARGP4
ADDRGP4 client_weapon+36
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 280
ARGP4
CNSTI4 0
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 2219
;2219:	}
ADDRGP4 $293
JUMPV
LABELV $292
line 2220
;2220:	else if ( cg.vr_controller_type >= 2 ) {
ADDRGP4 cg+282972
INDIRI4
CNSTI4 2
LTI4 $308
line 2227
;2221:		//=======================================
;2222:		// VR 6 Dof, origin is the weapon muzle
;2223:		//=======================================
;2224:		vec3_t viewaxis[3];
;2225:		vec3_t weaponangles;
;2226:		vec3_t origin;
;2227:		CG_CalculateWeaponPosition_VR_6Dof( origin, weaponangles );
ADDRLP4 388
ARGP4
ADDRLP4 436
ARGP4
ADDRGP4 CG_CalculateWeaponPosition_VR_6Dof
CALLV
pop
line 2228
;2228:		AnglesToAxis( weaponangles, viewaxis );
ADDRLP4 436
ARGP4
ADDRLP4 400
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2229
;2229:		VectorMA( origin, maxdist, viewaxis[0], endpos );
ADDRLP4 280
ADDRLP4 388
INDIRF4
ADDRLP4 400
INDIRF4
ADDRLP4 272
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 280+4
ADDRLP4 388+4
INDIRF4
ADDRLP4 400+4
INDIRF4
ADDRLP4 272
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 280+8
ADDRLP4 388+8
INDIRF4
ADDRLP4 400+8
INDIRF4
ADDRLP4 272
INDIRF4
MULF4
ADDF4
ASGNF4
line 2230
;2230:		CG_Trace( &trace, origin, NULL, NULL, endpos, 0, MASK_SHOT );
ADDRLP4 296
ARGP4
ADDRLP4 388
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 280
ARGP4
CNSTI4 0
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 2231
;2231:	}
ADDRGP4 $309
JUMPV
LABELV $308
line 2234
;2232:	else
;2233:#endif // USE_VR
;2234:	{
line 2238
;2235:		//=======================================
;2236:		// not VR, origin is the player belly
;2237:		//=======================================
;2238:		VectorMA( cg.refdef.vieworg, maxdist, cg.refdef.viewaxis[0], endpos );
ADDRLP4 280
ADDRGP4 cg+236804+24
INDIRF4
ADDRGP4 cg+236804+36
INDIRF4
ADDRLP4 272
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 280+4
ADDRGP4 cg+236804+24+4
INDIRF4
ADDRGP4 cg+236804+36+4
INDIRF4
ADDRLP4 272
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 280+8
ADDRGP4 cg+236804+24+8
INDIRF4
ADDRGP4 cg+236804+36+8
INDIRF4
ADDRLP4 272
INDIRF4
MULF4
ADDF4
ASGNF4
line 2239
;2239:		CG_Trace( &trace, cg.refdef.vieworg, NULL, NULL, endpos, 0, MASK_SHOT );
ADDRLP4 296
ARGP4
ADDRGP4 cg+236804+24
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 280
ARGP4
CNSTI4 0
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 2240
;2240:	}
LABELV $309
LABELV $293
line 2242
;2241:
;2242:	memset(&ent, 0, sizeof(ent));
ADDRLP4 128
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2247
;2243:
;2244:	//=======================================
;2245:	// create and add crosshair entity
;2246:	//=======================================
;2247:	ent.reType = RT_SPRITE;
ADDRLP4 128
CNSTI4 2
ASGNI4
line 2248
;2248:	VectorCopy(trace.endpos, ent.origin);
ADDRLP4 128+68
ADDRLP4 296+12
INDIRB
ASGNB 12
line 2249
;2249:	ent.customShader = hShader;
ADDRLP4 128+112
ADDRLP4 360
INDIRI4
ASGNI4
line 2251
;2250:	//ent.customShader = cgs.media.tracerShader; 	// red point;
;2251:	ent.renderfx = RF_DEPTHHACK | RF_CROSSHAIR;
ADDRLP4 128+4
CNSTI4 24
ASGNI4
line 2272
;2252:
;2253:	// set color based on health
;2254:	/*if ( cg_crosshairHealth.integer ) {
;2255:		CG_ColorForHealth( color );
;2256:	} else {
;2257:		// TODO color from the cvar
;2258:		color[0]=0.0;//cg_crosshairColorRed.value;
;2259:		color[1]=1.0;//cg_crosshairColorGreen.value;
;2260:		color[2]=0.0;//cg_crosshairColorBlue.value;
;2261:		color[3]=1.0f;
;2262:	}*/
;2263:
;2264:	// Set appropriate color, scale it because level lighting makes all 2D entities dimmer
;2265:	//ent.shaderRGBA[0] = color[0] * 1000.0f;
;2266:	//ent.shaderRGBA[1] = color[1] * 1000.0f;
;2267:	//ent.shaderRGBA[2] = color[2] * 1000.0f;
;2268:	//ent.shaderRGBA[3] = 255;//1000.0f;
;2269:
;2270:	// scale the crosshair so it appears the same size for all distances
;2271:	// fixme, doesn't works as expected
;2272:	ent.radius = w / cgs.glconfig.vidWidth * xmax * trace.fraction * maxdist / zProj;
ADDRLP4 128+132
ADDRLP4 356
INDIRF4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
DIVF4
ADDRLP4 352
INDIRF4
MULF4
ADDRLP4 296+8
INDIRF4
MULF4
ADDRLP4 272
INDIRF4
MULF4
ADDRLP4 268
INDIRF4
DIVF4
ASGNF4
line 2274
;2273:
;2274:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 128
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2275
;2275:}
LABELV $264
endproc CG_DrawCrosshair3D 452 28
export CG_ScanForCrosshairEntity
proc CG_ScanForCrosshairEntity 92 28
line 2286
;2276:
;2277:
;2278:/*
;2279:=================
;2280:CG_ScanForCrosshairEntity
;2281:=================
;2282:*/
;2283:#ifndef USE_NEOHUD
;2284:static
;2285:#endif
;2286:void CG_ScanForCrosshairEntity( void ) {
line 2291
;2287:	trace_t		trace;
;2288:	vec3_t		start, end;
;2289:	int			content;
;2290:
;2291:	VectorCopy( cg.refdef.vieworg, start );
ADDRLP4 56
ADDRGP4 cg+236804+24
INDIRB
ASGNB 12
line 2292
;2292:	VectorMA( start, 131072, cg.refdef.viewaxis[0], end );
ADDRLP4 68
ADDRLP4 56
INDIRF4
ADDRGP4 cg+236804+36
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 56+4
INDIRF4
ADDRGP4 cg+236804+36+4
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 68+8
ADDRLP4 56+8
INDIRF4
ADDRGP4 cg+236804+36+8
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
line 2294
;2293:
;2294:	CG_Trace( &trace, start, vec3_origin, vec3_origin, end, 
ADDRLP4 0
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 84
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 2296
;2295:		cg.snap->ps.clientNum, CONTENTS_SOLID|CONTENTS_BODY );
;2296:	if ( trace.entityNum >= MAX_CLIENTS ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 64
LTI4 $361
line 2297
;2297:		return;
ADDRGP4 $345
JUMPV
LABELV $361
line 2301
;2298:	}
;2299:
;2300:	// if the player is in fog, don't show it
;2301:	content = CG_PointContents( trace.endpos, 0 );
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 88
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 88
INDIRI4
ASGNI4
line 2302
;2302:	if ( content & CONTENTS_FOG ) {
ADDRLP4 80
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $365
line 2303
;2303:		return;
ADDRGP4 $345
JUMPV
LABELV $365
line 2307
;2304:	}
;2305:
;2306:	// if the player is invisible, don't show it
;2307:	if ( cg_entities[ trace.entityNum ].currentState.powerups & ( 1 << PW_INVIS ) ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 1236
MULI4
ADDRGP4 cg_entities+188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $367
line 2308
;2308:		return;
ADDRGP4 $345
JUMPV
LABELV $367
line 2312
;2309:	}
;2310:
;2311:	// update the fade timer
;2312:	cg.crosshairClientNum = trace.entityNum;
ADDRGP4 cg+245312
ADDRLP4 0+52
INDIRI4
ASGNI4
line 2313
;2313:	cg.crosshairClientTime = cg.time;
ADDRGP4 cg+245316
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 2314
;2314:}
LABELV $345
endproc CG_ScanForCrosshairEntity 92 28
export CG_DrawScoreboard
proc CG_DrawScoreboard 4 0
line 2455
;2315:
;2316:
;2317:/*
;2318:=====================
;2319:CG_DrawCrosshairNames
;2320:=====================
;2321:*/
;2322:#ifndef USE_NEOHUD
;2323:static void CG_DrawCrosshairNames( void ) {
;2324:	float		*color;
;2325:	const char	*name;
;2326:
;2327:	if ( !cg_drawCrosshair.integer ) {
;2328:		return;
;2329:	}
;2330:	if ( !cg_drawCrosshairNames.integer ) {
;2331:		return;
;2332:	}
;2333:	if ( cg.renderingThirdPerson ) {
;2334:		return;
;2335:	}
;2336:
;2337:	// scan the known entities to see if the crosshair is sighted on one
;2338:	CG_ScanForCrosshairEntity();
;2339:
;2340:	// draw the name of the player being looked at
;2341:	color = CG_FadeColor( cg.crosshairClientTime, 1000 );
;2342:	if ( !color ) {
;2343:		trap_R_SetColor( NULL );
;2344:		return;
;2345:	}
;2346:
;2347:	name = cgs.clientinfo[ cg.crosshairClientNum ].name;
;2348:#ifdef MISSIONPACK
;2349:	color[3] *= 0.5f;
;2350:	w = CG_Text_Width(name, 0.3f, 0);
;2351:	CG_Text_Paint( 320 - w / 2, 190, 0.3f, color, name, 0, 0, ITEM_TEXTSTYLE_SHADOWED);
;2352:#else
;2353:	color[3] *= 0.5f;
;2354:	CG_DrawString( 320, 174, name, color, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_CENTER | DS_PROPORTIONAL );
;2355:#endif
;2356:	trap_R_SetColor( NULL );
;2357:}
;2358:#endif
;2359:
;2360://==============================================================================
;2361:
;2362:/*
;2363:=================
;2364:CG_DrawSpectator
;2365:=================
;2366:*/
;2367:#ifndef USE_NEOHUD
;2368:static void CG_DrawSpectator( void ) {
;2369:	CG_DrawString( 320, cgs.screenYmax - 40 + 1, "SPECTATOR", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL );
;2370:	if ( cgs.gametype == GT_TOURNAMENT ) {
;2371:		CG_DrawString( 320, cgs.screenYmax - 20 + 1, "waiting to play", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL );
;2372:	} else if ( cgs.gametype >= GT_TEAM ) {
;2373:		CG_DrawString( 320, cgs.screenYmax - 20 + 1, "press ESC and use the JOIN menu to play", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL );
;2374:	}
;2375:}
;2376:#endif
;2377:
;2378:/*
;2379:=================
;2380:CG_DrawVote
;2381:=================
;2382:*/
;2383:#ifndef USE_NEOHUD
;2384:static void CG_DrawVote( void ) {
;2385:	char	*s;
;2386:	int		sec;
;2387:
;2388:	if ( !cgs.voteTime ) {
;2389:		return;
;2390:	}
;2391:
;2392:	// play a talk beep whenever it is modified
;2393:	if ( cgs.voteModified ) {
;2394:		cgs.voteModified = qfalse;
;2395:		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
;2396:	}
;2397:
;2398:	sec = ( VOTE_TIME - ( cg.time - cgs.voteTime ) ) / 1000;
;2399:	if ( sec < 0 ) {
;2400:		sec = 0;
;2401:	}
;2402:#ifdef MISSIONPACK
;2403:	s = va("VOTE(%i):%s yes:%i no:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo);
;2404:	CG_DrawString( cgs.screenXmin - 0, 58, s, colorWhite, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DF_PROPORTIONAL );
;2405:	s = "or press ESC then click Vote";
;2406:	CG_DrawString( cgs.screenXmin - 0, 58 + SMALLCHAR_HEIGHT + 2, s, colorWhite, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DF_PROPORTIONAL );
;2407:#else
;2408:	s = va( "VOTE(%i):%s yes:%i no:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo );
;2409:	CG_DrawString( cgs.screenXmin - 0, 58, s, colorWhite, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DS_PROPORTIONAL ); // DS_SHADOW?
;2410:#endif
;2411:}
;2412:#endif
;2413:
;2414:/*
;2415:=================
;2416:CG_DrawTeamVote
;2417:=================
;2418:*/
;2419:#ifndef USE_NEOHUD
;2420:static void CG_DrawTeamVote(void) {
;2421:	char	*s;
;2422:	int		sec, cs_offset;
;2423:
;2424:	if ( cgs.clientinfo[ cg.clientNum ].team == TEAM_RED )
;2425:		cs_offset = 0;
;2426:	else if ( cgs.clientinfo[ cg.clientNum ].team == TEAM_BLUE )
;2427:		cs_offset = 1;
;2428:	else
;2429:		return;
;2430:
;2431:	if ( !cgs.teamVoteTime[cs_offset] ) {
;2432:		return;
;2433:	}
;2434:
;2435:	// play a talk beep whenever it is modified
;2436:	if ( cgs.teamVoteModified[cs_offset] ) {
;2437:		cgs.teamVoteModified[cs_offset] = qfalse;
;2438:		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
;2439:	}
;2440:
;2441:	sec = ( VOTE_TIME - ( cg.time - cgs.teamVoteTime[cs_offset] ) ) / 1000;
;2442:	if ( sec < 0 ) {
;2443:		sec = 0;
;2444:	}
;2445:	s = va("TEAMVOTE(%i):%s yes:%i no:%i", sec, cgs.teamVoteString[cs_offset],
;2446:							cgs.teamVoteYes[cs_offset], cgs.teamVoteNo[cs_offset] );
;2447:
;2448:	CG_DrawString( cgs.screenXmin - 0, 90, s, colorWhite, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DS_PROPORTIONAL ); // DF_SHADOW?
;2449:}
;2450:#endif
;2451:
;2452:#ifndef USE_NEOHUD
;2453:static
;2454:#endif
;2455:qboolean CG_DrawScoreboard( void ) {
line 2520
;2456:#ifdef MISSIONPACK
;2457:	static qboolean firstTime = qtrue;
;2458:	float fade, *fadeColor;
;2459:
;2460:	if (menuScoreboard) {
;2461:		menuScoreboard->window.flags &= ~WINDOW_FORCED;
;2462:	}
;2463:	if (cg_paused.integer) {
;2464:		cg.deferredPlayerLoading = 0;
;2465:		firstTime = qtrue;
;2466:		return qfalse;
;2467:	}
;2468:
;2469:	// should never happen in Team Arena
;2470:	if (cgs.gametype == GT_SINGLE_PLAYER && cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
;2471:		cg.deferredPlayerLoading = 0;
;2472:		firstTime = qtrue;
;2473:		return qfalse;
;2474:	}
;2475:
;2476:	// don't draw scoreboard during death while warmup up
;2477:	if ( cg.warmup && !cg.showScores ) {
;2478:		return qfalse;
;2479:	}
;2480:
;2481:	if ( cg.showScores || cg.predictedPlayerState.pm_type == PM_DEAD || cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
;2482:		fade = 1.0;
;2483:		fadeColor = colorWhite;
;2484:	} else {
;2485:		fadeColor = CG_FadeColor( cg.scoreFadeTime, FADE_TIME );
;2486:		if ( !fadeColor ) {
;2487:			// next time scoreboard comes up, don't print killer
;2488:			cg.deferredPlayerLoading = 0;
;2489:			cg.killerName[0] = 0;
;2490:			firstTime = qtrue;
;2491:			return qfalse;
;2492:		}
;2493:		fade = *fadeColor;
;2494:	}
;2495:
;2496:
;2497:	if (menuScoreboard == NULL) {
;2498:		if ( cgs.gametype >= GT_TEAM ) {
;2499:			menuScoreboard = Menus_FindByName("teamscore_menu");
;2500:		} else {
;2501:			menuScoreboard = Menus_FindByName("score_menu");
;2502:		}
;2503:	}
;2504:
;2505:	if (menuScoreboard) {
;2506:		if (firstTime) {
;2507:			CG_SetScoreSelection(menuScoreboard);
;2508:			firstTime = qfalse;
;2509:		}
;2510:		Menu_Paint(menuScoreboard, qtrue);
;2511:	}
;2512:
;2513:	// load any models that have been deferred
;2514:	if ( ++cg.deferredPlayerLoading > 10 ) {
;2515:		CG_LoadDeferredPlayers();
;2516:	}
;2517:
;2518:	return qtrue;
;2519:#else
;2520:	return CG_DrawOldScoreboard();
ADDRLP4 0
ADDRGP4 CG_DrawOldScoreboard
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $375
endproc CG_DrawScoreboard 4 0
export CG_DrawIntermission
proc CG_DrawIntermission 0 0
line 2533
;2521:#endif
;2522:}
;2523:
;2524:
;2525:/*
;2526:=================
;2527:CG_DrawIntermission
;2528:=================
;2529:*/
;2530:#ifndef USE_NEOHUD
;2531:static
;2532:#endif
;2533:void CG_DrawIntermission( void ) {
line 2540
;2534:#ifdef MISSIONPACK
;2535:	//if (cg_singlePlayer.integer) {
;2536:	//	CG_DrawCenterString();
;2537:	//	return;
;2538:	//}
;2539:#else
;2540:	if ( cgs.gametype == GT_SINGLE_PLAYER ) {
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 2
NEI4 $377
line 2541
;2541:		CG_DrawCenterString();
ADDRGP4 CG_DrawCenterString
CALLV
pop
line 2542
;2542:		return;
ADDRGP4 $376
JUMPV
LABELV $377
line 2545
;2543:	}
;2544:#endif
;2545:	cg.scoreFadeTime = cg.time;
ADDRGP4 cg+243124
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 2547
;2546:#ifdef USE_NEOHUD
;2547:	CG_DrawScoreboard();
ADDRGP4 CG_DrawScoreboard
CALLI4
pop
line 2551
;2548:#else
;2549:	cg.scoreBoardShowing = CG_DrawScoreboard();
;2550:#endif
;2551:}
LABELV $376
endproc CG_DrawIntermission 0 0
proc CG_DrawScreen2D 0 0
line 2843
;2552:
;2553:
;2554:/*
;2555:=================
;2556:CG_DrawFollow
;2557:=================
;2558:*/
;2559:#ifndef USE_NEOHUD
;2560:static qboolean CG_DrawFollow( void ) {
;2561:
;2562:	const char	*name;
;2563:
;2564:	if ( !(cg.snap->ps.pm_flags & PMF_FOLLOW) ) {
;2565:		return qfalse;
;2566:	}
;2567:
;2568:	CG_DrawString( 320, cgs.screenYmin + 24, "following", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_CENTER | DS_SHADOW );
;2569:
;2570:	name = cgs.clientinfo[ cg.snap->ps.clientNum ].name;
;2571:
;2572:	CG_DrawString( 320, cgs.screenYmin + 40, name, colorWhite, GIANT_WIDTH, GIANT_HEIGHT, 0, DS_FORCE_COLOR | DS_SHADOW | DS_CENTER );
;2573:
;2574:	return qtrue;
;2575:}
;2576:#endif
;2577:
;2578:
;2579:/*
;2580:=================
;2581:CG_DrawAmmoWarning
;2582:=================
;2583:*/
;2584:#ifndef USE_NEOHUD
;2585:static void CG_DrawAmmoWarning( void ) {
;2586:	const char	*s;
;2587:
;2588:	if ( cg_drawAmmoWarning.integer == 0 ) {
;2589:		return;
;2590:	}
;2591:
;2592:	if ( !cg.lowAmmoWarning ) {
;2593:		return;
;2594:	}
;2595:
;2596:	if ( cg.lowAmmoWarning == 2 ) {
;2597:		s = "OUT OF AMMO";
;2598:	} else {
;2599:		s = "LOW AMMO WARNING";
;2600:	}
;2601:
;2602:	CG_DrawString( 320, 64, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_PROPORTIONAL | DS_CENTER | DS_SHADOW );
;2603:}
;2604:#endif
;2605:
;2606:
;2607:#ifdef MISSIONPACK
;2608:/*
;2609:=================
;2610:CG_DrawProxWarning
;2611:=================
;2612:*/
;2613:static void CG_DrawProxWarning( void ) {
;2614:	char s [32];
;2615:	static int proxTime;
;2616:	static int proxCounter;
;2617:	static int proxTick;
;2618:
;2619:	if( !(cg.snap->ps.eFlags & EF_TICKING ) ) {
;2620:		proxTime = 0;
;2621:		return;
;2622:	}
;2623:
;2624:	if ( proxTime == 0 ) {
;2625:		proxTime = cg.time + 5000;
;2626:		proxCounter = 5;
;2627:		proxTick = 0;
;2628:	}
;2629:
;2630:	if (cg.time > proxTime) {
;2631:		proxTick = proxCounter--;
;2632:		proxTime = cg.time + 1000;
;2633:	}
;2634:
;2635:	if (proxTick != 0) {
;2636:		Com_sprintf( s, sizeof(s), "INTERNAL COMBUSTION IN: %i", proxTick );
;2637:	} else {
;2638:		Com_sprintf( s, sizeof(s), "YOU HAVE BEEN MINED" );
;2639:	}
;2640:
;2641:	CG_DrawString( 320, 64 + 64 + BIGCHAR_HEIGHT, s, g_color_table[ColorIndex(COLOR_RED)], BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DF_SHADOW | DF_FORCE_COLOR | DF_CENTER );
;2642:#endif
;2643:
;2644:
;2645:/*
;2646:=================
;2647:CG_DrawWarmup
;2648:=================
;2649:*/
;2650:#ifndef USE_NEOHUD
;2651:static void CG_DrawWarmup( void ) {
;2652:	int			w;
;2653:	int			i;
;2654:#ifdef MISSIONPACK
;2655:	float scale;
;2656:#endif
;2657:	clientInfo_t *ci1, *ci2;
;2658:	int			cw;
;2659:	const char	*s;
;2660:
;2661:	if ( !cg.warmup ) {
;2662:		return;
;2663:	}
;2664:
;2665:	if ( cg.warmup < 0 ) {
;2666:		CG_DrawString( 320,24, "Waiting for players", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0,
;2667:			DS_PROPORTIONAL | DS_CENTER | DS_SHADOW );
;2668:		return;
;2669:	}
;2670:
;2671:	if ( cgs.gametype == GT_TOURNAMENT ) {
;2672:		// find the two active players
;2673:		ci1 = NULL;
;2674:		ci2 = NULL;
;2675:		for ( i = 0 ; i < cgs.maxclients ; i++ ) {
;2676:			if ( cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_FREE ) {
;2677:				if ( !ci1 ) {
;2678:					ci1 = &cgs.clientinfo[i];
;2679:				} else {
;2680:					ci2 = &cgs.clientinfo[i];
;2681:				}
;2682:			}
;2683:		}
;2684:
;2685:		if ( ci1 && ci2 ) {
;2686:			s = va( "%s vs %s", ci1->name, ci2->name );
;2687:#ifdef MISSIONPACK
;2688:			w = CG_Text_Width(s, 0.6f, 0);
;2689:			CG_Text_Paint(320 - w / 2, 60, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2690:#else
;2691:			w = CG_DrawStrlen( s );
;2692:			if ( w > 640 / GIANT_WIDTH ) {
;2693:				cw = 640 / w;
;2694:			} else {
;2695:				cw = GIANT_WIDTH;
;2696:			}
;2697:			CG_DrawString( 320, 20, s, colorWhite, cw, cw*1.5, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL );
;2698:#endif
;2699:		}
;2700:	} else {
;2701:		if ( cgs.gametype == GT_FFA ) {
;2702:			s = "Free For All";
;2703:		} else if ( cgs.gametype == GT_TEAM ) {
;2704:			s = "Team Deathmatch";
;2705:		} else if ( cgs.gametype == GT_CTF ) {
;2706:			s = "Capture the Flag";
;2707:#ifdef MISSIONPACK
;2708:		} else if ( cgs.gametype == GT_1FCTF ) {
;2709:			s = "One Flag CTF";
;2710:		} else if ( cgs.gametype == GT_OBELISK ) {
;2711:			s = "Overload";
;2712:		} else if ( cgs.gametype == GT_HARVESTER ) {
;2713:			s = "Harvester";
;2714:#endif
;2715:		} else {
;2716:			s = "";
;2717:		}
;2718:#ifdef MISSIONPACK
;2719:		w = CG_Text_Width(s, 0.6f, 0);
;2720:		CG_Text_Paint(320 - w / 2, 90, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2721:#else
;2722:		w = CG_DrawStrlen( s );
;2723:		if ( w > 640 / GIANT_WIDTH ) {
;2724:			cw = 640 / w;
;2725:		} else {
;2726:			cw = GIANT_WIDTH;
;2727:		}
;2728:		CG_DrawString( 320, 25, s, colorWhite, cw, cw*1.1f, 0, DS_PROPORTIONAL | DS_SHADOW | DS_CENTER );
;2729:#endif
;2730:	}
;2731:
;2732:	if ( cg.warmupCount <= 0 )
;2733:		return;
;2734:
;2735:	s = va( "Starts in: %i", cg.warmupCount );
;2736:
;2737:	switch ( cg.warmupCount ) {
;2738:	case 1:
;2739:		cw = 28;
;2740:#ifdef MISSIONPACK
;2741:		scale = 0.54f;
;2742:#endif
;2743:		break;
;2744:	case 2:
;2745:		cw = 24;
;2746:#ifdef MISSIONPACK
;2747:		scale = 0.51f;
;2748:#endif
;2749:		break;
;2750:	case 3:
;2751:		cw = 20;
;2752:#ifdef MISSIONPACK
;2753:		scale = 0.48f;
;2754:#endif
;2755:		break;
;2756:	default:
;2757:		cw = 16;
;2758:#ifdef MISSIONPACK
;2759:		scale = 0.45f;
;2760:#endif
;2761:		break;
;2762:	}
;2763:
;2764:#ifdef MISSIONPACK
;2765:	w = CG_Text_Width(s, scale, 0);
;2766:	CG_Text_Paint(320 - w / 2, 125, scale, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2767:#else
;2768:	CG_DrawString( 320, 70, s, colorWhite, cw, cw * 1.5, 0, DS_CENTER | DS_SHADOW | DS_PROPORTIONAL );
;2769:#endif
;2770:}
;2771:#endif
;2772:
;2773:
;2774://==================================================================================
;2775:#ifdef MISSIONPACK
;2776:/* 
;2777:=================
;2778:CG_DrawTimedMenus
;2779:=================
;2780:*/
;2781:void CG_DrawTimedMenus( void ) {
;2782:	if (cg.voiceTime) {
;2783:		int t = cg.time - cg.voiceTime;
;2784:		if ( t > 2500 ) {
;2785:			Menus_CloseByName("voiceMenu");
;2786:			trap_Cvar_Set("cl_conXOffset", "0");
;2787:			cg.voiceTime = 0;
;2788:		}
;2789:	}
;2790:}
;2791:#endif
;2792:
;2793:#ifdef USE_VR_ZOOM
;2794:/*
;2795:==============
;2796:CG_DrawWeapReticle
;2797:==============
;2798:*/
;2799:static void CG_DrawWeapReticle(void)
;2800:{
;2801:	vec4_t light_color = { 0.7f, 0.7f, 0.7f, 1.0f };
;2802:	vec4_t black = { 0.0f, 0.0f, 0.0f, 1.0f };
;2803:
;2804:	float indent = 0.16f;
;2805:	float X_WIDTH = 640.0f;
;2806:	float Y_HEIGHT = 480.0f;
;2807:
;2808:	float x = (X_WIDTH * indent), y = (Y_HEIGHT * indent), w = (X_WIDTH * (1 - (2 * indent))) / 2.0f, h = (Y_HEIGHT * (1 - (2 * indent))) / 2;
;2809:
;2810:	CG_AdjustFrom640(&x, &y, &w, &h);
;2811:
;2812:	// sides
;2813:	CG_FillRect(0, 0, (X_WIDTH * indent), Y_HEIGHT, black);
;2814:	CG_FillRect(X_WIDTH * (1 - indent), 0, (X_WIDTH * indent), Y_HEIGHT, black);
;2815:	// top/bottom
;2816:	CG_FillRect(X_WIDTH * indent, 0, X_WIDTH * (1 - indent), Y_HEIGHT * indent, black);
;2817:	CG_FillRect(X_WIDTH * indent, Y_HEIGHT * (1 - indent), X_WIDTH * (1 - indent), Y_HEIGHT * indent, black);
;2818:
;2819:	{
;2820:		// center
;2821:		if (cgs.media.reticleShader) {
;2822:			trap_R_DrawStretchPic(x, y, w, h, 0, 0, 1, 1, cgs.media.reticleShader);    // tl
;2823:			trap_R_DrawStretchPic(x + w, y, w, h, 1, 0, 0, 1, cgs.media.reticleShader);  // tr
;2824:			trap_R_DrawStretchPic(x, y + h, w, h, 0, 1, 1, 0, cgs.media.reticleShader);    // bl
;2825:			trap_R_DrawStretchPic(x + w, y + h, w, h, 1, 1, 0, 0, cgs.media.reticleShader);  // br
;2826:		}
;2827:
;2828:		// hairs
;2829:		CG_FillRect(84, 239, 177, 2, light_color);   // left
;2830:		CG_FillRect(320, 242, 1, 58, light_color);   // center top
;2831:		CG_FillRect(319, 300, 2, 178, light_color);  // center bot
;2832:		CG_FillRect(380, 239, 177, 2, light_color);  // right
;2833:	}
;2834:}
;2835:#endif
;2836:
;2837:/*
;2838:=================
;2839:CG_DrawScreen2D - Draws 2D elements always intended for the screen
;2840:=================
;2841:*/
;2842:static void CG_DrawScreen2D()
;2843:{
line 2845
;2844:	// if we are taking a levelshot for the menu, don't draw anything
;2845:	if (cg.levelShot) {
ADDRGP4 cg+12
INDIRI4
CNSTI4 0
EQI4 $383
line 2846
;2846:		return;
ADDRGP4 $382
JUMPV
LABELV $383
line 2849
;2847:	}
;2848:
;2849:	if (cg.snap->ps.pm_type == PM_INTERMISSION) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $386
line 2850
;2850:		return;
ADDRGP4 $382
JUMPV
LABELV $386
line 2853
;2851:	}
;2852:
;2853:	if (cg.snap->ps.persistant[PERS_TEAM] != TEAM_SPECTATOR &&
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
EQI4 $389
ADDRGP4 cg+243116
INDIRI4
CNSTI4 0
NEI4 $389
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
LEI4 $389
line 2854
;2854:		!cg.showScores && cg.snap->ps.stats[STAT_HEALTH] > 0) {
line 2867
;2855:
;2856:#ifdef USE_CONFORT_VIGNETTE
;2857:	CG_DrawVignette();
;2858:#endif
;2859:
;2860:#ifdef USE_VR_ZOOM
;2861:	{
;2862:		int vrFlags = VR_get_client_vrFlags();
;2863:		if (vrFlags & EF_WEAPON_ZOOM)
;2864:			CG_DrawWeapReticle();
;2865:	}
;2866:#endif
;2867:	}
LABELV $389
line 2868
;2868:}
LABELV $382
endproc CG_DrawScreen2D 0 0
proc CG_DrawTourneyScoreboard 0 0
line 3054
;2869:
;2870:#ifdef USE_CONFORT_VIGNETTE
;2871:/*
;2872:==============
;2873:CG_DrawVignette
;2874:==============
;2875:*/
;2876:float currentComfortVignetteValue = 0.0f;
;2877:float filteredViewYawDelta = 0.0f;
;2878:
;2879:static void CG_DrawVignette(void)
;2880:{
;2881:
;2882:	float comfortVignetteValue = trap_Cvar_VariableValue("vr_comfortVignette");
;2883:	if (comfortVignetteValue <= 0.0f || comfortVignetteValue > 1.0f)
;2884:	{
;2885:		return;
;2886:	}
;2887:
;2888:	// TODO non native code
;2889:	/* // for info, this is how clientview_yaw_delta is calculated
;2890:		const float delta = vr_info.clientviewangles[YAW] - vr_info.hmdinfo.angles.actual[YAW];
;2891:		vr_info.clientview_yaw_delta = vr_info.clientview_yaw_last - delta;
;2892:		vr_info.clientview_yaw_last = delta;
;2893:	*/
;2894:
;2895:	float yawDelta = fabsf(vrinfo->clientview_yaw_delta);
;2896:	if (yawDelta > 180)
;2897:	{
;2898:		yawDelta = fabs(yawDelta - 360);
;2899:	}
;2900:	filteredViewYawDelta = filteredViewYawDelta * 0.75f + yawDelta * 0.25f;
;2901:	if (VectorLength(cg.predictedPlayerState.velocity) > 30.0 || (filteredViewYawDelta > 1))
;2902:	{
;2903:		if (currentComfortVignetteValue < comfortVignetteValue)
;2904:		{
;2905:			currentComfortVignetteValue += comfortVignetteValue * 0.05;
;2906:			if (currentComfortVignetteValue > 1.0f)
;2907:				currentComfortVignetteValue = 1.0f;
;2908:		}
;2909:	}
;2910:	else {
;2911:		if (currentComfortVignetteValue > 0.0f)
;2912:			currentComfortVignetteValue -= comfortVignetteValue * 0.05;
;2913:	}
;2914:
;2915:	if (currentComfortVignetteValue > 0.0f && currentComfortVignetteValue <= 1.0f && !(vrinfo->weapon_zoomed))
;2916:	{
;2917:		int x = (int)(0 + currentComfortVignetteValue * cg.refdef.width / 3.5f);
;2918:		int w = (int)(cg.refdef.width - 2 * x);
;2919:		int y = (int)(0 + currentComfortVignetteValue * cg.refdef.height / 3.5f);
;2920:		int h = (int)(cg.refdef.height - 2 * y);
;2921:
;2922:		vec4_t black = { 0.0, 0.0, 0.0, 1 };
;2923:		trap_R_SetColor(black);
;2924:
;2925:		// sides
;2926:		trap_R_DrawStretchPic(0, 0, x, cg.refdef.height, 0, 0, 1, 1, cgs.media.whiteShader);
;2927:		trap_R_DrawStretchPic(cg.refdef.width - x, 0, x, cg.refdef.height, 0, 0, 1, 1, cgs.media.whiteShader);
;2928:		// top/bottom
;2929:		trap_R_DrawStretchPic(x, 0, cg.refdef.width - x, y, 0, 0, 1, 1, cgs.media.whiteShader);
;2930:		trap_R_DrawStretchPic(x, cg.refdef.height - y, cg.refdef.width - x, y, 0, 0, 1, 1, cgs.media.whiteShader);
;2931:		// vignette
;2932:		trap_R_DrawStretchPic(x, y, w, h, 0, 0, 1, 1, cgs.media.vignetteShader);
;2933:
;2934:		trap_R_SetColor(NULL);
;2935:	}
;2936:}
;2937:#endif
;2938:
;2939:/*
;2940:=================
;2941:CG_Draw2D
;2942:=================
;2943:*/
;2944:#ifndef USE_NEOHUD
;2945:static void CG_Draw2D( stereoFrame_t stereoFrame )
;2946:{
;2947:#if defined MISSIONPACK || defined USE_NEOHUD
;2948:	if (cgs.orderPending && cg.time > cgs.orderTime) {
;2949:		CG_CheckOrderPending();
;2950:	}
;2951:#endif
;2952:	// if we are taking a levelshot for the menu, don't draw anything
;2953:	if ( cg.levelShot ) {
;2954:		return;
;2955:	}
;2956:
;2957:	if ( cg_draw2D.integer == 0 ) {
;2958:		return;
;2959:	}
;2960:
;2961:	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
;2962:		CG_DrawIntermission();
;2963:		return;
;2964:	}
;2965:
;2966:/*
;2967:	if (cg.cameraMode) {
;2968:		return;
;2969:	}
;2970:*/
;2971:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
;2972:		CG_DrawSpectator();
;2973:		CG_DrawCrosshair();
;2974:		CG_DrawCrosshairNames();
;2975:	} else {
;2976:		// don't draw any status if dead or the scoreboard is being explicitly shown
;2977:		if ( !cg.showScores && cg.snap->ps.stats[STAT_HEALTH] > 0 ) {
;2978:
;2979:#ifdef MISSIONPACK
;2980:			if ( cg_drawStatus.integer ) {
;2981:				Menu_PaintAll();
;2982:				CG_DrawTimedMenus();
;2983:			}
;2984:#else
;2985:			CG_DrawStatusBar();
;2986:#endif
;2987:      
;2988:			CG_DrawAmmoWarning();
;2989:
;2990:#ifdef MISSIONPACK
;2991:			CG_DrawProxWarning();
;2992:#endif      
;2993:			CG_DrawCrosshair();
;2994:			CG_DrawCrosshairNames();
;2995:			CG_DrawWeaponSelect();
;2996:
;2997:#ifndef MISSIONPACK
;2998:			CG_DrawHoldableItem();
;2999:#else
;3000:			//CG_DrawPersistantPowerup();
;3001:#endif
;3002:			CG_DrawReward();
;3003:		}
;3004:    
;3005:		if ( cgs.gametype >= GT_TEAM ) {
;3006:#ifndef MISSIONPACK
;3007:			CG_DrawTeamInfo();
;3008:#endif
;3009:		}
;3010:	}
;3011:
;3012:	CG_DrawVote();
;3013:	CG_DrawTeamVote();
;3014:
;3015:	CG_DrawLagometer();
;3016:
;3017:#ifdef MISSIONPACK
;3018:	if (!cg_paused.integer) {
;3019:		CG_DrawUpperRight(stereoFrame);
;3020:	}
;3021:#else
;3022:	CG_DrawUpperRight(stereoFrame);
;3023:#endif
;3024:
;3025:#ifndef MISSIONPACK
;3026:	CG_DrawLowerRight();
;3027:	CG_DrawLowerLeft();
;3028:#endif
;3029:
;3030:	if ( !CG_DrawFollow() ) {
;3031:		CG_DrawWarmup();
;3032:	}
;3033:
;3034:	// don't draw center string if scoreboard is up
;3035:	cg.scoreBoardShowing = CG_DrawScoreboard();
;3036:	if ( !cg.scoreBoardShowing ) {
;3037:		CG_DrawCenterString();
;3038:	}
;3039:
;3040:	if ( cgs.score_catched ) {
;3041:		float x, y, w, h;
;3042:		trap_R_SetColor( NULL );
;3043:		x = cgs.cursorX - 12;
;3044:		y = cgs.cursorY - 12;
;3045:		w = 24;
;3046:		h = 24;
;3047:		CG_AdjustFrom640( &x, &y, &w, &h );
;3048:		trap_R_DrawStretchPic( x, y, w, h, 0, 0, 1, 1, cgs.media.cursor );
;3049:	}
;3050:}
;3051:#endif
;3052:
;3053:
;3054:static void CG_DrawTourneyScoreboard( void ) {
line 3057
;3055:#ifdef MISSIONPACK
;3056:#else
;3057:	CG_DrawOldTourneyScoreboard();
ADDRGP4 CG_DrawOldTourneyScoreboard
CALLV
pop
line 3059
;3058:#endif
;3059:}
LABELV $394
endproc CG_DrawTourneyScoreboard 0 0
proc CG_WarmupEvents 1220 16
line 3083
;3060:
;3061:#ifndef USE_NEOHUD
;3062:static void CG_CalculatePing( void ) {
;3063:	int count, i, v;
;3064:
;3065:	cg.meanPing = 0;
;3066:
;3067:	for ( i = 0, count = 0; i < LAG_SAMPLES; i++ ) {
;3068:
;3069:		v = lagometer.snapshotSamples[i];
;3070:		if ( v >= 0 ) {
;3071:			cg.meanPing += v;
;3072:			count++;
;3073:		}
;3074:
;3075:	}
;3076:
;3077:	if ( count ) {
;3078:		cg.meanPing /= count;
;3079:	}
;3080:}
;3081:#endif
;3082:
;3083:static void CG_WarmupEvents( void ) {
line 3087
;3084:
;3085:	int	count;
;3086:
;3087:	if ( !cg.warmup )
ADDRGP4 cg+245608
INDIRI4
CNSTI4 0
NEI4 $396
line 3088
;3088:		return;
ADDRGP4 $395
JUMPV
LABELV $396
line 3090
;3089:
;3090:	if ( cg.warmup < 0 ) {
ADDRGP4 cg+245608
INDIRI4
CNSTI4 0
GEI4 $399
line 3091
;3091:		cg.warmupCount = -1;
ADDRGP4 cg+245612
CNSTI4 -1
ASGNI4
line 3092
;3092:		return;
ADDRGP4 $395
JUMPV
LABELV $399
line 3095
;3093:	}
;3094:
;3095:	if ( cg.warmup < cg.time ) {
ADDRGP4 cg+245608
INDIRI4
ADDRGP4 cg+234764
INDIRI4
GEI4 $403
line 3096
;3096:		cg.warmup = 0;
ADDRGP4 cg+245608
CNSTI4 0
ASGNI4
line 3097
;3097:		count = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3098
;3098:	} else {
ADDRGP4 $404
JUMPV
LABELV $403
line 3099
;3099:		count = ( cg.warmup - cg.time + 999 ) / 1000;
ADDRLP4 0
ADDRGP4 cg+245608
INDIRI4
ADDRGP4 cg+234764
INDIRI4
SUBI4
CNSTI4 999
ADDI4
CNSTI4 1000
DIVI4
ASGNI4
line 3100
;3100:	}
LABELV $404
line 3102
;3101:
;3102:	if ( cg.warmupCount == -2 && cg.demoPlayback ) {
ADDRGP4 cg+245612
INDIRI4
CNSTI4 -2
NEI4 $410
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
EQI4 $410
line 3103
;3103:		cg.warmupCount = 0;
ADDRGP4 cg+245612
CNSTI4 0
ASGNI4
line 3104
;3104:	}
LABELV $410
line 3106
;3105:
;3106:	if ( cg.warmupCount == count ) {
ADDRGP4 cg+245612
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $415
line 3107
;3107:		return;
ADDRGP4 $395
JUMPV
LABELV $415
line 3110
;3108:	}
;3109:
;3110:	cg.warmupCount = count;
ADDRGP4 cg+245612
ADDRLP4 0
INDIRI4
ASGNI4
line 3111
;3111:	cg.timelimitWarnings = 0;
ADDRGP4 cg+234776
CNSTI4 0
ASGNI4
line 3113
;3112:
;3113:	switch ( count ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $421
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $421
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $445
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $445
address $422
address $436
address $439
address $442
code
LABELV $422
line 3115
;3114:		case 0:
;3115:			if ( cg.warmupFightSound <= cg.time ) {
ADDRGP4 cg+245616
INDIRI4
ADDRGP4 cg+234764
INDIRI4
GTI4 $423
line 3116
;3116:				trap_S_StartLocalSound( cgs.media.countFightSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+150560+1000
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 3117
;3117:				cg.warmupFightSound = cg.time + 750;
ADDRGP4 cg+245616
ADDRGP4 cg+234764
INDIRI4
CNSTI4 750
ADDI4
ASGNI4
line 3118
;3118:			}
LABELV $423
line 3120
;3119:#ifdef USE_NEOHUD
;3120:			{
line 3122
;3121:			item_t itm;
;3122:			itm = dyn_itemArray[WarmFightMsg_idx];
ADDRLP4 8
ADDRGP4 WarmFightMsg_idx
INDIRI4
CNSTI4 1212
MULI4
ADDRGP4 dyn_itemArray
ADDP4
INDIRB
ASGNB 1212
line 3123
;3123:			CG_CenterPrint( "FIGHT!", itm.rect.y, itm.fontsize.w, itm.forecolor.color );
ADDRGP4 $431
ARGP4
ADDRLP4 8+1088+4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 8+1120
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 8+1152
ARGP4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 3124
;3124:			}
line 3128
;3125:#else
;3126:			CG_CenterPrint( "FIGHT!", 120, GIANTCHAR_WIDTH*2 );
;3127:#endif			
;3128:			break;
ADDRGP4 $421
JUMPV
LABELV $436
line 3131
;3129:
;3130:		case 1:
;3131:			trap_S_StartLocalSound( cgs.media.count1Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+150560+996
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 3132
;3132:			break;
ADDRGP4 $421
JUMPV
LABELV $439
line 3135
;3133:
;3134:		case 2:
;3135:			trap_S_StartLocalSound( cgs.media.count2Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+150560+992
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 3136
;3136:			break;
ADDRGP4 $421
JUMPV
LABELV $442
line 3139
;3137:
;3138:		case 3:
;3139:			trap_S_StartLocalSound( cgs.media.count3Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+150560+988
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 3140
;3140:			break;
line 3143
;3141:
;3142:		default:
;3143:			break;
LABELV $421
line 3145
;3144:	}
;3145:}
LABELV $395
endproc CG_WarmupEvents 1220 16
export CG_WarmupEvent
proc CG_WarmupEvent 0 0
line 3150
;3146:
;3147:
;3148:
;3149:// will be called on warmup end and when client changed
;3150:void CG_WarmupEvent( void ) {
line 3152
;3151:
;3152:	cg.attackerTime = 0;
ADDRGP4 cg+245364
CNSTI4 0
ASGNI4
line 3153
;3153:	cg.attackerName[0] = '\0';
ADDRGP4 cg+245328
CNSTI1 0
ASGNI1
line 3155
;3154:
;3155:	cg.itemPickupTime = 0;
ADDRGP4 cg+245628
CNSTI4 0
ASGNI4
line 3156
;3156:	cg.itemPickupBlendTime = 0;
ADDRGP4 cg+245632
CNSTI4 0
ASGNI4
line 3157
;3157:	cg.itemPickupCount = 0;
ADDRGP4 cg+245624
CNSTI4 0
ASGNI4
line 3159
;3158:
;3159:	cg.killerTime = 0;
ADDRGP4 cg+243192
CNSTI4 0
ASGNI4
line 3160
;3160:	cg.killerName[0] = '\0';
ADDRGP4 cg+243128
CNSTI1 0
ASGNI1
line 3162
;3161:	
;3162:	cg.damageTime = 0;
ADDRGP4 cg+245648
CNSTI4 0
ASGNI4
line 3164
;3163:
;3164:	cg.rewardStack = 0;
ADDRGP4 cg+245372
CNSTI4 0
ASGNI4
line 3165
;3165:	cg.rewardTime = 0;
ADDRGP4 cg+245376
CNSTI4 0
ASGNI4
line 3167
;3166:	
;3167:	cg.weaponSelectTime = cg.time;
ADDRGP4 cg+245636
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 3169
;3168:
;3169:	cg.lowAmmoWarning = 0;
ADDRGP4 cg+245304
CNSTI4 0
ASGNI4
line 3171
;3170:
;3171:	cg.followTime = 0;
ADDRGP4 cg+282940
CNSTI4 0
ASGNI4
line 3172
;3172:}
LABELV $446
endproc CG_WarmupEvent 0 0
proc CG_ApplyClientChange 0 0
line 3177
;3173:
;3174:
;3175:// called each time client team changed
;3176:static void CG_ApplyClientChange( void )
;3177:{
line 3178
;3178:	CG_WarmupEvent();
ADDRGP4 CG_WarmupEvent
CALLV
pop
line 3179
;3179:	CG_ForceModelChange();
ADDRGP4 CG_ForceModelChange
CALLV
pop
line 3180
;3180:}
LABELV $461
endproc CG_ApplyClientChange 0 0
data
align 4
LABELV $463
byte 4 -1
align 4
LABELV $464
byte 4 -1
align 4
LABELV $465
byte 4 -1
export CG_TrackClientTeamChange
code
proc CG_TrackClientTeamChange 8 4
line 3189
;3181:
;3182:
;3183:/*
;3184:=====================
;3185:CG_TrackClientTeamChange
;3186:=====================
;3187:*/
;3188:void CG_TrackClientTeamChange( void ) 
;3189:{
line 3197
;3190:	static int spec_client = -1;
;3191:	static int spec_team = -1;
;3192:	static int curr_team = -1;
;3193:
;3194:	int		ti; // team from clientinfo 
;3195:	int		tp; // persistant team from snapshot
;3196:
;3197:	if ( !cg.snap )
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $466
line 3198
;3198:		return;
ADDRGP4 $462
JUMPV
LABELV $466
line 3200
;3199:
;3200:	tp = cg.snap->ps.persistant[ PERS_TEAM ];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ASGNI4
line 3201
;3201:	ti = cgs.clientinfo[ cg.snap->ps.clientNum ].team;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012+36
ADDP4
INDIRI4
ASGNI4
line 3203
;3202:
;3203:	if ( !(cg.snap->ps.pm_flags & PMF_FOLLOW) && tp != TEAM_SPECTATOR ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $473
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $473
line 3204
;3204:		ti = tp; // use team from persistant info
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 3205
;3205:	}
LABELV $473
line 3208
;3206:
;3207:	// team changed
;3208:	if ( curr_team != ti )
ADDRGP4 $465
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $476
line 3209
;3209:	{
line 3210
;3210:		curr_team = ti;
ADDRGP4 $465
ADDRLP4 4
INDIRI4
ASGNI4
line 3211
;3211:		spec_client = cg.snap->ps.clientNum;
ADDRGP4 $463
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 3212
;3212:		spec_team = tp;
ADDRGP4 $464
ADDRLP4 0
INDIRI4
ASGNI4
line 3214
;3213:
;3214:		if ( spec_team == TEAM_SPECTATOR )
ADDRGP4 $464
INDIRI4
CNSTI4 3
NEI4 $479
line 3215
;3215:			spec_team = curr_team;
ADDRGP4 $464
ADDRGP4 $465
INDIRI4
ASGNI4
LABELV $479
line 3217
;3216:
;3217:		CG_ApplyClientChange();
ADDRGP4 CG_ApplyClientChange
CALLV
pop
line 3218
;3218:		CG_ResetPlayerEntity( &cg.predictedPlayerEntity );
ADDRGP4 cg+235356
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 3219
;3219:		return;
ADDRGP4 $462
JUMPV
LABELV $476
line 3222
;3220:	}
;3221:
;3222:	if ( curr_team == TEAM_SPECTATOR )
ADDRGP4 $465
INDIRI4
CNSTI4 3
NEI4 $482
line 3223
;3223:	{
line 3224
;3224:		if ( spec_team != tp )
ADDRGP4 $464
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $484
line 3225
;3225:		{
line 3226
;3226:			spec_team  = tp;
ADDRGP4 $464
ADDRLP4 0
INDIRI4
ASGNI4
line 3227
;3227:			spec_client = cg.snap->ps.clientNum;
ADDRGP4 $463
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 3229
;3228:
;3229:			CG_ApplyClientChange();
ADDRGP4 CG_ApplyClientChange
CALLV
pop
line 3230
;3230:			CG_ResetPlayerEntity( &cg.predictedPlayerEntity );
ADDRGP4 cg+235356
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 3231
;3231:			return;
ADDRGP4 $462
JUMPV
LABELV $484
line 3234
;3232:		}
;3233:
;3234:		if ( cgs.gametype >= GT_TEAM ) 
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
LTI4 $488
line 3235
;3235:		{
line 3236
;3236:			spec_client = cg.snap->ps.clientNum;
ADDRGP4 $463
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 3237
;3237:			return;
ADDRGP4 $462
JUMPV
LABELV $488
line 3240
;3238:		}
;3239:		// pass through to spec client checks
;3240:	}
LABELV $482
line 3242
;3241:	
;3242:	if ( spec_client != cg.snap->ps.clientNum ) 
ADDRGP4 $463
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $492
line 3243
;3243:	{
line 3244
;3244:		spec_client = cg.snap->ps.clientNum;
ADDRGP4 $463
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 3245
;3245:		spec_team = tp;
ADDRGP4 $464
ADDRLP4 0
INDIRI4
ASGNI4
line 3247
;3246:
;3247:		if ( spec_team == TEAM_SPECTATOR )
ADDRGP4 $464
INDIRI4
CNSTI4 3
NEI4 $496
line 3248
;3248:			spec_team = cgs.clientinfo[ cg.snap->ps.clientNum ].team;
ADDRGP4 $464
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012+36
ADDP4
INDIRI4
ASGNI4
LABELV $496
line 3250
;3249:
;3250:		CG_ApplyClientChange();
ADDRGP4 CG_ApplyClientChange
CALLV
pop
line 3251
;3251:		CG_ResetPlayerEntity( &cg.predictedPlayerEntity );
ADDRGP4 cg+235356
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 3252
;3252:	}
LABELV $492
line 3253
;3253:}
LABELV $462
endproc CG_TrackClientTeamChange 8 4
export cvar_SetValue
proc cvar_SetValue 256 16
line 3256
;3254:
;3255:
;3256:void cvar_SetValue(const char *var_name, const float value) {
line 3258
;3257:	char buffer[256];
;3258:	Com_sprintf(buffer, 255, "%g", value);
ADDRLP4 0
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 $503
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLI4
pop
line 3259
;3259:	trap_Cvar_Set(var_name, buffer);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3260
;3260:}
LABELV $502
endproc cvar_SetValue 256 16
export offsetVieworg
proc offsetVieworg 44 8
line 3270
;3261:
;3262:#ifdef USE_VR
;3263:/*
;3264:=====================
;3265:offsetVieworg
;3266:
;3267:offset vieworg appropriately if we're doing stereo separation
;3268:=====================
;3269:*/
;3270:void offsetVieworg( void ) {
line 3271
;3271:	float heightOffset = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 3272
;3272:	float worldscale = cg.worldscale;
ADDRLP4 4
ADDRGP4 cg+282976
INDIRF4
ASGNF4
line 3276
;3273:
;3274:#ifdef USE_VR
;3275:	vec3_t clientHMDposition;
;3276:	int vrFlags = VR_get_client_vrFlags();
ADDRLP4 24
ADDRGP4 VR_get_client_vrFlags
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 3277
;3277:	VR_get_client_HMD_position( clientHMDposition );
ADDRLP4 12
ARGP4
ADDRGP4 VR_get_client_HMD_position
CALLV
pop
line 3282
;3278:#endif
;3279:
;3280:	//VectorCopy(cg.refdef.vieworg, baseOrg);
;3281:#ifdef USE_DEATHCAM
;3282:	if (cg.demoPlayback || CG_IsFollowMode( EF_FM_THIRDPERSON_1 ))
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $509
CNSTI4 16
ARGI4
ADDRLP4 28
ADDRGP4 CG_IsFollowMode
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $506
LABELV $509
line 3283
;3283:	{
line 3284
;3284:		worldscale *= SPECTATOR_WORLDSCALE_MULTIPLIER;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1092616192
MULF4
ASGNF4
line 3285
;3285:		cvar_SetValue("vr_worldscaleScaler", SPECTATOR_WORLDSCALE_MULTIPLIER);
ADDRGP4 $510
ARGP4
CNSTF4 1092616192
ARGF4
ADDRGP4 cvar_SetValue
CALLV
pop
line 3288
;3286:		//Just move camera down about 20cm
;3287:		//heightOffset = -0.2f;
;3288:		heightOffset = 0.2f;
ADDRLP4 0
CNSTF4 1045220557
ASGNF4
line 3289
;3289:	}
ADDRGP4 $507
JUMPV
LABELV $506
line 3290
;3290:	else if (CG_IsDeathCam() || CG_IsFollowMode( EF_FM_THIRDPERSON_2 ))
ADDRLP4 32
ADDRGP4 CG_IsDeathCam
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $513
CNSTI4 32
ARGI4
ADDRLP4 36
ADDRGP4 CG_IsFollowMode
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $511
LABELV $513
line 3291
;3291:	{
line 3292
;3292:		worldscale *= SPECTATOR2_WORLDSCALE_MULTIPLIER;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1106247680
MULF4
ASGNF4
line 3293
;3293:		cvar_SetValue("vr_worldscaleScaler", SPECTATOR2_WORLDSCALE_MULTIPLIER);
ADDRGP4 $510
ARGP4
CNSTF4 1106247680
ARGF4
ADDRGP4 cvar_SetValue
CALLV
pop
line 3296
;3294:		//Just move camera down about 50cm
;3295:		//heightOffset = -0.5f;
;3296:		heightOffset = 0.5f;
ADDRLP4 0
CNSTF4 1056964608
ASGNF4
line 3297
;3297:	}
LABELV $511
LABELV $507
line 3308
;3298:#ifdef USE_VR_ZOOM
;3299:	else
;3300:	{
;3301:		float weapon_zoomLevel = VR_get_client_weapon_zoomLevel();
;3302:		float zoomCoeff = ((2.5f - weapon_zoomLevel) / 1.5f); // normally 1.0
;3303:		cvar_SetValue("vr_worldscaleScaler", zoomCoeff);
;3304:	}
;3305:#endif
;3306:#endif // USE_DEATHCAM
;3307:
;3308:	if ( (cg.snap->ps.pm_flags & PMF_FOLLOW) && (vrFlags & EF_FM_FIRSTPERSON) )
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $514
ADDRLP4 8
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $514
line 3309
;3309:	{
line 3311
;3310:		//Do nothing to view height if we are following in first person
;3311:	}
ADDRGP4 $515
JUMPV
LABELV $514
line 3313
;3312:	else
;3313:	{
line 3314
;3314:		cg.refdef.vieworg[2] += (clientHMDposition[1] + heightOffset) * worldscale;
ADDRLP4 40
ADDRGP4 cg+236804+24+8
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3315
;3315:	}
LABELV $515
line 3348
;3316:
;3317:#ifdef USE_NATIVE_HACK
;3318:	if ( cg.vr_controller_type )
;3319:	{
;3320:		//If running multiplayer, allow some amount of faked positional tracking
;3321:		if (cg.snap->ps.stats[STAT_HEALTH] > 0 &&
;3322:			//Don't use fake positional if following another player - this is handled in the VR third person code
;3323:			!( cg.demoPlayback || CG_IsThirdPersonFollowMode_Query()) )
;3324:		{
;3325:			vec3_t		pos, hmdpositionDelta, vieworg;
;3326:			float		angleYaw;
;3327:			trace_t		trace;
;3328:			vec3_t		mins = { -8, -8, -8 };
;3329:			vec3_t		maxs = {  8,  8,  8 };
;3330:
;3331:			VectorClear(pos);
;3332:
;3333:			VectorSubtract( clientHMDposition, vrinfo->hmdorigin, hmdpositionDelta);
;3334:			angleYaw = SHORT2ANGLE(cg.predictedPlayerState.delta_angles[YAW]) + (vrinfo->clientviewangles[YAW] - vrinfo->hmdinfo.angles.actual[YAW]);
;3335:
;3336:			rotateAboutOrigin(hmdpositionDelta[2], hmdpositionDelta[0], angleYaw, pos);
;3337:
;3338:			VectorScale(pos, worldscale, pos);
;3339:			VectorSubtract(cg.refdef.vieworg, pos, vieworg);
;3340:
;3341:			//Prevent player clipping through solid objects
;3342:			CG_Trace(&trace, cg.refdef.vieworg, mins, maxs, vieworg, cg.snap->ps.clientNum, CONTENTS_SOLID | CONTENTS_BODY);
;3343:
;3344:			VectorCopy(trace.endpos, cg.refdef.vieworg);
;3345:		}
;3346:	}
;3347:#endif
;3348:}
LABELV $504
endproc offsetVieworg 44 8
export CG_DrawActive
proc CG_DrawActive 12 8
line 3359
;3349:#endif // USE_VR
;3350:
;3351:
;3352:/*
;3353:=====================
;3354:CG_DrawActive
;3355:
;3356:Perform all drawing needed to completely fill the screen
;3357:=====================
;3358:*/
;3359:void CG_DrawActive( stereoFrame_t stereoView ) {
line 3366
;3360:#ifdef USE_VR
;3361:	vec3_t baseOrg;
;3362:#ifdef USE_VR_ZOOM
;3363:	int vrFlags;
;3364:#endif
;3365:
;3366:	if ( cg.vr_controller_type >= 2 ) {
ADDRGP4 cg+282972
INDIRI4
CNSTI4 2
LTI4 $522
line 3368
;3367:		// offset vieworg appropriately if we're doing stereo separation
;3368:		VectorCopy(cg.refdef.vieworg, baseOrg);
ADDRLP4 0
ADDRGP4 cg+236804+24
INDIRB
ASGNB 12
line 3369
;3369:	}
LABELV $522
line 3373
;3370:#endif
;3371:
;3372:	// optionally draw the info screen instead
;3373:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $527
line 3375
;3374:#ifdef USE_NEOHUD
;3375:		CG_ChangeFrameResolution(cgs.glconfig.menuWidth, cgs.glconfig.menuHeight);
ADDRGP4 cgs+20100+11312
INDIRI4
ARGI4
ADDRGP4 cgs+20100+11316
INDIRI4
ARGI4
ADDRGP4 CG_ChangeFrameResolution
CALLV
pop
line 3377
;3376:#endif
;3377:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 3378
;3378:		return;
ADDRGP4 $521
JUMPV
LABELV $527
line 3381
;3379:	}
;3380:
;3381:	if ( !cg.demoPlayback ) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $534
line 3382
;3382:		CG_CalculatePing();
ADDRGP4 CG_CalculatePing
CALLV
pop
line 3383
;3383:	}
LABELV $534
line 3386
;3384:
;3385:	// optionally draw the tournement scoreboard instead
;3386:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR &&
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $537
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $537
line 3387
;3387:		( cg.snap->ps.pm_flags & PMF_SCOREBOARD ) ) {
line 3388
;3388:		CG_DrawTourneyScoreboard();
ADDRGP4 CG_DrawTourneyScoreboard
CALLV
pop
line 3389
;3389:		return;
ADDRGP4 $521
JUMPV
LABELV $537
line 3393
;3390:	}
;3391:
;3392:	// clear around the rendered view if sized down
;3393:	CG_TileClear();
ADDRGP4 CG_TileClear
CALLV
pop
line 3396
;3394:
;3395:#ifdef USE_VR
;3396:	if ( cg.vr_controller_type )
ADDRGP4 cg+282972
INDIRI4
CNSTI4 0
EQI4 $541
line 3398
;3397:		// offset vieworg appropriately if we're doing stereo separation
;3398:		offsetVieworg();
ADDRGP4 offsetVieworg
CALLV
pop
LABELV $541
line 3402
;3399:#endif
;3400:
;3401:	// draw 3D view
;3402:	trap_R_RenderScene( &cg.refdef );
ADDRGP4 cg+236804
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 3405
;3403:
;3404:#ifdef USE_VR
;3405:	if (cg.vr_controller_type >= 2) {
ADDRGP4 cg+282972
INDIRI4
CNSTI4 2
LTI4 $545
line 3406
;3406:		VectorCopy(baseOrg, cg.refdef.vieworg);
ADDRGP4 cg+236804+24
ADDRLP4 0
INDIRB
ASGNB 12
line 3407
;3407:	}
LABELV $545
line 3411
;3408:#endif
;3409:
;3410:#ifdef USE_NEOHUD
;3411:	trap_R_RenderHUD( &cg.refdef );	// let the client know we are rendering HUD
ADDRGP4 cg+236804
ARGP4
ADDRGP4 trap_R_RenderHUD
CALLV
pop
line 3412
;3412:	CG_ChangeFrameResolution(cgs.glconfig.hudWidth, cgs.glconfig.hudHeight);
ADDRGP4 cgs+20100+11320
INDIRI4
ARGI4
ADDRGP4 cgs+20100+11324
INDIRI4
ARGI4
ADDRGP4 CG_ChangeFrameResolution
CALLV
pop
line 3416
;3413:#endif
;3414:
;3415:	// play warmup sounds and display text
;3416:	CG_WarmupEvents();
ADDRGP4 CG_WarmupEvents
CALLV
pop
line 3418
;3417:
;3418:	CG_DrawScreen2D();
ADDRGP4 CG_DrawScreen2D
CALLV
pop
line 3425
;3419:
;3420:#ifdef USE_VR_ZOOM
;3421:	vrFlags = VR_get_client_vrFlags();
;3422:	if ( !(vrFlags & EF_WEAPON_ZOOM) )
;3423:#endif
;3424:		// draw status bar and other floating elements
;3425:		CG_Draw2D( stereoView );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Draw2D
CALLV
pop
line 3427
;3426:
;3427:}
LABELV $521
endproc CG_DrawActive 12 8
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
import CG_CalculatePing
import CG_Draw2D
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
import CG_ForceModelChange
import CG_ShowResponseHead
import CG_CheckOrderPending
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_DrawTeamBackground
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
bss
export teamChat2
align 1
LABELV teamChat2
skip 256
export teamChat1
align 1
LABELV teamChat1
skip 256
export systemChat
align 1
LABELV systemChat
skip 256
export numSortedTeamPlayers
align 4
LABELV numSortedTeamPlayers
skip 4
export sortedTeamPlayers
align 4
LABELV sortedTeamPlayers
skip 128
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
LABELV $510
byte 1 118
byte 1 114
byte 1 95
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 83
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $503
byte 1 37
byte 1 103
byte 1 0
align 1
LABELV $431
byte 1 70
byte 1 73
byte 1 71
byte 1 72
byte 1 84
byte 1 33
byte 1 0
align 1
LABELV $287
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 111
byte 1 83
byte 1 101
byte 1 112
byte 1 97
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $286
byte 1 114
byte 1 95
byte 1 122
byte 1 80
byte 1 114
byte 1 111
byte 1 106
byte 1 0
align 1
LABELV $281
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
LABELV $223
byte 1 118
byte 1 114
byte 1 95
byte 1 116
byte 1 119
byte 1 111
byte 1 72
byte 1 97
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $219
byte 1 118
byte 1 114
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 73
byte 1 110
byte 1 72
byte 1 97
byte 1 110
byte 1 100
byte 1 0
