export sinf
code
proc sinf 4 4
file "..\..\..\..\code\game\g_weapon.c"
line 23
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_weapon.c 
;4:// perform the server side effects of a weapon firing
;5:
;6:#include "g_local.h"
;7:
;8:static	float	s_quadFactor;
;9:static	vec3_t	forward, right, up;
;10:static	vec3_t	muzzle;
;11:static	vec3_t	muzzle_origin; // for hitscan weapon trace
;12:
;13:#define NUM_NAILSHOTS 15
;14:
;15:#ifdef USE_VR
;16:#include "../../../Quake3e-master/code/vrmod/VRMOD_input.h"
;17:
;18:#ifdef USE_NATIVE_HACK
;19:extern vr_clientinfo_t *vrinfo;
;20:#endif
;21:
;22:#ifdef Q3_VM
;23:float sinf(float _X) {
line 24
;24:	return (float)sin(_X);
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
RETF4
LABELV $64
endproc sinf 4 4
export cosf
proc cosf 4 4
line 26
;25:}
;26:float cosf(float _X) {
line 27
;27:	return (float)cos(_X);
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
RETF4
LABELV $65
endproc cosf 4 4
export rotateAboutOrigin
proc rotateAboutOrigin 16 4
line 32
;28:}
;29:#endif
;30:
;31:void rotateAboutOrigin(float x, float y, float rotation, vec2_t out)
;32:{
line 33
;33:	out[0] = cosf(DEG2RAD(-rotation)) * x + sinf(DEG2RAD(-rotation)) * y;
ADDRFP4 8
INDIRF4
NEGF4
CNSTF4 1016003125
MULF4
ARGF4
ADDRLP4 0
ADDRGP4 cosf
CALLF4
ASGNF4
ADDRFP4 8
INDIRF4
NEGF4
CNSTF4 1016003125
MULF4
ARGF4
ADDRLP4 4
ADDRGP4 sinf
CALLF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRF4
MULF4
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 34
;34:	out[1] = cosf(DEG2RAD(-rotation)) * y - sinf(DEG2RAD(-rotation)) * x;
ADDRFP4 8
INDIRF4
NEGF4
CNSTF4 1016003125
MULF4
ARGF4
ADDRLP4 8
ADDRGP4 cosf
CALLF4
ASGNF4
ADDRFP4 8
INDIRF4
NEGF4
CNSTF4 1016003125
MULF4
ARGF4
ADDRLP4 12
ADDRGP4 sinf
CALLF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
ADDRFP4 0
INDIRF4
MULF4
SUBF4
ASGNF4
line 35
;35:}
LABELV $66
endproc rotateAboutOrigin 16 4
export convertFromVR
proc convertFromVR 48 4
line 38
;36:
;37:void convertFromVR(gentity_t *ent, vec3_t in, vec3_t offset, vec3_t out)
;38:{
line 41
;39:	vec3_t vrSpace, temp;
;40:	vec2_t r;
;41:	float worldscale = trap_Cvar_VariableValue("vr_worldscale");
ADDRGP4 $68
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 36
INDIRF4
ASGNF4
line 42
;42:	VectorSet(vrSpace, in[2], in[0], in[1]);
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 40
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 48
;43:
;44:#ifdef USE_NATIVE_HACK
;45:	rotateAboutOrigin(vrSpace[0], vrSpace[1], ent->client->ps.viewangles[YAW] - vrinfo->hmdinfo.angles.actual[YAW], r);
;46:#endif
;47:
;48:	vrSpace[0] = -r[0];
ADDRLP4 0
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
line 49
;49:	vrSpace[1] = -r[1];
ADDRLP4 0+4
ADDRLP4 28+4
INDIRF4
NEGF4
ASGNF4
line 51
;50:
;51:	VectorScale(vrSpace, worldscale, temp);
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 53
;52:
;53:	if (offset) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $77
line 54
;54:		VectorAdd(temp, offset, out);
ADDRFP4 12
INDIRP4
ADDRLP4 12
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12+4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12+8
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 55
;55:	}
ADDRGP4 $78
JUMPV
LABELV $77
line 56
;56:	else {
line 57
;57:		VectorCopy(temp, out);
ADDRFP4 12
INDIRP4
ADDRLP4 12
INDIRB
ASGNB 12
line 58
;58:	}
LABELV $78
line 59
;59:}
LABELV $67
endproc convertFromVR 48 4
export CalcMuzzlePoint
proc CalcMuzzlePoint 44 16
line 70
;60:#endif
;61:
;62:/*
;63:===============
;64:CalcMuzzlePoint
;65:
;66:set muzzle location relative to pivoting eye
;67:===============
;68:*/
;69:#ifdef USE_VR
;70:void CalcMuzzlePoint(gentity_t *ent, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint) {
line 83
;71:	int vr_controller_type;
;72:
;73:#ifdef USE_NATIVE_HACK
;74:	qboolean use_fake_6dof = qtrue;
;75:	qboolean mySelf = (ent->client->ps.clientNum == vrinfo->clientNum);
;76:
;77:	if (mySelf)
;78:		vr_controller_type = vrinfo->vr_controller_type;
;79:#endif
;80:
;81:#ifdef USE_VR_QVM
;82:	// Only non native VM send others players VR info
;83:	vr_controller_type = ent->client->ps.vr_controller_type;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
line 86
;84:#endif
;85:
;86:	if ((ent->r.svFlags & SVF_BOT)
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $82
line 94
;87:		//Can't use the vr_clientinfo if this isn't the vr client
;88:#ifdef USE_NATIVE_HACK
;89:		|| vrinfo == NULL 
;90:		|| !mySelf
;91:		|| use_fake_6dof
;92:#endif
;93:		)
;94:	{
line 95
;95:		VectorCopy(ent->s.pos.trBase, muzzlePoint);
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 96
;96:		muzzlePoint[2] += ent->client->ps.viewheight;
ADDRLP4 4
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 97
;97:		VectorMA(muzzlePoint, 14, forward, muzzlePoint);
ADDRLP4 8
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
CNSTF4 1096810496
MULF4
ADDF4
ASGNF4
ADDRLP4 12
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1096810496
MULF4
ADDF4
ASGNF4
ADDRLP4 16
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1096810496
MULF4
ADDF4
ASGNF4
line 98
;98:	}
ADDRGP4 $83
JUMPV
LABELV $82
line 113
;99:#ifdef USE_NATIVE_HACK
;100:	else if ( vrinfo != NULL && mySelf )
;101:	{
;102:		float worldscale = trap_Cvar_VariableValue("vr_worldscale");
;103:		convertFromVR(ent, vrinfo->controllers[SideRIGHT].hmd_ctrl_offset, ent->r.currentOrigin, muzzlePoint);
;104:
;105:		if ( vr_controller_type >= 2 ) {
;106:			muzzlePoint[2] -= ent->client->ps.viewheight; // remove q3 player height
;107:			muzzlePoint[2] += vrinfo->hmdinfo.position.actual[1] * worldscale; // add real height from HMD
;108:		}
;109:	}
;110:#endif
;111:
;112:#ifdef USE_VR_QVM
;113:	else if ( vr_controller_type )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $84
line 114
;114:	{
line 115
;115:		float worldscale = trap_Cvar_VariableValue("vr_worldscale");
ADDRGP4 $68
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 20
INDIRF4
ASGNF4
line 119
;116:		//convertFromVR(ent, vrinfo->weaponoffset, ent->r.currentOrigin, muzzlePoint);
;117:
;118:		vec3_t rightOffset;
;119:		VectorSubtract(ent->client->ps.HMD_raw_origin, ent->client->ps.right_hand_position, rightOffset);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 520
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 24
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8+8
ADDRLP4 28
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
SUBF4
ASGNF4
line 121
;120:
;121:		convertFromVR(ent, rightOffset, ent->r.currentOrigin, muzzlePoint);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 984
ADDP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 convertFromVR
CALLV
pop
line 122
;122:		muzzlePoint[2] -= ent->client->ps.viewheight;
ADDRLP4 36
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 123
;123:		muzzlePoint[2] += ent->client->ps.HMD_raw_origin[1] * worldscale;
ADDRLP4 40
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 124
;124:	}
LABELV $84
LABELV $83
line 128
;125:#endif
;126:
;127:	// snap to integer coordinates for more efficient network bandwidth usage
;128:	SnapVector( muzzlePoint );
ADDRLP4 4
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 8
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 12
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 129
;129:}
LABELV $81
endproc CalcMuzzlePoint 44 16
export CalcMuzzlePointOrigin
proc CalcMuzzlePointOrigin 16 0
line 138
;130:#endif
;131:
;132:
;133:/*
;134:===============
;135:CalcMuzzlePointOrigin
;136:===============
;137:*/
;138:void CalcMuzzlePointOrigin( gentity_t *ent, vec3_t origin, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint) {
line 140
;139:#ifdef USE_VR
;140:	qboolean vr_controller_type = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 148
;141:
;142:#ifdef USE_NATIVE_HACK
;143:	qboolean mySelf = (ent->client->ps.clientNum == vrinfo->clientNum);
;144:	if ( mySelf )
;145:		vr_controller_type = vrinfo->vr_controller_type;
;146:#endif
;147:#ifdef USE_VR_QVM
;148:	vr_controller_type = ent->client->ps.vr_controller_type;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
line 161
;149:#endif
;150:
;151:#ifdef USE_NATIVE_HACK
;152:	if ( vr_controller_type > 0 )
;153:	{
;154:		CalcMuzzlePoint(ent, forward, right, up, muzzlePoint);
;155:		return;
;156:	}
;157:	else
;158:#endif
;159:
;160:#ifdef USE_VR_QVM
;161:	if ( vr_controller_type > 0 )
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $89
line 162
;162:	{
line 164
;163:		//if (!(ent->client->ps.eFlags & EF_LEFT_HANDED)) // TODO
;164:			VectorCopy(ent->client->ps.right_muzzle_position, origin);
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 167
;165:		//else
;166:		//	VectorCopy(ent->client->ps.left_muzzle_position, origin);
;167:	}
ADDRGP4 $90
JUMPV
LABELV $89
line 171
;168:	else
;169:#endif // USE_VR_QVM
;170:#endif // USE_VR
;171:	{
line 172
;172:		VectorCopy(ent->client->ps.origin, origin);
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 173
;173:		origin[2] += ent->client->ps.viewheight;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 174
;174:	}
LABELV $90
line 176
;175:
;176:	VectorMA( origin, 14.0, forward, muzzlePoint );
ADDRFP4 20
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
CNSTF4 1096810496
MULF4
ADDF4
ASGNF4
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1096810496
MULF4
ADDF4
ASGNF4
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1096810496
MULF4
ADDF4
ASGNF4
line 180
;177:
;178:#ifdef USE_VR
;179:	// snap to integer coordinates for more efficient network bandwidth usage
;180:	if ( vr_controller_type != 0 )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $91
line 181
;181:		SnapVector( muzzlePoint );// was commented out in q3e.
ADDRLP4 4
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 8
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 12
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
LABELV $91
line 183
;182:#endif
;183:}
LABELV $88
endproc CalcMuzzlePointOrigin 16 0
export G_BounceProjectile
proc G_BounceProjectile 48 4
line 191
;184:
;185:
;186:/*
;187:================
;188:G_BounceProjectile
;189:================
;190:*/
;191:void G_BounceProjectile( vec3_t start, vec3_t impact, vec3_t dir, vec3_t endout ) {
line 195
;192:	vec3_t v, newv;
;193:	float dot;
;194:
;195:	VectorSubtract( impact, start, v );
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 196
;196:	dot = DotProduct( v, dir );
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 197
;197:	VectorMA( v, -2*dot, dir, newv );
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
line 199
;198:
;199:	VectorNormalize(newv);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 200
;200:	VectorMA(impact, 8192, newv, endout);
ADDRFP4 12
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
line 201
;201:}
LABELV $93
endproc G_BounceProjectile 48 4
export Weapon_Gauntlet
proc Weapon_Gauntlet 0 0
line 212
;202:
;203:
;204:/*
;205:======================================================================
;206:
;207:GAUNTLET
;208:
;209:======================================================================
;210:*/
;211:
;212:void Weapon_Gauntlet( gentity_t *ent ) {
line 214
;213:
;214:}
LABELV $104
endproc Weapon_Gauntlet 0 0
export CheckGauntletAttack
proc CheckGauntletAttack 108 32
line 221
;215:
;216:/*
;217:===============
;218:CheckGauntletAttack
;219:===============
;220:*/
;221:qboolean CheckGauntletAttack( gentity_t *ent ) {
line 237
;222:	trace_t		tr;
;223:	vec3_t		end;
;224:	gentity_t	*tent;
;225:	gentity_t	*traceEnt;
;226:	int			damage;
;227:	vec3_t		angles;
;228:	int			vr_controller_type;
;229:
;230:#ifdef USE_NATIVE_HACK
;231:	qboolean use_fake_6dof = qtrue;
;232:	qboolean mySelf = (ent->client->ps.clientNum == vrinfo->clientNum);
;233:	vr_controller_type = vrinfo->vr_controller_type;
;234:#endif
;235:
;236:#ifdef USE_VR_QVM
;237:	vr_controller_type = ent->client->ps.vr_controller_type;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
line 259
;238:#endif
;239:
;240:	// set aiming directions
;241:/*#ifdef USE_NATIVE_HACK
;242:	if ( vr_controller_type >= 2 )
;243:	if ( !(ent->r.svFlags & SVF_BOT) && vrinfo != NULL &&
;244:		mySelf &&
;245:		//!vrinfo->use_fake_6dof && 
;246:		!use_fake_6dof && 
;247:		(vr_controller_type >= 2)
;248:		)
;249:	{
;250:		//===================
;251:		//		6 Dof
;252:		//===================
;253:		VectorCopy(vrinfo->controllers[SideRIGHT].angles.actual , angles);
;254:		angles[YAW] += ent->client->ps.viewangles[YAW] - vrinfo->hmdinfo.angles.actual[YAW];
;255:	}
;256:	else
;257:#endif*/
;258:#ifdef USE_VR_QVM
;259:	if (vr_controller_type > 0) {
ADDRLP4 92
INDIRI4
CNSTI4 0
LEI4 $106
line 263
;260:		//===================
;261:		//		3/6 Dof
;262:		//===================
;263:		VectorCopy(ent->client->ps.right_hand_angles, angles);
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 508
ADDP4
INDIRB
ASGNB 12
line 264
;264:	}
ADDRGP4 $107
JUMPV
LABELV $106
line 270
;265:	else
;266:#endif
;267:		//===================
;268:		//		2 Dof
;269:		//===================
;270:		VectorCopy(ent->client->ps.viewangles, angles);
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
LABELV $107
line 272
;271:
;272:	AngleVectors(angles, forward, right, up);
ADDRLP4 80
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 274
;273:
;274:	CalcMuzzlePointOrigin( ent, muzzle_origin, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePointOrigin
CALLV
pop
line 276
;275:
;276:	VectorMA( muzzle_origin, ( 32.0 + 14.0 ), forward, end );
ADDRLP4 60
ADDRGP4 muzzle_origin
INDIRF4
ADDRGP4 forward
INDIRF4
CNSTF4 1110966272
MULF4
ADDF4
ASGNF4
ADDRLP4 60+4
ADDRGP4 muzzle_origin+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1110966272
MULF4
ADDF4
ASGNF4
ADDRLP4 60+8
ADDRGP4 muzzle_origin+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1110966272
MULF4
ADDF4
ASGNF4
line 278
;277:
;278:	trap_Trace( &tr, muzzle_origin, NULL, NULL, end, ent->s.number, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 60
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 279
;279:	if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $114
line 280
;280:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $105
JUMPV
LABELV $114
line 283
;281:	}
;282:
;283:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
CNSTI4 0
EQI4 $117
line 284
;284:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $105
JUMPV
LABELV $117
line 287
;285:	}
;286:
;287:	traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 0
ADDRLP4 4+52
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 290
;288:
;289:	// send blood impact
;290:	if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 1232
ADDP4
INDIRI4
CNSTI4 0
EQI4 $120
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $120
line 291
;291:		tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
ADDRLP4 4+12
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 100
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 100
INDIRP4
ASGNP4
line 292
;292:		tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 293
;293:		tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 104
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 294
;294:		tent->s.weapon = ent->s.weapon;
ADDRLP4 72
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 295
;295:	}
LABELV $120
line 297
;296:
;297:	if ( !traceEnt->takedamage ) {
ADDRLP4 0
INDIRP4
CNSTI4 1232
ADDP4
INDIRI4
CNSTI4 0
NEI4 $124
line 298
;298:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $105
JUMPV
LABELV $124
line 301
;299:	}
;300:
;301:	if (ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $126
line 302
;302:		G_AddEvent( ent, EV_POWERUP_QUAD, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 62
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 303
;303:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 304
;304:	} else {
ADDRGP4 $127
JUMPV
LABELV $126
line 305
;305:		s_quadFactor = 1.0;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 306
;306:	}
LABELV $127
line 313
;307:#ifdef MISSIONPACK
;308:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
;309:		s_quadFactor *= 2;
;310:	}
;311:#endif
;312:
;313:	damage = 50 * s_quadFactor;
ADDRLP4 76
ADDRGP4 s_quadFactor
INDIRF4
CNSTF4 1112014848
MULF4
CVFI4 4
ASGNI4
line 314
;314:	G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, 0, MOD_GAUNTLET );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 76
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 316
;315:
;316:	return qtrue;
CNSTI4 1
RETI4
LABELV $105
endproc CheckGauntletAttack 108 32
export SnapVectorTowards
proc SnapVectorTowards 24 0
line 338
;317:}
;318:
;319:
;320:/*
;321:======================================================================
;322:
;323:MACHINEGUN
;324:
;325:======================================================================
;326:*/
;327:
;328:/*
;329:======================
;330:SnapVectorTowards
;331:
;332:Round a vector to integers for more efficient network
;333:transmission, but make sure that it rounds towards a given point
;334:rather than blindly truncating.  This prevents it from truncating 
;335:into a wall.
;336:======================
;337:*/
;338:void SnapVectorTowards( vec3_t v, vec3_t to ) {
line 341
;339:	int		i;
;340:
;341:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $131
line 342
;342:		if ( v[i] < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $135
line 343
;343:			if ( to[i] >= v[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
LTF4 $137
line 344
;344:			v[i] = (int)v[i];
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRGP4 $136
JUMPV
LABELV $137
line 346
;345:			else
;346:				v[i] = (int)v[i] - 1;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRF4
CVFI4 4
CNSTI4 1
SUBI4
CVIF4 4
ASGNF4
line 347
;347:		} else {
ADDRGP4 $136
JUMPV
LABELV $135
line 348
;348:			if ( to[i] <= v[i] )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
GTF4 $139
line 349
;349:				v[i] = (int)v[i];
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRGP4 $140
JUMPV
LABELV $139
line 351
;350:			else
;351:			v[i] = (int)v[i] + 1;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRF4
CVFI4 4
CNSTI4 1
ADDI4
CVIF4 4
ASGNF4
LABELV $140
line 352
;352:		}
LABELV $136
line 353
;353:	}
LABELV $132
line 341
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $131
line 354
;354:}
LABELV $130
endproc SnapVectorTowards 24 0
proc Bullet_Fire 136 32
line 363
;355:
;356:#ifdef MISSIONPACK
;357:#define CHAINGUN_SPREAD		600
;358:#endif
;359:#define MACHINEGUN_SPREAD	200
;360:#define	MACHINEGUN_DAMAGE	7
;361:#define	MACHINEGUN_TEAM_DAMAGE	5		// wimpier MG in teamplay
;362:
;363:static void Bullet_Fire( gentity_t *ent, float spread, int damage ) {
line 375
;364:	trace_t		tr;
;365:	vec3_t		end;
;366:#ifdef MISSIONPACK
;367:	vec3_t		impactpoint, bouncedir;
;368:#endif
;369:	float		r;
;370:	float		u;
;371:	gentity_t	*tent;
;372:	gentity_t	*traceEnt;
;373:	int			i, passent;
;374:
;375:	damage *= s_quadFactor;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 377
;376:
;377:	r = random() * M_PI * 2.0f;
ADDRLP4 92
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 92
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 961089901
MULF4
ASGNF4
line 378
;378:	u = sin(r) * crandom() * spread * 16;
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 96
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 100
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 96
INDIRF4
ADDRLP4 100
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1073741824
MULF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
CNSTF4 1098907648
MULF4
ASGNF4
line 379
;379:	r = cos(r) * crandom() * spread * 16;
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 104
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 108
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 104
INDIRF4
ADDRLP4 108
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1073741824
MULF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
CNSTF4 1098907648
MULF4
ASGNF4
line 382
;380:
;381:	//VectorMA( muzzle_origin, ( 8192.0 * 16.0 ), forward, end );//ori q3e
;382:	VectorMA( muzzle, ( 8192.0 * 16.0 ), forward, end );
ADDRLP4 64
ADDRGP4 muzzle
INDIRF4
ADDRGP4 forward
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRGP4 muzzle+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRGP4 muzzle+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
line 384
;383:	
;384:	VectorMA( end, r, right, end );
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRGP4 right
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 64+4
INDIRF4
ADDRGP4 right+4
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 64+8
INDIRF4
ADDRGP4 right+8
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
line 385
;385:	VectorMA( end, u, up, end );
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRGP4 up
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 64+4
INDIRF4
ADDRGP4 up+4
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 64+8
INDIRF4
ADDRGP4 up+8
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
line 387
;386:
;387:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 388
;388:	for ( i = 0; i < 10; i++ ) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $160
line 391
;389:
;390:		// unlagged
;391:		G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 394
;392:
;393:		//trap_Trace( &tr, muzzle_origin, NULL, NULL, end, passent, MASK_SHOT );//ori q3e
;394:		trap_Trace( &tr, muzzle, NULL, NULL, end, passent, MASK_SHOT );
ADDRLP4 0
ARGP4
ADDRGP4 muzzle
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 397
;395:
;396:		// unlagged
;397:		G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 399
;398:
;399:		if ( tr.surfaceFlags & SURF_NOIMPACT )
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $164
line 400
;400:			return;
ADDRGP4 $141
JUMPV
LABELV $164
line 402
;401:
;402:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
ADDRLP4 0+52
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 405
;403:
;404:		// snap the endpos to integers, but nudged towards the line
;405:		SnapVectorTowards( tr.endpos, muzzle_origin );
ADDRLP4 0+12
ARGP4
ADDRGP4 muzzle_origin
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 408
;406:
;407:		// send bullet impact
;408:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 56
INDIRP4
CNSTI4 1232
ADDP4
INDIRI4
CNSTI4 0
EQI4 $169
ADDRLP4 56
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $169
line 409
;409:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_FLESH );
ADDRLP4 0+12
ARGP4
CNSTI4 49
ARGI4
ADDRLP4 124
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 124
INDIRP4
ASGNP4
line 410
;410:			tent->s.eventParm = traceEnt->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 413
;411:
;412:			// unlagged
;413:			tent->s.clientNum = ent->s.clientNum;
ADDRLP4 60
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 415
;414:
;415:			if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $170
line 416
;416:				ent->client->accuracy_hits++;
ADDRLP4 132
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 892
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 417
;417:			}
line 418
;418:		} else {
ADDRGP4 $170
JUMPV
LABELV $169
line 419
;419:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_WALL );
ADDRLP4 0+12
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 124
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 124
INDIRP4
ASGNP4
line 420
;420:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 0+24
ARGP4
ADDRLP4 128
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 128
INDIRI4
ASGNI4
line 421
;421:		}
LABELV $170
line 422
;422:		tent->s.otherEntityNum = ent->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 424
;423:
;424:		if ( traceEnt->takedamage ) {
ADDRLP4 56
INDIRP4
CNSTI4 1232
ADDP4
INDIRI4
CNSTI4 0
EQI4 $162
line 441
;425:#ifdef MISSIONPACK
;426:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;427:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;428:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;429:					VectorCopy( impactpoint, muzzle );
;430:					// the player can hit him/herself with the bounced rail
;431:					passent = ENTITYNUM_NONE;
;432:				}
;433:				else {
;434:					VectorCopy( tr.endpos, muzzle );
;435:					passent = traceEnt->s.number;
;436:				}
;437:				continue;
;438:			}
;439:			else {
;440:#endif
;441:				G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, 0, MOD_MACHINEGUN );
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 445
;442:#ifdef MISSIONPACK
;443:			}
;444:#endif
;445:		}
line 446
;446:		break;
ADDRGP4 $162
JUMPV
LABELV $161
line 388
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $160
LABELV $162
line 448
;447:	}
;448:}
LABELV $141
endproc Bullet_Fire 136 32
export BFG_Fire
proc BFG_Fire 16 12
line 459
;449:
;450:
;451:/*
;452:======================================================================
;453:
;454:BFG
;455:
;456:======================================================================
;457:*/
;458:
;459:void BFG_Fire( gentity_t *ent ) {
line 462
;460:	gentity_t *m;
;461:
;462:	m = fire_bfg( ent, muzzle, forward );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_bfg
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 463
;463:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 1236
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 464
;464:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 1240
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 467
;465:
;466://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;467:}
LABELV $179
endproc BFG_Fire 16 12
proc ShotgunPellet 108 32
line 482
;468:
;469:
;470:/*
;471:======================================================================
;472:
;473:SHOTGUN
;474:
;475:======================================================================
;476:*/
;477:
;478:// DEFAULT_SHOTGUN_SPREAD and DEFAULT_SHOTGUN_COUNT	are in bg_public.h, because
;479:// client predicts same spreads
;480:#define	DEFAULT_SHOTGUN_DAMAGE	10
;481:
;482:static qboolean ShotgunPellet( const vec3_t start, const vec3_t end, gentity_t *ent ) {
line 490
;483:	trace_t		tr;
;484:	int			damage, i, passent;
;485:	gentity_t	*traceEnt;
;486:#ifdef MISSIONPACK
;487:	vec3_t		impactpoint, bouncedir;
;488:#endif
;489:	vec3_t		tr_start, tr_end;
;490:	qboolean	hitClient = qfalse;
ADDRLP4 96
CNSTI4 0
ASGNI4
line 492
;491:
;492:	passent = ent->s.number;
ADDRLP4 64
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 493
;493:	VectorCopy( start, tr_start );
ADDRLP4 68
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 494
;494:	VectorCopy( end, tr_end );
ADDRLP4 80
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 496
;495:
;496:	for ( i = 0; i < 10; i++ ) {
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $181
line 497
;497:		trap_Trace( &tr, tr_start, NULL, NULL, tr_end, passent, MASK_SHOT );
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 64
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 498
;498:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
ADDRLP4 0+52
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 501
;499:
;500:		// send bullet impact
;501:		if (  tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $186
line 502
;502:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $180
JUMPV
LABELV $186
line 505
;503:		}
;504:
;505:		if ( traceEnt->takedamage ) {
ADDRLP4 56
INDIRP4
CNSTI4 1232
ADDP4
INDIRI4
CNSTI4 0
EQI4 $189
line 506
;506:			damage = DEFAULT_SHOTGUN_DAMAGE * s_quadFactor;
ADDRLP4 92
ADDRGP4 s_quadFactor
INDIRF4
CNSTF4 1092616192
MULF4
CVFI4 4
ASGNI4
line 522
;507:#ifdef MISSIONPACK
;508:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;509:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;510:					G_BounceProjectile( tr_start, impactpoint, bouncedir, tr_end );
;511:					VectorCopy( impactpoint, tr_start );
;512:					// the player can hit him/herself with the bounced rail
;513:					passent = ENTITYNUM_NONE;
;514:				}
;515:				else {
;516:					VectorCopy( tr.endpos, tr_start );
;517:					passent = traceEnt->s.number;
;518:				}
;519:				continue;
;520:			}
;521:#else
;522:			if ( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $191
line 523
;523:				hitClient = qtrue;
ADDRLP4 96
CNSTI4 1
ASGNI4
line 524
;524:			}
LABELV $191
line 525
;525:			G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, 0, MOD_SHOTGUN );
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 104
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 92
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 526
;526:			return hitClient;
ADDRLP4 96
INDIRI4
RETI4
ADDRGP4 $180
JUMPV
LABELV $189
line 529
;527:#endif
;528:		}
;529:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $180
JUMPV
LABELV $182
line 496
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 10
LTI4 $181
line 531
;530:	}
;531:	return qfalse;
CNSTI4 0
RETI4
LABELV $180
endproc ShotgunPellet 108 32
proc ShotgunPattern 92 12
line 536
;532:}
;533:
;534:
;535:// this should match CG_ShotgunPattern
;536:static void ShotgunPattern( const vec3_t origin, const vec3_t origin2, int seed, gentity_t *ent ) {
line 541
;537:	int			i;
;538:	float		r, u;
;539:	vec3_t		end;
;540:	vec3_t		forward, right, up;
;541:	qboolean	hitClient = qfalse;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 545
;542:
;543:	// derive the right and up vectors from the forward vector, because
;544:	// the client won't have any other information
;545:	VectorNormalize2( origin2, forward );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 546
;546:	PerpendicularVector( right, forward );
ADDRLP4 32
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 547
;547:	CrossProduct( forward, right, up );
ADDRLP4 20
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 550
;548:
;549:	// unlagged
;550:	G_DoTimeShiftFor( ent );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 553
;551:
;552:	// generate the "random" spread pattern
;553:	for ( i = 0 ; i < DEFAULT_SHOTGUN_COUNT ; i++ ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $195
line 554
;554:		r = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
ADDRFP4 8
ARGP4
ADDRLP4 64
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 64
INDIRF4
CNSTF4 1177485312
MULF4
ASGNF4
line 555
;555:		u = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
ADDRFP4 8
ARGP4
ADDRLP4 68
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 68
INDIRF4
CNSTF4 1177485312
MULF4
ASGNF4
line 556
;556:		VectorMA( origin, ( 8192.0 * 16.0 ), forward, end );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 72
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20+4
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 20+8
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
line 557
;557:		VectorMA( end, r, right, end );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 32+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 32+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 558
;558:		VectorMA( end, u, up, end );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 44
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
line 559
;559:		if ( ShotgunPellet( origin, end, ent ) && !hitClient ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 ShotgunPellet
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $215
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $215
line 560
;560:			hitClient = qtrue;
ADDRLP4 60
CNSTI4 1
ASGNI4
line 561
;561:			ent->client->accuracy_hits++;
ADDRLP4 88
ADDRFP4 12
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 892
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 562
;562:		}
LABELV $215
line 563
;563:	}
LABELV $196
line 553
ADDRLP4 56
ADDRLP4 56
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 11
LTI4 $195
line 566
;564:
;565:	// unlagged
;566:	G_UndoTimeShiftFor( ent );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 567
;567:}
LABELV $194
endproc ShotgunPattern 92 12
proc weapon_supershotgun_fire 20 16
line 570
;568:
;569:
;570:static void weapon_supershotgun_fire( gentity_t *ent ) {
line 574
;571:	gentity_t		*tent;
;572:
;573:	// send shotgun blast
;574:	tent = G_TempEntity( muzzle, EV_SHOTGUN );
ADDRGP4 muzzle
ARGP4
CNSTI4 55
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 575
;575:	VectorScale( forward, 4096.0, tent->s.origin2 );
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 forward
INDIRF4
CNSTF4 1166016512
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1166016512
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1166016512
MULF4
ASGNF4
line 577
;576:
;577:	SnapVector( tent->s.origin2 );
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 578
;578:	tent->s.eventParm = rand() & 255;		// seed for spread pattern
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 579
;579:	tent->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 583
;580:
;581:#ifdef USE_VR
;582:#ifdef USE_VR_QVM
;583:	if ( ent->client->ps.vr_controller_type > 0)
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
LEI4 $220
line 586
;584:#endif
;585:		// VR client
;586:		ShotgunPattern(tent->s.pos.trBase, tent->s.origin2, tent->s.eventParm, ent);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ShotgunPattern
CALLV
pop
LABELV $220
line 591
;587:#else
;588:	// not VR client
;589:	ShotgunPattern(muzzle_origin, tent->s.origin2, tent->s.eventParm, ent);
;590:#endif
;591:}
LABELV $217
endproc weapon_supershotgun_fire 20 16
export weapon_grenadelauncher_fire
proc weapon_grenadelauncher_fire 20 12
line 602
;592:
;593:
;594:/*
;595:======================================================================
;596:
;597:GRENADE LAUNCHER
;598:
;599:======================================================================
;600:*/
;601:
;602:void weapon_grenadelauncher_fire (gentity_t *ent) {
line 606
;603:	gentity_t	*m;
;604:
;605:	// extra vertical velocity
;606:	forward[2] += 0.2f;
ADDRLP4 4
ADDRGP4 forward+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 607
;607:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 609
;608:
;609:	m = fire_grenade (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 8
ADDRGP4 fire_grenade
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 610
;610:	m->damage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 1236
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 611
;611:	m->splashDamage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 1240
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 614
;612:
;613://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;614:}
LABELV $222
endproc weapon_grenadelauncher_fire 20 12
export Weapon_RocketLauncher_Fire
proc Weapon_RocketLauncher_Fire 16 12
line 624
;615:
;616:/*
;617:======================================================================
;618:
;619:ROCKET
;620:
;621:======================================================================
;622:*/
;623:
;624:void Weapon_RocketLauncher_Fire (gentity_t *ent) {
line 627
;625:	gentity_t	*m;
;626:
;627:	m = fire_rocket (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_rocket
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 628
;628:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 1236
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 629
;629:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 1240
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 632
;630:
;631://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;632:}
LABELV $224
endproc Weapon_RocketLauncher_Fire 16 12
export Weapon_Plasmagun_Fire
proc Weapon_Plasmagun_Fire 16 12
line 643
;633:
;634:
;635:/*
;636:======================================================================
;637:
;638:PLASMA GUN
;639:
;640:======================================================================
;641:*/
;642:
;643:void Weapon_Plasmagun_Fire (gentity_t *ent) {
line 646
;644:	gentity_t	*m;
;645:
;646:	m = fire_plasma (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_plasma
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 647
;647:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 1236
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 648
;648:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 1240
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 651
;649:
;650://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;651:}
LABELV $225
endproc Weapon_Plasmagun_Fire 16 12
export weapon_railgun_fire
proc weapon_railgun_fire 144 32
line 668
;652:
;653:/*
;654:======================================================================
;655:
;656:RAILGUN
;657:
;658:======================================================================
;659:*/
;660:
;661:
;662:/*
;663:=================
;664:weapon_railgun_fire
;665:=================
;666:*/
;667:#define	MAX_RAIL_HITS	4
;668:void weapon_railgun_fire( gentity_t *ent ) {
line 685
;669:	vec3_t		end;
;670:#ifdef MISSIONPACK
;671:	vec3_t impactpoint, bouncedir;
;672:#endif
;673:	trace_t		trace;
;674:	gentity_t	*tent;
;675:	gentity_t	*traceEnt;
;676:	int			damage;
;677:	int			i;
;678:	int			hits;
;679:	int			unlinked;
;680:	int			passent;
;681:	int			vr_controller_type;
;682:
;683:	gentity_t	*unlinkedEntities[MAX_RAIL_HITS];
;684:
;685:	damage = 100 * s_quadFactor;
ADDRLP4 108
ADDRGP4 s_quadFactor
INDIRF4
CNSTF4 1120403456
MULF4
CVFI4 4
ASGNI4
line 688
;686:
;687:#ifdef USE_VR_QVM
;688:	vr_controller_type = ent->client->ps.vr_controller_type;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
line 695
;689:#endif
;690:#ifdef USE_NATIVE_HACK
;691:	vr_controller_type = vrinfo->vr_controller_type;
;692:#endif
;693:
;694:	// not VR client
;695:	if ( !vr_controller_type ) {
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $227
line 696
;696:		VectorMA( muzzle_origin, 8192.0, forward, end );
ADDRLP4 92
ADDRGP4 muzzle_origin
INDIRF4
ADDRGP4 forward
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
ADDRLP4 92+4
ADDRGP4 muzzle_origin+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
ADDRLP4 92+8
ADDRGP4 muzzle_origin+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
line 697
;697:	}
ADDRGP4 $228
JUMPV
LABELV $227
line 699
;698:	// VR client
;699:	else {
line 700
;700:		VectorMA( muzzle, 8192.0, forward, end );
ADDRLP4 92
ADDRGP4 muzzle
INDIRF4
ADDRGP4 forward
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
ADDRLP4 92+4
ADDRGP4 muzzle+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
ADDRLP4 92+8
ADDRGP4 muzzle+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
line 701
;701:	}
LABELV $228
line 704
;702:
;703:	// unlagged
;704:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 707
;705:
;706:	// trace only against the solids, so the railgun will go through people
;707:	unlinked = 0;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 708
;708:	hits = 0;
ADDRLP4 112
CNSTI4 0
ASGNI4
line 709
;709:	passent = ent->s.number;
ADDRLP4 104
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $241
line 710
;710:	do {
line 712
;711:		// not VR client
;712:		if ( !vr_controller_type ) {
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $244
line 713
;713:			trap_Trace( &trace, muzzle_origin, NULL, NULL, end, passent, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 104
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 714
;714:		}
ADDRGP4 $245
JUMPV
LABELV $244
line 716
;715:		// VR client
;716:		else {
line 717
;717:			trap_Trace( &trace, muzzle, NULL, NULL, end, passent, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRGP4 muzzle
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 104
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 718
;718:		}
LABELV $245
line 720
;719:
;720:		if ( trace.entityNum >= ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 4+52
INDIRI4
CNSTI4 1022
LTI4 $246
line 721
;721:			break;
ADDRGP4 $243
JUMPV
LABELV $246
line 723
;722:		}
;723:		traceEnt = &g_entities[ trace.entityNum ];
ADDRLP4 0
ADDRLP4 4+52
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 724
;724:		if ( traceEnt->takedamage ) {
ADDRLP4 0
INDIRP4
CNSTI4 1232
ADDP4
INDIRI4
CNSTI4 0
EQI4 $250
line 747
;725:#ifdef MISSIONPACK
;726:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;727:				if ( G_InvulnerabilityEffect( traceEnt, forward, trace.endpos, impactpoint, bouncedir ) ) {
;728:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;729:					// snap the endpos to integers to save net bandwidth, but nudged towards the line
;730:					SnapVectorTowards( trace.endpos, muzzle );
;731:					// send railgun beam effect
;732:					tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
;733:					// set player number for custom colors on the railtrail
;734:					tent->s.clientNum = ent->s.clientNum;
;735:					VectorCopy( muzzle, tent->s.origin2 );
;736:					// move origin a bit to come closer to the drawn gun muzzle
;737:					VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
;738:					VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
;739:					tent->s.eventParm = 255;	// don't make the explosion at the end
;740:					//
;741:					VectorCopy( impactpoint, muzzle );
;742:					// the player can hit him/herself with the bounced rail
;743:					passent = ENTITYNUM_NONE;
;744:				}
;745:			} else
;746:#else
;747:			{
line 748
;748:				if ( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $252
line 749
;749:					hits++;
ADDRLP4 112
ADDRLP4 112
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 750
;750:				}
LABELV $252
line 751
;751:				G_Damage( traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 108
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 752
;752:			}
line 754
;753:#endif
;754:		}
LABELV $250
line 755
;755:		if ( trace.contents & CONTENTS_SOLID ) {
ADDRLP4 4+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $255
line 756
;756:			break;		// we hit something solid enough to stop the beam
ADDRGP4 $243
JUMPV
LABELV $255
line 759
;757:		}
;758:		// unlink this entity, so the next trace will go past it
;759:		trap_UnlinkEntity( traceEnt );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 760
;760:		unlinkedEntities[unlinked] = traceEnt;
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 761
;761:		unlinked++;
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 762
;762:	} while ( unlinked < MAX_RAIL_HITS );
LABELV $242
ADDRLP4 60
INDIRI4
CNSTI4 4
LTI4 $241
LABELV $243
line 765
;763:
;764:	// unlagged
;765:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 769
;766:
;767:
;768:	// link back in any entities we unlinked
;769:	for ( i = 0 ; i < unlinked ; i++ ) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $261
JUMPV
LABELV $258
line 770
;770:		trap_LinkEntity( unlinkedEntities[i] );
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 771
;771:	}
LABELV $259
line 769
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $261
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
LTI4 $258
line 777
;772:
;773:	// the final trace endpos will be the terminal point of the rail trail
;774:
;775:	// snap the endpos to integers to save net bandwidth, but nudged towards the line
;776:#ifdef USE_VR
;777:	if ( vr_controller_type )
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $262
line 779
;778:		// VR client
;779:		SnapVectorTowards( trace.endpos, muzzle );
ADDRLP4 4+12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
ADDRGP4 $263
JUMPV
LABELV $262
line 783
;780:	else
;781:#endif
;782:		// Not VR client
;783:		SnapVectorTowards( trace.endpos, muzzle_origin );
ADDRLP4 4+12
ARGP4
ADDRGP4 muzzle_origin
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
LABELV $263
line 787
;784:
;785:
;786:	// send railgun beam effect
;787:	tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
ADDRLP4 4+12
ARGP4
CNSTI4 54
ARGI4
ADDRLP4 116
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 116
INDIRP4
ASGNP4
line 790
;788:
;789:	// set player number for custom colors on the railtrail
;790:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 84
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 792
;791:
;792:	VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 795
;793:	// move origin a bit to come closer to the drawn gun muzzle
;794:	// not VR client
;795:	if ( !vr_controller_type ) {
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $267
line 796
;796:		VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ADDRGP4 right
INDIRF4
CNSTF4 1082130432
MULF4
ADDF4
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ADDRGP4 right+4
INDIRF4
CNSTF4 1082130432
MULF4
ADDF4
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ADDRGP4 right+8
INDIRF4
CNSTF4 1082130432
MULF4
ADDF4
ASGNF4
line 797
;797:		VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ADDRGP4 up
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ADDRGP4 up+4
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ADDRGP4 up+8
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
line 798
;798:	}
LABELV $267
line 800
;799:
;800:	SnapVector( tent->s.origin2 );
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 803
;801:
;802:	// no explosion at end if SURF_NOIMPACT, but still make the trail
;803:	if ( trace.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $273
line 804
;804:		tent->s.eventParm = 255;	// don't make the explosion at the end
ADDRLP4 84
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 255
ASGNI4
line 805
;805:	} else {
ADDRGP4 $274
JUMPV
LABELV $273
line 806
;806:		tent->s.eventParm = DirToByte( trace.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 120
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 84
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 120
INDIRI4
ASGNI4
line 807
;807:	}
LABELV $274
line 808
;808:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 84
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 811
;809:
;810:	// give the shooter a reward sound if they have made two railgun hits in a row
;811:	if ( hits == 0 ) {
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $277
line 813
;812:		// complete miss
;813:		ent->client->accurateCount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 884
ADDP4
CNSTI4 0
ASGNI4
line 814
;814:	} else {
ADDRGP4 $278
JUMPV
LABELV $277
line 816
;815:		// check for "impressive" reward sound
;816:		ent->client->accurateCount += hits;
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 884
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI4
ADDRLP4 112
INDIRI4
ADDI4
ASGNI4
line 817
;817:		if ( ent->client->accurateCount >= 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 884
ADDP4
INDIRI4
CNSTI4 2
LTI4 $279
line 818
;818:			ent->client->accurateCount -= 2;
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 884
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 819
;819:			ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
ADDRLP4 128
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 821
;820:			// add the sprite over the player's head
;821:			ent->client->ps.eFlags &= ~EF_AWARDS;
ADDRLP4 132
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 822
;822:			ent->client->ps.eFlags |= EF_AWARD_IMPRESSIVE;
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 823
;823:			ent->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 920
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 824
;824:		}
LABELV $279
line 825
;825:		ent->client->accuracy_hits++;
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 892
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 826
;826:	}
LABELV $278
line 828
;827:
;828:}
LABELV $226
endproc weapon_railgun_fire 144 32
export Weapon_GrapplingHook_Fire
proc Weapon_GrapplingHook_Fire 4 12
line 840
;829:
;830:
;831:/*
;832:======================================================================
;833:
;834:GRAPPLING HOOK
;835:
;836:======================================================================
;837:*/
;838:#ifdef USE_GRAPPLING_HOOK
;839:void Weapon_GrapplingHook_Fire (gentity_t *ent)
;840:{
line 841
;841:	if (!ent->client->fireHeld && !ent->client->hook)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 0
NEI4 $283
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 936
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $283
line 842
;842:		fire_grapple (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 fire_grapple
CALLP4
pop
LABELV $283
line 844
;843:
;844:	ent->client->fireHeld = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 1
ASGNI4
line 845
;845:}
LABELV $282
endproc Weapon_GrapplingHook_Fire 4 12
export Weapon_HookFree
proc Weapon_HookFree 4 4
line 849
;846:
;847:
;848:void Weapon_HookFree (gentity_t *ent)
;849:{
line 850
;850:	ent->parent->client->hook = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1096
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 936
ADDP4
CNSTP4 0
ASGNP4
line 851
;851:	ent->parent->client->ps.pm_flags &= ~PMF_GRAPPLE_PULL;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1096
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 852
;852:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 853
;853:}
LABELV $285
endproc Weapon_HookFree 4 4
export Weapon_HookThink
proc Weapon_HookThink 36 8
line 857
;854:
;855:
;856:void Weapon_HookThink (gentity_t *ent)
;857:{
line 858
;858:	if (ent->enemy) {
ADDRFP4 0
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $287
line 861
;859:		vec3_t v, oldorigin;
;860:
;861:		VectorCopy(ent->r.currentOrigin, oldorigin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 984
ADDP4
INDIRB
ASGNB 12
line 862
;862:		v[0] = ent->enemy->r.currentOrigin[0] + (ent->enemy->r.mins[0] + ent->enemy->r.maxs[0]) * 0.5;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
CNSTI4 984
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
CNSTI4 944
ADDP4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 863
;863:		v[1] = ent->enemy->r.currentOrigin[1] + (ent->enemy->r.mins[1] + ent->enemy->r.maxs[1]) * 0.5;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
CNSTI4 988
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
CNSTI4 936
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
CNSTI4 948
ADDP4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 864
;864:		v[2] = ent->enemy->r.currentOrigin[2] + (ent->enemy->r.mins[2] + ent->enemy->r.maxs[2]) * 0.5;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 32
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
CNSTI4 992
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
CNSTI4 940
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
CNSTI4 952
ADDP4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 865
;865:		SnapVectorTowards( v, oldorigin );	// save net bandwidth
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 867
;866:
;867:		G_SetOrigin( ent, v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 868
;868:	}
LABELV $287
line 870
;869:
;870:	VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1096
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 984
ADDP4
INDIRB
ASGNB 12
line 871
;871:}
LABELV $286
endproc Weapon_HookThink 36 8
export Weapon_LightningFire
proc Weapon_LightningFire 104 32
line 882
;872:#endif
;873:
;874:/*
;875:======================================================================
;876:
;877:LIGHTNING GUN
;878:
;879:======================================================================
;880:*/
;881:
;882:void Weapon_LightningFire( gentity_t *ent ) {
line 894
;883:	trace_t		tr;
;884:	vec3_t		end;
;885:#ifdef MISSIONPACK
;886:	vec3_t impactpoint, bouncedir;
;887:#endif
;888:	gentity_t	*traceEnt, *tent;
;889:	int			damage, i, passent;
;890:#ifdef USE_VR
;891:	int			vr_controller_type;
;892:#endif
;893:
;894:	damage = 8 * s_quadFactor;
ADDRLP4 88
ADDRGP4 s_quadFactor
INDIRF4
CNSTF4 1090519040
MULF4
CVFI4 4
ASGNI4
line 896
;895:
;896:	passent = ent->s.number;
ADDRLP4 84
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 898
;897:
;898:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $292
line 899
;899:		VectorMA( muzzle_origin, LIGHTNING_RANGE, forward, end );
ADDRLP4 60
ADDRGP4 muzzle_origin
INDIRF4
ADDRGP4 forward
INDIRF4
CNSTF4 1145044992
MULF4
ADDF4
ASGNF4
ADDRLP4 60+4
ADDRGP4 muzzle_origin+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1145044992
MULF4
ADDF4
ASGNF4
ADDRLP4 60+8
ADDRGP4 muzzle_origin+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1145044992
MULF4
ADDF4
ASGNF4
line 902
;900:
;901:		// unlagged
;902:		G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 906
;903:
;904:#ifdef USE_VR
;905:#ifdef USE_VR_QVM
;906:		vr_controller_type = ent->client->ps.vr_controller_type;
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
line 911
;907:#endif
;908:#ifdef USE_NATIVE_HACK
;909:		vr_controller_type = vrinfo->vr_controller_type;
;910:#endif
;911:		if ( vr_controller_type )
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $302
line 913
;912:			// VR client
;913:			trap_Trace( &tr, muzzle, NULL, NULL, end, passent, MASK_SHOT );
ADDRLP4 0
ARGP4
ADDRGP4 muzzle
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 84
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
ADDRGP4 $303
JUMPV
LABELV $302
line 917
;914:		else
;915:#endif
;916:			// not VR client
;917:			trap_Trace( &tr, muzzle_origin, NULL, NULL, end, passent, MASK_SHOT );
ADDRLP4 0
ARGP4
ADDRGP4 muzzle_origin
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 84
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
LABELV $303
line 920
;918:
;919:		// unlagged
;920:		G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 934
;921:
;922:#ifdef MISSIONPACK
;923:		// if not the first trace (the lightning bounced of an invulnerability sphere)
;924:		if (i) {
;925:			// add bounced off lightning bolt temp entity
;926:			// the first lightning bolt is a cgame only visual
;927:			//
;928:			tent = G_TempEntity( muzzle, EV_LIGHTNINGBOLT );
;929:			VectorCopy( tr.endpos, end );
;930:			SnapVector( end );
;931:			VectorCopy( end, tent->s.origin2 );
;932:		}
;933:#endif
;934:		if ( tr.entityNum == ENTITYNUM_NONE ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
NEI4 $304
line 935
;935:			return;
ADDRGP4 $291
JUMPV
LABELV $304
line 938
;936:		}
;937:
;938:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
ADDRLP4 0+52
INDIRI4
CNSTI4 1312
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 940
;939:
;940:		if ( traceEnt->takedamage ) {
ADDRLP4 56
INDIRP4
CNSTI4 1232
ADDP4
INDIRI4
CNSTI4 0
EQI4 $308
line 958
;941:#ifdef MISSIONPACK
;942:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;943:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;944:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;945:					VectorCopy( impactpoint, muzzle );
;946:					VectorSubtract( end, impactpoint, forward );
;947:					VectorNormalize(forward);
;948:					// the player can hit him/herself with the bounced lightning
;949:					passent = ENTITYNUM_NONE;
;950:				}
;951:				else {
;952:					VectorCopy( tr.endpos, muzzle );
;953:					passent = traceEnt->s.number;
;954:				}
;955:				continue;
;956:			}
;957:#else
;958:			if ( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $310
line 959
;959:				ent->client->accuracy_hits++;
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 892
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 960
;960:			}
LABELV $310
line 961
;961:			G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, 0, MOD_LIGHTNING );
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 88
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 11
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 963
;962:#endif
;963:		}
LABELV $308
line 965
;964:
;965:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 56
INDIRP4
CNSTI4 1232
ADDP4
INDIRI4
CNSTI4 0
EQI4 $313
ADDRLP4 56
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $313
line 966
;966:			tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
ADDRLP4 0+12
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 96
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 96
INDIRP4
ASGNP4
line 967
;967:			tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 968
;968:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 0+24
ARGP4
ADDRLP4 100
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 100
INDIRI4
ASGNI4
line 969
;969:			tent->s.weapon = ent->s.weapon;
ADDRLP4 72
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 970
;970:		} else if ( !( tr.surfaceFlags & SURF_NOIMPACT ) ) {
ADDRGP4 $294
JUMPV
LABELV $313
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $294
line 971
;971:			tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
ADDRLP4 0+12
ARGP4
CNSTI4 52
ARGI4
ADDRLP4 96
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 96
INDIRP4
ASGNP4
line 972
;972:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 0+24
ARGP4
ADDRLP4 100
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 100
INDIRI4
ASGNI4
line 973
;973:		}
line 975
;974:
;975:		break;
ADDRGP4 $294
JUMPV
LABELV $293
line 898
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $292
LABELV $294
line 977
;976:	}
;977:}
LABELV $291
endproc Weapon_LightningFire 104 32
export LogAccuracyHit
proc LogAccuracyHit 4 8
line 1034
;978:
;979:#ifdef MISSIONPACK
;980:/*
;981:======================================================================
;982:
;983:NAILGUN
;984:
;985:======================================================================
;986:*/
;987:
;988:void Weapon_Nailgun_Fire (gentity_t *ent) {
;989:	gentity_t	*m;
;990:	int			count;
;991:
;992:	for( count = 0; count < NUM_NAILSHOTS; count++ ) {
;993:		m = fire_nail (ent, muzzle, forward, right, up );
;994:		m->damage *= s_quadFactor;
;995:		m->splashDamage *= s_quadFactor;
;996:	}
;997:
;998://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;999:}
;1000:
;1001:
;1002:/*
;1003:======================================================================
;1004:
;1005:PROXIMITY MINE LAUNCHER
;1006:
;1007:======================================================================
;1008:*/
;1009:
;1010:void weapon_proxlauncher_fire (gentity_t *ent) {
;1011:	gentity_t	*m;
;1012:
;1013:	// extra vertical velocity
;1014:	forward[2] += 0.2f;
;1015:	VectorNormalize( forward );
;1016:
;1017:	m = fire_prox (ent, muzzle, forward);
;1018:	m->damage *= s_quadFactor;
;1019:	m->splashDamage *= s_quadFactor;
;1020:
;1021://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;1022:}
;1023:
;1024:#endif
;1025:
;1026://======================================================================
;1027:
;1028:
;1029:/*
;1030:===============
;1031:LogAccuracyHit
;1032:===============
;1033:*/
;1034:qboolean LogAccuracyHit( gentity_t *target, gentity_t *attacker ) {
line 1035
;1035:	if( !target->takedamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 1232
ADDP4
INDIRI4
CNSTI4 0
NEI4 $323
line 1036
;1036:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $322
JUMPV
LABELV $323
line 1039
;1037:	}
;1038:
;1039:	if ( target == attacker ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $325
line 1040
;1040:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $322
JUMPV
LABELV $325
line 1043
;1041:	}
;1042:
;1043:	if( !target->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $327
line 1044
;1044:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $322
JUMPV
LABELV $327
line 1047
;1045:	}
;1046:
;1047:	if( !attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $329
line 1048
;1048:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $322
JUMPV
LABELV $329
line 1051
;1049:	}
;1050:
;1051:	if( target->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $331
line 1052
;1052:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $322
JUMPV
LABELV $331
line 1055
;1053:	}
;1054:
;1055:	if ( OnSameTeam( target, attacker ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $333
line 1056
;1056:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $322
JUMPV
LABELV $333
line 1059
;1057:	}
;1058:
;1059:	return qtrue;
CNSTI4 1
RETI4
LABELV $322
endproc LogAccuracyHit 4 8
export FireWeapon
proc FireWeapon 32 24
line 1068
;1060:}
;1061:
;1062:
;1063:/*
;1064:===============
;1065:FireWeapon
;1066:===============
;1067:*/
;1068:void FireWeapon( gentity_t *ent ) {
line 1069
;1069:	qboolean isGrapple = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1076
;1070:#ifdef USE_VR
;1071:	vec3_t viewang;
;1072:	qboolean vr_controller_type;
;1073:#endif
;1074:
;1075:#ifdef USE_VR_QVM
;1076:	vr_controller_type = ent->client->ps.vr_controller_type;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
line 1084
;1077:#endif
;1078:#ifdef USE_NATIVE_HACK
;1079:	qboolean mySelf = (ent->client->ps.clientNum == vrinfo->clientNum);
;1080:	if ( mySelf )
;1081:		vr_controller_type = vrinfo->vr_controller_type;
;1082:#endif
;1083:
;1084:	if ( ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $336
line 1085
;1085:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 1086
;1086:	} else {
ADDRGP4 $337
JUMPV
LABELV $336
line 1087
;1087:		s_quadFactor = 1.0;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 1088
;1088:	}
LABELV $337
line 1097
;1089:#ifdef MISSIONPACK
;1090:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
;1091:		s_quadFactor *= 2;
;1092:	}
;1093:#endif
;1094:
;1095:	// track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked
;1096:#ifdef USE_GRAPPLING_HOOK
;1097:	if( ent->s.weapon != WP_GRAPPLING_HOOK )
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 10
EQI4 $339
line 1099
;1098:#endif
;1099:	if( ent->s.weapon != WP_GAUNTLET ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
EQI4 $341
line 1107
;1100:#ifdef MISSIONPACK
;1101:		if( ent->s.weapon == WP_NAILGUN ) {
;1102:			ent->client->accuracy_shots += NUM_NAILSHOTS;
;1103:		} else {
;1104:			ent->client->accuracy_shots++;
;1105:		}
;1106:#else
;1107:		ent->client->accuracy_shots++;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 888
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1109
;1108:#endif
;1109:	}
LABELV $341
LABELV $339
line 1122
;1110:
;1111:	// set aiming directions for VR controller
;1112:	// use right hand angles as view angles when possible
;1113:#ifdef USE_NATIVE_HACK
;1114:	if ( mySelf && (vr_controller_type == 1) ) {
;1115:		VectorCopy(vrinfo->controllers[SideRIGHT].angles.actual, viewang);
;1116:		// add the yaw spawn angle
;1117:		viewang[YAW] += ent->client->ps.viewangles[YAW] - vrinfo->hmdinfo.angles.actual[YAW];
;1118:	}
;1119:	else
;1120:#endif
;1121:#ifdef USE_VR_QVM
;1122:	if ( vr_controller_type > 0 )
ADDRLP4 12
INDIRI4
CNSTI4 0
LEI4 $343
line 1123
;1123:		VectorCopy(ent->client->ps.right_hand_angles, viewang);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 508
ADDP4
INDIRB
ASGNB 12
ADDRGP4 $344
JUMPV
LABELV $343
line 1126
;1124:	else
;1125:#endif
;1126:	VectorCopy(ent->client->ps.viewangles, viewang);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
LABELV $344
line 1129
;1127:
;1128:	// set aiming directions
;1129:	AngleVectors( viewang, forward, right, up );
ADDRLP4 0
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1131
;1130:
;1131:	CalcMuzzlePointOrigin( ent, ent->client->oldOrigin, forward, right, up, muzzle );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePointOrigin
CALLV
pop
line 1134
;1132:
;1133:	// fire the specific weapon
;1134:	switch( ent->s.weapon ) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 1
LTI4 $346
ADDRLP4 24
INDIRI4
CNSTI4 10
GTI4 $346
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $361-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $361
address $348
address $351
address $350
address $355
address $356
address $349
address $358
address $357
address $359
address $360
code
LABELV $348
line 1136
;1135:	case WP_GAUNTLET:
;1136:		Weapon_Gauntlet( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Gauntlet
CALLV
pop
line 1137
;1137:		break;
ADDRGP4 $346
JUMPV
LABELV $349
line 1139
;1138:	case WP_LIGHTNING:
;1139:		Weapon_LightningFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_LightningFire
CALLV
pop
line 1140
;1140:		break;
ADDRGP4 $346
JUMPV
LABELV $350
line 1142
;1141:	case WP_SHOTGUN:
;1142:		weapon_supershotgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_supershotgun_fire
CALLV
pop
line 1143
;1143:		break;
ADDRGP4 $346
JUMPV
LABELV $351
line 1145
;1144:	case WP_MACHINEGUN:
;1145:		if ( g_gametype.integer != GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $352
line 1146
;1146:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1128792064
ARGF4
CNSTI4 7
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 1147
;1147:		} else {
ADDRGP4 $346
JUMPV
LABELV $352
line 1148
;1148:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1128792064
ARGF4
CNSTI4 5
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 1149
;1149:		}
line 1150
;1150:		break;
ADDRGP4 $346
JUMPV
LABELV $355
line 1152
;1151:	case WP_GRENADE_LAUNCHER:
;1152:		weapon_grenadelauncher_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_grenadelauncher_fire
CALLV
pop
line 1153
;1153:		break;
ADDRGP4 $346
JUMPV
LABELV $356
line 1155
;1154:	case WP_ROCKET_LAUNCHER:
;1155:		Weapon_RocketLauncher_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_Fire
CALLV
pop
line 1156
;1156:		break;
ADDRGP4 $346
JUMPV
LABELV $357
line 1158
;1157:	case WP_PLASMAGUN:
;1158:		Weapon_Plasmagun_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Plasmagun_Fire
CALLV
pop
line 1159
;1159:		break;
ADDRGP4 $346
JUMPV
LABELV $358
line 1161
;1160:	case WP_RAILGUN:
;1161:		weapon_railgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_railgun_fire
CALLV
pop
line 1162
;1162:		break;
ADDRGP4 $346
JUMPV
LABELV $359
line 1164
;1163:	case WP_BFG:
;1164:		BFG_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BFG_Fire
CALLV
pop
line 1165
;1165:		break;
ADDRGP4 $346
JUMPV
LABELV $360
line 1168
;1166:#ifdef USE_GRAPPLING_HOOK
;1167:	case WP_GRAPPLING_HOOK:
;1168:		Weapon_GrapplingHook_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1169
;1169:		break;
line 1184
;1170:#endif
;1171:#ifdef MISSIONPACK
;1172:	case WP_NAILGUN:
;1173:		Weapon_Nailgun_Fire( ent );
;1174:		break;
;1175:	case WP_PROX_LAUNCHER:
;1176:		weapon_proxlauncher_fire( ent );
;1177:		break;
;1178:	case WP_CHAINGUN:
;1179:		Bullet_Fire( ent, CHAINGUN_SPREAD, MACHINEGUN_DAMAGE );
;1180:		break;
;1181:#endif
;1182:	default:
;1183:// FIXME		G_Error( "Bad ent->s.weapon" );
;1184:		break;
LABELV $346
line 1186
;1185:	}
;1186:}
LABELV $335
endproc FireWeapon 32 24
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
bss
align 4
LABELV muzzle_origin
skip 12
align 4
LABELV muzzle
skip 12
align 4
LABELV up
skip 12
align 4
LABELV right
skip 12
align 4
LABELV forward
skip 12
align 4
LABELV s_quadFactor
skip 4
import svf_self_portal2
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_TraceCapsule
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_RealTime
import trap_Milliseconds
import trap_Error
import trap_Print
import g_allowDeathCam
import g_itemTimer
import g_PureAllowHook
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_predictPVS
import g_unlagged
import g_rotation
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_autoJoin
import g_allowVote
import g_blood
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_dmflags
import g_maxGameClients
import g_cheats
import g_dedicated
import sv_fps
import g_mapname
import g_gametype
import g_entities
import level
import AddTeamScore
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import G_MapExist
import G_LoadMap
import ParseMapRotation
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import G_PredictPlayerMove
import G_UnTimeShiftClient
import G_UndoTimeShiftFor
import G_DoTimeShiftFor
import G_UnTimeShiftAllClients
import G_TimeShiftAllClients
import G_StoreHistory
import G_ResetHistory
import Svcmd_AbortPodium_f
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_ClearClientSessionData
import G_WriteClientSessionData
import G_ReadClientSessionData
import G_InitSessionData
import G_WriteSessionData
import G_InitWorldSession
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import Team_ResetFlags
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_BroadcastServerCommand
import G_Error
import G_Printf
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import MoveClientToIntermission
import DeathmatchScoreboardMessage
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SetClientVrControllerAngles
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamConnectedCount
import TeamCount
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_grapple
import fire_bfg
import fire_rocket
import fire_grenade
import fire_plasma
import fire_blaster
import G_RunMissile
import TossClientCubes
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import SpawnTime
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import G_RevertVote
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
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
LABELV $68
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
