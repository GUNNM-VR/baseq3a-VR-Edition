export SP_info_camp
code
proc SP_info_camp 4 8
file "..\..\..\..\code\game\g_misc.c"
line 16
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_misc.c
;4:
;5:#include "g_local.h"
;6:
;7:
;8:/*QUAKED func_group (0 0 0) ?
;9:Used to group brushes together just for editor convenience.  They are turned into normal brushes by the utilities.
;10:*/
;11:
;12:
;13:/*QUAKED info_camp (0 0.5 0) (-4 -4 -4) (4 4 4)
;14:Used as a positional target for calculations in the utilities (spotlights, etc), but removed during gameplay.
;15:*/
;16:void SP_info_camp( gentity_t *self ) {
line 17
;17:	G_SetOrigin( self, self->s.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 18
;18:}
LABELV $54
endproc SP_info_camp 4 8
export SP_info_null
proc SP_info_null 0 4
line 24
;19:
;20:
;21:/*QUAKED info_null (0 0.5 0) (-4 -4 -4) (4 4 4)
;22:Used as a positional target for calculations in the utilities (spotlights, etc), but removed during gameplay.
;23:*/
;24:void SP_info_null( gentity_t *self ) {
line 25
;25:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 26
;26:}
LABELV $55
endproc SP_info_null 0 4
export SP_info_notnull
proc SP_info_notnull 4 8
line 33
;27:
;28:
;29:/*QUAKED info_notnull (0 0.5 0) (-4 -4 -4) (4 4 4)
;30:Used as a positional target for in-game calculation, like jumppad targets.
;31:target_position does the same thing
;32:*/
;33:void SP_info_notnull( gentity_t *self ){
line 34
;34:	G_SetOrigin( self, self->s.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 35
;35:}
LABELV $56
endproc SP_info_notnull 4 8
export SP_light
proc SP_light 0 4
line 45
;36:
;37:
;38:/*QUAKED light (0 1 0) (-8 -8 -8) (8 8 8) linear
;39:Non-displayed light.
;40:"light" overrides the default 300 intensity.
;41:Linear checbox gives linear falloff instead of inverse square
;42:Lights pointed at a target will be spotlights.
;43:"radius" overrides the default 64 unit radius of a spotlight at the target point.
;44:*/
;45:void SP_light( gentity_t *self ) {
line 46
;46:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 47
;47:}
LABELV $57
endproc SP_light 0 4
export TeleportPlayer
proc TeleportPlayer 24 16
line 59
;48:
;49:
;50:
;51:/*
;52:=================================================================================
;53:
;54:TELEPORTERS
;55:
;56:=================================================================================
;57:*/
;58:
;59:void TeleportPlayer( gentity_t *player, vec3_t origin, vec3_t angles ) {
line 64
;60:	gentity_t	*tent;
;61:
;62:	// use temp events at source and destination to prevent the effect
;63:	// from getting dropped by a second player event
;64:	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
EQI4 $59
line 65
;65:		tent = G_TempEntity( player->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 44
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 66
;66:		tent->s.clientNum = player->s.clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 68
;67:
;68:		tent = G_TempEntity( origin, EV_PLAYER_TELEPORT_IN );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 43
ARGI4
ADDRLP4 8
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 69
;69:		tent->s.clientNum = player->s.clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 70
;70:	}
LABELV $59
line 73
;71:
;72:	// unlink to make sure it can't possibly interfere with G_KillBox
;73:	trap_UnlinkEntity( player );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 75
;74:
;75:	VectorCopy( origin, player->client->ps.origin );
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 76
;76:	player->client->ps.origin[2] += 1.0f;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 79
;77:
;78:	// spit the player out
;79:	if ( angles )
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $61
line 80
;80:		AngleVectors( angles, player->client->ps.velocity, NULL, NULL );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
LABELV $61
line 82
;81:
;82:	if ( player->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
NEI4 $63
line 83
;83:		VectorScale( player->client->ps.velocity, 1.25f, player->client->ps.velocity );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1067450368
MULF4
ASGNF4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CNSTF4 1067450368
MULF4
ASGNF4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1067450368
MULF4
ASGNF4
line 84
;84:	} else {
ADDRGP4 $64
JUMPV
LABELV $63
line 85
;85:		VectorScale( player->client->ps.velocity, g_speed.value * 1.25f, player->client->ps.velocity );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRGP4 g_speed+8
INDIRF4
CNSTF4 1067450368
MULF4
MULF4
ASGNF4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRGP4 g_speed+8
INDIRF4
CNSTF4 1067450368
MULF4
MULF4
ASGNF4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 g_speed+8
INDIRF4
CNSTF4 1067450368
MULF4
MULF4
ASGNF4
line 86
;86:	}
LABELV $64
line 88
;87:
;88:	player->client->ps.pm_time = 160; // hold time
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 160
ASGNI4
line 89
;89:	player->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 92
;90:
;91:	// toggle the teleport bit so the client knows to not lerp
;92:	player->client->ps.eFlags ^= EF_TELEPORT_BIT;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 95
;93:
;94:	// set angles
;95:	if ( angles ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $68
line 96
;96:		SetClientViewAngle( player, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 99
;97:#ifdef USE_VR_QVM
;98:		// set Vr controller angle at spawn_angles too
;99:		if ( player->client->ps.vr_controller_type)
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $70
line 100
;100:			SetClientVrControllerAngles( player, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 SetClientVrControllerAngles
CALLV
pop
LABELV $70
line 102
;101:#endif
;102:	}
LABELV $68
line 104
;103:	// unlagged
;104:	G_ResetHistory( player );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ResetHistory
CALLV
pop
line 107
;105:
;106:	// kill anything at the destination
;107:	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
EQI4 $72
line 108
;108:		G_KillBox( player );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
line 109
;109:	}
LABELV $72
line 112
;110:
;111:	// save results of pmove
;112:	BG_PlayerStateToEntityState( &player->client->ps, &player->s, qtrue );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 115
;113:
;114:	// use the precise origin for linking
;115:	VectorCopy( player->client->ps.origin, player->r.currentOrigin );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 984
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 117
;116:
;117:	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 3
EQI4 $74
line 118
;118:		trap_LinkEntity( player );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 119
;119:	}
LABELV $74
line 120
;120:}
LABELV $58
endproc TeleportPlayer 24 16
export SP_misc_teleporter_dest
proc SP_misc_teleporter_dest 0 0
line 128
;121:
;122:
;123:/*QUAKED misc_teleporter_dest (1 0 0) (-32 -32 -24) (32 32 -16)
;124:Point teleporters at these.
;125:Now that we don't have teleport destination pads, this is just
;126:an info_notnull
;127:*/
;128:void SP_misc_teleporter_dest( gentity_t *ent ) {
line 129
;129:}
LABELV $76
endproc SP_misc_teleporter_dest 0 0
export SP_misc_model
proc SP_misc_model 0 4
line 137
;130:
;131:
;132://===========================================================
;133:
;134:/*QUAKED misc_model (1 0 0) (-16 -16 -16) (16 16 16)
;135:"model"		arbitrary .md3 file to display
;136:*/
;137:void SP_misc_model( gentity_t *ent ) {
line 148
;138:
;139:#if 0
;140:	ent->s.modelindex = G_ModelIndex( ent->model );
;141:	VectorSet (ent->mins, -16, -16, -16);
;142:	VectorSet (ent->maxs, 16, 16, 16);
;143:	trap_LinkEntity (ent);
;144:
;145:	G_SetOrigin( ent, ent->s.origin );
;146:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
;147:#else
;148:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 150
;149:#endif
;150:}
LABELV $77
endproc SP_misc_model 0 4
export locateCamera
proc locateCamera 36 8
line 154
;151:
;152://===========================================================
;153:
;154:void locateCamera( gentity_t *ent ) {
line 159
;155:	vec3_t		dir;
;156:	gentity_t	*target;
;157:	gentity_t	*owner;
;158:
;159:	owner = G_PickTarget( ent->target );
ADDRFP4 0
INDIRP4
CNSTI4 1144
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 160
;160:	if ( !owner ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $79
line 161
;161:		G_Printf( "Couldn't find target for misc_partal_surface\n" );
ADDRGP4 $81
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 162
;162:		G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 163
;163:		return;
ADDRGP4 $78
JUMPV
LABELV $79
line 165
;164:	}
;165:	ent->r.ownerNum = owner->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 1008
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 168
;166:
;167:	// frame holds the rotate speed
;168:	if ( owner->spawnflags & 1 ) {
ADDRLP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $82
line 169
;169:		ent->s.frame = 25;
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTI4 25
ASGNI4
line 170
;170:	} else if ( owner->spawnflags & 2 ) {
ADDRGP4 $83
JUMPV
LABELV $82
ADDRLP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $84
line 171
;171:		ent->s.frame = 75;
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTI4 75
ASGNI4
line 172
;172:	}
LABELV $84
LABELV $83
line 175
;173:
;174:	// swing camera ?
;175:	if ( owner->spawnflags & 4 ) {
ADDRLP4 0
INDIRP4
CNSTI4 1024
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $86
line 177
;176:		// set to 0 for no rotation at all
;177:		ent->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 178
;178:	}
ADDRGP4 $87
JUMPV
LABELV $86
line 179
;179:	else {
line 180
;180:		ent->s.powerups = 1;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 1
ASGNI4
line 181
;181:	}
LABELV $87
line 184
;182:
;183:	// clientNum holds the rotate offset
;184:	ent->s.clientNum = owner->s.clientNum;
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 186
;185:
;186:	VectorCopy( owner->s.origin, ent->s.origin2 );
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 189
;187:
;188:	// see if the portal_camera has a target
;189:	target = G_PickTarget( owner->target );
ADDRLP4 0
INDIRP4
CNSTI4 1144
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 24
INDIRP4
ASGNP4
line 190
;190:	if ( target ) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $88
line 191
;191:		VectorSubtract( target->s.origin, owner->s.origin, dir );
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 192
;192:		VectorNormalize( dir );
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 193
;193:	} else {
ADDRGP4 $89
JUMPV
LABELV $88
line 194
;194:		G_SetMovedir( owner->s.angles, dir );
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 195
;195:	}
LABELV $89
line 197
;196:
;197:	ent->s.eventParm = DirToByte( dir );
ADDRLP4 4
ARGP4
ADDRLP4 28
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 198
;198:}
LABELV $78
endproc locateCamera 36 8
export SP_misc_portal_surface
proc SP_misc_portal_surface 4 4
line 204
;199:
;200:/*QUAKED misc_portal_surface (0 0 1) (-8 -8 -8) (8 8 8)
;201:The portal surface nearest this entity will show a view from the targeted misc_portal_camera, or a mirror view if untargeted.
;202:This must be within 64 world units of the surface!
;203:*/
;204:void SP_misc_portal_surface(gentity_t *ent) {
line 205
;205:	VectorClear( ent->r.mins );
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
CNSTF4 0
ASGNF4
line 206
;206:	VectorClear( ent->r.maxs );
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 948
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
CNSTF4 0
ASGNF4
line 207
;207:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 209
;208:
;209:	ent->r.svFlags = SVF_PORTAL;
ADDRFP4 0
INDIRP4
CNSTI4 920
ADDP4
CNSTI4 64
ASGNI4
line 210
;210:	ent->s.eType = ET_PORTAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 6
ASGNI4
line 212
;211:
;212:	if ( !ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 1144
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $93
line 213
;213:		VectorCopy( ent->s.origin, ent->s.origin2 );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 214
;214:	} else {
ADDRGP4 $94
JUMPV
LABELV $93
line 215
;215:		ent->think = locateCamera;
ADDRFP4 0
INDIRP4
CNSTI4 1188
ADDP4
ADDRGP4 locateCamera
ASGNP4
line 216
;216:		ent->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 1184
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 217
;217:	}
LABELV $94
line 218
;218:}
LABELV $92
endproc SP_misc_portal_surface 4 4
export SP_misc_portal_camera
proc SP_misc_portal_camera 4 12
line 224
;219:
;220:/*QUAKED misc_portal_camera (0 0 1) (-8 -8 -8) (8 8 8) slowrotate fastrotate noswing
;221:The target for a misc_portal_director.  You can set either angles or target another entity to determine the direction of view.
;222:"roll" an angle modifier to orient the camera around the target vector;
;223:*/
;224:void SP_misc_portal_camera(gentity_t *ent) {
line 227
;225:	float	roll;
;226:
;227:	VectorClear( ent->r.mins );
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 936
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 940
ADDP4
CNSTF4 0
ASGNF4
line 228
;228:	VectorClear( ent->r.maxs );
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 948
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
CNSTF4 0
ASGNF4
line 229
;229:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 231
;230:
;231:	G_SpawnFloat( "roll", "0", &roll );
ADDRGP4 $97
ARGP4
ADDRGP4 $98
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 233
;232:
;233:	ent->s.clientNum = roll/360.0 * 256;
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 0
INDIRF4
CNSTF4 1060506465
MULF4
CVFI4 4
ASGNI4
line 234
;234:}
LABELV $96
endproc SP_misc_portal_camera 4 12
export Use_Shooter
proc Use_Shooter 76 12
line 244
;235:
;236:/*
;237:======================================================================
;238:
;239:  SHOOTERS
;240:
;241:======================================================================
;242:*/
;243:
;244:void Use_Shooter( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 250
;245:	vec3_t		dir;
;246:	float		deg;
;247:	vec3_t		up, right;
;248:
;249:	// see if we have a target
;250:	if ( ent->enemy ) {
ADDRFP4 0
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $100
line 251
;251:		VectorSubtract( ent->enemy->r.currentOrigin, ent->s.origin, dir );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
CNSTI4 984
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 40
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
CNSTI4 988
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 44
INDIRP4
CNSTI4 1264
ADDP4
INDIRP4
CNSTI4 992
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 252
;252:		VectorNormalize( dir );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 253
;253:	} else {
ADDRGP4 $101
JUMPV
LABELV $100
line 254
;254:		VectorCopy( ent->movedir, dir );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1172
ADDP4
INDIRB
ASGNB 12
line 255
;255:	}
LABELV $101
line 258
;256:
;257:	// randomize a bit
;258:	PerpendicularVector( up, dir );
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 259
;259:	CrossProduct( up, dir, right );
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 261
;260:
;261:	deg = crandom() * ent->random;
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 40
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
ADDRFP4 0
INDIRP4
CNSTI4 1296
ADDP4
INDIRF4
MULF4
ASGNF4
line 262
;262:	VectorMA( dir, deg, up, dir );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 264
;263:
;264:	deg = crandom() * ent->random;
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 48
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
ADDRFP4 0
INDIRP4
CNSTI4 1296
ADDP4
INDIRF4
MULF4
ASGNF4
line 265
;265:	VectorMA( dir, deg, right, dir );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 267
;266:
;267:	VectorNormalize( dir );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 269
;268:
;269:	switch ( ent->s.weapon ) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 4
EQI4 $119
ADDRLP4 56
INDIRI4
CNSTI4 5
EQI4 $120
ADDRLP4 56
INDIRI4
CNSTI4 8
EQI4 $121
ADDRGP4 $116
JUMPV
LABELV $119
line 271
;270:	case WP_GRENADE_LAUNCHER:
;271:		fire_grenade( ent, ent->s.origin, dir );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 fire_grenade
CALLP4
pop
line 272
;272:		break;
ADDRGP4 $117
JUMPV
LABELV $120
line 274
;273:	case WP_ROCKET_LAUNCHER:
;274:		fire_rocket( ent, ent->s.origin, dir );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 fire_rocket
CALLP4
pop
line 275
;275:		break;
ADDRGP4 $117
JUMPV
LABELV $121
line 277
;276:	case WP_PLASMAGUN:
;277:		fire_plasma( ent, ent->s.origin, dir );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 fire_plasma
CALLP4
pop
line 278
;278:		break;
LABELV $116
LABELV $117
line 281
;279:	}
;280:
;281:	G_AddEvent( ent, EV_FIRE_WEAPON, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 24
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 282
;282:}
LABELV $99
endproc Use_Shooter 76 12
proc InitShooter_Finish 8 4
line 285
;283:
;284:
;285:static void InitShooter_Finish( gentity_t *ent ) {
line 286
;286:	ent->enemy = G_PickTarget( ent->target );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1144
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1264
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 287
;287:	ent->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1188
ADDP4
CNSTP4 0
ASGNP4
line 288
;288:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1184
ADDP4
CNSTI4 0
ASGNI4
line 289
;289:}
LABELV $122
endproc InitShooter_Finish 8 4
export InitShooter
proc InitShooter 16 8
line 291
;290:
;291:void InitShooter( gentity_t *ent, int weapon ) {
line 292
;292:	ent->use = Use_Shooter;
ADDRFP4 0
INDIRP4
CNSTI4 1204
ADDP4
ADDRGP4 Use_Shooter
ASGNP4
line 293
;293:	ent->s.weapon = weapon;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 295
;294:
;295:	RegisterItem( BG_FindItemForWeapon( weapon ) );
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 297
;296:
;297:	G_SetMovedir( ent->s.angles, ent->movedir );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1172
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 299
;298:
;299:	if ( !ent->random ) {
ADDRFP4 0
INDIRP4
CNSTI4 1296
ADDP4
INDIRF4
CNSTF4 0
NEF4 $124
line 300
;300:		ent->random = 1.0;
ADDRFP4 0
INDIRP4
CNSTI4 1296
ADDP4
CNSTF4 1065353216
ASGNF4
line 301
;301:	}
LABELV $124
line 302
;302:	ent->random = sin( M_PI * ent->random / 180 );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1296
ADDP4
INDIRF4
CNSTF4 1016003125
MULF4
ARGF4
ADDRLP4 12
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 1296
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 304
;303:	// target might be a moving object, so we can't set movedir for it
;304:	if ( ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 1144
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $126
line 305
;305:		ent->think = InitShooter_Finish;
ADDRFP4 0
INDIRP4
CNSTI4 1188
ADDP4
ADDRGP4 InitShooter_Finish
ASGNP4
line 306
;306:		ent->nextthink = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 1184
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 307
;307:	}
LABELV $126
line 308
;308:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 309
;309:}
LABELV $123
endproc InitShooter 16 8
export SP_shooter_rocket
proc SP_shooter_rocket 0 8
line 315
;310:
;311:/*QUAKED shooter_rocket (1 0 0) (-16 -16 -16) (16 16 16)
;312:Fires at either the target or the current direction.
;313:"random" the number of degrees of deviance from the taget. (1.0 default)
;314:*/
;315:void SP_shooter_rocket( gentity_t *ent ) {
line 316
;316:	InitShooter( ent, WP_ROCKET_LAUNCHER );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 317
;317:}
LABELV $129
endproc SP_shooter_rocket 0 8
export SP_shooter_plasma
proc SP_shooter_plasma 0 8
line 323
;318:
;319:/*QUAKED shooter_plasma (1 0 0) (-16 -16 -16) (16 16 16)
;320:Fires at either the target or the current direction.
;321:"random" is the number of degrees of deviance from the taget. (1.0 default)
;322:*/
;323:void SP_shooter_plasma( gentity_t *ent ) {
line 324
;324:	InitShooter( ent, WP_PLASMAGUN);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 325
;325:}
LABELV $130
endproc SP_shooter_plasma 0 8
export SP_shooter_grenade
proc SP_shooter_grenade 0 8
line 331
;326:
;327:/*QUAKED shooter_grenade (1 0 0) (-16 -16 -16) (16 16 16)
;328:Fires at either the target or the current direction.
;329:"random" is the number of degrees of deviance from the taget. (1.0 default)
;330:*/
;331:void SP_shooter_grenade( gentity_t *ent ) {
line 332
;332:	InitShooter( ent, WP_GRENADE_LAUNCHER);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 333
;333:}
LABELV $131
endproc SP_shooter_grenade 0 8
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
import FireWeapon
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
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import SnapVectorTowards
import LogAccuracyHit
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
LABELV $98
byte 1 48
byte 1 0
align 1
LABELV $97
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $81
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 97
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 115
byte 1 117
byte 1 114
byte 1 102
byte 1 97
byte 1 99
byte 1 101
byte 1 10
byte 1 0
