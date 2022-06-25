data
export pm_stopspeed
align 4
LABELV pm_stopspeed
byte 4 1120403456
export pm_duckScale
align 4
LABELV pm_duckScale
byte 4 1048576000
export pm_swimScale
align 4
LABELV pm_swimScale
byte 4 1056964608
export pm_wadeScale
align 4
LABELV pm_wadeScale
byte 4 1060320051
export pm_accelerate
align 4
LABELV pm_accelerate
byte 4 1092616192
export pm_airaccelerate
align 4
LABELV pm_airaccelerate
byte 4 1065353216
export pm_wateraccelerate
align 4
LABELV pm_wateraccelerate
byte 4 1082130432
export pm_flyaccelerate
align 4
LABELV pm_flyaccelerate
byte 4 1090519040
export pm_friction
align 4
LABELV pm_friction
byte 4 1086324736
export pm_waterfriction
align 4
LABELV pm_waterfriction
byte 4 1065353216
export pm_flightfriction
align 4
LABELV pm_flightfriction
byte 4 1077936128
export pm_spectatorfriction
align 4
LABELV pm_spectatorfriction
byte 4 1084227584
export c_pmove
align 4
LABELV c_pmove
byte 4 0
align 4
LABELV pm_respawntimer
byte 4 0
export PM_AddEvent
code
proc PM_AddEvent 0 16
file "..\..\..\..\code\game\bg_pmove.c"
line 46
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// bg_pmove.c -- both games player movement code
;4:// takes a playerstate and a usercmd as input and returns a modifed playerstate
;5:
;6:#include "q_shared.h"
;7:#include "bg_public.h"
;8:#include "bg_local.h"
;9:
;10:#ifdef USE_NATIVE_HACK
;11:#include "../../../Quake3e-master/code/vrmod/VRMOD_input.h"
;12:extern vr_clientinfo_t *vrinfo;
;13:#endif
;14:
;15:pmove_t		*pm;
;16:pml_t		pml;
;17:
;18:// movement parameters
;19:float	pm_stopspeed = 100.0f;
;20:float	pm_duckScale = 0.25f;
;21:float	pm_swimScale = 0.50f;
;22:float	pm_wadeScale = 0.70f;
;23:
;24:float	pm_accelerate = 10.0f;
;25:float	pm_airaccelerate = 1.0f;
;26:float	pm_wateraccelerate = 4.0f;
;27:float	pm_flyaccelerate = 8.0f;
;28:
;29:float	pm_friction = 6.0f;
;30:float	pm_waterfriction = 1.0f;
;31:float	pm_flightfriction = 3.0f;
;32:float	pm_spectatorfriction = 5.0f;
;33:
;34:int		c_pmove = 0;
;35:
;36:#define NO_RESPAWN_OVERBOUNCE 250
;37:
;38:static int pm_respawntimer = 0;
;39:
;40:/*
;41:===============
;42:PM_AddEvent
;43:
;44:===============
;45:*/
;46:void PM_AddEvent( int newEvent ) {
line 47
;47:	BG_AddPredictableEventToPlayerstate( newEvent, 0, pm->ps, -1 );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 48
;48:}
LABELV $41
endproc PM_AddEvent 0 16
export PM_AddTouchEnt
proc PM_AddTouchEnt 12 0
line 55
;49:
;50:/*
;51:===============
;52:PM_AddTouchEnt
;53:===============
;54:*/
;55:void PM_AddTouchEnt( int entityNum ) {
line 58
;56:	int		i;
;57:
;58:	if ( entityNum == ENTITYNUM_WORLD ) {
ADDRFP4 0
INDIRI4
CNSTI4 1022
NEI4 $43
line 59
;59:		return;
ADDRGP4 $42
JUMPV
LABELV $43
line 62
;60:	}
;61:
;62:	if ( pm->numtouch >= MAXTOUCH ) {
ADDRGP4 pm
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
CNSTI4 32
LTI4 $45
line 63
;63:		return;
ADDRGP4 $42
JUMPV
LABELV $45
line 67
;64:	}
;65:
;66:	// see if it is already added
;67:	for ( i = 0 ; i < pm->numtouch ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $50
JUMPV
LABELV $47
line 68
;68:		if ( pm->touchents[ i ] == entityNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm
INDIRP4
CNSTI4 124
ADDP4
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $51
line 69
;69:			return;
ADDRGP4 $42
JUMPV
LABELV $51
line 71
;70:		}
;71:	}
LABELV $48
line 67
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $50
ADDRLP4 0
INDIRI4
ADDRGP4 pm
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
LTI4 $47
line 74
;72:
;73:	// add it
;74:	pm->touchents[pm->numtouch] = entityNum;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 124
ADDP4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 75
;75:	pm->numtouch++;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
CNSTI4 120
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 76
;76:}
LABELV $42
endproc PM_AddTouchEnt 12 0
proc PM_StartTorsoAnim 4 0
line 83
;77:
;78:/*
;79:===================
;80:PM_StartTorsoAnim
;81:===================
;82:*/
;83:static void PM_StartTorsoAnim( int anim ) {
line 84
;84:	if ( pm->ps->pm_type >= PM_DEAD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
LTI4 $54
line 85
;85:		return;
ADDRGP4 $53
JUMPV
LABELV $54
line 87
;86:	}
;87:	pm->ps->torsoAnim = ( ( pm->ps->torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT )
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 128
BXORI4
ADDRFP4 0
INDIRI4
BORI4
ASGNI4
line 89
;88:		| anim;
;89:}
LABELV $53
endproc PM_StartTorsoAnim 4 0
proc PM_StartLegsAnim 4 0
line 90
;90:static void PM_StartLegsAnim( int anim ) {
line 91
;91:	if ( pm->ps->pm_type >= PM_DEAD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
LTI4 $57
line 92
;92:		return;
ADDRGP4 $56
JUMPV
LABELV $57
line 94
;93:	}
;94:	if ( pm->ps->legsTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
LEI4 $59
line 95
;95:		return;		// a high priority animation is running
ADDRGP4 $56
JUMPV
LABELV $59
line 97
;96:	}
;97:	pm->ps->legsAnim = ( ( pm->ps->legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT )
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 128
BXORI4
ADDRFP4 0
INDIRI4
BORI4
ASGNI4
line 99
;98:		| anim;
;99:}
LABELV $56
endproc PM_StartLegsAnim 4 0
proc PM_ContinueLegsAnim 0 4
line 101
;100:
;101:static void PM_ContinueLegsAnim( int anim ) {
line 102
;102:	if ( ( pm->ps->legsAnim & ~ANIM_TOGGLEBIT ) == anim ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ADDRFP4 0
INDIRI4
NEI4 $62
line 103
;103:		return;
ADDRGP4 $61
JUMPV
LABELV $62
line 105
;104:	}
;105:	if ( pm->ps->legsTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
LEI4 $64
line 106
;106:		return;		// a high priority animation is running
ADDRGP4 $61
JUMPV
LABELV $64
line 108
;107:	}
;108:	PM_StartLegsAnim( anim );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_StartLegsAnim
CALLV
pop
line 109
;109:}
LABELV $61
endproc PM_ContinueLegsAnim 0 4
proc PM_ContinueTorsoAnim 0 4
line 111
;110:
;111:static void PM_ContinueTorsoAnim( int anim ) {
line 112
;112:	if ( ( pm->ps->torsoAnim & ~ANIM_TOGGLEBIT ) == anim ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ADDRFP4 0
INDIRI4
NEI4 $67
line 113
;113:		return;
ADDRGP4 $66
JUMPV
LABELV $67
line 115
;114:	}
;115:	if ( pm->ps->torsoTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
LEI4 $69
line 116
;116:		return;		// a high priority animation is running
ADDRGP4 $66
JUMPV
LABELV $69
line 118
;117:	}
;118:	PM_StartTorsoAnim( anim );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 119
;119:}
LABELV $66
endproc PM_ContinueTorsoAnim 0 4
proc PM_ForceLegsAnim 0 4
line 121
;120:
;121:static void PM_ForceLegsAnim( int anim ) {
line 122
;122:	pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 127
;123:
;124:#ifdef USE_VR
;125:	// VR client : avoid backflip
;126:#ifdef USE_VR_QVM
;127:	if ( pm->ps->vr_controller_type > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
LEI4 $72
line 130
;128:		// VR client : avoid backflip
;129:#endif
;130:	if ( !(pm->ps->pm_flags & PMF_NO_JUMP_ANIM) )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $74
line 132
;131:#endif
;132:		PM_StartLegsAnim( anim );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_StartLegsAnim
CALLV
pop
LABELV $74
LABELV $72
line 133
;133:}
LABELV $71
endproc PM_ForceLegsAnim 0 4
export PM_ClipVelocity
proc PM_ClipVelocity 24 0
line 143
;134:
;135:
;136:/*
;137:==================
;138:PM_ClipVelocity
;139:
;140:Slide off of the impacting surface
;141:==================
;142:*/
;143:void PM_ClipVelocity( vec3_t in, vec3_t normal, vec3_t out, float overbounce ) {
line 148
;144:	float	backoff;
;145:	float	change;
;146:	int		i;
;147:	
;148:	backoff = DotProduct (in, normal);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 150
;149:	
;150:	if ( backoff < 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $77
line 151
;151:		backoff *= overbounce;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 152
;152:	} else {
ADDRGP4 $78
JUMPV
LABELV $77
line 153
;153:		backoff /= overbounce;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
DIVF4
ASGNF4
line 154
;154:	}
LABELV $78
line 156
;155:
;156:	for ( i=0 ; i<3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $79
line 157
;157:		change = normal[i]*backoff;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 158
;158:		out[i] = in[i] - change;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 159
;159:	}
LABELV $80
line 156
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $79
line 160
;160:}
LABELV $76
endproc PM_ClipVelocity 24 0
proc PM_Friction 48 4
line 170
;161:
;162:
;163:/*
;164:==================
;165:PM_Friction
;166:
;167:Handles both ground friction and water friction
;168:==================
;169:*/
;170:static void PM_Friction( void ) {
line 176
;171:	vec3_t	vec;
;172:	float	*vel;
;173:	float	speed, newspeed, control;
;174:	float	drop;
;175:	
;176:	vel = pm->ps->velocity;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
line 178
;177:	
;178:	VectorCopy( vel, vec );
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 12
line 179
;179:	if ( pml.walking ) {
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $84
line 180
;180:		vec[2] = 0;	// ignore slope movement
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 181
;181:	}
LABELV $84
line 183
;182:
;183:	speed = VectorLength(vec);
ADDRLP4 16
ARGP4
ADDRLP4 32
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
ASGNF4
line 184
;184:	if (speed < 1) {
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
GEF4 $88
line 185
;185:		vel[0] = 0;
ADDRLP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 186
;186:		vel[1] = 0;		// allow sinking underwater
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 188
;187:		// FIXME: still have z friction underwater?
;188:		if ( pm->ps->pm_type == PM_SPECTATOR || pm->ps->powerups[ PW_FLIGHT ] )
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $92
ADDRLP4 36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $83
LABELV $92
line 189
;189:			vel[2] = 0.0f; // no slow-sinking/raising movements
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 190
;190:		return;
ADDRGP4 $83
JUMPV
LABELV $88
line 193
;191:	}
;192:
;193:	drop = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 196
;194:
;195:	// apply ground friction
;196:	if ( pm->waterlevel <= 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 1
GTI4 $93
line 197
;197:		if ( pml.walking && !(pml.groundTrace.surfaceFlags & SURF_SLICK) ) {
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $95
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $95
line 199
;198:			// if getting knocked back, no friction
;199:			if ( ! (pm->ps->pm_flags & PMF_TIME_KNOCKBACK) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $100
line 200
;200:				control = speed < pm_stopspeed ? pm_stopspeed : speed;
ADDRLP4 8
INDIRF4
ADDRGP4 pm_stopspeed
INDIRF4
GEF4 $103
ADDRLP4 36
ADDRGP4 pm_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $104
JUMPV
LABELV $103
ADDRLP4 36
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $104
ADDRLP4 28
ADDRLP4 36
INDIRF4
ASGNF4
line 201
;201:				drop += control*pm_friction*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRF4
ADDRGP4 pm_friction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 202
;202:			}
LABELV $100
line 203
;203:		}
LABELV $95
line 204
;204:	}
LABELV $93
line 207
;205:
;206:	// apply water friction even if just wading
;207:	if ( pm->waterlevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $106
line 208
;208:		drop += speed*pm_waterfriction*pm->waterlevel*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_waterfriction
INDIRF4
MULF4
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 209
;209:	}
LABELV $106
line 212
;210:
;211:	// apply flying friction
;212:	if ( pm->ps->powerups[PW_FLIGHT]) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $109
line 213
;213:		drop += speed*pm_flightfriction*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_flightfriction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 214
;214:	}
LABELV $109
line 216
;215:
;216:	if ( pm->ps->pm_type == PM_SPECTATOR) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $112
line 217
;217:		drop += speed*pm_spectatorfriction*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_spectatorfriction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 218
;218:	}
LABELV $112
line 221
;219:
;220:	// scale the velocity
;221:	newspeed = speed - drop;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 222
;222:	if (newspeed < 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $115
line 223
;223:		newspeed = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 224
;224:	}
LABELV $115
line 225
;225:	newspeed /= speed;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
ASGNF4
line 227
;226:
;227:	vel[0] = vel[0] * newspeed;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 228
;228:	vel[1] = vel[1] * newspeed;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 229
;229:	vel[2] = vel[2] * newspeed;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 230
;230:}
LABELV $83
endproc PM_Friction 48 4
proc PM_Accelerate 32 0
line 240
;231:
;232:
;233:/*
;234:==============
;235:PM_Accelerate
;236:
;237:Handles user intended acceleration
;238:==============
;239:*/
;240:static void PM_Accelerate( vec3_t wishdir, float wishspeed, float accel ) {
line 246
;241:#if 1
;242:	// q2 style
;243:	int			i;
;244:	float		addspeed, accelspeed, currentspeed;
;245:
;246:	currentspeed = DotProduct (pm->ps->velocity, wishdir);
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
MULF4
ADDRLP4 16
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 247
;247:	addspeed = wishspeed - currentspeed;
ADDRLP4 8
ADDRFP4 4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 248
;248:	if (addspeed <= 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $118
line 249
;249:		return;
ADDRGP4 $117
JUMPV
LABELV $118
line 251
;250:	}
;251:	accelspeed = accel*pml.frametime*wishspeed;
ADDRLP4 4
ADDRFP4 8
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 252
;252:	if (accelspeed > addspeed) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $121
line 253
;253:		accelspeed = addspeed;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 254
;254:	}
LABELV $121
line 256
;255:	
;256:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $123
line 257
;257:		pm->ps->velocity[i] += accelspeed*wishdir[i];	
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 258
;258:	}
LABELV $124
line 256
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $123
line 277
;259:#else
;260:	// proper way (avoids strafe jump maxspeed bug), but feels bad
;261:	vec3_t		wishVelocity;
;262:	vec3_t		pushDir;
;263:	float		pushLen;
;264:	float		canPush;
;265:
;266:	VectorScale( wishdir, wishspeed, wishVelocity );
;267:	VectorSubtract( wishVelocity, pm->ps->velocity, pushDir );
;268:	pushLen = VectorNormalize( pushDir );
;269:
;270:	canPush = accel*pml.frametime*wishspeed;
;271:	if (canPush > pushLen) {
;272:		canPush = pushLen;
;273:	}
;274:
;275:	VectorMA( pm->ps->velocity, canPush, pushDir, pm->ps->velocity );
;276:#endif
;277:}
LABELV $117
endproc PM_Accelerate 32 0
proc PM_CmdScale 32 4
line 290
;278:
;279:
;280:
;281:/*
;282:============
;283:PM_CmdScale
;284:
;285:Returns the scale factor to apply to cmd movements
;286:This allows the clients to use axial -127 to 127 values for all directions
;287:without getting a sqrt(2) distortion in speed.
;288:============
;289:*/
;290:static float PM_CmdScale( usercmd_t *cmd ) {
line 295
;291:	int		max;
;292:	float	total;
;293:	float	scale;
;294:
;295:	max = abs( cmd->forwardmove );
ADDRFP4 0
INDIRP4
CNSTI4 97
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 296
;296:	if ( abs( cmd->rightmove ) > max ) {
ADDRFP4 0
INDIRP4
CNSTI4 98
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 16
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $128
line 297
;297:		max = abs( cmd->rightmove );
ADDRFP4 0
INDIRP4
CNSTI4 98
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 298
;298:	}
LABELV $128
line 299
;299:	if ( abs( cmd->upmove ) > max ) {
ADDRFP4 0
INDIRP4
CNSTI4 99
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $130
line 300
;300:		max = abs( cmd->upmove );
ADDRFP4 0
INDIRP4
CNSTI4 99
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 24
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 301
;301:	}
LABELV $130
line 302
;302:	if ( !max ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $132
line 303
;303:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $127
JUMPV
LABELV $132
line 306
;304:	}
;305:
;306:	total = sqrt( cmd->forwardmove * cmd->forwardmove
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 97
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRP4
CNSTI4 97
ADDP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 24
INDIRP4
CNSTI4 98
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRP4
CNSTI4 98
ADDP4
INDIRI1
CVII4 1
MULI4
ADDI4
ADDRLP4 24
INDIRP4
CNSTI4 99
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRP4
CNSTI4 99
ADDP4
INDIRI1
CVII4 1
MULI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 28
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 28
INDIRF4
ASGNF4
line 308
;307:		+ cmd->rightmove * cmd->rightmove + cmd->upmove * cmd->upmove );
;308:	scale = (float)pm->ps->speed * max / ( 127.0 * total );
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
CNSTF4 1123942400
MULF4
DIVF4
ASGNF4
line 310
;309:
;310:	return scale;
ADDRLP4 8
INDIRF4
RETF4
LABELV $127
endproc PM_CmdScale 32 4
proc PM_SetMovementDir 36 0
line 322
;311:}
;312:
;313:
;314:/*
;315:================
;316:PM_SetMovementDir
;317:
;318:Determine the rotation of the legs relative
;319:to the facing dir
;320:================
;321:*/
;322:static void PM_SetMovementDir( void ) {
line 323
;323:	if ( pm->cmd.forwardmove || pm->cmd.rightmove ) {
ADDRLP4 0
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $137
ADDRLP4 0
INDIRP4
CNSTI4 102
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $135
LABELV $137
line 324
;324:		if ( pm->cmd.rightmove == 0 && pm->cmd.forwardmove > 0 ) {
ADDRLP4 4
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 102
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $138
ADDRLP4 4
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $138
line 325
;325:			pm->ps->movementDir = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 326
;326:		} else if ( pm->cmd.rightmove < 0 && pm->cmd.forwardmove > 0 ) {
ADDRGP4 $136
JUMPV
LABELV $138
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 102
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $140
ADDRLP4 8
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $140
line 327
;327:			pm->ps->movementDir = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 328
;328:		} else if ( pm->cmd.rightmove < 0 && pm->cmd.forwardmove == 0 ) {
ADDRGP4 $136
JUMPV
LABELV $140
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 102
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $142
ADDRLP4 12
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $142
line 329
;329:			pm->ps->movementDir = 2;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 2
ASGNI4
line 330
;330:		} else if ( pm->cmd.rightmove < 0 && pm->cmd.forwardmove < 0 ) {
ADDRGP4 $136
JUMPV
LABELV $142
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 102
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $144
ADDRLP4 16
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $144
line 331
;331:			pm->ps->movementDir = 3;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 3
ASGNI4
line 332
;332:		} else if ( pm->cmd.rightmove == 0 && pm->cmd.forwardmove < 0 ) {
ADDRGP4 $136
JUMPV
LABELV $144
ADDRLP4 20
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 102
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $146
ADDRLP4 20
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $146
line 333
;333:			pm->ps->movementDir = 4;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 4
ASGNI4
line 334
;334:		} else if ( pm->cmd.rightmove > 0 && pm->cmd.forwardmove < 0 ) {
ADDRGP4 $136
JUMPV
LABELV $146
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 102
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $148
ADDRLP4 24
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $148
line 335
;335:			pm->ps->movementDir = 5;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 5
ASGNI4
line 336
;336:		} else if ( pm->cmd.rightmove > 0 && pm->cmd.forwardmove == 0 ) {
ADDRGP4 $136
JUMPV
LABELV $148
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 102
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $150
ADDRLP4 28
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $150
line 337
;337:			pm->ps->movementDir = 6;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 6
ASGNI4
line 338
;338:		} else if ( pm->cmd.rightmove > 0 && pm->cmd.forwardmove > 0 ) {
ADDRGP4 $136
JUMPV
LABELV $150
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 102
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $136
ADDRLP4 32
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $136
line 339
;339:			pm->ps->movementDir = 7;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 7
ASGNI4
line 340
;340:		}
line 341
;341:	} else {
ADDRGP4 $136
JUMPV
LABELV $135
line 345
;342:		// if they aren't actively going directly sideways,
;343:		// change the animation to the diagonal so they
;344:		// don't stop too crooked
;345:		if ( pm->ps->movementDir == 2 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 2
NEI4 $154
line 346
;346:			pm->ps->movementDir = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 347
;347:		} else if ( pm->ps->movementDir == 6 ) {
ADDRGP4 $155
JUMPV
LABELV $154
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 6
NEI4 $156
line 348
;348:			pm->ps->movementDir = 7;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 7
ASGNI4
line 349
;349:		} 
LABELV $156
LABELV $155
line 350
;350:	}
LABELV $136
line 351
;351:}
LABELV $134
endproc PM_SetMovementDir 36 0
proc PM_CheckJump 8 4
line 359
;352:
;353:
;354:/*
;355:=============
;356:PM_CheckJump
;357:=============
;358:*/
;359:static qboolean PM_CheckJump( void ) {
line 360
;360:	if ( pm->ps->pm_flags & PMF_RESPAWNED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $159
line 361
;361:		return qfalse;		// don't allow jump until all buttons are up
CNSTI4 0
RETI4
ADDRGP4 $158
JUMPV
LABELV $159
line 364
;362:	}
;363:
;364:	if ( pm->cmd.upmove < 10 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 103
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $161
line 366
;365:		// not holding jump
;366:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $158
JUMPV
LABELV $161
line 370
;367:	}
;368:
;369:	// must wait for jump to be released
;370:	if ( pm->ps->pm_flags & PMF_JUMP_HELD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $163
line 372
;371:		// clear upmove so cmdscale doesn't lower running speed
;372:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 103
ADDP4
CNSTI1 0
ASGNI1
line 373
;373:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $158
JUMPV
LABELV $163
line 376
;374:	}
;375:
;376:	pml.groundPlane = qfalse;		// jumping away
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 377
;377:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 378
;378:	pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 380
;379:
;380:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 381
;381:	pm->ps->velocity[2] = JUMP_VELOCITY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1132920832
ASGNF4
line 382
;382:	PM_AddEvent( EV_JUMP );
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 384
;383:
;384:	if ( pm->cmd.forwardmove >= 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $167
line 385
;385:		PM_ForceLegsAnim( LEGS_JUMP );
CNSTI4 18
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 386
;386:		pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 387
;387:	} else {
ADDRGP4 $168
JUMPV
LABELV $167
line 388
;388:		PM_ForceLegsAnim( LEGS_JUMPB );
CNSTI4 20
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 389
;389:		pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 390
;390:	}
LABELV $168
line 392
;391:
;392:	return qtrue;
CNSTI4 1
RETI4
LABELV $158
endproc PM_CheckJump 8 4
proc PM_CheckWaterJump 52 8
line 400
;393:}
;394:
;395:/*
;396:=============
;397:PM_CheckWaterJump
;398:=============
;399:*/
;400:static qboolean	PM_CheckWaterJump( void ) {
line 405
;401:	vec3_t	spot;
;402:	int		cont;
;403:	vec3_t	flatforward;
;404:
;405:	if (pm->ps->pm_time) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $170
line 406
;406:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $169
JUMPV
LABELV $170
line 410
;407:	}
;408:
;409:	// check for water jump
;410:	if ( pm->waterlevel != 2 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 2
EQI4 $172
line 411
;411:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $169
JUMPV
LABELV $172
line 414
;412:	}
;413:
;414:	flatforward[0] = pml.forward[0];
ADDRLP4 12
ADDRGP4 pml
INDIRF4
ASGNF4
line 415
;415:	flatforward[1] = pml.forward[1];
ADDRLP4 12+4
ADDRGP4 pml+4
INDIRF4
ASGNF4
line 416
;416:	flatforward[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 417
;417:	VectorNormalize (flatforward);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 419
;418:
;419:	VectorMA (pm->ps->origin, 30, flatforward, spot);
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 1106247680
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
CNSTF4 1106247680
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
CNSTF4 1106247680
MULF4
ADDF4
ASGNF4
line 420
;420:	spot[2] += 4;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1082130432
ADDF4
ASGNF4
line 421
;421:	cont = pm->pointcontents (spot, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 296
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 36
INDIRI4
ASGNI4
line 422
;422:	if ( !(cont & CONTENTS_SOLID) ) {
ADDRLP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $182
line 423
;423:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $169
JUMPV
LABELV $182
line 426
;424:	}
;425:
;426:	spot[2] += 16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 427
;427:	cont = pm->pointcontents (spot, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 296
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 44
INDIRI4
ASGNI4
line 428
;428:	if ( cont & (CONTENTS_SOLID|CONTENTS_PLAYERCLIP|CONTENTS_BODY) ) {
ADDRLP4 24
INDIRI4
CNSTI4 33619969
BANDI4
CNSTI4 0
EQI4 $185
line 429
;429:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $169
JUMPV
LABELV $185
line 433
;430:	}
;431:
;432:	// jump out of water
;433:	VectorScale (pml.forward, 200, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRGP4 pml
INDIRF4
CNSTF4 1128792064
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 pml+4
INDIRF4
CNSTF4 1128792064
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ADDRGP4 pml+8
INDIRF4
CNSTF4 1128792064
MULF4
ASGNF4
line 434
;434:	pm->ps->velocity[2] = 350;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1135542272
ASGNF4
line 436
;435:
;436:	pm->ps->pm_flags |= PMF_TIME_WATERJUMP;
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 437
;437:	pm->ps->pm_time = 2000;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 2000
ASGNI4
line 439
;438:
;439:	return qtrue;
CNSTI4 1
RETI4
LABELV $169
endproc PM_CheckWaterJump 52 8
proc PM_WaterJumpMove 12 4
line 452
;440:}
;441:
;442://============================================================================
;443:
;444:
;445:/*
;446:===================
;447:PM_WaterJumpMove
;448:
;449:Flying out of the water
;450:===================
;451:*/
;452:static void PM_WaterJumpMove( void ) {
line 455
;453:	// waterjump has no control, but falls
;454:
;455:	PM_StepSlideMove( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 457
;456:
;457:	pm->ps->velocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 458
;458:	if (pm->ps->velocity[2] < 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
GEF4 $191
line 460
;459:		// cancel as soon as we are falling down again
;460:		pm->ps->pm_flags &= ~PMF_ALL_TIMES;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -353
BANDI4
ASGNI4
line 461
;461:		pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 462
;462:	}
LABELV $191
line 463
;463:}
LABELV $189
endproc PM_WaterJumpMove 12 4
proc PM_WaterMove 76 16
line 471
;464:
;465:/*
;466:===================
;467:PM_WaterMove
;468:
;469:===================
;470:*/
;471:static void PM_WaterMove( void ) {
line 479
;472:	int		i;
;473:	vec3_t	wishvel;
;474:	float	wishspeed;
;475:	vec3_t	wishdir;
;476:	float	scale;
;477:	float	vel;
;478:
;479:	if ( PM_CheckWaterJump() ) {
ADDRLP4 40
ADDRGP4 PM_CheckWaterJump
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $194
line 480
;480:		PM_WaterJumpMove();
ADDRGP4 PM_WaterJumpMove
CALLV
pop
line 481
;481:		return;
ADDRGP4 $193
JUMPV
LABELV $194
line 497
;482:	}
;483:#if 0
;484:	// jump = head for surface
;485:	if ( pm->cmd.upmove >= 10 ) {
;486:		if (pm->ps->velocity[2] > -300) {
;487:			if ( pm->watertype & CONTENTS_WATER ) {
;488:				pm->ps->velocity[2] = 100;
;489:			} else if ( pm->watertype & CONTENTS_SLIME ) {
;490:				pm->ps->velocity[2] = 80;
;491:			} else {
;492:				pm->ps->velocity[2] = 50;
;493:			}
;494:		}
;495:	}
;496:#endif
;497:	PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 499
;498:
;499:	scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 44
INDIRF4
ASGNF4
line 503
;500:	//
;501:	// user intentions
;502:	//
;503:	if ( !scale ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $196
line 504
;504:		wishvel[0] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 505
;505:		wishvel[1] = 0;
ADDRLP4 8+4
CNSTF4 0
ASGNF4
line 506
;506:		wishvel[2] = -60;		// sink towards bottom
ADDRLP4 8+8
CNSTF4 3262119936
ASGNF4
line 507
;507:	} else {
ADDRGP4 $197
JUMPV
LABELV $196
line 508
;508:		for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $200
line 509
;509:			wishvel[i] = scale * pml.forward[i]*pm->cmd.forwardmove + scale * pml.right[i]*pm->cmd.rightmove;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml
ADDP4
INDIRF4
MULF4
ADDRLP4 56
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml+12
ADDP4
INDIRF4
MULF4
ADDRLP4 56
INDIRP4
CNSTI4 102
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 510
;510:		}
LABELV $201
line 508
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $200
line 511
;511:		wishvel[2] += scale * pm->cmd.upmove;
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 4
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 103
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 512
;512:	}
LABELV $197
line 514
;513:
;514:	VectorCopy (wishvel, wishdir);
ADDRLP4 24
ADDRLP4 8
INDIRB
ASGNB 12
line 515
;515:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 24
ARGP4
ADDRLP4 48
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 48
INDIRF4
ASGNF4
line 517
;516:
;517:	if ( wishspeed > pm->ps->speed * pm_swimScale ) {
ADDRLP4 20
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_swimScale
INDIRF4
MULF4
LEF4 $206
line 518
;518:		wishspeed = pm->ps->speed * pm_swimScale;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_swimScale
INDIRF4
MULF4
ASGNF4
line 519
;519:	}
LABELV $206
line 521
;520:
;521:	PM_Accelerate (wishdir, wishspeed, pm_wateraccelerate);
ADDRLP4 24
ARGP4
ADDRLP4 20
INDIRF4
ARGF4
ADDRGP4 pm_wateraccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 524
;522:
;523:	// make sure we can go up slopes easily under water
;524:	if ( pml.groundPlane && DotProduct( pm->ps->velocity, pml.groundTrace.plane.normal ) < 0 ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $208
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRGP4 pml+52+24
INDIRF4
MULF4
ADDRLP4 52
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRGP4 pml+52+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 52
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $208
line 525
;525:		vel = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 56
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 56
INDIRF4
ASGNF4
line 527
;526:		// slide along the ground plane
;527:		PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal,
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 530
;528:			pm->ps->velocity, OVERCLIP );
;529:
;530:		VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 531
;531:		VectorScale(pm->ps->velocity, vel, pm->ps->velocity);
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 532
;532:	}
LABELV $208
line 534
;533:
;534:	PM_SlideMove( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 PM_SlideMove
CALLI4
pop
line 535
;535:}
LABELV $193
endproc PM_WaterMove 76 16
proc PM_FlyMove 52 12
line 560
;536:
;537:#ifdef MISSIONPACK
;538:/*
;539:===================
;540:PM_InvulnerabilityMove
;541:
;542:Only with the invulnerability powerup
;543:===================
;544:*/
;545:static void PM_InvulnerabilityMove( void ) {
;546:	pm->cmd.forwardmove = 0;
;547:	pm->cmd.rightmove = 0;
;548:	pm->cmd.upmove = 0;
;549:	VectorClear(pm->ps->velocity);
;550:}
;551:#endif
;552:
;553:/*
;554:===================
;555:PM_FlyMove
;556:
;557:Only with the flight powerup
;558:===================
;559:*/
;560:static void PM_FlyMove( void ) {
line 568
;561:	int		i;
;562:	vec3_t	wishvel;
;563:	float	wishspeed;
;564:	vec3_t	wishdir;
;565:	float	scale;
;566:
;567:	// normal slowdown
;568:	PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 570
;569:
;570:	scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 36
INDIRF4
ASGNF4
line 574
;571:	//
;572:	// user intentions
;573:	//
;574:	if ( !scale ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $222
line 575
;575:		wishvel[0] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 576
;576:		wishvel[1] = 0;
ADDRLP4 8+4
CNSTF4 0
ASGNF4
line 577
;577:		wishvel[2] = 0;
ADDRLP4 8+8
CNSTF4 0
ASGNF4
line 578
;578:	} else {
ADDRGP4 $223
JUMPV
LABELV $222
line 579
;579:		for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $226
line 580
;580:			wishvel[i] = scale * pml.forward[i]*pm->cmd.forwardmove + scale * pml.right[i]*pm->cmd.rightmove;
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml
ADDP4
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml+12
ADDP4
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 102
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 581
;581:		}
LABELV $227
line 579
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $226
line 583
;582:
;583:		wishvel[2] += scale * pm->cmd.upmove;
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 4
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 103
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 584
;584:	}
LABELV $223
line 586
;585:
;586:	VectorCopy (wishvel, wishdir);
ADDRLP4 20
ADDRLP4 8
INDIRB
ASGNB 12
line 587
;587:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 20
ARGP4
ADDRLP4 40
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 40
INDIRF4
ASGNF4
line 589
;588:
;589:	PM_Accelerate (wishdir, wishspeed, pm_flyaccelerate);
ADDRLP4 20
ARGP4
ADDRLP4 32
INDIRF4
ARGF4
ADDRGP4 pm_flyaccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 591
;590:
;591:	PM_StepSlideMove( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 592
;592:}
LABELV $221
endproc PM_FlyMove 52 12
proc PM_AirMove 156 16
line 601
;593:
;594:
;595:/*
;596:===================
;597:PM_AirMove
;598:
;599:===================
;600:*/
;601:static void PM_AirMove( void ) {
line 610
;602:	int			i;
;603:	vec3_t		wishvel;
;604:	float		fmove, smove;
;605:	vec3_t		wishdir;
;606:	float		wishspeed;
;607:	float		scale;
;608:	usercmd_t	cmd;
;609:
;610:	PM_Friction();
ADDRGP4 PM_Friction
CALLV
pop
line 612
;611:
;612:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 613
;613:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 102
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 615
;614:
;615:	cmd = pm->cmd;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 100
line 616
;616:	scale = PM_CmdScale( &cmd );
ADDRLP4 44
ARGP4
ADDRLP4 144
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 144
INDIRF4
ASGNF4
line 619
;617:
;618:	// set the movementDir so clients can rotate the legs for strafing
;619:	PM_SetMovementDir();
ADDRGP4 PM_SetMovementDir
CALLV
pop
line 622
;620:
;621:	// project moves down to flat plane
;622:	pml.forward[2] = 0;
ADDRGP4 pml+8
CNSTF4 0
ASGNF4
line 623
;623:	pml.right[2] = 0;
ADDRGP4 pml+12+8
CNSTF4 0
ASGNF4
line 624
;624:	VectorNormalize (pml.forward);
ADDRGP4 pml
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 625
;625:	VectorNormalize (pml.right);
ADDRGP4 pml+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 627
;626:
;627:	for ( i = 0 ; i < 2 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $237
line 628
;628:		wishvel[i] = pml.forward[i]*fmove + pml.right[i]*smove;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 629
;629:	}
LABELV $238
line 627
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $237
line 630
;630:	wishvel[2] = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 632
;631:
;632:	VectorCopy (wishvel, wishdir);
ADDRLP4 24
ADDRLP4 4
INDIRB
ASGNB 12
line 633
;633:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 24
ARGP4
ADDRLP4 148
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 148
INDIRF4
ASGNF4
line 634
;634:	wishspeed *= scale;
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
line 637
;635:
;636:	// not on ground, so little effect on velocity
;637:	PM_Accelerate (wishdir, wishspeed, pm_airaccelerate);
ADDRLP4 24
ARGP4
ADDRLP4 36
INDIRF4
ARGF4
ADDRGP4 pm_airaccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 642
;638:
;639:	// we may have a ground plane that is very steep, even
;640:	// though we don't have a groundentity
;641:	// slide along the steep plane
;642:	if ( pml.groundPlane ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $243
line 643
;643:		PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
ADDRLP4 152
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 152
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 645
;644:			pm->ps->velocity, OVERCLIP );
;645:	}
LABELV $243
line 657
;646:
;647:#if 0
;648:	//ZOID:  If we are on the grapple, try stair-stepping
;649:	//this allows a player to use the grapple to pull himself
;650:	//over a ledge
;651:	if (pm->ps->pm_flags & PMF_GRAPPLE_PULL)
;652:		PM_StepSlideMove ( qtrue );
;653:	else
;654:		PM_SlideMove ( qtrue );
;655:#endif
;656:
;657:	PM_StepSlideMove ( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 658
;658:}
LABELV $232
endproc PM_AirMove 156 16
proc PM_GrappleMove 44 4
line 666
;659:
;660:/*
;661:===================
;662:PM_GrappleMove
;663:
;664:===================
;665:*/
;666:static void PM_GrappleMove( void ) {
line 670
;667:	vec3_t vel, v;
;668:	float vlen;
;669:
;670:	VectorScale(pml.forward, -16, v);
ADDRLP4 12
ADDRGP4 pml
INDIRF4
CNSTF4 3246391296
MULF4
ASGNF4
ADDRLP4 12+4
ADDRGP4 pml+4
INDIRF4
CNSTF4 3246391296
MULF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 pml+8
INDIRF4
CNSTF4 3246391296
MULF4
ASGNF4
line 671
;671:	VectorAdd(pm->ps->grapplePoint, v, v);
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDF4
ASGNF4
line 672
;672:	VectorSubtract(v, pm->ps->origin, vel);
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+8
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 673
;673:	vlen = VectorLength(vel);
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 36
INDIRF4
ASGNF4
line 674
;674:	VectorNormalize( vel );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 676
;675:
;676:	if (vlen <= 100)
ADDRLP4 24
INDIRF4
CNSTF4 1120403456
GTF4 $261
line 677
;677:		VectorScale(vel, 10 * vlen, vel);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1092616192
MULF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1092616192
MULF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1092616192
MULF4
MULF4
ASGNF4
ADDRGP4 $262
JUMPV
LABELV $261
line 679
;678:	else
;679:		VectorScale(vel, 800, vel);
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1145569280
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1145569280
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1145569280
MULF4
ASGNF4
LABELV $262
line 681
;680:
;681:	VectorCopy(vel, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 683
;682:
;683:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 684
;684:}
LABELV $248
endproc PM_GrappleMove 44 4
proc PM_WalkMove 188 16
line 724
;685:
;686:
;687:/*
;688:===================
;689:PM_AdjustPosForWall
;690:Avoid weapon to be inside a solid (walls or player)
;691:===================
;692:*/
;693://GUNNM fixme: player fall into the void
;694:/*
;695:static void PM_AdjustPosForWall( void ) {
;696:	trace_t trace;
;697:	vec3_t gunAngles;
;698:
;699:	// check if player (or bot) have a vr controller. right_hand_angles[1] is set to spawn point angle
;700:	if (pm->ps->right_hand_angles[0] == 0.0f && pm->ps->right_hand_angles[2] == 0.0f  )
;701:		return;
;702:
;703:	VectorCopy (pm->ps->right_hand_angles, gunAngles);
;704:	gunAngles[PITCH] = 0;
;705:
;706:	pm->trace( &trace, pm->ps->origin, NULL, NULL, pm->ps->right_hand_position, 0, MASK_SOLID );
;707:	if ( trace.fraction != 1.0 )
;708:	{
;709:		vec3_t gunAxis[3];
;710:		float dist = Distance( pm->ps->right_hand_position, trace.endpos );
;711:
;712:		AnglesToAxis( gunAngles, gunAxis );
;713:		VectorMA( pm->ps->origin, -dist, gunAxis[0], pm->ps->origin );
;714:	}
;715:}
;716:*/
;717:
;718:/*
;719:===================
;720:PM_WalkMove
;721:
;722:===================
;723:*/
;724:static void PM_WalkMove( void ) {
line 735
;725:	int			i;
;726:	vec3_t		wishvel;
;727:	float		fmove, smove;
;728:	vec3_t		wishdir;
;729:	float		wishspeed;
;730:	float		scale;
;731:	usercmd_t	cmd;
;732:	float		accelerate;
;733:	float		vel;
;734:
;735:	if ( pm->waterlevel > 2 && DotProduct( pml.forward, pml.groundTrace.plane.normal ) > 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 2
LEI4 $273
ADDRGP4 pml
INDIRF4
ADDRGP4 pml+52+24
INDIRF4
MULF4
ADDRGP4 pml+4
INDIRF4
ADDRGP4 pml+52+24+4
INDIRF4
MULF4
ADDF4
ADDRGP4 pml+8
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
LEF4 $273
line 737
;736:		// begin swimming
;737:		PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 738
;738:		return;
ADDRGP4 $272
JUMPV
LABELV $273
line 742
;739:	}
;740:
;741:
;742:	if ( PM_CheckJump () ) {
ADDRLP4 152
ADDRGP4 PM_CheckJump
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $285
line 744
;743:		// jumped away
;744:		if ( pm->waterlevel > 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 1
LEI4 $287
line 745
;745:			PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 746
;746:		} else {
ADDRGP4 $272
JUMPV
LABELV $287
line 747
;747:			PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 748
;748:		}
line 749
;749:		return;
ADDRGP4 $272
JUMPV
LABELV $285
line 752
;750:	}
;751:
;752:	PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 754
;753:
;754:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 755
;755:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 102
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 757
;756:
;757:	cmd = pm->cmd;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 100
line 758
;758:	scale = PM_CmdScale( &cmd );
ADDRLP4 44
ARGP4
ADDRLP4 156
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 156
INDIRF4
ASGNF4
line 761
;759:
;760:	// set the movementDir so clients can rotate the legs for strafing
;761:	PM_SetMovementDir();
ADDRGP4 PM_SetMovementDir
CALLV
pop
line 764
;762:
;763:	// project moves down to flat plane
;764:	pml.forward[2] = 0;
ADDRGP4 pml+8
CNSTF4 0
ASGNF4
line 765
;765:	pml.right[2] = 0;
ADDRGP4 pml+12+8
CNSTF4 0
ASGNF4
line 768
;766:
;767:	// project the forward and right directions onto the ground plane
;768:	PM_ClipVelocity (pml.forward, pml.groundTrace.plane.normal, pml.forward, OVERCLIP );
ADDRLP4 160
ADDRGP4 pml
ASGNP4
ADDRLP4 160
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 160
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 769
;769:	PM_ClipVelocity (pml.right, pml.groundTrace.plane.normal, pml.right, OVERCLIP );
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRGP4 pml+12
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 771
;770:	//
;771:	VectorNormalize (pml.forward);
ADDRGP4 pml
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 772
;772:	VectorNormalize (pml.right);
ADDRGP4 pml+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 774
;773:
;774:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $299
line 775
;775:		wishvel[i] = pml.forward[i]*fmove + pml.right[i]*smove;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 776
;776:	}
LABELV $300
line 774
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $299
line 780
;777:	// when going up or down slopes the wish velocity should Not be zero
;778://	wishvel[2] = 0;
;779:
;780:	VectorCopy (wishvel, wishdir);
ADDRLP4 28
ADDRLP4 4
INDIRB
ASGNB 12
line 781
;781:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 28
ARGP4
ADDRLP4 164
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 164
INDIRF4
ASGNF4
line 782
;782:	wishspeed *= scale;
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
line 785
;783:
;784:	// clamp the speed lower if ducking
;785:	if ( pm->ps->pm_flags & PMF_DUCKED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $304
line 786
;786:		if ( wishspeed > pm->ps->speed * pm_duckScale ) {
ADDRLP4 24
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
LEF4 $306
line 787
;787:			wishspeed = pm->ps->speed * pm_duckScale;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
ASGNF4
line 788
;788:		}
LABELV $306
line 789
;789:	}
LABELV $304
line 792
;790:
;791:	// clamp the speed lower if wading or walking on the bottom
;792:	if ( pm->waterlevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $308
line 795
;793:		float	waterScale;
;794:
;795:		waterScale = pm->waterlevel / 3.0;
ADDRLP4 168
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1051372203
MULF4
ASGNF4
line 796
;796:		waterScale = 1.0 - ( 1.0 - pm_swimScale ) * waterScale;
ADDRLP4 168
CNSTF4 1065353216
CNSTF4 1065353216
ADDRGP4 pm_swimScale
INDIRF4
SUBF4
ADDRLP4 168
INDIRF4
MULF4
SUBF4
ASGNF4
line 797
;797:		if ( wishspeed > pm->ps->speed * waterScale ) {
ADDRLP4 24
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 168
INDIRF4
MULF4
LEF4 $310
line 798
;798:			wishspeed = pm->ps->speed * waterScale;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 168
INDIRF4
MULF4
ASGNF4
line 799
;799:		}
LABELV $310
line 800
;800:	}
LABELV $308
line 804
;801:
;802:	// when a player gets hit, they temporarily lose
;803:	// full control, which allows them to be moved a bit
;804:	if ( ( pml.groundTrace.surfaceFlags & SURF_SLICK ) || pm->ps->pm_flags & PMF_TIME_KNOCKBACK ) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $316
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $312
LABELV $316
line 805
;805:		accelerate = pm_airaccelerate;
ADDRLP4 144
ADDRGP4 pm_airaccelerate
INDIRF4
ASGNF4
line 806
;806:	} else {
ADDRGP4 $313
JUMPV
LABELV $312
line 807
;807:		accelerate = pm_accelerate;
ADDRLP4 144
ADDRGP4 pm_accelerate
INDIRF4
ASGNF4
line 808
;808:	}
LABELV $313
line 810
;809:
;810:	PM_Accelerate (wishdir, wishspeed, accelerate);
ADDRLP4 28
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 144
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 815
;811:
;812:	//Com_Printf("velocity = %1.1f %1.1f %1.1f\n", pm->ps->velocity[0], pm->ps->velocity[1], pm->ps->velocity[2]);
;813:	//Com_Printf("velocity1 = %1.1f\n", VectorLength(pm->ps->velocity));
;814:
;815:	if ( ( pml.groundTrace.surfaceFlags & SURF_SLICK ) || pm->ps->pm_flags & PMF_TIME_KNOCKBACK ) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $321
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $317
LABELV $321
line 816
;816:		pm->ps->velocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 168
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 172
ADDRLP4 168
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRF4
ADDRLP4 168
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 817
;817:	} else {
LABELV $317
line 820
;818:		// don't reset the z velocity for slopes
;819://		pm->ps->velocity[2] = 0;
;820:	}
LABELV $318
line 822
;821: 
;822:	if ( pm_respawntimer ) { // no more overbounce at respawn
ADDRGP4 pm_respawntimer
INDIRI4
CNSTI4 0
EQI4 $323
line 824
;823:		// slide along the ground plane
;824:		PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal,
ADDRLP4 168
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 168
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 826
;825:			pm->ps->velocity, OVERCLIP );
;826:	} else {
ADDRGP4 $324
JUMPV
LABELV $323
line 827
;827:		vel = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 168
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 148
ADDRLP4 168
INDIRF4
ASGNF4
line 830
;828:
;829:		// slide along the ground plane
;830:		PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal,
ADDRLP4 172
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 172
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 834
;831:			pm->ps->velocity, OVERCLIP );
;832:
;833:		// don't decrease velocity when going up or down a slope
;834:		VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 835
;835:		VectorScale(pm->ps->velocity, vel, pm->ps->velocity);
ADDRLP4 176
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 176
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 180
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 180
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 180
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 184
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 184
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 836
;836:	}
LABELV $324
line 839
;837:
;838:	// don't do anything if standing still
;839:	if (!pm->ps->velocity[0] && !pm->ps->velocity[1]) {
ADDRLP4 168
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
NEF4 $329
ADDRLP4 168
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CNSTF4 0
NEF4 $329
line 840
;840:		return;
ADDRGP4 $272
JUMPV
LABELV $329
line 843
;841:	}
;842:
;843:	PM_StepSlideMove( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 847
;844:
;845:	//Com_Printf("velocity2 = %1.1f\n", VectorLength(pm->ps->velocity));
;846:
;847:}
LABELV $272
endproc PM_WalkMove 188 16
proc PM_DeadMove 20 4
line 855
;848:
;849:
;850:/*
;851:==============
;852:PM_DeadMove
;853:==============
;854:*/
;855:static void PM_DeadMove( void ) {
line 858
;856:	float	forward;
;857:
;858:	if ( !pml.walking ) {
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
NEI4 $332
line 859
;859:		return;
ADDRGP4 $331
JUMPV
LABELV $332
line 864
;860:	}
;861:
;862:	// extra friction
;863:
;864:	forward = VectorLength (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 865
;865:	forward -= 20;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 866
;866:	if ( forward <= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GTF4 $335
line 867
;867:		VectorClear (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 868
;868:	} else {
ADDRGP4 $336
JUMPV
LABELV $335
line 869
;869:		VectorNormalize (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 870
;870:		VectorScale (pm->ps->velocity, forward, pm->ps->velocity);
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 871
;871:	}
LABELV $336
line 872
;872:}
LABELV $331
endproc PM_DeadMove 20 4
proc PM_NoclipMove 92 12
line 880
;873:
;874:
;875:/*
;876:===============
;877:PM_NoclipMove
;878:===============
;879:*/
;880:static void PM_NoclipMove( void ) {
line 889
;881:	float	speed, drop, friction, control, newspeed;
;882:	int			i;
;883:	vec3_t		wishvel;
;884:	float		fmove, smove;
;885:	vec3_t		wishdir;
;886:	float		wishspeed;
;887:	float		scale;
;888:
;889:	pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 26
ASGNI4
line 893
;890:
;891:	// friction
;892:
;893:	speed = VectorLength (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 64
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 64
INDIRF4
ASGNF4
line 894
;894:	if (speed < 1)
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
GEF4 $338
line 895
;895:	{
line 896
;896:		VectorCopy (vec3_origin, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 897
;897:	}
ADDRGP4 $339
JUMPV
LABELV $338
line 899
;898:	else
;899:	{
line 900
;900:		drop = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 902
;901:
;902:		friction = pm_friction*1.5;	// extra friction
ADDRLP4 56
ADDRGP4 pm_friction
INDIRF4
CNSTF4 1069547520
MULF4
ASGNF4
line 903
;903:		control = speed < pm_stopspeed ? pm_stopspeed : speed;
ADDRLP4 24
INDIRF4
ADDRGP4 pm_stopspeed
INDIRF4
GEF4 $341
ADDRLP4 68
ADDRGP4 pm_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $342
JUMPV
LABELV $341
ADDRLP4 68
ADDRLP4 24
INDIRF4
ASGNF4
LABELV $342
ADDRLP4 60
ADDRLP4 68
INDIRF4
ASGNF4
line 904
;904:		drop += control*friction*pml.frametime;
ADDRLP4 52
ADDRLP4 52
INDIRF4
ADDRLP4 60
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 907
;905:
;906:		// scale the velocity
;907:		newspeed = speed - drop;
ADDRLP4 28
ADDRLP4 24
INDIRF4
ADDRLP4 52
INDIRF4
SUBF4
ASGNF4
line 908
;908:		if (newspeed < 0)
ADDRLP4 28
INDIRF4
CNSTF4 0
GEF4 $344
line 909
;909:			newspeed = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
LABELV $344
line 910
;910:		newspeed /= speed;
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 24
INDIRF4
DIVF4
ASGNF4
line 912
;911:
;912:		VectorScale (pm->ps->velocity, newspeed, pm->ps->velocity);
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 913
;913:	}
LABELV $339
line 916
;914:
;915:	// accelerate
;916:	scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 68
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 68
INDIRF4
ASGNF4
line 918
;917:
;918:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 919
;919:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 102
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 921
;920:	
;921:	for (i=0 ; i<3 ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $346
line 922
;922:		wishvel[i] = pml.forward[i]*fmove + pml.right[i]*smove;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $347
line 921
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $346
line 923
;923:	wishvel[2] += pm->cmd.upmove;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 103
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ADDF4
ASGNF4
line 925
;924:
;925:	VectorCopy (wishvel, wishdir);
ADDRLP4 32
ADDRLP4 4
INDIRB
ASGNB 12
line 926
;926:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 32
ARGP4
ADDRLP4 76
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 76
INDIRF4
ASGNF4
line 927
;927:	wishspeed *= scale;
ADDRLP4 44
ADDRLP4 44
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
line 929
;928:
;929:	PM_Accelerate( wishdir, wishspeed, pm_accelerate );
ADDRLP4 32
ARGP4
ADDRLP4 44
INDIRF4
ARGF4
ADDRGP4 pm_accelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 932
;930:
;931:	// move
;932:	VectorMA (pm->ps->origin, pml.frametime, pm->ps->velocity, pm->ps->origin);
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 933
;933:}
LABELV $337
endproc PM_NoclipMove 92 12
proc PM_FootstepForSurface 0 0
line 944
;934:
;935://============================================================================
;936:
;937:/*
;938:================
;939:PM_FootstepForSurface
;940:
;941:Returns an event number appropriate for the groundsurface
;942:================
;943:*/
;944:static int PM_FootstepForSurface( void ) {
line 945
;945:	if ( pml.groundTrace.surfaceFlags & SURF_NOSTEPS ) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $356
line 946
;946:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $355
JUMPV
LABELV $356
line 948
;947:	}
;948:	if ( pml.groundTrace.surfaceFlags & SURF_METALSTEPS ) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $360
line 949
;949:		return EV_FOOTSTEP_METAL;
CNSTI4 2
RETI4
ADDRGP4 $355
JUMPV
LABELV $360
line 951
;950:	}
;951:	return EV_FOOTSTEP;
CNSTI4 1
RETI4
LABELV $355
endproc PM_FootstepForSurface 0 0
proc PM_CrashLand 52 4
line 962
;952:}
;953:
;954:
;955:/*
;956:=================
;957:PM_CrashLand
;958:
;959:Check for hard landings that generate sound events
;960:=================
;961:*/
;962:static void PM_CrashLand( void ) {
line 970
;963:	float		delta;
;964:	float		dist;
;965:	float		vel, acc;
;966:	float		t;
;967:	float		a, b, c, den;
;968:
;969:	// decide which landing animation to use
;970:	if ( pm->ps->pm_flags & PMF_BACKWARDS_JUMP ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $365
line 971
;971:		PM_ForceLegsAnim( LEGS_LANDB );
CNSTI4 21
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 972
;972:	} else {
ADDRGP4 $366
JUMPV
LABELV $365
line 973
;973:		PM_ForceLegsAnim( LEGS_LAND );
CNSTI4 19
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 974
;974:	}
LABELV $366
line 976
;975:
;976:	pm->ps->legsTimer = TIMER_LAND;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 130
ASGNI4
line 979
;977:
;978:	// calculate the exact velocity on landing
;979:	dist = pm->ps->origin[2] - pml.previous_origin[2];
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 pml+112+8
INDIRF4
SUBF4
ASGNF4
line 980
;980:	vel = pml.previous_velocity[2];
ADDRLP4 8
ADDRGP4 pml+124+8
INDIRF4
ASGNF4
line 981
;981:	acc = -pm->ps->gravity;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
NEGI4
CVIF4 4
ASGNF4
line 983
;982:
;983:	a = acc / 2;
ADDRLP4 16
ADDRLP4 12
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 984
;984:	b = vel;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 985
;985:	c = -dist;
ADDRLP4 32
ADDRLP4 24
INDIRF4
NEGF4
ASGNF4
line 987
;986:
;987:	den =  b * b - 4 * a * c;
ADDRLP4 20
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 16
INDIRF4
CNSTF4 1082130432
MULF4
ADDRLP4 32
INDIRF4
MULF4
SUBF4
ASGNF4
line 988
;988:	if ( den < 0 ) {
ADDRLP4 20
INDIRF4
CNSTF4 0
GEF4 $371
line 989
;989:		return;
ADDRGP4 $364
JUMPV
LABELV $371
line 991
;990:	}
;991:	t = (-b - sqrt( den ) ) / ( 2 * a );
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 40
INDIRF4
SUBF4
ADDRLP4 16
INDIRF4
CNSTF4 1073741824
MULF4
DIVF4
ASGNF4
line 993
;992:
;993:	delta = vel + t * acc;
ADDRLP4 0
ADDRLP4 8
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 994
;994:	delta = delta*delta * 0.0001;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 953267991
MULF4
ASGNF4
line 997
;995:
;996:	// ducking while falling doubles damage
;997:	if ( pm->ps->pm_flags & PMF_DUCKED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $373
line 998
;998:		delta *= 2;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1073741824
MULF4
ASGNF4
line 999
;999:	}
LABELV $373
line 1002
;1000:
;1001:	// never take falling damage if completely underwater
;1002:	if ( pm->waterlevel == 3 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 3
NEI4 $375
line 1003
;1003:		return;
ADDRGP4 $364
JUMPV
LABELV $375
line 1007
;1004:	}
;1005:
;1006:	// reduce falling damage if there is standing water
;1007:	if ( pm->waterlevel == 2 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 2
NEI4 $377
line 1008
;1008:		delta *= 0.25;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1048576000
MULF4
ASGNF4
line 1009
;1009:	}
LABELV $377
line 1010
;1010:	if ( pm->waterlevel == 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 1
NEI4 $379
line 1011
;1011:		delta *= 0.5;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1012
;1012:	}
LABELV $379
line 1014
;1013:
;1014:	if ( delta < 1 ) {
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
GEF4 $381
line 1015
;1015:		return;
ADDRGP4 $364
JUMPV
LABELV $381
line 1022
;1016:	}
;1017:
;1018:	// create a local entity event to play the sound
;1019:
;1020:	// SURF_NODAMAGE is used for bounce pads where you don't ever
;1021:	// want to take damage or play a crunch sound
;1022:	if ( !(pml.groundTrace.surfaceFlags & SURF_NODAMAGE) )  {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $383
line 1023
;1023:		if ( delta > 60 ) {
ADDRLP4 0
INDIRF4
CNSTF4 1114636288
LEF4 $387
line 1024
;1024:			PM_AddEvent( EV_FALL_FAR );
CNSTI4 12
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1025
;1025:		} else if ( delta > 40 ) {
ADDRGP4 $388
JUMPV
LABELV $387
ADDRLP4 0
INDIRF4
CNSTF4 1109393408
LEF4 $389
line 1027
;1026:			// this is a pain grunt, so don't play it if dead
;1027:			if ( pm->ps->stats[STAT_HEALTH] > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $390
line 1028
;1028:				PM_AddEvent( EV_FALL_MEDIUM );
CNSTI4 11
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1029
;1029:			}
line 1030
;1030:		} else if ( delta > 7 ) {
ADDRGP4 $390
JUMPV
LABELV $389
ADDRLP4 0
INDIRF4
CNSTF4 1088421888
LEF4 $393
line 1031
;1031:			PM_AddEvent( EV_FALL_SHORT );
CNSTI4 10
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1032
;1032:		} else {
ADDRGP4 $394
JUMPV
LABELV $393
line 1033
;1033:			PM_AddEvent( PM_FootstepForSurface() );
ADDRLP4 48
ADDRGP4 PM_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1034
;1034:		}
LABELV $394
LABELV $390
LABELV $388
line 1035
;1035:	}
LABELV $383
line 1038
;1036:
;1037:	// start footstep cycle over
;1038:	pm->ps->bobCycle = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 1039
;1039:}
LABELV $364
endproc PM_CrashLand 52 4
proc PM_CorrectAllSolid 36 28
line 1062
;1040:
;1041:/*
;1042:=============
;1043:PM_CheckStuck
;1044:=============
;1045:*/
;1046:/*
;1047:void PM_CheckStuck(void) {
;1048:	trace_t trace;
;1049:
;1050:	pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, pm->ps->origin, pm->ps->clientNum, pm->tracemask);
;1051:	if (trace.allsolid) {
;1052:		//int shit = qtrue;
;1053:	}
;1054:}
;1055:*/
;1056:
;1057:/*
;1058:=============
;1059:PM_CorrectAllSolid
;1060:=============
;1061:*/
;1062:static int PM_CorrectAllSolid( trace_t *trace ) {
line 1066
;1063:	int			i, j, k;
;1064:	vec3_t		point;
;1065:
;1066:	if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 0
EQI4 $396
line 1067
;1067:		Com_Printf("%i:allsolid\n", c_pmove);
ADDRGP4 $398
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1068
;1068:	}
LABELV $396
line 1071
;1069:
;1070:	// jitter around
;1071:	for (i = -1; i <= 1; i++) {
ADDRLP4 20
CNSTI4 -1
ASGNI4
LABELV $399
line 1072
;1072:		for (j = -1; j <= 1; j++) {
ADDRLP4 16
CNSTI4 -1
ASGNI4
LABELV $403
line 1073
;1073:			for (k = -1; k <= 1; k++) {
ADDRLP4 12
CNSTI4 -1
ASGNI4
LABELV $407
line 1074
;1074:				VectorCopy(pm->ps->origin, point);
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1075
;1075:				point[0] += (float) i;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1076
;1076:				point[1] += (float) j;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1077
;1077:				point[2] += (float) k;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1078
;1078:				pm->trace (trace, point, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 252
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 264
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 292
ADDP4
INDIRP4
CALLV
pop
line 1079
;1079:				if ( !trace->allsolid ) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $413
line 1080
;1080:					point[0] = pm->ps->origin[0];
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1081
;1081:					point[1] = pm->ps->origin[1];
ADDRLP4 0+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1082
;1082:					point[2] = pm->ps->origin[2] - 0.25;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 1084
;1083:
;1084:					pm->trace (trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 252
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 264
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 292
ADDP4
INDIRP4
CALLV
pop
line 1085
;1085:					pml.groundTrace = *trace;
ADDRGP4 pml+52
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 56
line 1086
;1086:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $395
JUMPV
LABELV $413
line 1088
;1087:				}
;1088:			}
LABELV $408
line 1073
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LEI4 $407
line 1089
;1089:		}
LABELV $404
line 1072
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
LEI4 $403
line 1090
;1090:	}
LABELV $400
line 1071
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
LEI4 $399
line 1092
;1091:
;1092:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1093
;1093:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1094
;1094:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1096
;1095:
;1096:	return qfalse;
CNSTI4 0
RETI4
LABELV $395
endproc PM_CorrectAllSolid 36 28
proc PM_GroundTraceMissed 80 28
line 1107
;1097:}
;1098:
;1099:
;1100:/*
;1101:=============
;1102:PM_GroundTraceMissed
;1103:
;1104:The ground trace didn't hit a surface, so we are in freefall
;1105:=============
;1106:*/
;1107:static void PM_GroundTraceMissed( void ) {
line 1111
;1108:	trace_t		trace;
;1109:	vec3_t		point;
;1110:
;1111:	if ( pm->ps->groundEntityNum != ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $421
line 1113
;1112:		// we just transitioned into freefall
;1113:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 0
EQI4 $423
line 1114
;1114:			Com_Printf("%i:lift\n", c_pmove);
ADDRGP4 $425
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1115
;1115:		}
LABELV $423
line 1119
;1116:
;1117:		// if they aren't in a jumping animation and the ground is a ways away, force into it
;1118:		// if we didn't do the trace, the player would be backflipping down staircases
;1119:		VectorCopy( pm->ps->origin, point );
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1120
;1120:		point[2] -= 64;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 1122
;1121:
;1122:		pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 12
ARGP4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 252
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 264
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 292
ADDP4
INDIRP4
CALLV
pop
line 1123
;1123:		if ( trace.fraction == 1.0 ) {
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $427
line 1124
;1124:			if ( pm->cmd.forwardmove >= 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $430
line 1125
;1125:				PM_ForceLegsAnim( LEGS_JUMP );
CNSTI4 18
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1126
;1126:				pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1127
;1127:			} else {
ADDRGP4 $431
JUMPV
LABELV $430
line 1128
;1128:				PM_ForceLegsAnim( LEGS_JUMPB );
CNSTI4 20
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1129
;1129:				pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1130
;1130:			}
LABELV $431
line 1131
;1131:		}
LABELV $427
line 1132
;1132:	}
LABELV $421
line 1134
;1133:
;1134:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1135
;1135:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1136
;1136:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1137
;1137:}
LABELV $420
endproc PM_GroundTraceMissed 80 28
proc PM_GroundTrace 84 28
line 1145
;1138:
;1139:
;1140:/*
;1141:=============
;1142:PM_GroundTrace
;1143:=============
;1144:*/
;1145:static void PM_GroundTrace( void ) {
line 1149
;1146:	vec3_t		point;
;1147:	trace_t		trace;
;1148:
;1149:	point[0] = pm->ps->origin[0];
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1150
;1150:	point[1] = pm->ps->origin[1];
ADDRLP4 56+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1151
;1151:	point[2] = pm->ps->origin[2] - 0.25;
ADDRLP4 56+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 1153
;1152:
;1153:	pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 252
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 264
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 292
ADDP4
INDIRP4
CALLV
pop
line 1154
;1154:	pml.groundTrace = trace;
ADDRGP4 pml+52
ADDRLP4 0
INDIRB
ASGNB 56
line 1157
;1155:
;1156:	// do something corrective if the trace starts in a solid...
;1157:	if ( trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $438
line 1158
;1158:		if ( !PM_CorrectAllSolid(&trace) )
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 PM_CorrectAllSolid
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $440
line 1159
;1159:			return;
ADDRGP4 $434
JUMPV
LABELV $440
line 1160
;1160:	}
LABELV $438
line 1163
;1161:
;1162:	// if the trace didn't hit anything, we are in free fall
;1163:	if ( trace.fraction == 1.0 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $442
line 1164
;1164:		PM_GroundTraceMissed();
ADDRGP4 PM_GroundTraceMissed
CALLV
pop
line 1165
;1165:		pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1166
;1166:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1167
;1167:		return;
ADDRGP4 $434
JUMPV
LABELV $442
line 1171
;1168:	}
;1169:
;1170:	// check if getting thrown off the ground
;1171:	if ( pm->ps->velocity[2] > 0 && DotProduct( pm->ps->velocity, trace.plane.normal ) > 10 ) {
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $447
ADDRLP4 76
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+24
INDIRF4
MULF4
ADDRLP4 76
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 0+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 76
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 0+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 1092616192
LEF4 $447
line 1172
;1172:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 0
EQI4 $454
line 1173
;1173:			Com_Printf("%i:kickoff\n", c_pmove);
ADDRGP4 $456
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1174
;1174:		}
LABELV $454
line 1176
;1175:		// go into jump animation
;1176:		if ( pm->cmd.forwardmove >= 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $457
line 1177
;1177:			PM_ForceLegsAnim( LEGS_JUMP );
CNSTI4 18
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1178
;1178:			pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1179
;1179:		} else {
ADDRGP4 $458
JUMPV
LABELV $457
line 1180
;1180:			PM_ForceLegsAnim( LEGS_JUMPB );
CNSTI4 20
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1181
;1181:			pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1182
;1182:		}
LABELV $458
line 1184
;1183:
;1184:		pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1185
;1185:		pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1186
;1186:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1187
;1187:		return;
ADDRGP4 $434
JUMPV
LABELV $447
line 1191
;1188:	}
;1189:	
;1190:	// slopes that are too steep will not be considered onground
;1191:	if ( trace.plane.normal[2] < MIN_WALK_NORMAL ) {
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1060320051
GEF4 $461
line 1192
;1192:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 0
EQI4 $465
line 1193
;1193:			Com_Printf("%i:steep\n", c_pmove);
ADDRGP4 $467
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1194
;1194:		}
LABELV $465
line 1197
;1195:		// FIXME: if they can't slide down the slope, let them
;1196:		// walk (sharp crevices)
;1197:		pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1198
;1198:		pml.groundPlane = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 1199
;1199:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1200
;1200:		return;
ADDRGP4 $434
JUMPV
LABELV $461
line 1203
;1201:	}
;1202:
;1203:	pml.groundPlane = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 1204
;1204:	pml.walking = qtrue;
ADDRGP4 pml+44
CNSTI4 1
ASGNI4
line 1207
;1205:
;1206:	// hitting solid ground will end a waterjump
;1207:	if (pm->ps->pm_flags & PMF_TIME_WATERJUMP)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $472
line 1208
;1208:	{
line 1209
;1209:		pm->ps->pm_flags &= ~(PMF_TIME_WATERJUMP | PMF_TIME_LAND);
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 -289
BANDI4
ASGNI4
line 1210
;1210:		pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1211
;1211:	}
LABELV $472
line 1213
;1212:
;1213:	if ( pm->ps->groundEntityNum == ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $474
line 1215
;1214:		// just hit the ground
;1215:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 0
EQI4 $476
line 1216
;1216:			Com_Printf("%i:Land\n", c_pmove);
ADDRGP4 $478
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1217
;1217:		}
LABELV $476
line 1219
;1218:		
;1219:		PM_CrashLand();
ADDRGP4 PM_CrashLand
CALLV
pop
line 1222
;1220:
;1221:		// don't do landing time if we were just going down a slope
;1222:		if ( pml.previous_velocity[2] < -200 ) {
ADDRGP4 pml+124+8
INDIRF4
CNSTF4 3276275712
GEF4 $479
line 1224
;1223:			// don't allow another jump for a little while
;1224:			pm->ps->pm_flags |= PMF_TIME_LAND;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1225
;1225:			pm->ps->pm_time = 250;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 250
ASGNI4
line 1226
;1226:		}
LABELV $479
line 1227
;1227:	}
LABELV $474
line 1229
;1228:
;1229:	pm->ps->groundEntityNum = trace.entityNum;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 1234
;1230:
;1231:	// don't reset the z velocity for slopes
;1232://	pm->ps->velocity[2] = 0;
;1233:
;1234:	PM_AddTouchEnt( trace.entityNum );
ADDRLP4 0+52
INDIRI4
ARGI4
ADDRGP4 PM_AddTouchEnt
CALLV
pop
line 1235
;1235:}
LABELV $434
endproc PM_GroundTrace 84 28
proc PM_SetWaterLevel 48 8
line 1243
;1236:
;1237:
;1238:/*
;1239:=============
;1240:PM_SetWaterLevel	FIXME: avoid this twice?  certainly if not moving
;1241:=============
;1242:*/
;1243:static void PM_SetWaterLevel( void ) {
line 1252
;1244:	vec3_t		point;
;1245:	int			cont;
;1246:	int			sample1;
;1247:	int			sample2;
;1248:
;1249:	//
;1250:	// get waterlevel, accounting for ducking
;1251:	//
;1252:	pm->waterlevel = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
CNSTI4 0
ASGNI4
line 1253
;1253:	pm->watertype = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 0
ASGNI4
line 1255
;1254:
;1255:	point[0] = pm->ps->origin[0];
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1256
;1256:	point[1] = pm->ps->origin[1];
ADDRLP4 0+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1257
;1257:	point[2] = pm->ps->origin[2] + MINS_Z + 1;	
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1258
;1258:	cont = pm->pointcontents( point, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 296
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 1260
;1259:
;1260:	if ( cont & MASK_WATER ) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $488
line 1261
;1261:		sample2 = pm->ps->viewheight - MINS_Z;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 -24
SUBI4
ASGNI4
line 1262
;1262:		sample1 = sample2 / 2;
ADDRLP4 20
ADDRLP4 16
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 1264
;1263:
;1264:		pm->watertype = cont;
ADDRGP4 pm
INDIRP4
CNSTI4 276
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1265
;1265:		pm->waterlevel = 1;
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
CNSTI4 1
ASGNI4
line 1266
;1266:		point[2] = pm->ps->origin[2] + MINS_Z + sample1;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1267
;1267:		cont = pm->pointcontents (point, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 296
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 1268
;1268:		if ( cont & MASK_WATER ) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $491
line 1269
;1269:			pm->waterlevel = 2;
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
CNSTI4 2
ASGNI4
line 1270
;1270:			point[2] = pm->ps->origin[2] + MINS_Z + sample2;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1271
;1271:			cont = pm->pointcontents (point, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 296
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 1272
;1272:			if ( cont & MASK_WATER ){
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $494
line 1273
;1273:				pm->waterlevel = 3;
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
CNSTI4 3
ASGNI4
line 1274
;1274:			}
LABELV $494
line 1275
;1275:		}
LABELV $491
line 1276
;1276:	}
LABELV $488
line 1278
;1277:
;1278:}
LABELV $485
endproc PM_SetWaterLevel 48 8
proc PM_CheckDuck 72 28
line 1288
;1279:
;1280:/*
;1281:==============
;1282:PM_CheckDuck
;1283:
;1284:Sets mins, maxs, and pm->ps->viewheight
;1285:==============
;1286:*/
;1287:static void PM_CheckDuck (void)
;1288:{
line 1291
;1289:	trace_t	trace;
;1290:
;1291:	if ( pm->ps->powerups[PW_INVULNERABILITY] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 368
ADDP4
INDIRI4
CNSTI4 0
EQI4 $497
line 1292
;1292:		if ( pm->ps->pm_flags & PMF_INVULEXPAND ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $499
line 1294
;1293:			// invulnerability sphere has a 42 units radius
;1294:			VectorSet( pm->mins, -42, -42, -42 );
ADDRGP4 pm
INDIRP4
CNSTI4 252
ADDP4
CNSTF4 3257401344
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 256
ADDP4
CNSTF4 3257401344
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 260
ADDP4
CNSTF4 3257401344
ASGNF4
line 1295
;1295:			VectorSet( pm->maxs, 42, 42, 42 );
ADDRGP4 pm
INDIRP4
CNSTI4 264
ADDP4
CNSTF4 1109917696
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 268
ADDP4
CNSTF4 1109917696
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 272
ADDP4
CNSTF4 1109917696
ASGNF4
line 1296
;1296:		}
ADDRGP4 $500
JUMPV
LABELV $499
line 1297
;1297:		else {
line 1298
;1298:			VectorSet( pm->mins, -15, -15, MINS_Z );
ADDRGP4 pm
INDIRP4
CNSTI4 252
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 256
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 260
ADDP4
CNSTF4 3250585600
ASGNF4
line 1299
;1299:			VectorSet( pm->maxs, 15, 15, 16 );
ADDRGP4 pm
INDIRP4
CNSTI4 264
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 268
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 272
ADDP4
CNSTF4 1098907648
ASGNF4
line 1300
;1300:		}
LABELV $500
line 1301
;1301:		pm->ps->pm_flags |= PMF_DUCKED;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1302
;1302:		pm->ps->viewheight = CROUCH_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 12
ASGNI4
line 1303
;1303:		return;
ADDRGP4 $496
JUMPV
LABELV $497
line 1305
;1304:	}
;1305:	pm->ps->pm_flags &= ~PMF_INVULEXPAND;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1307
;1306:
;1307:	pm->mins[0] = -15;
ADDRGP4 pm
INDIRP4
CNSTI4 252
ADDP4
CNSTF4 3245342720
ASGNF4
line 1308
;1308:	pm->mins[1] = -15;
ADDRGP4 pm
INDIRP4
CNSTI4 256
ADDP4
CNSTF4 3245342720
ASGNF4
line 1310
;1309:
;1310:	pm->maxs[0] = 15;
ADDRGP4 pm
INDIRP4
CNSTI4 264
ADDP4
CNSTF4 1097859072
ASGNF4
line 1311
;1311:	pm->maxs[1] = 15;
ADDRGP4 pm
INDIRP4
CNSTI4 268
ADDP4
CNSTF4 1097859072
ASGNF4
line 1313
;1312:
;1313:	pm->mins[2] = MINS_Z;
ADDRGP4 pm
INDIRP4
CNSTI4 260
ADDP4
CNSTF4 3250585600
ASGNF4
line 1315
;1314:
;1315:	if (pm->ps->pm_type == PM_DEAD)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $501
line 1316
;1316:	{
line 1317
;1317:		pm->maxs[2] = -8;
ADDRGP4 pm
INDIRP4
CNSTI4 272
ADDP4
CNSTF4 3238002688
ASGNF4
line 1318
;1318:		pm->ps->viewheight = DEAD_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 -16
ASGNI4
line 1319
;1319:		return;
ADDRGP4 $496
JUMPV
LABELV $501
line 1322
;1320:	}
;1321:
;1322:	if (pm->cmd.upmove < 0)
ADDRGP4 pm
INDIRP4
CNSTI4 103
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $503
line 1323
;1323:	{	// duck
line 1324
;1324:		pm->ps->pm_flags |= PMF_DUCKED;
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1325
;1325:	}
ADDRGP4 $504
JUMPV
LABELV $503
line 1327
;1326:	else
;1327:	{	// stand up if possible
line 1328
;1328:		if (pm->ps->pm_flags & PMF_DUCKED)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $505
line 1329
;1329:		{
line 1331
;1330:			// try to stand up
;1331:			pm->maxs[2] = 32;
ADDRGP4 pm
INDIRP4
CNSTI4 272
ADDP4
CNSTF4 1107296256
ASGNF4
line 1332
;1332:			pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, pm->ps->origin, pm->ps->clientNum, pm->tracemask );
ADDRLP4 0
ARGP4
ADDRLP4 60
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 252
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 264
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 292
ADDP4
INDIRP4
CALLV
pop
line 1333
;1333:			if (!trace.allsolid)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $507
line 1334
;1334:				pm->ps->pm_flags &= ~PMF_DUCKED;
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
LABELV $507
line 1335
;1335:		}
LABELV $505
line 1336
;1336:	}
LABELV $504
line 1338
;1337:
;1338:	if (pm->ps->pm_flags & PMF_DUCKED)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $509
line 1339
;1339:	{
line 1340
;1340:		pm->maxs[2] = 16;
ADDRGP4 pm
INDIRP4
CNSTI4 272
ADDP4
CNSTF4 1098907648
ASGNF4
line 1341
;1341:		pm->ps->viewheight = CROUCH_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 12
ASGNI4
line 1342
;1342:	}
ADDRGP4 $510
JUMPV
LABELV $509
line 1344
;1343:	else
;1344:	{
line 1345
;1345:		pm->maxs[2] = 32;
ADDRGP4 pm
INDIRP4
CNSTI4 272
ADDP4
CNSTF4 1107296256
ASGNF4
line 1346
;1346:		pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 26
ASGNI4
line 1347
;1347:	}
LABELV $510
line 1348
;1348:}
LABELV $496
endproc PM_CheckDuck 72 28
proc PM_Footsteps 24 4
line 1360
;1349:
;1350:
;1351:
;1352://===================================================================
;1353:
;1354:
;1355:/*
;1356:===============
;1357:PM_Footsteps
;1358:===============
;1359:*/
;1360:static void PM_Footsteps( void ) {
line 1373
;1361:	float		bobmove;
;1362:	float		xyspeedQ;
;1363:	int			old;
;1364:	qboolean	footstep;
;1365:
;1366:	//
;1367:	// calculate speed and cycle to be used for
;1368:	// all cyclic walking effects
;1369:	//
;1370:	//xyspeedQ = pm->ps->velocity[0] * pm->ps->velocity[0] 
;1371:	//	+ pm->ps->velocity[1] * pm->ps->velocity[1];
;1372:
;1373:	if ( pm->ps->groundEntityNum == ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $512
line 1375
;1374:
;1375:		if ( pm->ps->powerups[PW_INVULNERABILITY] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 368
ADDP4
INDIRI4
CNSTI4 0
EQI4 $514
line 1376
;1376:			PM_ContinueLegsAnim( LEGS_IDLECR );
CNSTI4 23
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1377
;1377:		}
LABELV $514
line 1379
;1378:		// airborne leaves position in cycle intact, but doesn't advance
;1379:		if ( pm->waterlevel > 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 1
LEI4 $511
line 1380
;1380:			PM_ContinueLegsAnim( LEGS_SWIM );
CNSTI4 17
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1381
;1381:		}
line 1382
;1382:		return;
ADDRGP4 $511
JUMPV
LABELV $512
line 1386
;1383:	}
;1384:
;1385:	// if not trying to move
;1386:	if ( !pm->cmd.forwardmove && !pm->cmd.rightmove ) {
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $518
ADDRLP4 16
INDIRP4
CNSTI4 102
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $518
line 1387
;1387:		xyspeedQ = pm->ps->velocity[0] * pm->ps->velocity[0] 
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 20
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1389
;1388:			+ pm->ps->velocity[1] * pm->ps->velocity[1];
;1389:		if ( xyspeedQ < 5.0*5.0 ) { // not using sqrt() there
ADDRLP4 12
INDIRF4
CNSTF4 1103626240
GEF4 $511
line 1390
;1390:			pm->ps->bobCycle = 0;	// start at beginning of cycle again
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 1391
;1391:			if ( pm->ps->pm_flags & PMF_DUCKED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $522
line 1392
;1392:				PM_ContinueLegsAnim( LEGS_IDLECR );
CNSTI4 23
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1393
;1393:			} else {
ADDRGP4 $511
JUMPV
LABELV $522
line 1394
;1394:				PM_ContinueLegsAnim( LEGS_IDLE );
CNSTI4 22
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1395
;1395:			}
line 1396
;1396:		}
line 1397
;1397:		return;
ADDRGP4 $511
JUMPV
LABELV $518
line 1401
;1398:	}
;1399:	
;1400:
;1401:	footstep = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1403
;1402:
;1403:	if ( pm->ps->pm_flags & PMF_DUCKED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $524
line 1404
;1404:		bobmove = 0.5;	// ducked characters bob much faster
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 1405
;1405:		if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $526
line 1406
;1406:			PM_ContinueLegsAnim( LEGS_BACKCR );
CNSTI4 32
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1407
;1407:		}
ADDRGP4 $525
JUMPV
LABELV $526
line 1408
;1408:		else {
line 1409
;1409:			PM_ContinueLegsAnim( LEGS_WALKCR );
CNSTI4 13
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1410
;1410:		}
line 1422
;1411:		// ducked characters never play footsteps
;1412:	/*
;1413:	} else 	if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
;1414:		if ( !( pm->cmd.buttons & BUTTON_WALKING ) ) {
;1415:			bobmove = 0.4;	// faster speeds bob faster
;1416:			footstep = qtrue;
;1417:		} else {
;1418:			bobmove = 0.3;
;1419:		}
;1420:		PM_ContinueLegsAnim( LEGS_BACK );
;1421:	*/
;1422:	} else {
ADDRGP4 $525
JUMPV
LABELV $524
line 1423
;1423:		if ( !( pm->cmd.buttons & BUTTON_WALKING ) ) {
ADDRGP4 pm
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $528
line 1424
;1424:			bobmove = 0.4f;	// faster speeds bob faster
ADDRLP4 4
CNSTF4 1053609165
ASGNF4
line 1425
;1425:			if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $530
line 1426
;1426:				PM_ContinueLegsAnim( LEGS_BACK );
CNSTI4 16
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1427
;1427:			}
ADDRGP4 $531
JUMPV
LABELV $530
line 1428
;1428:			else {
line 1429
;1429:				PM_ContinueLegsAnim( LEGS_RUN );
CNSTI4 15
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1430
;1430:			}
LABELV $531
line 1431
;1431:			footstep = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1432
;1432:		} else {
ADDRGP4 $529
JUMPV
LABELV $528
line 1433
;1433:			bobmove = 0.3f;	// walking bobs slow
ADDRLP4 4
CNSTF4 1050253722
ASGNF4
line 1434
;1434:			if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $532
line 1435
;1435:				PM_ContinueLegsAnim( LEGS_BACKWALK );
CNSTI4 33
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1436
;1436:			}
ADDRGP4 $533
JUMPV
LABELV $532
line 1437
;1437:			else {
line 1438
;1438:				PM_ContinueLegsAnim( LEGS_WALK );
CNSTI4 14
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1439
;1439:			}
LABELV $533
line 1440
;1440:		}
LABELV $529
line 1441
;1441:	}
LABELV $525
line 1444
;1442:
;1443:	// check for footstep / splash sounds
;1444:	old = pm->ps->bobCycle;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1445
;1445:	pm->ps->bobCycle = (int)( old + bobmove * pml.msec ) & 255;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
ADDRGP4 pml+40
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
CNSTI4 255
BANDI4
ASGNI4
line 1448
;1446:
;1447:	// if we just crossed a cycle boundary, play an appropriate footstep event
;1448:	if ( ( ( old + 64 ) ^ ( pm->ps->bobCycle + 64 ) ) & 128 ) {
ADDRLP4 0
INDIRI4
CNSTI4 64
ADDI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 64
ADDI4
BXORI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $535
line 1449
;1449:		if ( pm->waterlevel == 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 0
NEI4 $537
line 1451
;1450:			// on ground will only play sounds if running
;1451:			if ( footstep ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $538
line 1452
;1452:				PM_AddEvent( PM_FootstepForSurface() );
ADDRLP4 20
ADDRGP4 PM_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1453
;1453:			}
line 1454
;1454:		} else if ( pm->waterlevel == 1 ) {
ADDRGP4 $538
JUMPV
LABELV $537
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 1
NEI4 $541
line 1456
;1455:			// splashing
;1456:			PM_AddEvent( EV_FOOTSPLASH );
CNSTI4 3
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1457
;1457:		} else if ( pm->waterlevel == 2 ) {
ADDRGP4 $542
JUMPV
LABELV $541
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 2
NEI4 $543
line 1459
;1458:			// wading / swimming at surface
;1459:			PM_AddEvent( EV_SWIM );
CNSTI4 5
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1460
;1460:		} else if ( pm->waterlevel == 3 ) {
ADDRGP4 $544
JUMPV
LABELV $543
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 3
NEI4 $545
line 1463
;1461:			// no sound when completely underwater
;1462:
;1463:		}
LABELV $545
LABELV $544
LABELV $542
LABELV $538
line 1464
;1464:	}
LABELV $535
line 1465
;1465:}
LABELV $511
endproc PM_Footsteps 24 4
proc PM_WaterEvents 0 4
line 1474
;1466:
;1467:/*
;1468:==============
;1469:PM_WaterEvents
;1470:
;1471:Generate sound events for entering and leaving water
;1472:==============
;1473:*/
;1474:static void PM_WaterEvents( void ) {		// FIXME?
line 1478
;1475:	//
;1476:	// if just entered a water volume, play a sound
;1477:	//
;1478:	if (!pml.previous_waterlevel && pm->waterlevel) {
ADDRGP4 pml+136
INDIRI4
CNSTI4 0
NEI4 $548
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $548
line 1479
;1479:		PM_AddEvent( EV_WATER_TOUCH );
CNSTI4 15
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1480
;1480:	}
LABELV $548
line 1485
;1481:
;1482:	//
;1483:	// if just completely exited a water volume, play a sound
;1484:	//
;1485:	if (pml.previous_waterlevel && !pm->waterlevel) {
ADDRGP4 pml+136
INDIRI4
CNSTI4 0
EQI4 $551
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 0
NEI4 $551
line 1486
;1486:		PM_AddEvent( EV_WATER_LEAVE );
CNSTI4 16
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1487
;1487:	}
LABELV $551
line 1492
;1488:
;1489:	//
;1490:	// check for head just going under water
;1491:	//
;1492:	if (pml.previous_waterlevel != 3 && pm->waterlevel == 3) {
ADDRGP4 pml+136
INDIRI4
CNSTI4 3
EQI4 $554
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 3
NEI4 $554
line 1493
;1493:		PM_AddEvent( EV_WATER_UNDER );
CNSTI4 17
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1494
;1494:	}
LABELV $554
line 1499
;1495:
;1496:	//
;1497:	// check for head just coming out of water
;1498:	//
;1499:	if (pml.previous_waterlevel == 3 && pm->waterlevel != 3) {
ADDRGP4 pml+136
INDIRI4
CNSTI4 3
NEI4 $557
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 3
EQI4 $557
line 1500
;1500:		PM_AddEvent( EV_WATER_CLEAR );
CNSTI4 18
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1501
;1501:	}
LABELV $557
line 1502
;1502:}
LABELV $547
endproc PM_WaterEvents 0 4
proc PM_BeginWeaponChange 8 4
line 1510
;1503:
;1504:
;1505:/*
;1506:===============
;1507:PM_BeginWeaponChange
;1508:===============
;1509:*/
;1510:static void PM_BeginWeaponChange( int weapon ) {
line 1511
;1511:	if ( weapon <= WP_NONE || weapon >= WP_NUM_WEAPONS ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $563
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $561
LABELV $563
line 1512
;1512:		return;
ADDRGP4 $560
JUMPV
LABELV $561
line 1515
;1513:	}
;1514:
;1515:	if ( !( pm->ps->stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $564
line 1516
;1516:		return;
ADDRGP4 $560
JUMPV
LABELV $564
line 1519
;1517:	}
;1518:	
;1519:	if ( pm->ps->weaponstate == WEAPON_DROPPING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $566
line 1520
;1520:		pm->ps->eFlags &= ~EF_FIRING;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 1521
;1521:		return;
ADDRGP4 $560
JUMPV
LABELV $566
line 1524
;1522:	}
;1523:
;1524:	PM_AddEvent( EV_CHANGE_WEAPON );
CNSTI4 23
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1525
;1525:	pm->ps->weaponstate = WEAPON_DROPPING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 1526
;1526:	pm->ps->weaponTime += 200;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1527
;1527:	PM_StartTorsoAnim( TORSO_DROP );
CNSTI4 9
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1528
;1528:}
LABELV $560
endproc PM_BeginWeaponChange 8 4
proc PM_FinishWeaponChange 16 4
line 1536
;1529:
;1530:
;1531:/*
;1532:===============
;1533:PM_FinishWeaponChange
;1534:===============
;1535:*/
;1536:static void PM_FinishWeaponChange( void ) {
line 1539
;1537:	int		weapon;
;1538:
;1539:	weapon = pm->cmd.weapon;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
CNSTI4 100
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 1540
;1540:	if ( weapon < WP_NONE || weapon >= WP_NUM_WEAPONS ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $571
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $569
LABELV $571
line 1541
;1541:		weapon = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1542
;1542:	}
LABELV $569
line 1544
;1543:
;1544:	if ( !( pm->ps->stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $572
line 1545
;1545:		weapon = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1546
;1546:	}
LABELV $572
line 1548
;1547:
;1548:	pm->ps->weapon = weapon;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1549
;1549:	pm->ps->weaponstate = WEAPON_RAISING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 1550
;1550:	pm->ps->eFlags &= ~EF_FIRING;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 1551
;1551:	pm->ps->weaponTime += 250;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 1552
;1552:	PM_StartTorsoAnim( TORSO_RAISE );
CNSTI4 10
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1553
;1553:}
LABELV $568
endproc PM_FinishWeaponChange 16 4
proc PM_TorsoAnimation 4 4
line 1562
;1554:
;1555:
;1556:/*
;1557:==============
;1558:PM_TorsoAnimation
;1559:
;1560:==============
;1561:*/
;1562:static void PM_TorsoAnimation( void ) {
line 1563
;1563:	if ( pm->ps->weaponstate == WEAPON_READY ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
NEI4 $575
line 1565
;1564:#ifdef USE_VR
;1565:		if ( pm->ps->weapon == WP_GAUNTLET || 
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
EQI4 $579
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 11
NEI4 $577
LABELV $579
line 1566
;1566:			 pm->ps->weapon == WP_VR_CONTROLLER ) {
line 1567
;1567:			PM_ContinueTorsoAnim( TORSO_STAND2 );
CNSTI4 12
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
line 1568
;1568:		} else
ADDRGP4 $574
JUMPV
LABELV $577
line 1570
;1569:#endif
;1570:		{
line 1571
;1571:			PM_ContinueTorsoAnim( TORSO_STAND );
CNSTI4 11
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
line 1572
;1572:		}
line 1573
;1573:		return;
LABELV $575
line 1575
;1574:	}
;1575:}
LABELV $574
endproc PM_TorsoAnimation 4 4
proc PM_Weapon 32 4
line 1585
;1576:
;1577:
;1578:/*
;1579:==============
;1580:PM_Weapon
;1581:
;1582:Generates weapon events and modifes the weapon counter
;1583:==============
;1584:*/
;1585:static void PM_Weapon( void ) {
line 1589
;1586:	int		addTime;
;1587:
;1588:	// don't allow attack until all buttons are up
;1589:	if ( pm->ps->pm_flags & PMF_RESPAWNED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $581
line 1590
;1590:		return;
ADDRGP4 $580
JUMPV
LABELV $581
line 1594
;1591:	}
;1592:
;1593:	// ignore if spectator
;1594:	if ( pm->ps->persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
NEI4 $583
line 1595
;1595:		return;
ADDRGP4 $580
JUMPV
LABELV $583
line 1599
;1596:	}
;1597:
;1598:	// check for dead player
;1599:	if ( pm->ps->stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $585
line 1600
;1600:		pm->ps->weapon = WP_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 1601
;1601:		return;
ADDRGP4 $580
JUMPV
LABELV $585
line 1607
;1602:	}
;1603:
;1604:#ifdef USE_VR
;1605:	// VR client
;1606:#ifdef USE_VR_QVM
;1607:	if ( pm->ps->vr_controller_type )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $587
line 1610
;1608:#endif
;1609:	// select VR controller model when virtual menu is open
;1610:	if ( pm->cmd.buttons & BUTTON_TALK ) {
ADDRGP4 pm
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $589
line 1611
;1611:		pm->cmd.weapon = WP_VR_CONTROLLER;
ADDRGP4 pm
INDIRP4
CNSTI4 100
ADDP4
CNSTU1 11
ASGNU1
line 1612
;1612:		pm->ps->weapon = WP_VR_CONTROLLER;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 11
ASGNI4
line 1613
;1613:	}
LABELV $589
LABELV $587
line 1617
;1614:#endif // USE_VR
;1615:
;1616:	// check for item using
;1617:	if ( pm->cmd.buttons & BUTTON_USE_HOLDABLE ) {
ADDRGP4 pm
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $591
line 1618
;1618:		if ( ! ( pm->ps->pm_flags & PMF_USE_ITEM_HELD ) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $592
line 1619
;1619:			if ( bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag == HI_MEDKIT
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 2
NEI4 $595
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 25
ADDI4
LTI4 $595
line 1620
;1620:				&& pm->ps->stats[STAT_HEALTH] >= (pm->ps->stats[STAT_MAX_HEALTH] + 25) ) {
line 1622
;1621:				// don't use medkit if at max health
;1622:			} else {
ADDRGP4 $580
JUMPV
LABELV $595
line 1623
;1623:				pm->ps->pm_flags |= PMF_USE_ITEM_HELD;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 1624
;1624:				PM_AddEvent( EV_USE_ITEM0 + bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1625
;1625:				pm->ps->stats[STAT_HOLDABLE_ITEM] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 1626
;1626:			}
line 1627
;1627:			return;
ADDRGP4 $580
JUMPV
line 1629
;1628:		}
;1629:	} else {
LABELV $591
line 1630
;1630:		pm->ps->pm_flags &= ~PMF_USE_ITEM_HELD;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 1631
;1631:	}
LABELV $592
line 1635
;1632:
;1633:
;1634:	// make weapon function
;1635:	if ( pm->ps->weaponTime > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $599
line 1636
;1636:		pm->ps->weaponTime -= pml.msec;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 1637
;1637:	}
LABELV $599
line 1642
;1638:
;1639:	// check for weapon change
;1640:	// can't change if weapon is firing, but can change
;1641:	// again if lowering or raising
;1642:	if ( pm->ps->weaponTime <= 0 || pm->ps->weaponstate != WEAPON_FIRING ) {
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $604
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 3
EQI4 $602
LABELV $604
line 1643
;1643:		if ( pm->ps->weapon != pm->cmd.weapon ) {
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 100
ADDP4
INDIRU1
CVUI4 1
EQI4 $605
line 1644
;1644:			PM_BeginWeaponChange( pm->cmd.weapon );
ADDRGP4 pm
INDIRP4
CNSTI4 100
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRGP4 PM_BeginWeaponChange
CALLV
pop
line 1645
;1645:		}
LABELV $605
line 1646
;1646:	}
LABELV $602
line 1648
;1647:
;1648:	if ( pm->ps->weaponTime > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $607
line 1649
;1649:		return;
ADDRGP4 $580
JUMPV
LABELV $607
line 1653
;1650:	}
;1651:
;1652:	// change weapon if time
;1653:	if ( pm->ps->weaponstate == WEAPON_DROPPING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $609
line 1654
;1654:		PM_FinishWeaponChange();
ADDRGP4 PM_FinishWeaponChange
CALLV
pop
line 1655
;1655:		return;
ADDRGP4 $580
JUMPV
LABELV $609
line 1658
;1656:	}
;1657:
;1658:	if ( pm->ps->weaponstate == WEAPON_RAISING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1
NEI4 $611
line 1659
;1659:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1660
;1660:		if ( pm->ps->weapon == WP_GAUNTLET
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
EQI4 $615
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 11
NEI4 $613
LABELV $615
line 1664
;1661:#ifdef USE_VR
;1662:			 || pm->ps->weapon == WP_VR_CONTROLLER
;1663:#endif
;1664:			) {
line 1665
;1665:			PM_StartTorsoAnim( TORSO_STAND2 );
CNSTI4 12
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1666
;1666:		} else {
ADDRGP4 $580
JUMPV
LABELV $613
line 1667
;1667:			PM_StartTorsoAnim( TORSO_STAND );
CNSTI4 11
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1668
;1668:		}
line 1669
;1669:		return;
ADDRGP4 $580
JUMPV
LABELV $611
line 1673
;1670:	}
;1671:
;1672:	// check for fire
;1673:	if ( ! (pm->cmd.buttons & BUTTON_ATTACK) ) {
ADDRGP4 pm
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $616
line 1674
;1674:		pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1675
;1675:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1676
;1676:		return;
ADDRGP4 $580
JUMPV
LABELV $616
line 1680
;1677:	}
;1678:
;1679:	// start the animation even if out of ammo
;1680:	if ( pm->ps->weapon == WP_GAUNTLET
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
EQI4 $620
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 11
NEI4 $618
LABELV $620
line 1684
;1681:#ifdef USE_VR
;1682:		|| pm->ps->weapon == WP_VR_CONTROLLER
;1683:#endif
;1684:		) {
line 1686
;1685:		// the guantlet only "fires" when it actually hits something
;1686:		if ( !pm->gauntletHit ) {
ADDRGP4 pm
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 0
NEI4 $621
line 1687
;1687:			pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1688
;1688:			pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1689
;1689:			return;
ADDRGP4 $580
JUMPV
LABELV $621
line 1691
;1690:		}
;1691:		PM_StartTorsoAnim( TORSO_ATTACK2 );
CNSTI4 8
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1692
;1692:	} else {
ADDRGP4 $619
JUMPV
LABELV $618
line 1693
;1693:		PM_StartTorsoAnim( TORSO_ATTACK );
CNSTI4 7
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1694
;1694:	}
LABELV $619
line 1696
;1695:
;1696:	pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 1699
;1697:
;1698:	// check for out of ammo
;1699:	if ( ! pm->ps->ammo[ pm->ps->weapon ] ) {
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $623
line 1700
;1700:		PM_AddEvent( EV_NOAMMO );
CNSTI4 22
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1701
;1701:		pm->ps->weaponTime += 500;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1702
;1702:		return;
ADDRGP4 $580
JUMPV
LABELV $623
line 1706
;1703:	}
;1704:
;1705:	// take an ammo away if not infinite
;1706:	if ( pm->ps->ammo[ pm->ps->weapon ] != -1 ) {
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $625
line 1707
;1707:		pm->ps->ammo[ pm->ps->weapon ]--;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 376
ADDP4
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1708
;1708:	}
LABELV $625
line 1711
;1709:
;1710:	// fire weapon
;1711:	PM_AddEvent( EV_FIRE_WEAPON );
CNSTI4 24
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1713
;1712:
;1713:	switch( pm->ps->weapon ) {
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
LTI4 $627
ADDRLP4 20
INDIRI4
CNSTI4 11
GTI4 $627
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $641-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $641
address $630
address $633
address $632
address $634
address $635
address $631
address $637
address $636
address $638
address $639
address $640
code
LABELV $627
LABELV $630
line 1716
;1714:	default:
;1715:	case WP_GAUNTLET:
;1716:		addTime = 400;
ADDRLP4 0
CNSTI4 400
ASGNI4
line 1717
;1717:		break;
ADDRGP4 $628
JUMPV
LABELV $631
line 1719
;1718:	case WP_LIGHTNING:
;1719:		addTime = 50;
ADDRLP4 0
CNSTI4 50
ASGNI4
line 1720
;1720:		break;
ADDRGP4 $628
JUMPV
LABELV $632
line 1722
;1721:	case WP_SHOTGUN:
;1722:		addTime = 1000;
ADDRLP4 0
CNSTI4 1000
ASGNI4
line 1723
;1723:		break;
ADDRGP4 $628
JUMPV
LABELV $633
line 1725
;1724:	case WP_MACHINEGUN:
;1725:		addTime = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 1726
;1726:		break;
ADDRGP4 $628
JUMPV
LABELV $634
line 1728
;1727:	case WP_GRENADE_LAUNCHER:
;1728:		addTime = 800;
ADDRLP4 0
CNSTI4 800
ASGNI4
line 1729
;1729:		break;
ADDRGP4 $628
JUMPV
LABELV $635
line 1731
;1730:	case WP_ROCKET_LAUNCHER:
;1731:		addTime = 800;
ADDRLP4 0
CNSTI4 800
ASGNI4
line 1732
;1732:		break;
ADDRGP4 $628
JUMPV
LABELV $636
line 1734
;1733:	case WP_PLASMAGUN:
;1734:		addTime = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 1735
;1735:		break;
ADDRGP4 $628
JUMPV
LABELV $637
line 1737
;1736:	case WP_RAILGUN:
;1737:		addTime = 1500;
ADDRLP4 0
CNSTI4 1500
ASGNI4
line 1738
;1738:		break;
ADDRGP4 $628
JUMPV
LABELV $638
line 1740
;1739:	case WP_BFG:
;1740:		addTime = 200;
ADDRLP4 0
CNSTI4 200
ASGNI4
line 1741
;1741:		break;
ADDRGP4 $628
JUMPV
LABELV $639
line 1744
;1742:#ifdef USE_GRAPPLING_HOOK
;1743:	case WP_GRAPPLING_HOOK:
;1744:		addTime = 400;
ADDRLP4 0
CNSTI4 400
ASGNI4
line 1745
;1745:		break;
ADDRGP4 $628
JUMPV
LABELV $640
line 1762
;1746:#endif
;1747:
;1748:#ifdef MISSIONPACK
;1749:	case WP_NAILGUN:
;1750:		addTime = 1000;
;1751:		break;
;1752:	case WP_PROX_LAUNCHER:
;1753:		addTime = 800;
;1754:		break;
;1755:	case WP_CHAINGUN:
;1756:		addTime = 30;
;1757:		break;
;1758:#endif
;1759:
;1760:#ifdef USE_VR
;1761:	case WP_VR_CONTROLLER:
;1762:		addTime = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 1763
;1763:		break;
LABELV $628
line 1776
;1764:	}
;1765:#endif
;1766:#ifdef MISSIONPACK
;1767:	if( bg_itemlist[pm->ps->stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
;1768:		addTime /= 1.5;
;1769:	}
;1770:	else
;1771:	if( bg_itemlist[pm->ps->stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
;1772:		addTime /= 1.3;
;1773:  }
;1774:  else
;1775:#endif
;1776:	if ( pm->ps->powerups[PW_HASTE] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CNSTI4 0
EQI4 $643
line 1777
;1777:		addTime /= 1.3;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1061481551
MULF4
CVFI4 4
ASGNI4
line 1778
;1778:	}
LABELV $643
line 1780
;1779:
;1780:	pm->ps->weaponTime += addTime;
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 1781
;1781:}
LABELV $580
endproc PM_Weapon 32 4
proc PM_Animate 0 4
line 1789
;1782:
;1783:/*
;1784:================
;1785:PM_Animate
;1786:================
;1787:*/
;1788:
;1789:static void PM_Animate( void ) {
line 1790
;1790:	if ( pm->cmd.buttons & BUTTON_GESTURE ) {
ADDRGP4 pm
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $646
line 1791
;1791:		if ( pm->ps->torsoTimer == 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
NEI4 $648
line 1792
;1792:			PM_StartTorsoAnim( TORSO_GESTURE );
CNSTI4 6
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1793
;1793:			pm->ps->torsoTimer = TIMER_GESTURE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 2294
ASGNI4
line 1794
;1794:			PM_AddEvent( EV_TAUNT );
CNSTI4 77
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1795
;1795:		}
LABELV $648
line 1828
;1796:#ifdef MISSIONPACK
;1797:	} else if ( pm->cmd.buttons & BUTTON_GETFLAG ) {
;1798:		if ( pm->ps->torsoTimer == 0 ) {
;1799:			PM_StartTorsoAnim( TORSO_GETFLAG );
;1800:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;1801:		}
;1802:	} else if ( pm->cmd.buttons & BUTTON_GUARDBASE ) {
;1803:		if ( pm->ps->torsoTimer == 0 ) {
;1804:			PM_StartTorsoAnim( TORSO_GUARDBASE );
;1805:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;1806:		}
;1807:	} else if ( pm->cmd.buttons & BUTTON_PATROL ) {
;1808:		if ( pm->ps->torsoTimer == 0 ) {
;1809:			PM_StartTorsoAnim( TORSO_PATROL );
;1810:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;1811:		}
;1812:	} else if ( pm->cmd.buttons & BUTTON_FOLLOWME ) {
;1813:		if ( pm->ps->torsoTimer == 0 ) {
;1814:			PM_StartTorsoAnim( TORSO_FOLLOWME );
;1815:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;1816:		}
;1817:	} else if ( pm->cmd.buttons & BUTTON_AFFIRMATIVE ) {
;1818:		if ( pm->ps->torsoTimer == 0 ) {
;1819:			PM_StartTorsoAnim( TORSO_AFFIRMATIVE);
;1820:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;1821:		}
;1822:	} else if ( pm->cmd.buttons & BUTTON_NEGATIVE ) {
;1823:		if ( pm->ps->torsoTimer == 0 ) {
;1824:			PM_StartTorsoAnim( TORSO_NEGATIVE );
;1825:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;1826:		}
;1827:#endif
;1828:	}
LABELV $646
line 1829
;1829:}
LABELV $645
endproc PM_Animate 0 4
proc PM_DropTimers 4 0
line 1837
;1830:
;1831:
;1832:/*
;1833:================
;1834:PM_DropTimers
;1835:================
;1836:*/
;1837:static void PM_DropTimers( void ) {
line 1839
;1838:	// drop misc timing counter
;1839:	if ( pm->ps->pm_time ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $651
line 1840
;1840:		if ( pml.msec >= pm->ps->pm_time ) {
ADDRGP4 pml+40
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
LTI4 $653
line 1841
;1841:			pm->ps->pm_flags &= ~PMF_ALL_TIMES;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -353
BANDI4
ASGNI4
line 1842
;1842:			pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1843
;1843:		} else {
ADDRGP4 $654
JUMPV
LABELV $653
line 1844
;1844:			pm->ps->pm_time -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 1845
;1845:		}
LABELV $654
line 1846
;1846:	}
LABELV $651
line 1849
;1847:
;1848:	// drop animation counter
;1849:	if ( pm->ps->legsTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
LEI4 $657
line 1850
;1850:		pm->ps->legsTimer -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 1851
;1851:		if ( pm->ps->legsTimer < 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
GEI4 $660
line 1852
;1852:			pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 1853
;1853:		}
LABELV $660
line 1854
;1854:	}
LABELV $657
line 1856
;1855:
;1856:	if ( pm->ps->torsoTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
LEI4 $662
line 1857
;1857:		pm->ps->torsoTimer -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 1858
;1858:		if ( pm->ps->torsoTimer < 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
GEI4 $665
line 1859
;1859:			pm->ps->torsoTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 0
ASGNI4
line 1860
;1860:		}
LABELV $665
line 1861
;1861:	}
LABELV $662
line 1862
;1862:}
LABELV $650
endproc PM_DropTimers 4 0
export PM_UpdateViewAngles
proc PM_UpdateViewAngles 44 0
line 1872
;1863:
;1864:/*
;1865:================
;1866:PM_UpdateViewAngles
;1867:
;1868:This can be used as another entry point when only the viewangles
;1869:are being updated instead of a full move
;1870:================
;1871:*/
;1872:void PM_UpdateViewAngles( playerState_t *ps, const usercmd_t *cmd ) {
line 1878
;1873:	short	temp;
;1874:	int		i;
;1875:	int		vr_controller_type;
;1876:	qboolean mySelf;
;1877:	
;1878:	mySelf = (pm->ps->clientNum == ps->clientNum);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
NEI4 $669
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $670
JUMPV
LABELV $669
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $670
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 1885
;1879:
;1880:#ifdef USE_NATIVE_HACK
;1881:	if ( mySelf )
;1882:		vr_controller_type = vrinfo->vr_controller_type;
;1883:#endif
;1884:#ifdef USE_VR_QVM
;1885:	if ( mySelf )
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $671
line 1886
;1886:		vr_controller_type = pm->ps->vr_controller_type;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $672
JUMPV
LABELV $671
line 1888
;1887:	else
;1888:		vr_controller_type = ps->vr_controller_type;//is this usefull?
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
LABELV $672
line 1892
;1889:#endif
;1890:
;1891:	// always allow view update for VR user
;1892:	if ( !vr_controller_type )
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $673
line 1893
;1893:	{
line 1894
;1894:		if ( ps->pm_type == PM_INTERMISSION || ps->pm_type == PM_SPINTERMISSION ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
EQI4 $677
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 6
NEI4 $675
LABELV $677
line 1895
;1895:			return;		// no view changes at all
ADDRGP4 $667
JUMPV
LABELV $675
line 1898
;1896:		}
;1897:	
;1898:		if ( ps->pm_type != PM_SPECTATOR && ps->stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $678
ADDRLP4 24
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $678
line 1899
;1899:			return;		// no view changes at all
ADDRGP4 $667
JUMPV
LABELV $678
line 1901
;1900:		}
;1901:	}
LABELV $673
line 1904
;1902:
;1903:	// circularly clamp the view angles with deltas
;1904:	for ( i = 0; i < 3; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $680
line 1906
;1905:#ifdef USE_VR
;1906:		if ( mySelf && vr_controller_type >= 2 )
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $684
ADDRLP4 8
INDIRI4
CNSTI4 2
LTI4 $684
line 1907
;1907:		{
line 1909
;1908:			//Client is the VR player in the singleplayer game
;1909:			temp = cmd->angles[i] + (i == YAW ? ps->delta_angles[i] : 0);
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $687
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $688
JUMPV
LABELV $687
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $688
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
CVII2 4
ASGNI2
line 1910
;1910:		}
ADDRGP4 $685
JUMPV
LABELV $684
line 1913
;1911:		else
;1912:#endif
;1913:		{
line 1916
;1914:			//Client is either a BOT or we are running multiplayer, or
;1915:			//the vr player playing on a remote server (since this is shared code by game and cgame)
;1916:			temp = cmd->angles[i] + ps->delta_angles[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDP4
INDIRI4
ADDI4
CVII2 4
ASGNI2
line 1917
;1917:		}
LABELV $685
line 1919
;1918:
;1919:		if ( i == PITCH ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $689
line 1921
;1920:			// don't let the player look up or down more than 90 degrees
;1921:			if ( temp > 16000 ) {
ADDRLP4 4
INDIRI2
CVII4 2
CNSTI4 16000
LEI4 $691
line 1922
;1922:				ps->delta_angles[i] = (16000 - cmd->angles[i]) & 0xFFFF;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDP4
CNSTI4 16000
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
SUBI4
CNSTI4 65535
BANDI4
ASGNI4
line 1923
;1923:				temp = 16000;
ADDRLP4 4
CNSTI2 16000
ASGNI2
line 1924
;1924:			} else if ( temp < -16000 ) {
ADDRGP4 $692
JUMPV
LABELV $691
ADDRLP4 4
INDIRI2
CVII4 2
CNSTI4 -16000
GEI4 $693
line 1925
;1925:				ps->delta_angles[i] = (-16000 - cmd->angles[i]) & 0xFFFF;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDP4
CNSTI4 -16000
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
SUBI4
CNSTI4 65535
BANDI4
ASGNI4
line 1926
;1926:				temp = -16000;
ADDRLP4 4
CNSTI2 -16000
ASGNI2
line 1927
;1927:			}
LABELV $693
LABELV $692
line 1928
;1928:		}
LABELV $689
line 1932
;1929:		//==================
;1930:		//  Headset angles
;1931:		//==================
;1932:		ps->viewangles[i] = SHORT2ANGLE(temp);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
ADDP4
ADDRLP4 4
INDIRI2
CVII4 2
CVIF4 4
CNSTF4 1001652224
MULF4
ASGNF4
line 1935
;1933:
;1934:#ifdef USE_VR_QVM
;1935:		if ( vr_controller_type ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $695
line 1939
;1936:			//==================
;1937:			//  Headset pos
;1938:			//==================
;1939:			ps->HMD_raw_origin[i] = (float)cmd->hmd_origin[i] / 1000.0f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ASGNF4
line 1944
;1940:
;1941:			//==================
;1942:			//  Right hand muzzle pos
;1943:			//==================
;1944:			ps->right_muzzle_position[i] = (float)cmd->right_muzzle_pos[i] / 1000.0f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ASGNF4
line 1949
;1945:			
;1946:			//==================
;1947:			//  Right hand angles
;1948:			//==================
;1949:			temp = cmd->right_hand_angles[i] + ps->delta_spawn_angles[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ADDP4
INDIRI4
ADDI4
CVII2 4
ASGNI2
line 1950
;1950:			ps->right_hand_angles[i] = SHORT2ANGLE( temp );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ADDP4
ADDRLP4 4
INDIRI2
CVII4 2
CVIF4 4
CNSTF4 1001652224
MULF4
ASGNF4
line 1952
;1951:
;1952:			if ( vr_controller_type >= 2 )
ADDRLP4 8
INDIRI4
CNSTI4 2
LTI4 $697
line 1953
;1953:			{
line 1957
;1954:				//==================
;1955:				//  Right hand position
;1956:				//==================
;1957:				ps->right_hand_position[i] = (float)cmd->right_hand_pos[i] / 1000.0f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ASGNF4
line 1962
;1958:
;1959:				//==================
;1960:				//  Left hand position
;1961:				//==================
;1962:				ps->left_hand_position[i] = (float)cmd->left_hand_pos[i] / 1000.0f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 76
ADDP4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ASGNF4
line 1967
;1963:
;1964:				//==================
;1965:				//  Left hand angles
;1966:				//==================
;1967:				temp = cmd->left_hand_angles[i] + ps->delta_spawn_angles[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ADDP4
INDIRI4
ADDI4
CVII2 4
ASGNI2
line 1968
;1968:				ps->left_hand_angles[i] = SHORT2ANGLE(temp);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
ADDP4
ADDRLP4 4
INDIRI2
CVII4 2
CVIF4 4
CNSTF4 1001652224
MULF4
ASGNF4
line 1969
;1969:			}
LABELV $697
line 1970
;1970:		}
LABELV $695
line 1972
;1971:
;1972:		ps->vrFlags = cmd->vrFlags;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ASGNI4
line 1974
;1973:#endif // USE_VR_QVM
;1974:	}
LABELV $681
line 1904
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $680
line 1975
;1975:}
LABELV $667
endproc PM_UpdateViewAngles 44 0
export PmoveSingle
proc PmoveSingle 36 16
line 1986
;1976:
;1977:
;1978:/*
;1979:================
;1980:PmoveSingle
;1981:
;1982:================
;1983:*/
;1984:void trap_SnapVector( float *v );
;1985:
;1986:void PmoveSingle (pmove_t *pmove) {
line 1987
;1987:	pm = pmove;
ADDRGP4 pm
ADDRFP4 0
INDIRP4
ASGNP4
line 1991
;1988:
;1989:	// this counter lets us debug movement problems with a journal
;1990:	// by setting a conditional breakpoint fot the previous frame
;1991:	c_pmove++;
ADDRLP4 0
ADDRGP4 c_pmove
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1994
;1992:
;1993:	// clear results
;1994:	pm->numtouch = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 120
ADDP4
CNSTI4 0
ASGNI4
line 1995
;1995:	pm->watertype = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 0
ASGNI4
line 1996
;1996:	pm->waterlevel = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
CNSTI4 0
ASGNI4
line 1998
;1997:
;1998:	if ( pm->ps->stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $700
line 1999
;1999:		pm->tracemask &= ~CONTENTS_BODY;	// corpses can fly through bodies
ADDRLP4 4
ADDRGP4 pm
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -33554433
BANDI4
ASGNI4
line 2000
;2000:	}
LABELV $700
line 2004
;2001:
;2002:	// make sure walking button is clear if they are running, to avoid
;2003:	// proxy no-footsteps cheats
;2004:	if ( abs( pm->cmd.forwardmove ) > 64 || abs( pm->cmd.rightmove ) > 64 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 64
GTI4 $704
ADDRGP4 pm
INDIRP4
CNSTI4 102
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 64
LEI4 $702
LABELV $704
line 2005
;2005:		pm->cmd.buttons &= ~BUTTON_WALKING;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
CNSTI4 96
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 2006
;2006:	}
LABELV $702
line 2009
;2007:
;2008:	// set the talk balloon flag
;2009:	if ( pm->cmd.buttons & BUTTON_TALK ) {
ADDRGP4 pm
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $705
line 2010
;2010:		pm->ps->eFlags |= EF_TALK;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2011
;2011:	} else {
ADDRGP4 $706
JUMPV
LABELV $705
line 2012
;2012:		pm->ps->eFlags &= ~EF_TALK;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 2013
;2013:	}
LABELV $706
line 2016
;2014:
;2015:	// set the firing flag for continuous beam weapons
;2016:	if ( !(pm->ps->pm_flags & PMF_RESPAWNED) && pm->ps->pm_type != PM_INTERMISSION && pm->ps->pm_type != PM_NOCLIP
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $707
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
EQI4 $707
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $707
ADDRLP4 12
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $707
ADDRLP4 16
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $707
line 2017
;2017:		&& ( pm->cmd.buttons & BUTTON_ATTACK ) && pm->ps->ammo[ pm->ps->weapon ] ) {
line 2018
;2018:		pm->ps->eFlags |= EF_FIRING;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 2019
;2019:	} else {
ADDRGP4 $708
JUMPV
LABELV $707
line 2020
;2020:		pm->ps->eFlags &= ~EF_FIRING;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 2021
;2021:	}
LABELV $708
line 2024
;2022:
;2023:	// clear the respawned flag if attack and use are cleared
;2024:	if ( pm->ps->stats[STAT_HEALTH] > 0 && 
ADDRLP4 20
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $709
ADDRLP4 20
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 5
BANDI4
CNSTI4 0
NEI4 $709
line 2025
;2025:		!( pm->cmd.buttons & (BUTTON_ATTACK | BUTTON_USE_HOLDABLE) ) ) {
line 2026
;2026:		pm->ps->pm_flags &= ~PMF_RESPAWNED;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 2027
;2027:	}
LABELV $709
line 2032
;2028:
;2029:	// if talk button is down, dissallow all other input
;2030:	// this is to prevent any possible intercept proxy from
;2031:	// adding fake talk balloons
;2032:	if ( pmove->cmd.buttons & BUTTON_TALK ) {
ADDRFP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $711
line 2035
;2033:		// keep the talk button set tho for when the cmd.serverTime > 66 msec
;2034:		// and the same cmd is used multiple times in Pmove
;2035:		pmove->cmd.buttons = BUTTON_TALK;
ADDRFP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 2
ASGNI4
line 2036
;2036:		pmove->cmd.forwardmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 101
ADDP4
CNSTI1 0
ASGNI1
line 2037
;2037:		pmove->cmd.rightmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 102
ADDP4
CNSTI1 0
ASGNI1
line 2038
;2038:		pmove->cmd.upmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 103
ADDP4
CNSTI1 0
ASGNI1
line 2039
;2039:	}
LABELV $711
line 2042
;2040:
;2041:	// clear all pmove local vars
;2042:	memset (&pml, 0, sizeof(pml));
ADDRGP4 pml
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2045
;2043:
;2044:	// determine the time
;2045:	pml.msec = pmove->cmd.serverTime - pm->ps->commandTime;
ADDRGP4 pml+40
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 2046
;2046:	if ( pml.msec < 1 ) {
ADDRGP4 pml+40
INDIRI4
CNSTI4 1
GEI4 $714
line 2047
;2047:		pml.msec = 1;
ADDRGP4 pml+40
CNSTI4 1
ASGNI4
line 2048
;2048:	} else if ( pml.msec > 200 ) {
ADDRGP4 $715
JUMPV
LABELV $714
ADDRGP4 pml+40
INDIRI4
CNSTI4 200
LEI4 $718
line 2049
;2049:		pml.msec = 200;
ADDRGP4 pml+40
CNSTI4 200
ASGNI4
line 2050
;2050:	}
LABELV $718
LABELV $715
line 2051
;2051:	pm->ps->commandTime = pmove->cmd.serverTime;
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2054
;2052:
;2053:	// save old org in case we get stuck
;2054:	VectorCopy (pm->ps->origin, pml.previous_origin);
ADDRGP4 pml+112
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2057
;2055:
;2056:	// save old velocity for crashlanding
;2057:	VectorCopy (pm->ps->velocity, pml.previous_velocity);
ADDRGP4 pml+124
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2059
;2058:
;2059:	pml.frametime = pml.msec * 0.001;
ADDRGP4 pml+36
ADDRGP4 pml+40
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ASGNF4
line 2062
;2060:
;2061:	// update the viewangles
;2062:	PM_UpdateViewAngles( pm->ps, &pm->cmd );
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 2064
;2063:
;2064:	AngleVectors (pm->ps->viewangles, pml.forward, pml.right, pml.up);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 pml
ARGP4
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+24
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2066
;2065:
;2066:	if ( pm->cmd.upmove < 10 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 103
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $728
line 2068
;2067:		// not holding jump
;2068:		pm->ps->pm_flags &= ~PMF_JUMP_HELD;
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 2069
;2069:	}
LABELV $728
line 2072
;2070:
;2071:	// decide if backpedaling animations should be used
;2072:	if ( pm->cmd.forwardmove < 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $730
line 2073
;2073:		pm->ps->pm_flags |= PMF_BACKWARDS_RUN;
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 2074
;2074:	} else if ( pm->cmd.forwardmove > 0 || ( pm->cmd.forwardmove == 0 && pm->cmd.rightmove ) ) {
ADDRGP4 $731
JUMPV
LABELV $730
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GTI4 $734
ADDRLP4 28
INDIRP4
CNSTI4 101
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $732
ADDRLP4 28
INDIRP4
CNSTI4 102
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $732
LABELV $734
line 2075
;2075:		pm->ps->pm_flags &= ~PMF_BACKWARDS_RUN;
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 2076
;2076:	}
LABELV $732
LABELV $731
line 2078
;2077:
;2078:	if ( pm->ps->pm_type >= PM_DEAD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
LTI4 $735
line 2079
;2079:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 101
ADDP4
CNSTI1 0
ASGNI1
line 2080
;2080:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 102
ADDP4
CNSTI1 0
ASGNI1
line 2081
;2081:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 103
ADDP4
CNSTI1 0
ASGNI1
line 2082
;2082:	}
LABELV $735
line 2084
;2083:
;2084:	if ( pm_respawntimer ) {
ADDRGP4 pm_respawntimer
INDIRI4
CNSTI4 0
EQI4 $737
line 2085
;2085:		pm_respawntimer -= pml.msec;
ADDRLP4 32
ADDRGP4 pm_respawntimer
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 2086
;2086:		if ( pm_respawntimer < 0 ) {
ADDRGP4 pm_respawntimer
INDIRI4
CNSTI4 0
GEI4 $740
line 2087
;2087:			pm_respawntimer = 0;
ADDRGP4 pm_respawntimer
CNSTI4 0
ASGNI4
line 2088
;2088:		}
LABELV $740
line 2089
;2089:	}
LABELV $737
line 2091
;2090:
;2091:	if ( pm->ps->pm_type == PM_SPECTATOR ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $742
line 2092
;2092:		PM_CheckDuck ();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 2093
;2093:		PM_FlyMove ();
ADDRGP4 PM_FlyMove
CALLV
pop
line 2094
;2094:		PM_DropTimers ();
ADDRGP4 PM_DropTimers
CALLV
pop
line 2095
;2095:		return;
ADDRGP4 $699
JUMPV
LABELV $742
line 2098
;2096:	}
;2097:
;2098:	if ( pm->ps->pm_type == PM_NOCLIP ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $744
line 2099
;2099:		PM_NoclipMove ();
ADDRGP4 PM_NoclipMove
CALLV
pop
line 2100
;2100:		PM_DropTimers ();
ADDRGP4 PM_DropTimers
CALLV
pop
line 2101
;2101:		return;
ADDRGP4 $699
JUMPV
LABELV $744
line 2111
;2102:	}
;2103:
;2104:#ifdef USE_VR_QVM__deactivated
;2105:	qboolean isDead = (pm->ps->eFlags & EF_DEAD);
;2106:	// Avoid weapon to be inside a solid (walls or player)
;2107:	if( /*myself &&*/ !isDead && pm->ps->vr_controller_type != 0 )
;2108:		PM_AdjustPosForWall();
;2109:#endif
;2110:
;2111:	if (pm->ps->pm_type == PM_FREEZE) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 4
NEI4 $746
line 2112
;2112:		return;		// no movement at all
ADDRGP4 $699
JUMPV
LABELV $746
line 2115
;2113:	}
;2114:
;2115:	if ( pm->ps->pm_type == PM_INTERMISSION || pm->ps->pm_type == PM_SPINTERMISSION) {
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
EQI4 $750
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 6
NEI4 $748
LABELV $750
line 2116
;2116:		return;		// no movement at all
ADDRGP4 $699
JUMPV
LABELV $748
line 2120
;2117:	}
;2118:
;2119:	// set watertype, and waterlevel
;2120:	PM_SetWaterLevel();
ADDRGP4 PM_SetWaterLevel
CALLV
pop
line 2121
;2121:	pml.previous_waterlevel = pmove->waterlevel;
ADDRGP4 pml+136
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ASGNI4
line 2124
;2122:
;2123:	// set mins, maxs, and viewheight
;2124:	PM_CheckDuck ();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 2127
;2125:
;2126:	// set groundentity
;2127:	PM_GroundTrace();
ADDRGP4 PM_GroundTrace
CALLV
pop
line 2129
;2128:
;2129:	if ( pm->ps->pm_type == PM_DEAD ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $752
line 2130
;2130:		PM_DeadMove ();
ADDRGP4 PM_DeadMove
CALLV
pop
line 2131
;2131:	}
LABELV $752
line 2133
;2132:
;2133:	PM_DropTimers();
ADDRGP4 PM_DropTimers
CALLV
pop
line 2140
;2134:
;2135:#ifdef MISSIONPACK
;2136:	if ( pm->ps->powerups[PW_INVULNERABILITY] ) {
;2137:		PM_InvulnerabilityMove();
;2138:	} else
;2139:#endif
;2140:	if ( pm->ps->powerups[PW_FLIGHT] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $754
line 2142
;2141:		// flight powerup doesn't allow jump and has different friction
;2142:		PM_FlyMove();
ADDRGP4 PM_FlyMove
CALLV
pop
line 2143
;2143:	} else if (pm->ps->pm_flags & PMF_GRAPPLE_PULL) {
ADDRGP4 $755
JUMPV
LABELV $754
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $756
line 2144
;2144:		PM_GrappleMove();
ADDRGP4 PM_GrappleMove
CALLV
pop
line 2146
;2145:		// We can wiggle a bit
;2146:		PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 2147
;2147:	} else if (pm->ps->pm_flags & PMF_TIME_WATERJUMP) {
ADDRGP4 $757
JUMPV
LABELV $756
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $758
line 2148
;2148:		PM_WaterJumpMove();
ADDRGP4 PM_WaterJumpMove
CALLV
pop
line 2149
;2149:	} else if ( pm->waterlevel > 1 ) {
ADDRGP4 $759
JUMPV
LABELV $758
ADDRGP4 pm
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 1
LEI4 $760
line 2151
;2150:		// swimming
;2151:		PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 2152
;2152:	} else if ( pml.walking ) {
ADDRGP4 $761
JUMPV
LABELV $760
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $762
line 2154
;2153:		// walking on ground
;2154:		PM_WalkMove();
ADDRGP4 PM_WalkMove
CALLV
pop
line 2155
;2155:	} else {
ADDRGP4 $763
JUMPV
LABELV $762
line 2157
;2156:		// airborne
;2157:		PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 2158
;2158:	}
LABELV $763
LABELV $761
LABELV $759
LABELV $757
LABELV $755
line 2160
;2159:
;2160:	PM_Animate();
ADDRGP4 PM_Animate
CALLV
pop
line 2163
;2161:
;2162:	// set groundentity, watertype, and waterlevel
;2163:	PM_GroundTrace();
ADDRGP4 PM_GroundTrace
CALLV
pop
line 2164
;2164:	PM_SetWaterLevel();
ADDRGP4 PM_SetWaterLevel
CALLV
pop
line 2167
;2165:
;2166:	// weapons
;2167:	PM_Weapon();
ADDRGP4 PM_Weapon
CALLV
pop
line 2170
;2168:
;2169:	// torso animation
;2170:	PM_TorsoAnimation();
ADDRGP4 PM_TorsoAnimation
CALLV
pop
line 2173
;2171:
;2172:	// footstep events / legs animations
;2173:	PM_Footsteps();
ADDRGP4 PM_Footsteps
CALLV
pop
line 2176
;2174:
;2175:	// entering / leaving water splashes
;2176:	PM_WaterEvents();
ADDRGP4 PM_WaterEvents
CALLV
pop
line 2178
;2177:
;2178:	if ( pm->ps->powerups[PW_FLIGHT] && !pml.groundPlane ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $765
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
NEI4 $765
line 2180
;2179:		// don't snap velocity in free-fly or we will be not able to stop via flight friction
;2180:		return;
ADDRGP4 $699
JUMPV
LABELV $765
line 2184
;2181:	}
;2182:
;2183:	// snap some parts of playerstate to save network bandwidth
;2184:	trap_SnapVector( pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 trap_SnapVector
CALLV
pop
line 2185
;2185:}
LABELV $699
endproc PmoveSingle 36 16
export Pmove
proc Pmove 16 4
line 2195
;2186:
;2187:
;2188:/*
;2189:================
;2190:Pmove
;2191:
;2192:Can be called by either the server or the client
;2193:================
;2194:*/
;2195:void Pmove (pmove_t *pmove) {
line 2198
;2196:	int			finalTime;
;2197:
;2198:	finalTime = pmove->cmd.serverTime;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2200
;2199:
;2200:	if ( finalTime < pmove->ps->commandTime ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
GEI4 $769
line 2201
;2201:		return;	// should not happen
ADDRGP4 $768
JUMPV
LABELV $769
line 2204
;2202:	}
;2203:
;2204:	if ( finalTime > pmove->ps->commandTime + 1000 ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $771
line 2205
;2205:		pmove->ps->commandTime = finalTime - 1000;
ADDRFP4 0
INDIRP4
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 2206
;2206:	}
LABELV $771
line 2208
;2207:
;2208:	pmove->ps->pmove_framecount = (pmove->ps->pmove_framecount+1) & ((1<<PS_PMOVEFRAMECOUNTBITS)-1);
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 63
BANDI4
ASGNI4
line 2210
;2209:
;2210:	if ( pmove->ps->pm_flags & PMF_RESPAWNED && pm_respawntimer == 0 ) {
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $776
ADDRGP4 pm_respawntimer
INDIRI4
CNSTI4 0
NEI4 $776
line 2211
;2211:		pm_respawntimer = NO_RESPAWN_OVERBOUNCE;
ADDRGP4 pm_respawntimer
CNSTI4 250
ASGNI4
line 2212
;2212:	}
ADDRGP4 $776
JUMPV
LABELV $775
line 2216
;2213:
;2214:	// chop the move up if it is too long, to prevent framerate
;2215:	// dependent behavior
;2216:	while ( pmove->ps->commandTime != finalTime ) {
line 2219
;2217:		int		msec;
;2218:
;2219:		msec = finalTime - pmove->ps->commandTime;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 2221
;2220:
;2221:		if ( pmove->pmove_fixed ) {
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 0
EQI4 $778
line 2222
;2222:			if ( msec > pmove->pmove_msec ) {
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
LEI4 $779
line 2223
;2223:				msec = pmove->pmove_msec;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ASGNI4
line 2224
;2224:			}
line 2225
;2225:		}
ADDRGP4 $779
JUMPV
LABELV $778
line 2226
;2226:		else {
line 2227
;2227:			if ( msec > 66 ) {
ADDRLP4 8
INDIRI4
CNSTI4 66
LEI4 $782
line 2228
;2228:				msec = 66;
ADDRLP4 8
CNSTI4 66
ASGNI4
line 2229
;2229:			}
LABELV $782
line 2230
;2230:		}
LABELV $779
line 2231
;2231:		pmove->cmd.serverTime = pmove->ps->commandTime + msec;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRP4
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 2232
;2232:		PmoveSingle( pmove );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 PmoveSingle
CALLV
pop
line 2234
;2233:
;2234:		if ( pmove->ps->pm_flags & PMF_JUMP_HELD ) {
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $784
line 2235
;2235:			pmove->cmd.upmove = 20;
ADDRFP4 0
INDIRP4
CNSTI4 103
ADDP4
CNSTI1 20
ASGNI1
line 2236
;2236:		}
LABELV $784
line 2237
;2237:	}
LABELV $776
line 2216
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $775
line 2239
;2238:	//PM_CheckStuck();
;2239:}
LABELV $768
endproc Pmove 16 4
import trap_SnapVector
import PM_StepSlideMove
import PM_SlideMove
bss
export pml
align 4
LABELV pml
skip 140
export pm
align 4
LABELV pm
skip 4
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
LABELV $478
byte 1 37
byte 1 105
byte 1 58
byte 1 76
byte 1 97
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $467
byte 1 37
byte 1 105
byte 1 58
byte 1 115
byte 1 116
byte 1 101
byte 1 101
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $456
byte 1 37
byte 1 105
byte 1 58
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 111
byte 1 102
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $425
byte 1 37
byte 1 105
byte 1 58
byte 1 108
byte 1 105
byte 1 102
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $398
byte 1 37
byte 1 105
byte 1 58
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 10
byte 1 0
