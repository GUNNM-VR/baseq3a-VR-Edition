export CG_ChangeFrameResolution
code
proc CG_ChangeFrameResolution 4 0
file "..\..\..\..\code\cgame\cg_vrmod.c"
line 14
;1:#include "cg_local.h"
;2:
;3:client_weapon_t	client_weapon;
;4:
;5:#ifdef USE_VR
;6:#include "vr_helper.h" 
;7:#endif
;8:
;9:/*
;10:=================
;11:CG_ChangeFrameResolution
;12:=================
;13:*/
;14:void CG_ChangeFrameResolution(int vidWidth, int vidHeight) {
line 15
;15:	cgs.glconfig.vidWidth  = vidWidth;
ADDRGP4 cgs+20100+11304
ADDRFP4 0
INDIRI4
ASGNI4
line 16
;16:	cgs.glconfig.vidHeight = vidHeight;
ADDRGP4 cgs+20100+11308
ADDRFP4 4
INDIRI4
ASGNI4
line 18
;17:
;18:	cgs.screenXBias = 0.0;
ADDRGP4 cgs+31460
CNSTF4 0
ASGNF4
line 19
;19:	cgs.screenYBias = 0.0;
ADDRGP4 cgs+31464
CNSTF4 0
ASGNF4
line 21
;20:
;21:	if (cgs.glconfig.vidWidth * 480 > cgs.glconfig.vidHeight * 640) {
ADDRGP4 cgs+20100+11304
INDIRI4
CNSTI4 480
MULI4
ADDRGP4 cgs+20100+11308
INDIRI4
CNSTI4 640
MULI4
LEI4 $94
line 23
;22:		// wide screen, scale by height
;23:		cgs.screenXScale = cgs.screenYScale = cgs.glconfig.vidHeight * (1.0 / 480.0);
ADDRLP4 0
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
CNSTF4 990414985
MULF4
ASGNF4
ADDRGP4 cgs+31452
ADDRLP4 0
INDIRF4
ASGNF4
ADDRGP4 cgs+31448
ADDRLP4 0
INDIRF4
ASGNF4
line 24
;24:		cgs.screenXBias = 0.5 * (cgs.glconfig.vidWidth - (cgs.glconfig.vidHeight * (640.0 / 480.0)));
ADDRGP4 cgs+31460
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
CNSTF4 1068149419
MULF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 25
;25:	}
ADDRGP4 $95
JUMPV
LABELV $94
line 26
;26:	else {
line 28
;27:		// no wide screen, scale by width
;28:		cgs.screenXScale = cgs.screenYScale = cgs.glconfig.vidWidth * (1.0 / 640.0);
ADDRLP4 0
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
CNSTF4 986500301
MULF4
ASGNF4
ADDRGP4 cgs+31452
ADDRLP4 0
INDIRF4
ASGNF4
ADDRGP4 cgs+31448
ADDRLP4 0
INDIRF4
ASGNF4
line 29
;29:		cgs.screenYBias = 0.5 * (cgs.glconfig.vidHeight - (cgs.glconfig.vidWidth * (480.0 / 640.0)));
ADDRGP4 cgs+31464
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
CNSTF4 1061158912
MULF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 30
;30:	}
LABELV $95
line 32
;31:
;32:	cgs.screenXmin = 0.0 - (cgs.screenXBias / cgs.screenXScale);
ADDRGP4 cgs+31468
CNSTF4 0
ADDRGP4 cgs+31460
INDIRF4
ADDRGP4 cgs+31448
INDIRF4
DIVF4
SUBF4
ASGNF4
line 33
;33:	cgs.screenXmax = 640.0 + (cgs.screenXBias / cgs.screenXScale);
ADDRGP4 cgs+31472
ADDRGP4 cgs+31460
INDIRF4
ADDRGP4 cgs+31448
INDIRF4
DIVF4
CNSTF4 1142947840
ADDF4
ASGNF4
line 35
;34:
;35:	cgs.screenYmin = 0.0 - (cgs.screenYBias / cgs.screenYScale);
ADDRGP4 cgs+31476
CNSTF4 0
ADDRGP4 cgs+31464
INDIRF4
ADDRGP4 cgs+31452
INDIRF4
DIVF4
SUBF4
ASGNF4
line 36
;36:	cgs.screenYmax = 480.0 + (cgs.screenYBias / cgs.screenYScale);
ADDRGP4 cgs+31480
ADDRGP4 cgs+31464
INDIRF4
ADDRGP4 cgs+31452
INDIRF4
DIVF4
CNSTF4 1139802112
ADDF4
ASGNF4
line 38
;37:
;38:	cgs.cursorScaleR = 1.0 / cgs.screenXScale;
ADDRGP4 cgs+31456
CNSTF4 1065353216
ADDRGP4 cgs+31448
INDIRF4
DIVF4
ASGNF4
line 39
;39:	if (cgs.cursorScaleR < 0.5) {
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1056964608
GEF4 $132
line 40
;40:		cgs.cursorScaleR = 0.5;
ADDRGP4 cgs+31456
CNSTF4 1056964608
ASGNF4
line 41
;41:	}
LABELV $132
line 42
;42:}
LABELV $87
endproc CG_ChangeFrameResolution 4 0
export CG_GetPlayerWeaponAxis
proc CG_GetPlayerWeaponAxis 100 24
line 52
;43:
;44:
;45:/*
;46:=============
;47:CG_GetPlayerWeaponAxis()
;48:because we need to subtract the gun matrix from the torso matrix
;49:=============
;50:*/
;51:#ifdef USE_VR
;52:void CG_GetPlayerWeaponAxis(refEntity_t *torso, playerState_t *ps, centity_t *cent, refEntity_t *gun) {
line 54
;53:	orientation_t	lerped;
;54:	qboolean myself = (cent->currentState.number == cg.snap->ps.clientNum);
ADDRFP4 8
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $139
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRGP4 $140
JUMPV
LABELV $139
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $140
ADDRLP4 48
ADDRLP4 56
INDIRI4
ASGNI4
line 58
;55:
;56:	int vr_controller_type;
;57:
;58:	if ( myself )
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $141
line 59
;59:		vr_controller_type = VR_get_client_controller_type();
ADDRLP4 60
ADDRGP4 VR_get_client_controller_type
CALLI4
ASGNI4
ADDRLP4 52
ADDRLP4 60
INDIRI4
ASGNI4
ADDRGP4 $142
JUMPV
LABELV $141
line 61
;60:#ifdef USE_VR_QVM
;61:	else if ( ps )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $143
line 62
;62:		vr_controller_type = ps->vr_controller_type;
ADDRLP4 52
ADDRFP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $144
JUMPV
LABELV $143
line 63
;63:	else if( cent )
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $145
line 64
;64:		vr_controller_type = VR_get_cent_controller_type( cent );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 VR_get_cent_controller_type
CALLI4
ASGNI4
ADDRLP4 52
ADDRLP4 64
INDIRI4
ASGNI4
LABELV $145
LABELV $144
LABELV $142
line 68
;65:#endif
;66:
;67:	// lerp the tag
;68:	trap_R_LerpTag(&lerped, torso->hModel, torso->oldframe, torso->frame, 1.0 - torso->backlerp, "tag_weapon");
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 68
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRGP4 $147
ARGP4
ADDRGP4 trap_R_LerpTag
CALLI4
pop
line 70
;69:
;70:	VectorCopy(torso->origin, gun->origin);
ADDRFP4 12
INDIRP4
CNSTI4 68
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRB
ASGNB 12
line 72
;71:
;72:	VectorMA(gun->origin, lerped.origin[0], torso->axis[PITCH], gun->origin);
ADDRLP4 72
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 75
;73:
;74:	// Make weapon appear left-handed for 2 and centered for 3
;75:	if (ps && cg_drawGun.integer == 2) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $148
ADDRGP4 cg_drawGun+12
INDIRI4
CNSTI4 2
NEI4 $148
line 76
;76:		VectorMA(gun->origin, -lerped.origin[1], torso->axis[YAW], gun->origin);
ADDRLP4 84
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRLP4 92
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 77
;77:	}
ADDRGP4 $149
JUMPV
LABELV $148
line 78
;78:	else if (!ps || cg_drawGun.integer != 3) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $157
ADDRGP4 cg_drawGun+12
INDIRI4
CNSTI4 3
EQI4 $154
LABELV $157
line 79
;79:		VectorMA(gun->origin, lerped.origin[1], torso->axis[YAW], gun->origin);
ADDRLP4 84
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 92
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 80
;80:	}
LABELV $154
LABELV $149
line 82
;81:
;82:	VectorMA(gun->origin, lerped.origin[2], torso->axis[ROLL], gun->origin);
ADDRLP4 84
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 92
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 84
;83:
;84:	if (!ps || !vr_controller_type) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $166
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $164
LABELV $166
line 87
;85:		// had to cast away the const to avoid compiler problems...
;86:		// Not VR client
;87:		MatrixMultiply(lerped.axis, ((refEntity_t *)torso)->axis, gun->axis);
ADDRLP4 0+12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 88
;88:	}
ADDRGP4 $165
JUMPV
LABELV $164
line 89
;89:	else {
line 92
;90:		// VR client
;91:		// for weapon roll effect
;92:		MatrixMultiply(client_weapon.axis, lerped.axis, client_weapon.axis);
ADDRLP4 96
ADDRGP4 client_weapon
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 93
;93:		MatrixMultiply(client_weapon.axis, ((refEntity_t *)torso)->axis, gun->axis); // client_weapon has now roll axis based on VR controller
ADDRGP4 client_weapon
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 94
;94:	}
LABELV $165
line 95
;95:}
LABELV $136
endproc CG_GetPlayerWeaponAxis 100 24
export CG_VR_Menu
proc CG_VR_Menu 156 12
line 106
;96:#endif // USE_VR
;97:
;98:/*
;99:=================
;100:CG_VR_Menu
;101:Creates an entity menu in front of the current position
;102:(use simple geometry, as seen in tr_surface)
;103:=================
;104:*/
;105:#ifdef USE_VIRTUAL_MENU
;106:void CG_VR_Menu( centity_t *cent ) {
line 111
;107:	refEntity_t ent;
;108:	vec3_t		menuAngles;
;109:
;110:	// don't update the menu angle each time, in order to obtain a steady menu angle
;111:	if ( !(cent->currentState.eFlags & EF_TALK) ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $170
line 112
;112:		cent->currentState.menuYaw = -1;// reset angle when user quits menu
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTI4 -1
ASGNI4
line 113
;113:		return;
ADDRGP4 $169
JUMPV
LABELV $170
line 115
;114:	}
;115:	else {
line 118
;116:		// the menu is create from the player origin and view angles.
;117:		// a fixe yaw axis is kept in centity_t otherwise menu follows view.
;118:		if ( cent->currentState.menuYaw == -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $172
line 119
;119:			cent->currentState.menuYaw = cent->lerpAngles[1];
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 452
ADDP4
ADDRLP4 152
INDIRP4
CNSTI4 1228
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 120
;120:		}
LABELV $172
line 123
;121:		//cent->currentState.menuAngleYaw = cent->lerpAngles[1]; // if user want the menu always in front of him
;122:
;123:		memset(&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 124
;124:		ent.reType = RT_VR_MENU;
ADDRLP4 0
CNSTI4 9
ASGNI4
line 125
;125:		ent.customShader = cgs.media.menu_texture_shader;
ADDRLP4 0+112
ADDRGP4 cgs+150560+340
INDIRI4
ASGNI4
line 129
;126:
;127:		// fixme: with RF_DEPTHHACK laser beam is behing menu / without menu can be hide inside a wall.
;128:		// TODO RF_DEPTHHACK on laser beam, but only in menu?
;129:		ent.renderfx = /*RF_DEPTHHACK |*/ RF_NOSHADOW | RF_LIGHTING_ORIGIN;
ADDRLP4 0+4
CNSTI4 192
ASGNI4
line 132
;130:
;131:		// menu origin
;132:		VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
INDIRB
ASGNB 12
line 133
;133:		ent.origin[2] += cg.heightStand;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRGP4 cg+282960
INDIRF4
ADDF4
ASGNF4
line 136
;134:
;135:		// menu angles
;136:		menuAngles[0] = 0; // pitch
ADDRLP4 140
CNSTF4 0
ASGNF4
line 137
;137:		menuAngles[1] = cent->currentState.menuYaw; // yaw
ADDRLP4 140+4
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 138
;138:		menuAngles[2] = 0; //roll
ADDRLP4 140+8
CNSTF4 0
ASGNF4
line 140
;139:
;140:		if (!vr_controller_type.integer) { // Not a VR client
ADDRGP4 vr_controller_type+12
INDIRI4
CNSTI4 0
NEI4 $184
line 141
;141:			menuAngles[1] = cent->lerpAngles[1]; // follow the view in all axes, fixme not perfect
ADDRLP4 140+4
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRF4
ASGNF4
line 143
;142:			//VectorCopy(cent->lerpAngles, menuAngles); // follow the view in all axes
;143:		}
LABELV $184
line 146
;144:
;145:		//ent.rotation = menuAngles[1]; // the 3D menu need yaw angle
;146:		ent.rotation = cent->currentState.menuYaw; // the 3D menu need yaw angle
ADDRLP4 0+136
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 148
;147:
;148:		AnglesToAxis( menuAngles, ent.axis );
ADDRLP4 140
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 151
;149:
;150:		//Move in front of player
;151:		VectorMA(ent.origin, menu_distance.value, ent.axis[0], ent.origin); // distance
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
ADDRLP4 0+28
INDIRF4
ADDRGP4 menu_distance+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRLP4 0+28+4
INDIRF4
ADDRGP4 menu_distance+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRLP4 0+28+8
INDIRF4
ADDRGP4 menu_distance+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 153
;152:
;153:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 154
;154:	}
line 155
;155:}
LABELV $169
endproc CG_VR_Menu 156 12
export CG_VR_Keyboard
proc CG_VR_Keyboard 156 12
line 166
;156:#endif
;157:/*
;158:=================
;159:CG_VR_Keyboard
;160:Draw only when cvar showVirtualKeyboard is qtrue
;161:Creates an entity keyboard in front of the current position
;162:(use simple geometry, as seen in tr_surface)
;163:=================
;164:*/
;165:#ifdef USE_VIRTUAL_KEYBOARD
;166:void CG_VR_Keyboard( centity_t *cent ) {
line 171
;167:	refEntity_t ent;
;168:	vec3_t		vkbAngles;
;169:
;170:	// update angle menu if menu was close
;171:	if (cent->currentState.menuYaw == -1) {
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $209
line 172
;172:		cent->currentState.menuYaw = cent->lerpAngles[1];
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 452
ADDP4
ADDRLP4 152
INDIRP4
CNSTI4 1228
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 173
;173:	}
LABELV $209
line 175
;174:
;175:	memset(&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 176
;176:	ent.reType = RT_VR_KEYBOARD;
ADDRLP4 0
CNSTI4 10
ASGNI4
line 177
;177:	ent.customShader = trap_R_RegisterShaderNoMip("menu/keyboard_tex.tga");
ADDRGP4 $212
ARGP4
ADDRLP4 152
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0+112
ADDRLP4 152
INDIRI4
ASGNI4
line 179
;178:
;179:	VectorCopy(cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
INDIRB
ASGNB 12
line 180
;180:	ent.origin[2] += cg.heightStand;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRGP4 cg+282960
INDIRF4
ADDF4
ASGNF4
line 183
;181:
;182:	// keyboard use menu angles
;183:	vkbAngles[0] = 0; // pitch
ADDRLP4 140
CNSTF4 0
ASGNF4
line 184
;184:	vkbAngles[1] = cent->currentState.menuYaw; // yaw
ADDRLP4 140+4
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 185
;185:	vkbAngles[2] = 0; //roll
ADDRLP4 140+8
CNSTF4 0
ASGNF4
line 186
;186:	ent.rotation = cent->currentState.menuYaw;
ADDRLP4 0+136
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 195
;187:
;188:	//========================================================
;189:	// If want the keyboard to follow the view
;190:	// VectorCopy(cent->lerpAngles, vkbAngles); // follow the view, à virer
;191:	// vkbAngles[0] = vkbAngles[2] = 0;//à virer
;192:	// ent.rotation = cent->lerpAngles[1];//à virer
;193:	//========================================================
;194:
;195:	AnglesToAxis(vkbAngles, ent.axis);
ADDRLP4 140
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 197
;196:
;197:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 198
;198:}
LABELV $208
endproc CG_VR_Keyboard 156 12
data
align 4
LABELV $222
byte 4 0
byte 4 0
byte 4 0
align 4
LABELV $223
byte 4 0
byte 4 0
byte 4 0
align 4
LABELV $224
byte 4 0
byte 4 1132920832
byte 4 0
export CG_GetModelHeight
code
proc CG_GetModelHeight 460 16
line 210
;199:#endif
;200:
;201:
;202:/*
;203:===============
;204:CG_GetModelHeight
;205:call once at first spawn, or model change
;206:get the model head height when crouch or stand up
;207:arg: position 0 => stand / position 1 => crouch
;208:===============
;209:*/
;210:void CG_GetModelHeight( int position ) {
line 216
;211:	clientInfo_t	*ci;
;212:	refEntity_t		legs;
;213:	refEntity_t		torso;
;214:	refEntity_t		head;
;215:	//vec3_t origin = {-1156.339355, -1150.098389, 20.125000 }; // to see result in q3dm0
;216:	vec3_t origin = { 0.0f, 0.0f, 0.0f };
ADDRLP4 436
ADDRGP4 $222
INDIRB
ASGNB 12
line 217
;217:	vec3_t angle = { 0.0f, 0.0f, 0.0f };
ADDRLP4 424
ADDRGP4 $223
INDIRB
ASGNB 12
line 218
;218:	vec3_t angle_leg = { 0.0f, 270.0f, 0.0f };
ADDRLP4 448
ADDRGP4 $224
INDIRB
ASGNB 12
line 220
;219:
;220:	ci = &cgs.clientinfo[cg.clientNum];
ADDRLP4 0
ADDRGP4 cg+4
INDIRI4
CNSTI4 1680
MULI4
ADDRGP4 cgs+41012
ADDP4
ASGNP4
line 222
;221:
;222:	memset(&legs, 0, sizeof(legs));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 223
;223:	memset(&torso, 0, sizeof(torso));
ADDRLP4 144
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 224
;224:	memset(&head, 0, sizeof(head));
ADDRLP4 284
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 226
;225:
;226:	if (position == 0) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $227
line 227
;227:		legs.frame = ci->animations[LEGS_IDLE].firstFrame;
ADDRLP4 4+80
ADDRLP4 0
INDIRP4
CNSTI4 1064
ADDP4
INDIRI4
ASGNI4
line 228
;228:	}
ADDRGP4 $228
JUMPV
LABELV $227
line 229
;229:	else {
line 230
;230:		legs.frame = ci->animations[LEGS_IDLECR].firstFrame;
ADDRLP4 4+80
ADDRLP4 0
INDIRP4
CNSTI4 1092
ADDP4
INDIRI4
ASGNI4
line 231
;231:	}
LABELV $228
line 232
;232:	torso.frame = ci->animations[TORSO_STAND].firstFrame;
ADDRLP4 144+80
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ASGNI4
line 237
;233:
;234:	//=============================
;235:	//		add the legs
;236:	//=============================
;237:	legs.hModel = ci->legsModel;
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
line 238
;238:	legs.customSkin = ci->legsSkin;
ADDRLP4 4+108
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 239
;239:	VectorCopy(origin, legs.origin);
ADDRLP4 4+68
ADDRLP4 436
INDIRB
ASGNB 12
line 240
;240:	AnglesToAxis(angle_leg, legs.axis);
ADDRLP4 448
ARGP4
ADDRLP4 4+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 245
;241:	//trap_R_AddRefEntityToScene( &legs ); // to see result
;242:	//=============================
;243:	//	   add the torso
;244:	//=============================
;245:	torso.hModel = ci->torsoModel;
ADDRLP4 144+8
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ASGNI4
line 246
;246:	torso.customSkin = ci->torsoSkin;
ADDRLP4 144+108
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
ASGNI4
line 247
;247:	AnglesToAxis(angle, torso.axis);
ADDRLP4 424
ARGP4
ADDRLP4 144+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 251
;248:	/*if (!torso.hModel) { // TODO ckeck what happened when Orbb
;249:		CG_Printf( "[CG_GetModelHeight()] torso.hModel error !!" );
;250:	}*/
;251:	CG_PositionRotatedEntityOnTag(&torso, &legs, ci->legsModel, "tag_torso");
ADDRLP4 144
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ARGI4
ADDRGP4 $239
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 257
;252:	//trap_R_AddRefEntityToScene( &torso ); // to see result
;253:
;254:	//=============================
;255:	//		add the head
;256:	//=============================
;257:	head.hModel = ci->headModel;
ADDRLP4 284+8
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ASGNI4
line 258
;258:	head.customSkin = ci->headSkin;
ADDRLP4 284+108
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
line 259
;259:	AnglesToAxis(angle, head.axis);
ADDRLP4 424
ARGP4
ADDRLP4 284+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 260
;260:	CG_PositionRotatedEntityOnTag(&head, &torso, ci->torsoModel, "tag_head");
ADDRLP4 284
ARGP4
ADDRLP4 144
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ARGI4
ADDRGP4 $243
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 263
;261:	//trap_R_AddRefEntityToScene( &head ); // to see result
;262:
;263:	if (position == 0)
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $244
line 264
;264:		cg.heightStand = head.origin[2];
ADDRGP4 cg+282960
ADDRLP4 284+68+8
INDIRF4
ASGNF4
ADDRGP4 $245
JUMPV
LABELV $244
line 266
;265:	else
;266:		cg.heightCrouch = head.origin[2];
ADDRGP4 cg+282964
ADDRLP4 284+68+8
INDIRF4
ASGNF4
LABELV $245
line 267
;267:}
LABELV $221
endproc CG_GetModelHeight 460 16
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
bss
export client_weapon
align 4
LABELV client_weapon
skip 60
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
LABELV $243
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $239
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $212
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 107
byte 1 101
byte 1 121
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $147
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
