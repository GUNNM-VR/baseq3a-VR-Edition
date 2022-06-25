export CG_TestModel_f
code
proc CG_TestModel_f 36 12
file "..\..\..\..\code\cgame\cg_view.c"
line 65
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_view.c -- setup all the parameters (position, angle, etc)
;4:// for a 3D rendering
;5:#include "cg_local.h"
;6:
;7:#ifdef USE_VR
;8:#include "../../../Quake3e-master/code/vrmod/VRMOD_input.h"
;9:
;10:#include "vr_helper.h"
;11:#endif
;12:#ifdef USE_NATIVE_HACK
;13:extern vr_clientinfo_t* vrinfo;
;14:#endif
;15:
;16:/*
;17:=============================================================================
;18:
;19:  MODEL TESTING
;20:
;21:The viewthing and gun positioning tools from Q2 have been integrated and
;22:enhanced into a single model testing facility.
;23:
;24:Model viewing can begin with either "testmodel <modelname>" or "testgun <modelname>".
;25:
;26:The names must be the full pathname after the basedir, like 
;27:"models/weapons/v_launch/tris.md3" or "players/male/tris.md3"
;28:
;29:Testmodel will create a fake entity 100 units in front of the current view
;30:position, directly facing the viewer.  It will remain immobile, so you can
;31:move around it to view it from different angles.
;32:
;33:Testgun will cause the model to follow the player around and suppress the real
;34:view weapon model.  The default frame 0 of most guns is completely off screen,
;35:so you will probably have to cycle a couple frames to see it.
;36:
;37:"nextframe", "prevframe", "nextskin", and "prevskin" commands will change the
;38:frame or skin of the testmodel.  These are bound to F5, F6, F7, and F8 in
;39:q3default.cfg.
;40:
;41:If a gun is being tested, the "gun_x", "gun_y", and "gun_z" variables will let
;42:you adjust the positioning.
;43:
;44:Note that none of the model testing features update while the game is paused, so
;45:it may be convenient to test with deathmatch set to 1 so that bringing down the
;46:console doesn't pause the game.
;47:
;48:=============================================================================
;49:*/
;50:
;51://#define	NECK_LENGTH		6  // neck
;52://#define	NECK_LENGTH		8  // q3a & q3e
;53://#define	NECK_LENGTH		10 // torso
;54://#define	NECK_LENGTH		3  // weapon
;55:#define		NECK_LENGTH		20
;56:
;57:/*
;58:=================
;59:CG_TestModel_f
;60:
;61:Creates an entity in front of the current position, which
;62:can then be moved around
;63:=================
;64:*/
;65:void CG_TestModel_f (void) {
line 68
;66:	vec3_t		angles;
;67:
;68:	memset( &cg.testModelEntity, 0, sizeof(cg.testModelEntity) );
ADDRGP4 cg+245744
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 69
;69:	if ( trap_Argc() < 2 ) {
ADDRLP4 12
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
GEI4 $90
line 70
;70:		return;
ADDRGP4 $87
JUMPV
LABELV $90
line 73
;71:	}
;72:
;73:	Q_strncpyz (cg.testModelName, CG_Argv( 1 ), MAX_QPATH );
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRGP4 cg+245884
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 74
;74:	cg.testModelEntity.hModel = trap_R_RegisterModel( cg.testModelName );
ADDRGP4 cg+245884
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cg+245744+8
ADDRLP4 20
INDIRI4
ASGNI4
line 76
;75:
;76:	if ( trap_Argc() == 3 ) {
ADDRLP4 24
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 3
NEI4 $96
line 77
;77:		cg.testModelEntity.backlerp = atof( CG_Argv( 2 ) );
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 atof
CALLF4
ASGNF4
ADDRGP4 cg+245744+100
ADDRLP4 32
INDIRF4
ASGNF4
line 78
;78:		cg.testModelEntity.frame = 1;
ADDRGP4 cg+245744+80
CNSTI4 1
ASGNI4
line 79
;79:		cg.testModelEntity.oldframe = 0;
ADDRGP4 cg+245744+96
CNSTI4 0
ASGNI4
line 80
;80:	}
LABELV $96
line 82
;81:
;82:	if ( !cg.testModelEntity.hModel ) {
ADDRGP4 cg+245744+8
INDIRI4
CNSTI4 0
NEI4 $104
line 83
;83:		CG_Printf( "Can't register model '%s'.\n", cg.testModelName );
ADDRGP4 $108
ARGP4
ADDRGP4 cg+245884
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 84
;84:		return;
ADDRGP4 $87
JUMPV
LABELV $104
line 87
;85:	}
;86:
;87:	VectorMA( cg.refdef.vieworg, 100, cg.refdef.viewaxis[0], cg.testModelEntity.origin );
ADDRGP4 cg+245744+68
ADDRGP4 cg+236804+24
INDIRF4
ADDRGP4 cg+236804+36
INDIRF4
CNSTF4 1120403456
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+245744+68+4
ADDRGP4 cg+236804+24+4
INDIRF4
ADDRGP4 cg+236804+36+4
INDIRF4
CNSTF4 1120403456
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+245744+68+8
ADDRGP4 cg+236804+24+8
INDIRF4
ADDRGP4 cg+236804+36+8
INDIRF4
CNSTF4 1120403456
MULF4
ADDF4
ASGNF4
line 89
;88:
;89:	angles[PITCH] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 90
;90:	angles[YAW] = 180 + cg.refdefViewAngles[1];
ADDRLP4 0+4
ADDRGP4 cg+237172+4
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 91
;91:	angles[ROLL] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 93
;92:
;93:	AnglesToAxis( angles, cg.testModelEntity.axis );
ADDRLP4 0
ARGP4
ADDRGP4 cg+245744+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 94
;94:	cg.testGun = qfalse;
ADDRGP4 cg+245948
CNSTI4 0
ASGNI4
line 95
;95:}
LABELV $87
endproc CG_TestModel_f 36 12
export CG_TestGun_f
proc CG_TestGun_f 0 0
line 104
;96:
;97:/*
;98:=================
;99:CG_TestGun_f
;100:
;101:Replaces the current view weapon with the given model
;102:=================
;103:*/
;104:void CG_TestGun_f (void) {
line 105
;105:	CG_TestModel_f();
ADDRGP4 CG_TestModel_f
CALLV
pop
line 106
;106:	cg.testGun = qtrue;
ADDRGP4 cg+245948
CNSTI4 1
ASGNI4
line 107
;107:	cg.testModelEntity.renderfx = RF_MINLIGHT | RF_DEPTHHACK | RF_FIRST_PERSON;
ADDRGP4 cg+245744+4
CNSTI4 13
ASGNI4
line 108
;108:}
LABELV $141
endproc CG_TestGun_f 0 0
export CG_TestModelNextFrame_f
proc CG_TestModelNextFrame_f 4 8
line 111
;109:
;110:
;111:void CG_TestModelNextFrame_f (void) {
line 112
;112:	cg.testModelEntity.frame++;
ADDRLP4 0
ADDRGP4 cg+245744+80
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 113
;113:	CG_Printf( "frame %i\n", cg.testModelEntity.frame );
ADDRGP4 $148
ARGP4
ADDRGP4 cg+245744+80
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 114
;114:}
LABELV $145
endproc CG_TestModelNextFrame_f 4 8
export CG_TestModelPrevFrame_f
proc CG_TestModelPrevFrame_f 4 8
line 116
;115:
;116:void CG_TestModelPrevFrame_f (void) {
line 117
;117:	cg.testModelEntity.frame--;
ADDRLP4 0
ADDRGP4 cg+245744+80
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 118
;118:	if ( cg.testModelEntity.frame < 0 ) {
ADDRGP4 cg+245744+80
INDIRI4
CNSTI4 0
GEI4 $154
line 119
;119:		cg.testModelEntity.frame = 0;
ADDRGP4 cg+245744+80
CNSTI4 0
ASGNI4
line 120
;120:	}
LABELV $154
line 121
;121:	CG_Printf( "frame %i\n", cg.testModelEntity.frame );
ADDRGP4 $148
ARGP4
ADDRGP4 cg+245744+80
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 122
;122:}
LABELV $151
endproc CG_TestModelPrevFrame_f 4 8
export CG_TestModelNextSkin_f
proc CG_TestModelNextSkin_f 4 8
line 124
;123:
;124:void CG_TestModelNextSkin_f (void) {
line 125
;125:	cg.testModelEntity.skinNum++;
ADDRLP4 0
ADDRGP4 cg+245744+104
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 126
;126:	CG_Printf( "skin %i\n", cg.testModelEntity.skinNum );
ADDRGP4 $165
ARGP4
ADDRGP4 cg+245744+104
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 127
;127:}
LABELV $162
endproc CG_TestModelNextSkin_f 4 8
export CG_TestModelPrevSkin_f
proc CG_TestModelPrevSkin_f 4 8
line 129
;128:
;129:void CG_TestModelPrevSkin_f (void) {
line 130
;130:	cg.testModelEntity.skinNum--;
ADDRLP4 0
ADDRGP4 cg+245744+104
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 131
;131:	if ( cg.testModelEntity.skinNum < 0 ) {
ADDRGP4 cg+245744+104
INDIRI4
CNSTI4 0
GEI4 $171
line 132
;132:		cg.testModelEntity.skinNum = 0;
ADDRGP4 cg+245744+104
CNSTI4 0
ASGNI4
line 133
;133:	}
LABELV $171
line 134
;134:	CG_Printf( "skin %i\n", cg.testModelEntity.skinNum );
ADDRGP4 $165
ARGP4
ADDRGP4 cg+245744+104
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 135
;135:}
LABELV $168
endproc CG_TestModelPrevSkin_f 4 8
proc CG_AddTestModel 32 4
line 137
;136:
;137:static void CG_AddTestModel (void) {
line 141
;138:	int		i;
;139:
;140:	// re-register the model, because the level may have changed
;141:	cg.testModelEntity.hModel = trap_R_RegisterModel( cg.testModelName );
ADDRGP4 cg+245884
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cg+245744+8
ADDRLP4 4
INDIRI4
ASGNI4
line 142
;142:	if (! cg.testModelEntity.hModel ) {
ADDRGP4 cg+245744+8
INDIRI4
CNSTI4 0
NEI4 $183
line 143
;143:		CG_Printf ("Can't register model\n");
ADDRGP4 $187
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 144
;144:		return;
ADDRGP4 $179
JUMPV
LABELV $183
line 148
;145:	}
;146:
;147:	// if testing a gun, set the origin relative to the view origin
;148:	if ( cg.testGun ) {
ADDRGP4 cg+245948
INDIRI4
CNSTI4 0
EQI4 $188
line 149
;149:		VectorCopy( cg.refdef.vieworg, cg.testModelEntity.origin );
ADDRGP4 cg+245744+68
ADDRGP4 cg+236804+24
INDIRB
ASGNB 12
line 150
;150:		VectorCopy( cg.refdef.viewaxis[0], cg.testModelEntity.axis[0] );
ADDRGP4 cg+245744+28
ADDRGP4 cg+236804+36
INDIRB
ASGNB 12
line 151
;151:		VectorCopy( cg.refdef.viewaxis[1], cg.testModelEntity.axis[1] );
ADDRGP4 cg+245744+28+12
ADDRGP4 cg+236804+36+12
INDIRB
ASGNB 12
line 152
;152:		VectorCopy( cg.refdef.viewaxis[2], cg.testModelEntity.axis[2] );
ADDRGP4 cg+245744+28+24
ADDRGP4 cg+236804+36+24
INDIRB
ASGNB 12
line 155
;153:
;154:		// allow the position to be adjusted
;155:		for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $211
line 156
;156:			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[0][i] * cg_gun_x.value;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+245744+68
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+236804+36
ADDP4
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 157
;157:			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[1][i] * cg_gun_y.value;
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+245744+68
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+236804+36+12
ADDP4
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 158
;158:			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[2][i] * cg_gun_z.value;
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+245744+68
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+236804+36+24
ADDP4
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 159
;159:		}
LABELV $212
line 155
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $211
line 160
;160:	}
LABELV $188
line 162
;161:
;162:	trap_R_AddRefEntityToScene( &cg.testModelEntity );
ADDRGP4 cg+245744
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 163
;163:}
LABELV $179
endproc CG_AddTestModel 32 4
proc CG_CalcVrect 12 8
line 177
;164:
;165:
;166:
;167://============================================================================
;168:
;169:
;170:/*
;171:=================
;172:CG_CalcVrect
;173:
;174:Sets the coordinates of the rendered window
;175:=================
;176:*/
;177:static void CG_CalcVrect (void) {
line 181
;178:	int		size;
;179:
;180:	// the intermission should allways be full screen
;181:	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $234
line 182
;182:		size = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 183
;183:	} else {
ADDRGP4 $235
JUMPV
LABELV $234
line 185
;184:		// bound normal viewsize
;185:		if (cg_viewsize.integer < 30) {
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 30
GEI4 $237
line 186
;186:			trap_Cvar_Set ("cg_viewsize","30");
ADDRGP4 $240
ARGP4
ADDRGP4 $241
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 187
;187:			size = 30;
ADDRLP4 0
CNSTI4 30
ASGNI4
line 188
;188:		} else if (cg_viewsize.integer > 100) {
ADDRGP4 $238
JUMPV
LABELV $237
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 100
LEI4 $242
line 189
;189:			trap_Cvar_Set ("cg_viewsize","100");
ADDRGP4 $240
ARGP4
ADDRGP4 $245
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 190
;190:			size = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 191
;191:		} else {
ADDRGP4 $243
JUMPV
LABELV $242
line 192
;192:			size = cg_viewsize.integer;
ADDRLP4 0
ADDRGP4 cg_viewsize+12
INDIRI4
ASGNI4
line 193
;193:		}
LABELV $243
LABELV $238
line 195
;194:
;195:	}
LABELV $235
line 196
;196:	cg.refdef.width = cgs.glconfig.vidWidth*size/100;
ADDRGP4 cg+236804+8
ADDRGP4 cgs+20100+11304
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 197
;197:	cg.refdef.width &= ~1;
ADDRLP4 4
ADDRGP4 cg+236804+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 199
;198:
;199:	cg.refdef.height = cgs.glconfig.vidHeight*size/100;
ADDRGP4 cg+236804+12
ADDRGP4 cgs+20100+11308
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 200
;200:	cg.refdef.height &= ~1;
ADDRLP4 8
ADDRGP4 cg+236804+12
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 202
;201:
;202:	cg.refdef.x = (cgs.glconfig.vidWidth - cg.refdef.width)/2;
ADDRGP4 cg+236804
ADDRGP4 cgs+20100+11304
INDIRI4
ADDRGP4 cg+236804+8
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 203
;203:	cg.refdef.y = (cgs.glconfig.vidHeight - cg.refdef.height)/2;
ADDRGP4 cg+236804+4
ADDRGP4 cgs+20100+11308
INDIRI4
ADDRGP4 cg+236804+12
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 204
;204:}
LABELV $233
endproc CG_CalcVrect 12 8
proc CG_OffsetVRThirdPersonView 100 16
line 216
;205:
;206://==============================================================================
;207:
;208:
;209:/*
;210:===============
;211:CG_OffsetVRThirdPersonView
;212:
;213:===============
;214:*/
;215:#ifdef USE_DEATHCAM
;216:static void CG_OffsetVRThirdPersonView(void) {
line 217
;217:	float scale = 1.0f;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 220
;218:	vec3_t position;
;219:	playerState_t	*ps;
;220:	ps = &cg.predictedPlayerState;
ADDRLP4 16
ADDRGP4 cg+234796
ASGNP4
line 222
;221:
;222:	VR_get_client_HMD_position(position);
ADDRLP4 0
ARGP4
ADDRGP4 VR_get_client_HMD_position
CALLV
pop
line 225
;223:
;224:	//Follow mode 1
;225:	if (cg.demoPlayback || CG_IsFollowMode( EF_FM_THIRDPERSON_1 ))
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $275
CNSTI4 16
ARGI4
ADDRLP4 20
ADDRGP4 CG_IsFollowMode
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $272
LABELV $275
line 226
;226:	{
line 228
;227:		vec3_t current;
;228:		scale *= SPECTATOR_WORLDSCALE_MULTIPLIER;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1092616192
MULF4
ASGNF4
line 230
;229:		//Check to see if the followed player has moved far enough away to mean we should update our location
;230:		VectorSubtract(cg.refdef.vieworg, cg.vr_vieworigin, current);
ADDRLP4 24
ADDRGP4 cg+236804+24
INDIRF4
ADDRGP4 cg+282980
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRGP4 cg+236804+24+4
INDIRF4
ADDRGP4 cg+282980+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRGP4 cg+236804+24+8
INDIRF4
ADDRGP4 cg+282980+8
INDIRF4
SUBF4
ASGNF4
line 231
;231:		current[2] = 0;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 232
;232:		if (VectorLength(current) > 400)
ADDRLP4 24
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 1137180672
LEF4 $273
line 233
;233:		{
line 235
;234:			vec3_t angles, forward, right, up;
;235:			VectorCopy(cg.refdef.vieworg, cg.vr_vieworigin);
ADDRGP4 cg+282980
ADDRGP4 cg+236804+24
INDIRB
ASGNB 12
line 241
;236:
;237:			//Move behind the player
;238:#ifdef USE_NATIVE_HACK
;239:			VectorCopy(vrinfo->clientviewangles, angles);
;240:#else
;241:			VectorCopy(ps->viewangles, angles);
ADDRLP4 52
ADDRLP4 16
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 243
;242:#endif
;243:			angles[PITCH] = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 244
;244:			AngleVectors(angles, forward, right, up);
ADDRLP4 52
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 245
;245:			VectorMA(cg.vr_vieworigin, -60, forward, cg.vr_vieworigin);
ADDRGP4 cg+282980
ADDRGP4 cg+282980
INDIRF4
ADDRLP4 40
INDIRF4
CNSTF4 3262119936
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+282980+4
ADDRGP4 cg+282980+4
INDIRF4
ADDRLP4 40+4
INDIRF4
CNSTF4 3262119936
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+282980+8
ADDRGP4 cg+282980+8
INDIRF4
ADDRLP4 40+8
INDIRF4
CNSTF4 3262119936
MULF4
ADDF4
ASGNF4
line 246
;246:		}
line 247
;247:	}
ADDRGP4 $273
JUMPV
LABELV $272
line 249
;248:	//Death or follow mode 2
;249:	else if ( CG_IsDeathCam() || CG_IsFollowMode(EF_FM_THIRDPERSON_2) )
ADDRLP4 24
ADDRGP4 CG_IsDeathCam
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $311
CNSTI4 32
ARGI4
ADDRLP4 28
ADDRGP4 CG_IsFollowMode
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $309
LABELV $311
line 250
;250:	{
line 255
;251:		vec3_t angles, forward, right, up;
;252:		float deltaYaw;
;253:		float thumbstick_location[2];
;254:
;255:		scale *= SPECTATOR2_WORLDSCALE_MULTIPLIER;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1106247680
MULF4
ASGNF4
line 257
;256:
;257:		deltaYaw = CG_IsDeathCam() ? SHORT2ANGLE(ps->delta_angles[YAW]) : 0.0f;
ADDRLP4 96
ADDRGP4 CG_IsDeathCam
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $313
ADDRLP4 92
ADDRLP4 16
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1001652224
MULF4
ASGNF4
ADDRGP4 $314
JUMPV
LABELV $313
ADDRLP4 92
CNSTF4 0
ASGNF4
LABELV $314
ADDRLP4 76
ADDRLP4 92
INDIRF4
ASGNF4
line 268
;258:
;259:#ifdef USE_NATIVE_HACK
;260:		VectorCopy(vrinfo->controllers[SideLEFT].angles.actual, angles);
;261:		angles[YAW] += deltaYaw + (vrinfo->clientviewangles[YAW] - vrinfo->hmdinfo.angles.actual[YAW]);
;262:
;263:		thumbstick_location[0] = vrinfo->thumbstick_location[THUMB_LEFT][0];
;264:		thumbstick_location[1] = vrinfo->thumbstick_location[THUMB_LEFT][1];
;265:#endif
;266:
;267:#ifdef USE_VR_QVM
;268:		VectorCopy(ps->right_hand_angles, angles);
ADDRLP4 64
ADDRLP4 16
INDIRP4
CNSTI4 508
ADDP4
INDIRB
ASGNB 12
line 269
;269:		angles[YAW] += deltaYaw + (cg.refdefViewAngles[YAW] - cg.predictedPlayerState.viewangles[YAW]);
ADDRLP4 64+4
ADDRLP4 64+4
INDIRF4
ADDRLP4 76
INDIRF4
ADDRGP4 cg+237172+4
INDIRF4
ADDRGP4 cg+234796+152+4
INDIRF4
SUBF4
ADDF4
ADDF4
ASGNF4
line 274
;270:
;271:		// GUNNM TODO
;272:		// thumbstick control can't be accessed in non-native VM, to avoid sending 2 float, not essentials, in the snapshot.
;273:		// we could convert x/y to 2 shorts, sent as one integer, using a byte offset.
;274:		thumbstick_location[0] = 0.0f;
ADDRLP4 32
CNSTF4 0
ASGNF4
line 275
;275:		thumbstick_location[1] = 0.0f;
ADDRLP4 32+4
CNSTF4 0
ASGNF4
line 278
;276:#endif
;277:
;278:		AngleVectors(angles, forward, right, up);
ADDRLP4 64
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 80
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 281
;279:
;280:		//Move camera if the user is pushing thumbstick
;281:		VectorMA(cg.vr_vieworigin, thumbstick_location[1] * 5.0f, forward, cg.vr_vieworigin);
ADDRGP4 cg+282980
ADDRGP4 cg+282980
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 32+4
INDIRF4
CNSTF4 1084227584
MULF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+282980+4
ADDRGP4 cg+282980+4
INDIRF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 32+4
INDIRF4
CNSTF4 1084227584
MULF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+282980+8
ADDRGP4 cg+282980+8
INDIRF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 32+4
INDIRF4
CNSTF4 1084227584
MULF4
MULF4
ADDF4
ASGNF4
line 282
;282:		VectorMA(cg.vr_vieworigin, thumbstick_location[0] * 5.0f, right, cg.vr_vieworigin);
ADDRGP4 cg+282980
ADDRGP4 cg+282980
INDIRF4
ADDRLP4 52
INDIRF4
ADDRLP4 32
INDIRF4
CNSTF4 1084227584
MULF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+282980+4
ADDRGP4 cg+282980+4
INDIRF4
ADDRLP4 52+4
INDIRF4
ADDRLP4 32
INDIRF4
CNSTF4 1084227584
MULF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+282980+8
ADDRGP4 cg+282980+8
INDIRF4
ADDRLP4 52+8
INDIRF4
ADDRLP4 32
INDIRF4
CNSTF4 1084227584
MULF4
MULF4
ADDF4
ASGNF4
line 283
;283:	}
LABELV $309
LABELV $273
line 286
;284:
;285:	
;286:	CG_ConvertFromVR(position, NULL, position);
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_ConvertFromVR
CALLV
pop
line 287
;287:	position[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 288
;288:	VectorScale(position, scale, position);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 289
;289:	VectorAdd(cg.vr_vieworigin, position, cg.refdef.vieworg);
ADDRGP4 cg+236804+24
ADDRGP4 cg+282980
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRGP4 cg+236804+24+4
ADDRGP4 cg+282980+4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRGP4 cg+236804+24+8
ADDRGP4 cg+282980+8
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 290
;290:}
LABELV $270
endproc CG_OffsetVRThirdPersonView 100 16
data
align 4
LABELV $370
byte 4 3229614080
byte 4 3229614080
byte 4 3229614080
align 4
LABELV $371
byte 4 1082130432
byte 4 1082130432
byte 4 1082130432
code
proc CG_OffsetThirdPersonView 180 28
line 301
;291:#endif
;292:
;293:
;294:/*
;295:===============
;296:CG_OffsetThirdPersonView
;297:
;298:===============
;299:*/
;300:#define	FOCUS_DISTANCE	512
;301:static void CG_OffsetThirdPersonView( void ) {
line 312
;302:	vec3_t		forward, right, up;
;303:	vec3_t		view;
;304:	vec3_t		focusAngles;
;305:	trace_t		trace;
;306:	static vec3_t	mins = { -4, -4, -4 };
;307:	static vec3_t	maxs = { 4, 4, 4 };
;308:	vec3_t		focusPoint;
;309:	float		focusDist;
;310:	float		forwardScale, sideScale;
;311:
;312:	cg.refdef.vieworg[2] += cg.predictedPlayerState.viewheight;
ADDRLP4 140
ADDRGP4 cg+236804+24+8
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
ADDRGP4 cg+234796+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 314
;313:
;314:	VectorCopy( cg.refdefViewAngles, focusAngles );
ADDRLP4 56
ADDRGP4 cg+237172
INDIRB
ASGNB 12
line 323
;315:
;316:#ifndef USE_DEATHCAM
;317:	// if dead, look at killer
;318:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) {
;319:		focusAngles[YAW] = cg.predictedPlayerState.stats[STAT_DEAD_YAW];
;320:		cg.refdefViewAngles[YAW] = cg.predictedPlayerState.stats[STAT_DEAD_YAW];
;321:	}
;322:#endif
;323:	if ( focusAngles[PITCH] > 45 ) {
ADDRLP4 56
INDIRF4
CNSTF4 1110704128
LEF4 $378
line 324
;324:		focusAngles[PITCH] = 45;		// don't go too far overhead
ADDRLP4 56
CNSTF4 1110704128
ASGNF4
line 325
;325:	}
LABELV $378
line 326
;326:	AngleVectors( focusAngles, forward, NULL, NULL );
ADDRLP4 56
ARGP4
ADDRLP4 24
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 328
;327:
;328:	VectorMA( cg.refdef.vieworg, FOCUS_DISTANCE, forward, focusPoint );
ADDRLP4 12
ADDRGP4 cg+236804+24
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1140850688
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRGP4 cg+236804+24+4
INDIRF4
ADDRLP4 24+4
INDIRF4
CNSTF4 1140850688
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 cg+236804+24+8
INDIRF4
ADDRLP4 24+8
INDIRF4
CNSTF4 1140850688
MULF4
ADDF4
ASGNF4
line 330
;329:
;330:	VectorCopy( cg.refdef.vieworg, view );
ADDRLP4 0
ADDRGP4 cg+236804+24
INDIRB
ASGNB 12
line 332
;331:
;332:	view[2] += 8;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 334
;333:
;334:	cg.refdefViewAngles[PITCH] *= 0.5;
ADDRLP4 144
ADDRGP4 cg+237172
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 336
;335:
;336:	AngleVectors( cg.refdefViewAngles, forward, right, up );
ADDRGP4 cg+237172
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 338
;337:
;338:	forwardScale = cos( cg_thirdPersonAngle.value / 180 * M_PI );
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
CNSTF4 1016003125
MULF4
ARGF4
ADDRLP4 148
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 148
INDIRF4
ASGNF4
line 339
;339:	sideScale = sin( cg_thirdPersonAngle.value / 180 * M_PI );
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
CNSTF4 1016003125
MULF4
ARGF4
ADDRLP4 152
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 52
ADDRLP4 152
INDIRF4
ASGNF4
line 340
;340:	VectorMA( view, -cg_thirdPersonRange.value * forwardScale, forward, view );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 48
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 48
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 48
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 341
;341:	VectorMA( view, -cg_thirdPersonRange.value * sideScale, right, view );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 52
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 52
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 52
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 346
;342:
;343:	// trace a ray from the origin to the viewpoint to make sure the view isn't
;344:	// in a solid block.  Use an 8 by 8 block to prevent the view from near clipping anything
;345:
;346:	if (!cg_cameraMode.integer) {
ADDRGP4 cg_cameraMode+12
INDIRI4
CNSTI4 0
NEI4 $417
line 347
;347:		CG_Trace( &trace, cg.refdef.vieworg, mins, maxs, view, cg.predictedPlayerState.clientNum, MASK_SOLID );
ADDRLP4 72
ARGP4
ADDRGP4 cg+236804+24
ARGP4
ADDRGP4 $370
ARGP4
ADDRGP4 $371
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 cg+234796+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 349
;348:
;349:		if ( trace.fraction != 1.0 ) {
ADDRLP4 72+8
INDIRF4
CNSTF4 1065353216
EQF4 $424
line 350
;350:			VectorCopy( trace.endpos, view );
ADDRLP4 0
ADDRLP4 72+12
INDIRB
ASGNB 12
line 351
;351:			view[2] += (1.0 - trace.fraction) * 32;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 72+8
INDIRF4
SUBF4
CNSTF4 1107296256
MULF4
ADDF4
ASGNF4
line 355
;352:			// try another trace to this position, because a tunnel may have the ceiling
;353:			// close enough that this is poking out
;354:
;355:			CG_Trace( &trace, cg.refdef.vieworg, mins, maxs, view, cg.predictedPlayerState.clientNum, MASK_SOLID );
ADDRLP4 72
ARGP4
ADDRGP4 cg+236804+24
ARGP4
ADDRGP4 $370
ARGP4
ADDRGP4 $371
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 cg+234796+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 356
;356:			VectorCopy( trace.endpos, view );
ADDRLP4 0
ADDRLP4 72+12
INDIRB
ASGNB 12
line 357
;357:		}
LABELV $424
line 358
;358:	}
LABELV $417
line 361
;359:
;360:
;361:	VectorCopy( view, cg.refdef.vieworg );
ADDRGP4 cg+236804+24
ADDRLP4 0
INDIRB
ASGNB 12
line 364
;362:
;363:	// select pitch to look at focus point from vieword
;364:	VectorSubtract( focusPoint, cg.refdef.vieworg, focusPoint );
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRGP4 cg+236804+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRGP4 cg+236804+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRGP4 cg+236804+24+8
INDIRF4
SUBF4
ASGNF4
line 365
;365:	focusDist = sqrt( focusPoint[0] * focusPoint[0] + focusPoint[1] * focusPoint[1] );
ADDRLP4 164
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 164
INDIRF4
ADDRLP4 164
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 168
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 68
ADDRLP4 168
INDIRF4
ASGNF4
line 366
;366:	if ( focusDist < 1 ) {
ADDRLP4 68
INDIRF4
CNSTF4 1065353216
GEF4 $451
line 367
;367:		focusDist = 1;	// should never happen
ADDRLP4 68
CNSTF4 1065353216
ASGNF4
line 368
;368:	}
LABELV $451
line 369
;369:	cg.refdefViewAngles[PITCH] = -180 / M_PI * atan2( focusPoint[2], focusDist );
ADDRLP4 12+8
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 172
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRGP4 cg+237172
ADDRLP4 172
INDIRF4
CNSTF4 3261411041
MULF4
ASGNF4
line 370
;370:	cg.refdefViewAngles[YAW] -= cg_thirdPersonAngle.value;
ADDRLP4 176
ADDRGP4 cg+237172+4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRF4
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
SUBF4
ASGNF4
line 371
;371:}
LABELV $369
endproc CG_OffsetThirdPersonView 180 28
proc CG_StepOffset 8 0
line 375
;372:
;373:
;374:// this causes a compiler bug on mac MrC compiler
;375:static void CG_StepOffset( void ) {
line 379
;376:	int		timeDelta;
;377:	
;378:	// smooth out stair climbing
;379:	timeDelta = cg.time - cg.stepTime;
ADDRLP4 0
ADDRGP4 cg+234764
INDIRI4
ADDRGP4 cg+236684
INDIRI4
SUBI4
ASGNI4
line 380
;380:	if ( timeDelta < STEP_TIME ) {
ADDRLP4 0
INDIRI4
CNSTI4 200
GEI4 $461
line 381
;381:		cg.refdef.vieworg[2] -= cg.stepChange 
ADDRLP4 4
ADDRGP4 cg+236804+24+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cg+236680
INDIRF4
CNSTI4 200
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1000593162
MULF4
SUBF4
ASGNF4
line 383
;382:			* (STEP_TIME - timeDelta) / STEP_TIME;
;383:	}
LABELV $461
line 384
;384:}
LABELV $458
endproc CG_StepOffset 8 0
proc CG_OffsetFirstPersonView 84 4
line 392
;385:
;386:/*
;387:===============
;388:CG_OffsetFirstPersonView
;389:
;390:===============
;391:*/
;392:static void CG_OffsetFirstPersonView( void ) {
line 402
;393:	float			*origin;
;394:	float			*angles; // head / view Angles
;395:	float			bob;
;396:	float			ratio;
;397:	float			delta;
;398:	float			speed;
;399:	float			f;
;400:	vec3_t			predictedVelocity;
;401:	int				timeDelta;
;402:	float			hitRollCoeff = 1.0f;
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
line 404
;403:
;404:	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $468
line 405
;405:		return;
ADDRGP4 $467
JUMPV
LABELV $468
line 408
;406:	}
;407:
;408:	origin = cg.refdef.vieworg;
ADDRLP4 0
ADDRGP4 cg+236804+24
ASGNP4
line 409
;409:	angles = cg.refdefViewAngles;
ADDRLP4 4
ADDRGP4 cg+237172
ASGNP4
line 433
;410:
;411:#ifndef USE_DEATHCAM
;412:	// if dead, fix the angle and don't add any kick
;413:	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) {
;414:		if ( !cg.vr_controller_type )
;415:		{
;416:			// not VR client
;417:			angles[ROLL] = 40;
;418:			angles[PITCH] = -15;
;419:			angles[YAW] = cg.snap->ps.stats[STAT_DEAD_YAW];
;420:			origin[2] += cg.predictedPlayerState.viewheight;
;421:		}
;422:		else {
;423:			// VR client
;424:			VectorCopy(cg.vr_vieworigin, origin);
;425:			//GUNNM TODO remove the "cg.refdef.vieworg[2] += cg.predictedPlayerState.viewheight;" at the begining of CG_OffsetThirdPersonView ?
;426:			origin[2] -= cg.predictedPlayerState.viewheight;
;427:		}
;428:		return;
;429:	}
;430:#endif
;431:	
;432:#ifdef USE_DEATHCAM
;433:	hitRollCoeff = trap_Cvar_VariableValue("vr_rollWhenHit");
ADDRGP4 $474
ARGP4
ADDRLP4 48
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 48
INDIRF4
ASGNF4
line 437
;434:#endif
;435:
;436:	// add angles based on weapon kick
;437:	VectorAdd( angles, cg.kick_angles, angles );
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cg+245704
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 cg+245704+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 cg+245704+8
INDIRF4
ADDF4
ASGNF4
line 441
;438:
;439:	// add angles based on damage kick
;440:#ifdef USE_VR
;441:	if ( !cg.vr_controller_type )
ADDRGP4 cg+282972
INDIRI4
CNSTI4 0
NEI4 $480
line 443
;442:#endif
;443:	{
line 447
;444:		//--------------
;445:		// not VR client
;446:		//--------------
;447:		if ( cg.damageTime ) {
ADDRGP4 cg+245648
INDIRI4
CNSTI4 0
EQI4 $483
line 448
;448:			ratio = cg.time - cg.damageTime;
ADDRLP4 44
ADDRGP4 cg+234764
INDIRI4
ADDRGP4 cg+245648
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 449
;449:			if ( ratio < DAMAGE_DEFLECT_TIME ) {
ADDRLP4 44
INDIRF4
CNSTF4 1120403456
GEF4 $488
line 450
;450:				ratio /= DAMAGE_DEFLECT_TIME;
ADDRLP4 44
ADDRLP4 44
INDIRF4
CNSTF4 1008981770
MULF4
ASGNF4
line 451
;451:				angles[PITCH] += ratio * cg.v_dmg_pitch * hitRollCoeff;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 44
INDIRF4
ADDRGP4 cg+245696
INDIRF4
MULF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ASGNF4
line 452
;452:				angles[ROLL] += ratio * cg.v_dmg_roll * hitRollCoeff;
ADDRLP4 68
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 44
INDIRF4
ADDRGP4 cg+245700
INDIRF4
MULF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ASGNF4
line 453
;453:			} else {
ADDRGP4 $489
JUMPV
LABELV $488
line 454
;454:				ratio = 1.0 - ( ratio - DAMAGE_DEFLECT_TIME ) / DAMAGE_RETURN_TIME;
ADDRLP4 44
CNSTF4 1065353216
ADDRLP4 44
INDIRF4
CNSTF4 1120403456
SUBF4
CNSTF4 992204554
MULF4
SUBF4
ASGNF4
line 455
;455:				if ( ratio > 0 ) {
ADDRLP4 44
INDIRF4
CNSTF4 0
LEF4 $492
line 456
;456:					angles[PITCH] += ratio * cg.v_dmg_pitch * hitRollCoeff;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 44
INDIRF4
ADDRGP4 cg+245696
INDIRF4
MULF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ASGNF4
line 457
;457:					angles[ROLL] += ratio * cg.v_dmg_roll * hitRollCoeff;
ADDRLP4 68
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 44
INDIRF4
ADDRGP4 cg+245700
INDIRF4
MULF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ASGNF4
line 458
;458:				}
LABELV $492
line 459
;459:			}
LABELV $489
line 460
;460:		}
LABELV $483
line 471
;461:
;462:		// add pitch based on fall kick
;463:#if 0
;464:		ratio = ( cg.time - cg.landTime) / FALL_TIME;
;465:		if (ratio < 0)
;466:			ratio = 0;
;467:		angles[PITCH] += ratio * cg.fall_value;
;468:#endif
;469:
;470:		// add angles based on velocity
;471:		VectorCopy( cg.predictedPlayerState.velocity, predictedVelocity );
ADDRLP4 16
ADDRGP4 cg+234796+32
INDIRB
ASGNB 12
line 473
;472:
;473:		delta = DotProduct ( predictedVelocity, cg.refdef.viewaxis[0]);
ADDRLP4 8
ADDRLP4 16
INDIRF4
ADDRGP4 cg+236804+36
INDIRF4
MULF4
ADDRLP4 16+4
INDIRF4
ADDRGP4 cg+236804+36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 16+8
INDIRF4
ADDRGP4 cg+236804+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 474
;474:		angles[PITCH] += delta * cg_runpitch.value;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 cg_runpitch+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 476
;475:
;476:		delta = DotProduct ( predictedVelocity, cg.refdef.viewaxis[1]);
ADDRLP4 8
ADDRLP4 16
INDIRF4
ADDRGP4 cg+236804+36+12
INDIRF4
MULF4
ADDRLP4 16+4
INDIRF4
ADDRGP4 cg+236804+36+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 16+8
INDIRF4
ADDRGP4 cg+236804+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 477
;477:		angles[ROLL] -= delta * cg_runroll.value;
ADDRLP4 68
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 cg_runroll+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 482
;478:
;479:		// add angles based on bob
;480:
;481:		// make sure the bob is visible even at low speeds
;482:		speed = cg.xyspeed > 200 ? cg.xyspeed : 200;
ADDRGP4 cg+245736
INDIRF4
CNSTF4 1128792064
LEF4 $526
ADDRLP4 72
ADDRGP4 cg+245736
INDIRF4
ASGNF4
ADDRGP4 $527
JUMPV
LABELV $526
ADDRLP4 72
CNSTF4 1128792064
ASGNF4
LABELV $527
ADDRLP4 36
ADDRLP4 72
INDIRF4
ASGNF4
line 484
;483:
;484:		delta = cg.bobfracsin * cg_bobpitch.value * speed;
ADDRLP4 8
ADDRGP4 cg+245728
INDIRF4
ADDRGP4 cg_bobpitch+8
INDIRF4
MULF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 485
;485:		if ( cg.predictedPlayerState.pm_flags & PMF_DUCKED )
ADDRGP4 cg+234796+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $530
line 486
;486:			delta *= 3;		// crouching
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1077936128
MULF4
ASGNF4
LABELV $530
line 487
;487:		angles[PITCH] += delta;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ASGNF4
line 488
;488:		delta = cg.bobfracsin * cg_bobroll.value * speed;
ADDRLP4 8
ADDRGP4 cg+245728
INDIRF4
ADDRGP4 cg_bobroll+8
INDIRF4
MULF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 489
;489:		if ( cg.predictedPlayerState.pm_flags & PMF_DUCKED )
ADDRGP4 cg+234796+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $536
line 490
;490:			delta *= 3;		// crouching accentuates roll
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1077936128
MULF4
ASGNF4
LABELV $536
line 491
;491:		if ( cg.bobcycle & 1 )
ADDRGP4 cg+245732
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $540
line 492
;492:			delta = -delta;
ADDRLP4 8
ADDRLP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $540
line 493
;493:		angles[ROLL] += delta;
ADDRLP4 80
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ASGNF4
line 494
;494:	}
LABELV $480
line 498
;495:
;496:	// add view height
;497:#ifdef USE_VR
;498:	if ( cg.vr_controller_type > 0 )
ADDRGP4 cg+282972
INDIRI4
CNSTI4 0
LEI4 $543
line 499
;499:	{
line 504
;500:		//--------------
;501:		// VR client
;502:		//--------------
;503:		// add view height calculated from model's head height, in cg_view.c/CG_GetModelHeight()
;504:		if ( cg.predictedPlayerState.pm_flags & PMF_DUCKED ) {
ADDRGP4 cg+234796+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $546
line 506
;505:			//origin[2] = CROUCH_VIEWHEIGHT;
;506:			origin[2] += cg.heightCrouch;
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRGP4 cg+282964
INDIRF4
ADDF4
ASGNF4
line 507
;507:		}
ADDRGP4 $547
JUMPV
LABELV $546
line 508
;508:		else {
line 509
;509:			origin[2] += cg.heightStand;
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRGP4 cg+282960
INDIRF4
ADDF4
ASGNF4
line 510
;510:		}
LABELV $547
line 513
;511:
;512:		// adjust to be in head (only Sarge was tested)
;513:		origin[2] += 8; //5 is more eyes level, but shoulders are anoying
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 514
;514:	}
ADDRGP4 $544
JUMPV
LABELV $543
line 517
;515:	else
;516:#endif
;517:	{
line 521
;518:		//--------------
;519:		// not VR client
;520:		//--------------
;521:		origin[2] += cg.predictedPlayerState.viewheight;
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRGP4 cg+234796+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 522
;522:	}
LABELV $544
line 525
;523:
;524:	// smooth out duck height changes
;525:	timeDelta = cg.time - cg.duckTime;
ADDRLP4 28
ADDRGP4 cg+234764
INDIRI4
ADDRGP4 cg+236692
INDIRI4
SUBI4
ASGNI4
line 528
;526:
;527:	// fixme: use cg.heightCrouch
;528:	if ( timeDelta < DUCK_TIME ) {
ADDRLP4 28
INDIRI4
CNSTI4 100
GEI4 $556
line 530
;529:#ifdef USE_VR
;530:		if ( !cg.vr_controller_type )
ADDRGP4 cg+282972
INDIRI4
CNSTI4 0
NEI4 $558
line 532
;531:			// VR client
;532:			origin[2] -= cg.duckChange
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRGP4 cg+236688
INDIRF4
CNSTI4 100
ADDRLP4 28
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1008981770
MULF4
SUBF4
ASGNF4
ADDRGP4 $559
JUMPV
LABELV $558
line 537
;533:				* (DUCK_TIME - timeDelta) / DUCK_TIME;
;534:		else
;535:#endif
;536:			// not VR client
;537:			cg.refdef.vieworg[2] -= cg.duckChange
ADDRLP4 68
ADDRGP4 cg+236804+24+8
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRGP4 cg+236688
INDIRF4
CNSTI4 100
ADDRLP4 28
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1008981770
MULF4
SUBF4
ASGNF4
LABELV $559
line 539
;538:				* (DUCK_TIME - timeDelta) / DUCK_TIME;
;539:	}
LABELV $556
line 542
;540:
;541:	// add bob height
;542:	bob = cg.bobfracsin * cg.xyspeed * cg_bobup.value;
ADDRLP4 12
ADDRGP4 cg+245728
INDIRF4
ADDRGP4 cg+245736
INDIRF4
MULF4
ADDRGP4 cg_bobup+8
INDIRF4
MULF4
ASGNF4
line 543
;543:	if (bob > 6) {
ADDRLP4 12
INDIRF4
CNSTF4 1086324736
LEF4 $569
line 544
;544:		bob = 6;
ADDRLP4 12
CNSTF4 1086324736
ASGNF4
line 545
;545:	}
LABELV $569
line 547
;546:
;547:	origin[2] += bob;
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
line 550
;548:
;549:	// add fall height
;550:	delta = cg.time - cg.landTime;
ADDRLP4 8
ADDRGP4 cg+234764
INDIRI4
ADDRGP4 cg+236700
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 551
;551:	if (delta < LAND_DEFLECT_TIME) {
ADDRLP4 8
INDIRF4
CNSTF4 1125515264
GEF4 $573
line 552
;552:		f = delta / LAND_DEFLECT_TIME;
ADDRLP4 40
ADDRLP4 8
INDIRF4
CNSTF4 1004172302
MULF4
ASGNF4
line 556
;553:
;554:#ifdef USE_VR
;555:		// VR client
;556:		if ( cg.vr_controller_type > 0)
ADDRGP4 cg+282972
INDIRI4
CNSTI4 0
LEI4 $575
line 557
;557:			origin[2] += cg.landChange * f;
ADDRLP4 68
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRGP4 cg+236696
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $574
JUMPV
LABELV $575
line 561
;558:		else
;559:#endif
;560:			// Not VR client
;561:			cg.refdef.vieworg[2] += cg.landChange * f;
ADDRLP4 72
ADDRGP4 cg+236804+24+8
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRGP4 cg+236696
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ASGNF4
line 562
;562:	}
ADDRGP4 $574
JUMPV
LABELV $573
line 563
;563:	else if ( delta < LAND_DEFLECT_TIME + LAND_RETURN_TIME ) {
ADDRLP4 8
INDIRF4
CNSTF4 1138819072
GEF4 $583
line 564
;564:		delta -= LAND_DEFLECT_TIME;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1125515264
SUBF4
ASGNF4
line 565
;565:		f = 1.0 - ( delta / LAND_RETURN_TIME );
ADDRLP4 40
CNSTF4 1065353216
ADDRLP4 8
INDIRF4
CNSTF4 995783694
MULF4
SUBF4
ASGNF4
line 568
;566:		
;567:#ifdef USE_VR
;568:		if ( cg.vr_controller_type > 0 )
ADDRGP4 cg+282972
INDIRI4
CNSTI4 0
LEI4 $585
line 570
;569:			// VR client
;570:			origin[2] += cg.landChange * f;
ADDRLP4 68
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRGP4 cg+236696
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $586
JUMPV
LABELV $585
line 574
;571:		else
;572:#endif
;573:			// not VR client
;574:			cg.refdef.vieworg[2] += cg.landChange * f;
ADDRLP4 72
ADDRGP4 cg+236804+24+8
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRGP4 cg+236696
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $586
line 576
;575:
;576:	}
LABELV $583
LABELV $574
line 579
;577:
;578:	// add step offset
;579:	CG_StepOffset();
ADDRGP4 CG_StepOffset
CALLV
pop
line 582
;580:
;581:	// add kick offset
;582:	VectorAdd (origin, cg.kick_origin, origin);
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRGP4 cg+245716
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 cg+245716+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 cg+245716+8
INDIRF4
ADDF4
ASGNF4
line 595
;583:
;584:	// pivot the eye based on a neck length
;585:#if 0
;586:	{
;587:	vec3_t			forward, up;
;588:
;589:	cg.refdef.vieworg[2] -= NECK_LENGTH;
;590:	AngleVectors( cg.refdefViewAngles, forward, NULL, up );
;591:	VectorMA( cg.refdef.vieworg, 3, forward, cg.refdef.vieworg );
;592:	VectorMA( cg.refdef.vieworg, NECK_LENGTH, up, cg.refdef.vieworg );
;593:	}
;594:#endif
;595:}
LABELV $467
endproc CG_OffsetFirstPersonView 84 4
export CG_ZoomDown_f
proc CG_ZoomDown_f 0 0
line 599
;596:
;597://======================================================================
;598:
;599:void CG_ZoomDown_f( void ) { 
line 600
;600:	if ( cg.zoomed ) {
ADDRGP4 cg+237196
INDIRI4
CNSTI4 0
EQI4 $599
line 601
;601:		return;
ADDRGP4 $598
JUMPV
LABELV $599
line 603
;602:	}
;603:	cg.zoomed = qtrue;
ADDRGP4 cg+237196
CNSTI4 1
ASGNI4
line 604
;604:	cg.zoomTime = cg.time;
ADDRGP4 cg+237200
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 605
;605:}
LABELV $598
endproc CG_ZoomDown_f 0 0
export CG_ZoomUp_f
proc CG_ZoomUp_f 0 0
line 607
;606:
;607:void CG_ZoomUp_f( void ) { 
line 608
;608:	if ( !cg.zoomed ) {
ADDRGP4 cg+237196
INDIRI4
CNSTI4 0
NEI4 $606
line 609
;609:		return;
ADDRGP4 $605
JUMPV
LABELV $606
line 611
;610:	}
;611:	cg.zoomed = qfalse;
ADDRGP4 cg+237196
CNSTI4 0
ASGNI4
line 612
;612:	cg.zoomTime = cg.time;
ADDRGP4 cg+237200
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 613
;613:}
LABELV $605
endproc CG_ZoomUp_f 0 0
proc CG_CalcFov 52 8
line 626
;614:
;615:
;616:/*
;617:====================
;618:CG_CalcFov
;619:
;620:Fixed fov at intermissions, otherwise account for fov variable and zooms.
;621:====================
;622:*/
;623:#define	WAVE_AMPLITUDE	1
;624:#define	WAVE_FREQUENCY	0.4
;625:
;626:static int CG_CalcFov( void ) {
line 637
;627:	int		contents;
;628:	int		inwater;
;629:#ifndef USE_VR_FOV
;630:	float	x;
;631:	//float	phase;
;632:	float	v;
;633:	float	fov_x, fov_y;
;634:	float	zoomFov;
;635:	float	f;
;636:
;637:	cgs.fov = cg_fov.value;
ADDRGP4 cgs+151656
ADDRGP4 cg_fov+8
INDIRF4
ASGNF4
line 638
;638:	if ( cgs.fov < 1.0 )
ADDRGP4 cgs+151656
INDIRF4
CNSTF4 1065353216
GEF4 $615
line 639
;639:		cgs.fov = 1.0;
ADDRGP4 cgs+151656
CNSTF4 1065353216
ASGNF4
ADDRGP4 $616
JUMPV
LABELV $615
line 640
;640:	else if ( cgs.fov > 160.0 )
ADDRGP4 cgs+151656
INDIRF4
CNSTF4 1126170624
LEF4 $619
line 641
;641:		cgs.fov = 160.0;
ADDRGP4 cgs+151656
CNSTF4 1126170624
ASGNF4
LABELV $619
LABELV $616
line 643
;642:
;643:	cgs.zoomFov = cg_zoomFov.value;
ADDRGP4 cgs+151660
ADDRGP4 cg_zoomFov+8
INDIRF4
ASGNF4
line 644
;644:	if ( cgs.zoomFov < 1.0 )
ADDRGP4 cgs+151660
INDIRF4
CNSTF4 1065353216
GEF4 $625
line 645
;645:		cgs.zoomFov = 1.0;
ADDRGP4 cgs+151660
CNSTF4 1065353216
ASGNF4
ADDRGP4 $626
JUMPV
LABELV $625
line 646
;646:	else if ( cgs.zoomFov > 160.0 )
ADDRGP4 cgs+151660
INDIRF4
CNSTF4 1126170624
LEF4 $629
line 647
;647:		cgs.zoomFov = 160.0;
ADDRGP4 cgs+151660
CNSTF4 1126170624
ASGNF4
LABELV $629
LABELV $626
line 649
;648:
;649:	if ( cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+234796+4
INDIRI4
CNSTI4 5
NEI4 $633
line 651
;650:		// if in intermission, use a fixed value
;651:		fov_x = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
line 652
;652:	} else {
ADDRGP4 $634
JUMPV
LABELV $633
line 654
;653:		// user selectable
;654:		fov_x = cgs.fov;
ADDRLP4 0
ADDRGP4 cgs+151656
INDIRF4
ASGNF4
line 657
;655:
;656:		// account for zooms
;657:		zoomFov = cgs.zoomFov;
ADDRLP4 28
ADDRGP4 cgs+151660
INDIRF4
ASGNF4
line 659
;658:
;659:		if ( cg.zoomed ) {
ADDRGP4 cg+237196
INDIRI4
CNSTI4 0
EQI4 $639
line 660
;660:			f = ( cg.time - cg.zoomTime ) / (float)ZOOM_TIME;
ADDRLP4 24
ADDRGP4 cg+234764
INDIRI4
ADDRGP4 cg+237200
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1004172302
MULF4
ASGNF4
line 661
;661:			if ( f > 1.0 ) {
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
LEF4 $644
line 662
;662:				fov_x = zoomFov;
ADDRLP4 0
ADDRLP4 28
INDIRF4
ASGNF4
line 663
;663:			} else {
ADDRGP4 $640
JUMPV
LABELV $644
line 664
;664:				fov_x = fov_x + f * ( zoomFov - fov_x );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 665
;665:			}
line 666
;666:		} else {
ADDRGP4 $640
JUMPV
LABELV $639
line 667
;667:			f = ( cg.time - cg.zoomTime ) / (float)ZOOM_TIME;
ADDRLP4 24
ADDRGP4 cg+234764
INDIRI4
ADDRGP4 cg+237200
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1004172302
MULF4
ASGNF4
line 668
;668:			if ( f > 1.0 ) {
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
LEF4 $648
line 670
;669:				//fov_x = fov_x;
;670:			} else {
ADDRGP4 $649
JUMPV
LABELV $648
line 671
;671:				fov_x = zoomFov + f * ( fov_x - zoomFov );
ADDRLP4 32
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 32
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 0
INDIRF4
ADDRLP4 32
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 672
;672:			}
LABELV $649
line 673
;673:		}
LABELV $640
line 674
;674:	}
LABELV $634
line 676
;675:
;676:	if ( cg_fovAdjust.integer ) {
ADDRGP4 cg_fovAdjust+12
INDIRI4
CNSTI4 0
EQI4 $650
line 679
;677:		// Based on LordHavoc's code for Darkplaces
;678:		// http://www.quakeworld.nu/forum/topic/53/what-does-your-qw-look-like/page/30
;679:		const float baseAspect = 0.75f; // 3/4
ADDRLP4 32
CNSTF4 1061158912
ASGNF4
line 680
;680:		const float aspect = (float)cg.refdef.width/(float)cg.refdef.height;
ADDRLP4 36
ADDRGP4 cg+236804+8
INDIRI4
CVIF4 4
ADDRGP4 cg+236804+12
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 681
;681:		const float desiredFov = fov_x;
ADDRLP4 40
ADDRLP4 0
INDIRF4
ASGNF4
line 683
;682:
;683:		fov_x = atan2( tan( desiredFov * M_PI / 360.0f ) * baseAspect * aspect, 1 ) * 360.0f / M_PI;
ADDRLP4 40
INDIRF4
CNSTF4 1007614517
MULF4
ARGF4
ADDRLP4 44
ADDRGP4 tan
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 36
INDIRF4
MULF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 48
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 48
INDIRF4
CNSTF4 1122316001
MULF4
ASGNF4
line 684
;684:	}
LABELV $650
line 686
;685:
;686:	x = cg.refdef.width / tan( fov_x / 360 * M_PI );
ADDRLP4 0
INDIRF4
CNSTF4 1007614517
MULF4
ARGF4
ADDRLP4 32
ADDRGP4 tan
CALLF4
ASGNF4
ADDRLP4 16
ADDRGP4 cg+236804+8
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRF4
DIVF4
ASGNF4
line 687
;687:	fov_y = atan2( cg.refdef.height, x );
ADDRGP4 cg+236804+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 36
INDIRF4
ASGNF4
line 688
;688:	fov_y = fov_y * 360 / M_PI;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1122316001
MULF4
ASGNF4
line 691
;689:#endif
;690:	// warp if underwater
;691:	contents = CG_PointContents( cg.refdef.vieworg, -1 );
ADDRGP4 cg+236804+24
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 40
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 40
INDIRI4
ASGNI4
line 692
;692:	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ){
ADDRLP4 8
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $663
line 696
;693:		//phase = cg.time / 1000.0 * WAVE_FREQUENCY * M_PI * 2;
;694:		//v = WAVE_AMPLITUDE * sin( phase );
;695:#ifndef USE_VR_FOV
;696:		v = WAVE_AMPLITUDE * sin( (cg.time % 16419587) / 397.87735f ); // result is very close to original
ADDRGP4 cg+234764
INDIRI4
CNSTI4 16419587
MODI4
CVIF4 4
CNSTF4 992261838
MULF4
ARGF4
ADDRLP4 44
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 44
INDIRF4
CNSTF4 1065353216
MULF4
ASGNF4
line 697
;697:		fov_x += v;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
ADDF4
ASGNF4
line 698
;698:		fov_y -= v;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
ASGNF4
line 700
;699:#endif
;700:		inwater = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 701
;701:	}
ADDRGP4 $664
JUMPV
LABELV $663
line 702
;702:	else {
line 703
;703:		inwater = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 704
;704:	}
LABELV $664
line 708
;705:
;706:#ifndef USE_VR_FOV
;707:	// set it
;708:	cg.refdef.fov_x = fov_x;
ADDRGP4 cg+236804+16
ADDRLP4 0
INDIRF4
ASGNF4
line 709
;709:	cg.refdef.fov_y = fov_y;
ADDRGP4 cg+236804+20
ADDRLP4 4
INDIRF4
ASGNF4
line 726
;710:#else
;711:	//GUNNM TODO : native / qvm / OpenXR
;712:
;713:	// ioq3Quest
;714:	//cg.refdef.fov_x = vrinfo->fov_x;
;715:	//cg.refdef.fov_y = vrinfo->fov_y;
;716:
;717:	// OpenXR
;718:	//cg.refdef.fov_x = vr_info.hmdinfo.fov_x;
;719:	//cg.refdef.fov_y = vr_info.hmdinfo.fov_y;
;720:
;721:	// 2D
;722:	cg.refdef.fov_x = 90.;
;723:	cg.refdef.fov_y = 90;
;724:#endif
;725:
;726:	if ( !cg.zoomed ) {
ADDRGP4 cg+237196
INDIRI4
CNSTI4 0
NEI4 $670
line 727
;727:		cg.zoomSensitivity = 1;
ADDRGP4 cg+237204
CNSTF4 1065353216
ASGNF4
line 728
;728:	} else {
ADDRGP4 $671
JUMPV
LABELV $670
line 729
;729:		cg.zoomSensitivity = cg.refdef.fov_y / 75.0;
ADDRGP4 cg+237204
ADDRGP4 cg+236804+20
INDIRF4
CNSTF4 1012560910
MULF4
ASGNF4
line 730
;730:	}
LABELV $671
line 732
;731:
;732:	return inwater;
ADDRLP4 12
INDIRI4
RETI4
LABELV $612
endproc CG_CalcFov 52 8
proc CG_DamageBlendBlob 164 12
line 743
;733:}
;734:
;735:
;736:
;737:/*
;738:===============
;739:CG_DamageBlendBlob
;740:
;741:===============
;742:*/
;743:static void CG_DamageBlendBlob( void ) {
line 748
;744:	int			t;
;745:	int			maxTime;
;746:	refEntity_t		ent;
;747:
;748:	if (!cg_blood.integer) {
ADDRGP4 cg_blood+12
INDIRI4
CNSTI4 0
NEI4 $678
line 749
;749:		return;
ADDRGP4 $677
JUMPV
LABELV $678
line 752
;750:	}
;751:
;752:	if ( !cg.damageValue ) {
ADDRGP4 cg+245660
INDIRF4
CNSTF4 0
NEF4 $681
line 753
;753:		return;
ADDRGP4 $677
JUMPV
LABELV $681
line 761
;754:	}
;755:
;756:	//if (cg.cameraMode) {
;757:	//	return;
;758:	//}
;759:
;760:	// ragePro systems can't fade blends, so don't obscure the screen
;761:	if ( cgs.glconfig.hardwareType == GLHW_RAGEPRO ) {
ADDRGP4 cgs+20100+11288
INDIRI4
CNSTI4 3
NEI4 $684
line 762
;762:		return;
ADDRGP4 $677
JUMPV
LABELV $684
line 765
;763:	}
;764:
;765:	maxTime = DAMAGE_TIME;
ADDRLP4 144
CNSTI4 500
ASGNI4
line 766
;766:	t = cg.time - cg.damageTime;
ADDRLP4 140
ADDRGP4 cg+234764
INDIRI4
ADDRGP4 cg+245648
INDIRI4
SUBI4
ASGNI4
line 767
;767:	if ( t <= 0 || t >= maxTime ) {
ADDRLP4 140
INDIRI4
CNSTI4 0
LEI4 $692
ADDRLP4 140
INDIRI4
ADDRLP4 144
INDIRI4
LTI4 $690
LABELV $692
line 768
;768:		return;
ADDRGP4 $677
JUMPV
LABELV $690
line 772
;769:	}
;770:
;771:
;772:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 773
;773:	ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 774
;774:	ent.renderfx = RF_FIRST_PERSON;
ADDRLP4 0+4
CNSTI4 4
ASGNI4
line 776
;775:
;776:	VectorMA( cg.refdef.vieworg, 8, cg.refdef.viewaxis[0], ent.origin );
ADDRLP4 0+68
ADDRGP4 cg+236804+24
INDIRF4
ADDRGP4 cg+236804+36
INDIRF4
CNSTF4 1090519040
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRGP4 cg+236804+24+4
INDIRF4
ADDRGP4 cg+236804+36+4
INDIRF4
CNSTF4 1090519040
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRGP4 cg+236804+24+8
INDIRF4
ADDRGP4 cg+236804+36+8
INDIRF4
CNSTF4 1090519040
MULF4
ADDF4
ASGNF4
line 777
;777:	VectorMA( ent.origin, cg.damageX * -8, cg.refdef.viewaxis[1], ent.origin );
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
ADDRGP4 cg+236804+36+12
INDIRF4
ADDRGP4 cg+245652
INDIRF4
CNSTF4 3238002688
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRGP4 cg+236804+36+12+4
INDIRF4
ADDRGP4 cg+245652
INDIRF4
CNSTF4 3238002688
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRGP4 cg+236804+36+12+8
INDIRF4
ADDRGP4 cg+245652
INDIRF4
CNSTF4 3238002688
MULF4
MULF4
ADDF4
ASGNF4
line 778
;778:	VectorMA( ent.origin, cg.damageY * 8, cg.refdef.viewaxis[2], ent.origin );
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
ADDRGP4 cg+236804+36+24
INDIRF4
ADDRGP4 cg+245656
INDIRF4
CNSTF4 1090519040
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRGP4 cg+236804+36+24+4
INDIRF4
ADDRGP4 cg+245656
INDIRF4
CNSTF4 1090519040
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRGP4 cg+236804+36+24+8
INDIRF4
ADDRGP4 cg+245656
INDIRF4
CNSTF4 1090519040
MULF4
MULF4
ADDF4
ASGNF4
line 780
;779:
;780:	ent.radius = cg.damageValue * 3;
ADDRLP4 0+132
ADDRGP4 cg+245660
INDIRF4
CNSTF4 1077936128
MULF4
ASGNF4
line 781
;781:	ent.customShader = cgs.media.viewBloodShader;
ADDRLP4 0+112
ADDRGP4 cgs+150560+216
INDIRI4
ASGNI4
line 782
;782:	ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 783
;783:	ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 784
;784:	ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 785
;785:	ent.shaderRGBA[3] = 200 * ( 1.0 - ((float)t / maxTime) );
ADDRLP4 156
CNSTF4 1065353216
ADDRLP4 140
INDIRI4
CVIF4 4
ADDRLP4 144
INDIRI4
CVIF4 4
DIVF4
SUBF4
CNSTF4 1128792064
MULF4
ASGNF4
ADDRLP4 160
CNSTF4 1325400064
ASGNF4
ADDRLP4 156
INDIRF4
ADDRLP4 160
INDIRF4
LTF4 $776
ADDRLP4 152
ADDRLP4 156
INDIRF4
ADDRLP4 160
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $777
JUMPV
LABELV $776
ADDRLP4 152
ADDRLP4 156
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $777
ADDRLP4 0+116+3
ADDRLP4 152
INDIRU4
CVUU1 4
ASGNU1
line 786
;786:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 787
;787:}
LABELV $677
endproc CG_DamageBlendBlob 164 12
data
align 4
LABELV $790
byte 4 3212836864
byte 4 3212836864
byte 4 3212836864
align 4
LABELV $791
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
code
proc CG_CalcViewValues 164 28
line 798
;788:
;789:
;790:/*
;791:===============
;792:CG_CalcViewValues
;793:
;794:Sets cg.refdef view values
;795:
;796:===============
;797:*/
;798:static int CG_CalcViewValues( void ) {
line 815
;799:	playerState_t		*ps;
;800:	vec3_t viewAngles;
;801:
;802:	// GUNNM TODO : refactorisation is needed since the adding of ioq3quest 6Dof
;803:
;804:#ifdef USE_VR
;805:	vec3_t weaponangles, hmdAngles, clientviewangles, calculated_weaponangles;
;806:#endif
;807:
;808:#if defined USE_VR || defined USE_VR_ZOOM
;809:	int vrFlags;
;810:#endif
;811:
;812:	// Recover variables from native structure vr_clientinfo_t
;813:	// or from the last usercommand for classic QVM
;814:
;815:	memset( &cg.refdef, 0, sizeof( cg.refdef ) );
ADDRGP4 cg+236804
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 822
;816:
;817:	// strings for in game rendering
;818:	// Q_strncpyz( cg.refdef.text[0], "Park Ranger", sizeof(cg.refdef.text[0]) );
;819:	// Q_strncpyz( cg.refdef.text[1], "19", sizeof(cg.refdef.text[1]) );
;820:
;821:	// calculate size of 3D view
;822:	CG_CalcVrect();
ADDRGP4 CG_CalcVrect
CALLV
pop
line 824
;823:
;824:	ps = &cg.predictedPlayerState;
ADDRLP4 0
ADDRGP4 cg+234796
ASGNP4
line 827
;825:
;826:#ifdef USE_VR
;827:	VR_get_ps_controller_angles( SideRIGHT, ps, weaponangles );
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 VR_get_ps_controller_angles
CALLV
pop
line 831
;828:#endif
;829:
;830:#if defined USE_VR || defined USE_VR_ZOOM
;831:	vrFlags = VR_get_client_vrFlags();
ADDRLP4 68
ADDRGP4 VR_get_client_vrFlags
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 68
INDIRI4
ASGNI4
line 852
;832:#endif
;833:
;834:#if 0
;835:if (cg.cameraMode) {
;836:		vec3_t origin, angles;
;837:		if (trap_getCameraInfo(cg.time, &origin, &angles)) {
;838:			VectorCopy(origin, cg.refdef.vieworg);
;839:			angles[ROLL] = 0;
;840:			VectorCopy(angles, cg.refdefViewAngles);
;841:			AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
;842:			return CG_CalcFov();
;843:		} else {
;844:			cg.cameraMode = qfalse;
;845:		}
;846:	}
;847:#endif
;848:
;849:	//====================
;850:	// get hmd & ctrl info
;851:	//====================
;852:	cg.vr_controller_type = VR_get_ps_controller_type( ps );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 VR_get_ps_controller_type
CALLI4
ASGNI4
ADDRGP4 cg+282972
ADDRLP4 72
INDIRI4
ASGNI4
line 868
;853:
;854:#ifdef USE_NATIVE_HACK
;855:	VectorCopy(vrinfo->clientviewangles, clientviewangles);
;856:	VectorCopy(vrinfo->hmdinfo.angles.actual, hmdAngles);
;857:	VectorCopy(vrinfo->calculated_weaponangles, calculated_weaponangles);
;858:#endif
;859:#ifdef USE_VR_QVM
;860:	//VectorCopy(ps->viewangles, clientviewangles);
;861:	//VectorCopy(cg.refdefViewAngles, hmdAngles);
;862:	//VectorCopy(vrinfo->calculated_weaponangles, calculated_weaponangles);
;863:#endif
;864:
;865:	//====================
;866:	// intermission view
;867:	//====================
;868:	if ( ps->pm_type == PM_INTERMISSION )
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
NEI4 $783
line 869
;869:	{
line 871
;870:		// Update viewOrg
;871:		VectorCopy( ps->origin, cg.refdef.vieworg );
ADDRGP4 cg+236804+24
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 874
;872:
;873:#ifdef USE_VR
;874:		if ( cg.vr_controller_type >= 2 )
ADDRGP4 cg+282972
INDIRI4
CNSTI4 2
LTI4 $787
line 875
;875:		{
line 881
;876:			static vec3_t	mins = { -1, -1, -1 };
;877:			static vec3_t	maxs = { 1, 1, 1 };
;878:			trace_t			trace;
;879:			vec3_t			forward, end;
;880:
;881:			AngleVectors(ps->viewangles, forward, NULL, NULL);
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 76
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 882
;882:			VectorMA(ps->origin, -80, forward, end);
ADDRLP4 88
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 76
INDIRF4
CNSTF4 3265265664
MULF4
ADDF4
ASGNF4
ADDRLP4 88+4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 76+4
INDIRF4
CNSTF4 3265265664
MULF4
ADDF4
ASGNF4
ADDRLP4 88+8
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 76+8
INDIRF4
CNSTF4 3265265664
MULF4
ADDF4
ASGNF4
line 883
;883:			CG_Trace(&trace, ps->origin, mins, maxs, end, cg.predictedPlayerState.clientNum, MASK_SOLID);
ADDRLP4 100
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRGP4 $790
ARGP4
ADDRGP4 $791
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 cg+234796+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 884
;884:			VectorCopy(trace.endpos, cg.refdef.vieworg);
ADDRGP4 cg+236804+24
ADDRLP4 100+12
INDIRB
ASGNB 12
line 886
;885:			// Update ViewAngles
;886:			VectorCopy(hmdAngles, cg.refdefViewAngles);
ADDRGP4 cg+237172
ADDRLP4 32
INDIRB
ASGNB 12
line 887
;887:			cg.refdefViewAngles[YAW] += ps->viewangles[YAW];
ADDRLP4 160
ADDRGP4 cg+237172+4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ADDF4
ASGNF4
line 888
;888:		}
LABELV $787
line 891
;889:
;890:#ifdef USE_VR_QVM
;891:		VectorCopy( ps->viewangles, cg.refdefViewAngles );
ADDRGP4 cg+237172
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 892
;892:		if ( cg.vr_controller_type ) {
ADDRGP4 cg+282972
INDIRI4
CNSTI4 0
EQI4 $805
line 895
;893:			// VR client
;894:			//realign right arm with view
;895:			VectorCopy(ps->viewangles, cg.refdefVR_RightAngles);
ADDRGP4 cg+237184
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 896
;896:			cg.refdefVR_RightAngles[0] -= ps->right_hand_angles[0];
ADDRLP4 76
ADDRGP4 cg+237184
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
SUBF4
ASGNF4
line 897
;897:		}
LABELV $805
line 901
;898:#endif
;899:
;900:#endif // USE_VR
;901:		AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
ADDRGP4 cg+237172
ARGP4
ADDRGP4 cg+236804+36
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 902
;902:		return CG_CalcFov();
ADDRLP4 76
ADDRGP4 CG_CalcFov
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
RETI4
ADDRGP4 $778
JUMPV
LABELV $783
line 905
;903:	} // PM_INTERMISSION
;904:
;905:	cg.bobcycle = ( ps->bobCycle & 128 ) >> 7;
ADDRGP4 cg+245732
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 7
RSHI4
ASGNI4
line 906
;906:	cg.bobfracsin = fabs( sin( ( ps->bobCycle & 127 ) / 127.0 * M_PI ) );
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 127
BANDI4
CVIF4 4
CNSTF4 1019913509
MULF4
ARGF4
ADDRLP4 76
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 76
INDIRF4
ARGF4
ADDRLP4 80
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRGP4 cg+245728
ADDRLP4 80
INDIRF4
ASGNF4
line 907
;907:	cg.xyspeed = sqrt( ps->velocity[0] * ps->velocity[0] +
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 88
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRGP4 cg+245736
ADDRLP4 88
INDIRF4
ASGNF4
line 910
;908:		ps->velocity[1] * ps->velocity[1] );
;909:
;910:	VectorCopy( ps->origin, cg.refdef.vieworg );
ADDRGP4 cg+236804+24
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 911
;911:	VectorCopy( ps->viewangles, cg.refdefViewAngles );
ADDRGP4 cg+237172
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 914
;912:
;913:#ifdef USE_VR_QVM
;914:	if ( cg.vr_controller_type ) {
ADDRGP4 cg+282972
INDIRI4
CNSTI4 0
EQI4 $819
line 915
;915:		cg.refdefVR_RightAngles[0] -= ps->right_hand_angles[0];
ADDRLP4 92
ADDRGP4 cg+237184
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
SUBF4
ASGNF4
line 916
;916:	}
LABELV $819
line 919
;917:#endif
;918:
;919:	if ( cg_cameraOrbit.integer ) {
ADDRGP4 cg_cameraOrbit+12
INDIRI4
CNSTI4 0
EQI4 $823
line 920
;920:		if (cg.time > cg.nextOrbitTime) {
ADDRGP4 cg+234764
INDIRI4
ADDRGP4 cg+245740
INDIRI4
LEI4 $826
line 921
;921:			cg.nextOrbitTime = cg.time + cg_cameraOrbitDelay.integer;
ADDRGP4 cg+245740
ADDRGP4 cg+234764
INDIRI4
ADDRGP4 cg_cameraOrbitDelay+12
INDIRI4
ADDI4
ASGNI4
line 922
;922:			if ( !cg.vr_controller_type ) // if not VR client
ADDRGP4 cg+282972
INDIRI4
CNSTI4 0
NEI4 $833
line 923
;923:				cg_thirdPersonAngle.value += cg_cameraOrbit.value;
ADDRLP4 92
ADDRGP4 cg_thirdPersonAngle+8
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
ADDRGP4 cg_cameraOrbit+8
INDIRF4
ADDF4
ASGNF4
LABELV $833
line 924
;924:		}
LABELV $826
line 925
;925:	}
LABELV $823
line 927
;926:	// add error decay
;927:	if ( cg_errorDecay.value > 0 ) {
ADDRGP4 cg_errorDecay+8
INDIRF4
CNSTF4 0
LEF4 $838
line 931
;928:		int		t;
;929:		float	f;
;930:
;931:		t = cg.time - cg.predictedErrorTime;
ADDRLP4 96
ADDRGP4 cg+234764
INDIRI4
ADDRGP4 cg+236596
INDIRI4
SUBI4
ASGNI4
line 932
;932:		f = ( cg_errorDecay.value - t ) / cg_errorDecay.value;
ADDRLP4 92
ADDRGP4 cg_errorDecay+8
INDIRF4
ADDRLP4 96
INDIRI4
CVIF4 4
SUBF4
ADDRGP4 cg_errorDecay+8
INDIRF4
DIVF4
ASGNF4
line 933
;933:		if ( f > 0 && f < 1 ) {
ADDRLP4 100
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 100
INDIRF4
CNSTF4 0
LEF4 $845
ADDRLP4 100
INDIRF4
CNSTF4 1065353216
GEF4 $845
line 934
;934:			VectorMA( cg.refdef.vieworg, f, cg.predictedError, cg.refdef.vieworg );
ADDRGP4 cg+236804+24
ADDRGP4 cg+236804+24
INDIRF4
ADDRGP4 cg+236600
INDIRF4
ADDRLP4 92
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+236804+24+4
ADDRGP4 cg+236804+24+4
INDIRF4
ADDRGP4 cg+236600+4
INDIRF4
ADDRLP4 92
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+236804+24+8
ADDRGP4 cg+236804+24+8
INDIRF4
ADDRGP4 cg+236600+8
INDIRF4
ADDRLP4 92
INDIRF4
MULF4
ADDF4
ASGNF4
line 935
;935:		} else {
ADDRGP4 $846
JUMPV
LABELV $845
line 936
;936:			cg.predictedErrorTime = 0;
ADDRGP4 cg+236596
CNSTI4 0
ASGNI4
line 937
;937:		}
LABELV $846
line 938
;938:	}
LABELV $838
line 941
;939:
;940:#ifdef USE_DEATHCAM
;941:	if ( CG_IsDeathCam() || cg.demoPlayback || CG_IsThirdPersonFollowMode_Query() )
ADDRLP4 92
ADDRGP4 CG_IsDeathCam
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $873
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $873
ADDRLP4 96
ADDRGP4 CG_IsThirdPersonFollowMode_Query
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $869
LABELV $873
line 942
;942:	{
line 944
;943:		//If dead, or spectating, view the map from above
;944:		CG_OffsetVRThirdPersonView();
ADDRGP4 CG_OffsetVRThirdPersonView
CALLV
pop
line 945
;945:	}
ADDRGP4 $870
JUMPV
LABELV $869
line 948
;946:	else
;947:#endif
;948:	{
line 950
;949:#ifdef USE_VR
;950:		if ( cg.renderingThirdPerson && !cg.vr_controller_type )
ADDRGP4 cg+234788
INDIRI4
CNSTI4 0
EQI4 $874
ADDRGP4 cg+282972
INDIRI4
CNSTI4 0
NEI4 $874
line 954
;951:#else
;952:		if ( cg.renderingThirdPerson )
;953:#endif
;954:		{
line 956
;955:			// back away from character
;956:			CG_OffsetThirdPersonView();
ADDRGP4 CG_OffsetThirdPersonView
CALLV
pop
line 957
;957:		}
ADDRGP4 $875
JUMPV
LABELV $874
line 959
;958:		else
;959:		{
line 961
;960:			// offset for local bobbing and kicks
;961:			CG_OffsetFirstPersonView();
ADDRGP4 CG_OffsetFirstPersonView
CALLV
pop
line 962
;962:		}
LABELV $875
line 965
;963:
;964:		// Reset this in case we die or follow
;965:		if ( cg.vr_controller_type )
ADDRGP4 cg+282972
INDIRI4
CNSTI4 0
EQI4 $878
line 966
;966:			VectorCopy(cg.refdef.vieworg, cg.vr_vieworigin);
ADDRGP4 cg+282980
ADDRGP4 cg+236804+24
INDIRB
ASGNB 12
LABELV $878
line 967
;967:	}
LABELV $870
line 1105
;968:
;969:
;970:#ifdef USE_NATIVE_HACK
;971:	if ( cg.vr_controller_type >= 2 )
;972:	{
;973:		//=====================================
;974:		//				6 Dof
;975:		//=====================================
;976:		vec3_t weaponorigin, weapon_angles;
;977:		vec3_t forward, end, dir;
;978:		trace_t trace;
;979:
;980:		CG_CalculateWeaponPosition_VR_6Dof( weaponorigin, weapon_angles );
;981:		AngleVectors( weapon_angles, forward, NULL, NULL );
;982:		VectorMA( weaponorigin, 4096, forward, end );
;983:		CG_Trace( &trace, weaponorigin, NULL, NULL, end, cg.predictedPlayerState.clientNum, MASK_SOLID );
;984:
;985:#if defined USE_LASER_SIGHT
;986:		if ( cg_debugWeaponAiming.integer )
;987:		{
;988:			byte colour_yellow[4];
;989:			colour_yellow[0] = 0xff;
;990:			colour_yellow[1] = 0xff;
;991:			colour_yellow[2] = 0x00;
;992:			colour_yellow[3] = 0x40;
;993:
;994:			CG_LaserSight( weaponorigin, trace.endpos, colour_yellow, 1.0f );
;995:		}
;996:#endif
;997:
;998:		if ( cg.predictedPlayerState.pm_flags == PM_SPECTATOR )
;999:		{
;1000:			//=====================================
;1001:			//				Spectating
;1002:			// just take the weapon angles directly
;1003:			//=====================================
;1004:			VectorCopy(weapon_angles, calculated_weaponangles);
;1005:		}
;1006:		else
;1007:		{
;1008:			//=====================================
;1009:			//				Playing
;1010:			//=====================================
;1011:			vec3_t origin;
;1012:			vec3_t forward2, end2;
;1013:			trace_t trace2;
;1014:			float deltaYaw;
;1015:			int timeDelta = cg.time - cg.duckTime;
;1016:
;1017:			VectorSubtract(trace.endpos, cg.refdef.vieworg, dir);
;1018:			vectoangles(dir, calculated_weaponangles);
;1019:
;1020:			VectorCopy(ps->origin, origin);
;1021:			origin[2] += cg.predictedPlayerState.viewheight;
;1022:			
;1023:			if (timeDelta < DUCK_TIME) {
;1024:				origin[2] -= cg.duckChange * (DUCK_TIME - timeDelta) / DUCK_TIME;
;1025:			}
;1026:
;1027:			AngleVectors(calculated_weaponangles, forward2, NULL, NULL);
;1028:
;1029:			VectorMA(origin, 4096, forward2, end2);
;1030:
;1031:			CG_Trace(&trace2, cg.refdef.vieworg, NULL, NULL, end2, cg.predictedPlayerState.clientNum, MASK_SOLID);
;1032:
;1033:#if defined USE_LASER_SIGHT && defined USE_WEAPON_WHEEL
;1034:			if (cg_debugWeaponAiming.integer)
;1035:			{
;1036:				byte colour_green[4];
;1037:				colour_green[0] = 0x00;
;1038:				colour_green[1] = 0xff;
;1039:				colour_green[2] = 0x00;
;1040:				colour_green[3] = 0x40;
;1041:
;1042:				CG_LaserSight(cg.refdef.vieworg, trace2.endpos, colour_green, 1.0f);
;1043:			}
;1044:#endif
;1045:			//=====================================
;1046:			// convert to real-world angles
;1047:			// should be very close to real weapon angles
;1048:			//=====================================
;1049:			deltaYaw = SHORT2ANGLE(cg.predictedPlayerState.delta_angles[YAW]);
;1050:			calculated_weaponangles[YAW] -= (deltaYaw + (clientviewangles[YAW] - hmdAngles[YAW]));
;1051:		}
;1052:
;1053:
;1054:#ifdef USE_NATIVE_HACK
;1055:		VectorCopy(calculated_weaponangles, vrinfo->calculated_weaponangles);
;1056:#endif
;1057:
;1058:	// position eye relative to origin
;1059:#ifdef USE_VR_ZOOM
;1060:		if ( vrFlags & EF_WEAPON_ZOOM ) {
;1061:			//If we are zoomed, then we use the refdefViewANgles (which are the weapon angles)
;1062:			VectorCopy(cg.refdefViewAngles, viewAngles);
;1063:			viewAngles[ROLL] = hmdAngles[ROLL];
;1064:		}
;1065:		else
;1066:#endif
;1067:
;1068:#ifdef USE_DEATHCAM
;1069:		if ( cg.demoPlayback || CG_IsThirdPersonFollowMode_Query() )
;1070:		{
;1071:			//=======================
;1072:			// Following someone
;1073:			// ( or watching demo )
;1074:			//=======================
;1075:			VectorCopy(hmdAngles, viewAngles);
;1076:			viewAngles[YAW] = clientviewangles[YAW];
;1077:		}
;1078:		else
;1079:#endif
;1080:
;1081://#ifdef USE_VR
;1082:		if ( !(cg.snap->ps.pm_flags & PMF_FOLLOW && (vrFlags & EF_FM_FIRSTPERSON) ) )
;1083:		{
;1084:			//=======================
;1085:			//		Playing VR
;1086:			//=======================
;1087:			//We are connected to a multiplayer server, so make the appropriate adjustment to the view
;1088:			//angles as we send orientation to the server that includes the weapon angles
;1089:			float deltaYaw;
;1090:			VectorCopy(hmdAngles, viewAngles);
;1091:			deltaYaw = SHORT2ANGLE(cg.predictedPlayerState.delta_angles[YAW]);
;1092:			viewAngles[YAW] = deltaYaw + clientviewangles[YAW];
;1093:		}
;1094:		else
;1095://#endif
;1096:		{
;1097:			//=======================
;1098:			//		Playing 2D
;1099:			//=======================
;1100:			VectorCopy(cg.refdefViewAngles, viewAngles);
;1101:		}
;1102:	} // 6dof
;1103:	else
;1104:#endif // USE_NATIVE_HACK
;1105:	{
line 1118
;1106:		//=====================================
;1107:		//				3 Dof
;1108:		//=====================================
;1109:#ifdef USE_VR_ZOOM
;1110:		if ( vrFlags & EF_WEAPON_ZOOM ) {
;1111:			viewAngles[ROLL] = hmdAngles[ROLL];
;1112:			viewAngles[PITCH] = weaponangles[PITCH];
;1113:			viewAngles[YAW] = (cg.refdefViewAngles[YAW] - hmdAngles[YAW]) + weaponangles[YAW];
;1114:		}
;1115:		else
;1116:#endif
;1117:#ifdef USE_DEATHCAM
;1118:		if ( cg.demoPlayback || CG_IsThirdPersonFollowMode_Query() )
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $887
ADDRLP4 100
ADDRGP4 CG_IsThirdPersonFollowMode_Query
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $884
LABELV $887
line 1119
;1119:		{
line 1121
;1120:			//If we're following someone,
;1121:			VectorCopy(hmdAngles, viewAngles);
ADDRLP4 4
ADDRLP4 32
INDIRB
ASGNB 12
line 1122
;1122:			viewAngles[YAW] = clientviewangles[YAW];
ADDRLP4 4+4
ADDRLP4 44+4
INDIRF4
ASGNF4
line 1123
;1123:		}
ADDRGP4 $885
JUMPV
LABELV $884
line 1126
;1124:		else
;1125:#endif
;1126:		{
line 1127
;1127:			VectorCopy(cg.refdefViewAngles, viewAngles);
ADDRLP4 4
ADDRGP4 cg+237172
INDIRB
ASGNB 12
line 1128
;1128:		}
LABELV $885
line 1129
;1129:	}
line 1131
;1130:
;1131:	AnglesToAxis( viewAngles, cg.refdef.viewaxis );
ADDRLP4 4
ARGP4
ADDRGP4 cg+236804+36
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1133
;1132:
;1133:	if ( cg.hyperspace ) {
ADDRGP4 cg+234792
INDIRI4
CNSTI4 0
EQI4 $893
line 1134
;1134:		cg.refdef.rdflags |= RDF_NOWORLDMODEL | RDF_HYPERSPACE;
ADDRLP4 100
ADDRGP4 cg+236804+76
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 5
BORI4
ASGNI4
line 1135
;1135:	}
LABELV $893
line 1138
;1136:
;1137:	// field of view
;1138:	return CG_CalcFov();
ADDRLP4 100
ADDRGP4 CG_CalcFov
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
RETI4
LABELV $778
endproc CG_CalcViewValues 164 28
proc CG_PowerupTimerSounds 12 16
line 1147
;1139:}
;1140:
;1141:
;1142:/*
;1143:=====================
;1144:CG_PowerupTimerSounds
;1145:=====================
;1146:*/
;1147:static void CG_PowerupTimerSounds( void ) {
line 1152
;1148:	int		i;
;1149:	int		t;
;1150:
;1151:	// powerup timers going away
;1152:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $899
line 1153
;1153:		t = cg.snap->ps.powerups[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1154
;1154:		if ( t <= cg.time ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+234764
INDIRI4
GTI4 $904
line 1155
;1155:			continue;
ADDRGP4 $900
JUMPV
LABELV $904
line 1157
;1156:		}
;1157:		if ( t - cg.time >= POWERUP_BLINKS * POWERUP_BLINK_TIME ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+234764
INDIRI4
SUBI4
CNSTI4 5000
LTI4 $907
line 1158
;1158:			continue;
ADDRGP4 $900
JUMPV
LABELV $907
line 1160
;1159:		}
;1160:		if ( ( t - cg.time ) / POWERUP_BLINK_TIME != ( t - cg.oldTime ) / POWERUP_BLINK_TIME ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+234764
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ADDRLP4 0
INDIRI4
ADDRGP4 cg+234768
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
EQI4 $910
line 1161
;1161:			trap_S_StartSound( NULL, cg.snap->ps.clientNum, CHAN_ITEM, cgs.media.wearOffSound );
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+150560+592
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1162
;1162:		}
LABELV $910
line 1163
;1163:	}
LABELV $900
line 1152
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $899
line 1164
;1164:}
LABELV $898
endproc CG_PowerupTimerSounds 12 16
export CG_AddBufferedSound
proc CG_AddBufferedSound 0 12
line 1171
;1165:
;1166:/*
;1167:=====================
;1168:CG_AddBufferedSound
;1169:=====================
;1170:*/
;1171:void CG_AddBufferedSound( sfxHandle_t sfx ) {
line 1172
;1172:	if ( !sfx )
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $918
line 1173
;1173:		return;
ADDRGP4 $917
JUMPV
LABELV $918
line 1176
;1174:
;1175:	// clear all buffered sounds
;1176:	if ( sfx == -1 ) {
ADDRFP4 0
INDIRI4
CNSTI4 -1
NEI4 $920
line 1177
;1177:		cg.soundBufferIn = 0;
ADDRGP4 cg+245500
CNSTI4 0
ASGNI4
line 1178
;1178:		cg.soundBufferOut = 0;
ADDRGP4 cg+245504
CNSTI4 0
ASGNI4
line 1179
;1179:		memset( cg.soundBuffer, 0, sizeof( cg.soundBuffer ) );
ADDRGP4 cg+245512
ARGP4
CNSTI4 0
ARGI4
CNSTI4 80
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1180
;1180:		return;
ADDRGP4 $917
JUMPV
LABELV $920
line 1183
;1181:	}
;1182:
;1183:	cg.soundBuffer[cg.soundBufferIn] = sfx;
ADDRGP4 cg+245500
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+245512
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1184
;1184:	cg.soundBufferIn = (cg.soundBufferIn + 1) % MAX_SOUNDBUFFER;
ADDRGP4 cg+245500
ADDRGP4 cg+245500
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 20
MODI4
ASGNI4
line 1185
;1185:	if (cg.soundBufferIn == cg.soundBufferOut) {
ADDRGP4 cg+245500
INDIRI4
ADDRGP4 cg+245504
INDIRI4
NEI4 $930
line 1187
;1186:		//cg.soundBufferOut++;
;1187:		cg.soundBufferOut = (cg.soundBufferOut + 1) % MAX_SOUNDBUFFER;
ADDRGP4 cg+245504
ADDRGP4 cg+245504
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 20
MODI4
ASGNI4
line 1188
;1188:	}
LABELV $930
line 1189
;1189:}
LABELV $917
endproc CG_AddBufferedSound 0 12
proc CG_PlayBufferedSounds 0 8
line 1196
;1190:
;1191:/*
;1192:=====================
;1193:CG_PlayBufferedSounds
;1194:=====================
;1195:*/
;1196:static void CG_PlayBufferedSounds( void ) {
line 1197
;1197:	if ( cg.soundTime < cg.time ) {
ADDRGP4 cg+245508
INDIRI4
ADDRGP4 cg+234764
INDIRI4
GEI4 $937
line 1198
;1198:		if (cg.soundBufferOut != cg.soundBufferIn && cg.soundBuffer[cg.soundBufferOut]) {
ADDRGP4 cg+245504
INDIRI4
ADDRGP4 cg+245500
INDIRI4
EQI4 $941
ADDRGP4 cg+245504
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+245512
ADDP4
INDIRI4
CNSTI4 0
EQI4 $941
line 1199
;1199:			cg.soundPlaying = cg.soundBuffer[cg.soundBufferOut];
ADDRGP4 cg+245592
ADDRGP4 cg+245504
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+245512
ADDP4
INDIRI4
ASGNI4
line 1200
;1200:			trap_S_StartLocalSound( cg.soundPlaying, CHAN_ANNOUNCER );
ADDRGP4 cg+245592
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1201
;1201:			cg.soundBuffer[cg.soundBufferOut] = 0;
ADDRGP4 cg+245504
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+245512
ADDP4
CNSTI4 0
ASGNI4
line 1202
;1202:			cg.soundBufferOut = (cg.soundBufferOut + 1) % MAX_SOUNDBUFFER;
ADDRGP4 cg+245504
ADDRGP4 cg+245504
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 20
MODI4
ASGNI4
line 1203
;1203:			cg.soundTime = cg.time + 750;
ADDRGP4 cg+245508
ADDRGP4 cg+234764
INDIRI4
CNSTI4 750
ADDI4
ASGNI4
line 1204
;1204:		} else {
ADDRGP4 $942
JUMPV
LABELV $941
line 1205
;1205:			cg.soundPlaying = 0;
ADDRGP4 cg+245592
CNSTI4 0
ASGNI4
line 1206
;1206:		}
LABELV $942
line 1207
;1207:	}
LABELV $937
line 1208
;1208:}
LABELV $936
endproc CG_PlayBufferedSounds 0 8
proc CG_FirstFrame 28 12
line 1221
;1209:
;1210://=========================================================================
;1211:
;1212:
;1213:/*
;1214:=================
;1215:CG_FirstFrame
;1216:
;1217:Called once on first rendered frame
;1218:=================
;1219:*/
;1220:static void CG_FirstFrame( void )
;1221:{
line 1222
;1222:	CG_SetConfigValues();
ADDRGP4 CG_SetConfigValues
CALLV
pop
line 1224
;1223:
;1224:	cgs.voteTime = atoi( CG_ConfigString( CS_VOTE_TIME ) );
CNSTI4 8
ARGI4
ADDRLP4 0
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+31716
ADDRLP4 4
INDIRI4
ASGNI4
line 1225
;1225:	cgs.voteYes = atoi( CG_ConfigString( CS_VOTE_YES ) );
CNSTI4 10
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+31720
ADDRLP4 12
INDIRI4
ASGNI4
line 1226
;1226:	cgs.voteNo = atoi( CG_ConfigString( CS_VOTE_NO ) );
CNSTI4 11
ARGI4
ADDRLP4 16
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+31724
ADDRLP4 20
INDIRI4
ASGNI4
line 1227
;1227:	Q_strncpyz( cgs.voteString, CG_ConfigString( CS_VOTE_STRING ), sizeof( cgs.voteString ) );
CNSTI4 9
ARGI4
ADDRLP4 24
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRGP4 cgs+31732
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1229
;1228:
;1229:	if ( cgs.voteTime )
ADDRGP4 cgs+31716
INDIRI4
CNSTI4 0
EQI4 $964
line 1230
;1230:		cgs.voteModified = qtrue;
ADDRGP4 cgs+31728
CNSTI4 1
ASGNI4
ADDRGP4 $965
JUMPV
LABELV $964
line 1232
;1231:	else
;1232:		cgs.voteModified = qfalse;
ADDRGP4 cgs+31728
CNSTI4 0
ASGNI4
LABELV $965
line 1233
;1233:}
LABELV $958
endproc CG_FirstFrame 28 12
export CG_DrawActiveFrame
proc CG_DrawActiveFrame 36 16
line 1243
;1234:
;1235:
;1236:/*
;1237:=================
;1238:CG_DrawActiveFrame
;1239:
;1240:Generates and draws a game scene and status information at the given time.
;1241:=================
;1242:*/
;1243:void CG_DrawActiveFrame( int serverTime, stereoFrame_t stereoView, qboolean demoPlayback ) {
line 1246
;1244:	int		inwater;
;1245:
;1246:	cg.time = serverTime;
ADDRGP4 cg+234764
ADDRFP4 0
INDIRI4
ASGNI4
line 1247
;1247:	cg.demoPlayback = demoPlayback;
ADDRGP4 cg+8
ADDRFP4 8
INDIRI4
ASGNI4
line 1250
;1248:
;1249:#ifdef USE_VR
;1250:	cg.stereoView = stereoView;
ADDRGP4 cg+282968
ADDRFP4 4
INDIRI4
ASGNI4
line 1251
;1251:	cg.worldscale = trap_Cvar_VariableValue("vr_worldscale");
ADDRGP4 $974
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 cg+282976
ADDRLP4 4
INDIRF4
ASGNF4
line 1255
;1252:#endif
;1253:
;1254:	// update cvars
;1255:	CG_UpdateCvars();
ADDRGP4 CG_UpdateCvars
CALLV
pop
line 1260
;1256:
;1257:#ifdef USE_DEATHCAM
;1258:	//HACK!! - should change this to a renderer function call
;1259:	//Indicate to renderer whether we are in deathcam mode, We don't want sky in death cam mode
;1260:	trap_Cvar_Set("vr_thirdPersonSpectator", (CG_IsDeathCam() || cg.demoPlayback || CG_IsThirdPersonFollowMode_Query()) ? "1" : "0"	);
ADDRLP4 12
ADDRGP4 CG_IsDeathCam
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $983
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $983
ADDRLP4 16
ADDRGP4 CG_IsThirdPersonFollowMode_Query
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $980
LABELV $983
ADDRLP4 8
ADDRGP4 $977
ASGNP4
ADDRGP4 $981
JUMPV
LABELV $980
ADDRLP4 8
ADDRGP4 $978
ASGNP4
LABELV $981
ADDRGP4 $975
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1265
;1261:#endif
;1262:
;1263:	// if we are only updating the screen as a loading
;1264:	// pacifier, don't even try to read snapshots
;1265:	if ( cg.infoScreenText[0] != 0 ) {
ADDRGP4 cg+237208
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $984
line 1267
;1266:#ifdef USE_NEOHUD
;1267:		CG_ChangeFrameResolution( cgs.glconfig.menuWidth, cgs.glconfig.menuHeight );
ADDRGP4 cgs+20100+11312
INDIRI4
ARGI4
ADDRGP4 cgs+20100+11316
INDIRI4
ARGI4
ADDRGP4 CG_ChangeFrameResolution
CALLV
pop
line 1269
;1268:#endif
;1269:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 1270
;1270:		return;
ADDRGP4 $969
JUMPV
LABELV $984
line 1275
;1271:	}
;1272:
;1273:	// any looped sounds will be respecified as entities
;1274:	// are added to the render list
;1275:	trap_S_ClearLoopingSounds(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 trap_S_ClearLoopingSounds
CALLV
pop
line 1278
;1276:
;1277:	// clear all the render lists
;1278:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 1281
;1279:
;1280:	// set up cg.snap and possibly cg.nextSnap
;1281:	CG_ProcessSnapshots();
ADDRGP4 CG_ProcessSnapshots
CALLV
pop
line 1285
;1282:
;1283:	// if we haven't received any snapshots yet, all
;1284:	// we can draw is the information screen
;1285:	if ( !cg.snap || ( cg.snap->snapFlags & SNAPFLAG_NOT_ACTIVE ) ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $995
ADDRGP4 cg+36
INDIRP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $991
LABELV $995
line 1286
;1286:		CG_ChangeFrameResolution(cgs.glconfig.menuWidth, cgs.glconfig.menuHeight);
ADDRGP4 cgs+20100+11312
INDIRI4
ARGI4
ADDRGP4 cgs+20100+11316
INDIRI4
ARGI4
ADDRGP4 CG_ChangeFrameResolution
CALLV
pop
line 1287
;1287:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 1288
;1288:		return;
ADDRGP4 $969
JUMPV
LABELV $991
line 1292
;1289:	}
;1290:
;1291:	// let the client system know what our weapon and zoom settings are
;1292:	trap_SetUserCmdValue( cg.weaponSelect, cg.zoomSensitivity );
ADDRGP4 cg+236704
INDIRI4
ARGI4
ADDRGP4 cg+237204
INDIRF4
ARGF4
ADDRGP4 trap_SetUserCmdValue
CALLV
pop
line 1294
;1293:
;1294:	if ( cg.clientFrame == 0 )
ADDRGP4 cg
INDIRI4
CNSTI4 0
NEI4 $1002
line 1295
;1295:		CG_FirstFrame();
ADDRGP4 CG_FirstFrame
CALLV
pop
LABELV $1002
line 1299
;1296:
;1297:	// update cg.predictedPlayerState
;1298:	//if ( cg.stereoView == STEREO_LEFT ) // TODO or not?
;1299:	CG_PredictPlayerState();
ADDRGP4 CG_PredictPlayerState
CALLV
pop
line 1305
;1300:
;1301:	// decide on third person view
;1302:#ifndef USE_DEATHCAM
;1303:	cg.renderingThirdPerson = cg_thirdPerson.integer || (cg.snap->ps.stats[STAT_HEALTH] <= 0);
;1304:#else
;1305:	cg.renderingThirdPerson = cg.predictedPlayerState.pm_type == PM_SPECTATOR ||
ADDRGP4 cg+234796+4
INDIRI4
CNSTI4 2
EQI4 $1014
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $1014
ADDRLP4 24
ADDRGP4 CG_IsThirdPersonFollowMode_Query
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $1014
ADDRGP4 cg_thirdPerson+12
INDIRI4
CNSTI4 0
EQI4 $1010
LABELV $1014
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $1011
JUMPV
LABELV $1010
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $1011
ADDRGP4 cg+234788
ADDRLP4 20
INDIRI4
ASGNI4
line 1309
;1306:		cg.demoPlayback || CG_IsThirdPersonFollowMode_Query() || cg_thirdPerson.integer;
;1307:#endif
;1308:
;1309:	CG_TrackClientTeamChange();
ADDRGP4 CG_TrackClientTeamChange
CALLV
pop
line 1312
;1310:
;1311:	// follow killer
;1312:	if ( cg.followTime && cg.followTime < cg.time ) {
ADDRGP4 cg+282940
INDIRI4
CNSTI4 0
EQI4 $1015
ADDRGP4 cg+282940
INDIRI4
ADDRGP4 cg+234764
INDIRI4
GEI4 $1015
line 1313
;1313:		cg.followTime = 0;
ADDRGP4 cg+282940
CNSTI4 0
ASGNI4
line 1314
;1314:		if ( !cg.demoPlayback ) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $1021
line 1315
;1315:			trap_SendConsoleCommand( va( "follow %i\n", cg.followClient ) );
ADDRGP4 $1024
ARGP4
ADDRGP4 cg+282944
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1316
;1316:		}
LABELV $1021
line 1317
;1317:	}
LABELV $1015
line 1320
;1318:
;1319:	// build cg.refdef
;1320:	inwater = CG_CalcViewValues();
ADDRLP4 28
ADDRGP4 CG_CalcViewValues
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
ASGNI4
line 1323
;1321:
;1322:	// first person blend blobs, done after AnglesToAxis
;1323:	if ( !cg.renderingThirdPerson ) {
ADDRGP4 cg+234788
INDIRI4
CNSTI4 0
NEI4 $1026
line 1324
;1324:		CG_DamageBlendBlob();
ADDRGP4 CG_DamageBlendBlob
CALLV
pop
line 1325
;1325:	}
LABELV $1026
line 1328
;1326:
;1327:	// build the render lists
;1328:	if ( !cg.hyperspace ) {
ADDRGP4 cg+234792
INDIRI4
CNSTI4 0
NEI4 $1029
line 1329
;1329:		CG_AddPacketEntities(); // alter calcViewValues, so predicted player state is correct
ADDRGP4 CG_AddPacketEntities
CALLV
pop
line 1330
;1330:		CG_AddMarks();
ADDRGP4 CG_AddMarks
CALLV
pop
line 1331
;1331:		CG_AddParticles ();
ADDRGP4 CG_AddParticles
CALLV
pop
line 1332
;1332:		CG_AddLocalEntities();
ADDRGP4 CG_AddLocalEntities
CALLV
pop
line 1333
;1333:	}
LABELV $1029
line 1334
;1334:	CG_AddViewWeapon( &cg.predictedPlayerState );
ADDRGP4 cg+234796
ARGP4
ADDRGP4 CG_AddViewWeapon
CALLV
pop
line 1337
;1335:
;1336:	// add buffered sounds
;1337:	CG_PlayBufferedSounds();
ADDRGP4 CG_PlayBufferedSounds
CALLV
pop
line 1345
;1338:
;1339:#ifdef MISSIONPACK
;1340:	// play buffered voice chats
;1341:	CG_PlayBufferedVoiceChats();
;1342:#endif
;1343:
;1344:	// finish up the rest of the refdef
;1345:	if ( cg.testModelEntity.hModel ) {
ADDRGP4 cg+245744+8
INDIRI4
CNSTI4 0
EQI4 $1033
line 1346
;1346:		CG_AddTestModel();
ADDRGP4 CG_AddTestModel
CALLV
pop
line 1347
;1347:	}
LABELV $1033
line 1348
;1348:	cg.refdef.time = cg.time;
ADDRGP4 cg+236804+72
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 1349
;1349:	memcpy( cg.refdef.areamask, cg.snap->areamask, sizeof( cg.refdef.areamask ) );
ADDRGP4 cg+236804+80
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 12
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1352
;1350:
;1351:	// warning sounds when powerup is wearing off
;1352:	CG_PowerupTimerSounds();
ADDRGP4 CG_PowerupTimerSounds
CALLV
pop
line 1355
;1353:
;1354:	// update audio positions
;1355:	trap_S_Respatialize( cg.snap->ps.clientNum, cg.refdef.vieworg, cg.refdef.viewaxis, inwater );
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+236804+24
ARGP4
ADDRGP4 cg+236804+36
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_S_Respatialize
CALLV
pop
line 1358
;1356:
;1357:	// make sure the lagometerSample and frame timing isn't done twice when in stereo
;1358:	if ( stereoView != STEREO_RIGHT ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
EQI4 $1050
line 1359
;1359:		cg.frametime = cg.time - cg.oldTime;
ADDRGP4 cg+234760
ADDRGP4 cg+234764
INDIRI4
ADDRGP4 cg+234768
INDIRI4
SUBI4
ASGNI4
line 1360
;1360:		if ( cg.frametime < 0 ) {
ADDRGP4 cg+234760
INDIRI4
CNSTI4 0
GEI4 $1055
line 1361
;1361:			cg.frametime = 0;
ADDRGP4 cg+234760
CNSTI4 0
ASGNI4
line 1362
;1362:		}
LABELV $1055
line 1363
;1363:		cg.oldTime = cg.time;
ADDRGP4 cg+234768
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 1364
;1364:		CG_AddLagometerFrameInfo();
ADDRGP4 CG_AddLagometerFrameInfo
CALLV
pop
line 1365
;1365:	}
LABELV $1050
line 1366
;1366:	if (cg_timescale.value != cg_timescaleFadeEnd.value) {
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
EQF4 $1061
line 1367
;1367:		if (cg_timescale.value < cg_timescaleFadeEnd.value) {
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
GEF4 $1065
line 1368
;1368:			cg_timescale.value += cg_timescaleFadeSpeed.value * ((float)cg.frametime) / 1000;
ADDRLP4 32
ADDRGP4 cg_timescale+8
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
ADDRGP4 cg+234760
INDIRI4
CVIF4 4
MULF4
CNSTF4 981668463
MULF4
ADDF4
ASGNF4
line 1369
;1369:			if (cg_timescale.value > cg_timescaleFadeEnd.value)
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
LEF4 $1066
line 1370
;1370:				cg_timescale.value = cg_timescaleFadeEnd.value;
ADDRGP4 cg_timescale+8
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
ASGNF4
line 1371
;1371:		}
ADDRGP4 $1066
JUMPV
LABELV $1065
line 1372
;1372:		else {
line 1373
;1373:			cg_timescale.value -= cg_timescaleFadeSpeed.value * ((float)cg.frametime) / 1000;
ADDRLP4 32
ADDRGP4 cg_timescale+8
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
ADDRGP4 cg+234760
INDIRI4
CVIF4 4
MULF4
CNSTF4 981668463
MULF4
SUBF4
ASGNF4
line 1374
;1374:			if (cg_timescale.value < cg_timescaleFadeEnd.value)
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
GEF4 $1081
line 1375
;1375:				cg_timescale.value = cg_timescaleFadeEnd.value;
ADDRGP4 cg_timescale+8
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
ASGNF4
LABELV $1081
line 1376
;1376:		}
LABELV $1066
line 1377
;1377:		if (cg_timescaleFadeSpeed.value) {
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
CNSTF4 0
EQF4 $1087
line 1378
;1378:			trap_Cvar_Set("timescale", va("%f", cg_timescale.value));
ADDRGP4 $1091
ARGP4
ADDRGP4 cg_timescale+8
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1090
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1379
;1379:		}
LABELV $1087
line 1380
;1380:	}
LABELV $1061
line 1383
;1381:
;1382:	// actually issue the rendering calls
;1383:	CG_DrawActive( stereoView );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawActive
CALLV
pop
line 1386
;1384:
;1385:	// this counter will be bumped for every valid scene we generate
;1386:	cg.clientFrame++;
ADDRLP4 32
ADDRGP4 cg
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1388
;1387:
;1388:	if ( cg_stats.integer ) {
ADDRGP4 cg_stats+12
INDIRI4
CNSTI4 0
EQI4 $1093
line 1389
;1389:		CG_Printf( "cg.clientFrame:%i\n", cg.clientFrame );
ADDRGP4 $1096
ARGP4
ADDRGP4 cg
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1390
;1390:	}
LABELV $1093
line 1391
;1391:}
LABELV $969
endproc CG_DrawActiveFrame 36 16
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
LABELV $1096
byte 1 99
byte 1 103
byte 1 46
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 70
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1091
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $1090
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
LABELV $1024
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $978
byte 1 48
byte 1 0
align 1
LABELV $977
byte 1 49
byte 1 0
align 1
LABELV $975
byte 1 118
byte 1 114
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
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $974
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
byte 1 0
align 1
LABELV $474
byte 1 118
byte 1 114
byte 1 95
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 87
byte 1 104
byte 1 101
byte 1 110
byte 1 72
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $245
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $241
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $240
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
LABELV $187
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $165
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $148
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $108
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 46
byte 1 10
byte 1 0
