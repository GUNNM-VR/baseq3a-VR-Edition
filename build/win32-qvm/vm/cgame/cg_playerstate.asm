export CG_CheckAmmo
code
proc CG_CheckAmmo 20 8
file "..\..\..\..\code\cgame\cg_playerstate.c"
line 17
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_playerstate.c -- this file acts on changes in a new playerState_t
;4:// With normal play, this will be done after local prediction, but when
;5:// following another player or playing back a demo, it will be checked
;6:// when the snapshot transitions like all the other entities
;7:
;8:#include "cg_local.h"
;9:
;10:/*
;11:==============
;12:CG_CheckAmmo
;13:
;14:If the ammo has gone low enough to generate the warning, play a sound
;15:==============
;16:*/
;17:void CG_CheckAmmo( void ) {
line 24
;18:	int		i;
;19:	int		total;
;20:	int		previous;
;21:	int		weapons;
;22:
;23:	// see about how many seconds of ammo we have remaining
;24:	weapons = cg.snap->ps.stats[ STAT_WEAPONS ];
ADDRLP4 8
ADDRGP4 cg+36
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 25
;25:	total = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 26
;26:	for ( i = WP_MACHINEGUN ; i < WP_NUM_WEAPONS ; i++ ) {
ADDRLP4 0
CNSTI4 2
ASGNI4
LABELV $89
line 27
;27:		if ( ! ( weapons & ( 1 << i ) ) ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $93
line 28
;28:			continue;
ADDRGP4 $90
JUMPV
LABELV $93
line 30
;29:		}
;30:		switch ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $95
ADDRLP4 0
INDIRI4
CNSTI4 7
GTI4 $95
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $100-12
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $100
address $97
address $97
address $97
address $95
address $97
code
LABELV $97
line 38
;31:		case WP_ROCKET_LAUNCHER:
;32:		case WP_GRENADE_LAUNCHER:
;33:		case WP_RAILGUN:
;34:		case WP_SHOTGUN:
;35:#ifdef MISSIONPACK
;36:		case WP_PROX_LAUNCHER:
;37:#endif
;38:			total += cg.snap->ps.ammo[i] * 1000;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 420
ADDP4
ADDP4
INDIRI4
CNSTI4 1000
MULI4
ADDI4
ASGNI4
line 39
;39:			break;
ADDRGP4 $96
JUMPV
LABELV $95
line 41
;40:		default:
;41:			total += cg.snap->ps.ammo[i] * 200;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 420
ADDP4
ADDP4
INDIRI4
CNSTI4 200
MULI4
ADDI4
ASGNI4
line 42
;42:			break;
LABELV $96
line 44
;43:		}
;44:		if ( total >= 5000 ) {
ADDRLP4 4
INDIRI4
CNSTI4 5000
LTI4 $102
line 45
;45:			cg.lowAmmoWarning = 0;
ADDRGP4 cg+245304
CNSTI4 0
ASGNI4
line 46
;46:			return;
ADDRGP4 $87
JUMPV
LABELV $102
line 48
;47:		}
;48:	}
LABELV $90
line 26
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $89
line 50
;49:
;50:	previous = cg.lowAmmoWarning;
ADDRLP4 12
ADDRGP4 cg+245304
INDIRI4
ASGNI4
line 52
;51:
;52:	if ( total == 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $106
line 53
;53:		cg.lowAmmoWarning = 2;
ADDRGP4 cg+245304
CNSTI4 2
ASGNI4
line 54
;54:	} else {
ADDRGP4 $107
JUMPV
LABELV $106
line 55
;55:		cg.lowAmmoWarning = 1;
ADDRGP4 cg+245304
CNSTI4 1
ASGNI4
line 56
;56:	}
LABELV $107
line 59
;57:
;58:	// play a sound on transitions
;59:	if ( cg.lowAmmoWarning != previous ) {
ADDRGP4 cg+245304
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $110
line 60
;60:		trap_S_StartLocalSound( cgs.media.noAmmoSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+150560+780
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 61
;61:	}
LABELV $110
line 62
;62:}
LABELV $87
endproc CG_CheckAmmo 20 8
export CG_DamageFeedback
proc CG_DamageFeedback 80 16
line 70
;63:
;64:
;65:/*
;66:==============
;67:CG_DamageFeedback
;68:==============
;69:*/
;70:void CG_DamageFeedback( int yawByte, int pitchByte, int damage ) {
line 79
;71:	float		left, front, up;
;72:	float		kick;
;73:	int			health;
;74:	int			attacker;
;75:	float		scale;
;76:	vec3_t		dir;
;77:	vec3_t		angles;
;78:	float		dist;
;79:	float		yaw = 0.0f, pitch = 0.0f;
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 52
CNSTF4 0
ASGNF4
line 86
;80:	const char	*info;
;81:
;82:	// show the attacking player's head and name in corner
;83:	// but only if client is valid
;84:
;85:	//attacker = cg.predictedPlayerState.persistant[PERS_ATTACKER]; ?
;86:	attacker = cg.snap->ps.persistant[PERS_ATTACKER]; 
ADDRLP4 16
ADDRGP4 cg+36
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
ASGNI4
line 88
;87:
;88:	if ( (unsigned)attacker < MAX_CLIENTS && attacker != cg.snap->ps.clientNum ) {
ADDRLP4 16
INDIRI4
CVIU4 4
CNSTU4 64
GEU4 $117
ADDRLP4 16
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $117
line 90
;89:		// dont do it when cg_draw2d = 0 ?
;90:		info = CG_ConfigString( CS_PLAYERS + attacker );
ADDRLP4 16
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 72
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 72
INDIRP4
ASGNP4
line 91
;91:		if ( *info ) {
ADDRLP4 60
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $120
line 92
;92:			BG_CleanName( Info_ValueForKey( info, "n" ), cg.attackerName, sizeof( cg.attackerName ), "???" );
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 $122
ARGP4
ADDRLP4 76
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 cg+245328
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $125
ARGP4
ADDRGP4 BG_CleanName
CALLV
pop
line 93
;93:			cg.attackerClientNum = attacker;
ADDRGP4 cg+245360
ADDRLP4 16
INDIRI4
ASGNI4
line 94
;94:			cg.attackerTime = cg.time;
ADDRGP4 cg+245364
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 95
;95:		}
LABELV $120
line 96
;96:	}
LABELV $117
line 99
;97:
;98:	// the lower on health you are, the greater the view kick will be
;99:	health = cg.snap->ps.stats[STAT_HEALTH];
ADDRLP4 24
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ASGNI4
line 100
;100:	if ( health < 40 ) {
ADDRLP4 24
INDIRI4
CNSTI4 40
GEI4 $130
line 101
;101:		scale = 1;
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
line 102
;102:	} else {
ADDRGP4 $131
JUMPV
LABELV $130
line 103
;103:		scale = 40.0 / health;
ADDRLP4 32
CNSTF4 1109393408
ADDRLP4 24
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 104
;104:	}
LABELV $131
line 105
;105:	kick = damage * scale;
ADDRLP4 12
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRF4
MULF4
ASGNF4
line 107
;106:
;107:	if (kick < 5)
ADDRLP4 12
INDIRF4
CNSTF4 1084227584
GEF4 $132
line 108
;108:		kick = 5;
ADDRLP4 12
CNSTF4 1084227584
ASGNF4
LABELV $132
line 109
;109:	if (kick > 10)
ADDRLP4 12
INDIRF4
CNSTF4 1092616192
LEF4 $134
line 110
;110:		kick = 10;
ADDRLP4 12
CNSTF4 1092616192
ASGNF4
LABELV $134
line 113
;111:
;112:	// if yaw and pitch are both 255, make the damage always centered (falling, etc)
;113:	if ( yawByte == 255 && pitchByte == 255 ) {
ADDRFP4 0
INDIRI4
CNSTI4 255
NEI4 $136
ADDRFP4 4
INDIRI4
CNSTI4 255
NEI4 $136
line 114
;114:		cg.damageX = 0;
ADDRGP4 cg+245652
CNSTF4 0
ASGNF4
line 115
;115:		cg.damageY = 0;
ADDRGP4 cg+245656
CNSTF4 0
ASGNF4
line 116
;116:		cg.v_dmg_roll = 0;
ADDRGP4 cg+245700
CNSTF4 0
ASGNF4
line 117
;117:		cg.v_dmg_pitch = -kick;
ADDRGP4 cg+245696
ADDRLP4 12
INDIRF4
NEGF4
ASGNF4
line 118
;118:	} else {
ADDRGP4 $137
JUMPV
LABELV $136
line 120
;119:		// positional
;120:		pitch = pitchByte / 255.0 * 360;
ADDRLP4 52
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1068807349
MULF4
ASGNF4
line 121
;121:		yaw = yawByte / 255.0 * 360;
ADDRLP4 48
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1068807349
MULF4
ASGNF4
line 123
;122:
;123:		angles[PITCH] = pitch;
ADDRLP4 36
ADDRLP4 52
INDIRF4
ASGNF4
line 124
;124:		angles[YAW] = yaw;
ADDRLP4 36+4
ADDRLP4 48
INDIRF4
ASGNF4
line 125
;125:		angles[ROLL] = 0;
ADDRLP4 36+8
CNSTF4 0
ASGNF4
line 127
;126:
;127:		AngleVectors( angles, dir, NULL, NULL );
ADDRLP4 36
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 128
;128:		VectorSubtract( vec3_origin, dir, dir );
ADDRLP4 0
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 vec3_origin+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 130
;129:
;130:		front = DotProduct (dir, cg.refdef.viewaxis[0] );
ADDRLP4 20
ADDRLP4 0
INDIRF4
ADDRGP4 cg+236804+36
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+236804+36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+236804+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 131
;131:		left = DotProduct (dir, cg.refdef.viewaxis[1] );
ADDRLP4 28
ADDRLP4 0
INDIRF4
ADDRGP4 cg+236804+36+12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+236804+36+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+236804+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 132
;132:		up = DotProduct (dir, cg.refdef.viewaxis[2] );
ADDRLP4 64
ADDRLP4 0
INDIRF4
ADDRGP4 cg+236804+36+24
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+236804+36+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+236804+36+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 134
;133:
;134:		dir[0] = front;
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 135
;135:		dir[1] = left;
ADDRLP4 0+4
ADDRLP4 28
INDIRF4
ASGNF4
line 136
;136:		dir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 137
;137:		dist = VectorLength( dir );
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 72
INDIRF4
ASGNF4
line 138
;138:		if ( dist < 0.1 ) {
ADDRLP4 56
INDIRF4
CNSTF4 1036831949
GEF4 $188
line 139
;139:			dist = 0.1f;
ADDRLP4 56
CNSTF4 1036831949
ASGNF4
line 140
;140:		}
LABELV $188
line 142
;141:
;142:		cg.v_dmg_roll = kick * left;
ADDRGP4 cg+245700
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 144
;143:		
;144:		cg.v_dmg_pitch = -kick * front;
ADDRGP4 cg+245696
ADDRLP4 12
INDIRF4
NEGF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 146
;145:
;146:		if ( front <= 0.1 ) {
ADDRLP4 20
INDIRF4
CNSTF4 1036831949
GTF4 $192
line 147
;147:			front = 0.1f;
ADDRLP4 20
CNSTF4 1036831949
ASGNF4
line 148
;148:		}
LABELV $192
line 149
;149:		cg.damageX = -left / front;
ADDRGP4 cg+245652
ADDRLP4 28
INDIRF4
NEGF4
ADDRLP4 20
INDIRF4
DIVF4
ASGNF4
line 150
;150:		cg.damageY = up / dist;
ADDRGP4 cg+245656
ADDRLP4 64
INDIRF4
ADDRLP4 56
INDIRF4
DIVF4
ASGNF4
line 151
;151:	}
LABELV $137
line 154
;152:
;153:	// clamp the position
;154:	if ( cg.damageX > 1.0 ) {
ADDRGP4 cg+245652
INDIRF4
CNSTF4 1065353216
LEF4 $196
line 155
;155:		cg.damageX = 1.0;
ADDRGP4 cg+245652
CNSTF4 1065353216
ASGNF4
line 156
;156:	}
LABELV $196
line 157
;157:	if ( cg.damageX < - 1.0 ) {
ADDRGP4 cg+245652
INDIRF4
CNSTF4 3212836864
GEF4 $200
line 158
;158:		cg.damageX = -1.0;
ADDRGP4 cg+245652
CNSTF4 3212836864
ASGNF4
line 159
;159:	}
LABELV $200
line 161
;160:
;161:	if ( cg.damageY > 1.0 ) {
ADDRGP4 cg+245656
INDIRF4
CNSTF4 1065353216
LEF4 $204
line 162
;162:		cg.damageY = 1.0;
ADDRGP4 cg+245656
CNSTF4 1065353216
ASGNF4
line 163
;163:	}
LABELV $204
line 164
;164:	if ( cg.damageY < - 1.0 ) {
ADDRGP4 cg+245656
INDIRF4
CNSTF4 3212836864
GEF4 $208
line 165
;165:		cg.damageY = -1.0;
ADDRGP4 cg+245656
CNSTF4 3212836864
ASGNF4
line 166
;166:	}
LABELV $208
line 176
;167:
;168:#ifdef USE_HAPTIC
;169:	if (damage > 30)
;170:		trap_HapticEvent("shotgun", 0, 0, 100, yaw, 0);
;171:	else
;172:		trap_HapticEvent("bullet", 0, 0, 100, yaw, 0);
;173:#endif
;174:
;175:	// don't let the screen flashes vary as much
;176:	if ( kick > 10 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1092616192
LEF4 $212
line 177
;177:		kick = 10;
ADDRLP4 12
CNSTF4 1092616192
ASGNF4
line 178
;178:	}
LABELV $212
line 179
;179:	cg.damageValue = kick;
ADDRGP4 cg+245660
ADDRLP4 12
INDIRF4
ASGNF4
line 180
;180:	cg.v_dmg_time = cg.time + DAMAGE_TIME;
ADDRGP4 cg+245692
ADDRGP4 cg+234764
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 181
;181:	cg.damageTime = cg.snap->serverTime;
ADDRGP4 cg+245648
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 182
;182:}
LABELV $115
endproc CG_DamageFeedback 80 16
export CG_Respawn
proc CG_Respawn 0 0
line 192
;183:
;184:
;185:/*
;186:================
;187:CG_Respawn
;188:
;189:A respawn happened this snapshot
;190:================
;191:*/
;192:void CG_Respawn( void ) {
line 194
;193:	// no error decay on player movement
;194:	cg.thisFrameTeleport = qtrue;
ADDRGP4 cg+234752
CNSTI4 1
ASGNI4
line 197
;195:
;196:	// display weapons available
;197:	cg.weaponSelectTime = cg.time;
ADDRGP4 cg+245636
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 200
;198:
;199:	// select the weapon the server says we are using
;200:	cg.weaponSelect = cg.snap->ps.weapon;
ADDRGP4 cg+236704
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 202
;201:
;202:	cg.timeResidual = cg.snap->ps.commandTime + 1000;
ADDRGP4 cg+282932
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 203
;203:}
LABELV $219
endproc CG_Respawn 0 0
proc CG_CheckPlayerstateEvents 40 12
line 214
;204:
;205:
;206:/*
;207:==============
;208:CG_CheckPlayerstateEvents
;209:==============
;210:*/
;211:extern int		eventStack;
;212:extern int		eventParm2[ MAX_PREDICTED_EVENTS ];
;213:
;214:static void CG_CheckPlayerstateEvents( const playerState_t *ps, const playerState_t *ops ) {
line 219
;215:	int			i, n;
;216:	int			event;
;217:	centity_t	*cent;
;218:
;219:	if ( ps->externalEvent && ps->externalEvent != ops->externalEvent ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
CNSTI4 0
EQI4 $228
ADDRLP4 16
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
EQI4 $228
line 220
;220:		cent = &cg_entities[ ps->clientNum ];
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 1236
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 221
;221:		cent->currentState.event = ps->externalEvent;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
line 222
;222:		cent->currentState.eventParm = ps->externalEventParm;
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 223
;223:		CG_EntityEvent( cent, cent->lerpOrigin, -1 );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1212
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 224
;224:	}
LABELV $228
line 226
;225:
;226:	cent = &cg.predictedPlayerEntity; // cg_entities[ ps->clientNum ];
ADDRLP4 4
ADDRGP4 cg+235356
ASGNP4
line 227
;227:	n = eventStack - MAX_PS_EVENTS;
ADDRLP4 12
ADDRGP4 eventStack
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 228
;228:	if ( n < 0 ) n  = 0;
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $231
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $231
line 230
;229:	// go through the predictable events buffer
;230:	for ( i = ps->eventSequence - MAX_PS_EVENTS ; i < ps->eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
ADDRGP4 $236
JUMPV
LABELV $233
line 232
;231:		// if we have a new predictable event
;232:		if ( i >= ops->eventSequence
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
GEI4 $239
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
LEI4 $237
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
EQI4 $237
LABELV $239
line 235
;233:			// or the server told us to play another event instead of a predicted event we already issued
;234:			// or something the server told us changed our prediction causing a different event
;235:			|| (i > ops->eventSequence - MAX_PS_EVENTS && ps->events[i & (MAX_PS_EVENTS-1)] != ops->events[i & (MAX_PS_EVENTS-1)]) ) {
line 237
;236:
;237:			event = ps->events[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
line 238
;238:			if ( event == EV_NONE ) // ignore empty events
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $240
line 239
;239:				continue;
ADDRGP4 $234
JUMPV
LABELV $240
line 240
;240:			cent->currentState.event = event;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 241
;241:			cent->currentState.eventParm = ps->eventParms[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ASGNI4
line 243
;242:
;243:			CG_EntityEvent( cent, cent->lerpOrigin, eventParm2[ n++ ] );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1212
ADDP4
ARGP4
ADDRLP4 28
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 28
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
line 245
;244:
;245:			cg.predictableEvents[ i & (MAX_PREDICTED_EVENTS-1) ] = event;
ADDRLP4 0
INDIRI4
CNSTI4 15
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cg+236616
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 247
;246:
;247:			cg.eventSequence++;
ADDRLP4 36
ADDRGP4 cg+236612
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 248
;248:		}
LABELV $237
line 249
;249:	}
LABELV $234
line 230
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $236
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $233
line 250
;250:}
LABELV $227
endproc CG_CheckPlayerstateEvents 40 12
proc pushReward 4 0
line 258
;251:
;252:
;253:/*
;254:==================
;255:pushReward
;256:==================
;257:*/
;258:static void pushReward( sfxHandle_t sfx, qhandle_t shader, int rewardCount ) {
line 259
;259:	if ( cg.rewardStack < (MAX_REWARDSTACK-1 )) {
ADDRGP4 cg+245372
INDIRI4
CNSTI4 9
GEI4 $245
line 260
;260:		cg.rewardStack++;
ADDRLP4 0
ADDRGP4 cg+245372
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 261
;261:		cg.rewardSound[cg.rewardStack] = sfx;
ADDRGP4 cg+245372
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+245460
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 262
;262:		cg.rewardShader[cg.rewardStack] = shader;
ADDRGP4 cg+245372
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+245420
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 263
;263:		cg.rewardCount[cg.rewardStack] = rewardCount;
ADDRGP4 cg+245372
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+245380
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 264
;264:	}
LABELV $245
line 265
;265:}
LABELV $244
endproc pushReward 4 0
export CG_CheckLocalSounds
proc CG_CheckLocalSounds 24 12
line 273
;266:
;267:
;268:/*
;269:==================
;270:CG_CheckLocalSounds
;271:==================
;272:*/
;273:void CG_CheckLocalSounds( playerState_t *ps, playerState_t *ops ) {
line 281
;274:#ifdef MISSIONPACK
;275:	int health, armor;
;276:#endif
;277:	int highScore, reward;
;278:	sfxHandle_t sfx;
;279:
;280:	// don't play the sounds if the player just changed teams
;281:	if ( ps->persistant[PERS_TEAM] != ops->persistant[PERS_TEAM] ) {
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
EQI4 $256
line 282
;282:		return;
ADDRGP4 $255
JUMPV
LABELV $256
line 286
;283:	}
;284:
;285:	// hit changes
;286:	if ( ps->persistant[PERS_HITS] > ops->persistant[PERS_HITS] ) {
ADDRFP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
LEI4 $258
line 298
;287:#ifdef MISSIONPACK
;288:		armor  = ps->persistant[PERS_ATTACKEE_ARMOR] & 0xff;
;289:		health = ps->persistant[PERS_ATTACKEE_ARMOR] >> 8;
;290:		if (armor > 50 ) {
;291:			trap_S_StartLocalSound( cgs.media.hitSoundHighArmor, CHAN_LOCAL_SOUND );
;292:		} else if (armor || health > 100) {
;293:			trap_S_StartLocalSound( cgs.media.hitSoundLowArmor, CHAN_LOCAL_SOUND );
;294:		} else {
;295:			trap_S_StartLocalSound( cgs.media.hitSound, CHAN_LOCAL_SOUND );
;296:		}
;297:#else
;298:		if ( cg_hitSounds.integer > 0 && (ps->persistant[PERS_ATTACKEE_ARMOR] & 0xFF00) == 0 )
ADDRGP4 cg_hitSounds+12
INDIRI4
CNSTI4 0
LEI4 $260
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 65280
BANDI4
CNSTI4 0
NEI4 $260
line 299
;299:		{
line 303
;300:			// high byte of PERS_ATTACKEE_ARMOR is target->health in vq3/ta i.e. it is always non-zero
;301:			// so we will use this value to filter legacy data from our new hitsounds where it is always 0
;302:			int damage, index;
;303:			damage = ps->persistant[PERS_ATTACKEE_ARMOR] & 0xFF;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 306
;304:
;305:			// damage value is already scaled by STAT_MAX_HEALTH on server side
;306:			if ( damage > 75 ) index = 3;
ADDRLP4 16
INDIRI4
CNSTI4 75
LEI4 $263
ADDRLP4 12
CNSTI4 3
ASGNI4
ADDRGP4 $264
JUMPV
LABELV $263
line 307
;307:			else if ( damage > 50 ) index = 2;
ADDRLP4 16
INDIRI4
CNSTI4 50
LEI4 $265
ADDRLP4 12
CNSTI4 2
ASGNI4
ADDRGP4 $266
JUMPV
LABELV $265
line 308
;308:			else if ( damage > 25 ) index = 1;
ADDRLP4 16
INDIRI4
CNSTI4 25
LEI4 $267
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $268
JUMPV
LABELV $267
line 309
;309:			else index = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $268
LABELV $266
LABELV $264
line 311
;310:
;311:			if ( cg_hitSounds.integer > 1 ) // reversed: higher damage - higher tone
ADDRGP4 cg_hitSounds+12
INDIRI4
CNSTI4 1
LEI4 $269
line 312
;312:				index = 3 - index;
ADDRLP4 12
CNSTI4 3
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
LABELV $269
line 314
;313:
;314:			trap_S_StartLocalSound( cgs.media.hitSounds[ index ], CHAN_LOCAL_SOUND );
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+150560+828
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 315
;315:		} 
ADDRGP4 $259
JUMPV
LABELV $260
line 317
;316:		else
;317:		{
line 318
;318:			trap_S_StartLocalSound( cgs.media.hitSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+150560+824
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 319
;319:		}
line 321
;320:#endif
;321:	} else if ( ps->persistant[PERS_HITS] < ops->persistant[PERS_HITS] ) {
ADDRGP4 $259
JUMPV
LABELV $258
ADDRFP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
GEI4 $276
line 322
;322:		trap_S_StartLocalSound( cgs.media.hitTeamSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+150560+844
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 323
;323:	}
LABELV $276
LABELV $259
line 326
;324:
;325:	// health changes of more than -1 should make pain sounds
;326:	if ( ps->stats[STAT_HEALTH] < ops->stats[STAT_HEALTH] - 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $280
line 327
;327:		if ( ps->stats[STAT_HEALTH] > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $282
line 328
;328:			CG_PainEvent( &cg.predictedPlayerEntity, ps->stats[STAT_HEALTH] );
ADDRGP4 cg+235356
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainEvent
CALLV
pop
line 329
;329:		}
LABELV $282
line 330
;330:	}
LABELV $280
line 333
;331:
;332:	// if we are going into the intermission, don't start any voices
;333:	if ( cg.intermissionStarted ) {
ADDRGP4 cg+24
INDIRI4
CNSTI4 0
EQI4 $285
line 334
;334:		return;
ADDRGP4 $255
JUMPV
LABELV $285
line 338
;335:	}
;336:
;337:	// reward sounds
;338:	reward = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 339
;339:	if (ps->persistant[PERS_CAPTURES] != ops->persistant[PERS_CAPTURES]) {
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
EQI4 $288
line 340
;340:		pushReward(cgs.media.captureAwardSound, cgs.media.medalCapture, ps->persistant[PERS_CAPTURES]);
ADDRGP4 cgs+150560+904
INDIRI4
ARGI4
ADDRGP4 cgs+150560+572
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 341
;341:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 343
;342:		//Com_Printf("capture\n");
;343:	}
LABELV $288
line 344
;344:	if (ps->persistant[PERS_IMPRESSIVE_COUNT] != ops->persistant[PERS_IMPRESSIVE_COUNT]) {
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
EQI4 $294
line 352
;345:#ifdef MISSIONPACK
;346:		if (ps->persistant[PERS_IMPRESSIVE_COUNT] == 1) {
;347:			sfx = cgs.media.firstImpressiveSound;
;348:		} else {
;349:			sfx = cgs.media.impressiveSound;
;350:		}
;351:#else
;352:		sfx = cgs.media.impressiveSound;
ADDRLP4 4
ADDRGP4 cgs+150560+848
INDIRI4
ASGNI4
line 354
;353:#endif
;354:		pushReward(sfx, cgs.media.medalImpressive, ps->persistant[PERS_IMPRESSIVE_COUNT]);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+150560+552
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 355
;355:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 357
;356:		//Com_Printf("impressive\n");
;357:	}
LABELV $294
line 358
;358:	if (ps->persistant[PERS_EXCELLENT_COUNT] != ops->persistant[PERS_EXCELLENT_COUNT]) {
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
EQI4 $300
line 366
;359:#ifdef MISSIONPACK
;360:		if (ps->persistant[PERS_EXCELLENT_COUNT] == 1) {
;361:			sfx = cgs.media.firstExcellentSound;
;362:		} else {
;363:			sfx = cgs.media.excellentSound;
;364:		}
;365:#else
;366:		sfx = cgs.media.excellentSound;
ADDRLP4 4
ADDRGP4 cgs+150560+852
INDIRI4
ASGNI4
line 368
;367:#endif
;368:		pushReward(sfx, cgs.media.medalExcellent, ps->persistant[PERS_EXCELLENT_COUNT]);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+150560+556
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 369
;369:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 371
;370:		//Com_Printf("excellent\n");
;371:	}
LABELV $300
line 372
;372:	if (ps->persistant[PERS_GAUNTLET_FRAG_COUNT] != ops->persistant[PERS_GAUNTLET_FRAG_COUNT]) {
ADDRFP4 0
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
EQI4 $306
line 380
;373:#ifdef MISSIONPACK
;374:		if (ps->persistant[PERS_GAUNTLET_FRAG_COUNT] == 1) {
;375:			sfx = cgs.media.firstHumiliationSound;
;376:		} else {
;377:			sfx = cgs.media.humiliationSound;
;378:		}
;379:#else
;380:		sfx = cgs.media.humiliationSound;
ADDRLP4 4
ADDRGP4 cgs+150560+860
INDIRI4
ASGNI4
line 382
;381:#endif
;382:		pushReward(sfx, cgs.media.medalGauntlet, ps->persistant[PERS_GAUNTLET_FRAG_COUNT]);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+150560+560
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 383
;383:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 385
;384:		//Com_Printf("gauntlet frag\n");
;385:	}
LABELV $306
line 386
;386:	if (ps->persistant[PERS_DEFEND_COUNT] != ops->persistant[PERS_DEFEND_COUNT]) {
ADDRFP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
EQI4 $312
line 387
;387:		pushReward(cgs.media.defendSound, cgs.media.medalDefend, ps->persistant[PERS_DEFEND_COUNT]);
ADDRGP4 cgs+150560+868
INDIRI4
ARGI4
ADDRGP4 cgs+150560+564
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 388
;388:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 390
;389:		//Com_Printf("defend\n");
;390:	}
LABELV $312
line 391
;391:	if (ps->persistant[PERS_ASSIST_COUNT] != ops->persistant[PERS_ASSIST_COUNT]) {
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
EQI4 $318
line 392
;392:		pushReward(cgs.media.assistSound, cgs.media.medalAssist, ps->persistant[PERS_ASSIST_COUNT]);
ADDRGP4 cgs+150560+864
INDIRI4
ARGI4
ADDRGP4 cgs+150560+568
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 393
;393:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 395
;394:		//Com_Printf("assist\n");
;395:	}
LABELV $318
line 397
;396:	// if any of the player event bits changed
;397:	if (ps->persistant[PERS_PLAYEREVENTS] != ops->persistant[PERS_PLAYEREVENTS]) {
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
EQI4 $324
line 398
;398:		if ((ps->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_DENIEDREWARD) !=
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRFP4 4
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 1
BANDI4
EQI4 $326
line 399
;399:				(ops->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_DENIEDREWARD)) {
line 400
;400:			trap_S_StartLocalSound( cgs.media.deniedSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+150560+856
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 401
;401:		}
ADDRGP4 $327
JUMPV
LABELV $326
line 402
;402:		else if ((ps->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_GAUNTLETREWARD) !=
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRFP4 4
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 2
BANDI4
EQI4 $330
line 403
;403:				(ops->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_GAUNTLETREWARD)) {
line 404
;404:			trap_S_StartLocalSound( cgs.media.humiliationSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+150560+860
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 405
;405:		}
ADDRGP4 $331
JUMPV
LABELV $330
line 406
;406:		else if ((ps->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_HOLYSHIT) !=
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 4
BANDI4
ADDRFP4 4
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 4
BANDI4
EQI4 $334
line 407
;407:				(ops->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_HOLYSHIT)) {
line 408
;408:			trap_S_StartLocalSound( cgs.media.holyShitSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+150560+984
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 409
;409:		}
LABELV $334
LABELV $331
LABELV $327
line 410
;410:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 411
;411:	}
LABELV $324
line 414
;412:
;413:	// check for flag pickup
;414:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
LTI4 $338
line 415
;415:		if ((ps->powerups[PW_REDFLAG] != ops->powerups[PW_REDFLAG] && ps->powerups[PW_REDFLAG]) ||
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
EQI4 $344
ADDRLP4 12
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
NEI4 $345
LABELV $344
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
EQI4 $346
ADDRLP4 16
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
NEI4 $345
LABELV $346
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
EQI4 $341
ADDRLP4 20
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $341
LABELV $345
line 418
;416:			(ps->powerups[PW_BLUEFLAG] != ops->powerups[PW_BLUEFLAG] && ps->powerups[PW_BLUEFLAG]) ||
;417:			(ps->powerups[PW_NEUTRALFLAG] != ops->powerups[PW_NEUTRALFLAG] && ps->powerups[PW_NEUTRALFLAG]) )
;418:		{
line 419
;419:			trap_S_StartLocalSound( cgs.media.youHaveFlagSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+150560+976
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 420
;420:		}
LABELV $341
line 421
;421:	}
LABELV $338
line 424
;422:
;423:	// lead changes
;424:	if (!reward) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $349
line 426
;425:		//
;426:		if ( !cg.warmup ) {
ADDRGP4 cg+245608
INDIRI4
CNSTI4 0
NEI4 $351
line 428
;427:			// never play lead changes during warmup
;428:			if ( ps->persistant[PERS_RANK] != ops->persistant[PERS_RANK] ) {
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
EQI4 $354
line 429
;429:				if ( cgs.gametype < GT_TEAM) {
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
GEI4 $356
line 430
;430:					if (  ps->persistant[PERS_RANK] == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
NEI4 $359
line 431
;431:						CG_AddBufferedSound(cgs.media.takenLeadSound);
ADDRGP4 cgs+150560+872
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 432
;432:					} else if ( ps->persistant[PERS_RANK] == RANK_TIED_FLAG ) {
ADDRGP4 $360
JUMPV
LABELV $359
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 16384
NEI4 $363
line 433
;433:						CG_AddBufferedSound(cgs.media.tiedLeadSound);
ADDRGP4 cgs+150560+876
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 434
;434:					} else if ( ( ops->persistant[PERS_RANK] & ~RANK_TIED_FLAG ) == 0 ) {
ADDRGP4 $364
JUMPV
LABELV $363
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
CNSTI4 0
NEI4 $367
line 435
;435:						CG_AddBufferedSound(cgs.media.lostLeadSound);
ADDRGP4 cgs+150560+880
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 436
;436:					}
LABELV $367
LABELV $364
LABELV $360
line 437
;437:				}
LABELV $356
line 438
;438:			}
LABELV $354
line 439
;439:		}
LABELV $351
line 440
;440:	}
LABELV $349
line 443
;441:
;442:	// timelimit warnings
;443:	if ( cgs.timelimit > 0 && !cg.warmup && cg.warmupFightSound < cg.time ) {
ADDRGP4 cgs+31516
INDIRI4
CNSTI4 0
LEI4 $371
ADDRGP4 cg+245608
INDIRI4
CNSTI4 0
NEI4 $371
ADDRGP4 cg+245616
INDIRI4
ADDRGP4 cg+234764
INDIRI4
GEI4 $371
line 446
;444:		int		msec;
;445:
;446:		msec = cg.time - cgs.levelStartTime;
ADDRLP4 12
ADDRGP4 cg+234764
INDIRI4
ADDRGP4 cgs+34836
INDIRI4
SUBI4
ASGNI4
line 447
;447:		if ( !( cg.timelimitWarnings & 4 ) && msec > ( cgs.timelimit * 60 + 2 ) * 1000 ) {
ADDRGP4 cg+234776
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $379
ADDRLP4 12
INDIRI4
ADDRGP4 cgs+31516
INDIRI4
CNSTI4 60
MULI4
CNSTI4 1000
MULI4
CNSTI4 2000
ADDI4
LEI4 $379
line 448
;448:			cg.timelimitWarnings |= 1 | 2 | 4;
ADDRLP4 16
ADDRGP4 cg+234776
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 7
BORI4
ASGNI4
line 449
;449:			trap_S_StartLocalSound( cgs.media.suddenDeathSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+150560+808
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 450
;450:		}
ADDRGP4 $380
JUMPV
LABELV $379
line 451
;451:		else if ( !( cg.timelimitWarnings & 2 ) && msec > (cgs.timelimit - 1) * 60 * 1000 ) {
ADDRGP4 cg+234776
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $386
ADDRLP4 12
INDIRI4
ADDRGP4 cgs+31516
INDIRI4
CNSTI4 60
MULI4
CNSTI4 1000
MULI4
CNSTI4 60000
SUBI4
LEI4 $386
line 452
;452:			cg.timelimitWarnings |= 1 | 2;
ADDRLP4 16
ADDRGP4 cg+234776
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 3
BORI4
ASGNI4
line 453
;453:			CG_AddBufferedSound( cgs.media.oneMinuteSound );
ADDRGP4 cgs+150560+800
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 454
;454:		}
ADDRGP4 $387
JUMPV
LABELV $386
line 455
;455:		else if ( cgs.timelimit > 5 && !( cg.timelimitWarnings & 1 ) && msec > (cgs.timelimit - 5) * 60 * 1000 ) {
ADDRGP4 cgs+31516
INDIRI4
CNSTI4 5
LEI4 $393
ADDRGP4 cg+234776
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $393
ADDRLP4 12
INDIRI4
ADDRGP4 cgs+31516
INDIRI4
CNSTI4 60
MULI4
CNSTI4 1000
MULI4
CNSTI4 300000
SUBI4
LEI4 $393
line 456
;456:			cg.timelimitWarnings |= 1;
ADDRLP4 16
ADDRGP4 cg+234776
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 457
;457:			CG_AddBufferedSound( cgs.media.fiveMinuteSound );
ADDRGP4 cgs+150560+804
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 458
;458:		}
LABELV $393
LABELV $387
LABELV $380
line 459
;459:	}
LABELV $371
line 462
;460:
;461:	// fraglimit warnings
;462:	if ( cgs.fraglimit > 0 && cgs.gametype < GT_CTF) {
ADDRGP4 cgs+31508
INDIRI4
CNSTI4 0
LEI4 $401
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 4
GEI4 $401
line 463
;463:		highScore = cgs.scores1;
ADDRLP4 8
ADDRGP4 cgs+34840
INDIRI4
ASGNI4
line 465
;464:
;465:		if (cgs.gametype == GT_TEAM && cgs.scores2 > highScore) {
ADDRGP4 cgs+31496
INDIRI4
CNSTI4 3
NEI4 $406
ADDRGP4 cgs+34844
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $406
line 466
;466:			highScore = cgs.scores2;
ADDRLP4 8
ADDRGP4 cgs+34844
INDIRI4
ASGNI4
line 467
;467:		}
LABELV $406
line 469
;468:
;469:		if ( !( cg.fraglimitWarnings & 4 ) && highScore == (cgs.fraglimit - 1) ) {
ADDRGP4 cg+234780
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $411
ADDRLP4 8
INDIRI4
ADDRGP4 cgs+31508
INDIRI4
CNSTI4 1
SUBI4
NEI4 $411
line 470
;470:			cg.fraglimitWarnings |= 1 | 2 | 4;
ADDRLP4 12
ADDRGP4 cg+234780
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 7
BORI4
ASGNI4
line 471
;471:			CG_AddBufferedSound(cgs.media.oneFragSound);
ADDRGP4 cgs+150560+820
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 472
;472:		}
ADDRGP4 $412
JUMPV
LABELV $411
line 473
;473:		else if ( cgs.fraglimit > 2 && !( cg.fraglimitWarnings & 2 ) && highScore == (cgs.fraglimit - 2) ) {
ADDRGP4 cgs+31508
INDIRI4
CNSTI4 2
LEI4 $418
ADDRGP4 cg+234780
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $418
ADDRLP4 8
INDIRI4
ADDRGP4 cgs+31508
INDIRI4
CNSTI4 2
SUBI4
NEI4 $418
line 474
;474:			cg.fraglimitWarnings |= 1 | 2;
ADDRLP4 12
ADDRGP4 cg+234780
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 3
BORI4
ASGNI4
line 475
;475:			CG_AddBufferedSound(cgs.media.twoFragSound);
ADDRGP4 cgs+150560+816
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 476
;476:		}
ADDRGP4 $419
JUMPV
LABELV $418
line 477
;477:		else if ( cgs.fraglimit > 3 && !( cg.fraglimitWarnings & 1 ) && highScore == (cgs.fraglimit - 3) ) {
ADDRGP4 cgs+31508
INDIRI4
CNSTI4 3
LEI4 $426
ADDRGP4 cg+234780
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $426
ADDRLP4 8
INDIRI4
ADDRGP4 cgs+31508
INDIRI4
CNSTI4 3
SUBI4
NEI4 $426
line 478
;478:			cg.fraglimitWarnings |= 1;
ADDRLP4 12
ADDRGP4 cg+234780
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 479
;479:			CG_AddBufferedSound(cgs.media.threeFragSound);
ADDRGP4 cgs+150560+812
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 480
;480:		}
LABELV $426
LABELV $419
LABELV $412
line 481
;481:	}
LABELV $401
line 482
;482:}
LABELV $255
endproc CG_CheckLocalSounds 24 12
export CG_TransitionPlayerState
proc CG_TransitionPlayerState 12 12
line 490
;483:
;484:/*
;485:===============
;486:CG_TransitionPlayerState
;487:
;488:===============
;489:*/
;490:void CG_TransitionPlayerState( playerState_t *ps, playerState_t *ops ) {
line 494
;491:	qboolean respawn;
;492:
;493:	// check for changing follow mode
;494:	if ( ps->clientNum != ops->clientNum ) {
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
EQI4 $435
line 495
;495:		cg.thisFrameTeleport = qtrue;
ADDRGP4 cg+234752
CNSTI4 1
ASGNI4
line 497
;496:		// make sure we don't get any unwanted transition effects
;497:		*ops = *ps;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 560
line 498
;498:	}
LABELV $435
line 501
;499:
;500:	// damage events (player is getting wounded)
;501:	if ( ps->damageEvent != ops->damageEvent && ps->damageCount ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
EQI4 $438
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 0
EQI4 $438
line 502
;502:		CG_DamageFeedback( ps->damageYaw, ps->damagePitch, ps->damageCount );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DamageFeedback
CALLV
pop
line 503
;503:	}
LABELV $438
line 506
;504:
;505:	// respawning / map restart
;506:	respawn = ps->persistant[PERS_SPAWN_COUNT] != ops->persistant[PERS_SPAWN_COUNT];
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
EQI4 $441
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $442
JUMPV
LABELV $441
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $442
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 507
;507:	if ( respawn || cg.mapRestart ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $446
ADDRGP4 cg+234784
INDIRI4
CNSTI4 0
EQI4 $443
LABELV $446
line 508
;508:		cg.mapRestart = qfalse;
ADDRGP4 cg+234784
CNSTI4 0
ASGNI4
line 509
;509:		CG_Respawn();
ADDRGP4 CG_Respawn
CALLV
pop
line 510
;510:	}
LABELV $443
line 512
;511:
;512:	if ( cg.snap->ps.pm_type != PM_INTERMISSION 
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
EQI4 $448
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
EQI4 $448
line 513
;513:		&& ps->persistant[PERS_TEAM] != TEAM_SPECTATOR ) {
line 514
;514:		CG_CheckLocalSounds( ps, ops );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CheckLocalSounds
CALLV
pop
line 515
;515:	}
LABELV $448
line 518
;516:
;517:	// check for going low on ammo
;518:	CG_CheckAmmo();
ADDRGP4 CG_CheckAmmo
CALLV
pop
line 521
;519:
;520:	 // try to play potentially dropped events
;521:	CG_PlayDroppedEvents( ps, ops );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayDroppedEvents
CALLV
pop
line 524
;522:
;523:	// run events
;524:	CG_CheckPlayerstateEvents( ps, ops );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CheckPlayerstateEvents
CALLV
pop
line 527
;525:
;526:	// reset event stack
;527:	eventStack = 0;
ADDRGP4 eventStack
CNSTI4 0
ASGNI4
line 530
;528:
;529:	// smooth the ducking viewheight change
;530:	if ( ps->viewheight != ops->viewheight && !respawn ) {
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
EQI4 $451
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $451
line 531
;531:		cg.duckChange = ps->viewheight - ops->viewheight;
ADDRGP4 cg+236688
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 532
;532:		cg.duckTime = cg.time;
ADDRGP4 cg+236692
ADDRGP4 cg+234764
INDIRI4
ASGNI4
line 533
;533:	}
LABELV $451
line 534
;534:}
LABELV $434
endproc CG_TransitionPlayerState 12 12
import eventParm2
import eventStack
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
LABELV $125
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $122
byte 1 110
byte 1 0
