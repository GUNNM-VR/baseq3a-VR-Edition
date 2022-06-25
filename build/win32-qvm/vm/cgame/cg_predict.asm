export CG_BuildSolidList
code
proc CG_BuildSolidList 24 0
file "..\..\..\..\code\cgame\cg_predict.c"
line 26
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_predict.c -- this file generates cg.predictedPlayerState by either
;4:// interpolating between snapshots from the server or locally predicting
;5:// ahead the client's movement.
;6:// It also handles local physics interaction, like fragments bouncing off walls
;7:
;8:#include "cg_local.h"
;9:
;10:static	pmove_t		cg_pmove;
;11:
;12:static	int			cg_numSolidEntities;
;13:static	centity_t	*cg_solidEntities[MAX_ENTITIES_IN_SNAPSHOT];
;14:static	int			cg_numTriggerEntities;
;15:static	centity_t	*cg_triggerEntities[MAX_ENTITIES_IN_SNAPSHOT];
;16:
;17:/*
;18:====================
;19:CG_BuildSolidList
;20:
;21:When a new cg.snap has been set, this function builds a sublist
;22:of the entities that are actually solid, to make for more
;23:efficient collision detection
;24:====================
;25:*/
;26:void CG_BuildSolidList( void ) {
line 32
;27:	int			i;
;28:	centity_t	*cent;
;29:	snapshot_t	*snap;
;30:	entityState_t	*ent;
;31:
;32:	cg_numSolidEntities = 0;
ADDRGP4 cg_numSolidEntities
CNSTI4 0
ASGNI4
line 33
;33:	cg_numTriggerEntities = 0;
ADDRGP4 cg_numTriggerEntities
CNSTI4 0
ASGNI4
line 35
;34:
;35:	if ( cg.nextSnap && !cg.nextFrameTeleport && !cg.thisFrameTeleport ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $88
ADDRGP4 cg+234756
INDIRI4
CNSTI4 0
NEI4 $88
ADDRGP4 cg+234752
INDIRI4
CNSTI4 0
NEI4 $88
line 36
;36:		snap = cg.nextSnap;
ADDRLP4 12
ADDRGP4 cg+40
INDIRP4
ASGNP4
line 37
;37:	} else {
ADDRGP4 $89
JUMPV
LABELV $88
line 38
;38:		snap = cg.snap;
ADDRLP4 12
ADDRGP4 cg+36
INDIRP4
ASGNP4
line 39
;39:	}
LABELV $89
line 41
;40:
;41:	for ( i = 0 ; i < snap->numEntities ; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $98
JUMPV
LABELV $95
line 42
;42:		cent = &cg_entities[ snap->entities[ i ].number ];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 456
MULI4
ADDRLP4 12
INDIRP4
CNSTI4 608
ADDP4
ADDP4
INDIRI4
CNSTI4 1236
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 43
;43:		ent = &cent->currentState;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 45
;44:
;45:		if ( ent->eType == ET_ITEM || ent->eType == ET_PUSH_TRIGGER || ent->eType == ET_TELEPORT_TRIGGER ) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $102
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 8
EQI4 $102
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 9
NEI4 $99
LABELV $102
line 46
;46:			cg_triggerEntities[cg_numTriggerEntities] = cent;
ADDRGP4 cg_numTriggerEntities
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_triggerEntities
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 47
;47:			cg_numTriggerEntities++;
ADDRLP4 20
ADDRGP4 cg_numTriggerEntities
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 48
;48:			continue;
ADDRGP4 $96
JUMPV
LABELV $99
line 51
;49:		}
;50:
;51:		if ( cent->nextState.solid ) {
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 0
EQI4 $103
line 52
;52:			cg_solidEntities[cg_numSolidEntities] = cent;
ADDRGP4 cg_numSolidEntities
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 53
;53:			cg_numSolidEntities++;
ADDRLP4 20
ADDRGP4 cg_numSolidEntities
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 54
;54:			continue;
LABELV $103
line 56
;55:		}
;56:	}
LABELV $96
line 41
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $98
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
LTI4 $95
line 57
;57:}
LABELV $87
endproc CG_BuildSolidList 24 0
proc CG_ClipMoveToEntities 144 36
line 67
;58:
;59:
;60:/*
;61:====================
;62:CG_ClipMoveToEntities
;63:
;64:====================
;65:*/
;66:static void CG_ClipMoveToEntities ( const vec3_t start, const vec3_t mins, const vec3_t maxs, const vec3_t end,
;67:							int skipNumber, int mask, trace_t *tr ) {
line 76
;68:	int			i, x, zd, zu;
;69:	trace_t		trace;
;70:	entityState_t	*ent;
;71:	clipHandle_t 	cmodel;
;72:	vec3_t		bmins, bmaxs;
;73:	vec3_t		origin, angles;
;74:	centity_t	*cent;
;75:
;76:	for ( i = 0 ; i < cg_numSolidEntities ; i++ ) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $109
JUMPV
LABELV $106
line 77
;77:		cent = cg_solidEntities[ i ];
ADDRLP4 60
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
INDIRP4
ASGNP4
line 78
;78:		ent = &cent->currentState;
ADDRLP4 0
ADDRLP4 60
INDIRP4
ASGNP4
line 80
;79:
;80:		if ( ent->number == skipNumber ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 16
INDIRI4
NEI4 $110
line 81
;81:			continue;
ADDRGP4 $107
JUMPV
LABELV $110
line 84
;82:		}
;83:
;84:		if ( ent->solid == SOLID_BMODEL ) {
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $112
line 86
;85:			// special value for bmodel
;86:			cmodel = trap_CM_InlineModel( ent->modelindex );
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 132
INDIRI4
ASGNI4
line 87
;87:			VectorCopy( cent->lerpAngles, angles );
ADDRLP4 108
ADDRLP4 60
INDIRP4
CNSTI4 1224
ADDP4
INDIRB
ASGNB 12
line 88
;88:			BG_EvaluateTrajectory( &cent->currentState.pos, cg.physicsTime, origin );
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+234772
INDIRI4
ARGI4
ADDRLP4 96
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 89
;89:		} else {
ADDRGP4 $113
JUMPV
LABELV $112
line 91
;90:			// encoded bbox
;91:			x = (ent->solid & 255);
ADDRLP4 120
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 92
;92:			zd = ((ent->solid>>8) & 255);
ADDRLP4 124
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 93
;93:			zu = ((ent->solid>>16) & 255) - 32;
ADDRLP4 128
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
CNSTI4 32
SUBI4
ASGNI4
line 95
;94:
;95:			bmins[0] = bmins[1] = -x;
ADDRLP4 132
ADDRLP4 120
INDIRI4
NEGI4
CVIF4 4
ASGNF4
ADDRLP4 72+4
ADDRLP4 132
INDIRF4
ASGNF4
ADDRLP4 72
ADDRLP4 132
INDIRF4
ASGNF4
line 96
;96:			bmaxs[0] = bmaxs[1] = x;
ADDRLP4 136
ADDRLP4 120
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 84+4
ADDRLP4 136
INDIRF4
ASGNF4
ADDRLP4 84
ADDRLP4 136
INDIRF4
ASGNF4
line 97
;97:			bmins[2] = -zd;
ADDRLP4 72+8
ADDRLP4 124
INDIRI4
NEGI4
CVIF4 4
ASGNF4
line 98
;98:			bmaxs[2] = zu;
ADDRLP4 84+8
ADDRLP4 128
INDIRI4
CVIF4 4
ASGNF4
line 100
;99:
;100:			cmodel = trap_CM_TempBoxModel( bmins, bmaxs );
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 140
ADDRGP4 trap_CM_TempBoxModel
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 140
INDIRI4
ASGNI4
line 101
;101:			VectorCopy( vec3_origin, angles );
ADDRLP4 108
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 102
;102:			VectorCopy( cent->lerpOrigin, origin );
ADDRLP4 96
ADDRLP4 60
INDIRP4
CNSTI4 1212
ADDP4
INDIRB
ASGNB 12
line 103
;103:		}
LABELV $113
line 106
;104:
;105:
;106:		trap_CM_TransformedBoxTrace ( &trace, start, end,
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 68
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 96
ARGP4
ADDRLP4 108
ARGP4
ADDRGP4 trap_CM_TransformedBoxTrace
CALLV
pop
line 109
;107:			mins, maxs, cmodel,  mask, origin, angles);
;108:
;109:		if (trace.allsolid || trace.fraction < tr->fraction) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $122
ADDRLP4 4+8
INDIRF4
ADDRFP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
GEF4 $119
LABELV $122
line 110
;110:			trace.entityNum = ent->number;
ADDRLP4 4+52
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 111
;111:			*tr = trace;
ADDRFP4 24
INDIRP4
ADDRLP4 4
INDIRB
ASGNB 56
line 112
;112:		} else if (trace.startsolid) {
ADDRGP4 $120
JUMPV
LABELV $119
ADDRLP4 4+4
INDIRI4
CNSTI4 0
EQI4 $124
line 113
;113:			tr->startsolid = qtrue;
ADDRFP4 24
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 114
;114:		}
LABELV $124
LABELV $120
line 115
;115:		if ( tr->allsolid ) {
ADDRFP4 24
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $127
line 116
;116:			return;
ADDRGP4 $105
JUMPV
LABELV $127
line 118
;117:		}
;118:	}
LABELV $107
line 76
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $109
ADDRLP4 64
INDIRI4
ADDRGP4 cg_numSolidEntities
INDIRI4
LTI4 $106
line 119
;119:}
LABELV $105
endproc CG_ClipMoveToEntities 144 36
export CG_Trace
proc CG_Trace 56 28
line 128
;120:
;121:
;122:/*
;123:================
;124:CG_Trace
;125:================
;126:*/
;127:void	CG_Trace( trace_t *result, const vec3_t start, const vec3_t mins, const vec3_t maxs, const vec3_t end, 
;128:					 int skipNumber, int mask ) {
line 131
;129:	trace_t	t;
;130:
;131:	trap_CM_BoxTrace ( &t, start, end, mins, maxs, 0, mask);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 132
;132:	if ( t.fraction == 1.0 )
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $130
line 133
;133:		t.entityNum = ENTITYNUM_NONE;
ADDRLP4 0+52
CNSTI4 1023
ASGNI4
ADDRGP4 $131
JUMPV
LABELV $130
line 135
;134:	else
;135:		t.entityNum = ENTITYNUM_WORLD;
ADDRLP4 0+52
CNSTI4 1022
ASGNI4
LABELV $131
line 138
;136:
;137:	// check all other solid models
;138:	CG_ClipMoveToEntities (start, mins, maxs, end, skipNumber, mask, &t);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 CG_ClipMoveToEntities
CALLV
pop
line 140
;139:
;140:	*result = t;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 56
line 141
;141:}
LABELV $129
endproc CG_Trace 56 28
export CG_PointContents
proc CG_PointContents 36 16
line 149
;142:
;143:
;144:/*
;145:================
;146:CG_PointContents
;147:================
;148:*/
;149:int		CG_PointContents( const vec3_t point, int passEntityNum ) {
line 156
;150:	int			i;
;151:	entityState_t	*ent;
;152:	centity_t	*cent;
;153:	clipHandle_t cmodel;
;154:	int			contents;
;155:
;156:	contents = trap_CM_PointContents (point, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 158
;157:
;158:	for ( i = 0 ; i < cg_numSolidEntities ; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $139
JUMPV
LABELV $136
line 159
;159:		cent = cg_solidEntities[ i ];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
INDIRP4
ASGNP4
line 161
;160:
;161:		ent = &cent->currentState;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 163
;162:
;163:		if ( ent->number == passEntityNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $140
line 164
;164:			continue;
ADDRGP4 $137
JUMPV
LABELV $140
line 167
;165:		}
;166:
;167:		if (ent->solid != SOLID_BMODEL) { // special value for bmodel
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
EQI4 $142
line 168
;168:			continue;
ADDRGP4 $137
JUMPV
LABELV $142
line 171
;169:		}
;170:
;171:		cmodel = trap_CM_InlineModel( ent->modelindex );
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 172
;172:		if ( !cmodel ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $144
line 173
;173:			continue;
ADDRGP4 $137
JUMPV
LABELV $144
line 176
;174:		}
;175:
;176:		contents |= trap_CM_TransformedPointContents( point, cmodel, cent->lerpOrigin, cent->lerpAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 1212
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1224
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_CM_TransformedPointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 32
INDIRI4
BORI4
ASGNI4
line 177
;177:	}
LABELV $137
line 158
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $139
ADDRLP4 8
INDIRI4
ADDRGP4 cg_numSolidEntities
INDIRI4
LTI4 $136
line 179
;178:
;179:	return contents;
ADDRLP4 16
INDIRI4
RETI4
LABELV $135
endproc CG_PointContents 36 16
proc CG_InterpolatePlayerState 128 12
line 191
;180:}
;181:
;182:
;183:/*
;184:========================
;185:CG_InterpolatePlayerState
;186:
;187:Generates cg.predictedPlayerState by interpolating between
;188:cg.snap->player_state and cg.nextFrame->player_state
;189:========================
;190:*/
;191:static void CG_InterpolatePlayerState( qboolean grabAngles ) {
line 197
;192:	float			f;
;193:	int				i;
;194:	playerState_t	*out;
;195:	snapshot_t		*prev, *next;
;196:
;197:	out = &cg.predictedPlayerState;
ADDRLP4 8
ADDRGP4 cg+234796
ASGNP4
line 198
;198:	prev = cg.snap;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
ASGNP4
line 199
;199:	next = cg.nextSnap;
ADDRLP4 12
ADDRGP4 cg+40
INDIRP4
ASGNP4
line 201
;200:
;201:	*out = cg.snap->ps;
ADDRLP4 8
INDIRP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 560
line 204
;202:
;203:	// if we are still allowing local input, short circuit the view angles
;204:	if ( grabAngles ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $151
line 208
;205:		usercmd_t	cmd;
;206:		int			cmdNum;
;207:
;208:		cmdNum = trap_GetCurrentCmdNumber();
ADDRLP4 124
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 120
ADDRLP4 124
INDIRI4
ASGNI4
line 209
;209:		trap_GetUserCmd( cmdNum, &cmd );
ADDRLP4 120
INDIRI4
ARGI4
ADDRLP4 20
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 211
;210:
;211:		PM_UpdateViewAngles( out, &cmd );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 212
;212:	}
LABELV $151
line 215
;213:
;214:	// if the next frame is a teleport, we can't lerp to it
;215:	if ( cg.nextFrameTeleport ) {
ADDRGP4 cg+234756
INDIRI4
CNSTI4 0
EQI4 $153
line 216
;216:		return;
ADDRGP4 $146
JUMPV
LABELV $153
line 219
;217:	}
;218:
;219:	if ( !next || next->serverTime <= prev->serverTime ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $158
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
GTI4 $156
LABELV $158
line 220
;220:		return;
ADDRGP4 $146
JUMPV
LABELV $156
line 223
;221:	}
;222:
;223:	f = (float)( cg.time - prev->serverTime ) / ( next->serverTime - prev->serverTime );
ADDRLP4 16
ADDRGP4 cg+234764
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 225
;224:
;225:	i = next->ps.bobCycle;
ADDRLP4 0
ADDRLP4 12
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
line 226
;226:	if ( i < prev->ps.bobCycle ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
GEI4 $160
line 227
;227:		i += 256;		// handle wraparound
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
ASGNI4
line 228
;228:	}
LABELV $160
line 229
;229:	out->bobCycle = prev->ps.bobCycle + f * ( i - prev->ps.bobCycle );
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 231
;230:
;231:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $162
line 232
;232:		out->origin[i] = prev->ps.origin[i] + f * (next->ps.origin[i] - prev->ps.origin[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 233
;233:		if ( !grabAngles ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $166
line 235
;234:			// HeadSet angles
;235:			out->viewangles[i] = LerpAngle( 
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 196
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 152
ADDP4
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
line 239
;236:				prev->ps.viewangles[i], next->ps.viewangles[i], f );
;237:
;238:#ifdef USE_VR_QVM
;239:			if ( out->vr_controller_type ) {
ADDRLP4 8
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $168
line 241
;240:				// HeadSet position
;241:				out->HMD_raw_origin[i] = next->ps.HMD_raw_origin[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 484
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 528
ADDP4
ADDP4
INDIRF4
ASGNF4
line 244
;242:
;243:				// Right hand angles
;244:				out->right_hand_angles[i] = LerpAngle(
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 552
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 508
ADDP4
ADDP4
ADDRLP4 56
INDIRF4
ASGNF4
line 248
;245:					prev->ps.right_hand_angles[i], next->ps.right_hand_angles[i], f);
;246:
;247:				// Right hand weapon muzzle point
;248:				out->right_muzzle_position[i] = next->ps.right_muzzle_position[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 496
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 540
ADDP4
ADDP4
INDIRF4
ASGNF4
line 251
;249:
;250:				// Right hand position
;251:				out->right_hand_position[i] = next->ps.right_hand_position[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 520
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 564
ADDP4
ADDP4
INDIRF4
ASGNF4
line 254
;252:
;253:				// left hand angles
;254:				out->left_hand_angles[i] = LerpAngle(
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 588
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 588
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 544
ADDP4
ADDP4
ADDRLP4 72
INDIRF4
ASGNF4
line 258
;255:					prev->ps.left_hand_angles[i], next->ps.left_hand_angles[i], f);
;256:
;257:				// left hand position
;258:				out->left_hand_position[i] = next->ps.left_hand_position[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 532
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 576
ADDP4
ADDP4
INDIRF4
ASGNF4
line 259
;259:			}
LABELV $168
line 261
;260:#endif // USE_VR_QVM
;261:		}
LABELV $166
line 262
;262:		out->velocity[i] = prev->ps.velocity[i] + 
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 76
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 264
;263:			f * (next->ps.velocity[i] - prev->ps.velocity[i] );
;264:	}
LABELV $163
line 231
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $162
line 266
;265:
;266:}
LABELV $146
endproc CG_InterpolatePlayerState 128 12
export CG_StoreEvent
proc CG_StoreEvent 4 4
line 283
;267:
;268:int				eventStack;
;269:entity_event_t	events[ MAX_PREDICTED_EVENTS ];
;270:int				eventParms[ MAX_PREDICTED_EVENTS ];
;271:int				eventParm2[ MAX_PREDICTED_EVENTS ]; // client entity index
;272:
;273:void CG_AddFallDamage( int damage );
;274:
;275:/*
;276:===================
;277:CG_StoreEvents
;278:
;279:Save events that may be dropped during prediction
;280:===================
;281:*/
;282:void CG_StoreEvent( entity_event_t evt, int eventParm, int entityNum ) 
;283:{
line 284
;284:	if ( eventStack >= MAX_PREDICTED_EVENTS )
ADDRGP4 eventStack
INDIRI4
CNSTI4 16
LTI4 $171
line 285
;285:		return;
ADDRGP4 $170
JUMPV
LABELV $171
line 287
;286:
;287:	if ( evt == EV_FALL_FAR ) {
ADDRFP4 0
INDIRI4
CNSTI4 12
NEI4 $173
line 288
;288:		CG_AddFallDamage( 10 );
CNSTI4 10
ARGI4
ADDRGP4 CG_AddFallDamage
CALLV
pop
line 289
;289:	} else if ( evt == EV_FALL_MEDIUM ) {
ADDRGP4 $174
JUMPV
LABELV $173
ADDRFP4 0
INDIRI4
CNSTI4 11
NEI4 $175
line 290
;290:		CG_AddFallDamage( 5 );
CNSTI4 5
ARGI4
ADDRGP4 CG_AddFallDamage
CALLV
pop
line 291
;291:	}
LABELV $175
LABELV $174
line 293
;292:
;293:	events[ eventStack ] = evt;
ADDRGP4 eventStack
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 events
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 294
;294:	eventParms[ eventStack ] = eventParm;
ADDRGP4 eventStack
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventParms
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 295
;295:	eventParm2[ eventStack ] = entityNum;
ADDRGP4 eventStack
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventParm2
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 296
;296:	eventStack++;
ADDRLP4 0
ADDRGP4 eventStack
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 297
;297:}
LABELV $170
endproc CG_StoreEvent 4 4
export CG_PlayDroppedEvents
proc CG_PlayDroppedEvents 24 12
line 305
;298:
;299:
;300:/*
;301:===================
;302:CG_PlayDroppedEvents
;303:===================
;304:*/
;305:void CG_PlayDroppedEvents( playerState_t *ps, playerState_t *ops ) {
line 310
;306:	centity_t	*cent;
;307:	entity_event_t oldEvent;
;308:	int i, oldParam;
;309:
;310:	if ( ps == ops ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $178
line 311
;311:		return;
ADDRGP4 $177
JUMPV
LABELV $178
line 314
;312:	}
;313:
;314:	if ( eventStack <= MAX_PS_EVENTS ) {
ADDRGP4 eventStack
INDIRI4
CNSTI4 2
GTI4 $180
line 315
;315:		return;
ADDRGP4 $177
JUMPV
LABELV $180
line 318
;316:	}
;317:
;318:	cent = &cg.predictedPlayerEntity;
ADDRLP4 4
ADDRGP4 cg+235356
ASGNP4
line 320
;319:
;320:	oldEvent = cent->currentState.event;
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 321
;321:	oldParam = cent->currentState.eventParm;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 323
;322:
;323:	for ( i = 0; i < eventStack - MAX_PS_EVENTS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $186
JUMPV
LABELV $183
line 324
;324:		cent->currentState.event = events[ i ];
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 events
ADDP4
INDIRI4
ASGNI4
line 325
;325:		cent->currentState.eventParm = eventParms[ i ];
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventParms
ADDP4
INDIRI4
ASGNI4
line 326
;326:		if ( cg_showmiss.integer ) 
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $187
line 327
;327:		{
line 328
;328:			CG_Printf( "Playing dropped event: %s %i", eventnames[ events[ i ] ], eventParms[ i ] );
ADDRGP4 $190
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 events
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventnames
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventParms
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 329
;329:		}
LABELV $187
line 330
;330:		CG_EntityEvent( cent, cent->lerpOrigin, eventParm2[ i ] );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1212
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventParm2
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 331
;331:		cg.eventSequence++;
ADDRLP4 20
ADDRGP4 cg+236612
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 332
;332:	}
LABELV $184
line 323
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $186
ADDRLP4 0
INDIRI4
ADDRGP4 eventStack
INDIRI4
CNSTI4 2
SUBI4
LTI4 $183
line 334
;333:
;334:	cent->currentState.event = oldEvent;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 335
;335:	cent->currentState.eventParm = oldParam;
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 336
;336:}
LABELV $177
endproc CG_PlayDroppedEvents 24 12
proc CG_AddArmor 4 0
line 339
;337:
;338:
;339:static void CG_AddArmor( const gitem_t *item, int quantity ) {
line 341
;340:
;341:	cg.predictedPlayerState.stats[STAT_ARMOR] += quantity;
ADDRLP4 0
ADDRGP4 cg+234796+184+12
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 343
;342:
;343:		if ( cg.predictedPlayerState.stats[STAT_ARMOR] > cg.predictedPlayerState.stats[STAT_MAX_HEALTH]*2 )
ADDRGP4 cg+234796+184+12
INDIRI4
ADDRGP4 cg+234796+184+24
INDIRI4
CNSTI4 1
LSHI4
LEI4 $196
line 344
;344:			cg.predictedPlayerState.stats[STAT_ARMOR] = cg.predictedPlayerState.stats[STAT_MAX_HEALTH]*2;
ADDRGP4 cg+234796+184+12
ADDRGP4 cg+234796+184+24
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
LABELV $196
line 345
;345:}
LABELV $192
endproc CG_AddArmor 4 0
proc CG_AddAmmo 12 0
line 349
;346:
;347:
;348:static void CG_AddAmmo( int weapon, int count )
;349:{
line 350
;350:	if ( weapon == WP_GAUNTLET
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $213
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $211
LABELV $213
line 354
;351:#ifdef USE_GRAPPLING_HOOK
;352:		|| weapon == WP_GRAPPLING_HOOK
;353:#endif
;354:		) {
line 355
;355:		cg.predictedPlayerState.ammo[weapon] = -1;
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+234796+376
ADDP4
CNSTI4 -1
ASGNI4
line 356
;356:	} else {
ADDRGP4 $212
JUMPV
LABELV $211
line 357
;357:		cg.predictedPlayerState.ammo[weapon] += count;
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+234796+376
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 358
;358:		if ( weapon >= WP_MACHINEGUN && weapon <= WP_BFG ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LTI4 $218
ADDRLP4 8
INDIRI4
CNSTI4 9
GTI4 $218
line 359
;359:			if ( cg.predictedPlayerState.ammo[weapon] > AMMO_HARD_LIMIT ) {
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+234796+376
ADDP4
INDIRI4
CNSTI4 200
LEI4 $220
line 360
;360:				cg.predictedPlayerState.ammo[weapon] = AMMO_HARD_LIMIT;
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+234796+376
ADDP4
CNSTI4 200
ASGNI4
line 361
;361:			}
LABELV $220
line 362
;362:		}
LABELV $218
line 363
;363:	}
LABELV $212
line 364
;364:}
LABELV $210
endproc CG_AddAmmo 12 0
proc CG_AddWeapon 4 8
line 368
;365:
;366:
;367:static void CG_AddWeapon( int weapon, int quantity, qboolean dropped ) 
;368:{
line 374
;369:	//int	ammo;
;370:	
;371:	//ammo = quantity;
;372:
;373:	// dropped items and teamplay weapons always have full ammo
;374:	if ( !dropped && cgs.gametype != GT_TEAM ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $227
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
EQI4 $227
line 375
;375:		if ( cg.predictedPlayerState.ammo[ weapon ] < quantity ) {
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+234796+376
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
GEI4 $230
line 376
;376:			quantity = quantity - cg.predictedPlayerState.ammo[ weapon ];
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+234796+376
ADDP4
INDIRI4
SUBI4
ASGNI4
line 377
;377:		} else {
ADDRGP4 $231
JUMPV
LABELV $230
line 378
;378:			quantity = 1;
ADDRFP4 4
CNSTI4 1
ASGNI4
line 379
;379:		}
LABELV $231
line 380
;380:	}
LABELV $227
line 383
;381:
;382:	// add the weapon
;383:	cg.predictedPlayerState.stats[STAT_WEAPONS] |= ( 1 << weapon );
ADDRLP4 0
ADDRGP4 cg+234796+184+8
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 385
;384:
;385:	CG_AddAmmo( weapon, quantity );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_AddAmmo
CALLV
pop
line 386
;386:}
LABELV $226
endproc CG_AddWeapon 4 8
proc CG_CheckArmor 16 4
line 389
;387:
;388:
;389:static int CG_CheckArmor( int damage ) {
line 393
;390:	int				save;
;391:	int				count;
;392:
;393:	count = cg.predictedPlayerState.stats[STAT_ARMOR];
ADDRLP4 4
ADDRGP4 cg+234796+184+12
INDIRI4
ASGNI4
line 395
;394:
;395:	save = ceil( damage * ARMOR_PROTECTION );
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1059648963
MULF4
ARGF4
ADDRLP4 8
ADDRGP4 ceil
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 397
;396:
;397:	if (save >= count)
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $243
line 398
;398:		save = count;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $243
line 400
;399:
;400:	if ( !save )
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $245
line 401
;401:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $239
JUMPV
LABELV $245
line 403
;402:	
;403:	cg.predictedPlayerState.stats[STAT_ARMOR] -= save;
ADDRLP4 12
ADDRGP4 cg+234796+184+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 405
;404:
;405:	return save;
ADDRLP4 0
INDIRI4
RETI4
LABELV $239
endproc CG_CheckArmor 16 4
export CG_AddFallDamage
proc CG_AddFallDamage 16 4
line 410
;406:}
;407:
;408:
;409: void CG_AddFallDamage( int damage ) 
;410:{
line 413
;411:	int take, asave;
;412:
;413:	if ( cg.predictedPlayerState.powerups[ PW_BATTLESUIT ] )
ADDRGP4 cg+234796+312+8
INDIRI4
CNSTI4 0
EQI4 $251
line 414
;414:		return;
ADDRGP4 $250
JUMPV
LABELV $251
line 416
;415:
;416:	if ( cg.predictedPlayerState.clientNum != cg.snap->ps.clientNum || cg.snap->ps.pm_flags & PMF_FOLLOW ) {
ADDRGP4 cg+234796+140
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $262
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $256
LABELV $262
line 417
;417:		return;
ADDRGP4 $250
JUMPV
LABELV $256
line 420
;418:	}
;419:
;420:	take = damage;
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
line 422
;421:
;422:	asave = CG_CheckArmor( take );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_CheckArmor
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 424
;423:
;424:	take -= asave;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 426
;425:
;426:	cg.predictedPlayerState.stats[STAT_HEALTH] -= take;
ADDRLP4 12
ADDRGP4 cg+234796+184
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 433
;427:
;428:#if 0
;429:	CG_Printf( "take: %i asave:%i health:%i armor:%i\n", take, asave, 
;430:		cg.predictedPlayerState.stats[STAT_HEALTH], cg.predictedPlayerState.stats[STAT_ARMOR] );
;431:#endif
;432:
;433:	cg.predictedPlayerState.damagePitch = 255;
ADDRGP4 cg+234796+176
CNSTI4 255
ASGNI4
line 434
;434:	cg.predictedPlayerState.damageYaw = 255;
ADDRGP4 cg+234796+172
CNSTI4 255
ASGNI4
line 436
;435:	//cg.predictedPlayerState.damageEvent++;
;436:	cg.predictedPlayerState.damageCount = take + asave;
ADDRGP4 cg+234796+180
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 437
;437:}
LABELV $250
endproc CG_AddFallDamage 16 4
proc CG_PickupPrediction 16 12
line 440
;438: 
;439:
;440:static void CG_PickupPrediction( centity_t *cent, const gitem_t *item ) {
line 443
;441:
;442:	// health prediction
;443:	if ( item->giType == IT_HEALTH && cent->currentState.time2 > 0 ) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 4
NEI4 $272
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
LEI4 $272
line 446
;444:		int limit;
;445:
;446:		limit = cg.predictedPlayerState.stats[ STAT_MAX_HEALTH ]; // soft limit
ADDRLP4 0
ADDRGP4 cg+234796+184+24
INDIRI4
ASGNI4
line 447
;447:		if ( !Q_stricmp( item->classname, "item_health_small" ) || !Q_stricmp( item->classname, "item_health_mega" ) ) {
ADDRFP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $279
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $281
ADDRFP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $280
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $277
LABELV $281
line 448
;448:			limit *= 2; // hard limit
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 449
;449:		}
LABELV $277
line 451
;450:
;451:		cg.predictedPlayerState.stats[STAT_HEALTH] += cent->currentState.time2;
ADDRLP4 12
ADDRGP4 cg+234796+184
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDI4
ASGNI4
line 452
;452:		if ( cg.predictedPlayerState.stats[ STAT_HEALTH ] > limit ) {
ADDRGP4 cg+234796+184
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $284
line 453
;453:			cg.predictedPlayerState.stats[ STAT_HEALTH ] = limit;
ADDRGP4 cg+234796+184
ADDRLP4 0
INDIRI4
ASGNI4
line 454
;454:		}
LABELV $284
line 455
;455:	}
LABELV $272
line 458
;456:
;457:	// armor prediction
;458:	if ( item->giType == IT_ARMOR && cent->currentState.time2 > 0 ) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 3
NEI4 $290
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
LEI4 $290
line 459
;459:		CG_AddArmor( item, cent->currentState.time2 );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddArmor
CALLV
pop
line 460
;460:		return;
ADDRGP4 $271
JUMPV
LABELV $290
line 464
;461:	}
;462:
;463:	// ammo prediction
;464:	if ( item->giType == IT_AMMO && cent->currentState.time2 > 0 ) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $292
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
LEI4 $292
line 465
;465:		CG_AddAmmo( item->giTag, cent->currentState.time2 );
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddAmmo
CALLV
pop
line 466
;466:		return;
ADDRGP4 $271
JUMPV
LABELV $292
line 470
;467:	}
;468:
;469:	// weapon prediction
;470:	if ( item->giType == IT_WEAPON && cent->currentState.time2 > 0 ) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $294
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
LEI4 $294
line 471
;471:		CG_AddWeapon( item->giTag, cent->currentState.time2, (cent->currentState.modelindex2 == 1) );
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 1
NEI4 $297
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $298
JUMPV
LABELV $297
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $298
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_AddWeapon
CALLV
pop
line 472
;472:		return;
ADDRGP4 $271
JUMPV
LABELV $294
line 476
;473:	}
;474:
;475:	// powerups prediction
;476:	if ( item->giType == IT_POWERUP && item->giTag >= PW_QUAD && item->giTag <= PW_FLIGHT ) {
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $299
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 1
LTI4 $299
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 6
GTI4 $299
line 478
;477:		// round timing to seconds to make multiple powerup timers count in sync
;478:		if ( !cg.predictedPlayerState.powerups[ item->giTag ] ) {
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+234796+312
ADDP4
INDIRI4
CNSTI4 0
NEI4 $301
line 479
;479:			cg.predictedPlayerState.powerups[ item->giTag ] = cg.predictedPlayerState.commandTime - ( cg.predictedPlayerState.commandTime % 1000 );
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+234796+312
ADDP4
ADDRGP4 cg+234796
INDIRI4
ADDRGP4 cg+234796
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 481
;480:			// this assumption is correct only on transition and implies hardcoded 1.3 coefficient:
;481:			if ( item->giTag == PW_HASTE ) {
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 3
NEI4 $309
line 482
;482:				cg.predictedPlayerState.speed *= 1.3f;
ADDRLP4 4
ADDRGP4 cg+234796+52
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1067869798
MULF4
CVFI4 4
ASGNI4
line 483
;483:			}
LABELV $309
line 484
;484:		}
LABELV $301
line 485
;485:		cg.predictedPlayerState.powerups[ item->giTag ] += cent->currentState.time2 * 1000;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+234796+312
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1000
MULI4
ADDI4
ASGNI4
line 486
;486:	}	
LABELV $299
line 489
;487:
;488:	// holdable prediction
;489:	if ( item->giType == IT_HOLDABLE && ( item->giTag == HI_TELEPORTER || item->giTag == HI_MEDKIT ) ) {
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $315
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 1
EQI4 $317
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
NEI4 $315
LABELV $317
line 490
;490:		cg.predictedPlayerState.stats[ STAT_HOLDABLE_ITEM ] = item - bg_itemlist;
ADDRGP4 cg+234796+184+4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 491
;491:	}
LABELV $315
line 492
;492:}
LABELV $271
endproc CG_PickupPrediction 16 12
proc CG_TouchItem 28 16
line 500
;493:
;494:
;495:/*
;496:===================
;497:CG_TouchItem
;498:===================
;499:*/
;500:static void CG_TouchItem( centity_t *cent ) {
line 503
;501:	const gitem_t *item;
;502:
;503:	if ( cg.allowPickupPrediction && cg.allowPickupPrediction > cg.time ) {
ADDRGP4 cg+282936
INDIRI4
CNSTI4 0
EQI4 $322
ADDRGP4 cg+282936
INDIRI4
ADDRGP4 cg+234764
INDIRI4
LEI4 $322
line 504
;504:		return;
ADDRGP4 $321
JUMPV
LABELV $322
line 507
;505:	}
;506:
;507:	if ( !cg_predictItems.integer ) {
ADDRGP4 cg_predictItems+12
INDIRI4
CNSTI4 0
NEI4 $327
line 508
;508:		return;
ADDRGP4 $321
JUMPV
LABELV $327
line 511
;509:	}
;510:
;511:	if ( !BG_PlayerTouchesItem( &cg.predictedPlayerState, &cent->currentState, cg.time ) ) {
ADDRGP4 cg+234796
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cg+234764
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BG_PlayerTouchesItem
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $330
line 512
;512:		return;
ADDRGP4 $321
JUMPV
LABELV $330
line 516
;513:	}
;514:
;515:	// never pick an item up twice in a prediction
;516:	if ( cent->delaySpawn > cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ADDRGP4 cg+234764
INDIRI4
LEI4 $334
line 517
;517:		return;
ADDRGP4 $321
JUMPV
LABELV $334
line 520
;518:	}
;519:
;520:	if ( !BG_CanItemBeGrabbed( cgs.gametype, &cent->currentState, &cg.predictedPlayerState ) ) {
ADDRGP4 cgs+31496
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cg+234796
ARGP4
ADDRLP4 8
ADDRGP4 BG_CanItemBeGrabbed
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $337
line 521
;521:		return; // can't hold it
ADDRGP4 $321
JUMPV
LABELV $337
line 524
;522:	}
;523:
;524:	item = &bg_itemlist[ cent->currentState.modelindex ];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 536
;525:
;526:	// Special case for flags.  
;527:	// We don't predict touching our own flag
;528:#ifdef MISSIONPACK
;529:	if( cgs.gametype == GT_1FCTF ) {
;530:		if( item->giTag != PW_NEUTRALFLAG ) {
;531:			return;
;532:		}
;533:	}
;534:	if( cgs.gametype == GT_CTF || cgs.gametype == GT_HARVESTER ) {
;535:#else
;536:	if( cgs.gametype == GT_CTF ) {
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 4
NEI4 $341
line 538
;537:#endif
;538:		if (cg.predictedPlayerState.persistant[PERS_TEAM] == TEAM_RED &&
ADDRGP4 cg+234796+248+12
INDIRI4
CNSTI4 1
NEI4 $344
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $344
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 7
NEI4 $344
line 540
;539:			item->giType == IT_TEAM && item->giTag == PW_REDFLAG)
;540:			return;
ADDRGP4 $321
JUMPV
LABELV $344
line 541
;541:		if (cg.predictedPlayerState.persistant[PERS_TEAM] == TEAM_BLUE &&
ADDRGP4 cg+234796+248+12
INDIRI4
CNSTI4 2
NEI4 $349
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $349
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 8
NEI4 $349
line 543
;542:			item->giType == IT_TEAM && item->giTag == PW_BLUEFLAG)
;543:			return;
ADDRGP4 $321
JUMPV
LABELV $349
line 544
;544:	}
LABELV $341
line 547
;545:
;546:	// grab it
;547:	BG_AddPredictableEventToPlayerstate( EV_ITEM_PICKUP, cent->currentState.modelindex , &cg.predictedPlayerState, cent - cg_entities );
CNSTI4 19
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+234796
ARGP4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRGP4 cg_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1236
DIVI4
ARGI4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 550
;548:
;549:	// perform prediction
;550:	CG_PickupPrediction( cent, item );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PickupPrediction
CALLV
pop
line 553
;551:
;552:	// remove it from the frame so it won't be drawn
;553:	cent->currentState.eFlags |= EF_NODRAW;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 556
;554:
;555:	// don't touch it again this prediction
;556:	cent->miscTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 559
;557:
;558:	// delay next potential pickup for some time
;559:	cent->delaySpawn = cg.time + ( cg.meanPing > 0 ? cg.meanPing * 2 + 100 : 333 );
ADDRGP4 cg+282928
INDIRI4
CNSTI4 0
LEI4 $360
ADDRLP4 20
ADDRGP4 cg+282928
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 100
ADDI4
ASGNI4
ADDRGP4 $361
JUMPV
LABELV $360
ADDRLP4 20
CNSTI4 333
ASGNI4
LABELV $361
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ADDRGP4 cg+234764
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
line 560
;560:	cent->delaySpawnPlayed = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 948
ADDP4
CNSTI4 0
ASGNI4
line 563
;561:
;562:	// if it's a weapon, give them some predicted ammo so the autoswitch will work
;563:	if ( item->giType == IT_WEAPON ) {
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $362
line 564
;564:		cg.predictedPlayerState.stats[ STAT_WEAPONS ] |= 1 << item->giTag;
ADDRLP4 24
ADDRGP4 cg+234796+184+8
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BORI4
ASGNI4
line 565
;565:		if ( !cg.predictedPlayerState.ammo[ item->giTag ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+234796+376
ADDP4
INDIRI4
CNSTI4 0
NEI4 $367
line 566
;566:			cg.predictedPlayerState.ammo[ item->giTag ] = 1;
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+234796+376
ADDP4
CNSTI4 1
ASGNI4
line 567
;567:		}
LABELV $367
line 568
;568:	}
LABELV $362
line 569
;569:}
LABELV $321
endproc CG_TouchItem 28 16
proc CG_TouchTriggerPrediction 84 28
line 579
;570:
;571:
;572:/*
;573:=========================
;574:CG_TouchTriggerPrediction
;575:
;576:Predict push triggers and items
;577:=========================
;578:*/
;579:static void CG_TouchTriggerPrediction( void ) {
line 588
;580:	int			i;
;581:	trace_t		trace;
;582:	entityState_t	*ent;
;583:	clipHandle_t cmodel;
;584:	centity_t	*cent;
;585:	qboolean	spectator;
;586:
;587:	// dead clients don't activate triggers
;588:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+234796+184
INDIRI4
CNSTI4 0
GTI4 $374
line 589
;589:		return;
ADDRGP4 $373
JUMPV
LABELV $374
line 592
;590:	}
;591:
;592:	spectator = ( cg.predictedPlayerState.pm_type == PM_SPECTATOR );
ADDRGP4 cg+234796+4
INDIRI4
CNSTI4 2
NEI4 $381
ADDRLP4 76
CNSTI4 1
ASGNI4
ADDRGP4 $382
JUMPV
LABELV $381
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $382
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
line 594
;593:
;594:	if ( cg.predictedPlayerState.pm_type != PM_NORMAL && !spectator ) {
ADDRGP4 cg+234796+4
INDIRI4
CNSTI4 0
EQI4 $383
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $383
line 595
;595:		return;
ADDRGP4 $373
JUMPV
LABELV $383
line 598
;596:	}
;597:
;598:	for ( i = 0 ; i < cg_numTriggerEntities ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $390
JUMPV
LABELV $387
line 599
;599:		cent = cg_triggerEntities[ i ];
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_triggerEntities
ADDP4
INDIRP4
ASGNP4
line 600
;600:		ent = &cent->currentState;
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 602
;601:
;602:		if ( ent->eType == ET_ITEM && !spectator ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $391
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $391
line 603
;603:			CG_TouchItem( cent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 CG_TouchItem
CALLV
pop
line 604
;604:			continue;
ADDRGP4 $388
JUMPV
LABELV $391
line 607
;605:		}
;606:
;607:		if ( ent->solid != SOLID_BMODEL ) {
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
EQI4 $393
line 608
;608:			continue;
ADDRGP4 $388
JUMPV
LABELV $393
line 611
;609:		}
;610:
;611:		cmodel = trap_CM_InlineModel( ent->modelindex );
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 80
INDIRI4
ASGNI4
line 612
;612:		if ( !cmodel ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $395
line 613
;613:			continue;
ADDRGP4 $388
JUMPV
LABELV $395
line 616
;614:		}
;615:
;616:		trap_CM_BoxTrace( &trace, cg.predictedPlayerState.origin, cg.predictedPlayerState.origin, 
ADDRLP4 16
ARGP4
ADDRGP4 cg+234796+20
ARGP4
ADDRGP4 cg+234796+20
ARGP4
ADDRGP4 cg_pmove+252
ARGP4
ADDRGP4 cg_pmove+264
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 619
;617:			cg_pmove.mins, cg_pmove.maxs, cmodel, -1 );
;618:
;619:		if ( !trace.startsolid ) {
ADDRLP4 16+4
INDIRI4
CNSTI4 0
NEI4 $403
line 620
;620:			continue;
ADDRGP4 $388
JUMPV
LABELV $403
line 623
;621:		}
;622:
;623:		if ( ent->eType == ET_TELEPORT_TRIGGER ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 9
NEI4 $406
line 624
;624:			cg.hyperspace = qtrue;
ADDRGP4 cg+234792
CNSTI4 1
ASGNI4
line 625
;625:		} else if ( ent->eType == ET_PUSH_TRIGGER ) {
ADDRGP4 $407
JUMPV
LABELV $406
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 8
NEI4 $409
line 626
;626:			BG_TouchJumpPad( &cg.predictedPlayerState, ent );
ADDRGP4 cg+234796
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BG_TouchJumpPad
CALLV
pop
line 627
;627:		}
LABELV $409
LABELV $407
line 628
;628:	}
LABELV $388
line 598
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $390
ADDRLP4 4
INDIRI4
ADDRGP4 cg_numTriggerEntities
INDIRI4
LTI4 $387
line 631
;629:
;630:	// if we didn't touch a jump pad this pmove frame
;631:	if ( cg.predictedPlayerState.jumppad_frame != cg.predictedPlayerState.pmove_framecount ) {
ADDRGP4 cg+234796+460
INDIRI4
ADDRGP4 cg+234796+456
INDIRI4
EQI4 $412
line 632
;632:		cg.predictedPlayerState.jumppad_frame = 0;
ADDRGP4 cg+234796+460
CNSTI4 0
ASGNI4
line 633
;633:		cg.predictedPlayerState.jumppad_ent = 0;
ADDRGP4 cg+234796+448
CNSTI4 0
ASGNI4
line 634
;634:	}
LABELV $412
line 635
;635:}
LABELV $373
endproc CG_TouchTriggerPrediction 84 28
proc CG_CheckTimers 16 0
line 638
;636:
;637:
;638:static void CG_CheckTimers( void ) {
line 642
;639:	int i;
;640:
;641:	// no prediction for spectators
;642:	if ( cg.predictedPlayerState.pm_type == PM_SPECTATOR ) {
ADDRGP4 cg+234796+4
INDIRI4
CNSTI4 2
NEI4 $423
line 643
;643:		return;
ADDRGP4 $422
JUMPV
LABELV $423
line 647
;644:	}
;645:
;646:	// no armor/health/powerups prediction for dead bodies
;647:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 )
ADDRGP4 cg+234796+184
INDIRI4
CNSTI4 0
GTI4 $427
line 648
;648:		return;
ADDRGP4 $422
JUMPV
LABELV $427
line 651
;649:
;650:	// periodic tasks
;651:	if ( cg.timeResidual && cg.predictedPlayerState.commandTime >= cg.timeResidual && !cg.thisFrameTeleport ) {
ADDRGP4 cg+282932
INDIRI4
CNSTI4 0
EQI4 $431
ADDRGP4 cg+234796
INDIRI4
ADDRGP4 cg+282932
INDIRI4
LTI4 $431
ADDRGP4 cg+234752
INDIRI4
CNSTI4 0
NEI4 $431
line 652
;652:		cg.timeResidual += 1000;
ADDRLP4 4
ADDRGP4 cg+282932
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 653
;653:		if ( cg.predictedPlayerState.powerups[ PW_REGEN ] ) {
ADDRGP4 cg+234796+312+20
INDIRI4
CNSTI4 0
EQI4 $438
line 654
;654:			int maxhealth = cg.predictedPlayerState.stats[ STAT_MAX_HEALTH ];
ADDRLP4 8
ADDRGP4 cg+234796+184+24
INDIRI4
ASGNI4
line 655
;655:			if ( cg.predictedPlayerState.stats[ STAT_HEALTH ] < maxhealth ) {
ADDRGP4 cg+234796+184
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $446
line 656
;656:				cg.predictedPlayerState.stats[ STAT_HEALTH ] += 15;
ADDRLP4 12
ADDRGP4 cg+234796+184
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 15
ADDI4
ASGNI4
line 657
;657:				if ( cg.predictedPlayerState.stats[ STAT_HEALTH ] > maxhealth * 1.1 ) {
ADDRGP4 cg+234796+184
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1066192077
MULF4
LEF4 $439
line 658
;658:					cg.predictedPlayerState.stats[ STAT_HEALTH ] = maxhealth * 1.1;
ADDRGP4 cg+234796+184
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1066192077
MULF4
CVFI4 4
ASGNI4
line 659
;659:				}
line 661
;660:				// TODO: add external EV_POWERUP_REGEN
;661:			} else if ( cg.predictedPlayerState.stats[ STAT_HEALTH ] < maxhealth * 2) {
ADDRGP4 $439
JUMPV
LABELV $446
ADDRGP4 cg+234796+184
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
GEI4 $439
line 662
;662:				cg.predictedPlayerState.stats[ STAT_HEALTH ] += 5;
ADDRLP4 12
ADDRGP4 cg+234796+184
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 663
;663:				if ( cg.predictedPlayerState.stats[ STAT_HEALTH ] > maxhealth * 2 ) {
ADDRGP4 cg+234796+184
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
LEI4 $439
line 664
;664:					cg.predictedPlayerState.stats[ STAT_HEALTH ] = maxhealth * 2;
ADDRGP4 cg+234796+184
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 665
;665:				}
line 667
;666:				// TODO: add external EV_POWERUP_REGEN
;667:			}
line 668
;668:		} else {
ADDRGP4 $439
JUMPV
LABELV $438
line 669
;669:			if ( cg.predictedPlayerState.stats[ STAT_HEALTH ] > cg.predictedPlayerState.stats[ STAT_MAX_HEALTH ] ) {
ADDRGP4 cg+234796+184
INDIRI4
ADDRGP4 cg+234796+184+24
INDIRI4
LEI4 $470
line 670
;670:				cg.predictedPlayerState.stats[ STAT_HEALTH ]--;
ADDRLP4 8
ADDRGP4 cg+234796+184
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 671
;671:			}
LABELV $470
line 672
;672:		}
LABELV $439
line 673
;673:		if ( cg.predictedPlayerState.stats[ STAT_ARMOR ] > cg.predictedPlayerState.stats[ STAT_MAX_HEALTH ] ) {
ADDRGP4 cg+234796+184+12
INDIRI4
ADDRGP4 cg+234796+184+24
INDIRI4
LEI4 $479
line 674
;674:			cg.predictedPlayerState.stats[ STAT_ARMOR ]--;
ADDRLP4 8
ADDRGP4 cg+234796+184+12
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 675
;675:		}
LABELV $479
line 676
;676:	}
LABELV $431
line 679
;677:
;678:	// turn off any expired powerups
;679:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $490
line 680
;680:		if ( !cg.predictedPlayerState.powerups[ i ] )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+234796+312
ADDP4
INDIRI4
CNSTI4 0
NEI4 $494
line 681
;681:			continue;
ADDRGP4 $491
JUMPV
LABELV $494
line 682
;682:		if ( cg.predictedPlayerState.powerups[ i ] < cg.predictedPlayerState.commandTime ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+234796+312
ADDP4
INDIRI4
ADDRGP4 cg+234796
INDIRI4
GEI4 $498
line 683
;683:			cg.predictedPlayerState.powerups[ i ] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+234796+312
ADDP4
CNSTI4 0
ASGNI4
line 684
;684:		}
LABELV $498
line 685
;685:	}
LABELV $491
line 679
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $490
line 686
;686:}
LABELV $422
endproc CG_CheckTimers 16 0
proc CG_IsUnacceptableError 164 36
line 689
;687:
;688:
;689:static int CG_IsUnacceptableError( playerState_t *ps, playerState_t *pps, qboolean *forceMove ) {
line 693
;690:	vec3_t delta;
;691:	int i, n, v0, v1;
;692: 
;693:	if ( pps->pm_time != ps->pm_time ||
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
NEI4 $509
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $509
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
EQI4 $506
LABELV $509
line 695
;694:		 pps->pm_type != ps->pm_type ||
;695:		 pps->pm_flags != ps->pm_flags ) {
line 696
;696:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $505
JUMPV
LABELV $506
line 699
;697:	}
;698: 
;699:	VectorSubtract( pps->origin, ps->origin, delta );
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 36
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 700
;700:	if ( VectorLengthSquared( delta ) > 0.01f * 0.01f ) {
ADDRLP4 12
ARGP4
ADDRLP4 44
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 953267991
LEF4 $512
line 701
;701:		if( cg_showmiss.integer > 2 ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 2
LEI4 $514
line 702
;702:			CG_Printf( "origin delta: %.2f  ", VectorLength( delta ) );
ADDRLP4 12
ARGP4
ADDRLP4 48
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRGP4 $517
ARGP4
ADDRLP4 48
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 703
;703:		}
LABELV $514
line 704
;704:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $505
JUMPV
LABELV $512
line 707
;705:	}
;706:
;707:	VectorSubtract( pps->velocity, ps->velocity, delta );
ADDRLP4 48
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 48
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 48
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
SUBF4
ASGNF4
line 708
;708:	if( VectorLengthSquared( delta ) > 0.01f * 0.01f ) {
ADDRLP4 12
ARGP4
ADDRLP4 56
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 953267991
LEF4 $520
line 709
;709:		if( cg_showmiss.integer > 2 ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 2
LEI4 $522
line 710
;710:			CG_Printf( "velocity delta: %.2f  ", VectorLength( delta ) );
ADDRLP4 12
ARGP4
ADDRLP4 60
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRGP4 $525
ARGP4
ADDRLP4 60
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 711
;711:		}
LABELV $522
line 712
;712:		return 3;
CNSTI4 3
RETI4
ADDRGP4 $505
JUMPV
LABELV $520
line 715
;713:	}
;714:
;715:	if( pps->weaponTime != ps->weaponTime ||
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
NEI4 $533
ADDRLP4 60
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
NEI4 $533
ADDRLP4 60
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
NEI4 $533
ADDRLP4 60
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
NEI4 $533
ADDRLP4 60
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
NEI4 $533
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
NEI4 $533
ADDRLP4 60
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
EQI4 $526
LABELV $533
line 721
;716:		pps->gravity != ps->gravity ||
;717:		pps->speed != ps->speed ||
;718:		pps->delta_angles[ 0 ] != ps->delta_angles[ 0 ] ||
;719:		pps->delta_angles[ 1 ] != ps->delta_angles[ 1 ] ||
;720:		pps->delta_angles[ 2 ] != ps->delta_angles[ 2 ] || 
;721:		pps->groundEntityNum != ps->groundEntityNum ) {
line 722
;722:		if ( cg_showmiss.integer > 1 )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $534
line 723
;723:			CG_Printf( "%i %i %i %i => %i %i %i %i", 
ADDRGP4 $537
ARGP4
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $534
line 727
;724:				pps->weaponTime, pps->gravity, pps->speed, pps->groundEntityNum,
;725:				ps->weaponTime, ps->gravity, ps->speed, ps->groundEntityNum ); 
;726:
;727:		return 4;
CNSTI4 4
RETI4
ADDRGP4 $505
JUMPV
LABELV $526
line 731
;728:	}
;729:
;730:	// forward gesture animation
;731:	if ( pps->torsoAnim != ps->torsoAnim && (ps->torsoAnim & ~ANIM_TOGGLEBIT ) == TORSO_GESTURE ) {
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
EQI4 $538
ADDRLP4 68
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 6
NEI4 $538
line 732
;732:		for ( n = 0 ; n < NUM_SAVED_STATES; n++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $540
line 733
;733:			cg.savedPmoveStates[ n ].torsoAnim = ps->torsoAnim;
ADDRLP4 4
INDIRI4
CNSTI4 560
MULI4
ADDRGP4 cg+245960+84
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 734
;734:			cg.savedPmoveStates[ n ].torsoTimer = ps->torsoTimer;
ADDRLP4 4
INDIRI4
CNSTI4 560
MULI4
ADDRGP4 cg+245960+80
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 735
;735:		}
LABELV $541
line 732
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 66
LTI4 $540
line 736
;736:	}
LABELV $538
line 738
;737:
;738:	if ( pps->legsTimer != ps->legsTimer ||	pps->legsAnim != ps->legsAnim ||
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
NEI4 $553
ADDRLP4 72
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
NEI4 $553
ADDRLP4 72
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
NEI4 $553
ADDRLP4 72
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
NEI4 $553
ADDRLP4 72
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
EQI4 $548
LABELV $553
line 740
;739:		pps->torsoTimer != ps->torsoTimer || pps->torsoAnim != ps->torsoAnim ||
;740:		pps->movementDir != ps->movementDir ) {
line 741
;741:		return 5;
CNSTI4 5
RETI4
ADDRGP4 $505
JUMPV
LABELV $548
line 744
;742:	}
;743:
;744:	VectorSubtract( pps->grapplePoint, ps->grapplePoint, delta );
ADDRLP4 80
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 80
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 80
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 745
;745:	if( VectorLengthSquared( delta ) > 0.01f * 0.01f )
ADDRLP4 12
ARGP4
ADDRLP4 88
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 88
INDIRF4
CNSTF4 953267991
LEF4 $556
line 746
;746:		return 6;
CNSTI4 6
RETI4
ADDRGP4 $505
JUMPV
LABELV $556
line 749
;747:
;748:	// check/update eFlags if needed
;749:	v0 = pps->eFlags & EF_NOPREDICT;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 784456
BANDI4
ASGNI4
line 750
;750:	v1 = ps->eFlags & EF_NOPREDICT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 784456
BANDI4
ASGNI4
line 751
;751:	if ( v0 != v1 ) {
ADDRLP4 8
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $558
line 752
;752:		for ( i = 0 ; i < NUM_SAVED_STATES; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $560
line 753
;753:			cg.savedPmoveStates[ i ].eFlags = (cg.savedPmoveStates[ i ].eFlags & ~EF_NOPREDICT) | v1 ;
ADDRLP4 0
INDIRI4
CNSTI4 560
MULI4
ADDRGP4 cg+245960+104
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 560
MULI4
ADDRGP4 cg+245960+104
ADDP4
INDIRI4
CNSTI4 -784457
BANDI4
ADDRLP4 24
INDIRI4
BORI4
ASGNI4
line 754
;754:		}
LABELV $561
line 752
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 66
LTI4 $560
line 755
;755:		pps->eFlags = (pps->eFlags & ~EF_NOPREDICT) | v1;
ADDRLP4 92
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 -784457
BANDI4
ADDRLP4 24
INDIRI4
BORI4
ASGNI4
line 756
;756:	}
LABELV $558
line 758
;757:
;758:	if ( pps->eFlags !=  ps->eFlags ) {
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
EQI4 $568
line 759
;759:		if ( cg_showmiss.integer > 1 )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $570
line 760
;760:			CG_Printf( "eFlags %i => %i", pps->eFlags, ps->eFlags );
ADDRGP4 $573
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $570
line 761
;761:		return 7;
CNSTI4 7
RETI4
ADDRGP4 $505
JUMPV
LABELV $568
line 764
;762:	}
;763:
;764:	if( pps->eventSequence != ps->eventSequence )
ADDRFP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
EQI4 $574
line 765
;765:		return 8;
CNSTI4 8
RETI4
ADDRGP4 $505
JUMPV
LABELV $574
line 767
;766:
;767:	for( i = 0; i < MAX_PS_EVENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $576
line 768
;768:		if ( pps->events[ i ] != ps->events[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
EQI4 $580
line 769
;769:			if ( cg_showmiss.integer > 1 ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $582
line 770
;770:				CG_Printf( "event[%i] %i => %i\n", i, pps->events[ i ], ps->events[ i ] );
ADDRGP4 $585
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 771
;771:			}
LABELV $582
line 772
;772:			return 9;
CNSTI4 9
RETI4
ADDRGP4 $505
JUMPV
LABELV $580
line 774
;773:		}
;774:		if ( pps->eventParms[ i ] != ps->eventParms[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
EQI4 $586
line 775
;775:			if ( cg_showmiss.integer > 1 ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $588
line 776
;776:				CG_Printf( "eventParms[%i] %i => %i\n", i, pps->eventParms[ i ], ps->eventParms[ i ] );
ADDRGP4 $591
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 777
;777:			}
LABELV $588
line 778
;778:			return 9;
CNSTI4 9
RETI4
ADDRGP4 $505
JUMPV
LABELV $586
line 780
;779:		}
;780:	}
LABELV $577
line 767
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $576
line 782
;781:
;782:	if ( pps->externalEvent != ps->externalEvent ||
ADDRLP4 92
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ADDRLP4 96
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
NEI4 $595
ADDRLP4 92
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ADDRLP4 96
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
NEI4 $595
ADDRLP4 92
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
ADDRLP4 96
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
EQI4 $592
LABELV $595
line 784
;783:		pps->externalEventParm != ps->externalEventParm ||
;784:		pps->externalEventTime != ps->externalEventTime ) {
line 785
;785:		return 10;
CNSTI4 10
RETI4
ADDRGP4 $505
JUMPV
LABELV $592
line 788
;786:	}
;787:
;788:	if ( pps->clientNum != ps->clientNum ||
ADDRLP4 100
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRLP4 104
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
NEI4 $599
ADDRLP4 100
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ADDRLP4 104
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
NEI4 $599
ADDRLP4 100
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 104
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
EQI4 $596
LABELV $599
line 790
;789:		pps->weapon != ps->weapon ||
;790:		pps->weaponstate != ps->weaponstate ) {
line 791
;791:		return 11;
CNSTI4 11
RETI4
ADDRGP4 $505
JUMPV
LABELV $596
line 794
;792:	}
;793:
;794:	if ( fabs( AngleDelta( ps->viewangles[ 0 ], pps->viewangles[ 0 ] ) ) > 1.0f ||
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
CNSTI4 152
ADDP4
INDIRF4
ARGF4
ADDRLP4 108
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRLP4 108
INDIRF4
ARGF4
ADDRLP4 112
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 112
INDIRF4
CNSTF4 1065353216
GTF4 $603
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ARGF4
ADDRLP4 116
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRLP4 116
INDIRF4
ARGF4
ADDRLP4 120
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 120
INDIRF4
CNSTF4 1065353216
GTF4 $603
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ARGF4
ADDRLP4 124
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRLP4 124
INDIRF4
ARGF4
ADDRLP4 128
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 128
INDIRF4
CNSTF4 1065353216
LEF4 $600
LABELV $603
line 796
;795:		fabs( AngleDelta( ps->viewangles[ 1 ], pps->viewangles[ 1 ] ) ) > 1.0f ||
;796:		fabs( AngleDelta( ps->viewangles[ 2 ], pps->viewangles[ 2 ] ) ) > 1.0f ) {
line 797
;797:		return 12;
CNSTI4 12
RETI4
ADDRGP4 $505
JUMPV
LABELV $600
line 800
;798:	}
;799:
;800:	if ( pps->viewheight != ps->viewheight )
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
EQI4 $604
line 801
;801:  		return 13;
CNSTI4 13
RETI4
ADDRGP4 $505
JUMPV
LABELV $604
line 803
;802:
;803:	if( pps->damageEvent != ps->damageEvent ||
ADDRLP4 132
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRLP4 136
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
NEI4 $610
ADDRLP4 132
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRLP4 136
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
NEI4 $610
ADDRLP4 132
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ADDRLP4 136
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
NEI4 $610
ADDRLP4 132
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRLP4 136
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
EQI4 $606
LABELV $610
line 806
;804:		pps->damageYaw != ps->damageYaw ||
;805:		pps->damagePitch != ps->damagePitch ||
;806:		pps->damageCount != ps->damageCount ) {
line 807
;807:		if ( cg_showmiss.integer > 1 )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $611
line 808
;808:			CG_Printf( "dmg %i %i %i %i >= %i %i %i %i\n", 
ADDRGP4 $614
ARGP4
ADDRLP4 140
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $611
line 811
;809:				pps->damageEvent, pps->damageYaw, pps->damagePitch, pps->damageCount,
;810:				ps->damageEvent, ps->damageYaw, ps->damagePitch, ps->damageCount );
;811:		return 14;
CNSTI4 14
RETI4
ADDRGP4 $505
JUMPV
LABELV $606
line 815
;812:	}
;813:
;814:	// health countdown?
;815:	if ( pps->stats[ STAT_HEALTH ] == ps->stats[ STAT_HEALTH ] + 1 && ps->stats[ STAT_HEALTH ] >= ps->stats[ STAT_MAX_HEALTH ] ) {
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 140
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1
ADDI4
NEI4 $615
ADDRLP4 140
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 140
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
LTI4 $615
line 816
;816:		cg.timeResidual = ps->commandTime + 1000;
ADDRGP4 cg+282932
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 817
;817:		for ( n = 0 ; n < NUM_SAVED_STATES; n++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $618
line 818
;818:			cg.savedPmoveStates[ n ].stats[ STAT_HEALTH ] = ps->stats[ STAT_HEALTH ];
ADDRLP4 4
INDIRI4
CNSTI4 560
MULI4
ADDRGP4 cg+245960+184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 819
;819:		}
LABELV $619
line 817
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 66
LTI4 $618
line 821
;820:
;821:	}
LABELV $615
line 823
;822:	// armor countdown?
;823:	if ( pps->stats[ STAT_ARMOR ] == ps->stats[ STAT_ARMOR ] - 1 && ps->stats[ STAT_ARMOR ] >= ps->stats[ STAT_MAX_HEALTH ] ) {
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 144
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 1
SUBI4
NEI4 $624
ADDRLP4 144
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 144
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
LTI4 $624
line 825
;824:		// we may need few frames to sync with client->timeResidual on server side
;825:		cg.timeResidual = ps->commandTime + 1000;
ADDRGP4 cg+282932
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 826
;826:		for ( n = 0 ; n < NUM_SAVED_STATES; n++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $627
line 827
;827:			cg.savedPmoveStates[ n ].stats[ STAT_ARMOR ] = ps->stats[ STAT_ARMOR ];
ADDRLP4 4
INDIRI4
CNSTI4 560
MULI4
ADDRGP4 cg+245960+184+12
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 828
;828:		}
LABELV $628
line 826
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 66
LTI4 $627
line 829
;829:	}
LABELV $624
line 831
;830:
;831:	for( i = 0; i < MAX_STATS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $634
line 833
;832:		// we can't predict some flags
;833:		if ( i == STAT_CLIENTS_READY /*|| i == STAT_MAX_HEALTH */ ) {
ADDRLP4 0
INDIRI4
CNSTI4 5
NEI4 $638
line 834
;834:			for ( n = 0 ; n < NUM_SAVED_STATES; n++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $640
line 835
;835:				cg.savedPmoveStates[ n ].stats[ i ] = ps->stats[ i ];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 560
MULI4
ADDRGP4 cg+245960+184
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDP4
INDIRI4
ASGNI4
line 836
;836:			}
LABELV $641
line 834
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 66
LTI4 $640
line 837
;837:			continue;
ADDRGP4 $635
JUMPV
LABELV $638
line 839
;838:		}
;839:		if ( pps->stats[ i ] != ps->stats[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDP4
INDIRI4
EQI4 $646
line 840
;840:			if ( cg_showmiss.integer > 1 ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $648
line 841
;841:				CG_Printf( "stats[%i] %i => %i ", i, pps->stats[ i ], ps->stats[ i ] );
ADDRGP4 $651
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 842
;842:			}
LABELV $648
line 843
;843:			return 15;
CNSTI4 15
RETI4
ADDRGP4 $505
JUMPV
LABELV $646
line 845
;844:		}
;845:	}
LABELV $635
line 831
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $634
line 848
;846:
;847:
;848:	for( i = 0; i < MAX_PERSISTANT ; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $652
line 849
;849:	{
line 850
;850:		if ( pps->persistant[ i ] != ps->persistant[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
EQI4 $656
line 851
;851:			if ( i >= PERS_TEAM && i <= PERS_PLAYEREVENTS ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $658
ADDRLP4 0
INDIRI4
CNSTI4 5
GTI4 $658
line 852
;852:				if ( cg_showmiss.integer > 1 ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $660
line 853
;853:					CG_Printf( "persistant[%i] %i => %i ", i, pps->persistant[ i ], ps->persistant[ i ] );
ADDRGP4 $663
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 854
;854:				}
LABELV $660
line 855
;855:				return 16;
CNSTI4 16
RETI4
ADDRGP4 $505
JUMPV
LABELV $658
line 857
;856:			}
;857:			v0 = ps->persistant[ i ];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ASGNI4
line 858
;858:			for ( n = 0 ; n < NUM_SAVED_STATES; n++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $664
line 859
;859:				cg.savedPmoveStates[ n ].persistant[ i ] = v0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 560
MULI4
ADDRGP4 cg+245960+248
ADDP4
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 860
;860:			}
LABELV $665
line 858
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 66
LTI4 $664
line 861
;861:			*forceMove = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 1
ASGNI4
line 862
;862:		}
LABELV $656
line 863
;863:	}
LABELV $653
line 848
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $652
line 865
;864:
;865:	for( i = 0; i < MAX_WEAPONS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $670
line 866
;866:		if( pps->ammo[ i ] != ps->ammo[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
EQI4 $674
line 867
;867:			if ( cg_showmiss.integer > 1 ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $676
line 868
;868:				CG_Printf( "ammo[%i] %i => %i ", i, pps->ammo[ i ], ps->ammo[ i ] );
ADDRGP4 $679
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 869
;869:			}
LABELV $676
line 870
;870:			return 18;
CNSTI4 18
RETI4
ADDRGP4 $505
JUMPV
LABELV $674
line 872
;871:		}
;872:	}
LABELV $671
line 865
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $670
line 874
;873:
;874:	if ( pps->generic1 != ps->generic1 || pps->loopSound != ps->loopSound ) {
ADDRLP4 148
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ADDRLP4 152
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
NEI4 $682
ADDRLP4 148
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ADDRLP4 152
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
EQI4 $680
LABELV $682
line 875
;875:		return 19;
CNSTI4 19
RETI4
ADDRGP4 $505
JUMPV
LABELV $680
line 878
;876:	}
;877:
;878:	for ( i = 0; i < MAX_POWERUPS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $683
line 879
;879:		if( pps->powerups[ i ] != ps->powerups[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
EQI4 $687
line 880
;880:			if ( cg_showmiss.integer > 1 )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $689
line 881
;881:				CG_Printf( "powerups[%i] %i => %i ", i, pps->powerups[i], ps->powerups[i] );
ADDRGP4 $692
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $689
line 882
;882:			return 20;
CNSTI4 20
RETI4
ADDRGP4 $505
JUMPV
LABELV $687
line 884
;883:		}
;884:	}
LABELV $684
line 878
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $683
line 886
;885:
;886:	return 0;
CNSTI4 0
RETI4
LABELV $505
endproc CG_IsUnacceptableError 164 36
export CG_PredictPlayerState
proc CG_PredictPlayerState 840 28
line 916
;887:}
;888:
;889:
;890:/*
;891:=================
;892:CG_PredictPlayerState
;893:
;894:Generates cg.predictedPlayerState for the current cg.time
;895:cg.predictedPlayerState is guaranteed to be valid after exiting.
;896:
;897:For demo playback, this will be an interpolation between two valid
;898:playerState_t.
;899:
;900:For normal gameplay, it will be the result of predicted usercmd_t on
;901:top of the most recent playerState_t received from the server.
;902:
;903:Each new snapshot will usually have one or more new usercmd over the last,
;904:but we simulate all unacknowledged commands each time, not just the new ones.
;905:This means that on an internet connection, quite a few pmoves may be issued
;906:each frame.
;907:
;908:OPTIMIZE: don't re-simulate unless the newly arrived snapshot playerState_t
;909:differs from the predicted one.  Would require saving all intermediate
;910:playerState_t during prediction.
;911:
;912:We detect prediction errors and allow them to be decayed off over several frames
;913:to ease the jerk.
;914:=================
;915:*/
;916:void CG_PredictPlayerState( void ) {
line 922
;917:	int			cmdNum, current;
;918:	playerState_t	oldPlayerState;
;919:	qboolean	moved;
;920:	usercmd_t	oldestCmd;
;921:	usercmd_t	latestCmd;
;922:	int stateIndex = 0, predictCmd = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 576
CNSTI4 0
ASGNI4
line 924
;923:
;924:	cg.hyperspace = qfalse;	// will be set if touching a trigger_teleport
ADDRGP4 cg+234792
CNSTI4 0
ASGNI4
line 929
;925:
;926:	// if this is the first frame we must guarantee
;927:	// predictedPlayerState is valid even if there is some
;928:	// other error condition
;929:	if ( !cg.validPPS ) {
ADDRGP4 cg+236592
INDIRI4
CNSTI4 0
NEI4 $695
line 930
;930:		cg.validPPS = qtrue;
ADDRGP4 cg+236592
CNSTI4 1
ASGNI4
line 931
;931:		cg.predictedPlayerState = cg.snap->ps;
ADDRGP4 cg+234796
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 560
line 932
;932:	}
LABELV $695
line 936
;933:
;934:
;935:	// demo playback just copies the moves
;936:	if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $705
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $701
LABELV $705
line 937
;937:		CG_InterpolatePlayerState( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 CG_InterpolatePlayerState
CALLV
pop
line 938
;938:		return;
ADDRGP4 $693
JUMPV
LABELV $701
line 942
;939:	}
;940:
;941:	// non-predicting local movement will grab the latest angles
;942:	if ( cg_nopredict.integer || cgs.synchronousClients ) {
ADDRGP4 cg_nopredict+12
INDIRI4
CNSTI4 0
NEI4 $710
ADDRGP4 cgs+151672
INDIRI4
CNSTI4 0
EQI4 $706
LABELV $710
line 943
;943:		CG_InterpolatePlayerState( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 CG_InterpolatePlayerState
CALLV
pop
line 944
;944:		return;
ADDRGP4 $693
JUMPV
LABELV $706
line 948
;945:	}
;946:
;947:	// prepare for pmove
;948:	cg_pmove.ps = &cg.predictedPlayerState;
ADDRGP4 cg_pmove
ADDRGP4 cg+234796
ASGNP4
line 949
;949:	cg_pmove.trace = CG_Trace;
ADDRGP4 cg_pmove+292
ADDRGP4 CG_Trace
ASGNP4
line 950
;950:	cg_pmove.pointcontents = CG_PointContents;
ADDRGP4 cg_pmove+296
ADDRGP4 CG_PointContents
ASGNP4
line 951
;951:	if ( cg_pmove.ps->pm_type == PM_DEAD ) {
ADDRGP4 cg_pmove
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $714
line 952
;952:		cg_pmove.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRGP4 cg_pmove+104
CNSTI4 65537
ASGNI4
line 953
;953:	}
ADDRGP4 $715
JUMPV
LABELV $714
line 954
;954:	else {
line 955
;955:		cg_pmove.tracemask = MASK_PLAYERSOLID;
ADDRGP4 cg_pmove+104
CNSTI4 33619969
ASGNI4
line 956
;956:	}
LABELV $715
line 957
;957:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $718
line 958
;958:		cg_pmove.tracemask &= ~CONTENTS_BODY;	// spectators can fly through bodies
ADDRLP4 780
ADDRGP4 cg_pmove+104
ASGNP4
ADDRLP4 780
INDIRP4
ADDRLP4 780
INDIRP4
INDIRI4
CNSTI4 -33554433
BANDI4
ASGNI4
line 959
;959:	}
LABELV $718
line 962
;960:
;961:	// save the state before the pmove so we can detect transitions
;962:	oldPlayerState = cg.predictedPlayerState;
ADDRLP4 8
ADDRGP4 cg+234796
INDIRB
ASGNB 560
line 964
;963:
;964:	current = trap_GetCurrentCmdNumber();
ADDRLP4 780
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 568
ADDRLP4 780
INDIRI4
ASGNI4
line 969
;965:
;966:	// if we don't have the commands right after the snapshot, we
;967:	// can't accurately predict a current position, so just freeze at
;968:	// the last good position we had
;969:	cmdNum = current - CMD_BACKUP + 1;
ADDRLP4 0
ADDRLP4 568
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 970
;970:	trap_GetUserCmd( cmdNum, &oldestCmd );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 680
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 971
;971:	if ( oldestCmd.serverTime > cg.snap->ps.commandTime
ADDRLP4 784
ADDRLP4 680
INDIRI4
ASGNI4
ADDRLP4 784
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LEI4 $723
ADDRLP4 784
INDIRI4
ADDRGP4 cg+234764
INDIRI4
GEI4 $723
line 972
;972:		&& oldestCmd.serverTime < cg.time ) {	// special check for map_restart
line 973
;973:		if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $727
line 974
;974:			CG_Printf ("exceeded PACKET_BACKUP on commands\n");
ADDRGP4 $730
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 975
;975:		}
LABELV $727
line 979
;976:
;977:		//We want to keep free look in VR during intermission
;978:#ifdef USE_VR
;979:		if ( !cg.vr_controller_type )
ADDRGP4 cg+282972
INDIRI4
CNSTI4 0
NEI4 $731
line 981
;980:#endif
;981:			return;
ADDRGP4 $693
JUMPV
LABELV $731
line 990
;982:
;983:/*#ifndef USE_VR
;984:#ifdef USE_VR_QVM
;985:		//if (!cg.snap->ps.vr_controller_type && cg.snap->ps.pm_type != PM_INTERMISSION ) {
;986:		if ( !cg.snap->ps.vr_controller_type )
;987:#endif // USE_VR_QVM
;988:			return;
;989:#endif // USE_VR*/
;990:	}
LABELV $723
line 993
;991:
;992:	// get the latest command so we can know which commands are from previous map_restarts
;993:	trap_GetUserCmd( current, &latestCmd );
ADDRLP4 568
INDIRI4
ARGI4
ADDRLP4 580
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 999
;994:
;995:	// get the most recent information we have, even if
;996:	// the server time is beyond our current cg.time,
;997:	// because predicted player positions are going to 
;998:	// be ahead of everything else anyway
;999:	if ( cg.nextSnap && !cg.nextFrameTeleport && !cg.thisFrameTeleport ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $734
ADDRGP4 cg+234756
INDIRI4
CNSTI4 0
NEI4 $734
ADDRGP4 cg+234752
INDIRI4
CNSTI4 0
NEI4 $734
line 1000
;1000:		cg.predictedPlayerState = cg.nextSnap->ps;
ADDRGP4 cg+234796
ADDRGP4 cg+40
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 560
line 1001
;1001:		cg.physicsTime = cg.nextSnap->serverTime;
ADDRGP4 cg+234772
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1002
;1002:	} else {
ADDRGP4 $735
JUMPV
LABELV $734
line 1003
;1003:		cg.predictedPlayerState = cg.snap->ps;
ADDRGP4 cg+234796
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 560
line 1004
;1004:		cg.physicsTime = cg.snap->serverTime;
ADDRGP4 cg+234772
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1005
;1005:	}
LABELV $735
line 1007
;1006:
;1007:	cg_pmove.pmove_fixed = cgs.pmove_fixed;
ADDRGP4 cg_pmove+284
ADDRGP4 cgs+151664
INDIRI4
ASGNI4
line 1008
;1008:	cg_pmove.pmove_msec = cgs.pmove_msec;
ADDRGP4 cg_pmove+288
ADDRGP4 cgs+151668
INDIRI4
ASGNI4
line 1011
;1009:
;1010:	// clean event stack
;1011:	eventStack = 0;
ADDRGP4 eventStack
CNSTI4 0
ASGNI4
line 1014
;1012:	
;1013:	// run cmds
;1014:	moved = qfalse;
ADDRLP4 572
CNSTI4 0
ASGNI4
line 1016
;1015:
;1016:	cg_pmove.pmove_fixed = cgs.pmove_fixed;
ADDRGP4 cg_pmove+284
ADDRGP4 cgs+151664
INDIRI4
ASGNI4
line 1017
;1017:	cg_pmove.pmove_msec = cgs.pmove_msec;
ADDRGP4 cg_pmove+288
ADDRGP4 cgs+151668
INDIRI4
ASGNI4
line 1037
;1018:
;1019:	// Like the comments described above, a player's state is entirely
;1020:	// re-predicted from the last valid snapshot every client frame, which
;1021:	// can be really, really, really slow.  Every old command has to be
;1022:	// run again.  For every client frame that is *not* directly after a
;1023:	// snapshot, this is unnecessary, since we have no new information.
;1024:	// For those, we'll play back the predictions from the last frame and
;1025:	// predict only the newest commands.  Essentially, we'll be doing
;1026:	// an incremental predict instead of a full predict.
;1027:	//
;1028:	// If we have a new snapshot, we can compare its player state's command
;1029:	// time to the command times in the queue to find a match.  If we find
;1030:	// a matching state, and the predicted version has not deviated, we can
;1031:	// use the predicted state as a base - and also do an incremental predict.
;1032:	//
;1033:	// With this method, we get incremental predicts on every client frame
;1034:	// except a frame following a new snapshot in which there was a prediction
;1035:	// error.  This yeilds anywhere from a 15% to 40% performance increase,
;1036:	// depending on how much of a bottleneck the CPU is.
;1037:	if( 1 /* cg_optimizePrediction.integer */ ) {
line 1038
;1038:		if( cg.nextFrameTeleport || cg.thisFrameTeleport ) {
ADDRGP4 cg+234756
INDIRI4
CNSTI4 0
NEI4 $761
ADDRGP4 cg+234752
INDIRI4
CNSTI4 0
EQI4 $757
LABELV $761
line 1040
;1039:			// do a full predict
;1040:			cg.lastPredictedCommand = 0;
ADDRGP4 cg+245952
CNSTI4 0
ASGNI4
line 1041
;1041:			cg.stateTail = cg.stateHead;
ADDRGP4 cg+282924
ADDRGP4 cg+282920
INDIRI4
ASGNI4
line 1042
;1042:			predictCmd = current - CMD_BACKUP + 1;
ADDRLP4 576
ADDRLP4 568
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 1043
;1043:		}
ADDRGP4 $758
JUMPV
LABELV $757
line 1046
;1044:		// cg.physicsTime is the current snapshot's serverTime if it's the same
;1045:		// as the last one
;1046:		else if( cg.physicsTime == cg.lastServerTime ) {
ADDRGP4 cg+234772
INDIRI4
ADDRGP4 cg+245956
INDIRI4
NEI4 $765
line 1048
;1047:			// we have no new information, so do an incremental predict
;1048:			predictCmd = cg.lastPredictedCommand + 1;
ADDRLP4 576
ADDRGP4 cg+245952
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1049
;1049:		} else {
ADDRGP4 $766
JUMPV
LABELV $765
line 1053
;1050:			// we have a new snapshot
;1051:			int i;
;1052:			int errorcode;
;1053:			qboolean error = qtrue;
ADDRLP4 796
CNSTI4 1
ASGNI4
line 1056
;1054:
;1055:			// loop through the saved states queue
;1056:			for( i = cg.stateHead; i != cg.stateTail; i = ( i + 1 ) % NUM_SAVED_STATES ) {
ADDRLP4 788
ADDRGP4 cg+282920
INDIRI4
ASGNI4
ADDRGP4 $773
JUMPV
LABELV $770
line 1059
;1057:				// if we find a predicted state whose commandTime matches the snapshot
;1058:				// player state's commandTime
;1059:				if( cg.savedPmoveStates[ i ].commandTime != cg.predictedPlayerState.commandTime ) {
ADDRLP4 788
INDIRI4
CNSTI4 560
MULI4
ADDRGP4 cg+245960
ADDP4
INDIRI4
ADDRGP4 cg+234796
INDIRI4
EQI4 $776
line 1060
;1060:					continue;
ADDRGP4 $771
JUMPV
LABELV $776
line 1063
;1061:				}
;1062:				// make sure the state differences are acceptable
;1063:				errorcode = CG_IsUnacceptableError( &cg.predictedPlayerState, &cg.savedPmoveStates[ i ], &moved );
ADDRGP4 cg+234796
ARGP4
ADDRLP4 788
INDIRI4
CNSTI4 560
MULI4
ADDRGP4 cg+245960
ADDP4
ARGP4
ADDRLP4 572
ARGP4
ADDRLP4 800
ADDRGP4 CG_IsUnacceptableError
CALLI4
ASGNI4
ADDRLP4 792
ADDRLP4 800
INDIRI4
ASGNI4
line 1064
;1064:				if ( errorcode ) {
ADDRLP4 792
INDIRI4
CNSTI4 0
EQI4 $782
line 1065
;1065:					if( cg_showmiss.integer > 1 )
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $772
line 1066
;1066:						CG_Printf( "errorcode %d at %d\n", errorcode, cg.time );
ADDRGP4 $787
ARGP4
ADDRLP4 792
INDIRI4
ARGI4
ADDRGP4 cg+234764
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1067
;1067:					break;
ADDRGP4 $772
JUMPV
LABELV $782
line 1071
;1068:				}
;1069:  
;1070:				// this one is almost exact, so we'll copy it in as the starting point
;1071:				*cg_pmove.ps = cg.savedPmoveStates[ i ];
ADDRGP4 cg_pmove
INDIRP4
ADDRLP4 788
INDIRI4
CNSTI4 560
MULI4
ADDRGP4 cg+245960
ADDP4
INDIRB
ASGNB 560
line 1073
;1072:				// advance the head
;1073:				cg.stateHead = ( i + 1 ) % NUM_SAVED_STATES;
ADDRGP4 cg+282920
ADDRLP4 788
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 66
MODI4
ASGNI4
line 1076
;1074:  
;1075:				// set the next command to predict
;1076:				predictCmd = cg.lastPredictedCommand + 1;
ADDRLP4 576
ADDRGP4 cg+245952
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1079
;1077:  
;1078:				// a saved state matched, so flag it
;1079:				error = qfalse;
ADDRLP4 796
CNSTI4 0
ASGNI4
line 1080
;1080:				break;
ADDRGP4 $772
JUMPV
LABELV $771
line 1056
ADDRLP4 788
ADDRLP4 788
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 66
MODI4
ASGNI4
LABELV $773
ADDRLP4 788
INDIRI4
ADDRGP4 cg+282924
INDIRI4
NEI4 $770
LABELV $772
line 1084
;1081:			}
;1082:
;1083:			// if no saved states matched
;1084:			if ( error ) {
ADDRLP4 796
INDIRI4
CNSTI4 0
EQI4 $792
line 1086
;1085:				// do a full predict
;1086:				cg.lastPredictedCommand = 0;
ADDRGP4 cg+245952
CNSTI4 0
ASGNI4
line 1087
;1087:				cg.stateTail = cg.stateHead;
ADDRGP4 cg+282924
ADDRGP4 cg+282920
INDIRI4
ASGNI4
line 1088
;1088:				predictCmd = current - CMD_BACKUP + 1;
ADDRLP4 576
ADDRLP4 568
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 1089
;1089:			}
LABELV $792
line 1090
;1090:		}
LABELV $766
LABELV $758
line 1093
;1091:		// keep track of the server time of the last snapshot so we
;1092:		// know when we're starting from a new one in future calls
;1093:		cg.lastServerTime = cg.physicsTime;
ADDRGP4 cg+245956
ADDRGP4 cg+234772
INDIRI4
ASGNI4
line 1094
;1094:		stateIndex = cg.stateHead;
ADDRLP4 4
ADDRGP4 cg+282920
INDIRI4
ASGNI4
line 1095
;1095:	}
LABELV $755
line 1097
;1096:
;1097:	cmdNum = current - CMD_BACKUP + 1;
ADDRLP4 0
ADDRLP4 568
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 1098
;1098:	if ( cmdNum < 0 ) // can happen on first spawn
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $805
line 1099
;1099:		cmdNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1104
;1100:
;1101:	// run cmds
;1102:	// moved = qfalse;
;1103:
;1104:	for ( /* cmdNum = current - CMD_BACKUP + 1 */; cmdNum <= current ; cmdNum++ ) {
ADDRGP4 $805
JUMPV
LABELV $802
line 1106
;1105:		// get the command
;1106:		trap_GetUserCmd( cmdNum, &cg_pmove.cmd );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cg_pmove+4
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 1108
;1107:
;1108:		if ( cgs.pmove_fixed ) {
ADDRGP4 cgs+151664
INDIRI4
CNSTI4 0
EQI4 $807
line 1109
;1109:			PM_UpdateViewAngles( cg_pmove.ps, &cg_pmove.cmd );
ADDRGP4 cg_pmove
INDIRP4
ARGP4
ADDRGP4 cg_pmove+4
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 1110
;1110:		}
LABELV $807
line 1113
;1111:
;1112:		// don't do anything if the time is before the snapshot player time
;1113:		if ( cg_pmove.cmd.serverTime <= cg.predictedPlayerState.commandTime ) {
ADDRGP4 cg_pmove+4
INDIRI4
ADDRGP4 cg+234796
INDIRI4
GTI4 $811
line 1114
;1114:			continue;
ADDRGP4 $803
JUMPV
LABELV $811
line 1118
;1115:		}
;1116:
;1117:		// don't do anything if the command was from a previous map_restart
;1118:		if ( cg_pmove.cmd.serverTime > latestCmd.serverTime ) {
ADDRGP4 cg_pmove+4
INDIRI4
ADDRLP4 580
INDIRI4
LEI4 $815
line 1119
;1119:			continue;
ADDRGP4 $803
JUMPV
LABELV $815
line 1127
;1120:		}
;1121:
;1122:		// check for a prediction error from last frame
;1123:		// on a lan, this will often be the exact value
;1124:		// from the snapshot, but on a wan we will have
;1125:		// to predict several commands to get to the point
;1126:		// we want to compare
;1127:		if ( cg.predictedPlayerState.commandTime == oldPlayerState.commandTime ) {
ADDRGP4 cg+234796
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $818
line 1131
;1128:			vec3_t	delta;
;1129:			float	len;
;1130:
;1131:			if ( cg.thisFrameTeleport ) {
ADDRGP4 cg+234752
INDIRI4
CNSTI4 0
EQI4 $821
line 1133
;1132:				// a teleport will not cause an error decay
;1133:				VectorClear( cg.predictedError );
ADDRGP4 cg+236600
CNSTF4 0
ASGNF4
ADDRGP4 cg+236600+4
CNSTF4 0
ASGNF4
ADDRGP4 cg+236600+8
CNSTF4 0
ASGNF4
line 1134
;1134:				if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $829
line 1135
;1135:					CG_Printf( "PredictionTeleport\n" );
ADDRGP4 $832
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1136
;1136:				}
LABELV $829
line 1137
;1137:				cg.thisFrameTeleport = qfalse;
ADDRGP4 cg+234752
CNSTI4 0
ASGNI4
line 1140
;1138:
;1139:				// delay prediction for some time or until first server event
;1140:				cg.allowPickupPrediction = cg.time + PICKUP_PREDICTION_DELAY;
ADDRGP4 cg+282936
ADDRGP4 cg+234764
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1141
;1141:			} else {
ADDRGP4 $822
JUMPV
LABELV $821
line 1143
;1142:				vec3_t adjusted, new_angles;
;1143:				CG_AdjustPositionForMover( cg.predictedPlayerState.origin, 
ADDRGP4 cg+234796+20
ARGP4
ADDRGP4 cg+234796+68
INDIRI4
ARGI4
ADDRGP4 cg+234772
INDIRI4
ARGI4
ADDRGP4 cg+234768
INDIRI4
ARGI4
ADDRLP4 804
ARGP4
ADDRGP4 cg+234796+152
ARGP4
ADDRLP4 816
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
line 1146
;1144:					cg.predictedPlayerState.groundEntityNum, cg.physicsTime, cg.oldTime, adjusted, cg.predictedPlayerState.viewangles, new_angles);
;1145:
;1146:				if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $844
line 1147
;1147:					if ( !VectorCompare( oldPlayerState.origin, adjusted ) ) {
ADDRLP4 8+20
ARGP4
ADDRLP4 804
ARGP4
ADDRLP4 828
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 828
INDIRI4
CNSTI4 0
NEI4 $847
line 1148
;1148:						CG_Printf( "prediction error\n" );
ADDRGP4 $850
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1149
;1149:					}
LABELV $847
line 1150
;1150:				}
LABELV $844
line 1151
;1151:				VectorSubtract( oldPlayerState.origin, adjusted, delta );
ADDRLP4 788
ADDRLP4 8+20
INDIRF4
ADDRLP4 804
INDIRF4
SUBF4
ASGNF4
ADDRLP4 788+4
ADDRLP4 8+20+4
INDIRF4
ADDRLP4 804+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 788+8
ADDRLP4 8+20+8
INDIRF4
ADDRLP4 804+8
INDIRF4
SUBF4
ASGNF4
line 1152
;1152:				len = VectorLengthSquared( delta );
ADDRLP4 788
ARGP4
ADDRLP4 828
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 800
ADDRLP4 828
INDIRF4
ASGNF4
line 1153
;1153:				if ( len > (0.01f * 0.01f) ) {
ADDRLP4 800
INDIRF4
CNSTF4 953267991
LEF4 $860
line 1154
;1154:					if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $862
line 1155
;1155:						CG_Printf( "Prediction miss: %f\n", sqrt( len ) );
ADDRLP4 800
INDIRF4
ARGF4
ADDRLP4 832
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRGP4 $865
ARGP4
ADDRLP4 832
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 1156
;1156:					}
LABELV $862
line 1157
;1157:					if ( cg_errorDecay.integer ) {
ADDRGP4 cg_errorDecay+12
INDIRI4
CNSTI4 0
EQI4 $866
line 1161
;1158:						int		t;
;1159:						float	f;
;1160:
;1161:						t = cg.time - cg.predictedErrorTime;
ADDRLP4 836
ADDRGP4 cg+234764
INDIRI4
ADDRGP4 cg+236596
INDIRI4
SUBI4
ASGNI4
line 1162
;1162:						f = ( cg_errorDecay.value - t ) / cg_errorDecay.value;
ADDRLP4 832
ADDRGP4 cg_errorDecay+8
INDIRF4
ADDRLP4 836
INDIRI4
CVIF4 4
SUBF4
ADDRGP4 cg_errorDecay+8
INDIRF4
DIVF4
ASGNF4
line 1163
;1163:						if ( f < 0 ) {
ADDRLP4 832
INDIRF4
CNSTF4 0
GEF4 $873
line 1164
;1164:							f = 0;
ADDRLP4 832
CNSTF4 0
ASGNF4
line 1165
;1165:						} else
ADDRGP4 $874
JUMPV
LABELV $873
line 1166
;1166:						if ( f > 0 && cg_showmiss.integer ) {
ADDRLP4 832
INDIRF4
CNSTF4 0
LEF4 $875
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $875
line 1167
;1167:							CG_Printf("Double prediction decay: %f\n", f);
ADDRGP4 $878
ARGP4
ADDRLP4 832
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 1168
;1168:						}
LABELV $875
LABELV $874
line 1169
;1169:						VectorScale( cg.predictedError, f, cg.predictedError );
ADDRGP4 cg+236600
ADDRGP4 cg+236600
INDIRF4
ADDRLP4 832
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+236600+4
ADDRGP4 cg+236600+4
INDIRF4
ADDRLP4 832
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+236600+8
ADDRGP4 cg+236600+8
INDIRF4
ADDRLP4 832
INDIRF4
MULF4
ASGNF4
line 1170
;1170:					} else {
ADDRGP4 $867
JUMPV
LABELV $866
line 1171
;1171:						VectorClear( cg.predictedError );
ADDRGP4 cg+236600
CNSTF4 0
ASGNF4
ADDRGP4 cg+236600+4
CNSTF4 0
ASGNF4
ADDRGP4 cg+236600+8
CNSTF4 0
ASGNF4
line 1172
;1172:					}
LABELV $867
line 1173
;1173:					VectorAdd( delta, cg.predictedError, cg.predictedError );
ADDRGP4 cg+236600
ADDRLP4 788
INDIRF4
ADDRGP4 cg+236600
INDIRF4
ADDF4
ASGNF4
ADDRGP4 cg+236600+4
ADDRLP4 788+4
INDIRF4
ADDRGP4 cg+236600+4
INDIRF4
ADDF4
ASGNF4
ADDRGP4 cg+236600+8
ADDRLP4 788+8
INDIRF4
ADDRGP4 cg+236600+8
INDIRF4
ADDF4
ASGNF4
line 1174
;1174:					cg.predictedErrorTime = cg.oldTime;
ADDRGP4 cg+236596
ADDRGP4 cg+234768
INDIRI4
ASGNI4
line 1175
;1175:				}
LABELV $860
line 1176
;1176:			}
LABELV $822
line 1177
;1177:		}
LABELV $818
line 1181
;1178:
;1179:		// don't predict gauntlet firing, which is only supposed to happen
;1180:		// when it actually inflicts damage
;1181:		cg_pmove.gauntletHit = qfalse;
ADDRGP4 cg_pmove+112
CNSTI4 0
ASGNI4
line 1183
;1182:
;1183:		if ( cg_pmove.pmove_fixed ) {
ADDRGP4 cg_pmove+284
INDIRI4
CNSTI4 0
EQI4 $909
line 1184
;1184:			cg_pmove.cmd.serverTime = ((cg_pmove.cmd.serverTime + cg_pmove.pmove_msec-1) / cg_pmove.pmove_msec) * cg_pmove.pmove_msec;
ADDRGP4 cg_pmove+4
ADDRGP4 cg_pmove+4
INDIRI4
ADDRGP4 cg_pmove+288
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRGP4 cg_pmove+288
INDIRI4
DIVI4
ADDRGP4 cg_pmove+288
INDIRI4
MULI4
ASGNI4
line 1185
;1185:		}
LABELV $909
line 1191
;1186:#if 0
;1187:		if ( !cg_optimizePrediction.integer ) {
;1188:			Pmove (&cg_pmove);
;1189:		} else 
;1190:#endif
;1191:		if ( /*cg_optimizePrediction.integer && */ ( cmdNum >= predictCmd || ( stateIndex + 1 ) % NUM_SAVED_STATES == cg.stateHead ) ) {
ADDRLP4 0
INDIRI4
ADDRLP4 576
INDIRI4
GEI4 $920
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 66
MODI4
ADDRGP4 cg+282920
INDIRI4
NEI4 $917
LABELV $920
line 1193
;1192:
;1193:			Pmove( &cg_pmove );
ADDRGP4 cg_pmove
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 1196
;1194:
;1195:			// add push trigger movement effects
;1196:			CG_TouchTriggerPrediction();
ADDRGP4 CG_TouchTriggerPrediction
CALLV
pop
line 1199
;1197:
;1198:			// check for expired powerups etc.
;1199:			CG_CheckTimers();
ADDRGP4 CG_CheckTimers
CALLV
pop
line 1202
;1200:
;1201:			// record the last predicted command
;1202:			cg.lastPredictedCommand = cmdNum;
ADDRGP4 cg+245952
ADDRLP4 0
INDIRI4
ASGNI4
line 1205
;1203: 
;1204:			// if we haven't run out of space in the saved states queue
;1205:			if( ( stateIndex + 1 ) % NUM_SAVED_STATES != cg.stateHead ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 66
MODI4
ADDRGP4 cg+282920
INDIRI4
EQI4 $918
line 1208
;1206:				// save the state for the false case ( of cmdNum >= predictCmd )
;1207:				// in later calls to this function
;1208:				cg.savedPmoveStates[ stateIndex ] = *cg_pmove.ps;
ADDRLP4 4
INDIRI4
CNSTI4 560
MULI4
ADDRGP4 cg+245960
ADDP4
ADDRGP4 cg_pmove
INDIRP4
INDIRB
ASGNB 560
line 1209
;1209:				stateIndex = ( stateIndex + 1 ) % NUM_SAVED_STATES;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 66
MODI4
ASGNI4
line 1210
;1210:				cg.stateTail = stateIndex;
ADDRGP4 cg+282924
ADDRLP4 4
INDIRI4
ASGNI4
line 1211
;1211:			}
line 1212
;1212:		} else {
ADDRGP4 $918
JUMPV
LABELV $917
line 1213
;1213:			*cg_pmove.ps = cg.savedPmoveStates[ stateIndex ];
ADDRGP4 cg_pmove
INDIRP4
ADDRLP4 4
INDIRI4
CNSTI4 560
MULI4
ADDRGP4 cg+245960
ADDP4
INDIRB
ASGNB 560
line 1214
;1214:			stateIndex = ( stateIndex + 1 ) % NUM_SAVED_STATES;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 66
MODI4
ASGNI4
line 1215
;1215:		}
LABELV $918
line 1217
;1216:
;1217:		moved = qtrue;
ADDRLP4 572
CNSTI4 1
ASGNI4
line 1218
;1218:	}
LABELV $803
line 1104
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $805
ADDRLP4 0
INDIRI4
ADDRLP4 568
INDIRI4
LEI4 $802
line 1220
;1219:
;1220:	if ( cg_showmiss.integer > 3 ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 3
LEI4 $928
line 1221
;1221:		CG_Printf( "[%i : %i] ", cg_pmove.cmd.serverTime, cg.time );
ADDRGP4 $931
ARGP4
ADDRGP4 cg_pmove+4
INDIRI4
ARGI4
ADDRGP4 cg+234764
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1222
;1222:	}
LABELV $928
line 1224
;1223:
;1224:	if ( !moved ) {
ADDRLP4 572
INDIRI4
CNSTI4 0
NEI4 $934
line 1225
;1225:		if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $936
line 1226
;1226:			CG_Printf( "not moved\n" );
ADDRGP4 $939
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1227
;1227:		}
LABELV $936
line 1229
;1228:		// clean event stack
;1229:		eventStack = 0;
ADDRGP4 eventStack
CNSTI4 0
ASGNI4
line 1230
;1230:		return;
ADDRGP4 $693
JUMPV
LABELV $934
line 1234
;1231:	}
;1232:
;1233:	// adjust for the movement of the groundentity
;1234:	CG_AdjustPositionForMover( cg.predictedPlayerState.origin, cg.predictedPlayerState.groundEntityNum, 
ADDRGP4 cg+234796+20
ARGP4
ADDRGP4 cg+234796+68
INDIRI4
ARGI4
ADDRGP4 cg+234772
INDIRI4
ARGI4
ADDRGP4 cg+234764
INDIRI4
ARGI4
ADDRGP4 cg+234796+20
ARGP4
ADDRGP4 cg+234796+152
ARGP4
ADDRGP4 cg+234796+152
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
line 1238
;1235:		cg.physicsTime, cg.time, cg.predictedPlayerState.origin, 
;1236:		cg.predictedPlayerState.viewangles, cg.predictedPlayerState.viewangles );
;1237:
;1238:	if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $952
line 1239
;1239:		if ( cg.predictedPlayerState.eventSequence > oldPlayerState.eventSequence + MAX_PS_EVENTS ) {
ADDRGP4 cg+234796+108
INDIRI4
ADDRLP4 8+108
INDIRI4
CNSTI4 2
ADDI4
LEI4 $955
line 1240
;1240:			CG_Printf( "WARNING: dropped event\n" );
ADDRGP4 $960
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1241
;1241:		}
LABELV $955
line 1242
;1242:	}
LABELV $952
line 1245
;1243:
;1244:	// fire events and other transition triggered things
;1245:	CG_TransitionPlayerState( &cg.predictedPlayerState, &oldPlayerState );
ADDRGP4 cg+234796
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_TransitionPlayerState
CALLV
pop
line 1247
;1246:
;1247:	if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $962
line 1248
;1248:		if ( cg.eventSequence > cg.predictedPlayerState.eventSequence ) {
ADDRGP4 cg+236612
INDIRI4
ADDRGP4 cg+234796+108
INDIRI4
LEI4 $965
line 1249
;1249:			CG_Printf( "WARNING: double event\n" );
ADDRGP4 $970
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1250
;1250:			cg.eventSequence = cg.predictedPlayerState.eventSequence;
ADDRGP4 cg+236612
ADDRGP4 cg+234796+108
INDIRI4
ASGNI4
line 1251
;1251:		}
LABELV $965
line 1252
;1252:	}
LABELV $962
line 1253
;1253:}
LABELV $693
endproc CG_PredictPlayerState 840 28
bss
export eventParm2
align 4
LABELV eventParm2
skip 64
export eventParms
align 4
LABELV eventParms
skip 64
export events
align 4
LABELV events
skip 64
export eventStack
align 4
LABELV eventStack
skip 4
align 4
LABELV cg_triggerEntities
skip 1024
align 4
LABELV cg_numTriggerEntities
skip 4
align 4
LABELV cg_solidEntities
skip 1024
align 4
LABELV cg_numSolidEntities
skip 4
align 4
LABELV cg_pmove
skip 300
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
import CG_LoadDeferredPlayers
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
LABELV $970
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $960
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $939
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $931
byte 1 91
byte 1 37
byte 1 105
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 0
align 1
LABELV $878
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 97
byte 1 121
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $865
byte 1 80
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $850
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $832
byte 1 80
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $787
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 99
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $730
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 80
byte 1 65
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 95
byte 1 66
byte 1 65
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $692
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $679
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $663
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $651
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $614
byte 1 100
byte 1 109
byte 1 103
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $591
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 109
byte 1 115
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $585
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $573
byte 1 101
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $537
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $525
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 99
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 116
byte 1 97
byte 1 58
byte 1 32
byte 1 37
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $517
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 116
byte 1 97
byte 1 58
byte 1 32
byte 1 37
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $280
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 109
byte 1 101
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $279
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $190
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 0
