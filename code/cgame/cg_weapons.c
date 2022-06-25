// Copyright (C) 1999-2000 Id Software, Inc.
//
// cg_weapons.c -- events and effects dealing with weapons
#include "cg_local.h"

#ifdef USE_VR
#include "../../../Quake3e-master/code/vrmod/VRMOD_input.h"

#include "vr_helper.h"

#ifdef USE_NATIVE_HACK
extern vr_clientinfo_t *vrinfo;
#endif

#endif

/*
==========================
CG_MachineGunEjectBrass
==========================
*/
static void CG_MachineGunEjectBrass(centity_t *cent) {
	localEntity_t	*le;
	refEntity_t		*re;
	vec3_t			velocity, xvelocity;
	vec3_t			offset, xoffset;
	float			waterScale = 1.0f;
	vec3_t			v[3];
	vec3_t			rightAngles;

	if ( cg_brassTime.integer <= 0 ) {
		return;
	}

#ifdef USE_VR
	VR_get_cent_controller_angles( cent, rightAngles, SideRIGHT );
#else
	VectorCopy(cent->lerpAngles, rightAngles);
#endif

	le = CG_AllocLocalEntity();
	re = &le->refEntity;

	velocity[0] = 0;
	velocity[1] = -50 + 40 * crandom();
	velocity[2] = 100 + 50 * crandom();

	le->leType = LE_FRAGMENT;
	le->startTime = cg.time;
	le->endTime = le->startTime + cg_brassTime.integer + ( cg_brassTime.integer / 4 ) * random();

	le->pos.trType = TR_GRAVITY;
	le->pos.trTime = cg.time - (rand()&15);

	AnglesToAxis( rightAngles, v );

	offset[0] = 8;
	offset[1] = -4;
	offset[2] = 24;

	xoffset[0] = offset[0] * v[0][0] + offset[1] * v[1][0] + offset[2] * v[2][0];
	xoffset[1] = offset[0] * v[0][1] + offset[1] * v[1][1] + offset[2] * v[2][1];
	xoffset[2] = offset[0] * v[0][2] + offset[1] * v[1][2] + offset[2] * v[2][2];
	VectorAdd( cent->lerpOrigin, xoffset, re->origin );

	VectorCopy( re->origin, le->pos.trBase );

	if ( CG_PointContents( re->origin, -1 ) & CONTENTS_WATER ) {
		waterScale = 0.10f;
	}

	xvelocity[0] = velocity[0] * v[0][0] + velocity[1] * v[1][0] + velocity[2] * v[2][0];
	xvelocity[1] = velocity[0] * v[0][1] + velocity[1] * v[1][1] + velocity[2] * v[2][1];
	xvelocity[2] = velocity[0] * v[0][2] + velocity[1] * v[1][2] + velocity[2] * v[2][2];
	VectorScale( xvelocity, waterScale, le->pos.trDelta );

	AxisCopy( axisDefault, re->axis );
	re->hModel = cgs.media.machinegunBrassModel;

	le->bounceFactor = 0.4 * waterScale;

	le->angles.trType = TR_LINEAR;
	le->angles.trTime = cg.time;
	le->angles.trBase[0] = rand()&31;
	le->angles.trBase[1] = rand()&31;
	le->angles.trBase[2] = rand()&31;
	le->angles.trDelta[0] = 2;
	le->angles.trDelta[1] = 1;
	le->angles.trDelta[2] = 0;

	le->leFlags = LEF_TUMBLE;
	le->leBounceSoundType = LEBS_BRASS;
	le->leMarkType = LEMT_NONE;
}

/*
==========================
CG_ShotgunEjectBrass
==========================
*/
static void CG_ShotgunEjectBrass( centity_t *cent ) {
	localEntity_t	*le;
	refEntity_t		*re;
	vec3_t			velocity, xvelocity;
	vec3_t			offset, xoffset;
	vec3_t			v[3], angles;
	int				i;

	if ( cg_brassTime.integer <= 0 ) {
		return;
	}

	for ( i = 0; i < 2; i++ ) {
		float	waterScale = 1.0f;

		le = CG_AllocLocalEntity();
		re = &le->refEntity;

		velocity[0] = 60 + 60 * crandom();
		if ( i == 0 ) {
			velocity[1] = 40 + 10 * crandom();
		} else {
			velocity[1] = -40 + 10 * crandom();
		}
		velocity[2] = 100 + 50 * crandom();

		le->leType = LE_FRAGMENT;
		le->startTime = cg.time;
		le->endTime = le->startTime + cg_brassTime.integer*3 + cg_brassTime.integer * random();

		le->pos.trType = TR_GRAVITY;
		le->pos.trTime = cg.time;

#ifdef USE_VR
		VR_get_cent_controller_angles( cent, angles, SideRIGHT );
#else
		VectorCopy(cent->lerpAngles, angles);
#endif

		AnglesToAxis(angles, v);

		offset[0] = 8;
		offset[1] = 0;
		offset[2] = 24;

		xoffset[0] = offset[0] * v[0][0] + offset[1] * v[1][0] + offset[2] * v[2][0];
		xoffset[1] = offset[0] * v[0][1] + offset[1] * v[1][1] + offset[2] * v[2][1];
		xoffset[2] = offset[0] * v[0][2] + offset[1] * v[1][2] + offset[2] * v[2][2];
		VectorAdd( cent->lerpOrigin, xoffset, re->origin );
		VectorCopy( re->origin, le->pos.trBase );
		if ( CG_PointContents( re->origin, -1 ) & CONTENTS_WATER ) {
			waterScale = 0.10f;
		}

		xvelocity[0] = velocity[0] * v[0][0] + velocity[1] * v[1][0] + velocity[2] * v[2][0];
		xvelocity[1] = velocity[0] * v[0][1] + velocity[1] * v[1][1] + velocity[2] * v[2][1];
		xvelocity[2] = velocity[0] * v[0][2] + velocity[1] * v[1][2] + velocity[2] * v[2][2];
		VectorScale( xvelocity, waterScale, le->pos.trDelta );

		AxisCopy( axisDefault, re->axis );
		re->hModel = cgs.media.shotgunBrassModel;
		le->bounceFactor = 0.3f;

		le->angles.trType = TR_LINEAR;
		le->angles.trTime = cg.time;
		le->angles.trBase[0] = rand()&31;
		le->angles.trBase[1] = rand()&31;
		le->angles.trBase[2] = rand()&31;
		le->angles.trDelta[0] = 1;
		le->angles.trDelta[1] = 0.5;
		le->angles.trDelta[2] = 0;

		le->leFlags = LEF_TUMBLE;
		le->leBounceSoundType = LEBS_BRASS;
		le->leMarkType = LEMT_NONE;
	}
}


#ifdef MISSIONPACK
/*
==========================
CG_NailgunEjectBrass
==========================
*/
static void CG_NailgunEjectBrass( centity_t *cent ) {
	localEntity_t	*smoke;
	vec3_t			origin;
	vec3_t			v[3];
	vec3_t			offset;
	vec3_t			xoffset;
	vec3_t			up;
	vec3_t			angles;

	//AnglesToAxis( cent->lerpAngles, v ); // ori q3e
	//GUNNM TODO : if player is not the client
#ifdef USE_VR
	VR_get_cent_controller_angles( cent, angles, SideRIGHT );
#else
	VectorCopy( cent->lerpAngles, angles );
#endif

	AnglesToAxis(angles, v);

	offset[0] = 0;
	offset[1] = -12;
	offset[2] = 24;

	xoffset[0] = offset[0] * v[0][0] + offset[1] * v[1][0] + offset[2] * v[2][0];
	xoffset[1] = offset[0] * v[0][1] + offset[1] * v[1][1] + offset[2] * v[2][1];
	xoffset[2] = offset[0] * v[0][2] + offset[1] * v[1][2] + offset[2] * v[2][2];
	VectorAdd( cent->lerpOrigin, xoffset, origin );

	VectorSet( up, 0, 0, 64 );

	smoke = CG_SmokePuff( origin, up, 32, 1, 1, 1, 0.33f, 700, cg.time, 0, 0, cgs.media.smokePuffShader );
	// use the optimized local entity add
	smoke->leType = LE_SCALE_FADE;
}
#endif

#ifdef USE_LASER_SIGHT
/*
==========================
CG_LaserSight
==========================
*/
void CG_LaserSight(vec3_t start, vec3_t end, byte colour[4], float width) {
	refEntity_t     re;
	memset(&re, 0, sizeof(re));

	//Ensure shader is loaded
	cgs.media.railCoreShader = trap_R_RegisterShader("railCore");

	re.customShader = cgs.media.laserBeamShader;

	re.reType = RT_LASERSIGHT;

	VectorCopy(start, re.origin);
	VectorCopy(end, re.oldorigin);

	//radius is used to store width info
	re.radius = width;

	AxisClear(re.axis);

	re.shaderRGBA[0] = colour[0];
	re.shaderRGBA[1] = colour[1];
	re.shaderRGBA[2] = colour[2];
	re.shaderRGBA[3] = colour[3];

	trap_R_AddRefEntityToScene(&re);
}
#endif
/*
==========================
CG_RailTrail
==========================
*/
#define NUM_PARTICLE_PER_ROTATION   36 //18 in IoQuest3

void CG_RailTrail( const clientInfo_t *ci, const vec3_t start, const vec3_t end ) {
	vec3_t axis[NUM_PARTICLE_PER_ROTATION], move, move2, vec, temp;
	float  len;
	int    i, j, skip;
 
	localEntity_t *le;
	refEntity_t   *re;
 
	#define RADIUS   4
	#define ROTATION 1
	#define SPACING  5
 
	le = CG_AllocLocalEntity();
	re = &le->refEntity;
 
	le->leType = LE_FADE_RGB;
	le->startTime = cg.time;
	le->endTime = cg.time + cg_railTrailTime.value;
	le->lifeRate = 1.0 / (le->endTime - le->startTime);
 
	if ( intShaderTime )
		re->u.intShaderTime = cg.time;
	else
		re->u.shaderTime = cg.time / 1000.0f;

	re->reType = RT_RAIL_CORE;
	re->customShader = cgs.media.railCoreShader;
 
	VectorCopy(start, re->origin);
	VectorCopy(end, re->oldorigin);
 
	re->shaderRGBA[0] = ci->color1[0] * 255;
	re->shaderRGBA[1] = ci->color1[1] * 255;
	re->shaderRGBA[2] = ci->color1[2] * 255;
	re->shaderRGBA[3] = 255;

	le->color[0] = ci->color1[0] * 0.75;
	le->color[1] = ci->color1[1] * 0.75;
	le->color[2] = ci->color1[2] * 0.75;
	le->color[3] = 1.0f;

	AxisClear( re->axis );
 
	if ( cg_oldRail.integer != 0 ) {
		// nudge down a bit so it isn't exactly in center
		//re->origin[2] -= 8;
		//re->oldorigin[2] -= 8;
		return;
	}

	//start[2] -= 4;
	VectorCopy( start, move );
	VectorSubtract( end, start, vec );
	len = VectorNormalize( vec );
	PerpendicularVector( temp, vec );

	for ( i = 0 ; i < NUM_PARTICLE_PER_ROTATION; i++ ) {
		RotatePointAroundVector( axis[i], vec, temp, i * 10 ); //banshee 2.4 was 10
	}

	VectorMA( move, 20, vec, move );
	VectorScale( vec, SPACING, vec );

	skip = -1;
 
	j = 18;
	for ( i = 0; i < len; i += SPACING ) {
		if ( i != skip ) {
			skip = i + SPACING;
			le = CG_AllocLocalEntity();
			re = &le->refEntity;
			le->leFlags = LEF_PUFF_DONT_SCALE;
			le->leType = LE_MOVE_SCALE_FADE;
			le->startTime = cg.time;
			le->endTime = cg.time + (i>>1) + 600;
			le->lifeRate = 1.0 / (le->endTime - le->startTime);

			if ( intShaderTime )
				re->u.intShaderTime = cg.time;
			else
				re->u.shaderTime = cg.time / 1000.0f;

			re->reType = RT_SPRITE;
			re->radius = 1.1f;
			re->customShader = cgs.media.railRingsShader;

			re->shaderRGBA[0] = ci->color2[0] * 255;
			re->shaderRGBA[1] = ci->color2[1] * 255;
			re->shaderRGBA[2] = ci->color2[2] * 255;
			re->shaderRGBA[3] = 255;

			le->color[0] = ci->color2[0] * 0.75;
			le->color[1] = ci->color2[1] * 0.75;
			le->color[2] = ci->color2[2] * 0.75;
			le->color[3] = 1.0f;

			le->pos.trType = TR_LINEAR;
			le->pos.trTime = cg.time;

			VectorCopy( move, move2 );
			VectorMA( move2, RADIUS , axis[j], move2 );
			VectorCopy( move2, le->pos.trBase );

			le->pos.trDelta[0] = axis[j][0]*6;
			le->pos.trDelta[1] = axis[j][1]*6;
			le->pos.trDelta[2] = axis[j][2]*6;
		}

		VectorAdd( move, vec, move );

		j = j + ROTATION < NUM_PARTICLE_PER_ROTATION ? j + ROTATION : (j + ROTATION) % NUM_PARTICLE_PER_ROTATION;
	}
}


/*
==========================
CG_RocketTrail
==========================
*/
static void CG_RocketTrail( centity_t *ent, const weaponInfo_t *wi ) {
	int		step;
	vec3_t	origin, lastPos;
	int		t;
	int		startTime, contents;
	int		lastContents;
	entityState_t	*es;
	vec3_t	up;
	localEntity_t	*smoke;

	if ( cg_noProjectileTrail.integer ) {
		return;
	}

	up[0] = 0;
	up[1] = 0;
	up[2] = 0;

	step = 50;

	es = &ent->currentState;
	startTime = ent->trailTime;
	t = step * ( (startTime + step) / step );

	BG_EvaluateTrajectory( &es->pos, cg.time, origin );
	contents = CG_PointContents( origin, -1 );

	// if object (e.g. grenade) is stationary, don't toss up smoke
	if ( es->pos.trType == TR_STATIONARY ) {
		ent->trailTime = cg.time;
		return;
	}

	BG_EvaluateTrajectory( &es->pos, ent->trailTime, lastPos );
	lastContents = CG_PointContents( lastPos, -1 );

	ent->trailTime = cg.time;

	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
		if ( contents & lastContents & CONTENTS_WATER ) {
			CG_BubbleTrail( lastPos, origin, 8 );
		}
		return;
	}

	for ( ; t <= ent->trailTime ; t += step ) {
		BG_EvaluateTrajectory( &es->pos, t, lastPos );

		smoke = CG_SmokePuff( lastPos, up, 
					  wi->trailRadius, 
					  1.0f, 1.0f, 1.0f, 0.33f,
					  wi->wiTrailTime, 
					  t,
					  0,
					  0, 
					  cgs.media.smokePuffShader );
		// use the optimized local entity add
		smoke->leType = LE_SCALE_FADE;
	}

}

#ifdef MISSIONPACK
/*
==========================
CG_NailTrail
==========================
*/
static void CG_NailTrail( centity_t *ent, const weaponInfo_t *wi ) {
	int		step;
	vec3_t	origin, lastPos;
	int		t;
	int		startTime, contents;
	int		lastContents;
	entityState_t	*es;
	vec3_t	up;
	localEntity_t	*smoke;

	if ( cg_noProjectileTrail.integer ) {
		return;
	}

	up[0] = 0;
	up[1] = 0;
	up[2] = 0;

	step = 50;

	es = &ent->currentState;
	startTime = ent->trailTime;
	t = step * ( (startTime + step) / step );

	BG_EvaluateTrajectory( &es->pos, cg.time, origin );
	contents = CG_PointContents( origin, -1 );

	// if object (e.g. grenade) is stationary, don't toss up smoke
	if ( es->pos.trType == TR_STATIONARY ) {
		ent->trailTime = cg.time;
		return;
	}

	BG_EvaluateTrajectory( &es->pos, ent->trailTime, lastPos );
	lastContents = CG_PointContents( lastPos, -1 );

	ent->trailTime = cg.time;

	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
		if ( contents & lastContents & CONTENTS_WATER ) {
			CG_BubbleTrail( lastPos, origin, 8 );
		}
		return;
	}

	for ( ; t <= ent->trailTime ; t += step ) {
		BG_EvaluateTrajectory( &es->pos, t, lastPos );

		smoke = CG_SmokePuff( lastPos, up, 
					  wi->trailRadius, 
					  1, 1, 1, 0.33f,
					  wi->wiTrailTime, 
					  t,
					  0,
					  0, 
					  cgs.media.nailPuffShader );
		// use the optimized local entity add
		smoke->leType = LE_SCALE_FADE;
	}

}
#endif

/*
==========================
CG_PlasmaTrail
==========================
*/
static void CG_PlasmaTrail( centity_t *cent, const weaponInfo_t *wi ) {
	localEntity_t	*le;
	refEntity_t		*re;
	entityState_t	*es;
	vec3_t			velocity, xvelocity, origin;
//	vec3_t			offset, xoffset;
	vec3_t			v[3];
	vec3_t			angles;

	float	waterScale = 1.0f;

	if ( cg_noProjectileTrail.integer || cg_oldPlasma.integer ) {
		return;
	}

	es = &cent->currentState;

	BG_EvaluateTrajectory( &es->pos, cg.time, origin );

	le = CG_AllocLocalEntity();
	re = &le->refEntity;

	velocity[0] = 60 - 120 * crandom();
	velocity[1] = 40 - 80 * crandom();
	velocity[2] = 100 - 200 * crandom();

	le->leType = LE_MOVE_SCALE_FADE;
	le->leFlags = LEF_TUMBLE;
	le->leBounceSoundType = LEBS_NONE;
	le->leMarkType = LEMT_NONE;

	le->startTime = cg.time;
	le->endTime = le->startTime + 600;

	le->pos.trType = TR_GRAVITY;
	le->pos.trTime = cg.time;

	//--------------------------------------------------------
#ifdef USE_VR
	VR_get_cent_controller_angles( cent, angles, SideRIGHT );
	AnglesToAxis(cent->lerpAngles, v);
#else
	VectorCopy(cent->lerpAngles, angles);
	AnglesToAxis(cent->lerpAngles, v);

	offset[0] = 2;
	offset[1] = 2;
	offset[2] = 2;

	xoffset[0] = offset[0] * v[0][0] + offset[1] * v[1][0] + offset[2] * v[2][0];
	xoffset[1] = offset[0] * v[0][1] + offset[1] * v[1][1] + offset[2] * v[2][1];
	xoffset[2] = offset[0] * v[0][2] + offset[1] * v[1][2] + offset[2] * v[2][2];

	VectorAdd(origin, xoffset, re->origin);
#endif

	VectorCopy( re->origin, le->pos.trBase );

	if ( CG_PointContents( re->origin, -1 ) & CONTENTS_WATER ) {
		waterScale = 0.10f;
	}

	xvelocity[0] = velocity[0] * v[0][0] + velocity[1] * v[1][0] + velocity[2] * v[2][0];
	xvelocity[1] = velocity[0] * v[0][1] + velocity[1] * v[1][1] + velocity[2] * v[2][1];
	xvelocity[2] = velocity[0] * v[0][2] + velocity[1] * v[1][2] + velocity[2] * v[2][2];
	VectorScale( xvelocity, waterScale, le->pos.trDelta );

	AxisCopy( axisDefault, re->axis );
	
	if ( intShaderTime )
		re->u.intShaderTime = cg.time;
	else
		re->u.shaderTime = cg.time / 1000.0f;

	re->reType = RT_SPRITE;
	re->radius = 0.25f;
	re->customShader = cgs.media.railRingsShader;
	le->bounceFactor = 0.3f;

	re->shaderRGBA[0] = wi->flashDlightColor[0] * 63;
	re->shaderRGBA[1] = wi->flashDlightColor[1] * 63;
	re->shaderRGBA[2] = wi->flashDlightColor[2] * 63;
	re->shaderRGBA[3] = 63;

	le->color[0] = wi->flashDlightColor[0] * 0.2;
	le->color[1] = wi->flashDlightColor[1] * 0.2;
	le->color[2] = wi->flashDlightColor[2] * 0.2;
	le->color[3] = 0.25f;

	le->angles.trType = TR_LINEAR;
	le->angles.trTime = cg.time;
	le->angles.trBase[0] = rand()&31;
	le->angles.trBase[1] = rand()&31;
	le->angles.trBase[2] = rand()&31;
	le->angles.trDelta[0] = 1;
	le->angles.trDelta[1] = 0.5;
	le->angles.trDelta[2] = 0;
}


/*
==========================
CG_GrappleTrail
==========================
*/
void CG_GrappleTrail( centity_t *ent, const weaponInfo_t *wi ) {
	vec3_t	origin;
	entityState_t	*es;
	vec3_t			forward, up;
	refEntity_t		beam;

	es = &ent->currentState;

	BG_EvaluateTrajectory( &es->pos, cg.time, origin );
	ent->trailTime = cg.time;

	memset( &beam, 0, sizeof( beam ) );
	
#ifdef USE_VR_QVM
	// VR client
	if ( cg.vr_controller_type )
	{
		// adjust muzzle position
		VectorCopy(cg.predictedPlayerState.right_muzzle_position, beam.origin);
	}
	else
#endif
	// not VR client
	{
		//FIXME adjust for muzzle position
		VectorCopy(cg_entities[ent->currentState.otherEntityNum].lerpOrigin, beam.origin);
		beam.origin[2] += 26;
		AngleVectors(cg_entities[ent->currentState.otherEntityNum].lerpAngles, forward, NULL, up);
		VectorMA(beam.origin, -6, up, beam.origin);
	}

	VectorCopy( origin, beam.oldorigin );

	if (Distance( beam.origin, beam.oldorigin ) < 64 )
		return; // Don't draw if close

	//beam.reType = RT_LIGHTNING;
	//beam.customShader = cgs.media.lightningShader;
	
	// quake live grapple rope :
	beam.reType = RT_LASERSIGHT;
	beam.customShader = cgs.media.ropeShader;

	beam.radius = 4;

	AxisClear( beam.axis );
	beam.shaderRGBA[0] = 0xff;
	beam.shaderRGBA[1] = 0xff;
	beam.shaderRGBA[2] = 0xff;
	beam.shaderRGBA[3] = 0xff;
	trap_R_AddRefEntityToScene( &beam );
}

/*
==========================
CG_GrenadeTrail
==========================
*/
static void CG_GrenadeTrail( centity_t *ent, const weaponInfo_t *wi ) {
	CG_RocketTrail( ent, wi );
}


/*
=================
CG_RegisterWeapon

The server says this item is used on this level
=================
*/
void CG_RegisterWeapon( int weaponNum ) {
	weaponInfo_t	*weaponInfo;
	gitem_t			*item, *ammo;
	char			path[MAX_QPATH];
	vec3_t			mins, maxs;
	int				i;

	weaponInfo = &cg_weapons[weaponNum];

	if ( weaponNum == 0 ) {
		return;
	}

	if ( weaponInfo->registered ) {
		return;
	}

	memset( weaponInfo, 0, sizeof( *weaponInfo ) );
	weaponInfo->registered = qtrue;

	for ( item = bg_itemlist + 1 ; item->classname ; item++ ) {
		if ( item->giType == IT_WEAPON && item->giTag == weaponNum ) {
			weaponInfo->item = item;
			break;
		}
	}
	if ( !item->classname ) {
		CG_Error( "Couldn't find weapon %i", weaponNum );
	}
	CG_RegisterItemVisuals( item - bg_itemlist );

	// load cmodel before model so filecache works
	weaponInfo->weaponModel = trap_R_RegisterModel( item->world_model[0] );

	// calc midpoint for rotation
	trap_R_ModelBounds( weaponInfo->weaponModel, mins, maxs );
	for ( i = 0 ; i < 3 ; i++ ) {
		weaponInfo->weaponMidpoint[i] = mins[i] + 0.5 * ( maxs[i] - mins[i] );
	}

	weaponInfo->weaponIcon = trap_R_RegisterShader( item->icon );
	weaponInfo->ammoIcon = trap_R_RegisterShader( item->icon );

	for ( ammo = bg_itemlist + 1 ; ammo->classname ; ammo++ ) {
		if ( ammo->giType == IT_AMMO && ammo->giTag == weaponNum ) {
			break;
		}
	}
	if ( ammo->classname && ammo->world_model[0] ) {
		weaponInfo->ammoModel = trap_R_RegisterModel( ammo->world_model[0] );
	}

	COM_StripExtension( item->world_model[0], path, sizeof(path) );
	Q_strcat( path, sizeof(path), "_flash.md3" );
	weaponInfo->flashModel = trap_R_RegisterModel( path );

	COM_StripExtension( item->world_model[0], path, sizeof(path) );
	Q_strcat( path, sizeof(path), "_barrel.md3" );
	weaponInfo->barrelModel = trap_R_RegisterModel( path );

	COM_StripExtension( item->world_model[0], path, sizeof(path) );
	Q_strcat( path, sizeof(path), "_hand.md3" );
	weaponInfo->handsModel = trap_R_RegisterModel( path );

	if ( !weaponInfo->handsModel ) {
		weaponInfo->handsModel = trap_R_RegisterModel( "models/weapons2/shotgun/shotgun_hand.md3" );
	}

	weaponInfo->loopFireSound = qfalse;
#ifdef USE_LASER_SIGHT
	cgs.media.laserBeamShader = trap_R_RegisterShader( "laserbeam" );//TODO find me a better place
#endif
	switch ( weaponNum ) {
	case WP_GAUNTLET:
		MAKERGB( weaponInfo->flashDlightColor, 0.6f, 0.6f, 1.0f );
		weaponInfo->firingSound = trap_S_RegisterSound( "sound/weapons/melee/fstrun.wav", qfalse );
		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/melee/fstatck.wav", qfalse );
		break;

	case WP_LIGHTNING:
		MAKERGB( weaponInfo->flashDlightColor, 0.6f, 0.6f, 1.0f );
		weaponInfo->readySound = trap_S_RegisterSound( "sound/weapons/melee/fsthum.wav", qfalse );
		weaponInfo->firingSound = trap_S_RegisterSound( "sound/weapons/lightning/lg_hum.wav", qfalse );
		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/lightning/lg_fire.wav", qfalse );
		
#ifdef USE_VR
		if (trap_Cvar_VariableValue("demoversion") != 0.0f)
			cgs.media.lightningShader = trap_R_RegisterShader("lightningBolt");
		else
#endif
			cgs.media.lightningShader = trap_R_RegisterShader("lightningBoltNew");

		cgs.media.lightningExplosionModel = trap_R_RegisterModel( "models/weaphits/crackle.md3" );
		cgs.media.sfx_lghit1 = trap_S_RegisterSound( "sound/weapons/lightning/lg_hit.wav", qfalse );
		cgs.media.sfx_lghit2 = trap_S_RegisterSound( "sound/weapons/lightning/lg_hit2.wav", qfalse );
		cgs.media.sfx_lghit3 = trap_S_RegisterSound( "sound/weapons/lightning/lg_hit3.wav", qfalse );

		break;
#ifdef USE_GRAPPLING_HOOK
	case WP_GRAPPLING_HOOK:
		MAKERGB( weaponInfo->flashDlightColor, 0.6f, 0.6f, 1.0f );
		weaponInfo->missileTrailFunc = CG_GrappleTrail;

		//weaponInfo->missileDlight = HOOK_GLOW_RADIUS;
		//weaponInfo->wiTrailTime = 2000;
		//weaponInfo->trailRadius = 64;

		/* // q3A version :
		weaponInfo->missileModel = trap_R_RegisterModel( "models/ammo/rocket/rocket.md3" );
		weaponInfo->missileDlight = HOOK_GLOW_RADIUS;
		weaponInfo->wiTrailTime = 2000;
		weaponInfo->trailRadius = 64;
		MAKERGB( weaponInfo->missileDlightColor, 1, 0.75f, 0 );
		weaponInfo->readySound = trap_S_RegisterSound( "sound/weapons/melee/fsthum.wav", qfalse );
		weaponInfo->firingSound = trap_S_RegisterSound( "sound/weapons/melee/fstrun.wav", qfalse );
		*/

		weaponInfo->missileModel	= trap_R_RegisterModel( "models/weapons2/grapple/grapple_barrel.md3" );//openArena
		//weaponInfo->missileModel	= trap_R_RegisterModel( "models/weapons2/grapple_ql/grapple_hook.md3" );//ql
		cgs.media.ropeShader		= trap_R_RegisterShader("grapplingChain");//quake live
		//cgs.media.ropeShader		= trap_R_RegisterShader( "rope" );//test rope
		weaponInfo->firingSound = trap_S_RegisterSound( "models/weapons2/grapple/rsths13_fishingreel_22_mono.wav" , qfalse );
		break;
#endif

#ifdef MISSIONPACK
	case WP_CHAINGUN:
		weaponInfo->firingSound = trap_S_RegisterSound( "sound/weapons/vulcan/wvulfire.wav", qfalse );
		weaponInfo->loopFireSound = qtrue;
		MAKERGB( weaponInfo->flashDlightColor, 1, 1, 0 );
		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/vulcan/vulcanf1b.wav", qfalse );
		weaponInfo->flashSound[1] = trap_S_RegisterSound( "sound/weapons/vulcan/vulcanf2b.wav", qfalse );
		weaponInfo->flashSound[2] = trap_S_RegisterSound( "sound/weapons/vulcan/vulcanf3b.wav", qfalse );
		weaponInfo->flashSound[3] = trap_S_RegisterSound( "sound/weapons/vulcan/vulcanf4b.wav", qfalse );
		weaponInfo->ejectBrassFunc = CG_MachineGunEjectBrass;
		cgs.media.bulletExplosionShader = trap_R_RegisterShader( "bulletExplosion" );
		break;
#endif

	case WP_MACHINEGUN:
		MAKERGB( weaponInfo->flashDlightColor, 1, 1, 0 );
		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/machinegun/machgf1b.wav", qfalse );
		weaponInfo->flashSound[1] = trap_S_RegisterSound( "sound/weapons/machinegun/machgf2b.wav", qfalse );
		weaponInfo->flashSound[2] = trap_S_RegisterSound( "sound/weapons/machinegun/machgf3b.wav", qfalse );
		weaponInfo->flashSound[3] = trap_S_RegisterSound( "sound/weapons/machinegun/machgf4b.wav", qfalse );
		weaponInfo->ejectBrassFunc = CG_MachineGunEjectBrass;
		cgs.media.bulletExplosionShader = trap_R_RegisterShader( "bulletExplosion" );
		break;

	case WP_SHOTGUN:
		MAKERGB( weaponInfo->flashDlightColor, 1, 1, 0 );
		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/shotgun/sshotf1b.wav", qfalse );
		weaponInfo->ejectBrassFunc = CG_ShotgunEjectBrass;
		break;

	case WP_ROCKET_LAUNCHER:
		weaponInfo->missileModel = trap_R_RegisterModel( "models/ammo/rocket/rocket.md3" );
		weaponInfo->missileSound = trap_S_RegisterSound( "sound/weapons/rocket/rockfly.wav", qfalse );
		weaponInfo->missileTrailFunc = CG_RocketTrail;
		weaponInfo->missileDlight = MISSILE_GLOW_RADIUS;
		weaponInfo->wiTrailTime = 2000;
		weaponInfo->trailRadius = 64;
		
		MAKERGB( weaponInfo->missileDlightColor, 1, 0.75f, 0 );
		MAKERGB( weaponInfo->flashDlightColor, 1, 0.75f, 0 );

		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/rocket/rocklf1a.wav", qfalse );
		cgs.media.rocketExplosionShader = trap_R_RegisterShader( "rocketExplosion" );
		break;

#ifdef MISSIONPACK
	case WP_PROX_LAUNCHER:
		weaponInfo->missileModel = trap_R_RegisterModel( "models/weaphits/proxmine.md3" );
		weaponInfo->missileTrailFunc = CG_GrenadeTrail;
		weaponInfo->wiTrailTime = 700;
		weaponInfo->trailRadius = 32;
		MAKERGB( weaponInfo->flashDlightColor, 1, 0.70f, 0 );
		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/proxmine/wstbfire.wav", qfalse );
		cgs.media.grenadeExplosionShader = trap_R_RegisterShader( "grenadeExplosion" );
		break;
#endif

	case WP_GRENADE_LAUNCHER:
		weaponInfo->missileModel = trap_R_RegisterModel( "models/ammo/grenade1.md3" );
		weaponInfo->missileTrailFunc = CG_GrenadeTrail;
		weaponInfo->wiTrailTime = 700;
		weaponInfo->trailRadius = 32;
		MAKERGB( weaponInfo->flashDlightColor, 1, 0.70f, 0 );
		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/grenade/grenlf1a.wav", qfalse );
		cgs.media.grenadeExplosionShader = trap_R_RegisterShader( "grenadeExplosion" );
		break;

#ifdef MISSIONPACK
	case WP_NAILGUN:
		weaponInfo->ejectBrassFunc = CG_NailgunEjectBrass;
		weaponInfo->missileTrailFunc = CG_NailTrail;
//		weaponInfo->missileSound = trap_S_RegisterSound( "sound/weapons/nailgun/wnalflit.wav", qfalse );
		weaponInfo->trailRadius = 16;
		weaponInfo->wiTrailTime = 250;
		weaponInfo->missileModel = trap_R_RegisterModel( "models/weaphits/nail.md3" );
		MAKERGB( weaponInfo->flashDlightColor, 1, 0.75f, 0 );
		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/nailgun/wnalfire.wav", qfalse );
		break;
#endif

	case WP_PLASMAGUN:
//		weaponInfo->missileModel = cgs.media.invulnerabilityPowerupModel;
		weaponInfo->missileTrailFunc = CG_PlasmaTrail;
		weaponInfo->missileSound = trap_S_RegisterSound( "sound/weapons/plasma/lasfly.wav", qfalse );

		// plasmagun dlight
		weaponInfo->missileDlight = MISSILE_GLOW_RADIUS;
		MAKERGB( weaponInfo->missileDlightColor, 0.2f, 0.2f, 1.0f );

		MAKERGB( weaponInfo->flashDlightColor, 0.6f, 0.6f, 1.0f );
		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/plasma/hyprbf1a.wav", qfalse );
		cgs.media.plasmaExplosionShader = trap_R_RegisterShader( "plasmaExplosion" );
		cgs.media.railRingsShader = trap_R_RegisterShader( "railDisc" );
		break;

	case WP_RAILGUN:
		weaponInfo->readySound = trap_S_RegisterSound( "sound/weapons/railgun/rg_hum.wav", qfalse );
		MAKERGB( weaponInfo->flashDlightColor, 1, 0.5f, 0 );
		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/railgun/railgf1a.wav", qfalse );
		cgs.media.railExplosionShader = trap_R_RegisterShader( "railExplosion" );
		cgs.media.railRingsShader = trap_R_RegisterShader( "railDisc" );
		cgs.media.railCoreShader = trap_R_RegisterShader( "railCore" );
		break;

	case WP_BFG:
		weaponInfo->readySound = trap_S_RegisterSound( "sound/weapons/bfg/bfg_hum.wav", qfalse );

		// bfg dlight
		weaponInfo->missileDlight = MISSILE_GLOW_RADIUS;
		MAKERGB( weaponInfo->missileDlightColor, 0.2f, 1.0f, 0.2f );

		MAKERGB( weaponInfo->flashDlightColor, 1.0f, 0.7f, 1.0f );
		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/bfg/bfg_fire.wav", qfalse );
		cgs.media.bfgExplosionShader = trap_R_RegisterShader( "bfgExplosion" );
		weaponInfo->missileModel = trap_R_RegisterModel( "models/weaphits/bfg.md3" );
		weaponInfo->missileSound = trap_S_RegisterSound( "sound/weapons/rocket/rockfly.wav", qfalse );
		break;

	default:
		MAKERGB( weaponInfo->flashDlightColor, 1, 1, 1 );
		weaponInfo->flashSound[0] = trap_S_RegisterSound( "sound/weapons/rocket/rocklf1a.wav", qfalse );
		break;
	}
}

/*
=================
CG_RegisterItemVisuals

The server says this item is used on this level
=================
*/
void CG_RegisterItemVisuals( int itemNum ) {
	itemInfo_t		*itemInfo;
	gitem_t			*item;

	if ( itemNum < 0 || itemNum >= bg_numItems ) {
		CG_Error( "CG_RegisterItemVisuals: itemNum %d out of range [0-%d]", itemNum, bg_numItems-1 );
	}

	itemInfo = &cg_items[ itemNum ];
	if ( itemInfo->registered ) {
		return;
	}

	item = &bg_itemlist[ itemNum ];

	memset( itemInfo, 0, sizeof( *itemInfo ) );
	itemInfo->registered = qtrue;

	itemInfo->models[0] = trap_R_RegisterModel( item->world_model[0] );

	itemInfo->icon = trap_R_RegisterShader( item->icon );

	// try to register depth-fragment shaders
	if ( cg.clientFrame == 0 && cg.skipDFshaders ) {
		itemInfo->icon_df = 0;
	} else {
		itemInfo->icon_df = trap_R_RegisterShader( va( "%s_df", item->icon ) );
	}

	if ( !itemInfo->icon_df ) {
		itemInfo->icon_df = itemInfo->icon;
		if ( cg.clientFrame == 0 ) {
			cg.skipDFshaders = qtrue; // skip all further tries to avoid shader debug mesages in 1.32c during map loading
		} else {
			cg.skipDFshaders = qfalse;
		}
	} else {
		cg.skipDFshaders = qfalse;
	}

	if ( item->giType == IT_WEAPON ) {
		CG_RegisterWeapon( item->giTag );
	}

	//
	// powerups have an accompanying ring or sphere
	//
	if ( item->giType == IT_POWERUP || item->giType == IT_HEALTH || 
		item->giType == IT_ARMOR || item->giType == IT_HOLDABLE ) {
		if ( item->world_model[1] ) {
			itemInfo->models[1] = trap_R_RegisterModel( item->world_model[1] );
		}
	}
}


/*
========================================================================================

VIEW WEAPON

========================================================================================
*/

/*
=================
CG_MapTorsoToWeaponFrame

=================
*/
static int CG_MapTorsoToWeaponFrame( const clientInfo_t *ci, int frame ) {

	// change weapon
	if ( frame >= ci->animations[TORSO_DROP].firstFrame 
		&& frame < ci->animations[TORSO_DROP].firstFrame + 9 ) {
		return frame - ci->animations[TORSO_DROP].firstFrame + 6;
	}

	// stand attack
	if ( frame >= ci->animations[TORSO_ATTACK].firstFrame 
		&& frame < ci->animations[TORSO_ATTACK].firstFrame + 6 ) {
		return 1 + frame - ci->animations[TORSO_ATTACK].firstFrame;
	}

	// stand attack 2
	if ( frame >= ci->animations[TORSO_ATTACK2].firstFrame 
		&& frame < ci->animations[TORSO_ATTACK2].firstFrame + 6 ) {
		return 1 + frame - ci->animations[TORSO_ATTACK2].firstFrame;
	}
	
	return 0;
}


/*
==============
CG_CalculateWeaponPosition
==============
*/
void CG_CalculateWeaponPosition( vec3_t origin, vec3_t angles ) {
	float	scale;
	int		delta;
	float	fracsin;

	VectorCopy( cg.refdef.vieworg, origin );

#ifdef USE_VR_QVM
	if ( cg.vr_controller_type ) {
		//VectorCopy( cg.predictedPlayerState.right_hand_angles, angles );
		VectorCopy( cg.refdefVR_RightAngles, angles );
	}
	else
#endif
	VectorCopy( cg.refdefViewAngles, angles );

	// on odd legs, invert some angles
	if ( cg.bobcycle & 1 ) {
		scale = -cg.xyspeed;
	} else {
		scale = cg.xyspeed;
	}

	// gun angles from bobbing
#if 0 // this is from ioq3Quest
	if ( cg_weaponbob.value != 0 )
	{
		angles[ROLL] += scale * cg.bobfracsin * 0.005;
		angles[YAW] += scale * cg.bobfracsin * 0.01;
		angles[PITCH] += cg.xyspeed * cg.bobfracsin * 0.005;
	}
#endif

	// drop the weapon when landing
	delta = cg.time - cg.landTime;
	if ( delta < LAND_DEFLECT_TIME ) {
		origin[2] += cg.landChange*0.25 * delta / LAND_DEFLECT_TIME;
	} else if ( delta < LAND_DEFLECT_TIME + LAND_RETURN_TIME ) {
		origin[2] += cg.landChange*0.25 * 
			(LAND_DEFLECT_TIME + LAND_RETURN_TIME - delta) / LAND_RETURN_TIME;
	}

#if 0
	// drop the weapon when stair climbing
	delta = cg.time - cg.stepTime;
	if ( delta < STEP_TIME/2 ) {
		origin[2] -= cg.stepChange*0.25 * delta / (STEP_TIME/2);
	} else if ( delta < STEP_TIME ) {
		origin[2] -= cg.stepChange*0.25 * (STEP_TIME - delta) / (STEP_TIME/2);
	}
#endif

	// idle drift
	scale = cg.xyspeed + 40;
	fracsin = sin( ( cg.time % TMOD_1000 ) * 0.001 );
	angles[ROLL] += scale * fracsin * 0.01;
	angles[YAW] += scale * fracsin * 0.01;
	angles[PITCH] += scale * fracsin * 0.01;
}


/*
===============
CG_LightningBolt

Origin will be the exact tag point, which is slightly
different than the muzzle point used for determining hits.
The cent should be the non-predicted cent if it is from the player,
so the endpoint will reflect the simulated strike (lagging the predicted
angle)
===============
*/
static void CG_LightningBolt( centity_t *cent, vec3_t origin ) {
	trace_t		trace;
	refEntity_t	beam;
	vec3_t		forward;
	vec3_t		muzzlePoint, endPoint;
	int			anim;
	qboolean	directView;
	qboolean	myself;
	int			vr_controller_type;
	vec3_t		rightAngles;
	vec3_t		refdefAngles;

	if (cent->currentState.weapon != WP_LIGHTNING) {
		return;
	}

	if (cent->pe.lightningFiring) {
		return;
	}

	memset(&beam, 0, sizeof(beam));

	myself = cent->currentState.number == cg.predictedPlayerState.clientNum;

	vr_controller_type = VR_get_cent_controller_type( cent );

#ifndef USE_VR
	VectorCopy(cent->lerpAngles, rightAngles);
	VectorCopy(cg.refdefViewAngles, refdefAngles);
#else
	VR_get_cent_controller_angles( cent, rightAngles, SideRIGHT );
	VectorCopy(cg.refdefVR_RightAngles, refdefAngles);
#endif

#ifdef USE_VR
	if ( vr_controller_type ) {
		// VR client
		if ( myself ) {
			directView = qtrue;
			if ( vr_controller_type >= 2 ) {
				vec3_t angle;
				CG_CalculateWeaponPosition_VR_6Dof( muzzlePoint, angle );
				AngleVectors( angle, forward, NULL, NULL );
			} else {
#ifdef USE_VR_QVM
				VectorCopy(cg.predictedPlayerState.right_muzzle_position, muzzlePoint);
#endif
#ifdef USE_NATIVE_HACK
				VectorCopy(vrinfo->ray_origin, muzzlePoint);
#endif
			}
		} else {
			// not myself
			directView = qfalse;
#ifdef USE_VR_QVM
			VectorCopy(cent->currentState.rmpos.trBase, muzzlePoint);
#endif
#ifdef USE_NATIVE_HACK
			VectorCopy(vrinfo->ray_origin, muzzlePoint);
#endif
		}
	} else
#endif // USE_VR_QVM
	{
		// not VR client
		if ( !cg.renderingThirdPerson && myself ) {
			directView = qtrue;
			VectorCopy(cg.refdef.vieworg, muzzlePoint);
		}
		else {
			directView = qfalse;

			//--------------------------
			// !CPMA
			//AngleVectors(cent->lerpAngles, forward, NULL, NULL); // from ioq3Quest
			//--------------------------

			VectorCopy(cent->lerpOrigin, muzzlePoint);
			anim = cent->currentState.legsAnim & ~ANIM_TOGGLEBIT;
			if ( anim == LEGS_WALKCR || anim == LEGS_IDLECR ) {
#ifdef USE_VR
				muzzlePoint[2] += cg.heightCrouch;
#else
				muzzlePoint[2] += CROUCH_VIEWHEIGHT;
#endif
			}
			else {
#ifdef USE_VR
				muzzlePoint[2] += cg.heightStand;
#else
				muzzlePoint[2] += DEFAULT_VIEWHEIGHT;
#endif
			}
		}
	}

	// CPMA  "true" lightning
	if ( directView && cg_trueLightning.value ) {
		vec3_t angle;
		int i;
		float a;

		for (i = 0; i < 3; i++) {
			a = rightAngles[i] - refdefAngles[i];


			if (a > 180) {
				a -= 360;
			}
			if (a < -180) {
				a += 360;
			}

			angle[i] = refdefAngles[i] + a * (1.0 - cg_trueLightning.value);

			if (angle[i] < 0) {
				angle[i] += 360;
			}
			if (angle[i] > 360) {
				angle[i] -= 360;
			}
		}

		AngleVectors( angle, forward, NULL, NULL );
	}
	else { // !CPMA
		AngleVectors( rightAngles, forward, NULL, NULL );
	}

	VectorMA( muzzlePoint, 14, forward, muzzlePoint );

	// project forward by the lightning range
	VectorMA( muzzlePoint, LIGHTNING_RANGE, forward, endPoint );

	// see if it hit a wall
	CG_Trace( &trace, muzzlePoint, vec3_origin, vec3_origin, endPoint, 
		cent->currentState.number, MASK_SHOT );

	// this is the endpoint
	VectorCopy( trace.endpos, beam.oldorigin );

	// use the provided origin, even though it may be slightly
	// different than the muzzle origin
	VectorCopy( origin, beam.origin );

	beam.reType = RT_LIGHTNING;
	beam.customShader = cgs.media.lightningShader;
	trap_R_AddRefEntityToScene( &beam );

	// add the impact flare if it hit something
	if ( trace.fraction < 1.0 ) {
		vec3_t	angles;
		vec3_t	dir;

		VectorSubtract( beam.oldorigin, beam.origin, dir );
		VectorNormalize( dir );

		memset(&beam, 0, sizeof(beam));
		beam.hModel = cgs.media.lightningExplosionModel;

		VectorMA( trace.endpos, -16, dir, beam.origin );

		// make a random orientation
		angles[0] = rand() % 360;
		angles[1] = rand() % 360;
		angles[2] = rand() % 360;
		AnglesToAxis( angles, beam.axis );
		trap_R_AddRefEntityToScene( &beam );
	}
}


/*
===============
CG_SpawnRailTrail

Origin will be the exact tag point, which is slightly
different than the muzzle point used for determining hits.
===============
*/
static void CG_SpawnRailTrail( centity_t *cent, vec3_t origin ) {
	clientInfo_t	*ci;

	if ( cent->currentState.weapon != WP_RAILGUN ) {
		return;
	}
	if ( !cent->pe.railgunFlash ) {
		return;
	}
	cent->pe.railgunFlash = qtrue;
	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
	CG_RailTrail( ci, origin, cent->pe.railgunImpact );
}


/*
======================
CG_MachinegunSpinAngle
======================
*/
#define		SPIN_SPEED	0.9
#define		COAST_TIME	1000
static float	CG_MachinegunSpinAngle( centity_t *cent ) {
	int		delta;
	float	angle;
	float	speed;

	delta = cg.time - cent->pe.barrelTime;
	if ( cent->pe.barrelSpinning ) {
		angle = cent->pe.barrelAngle + delta * SPIN_SPEED;
	} else {
		if ( delta > COAST_TIME ) {
			delta = COAST_TIME;
		}

		speed = 0.5 * ( SPIN_SPEED + (float)( COAST_TIME - delta ) / COAST_TIME );
		angle = cent->pe.barrelAngle + delta * speed;
	}

	if ( cent->pe.barrelSpinning == !(cent->currentState.eFlags & EF_FIRING) ) {
		cent->pe.barrelTime = cg.time;
		cent->pe.barrelAngle = AngleMod( angle );
		cent->pe.barrelSpinning = !!(cent->currentState.eFlags & EF_FIRING);
#ifdef MISSIONPACK
		if ( cent->currentState.weapon == WP_CHAINGUN && !cent->pe.barrelSpinning ) {
			trap_S_StartSound( NULL, cent->currentState.number, CHAN_WEAPON, trap_S_RegisterSound( "sound/weapons/vulcan/wvulwind.wav", qfalse ) );
		}
#endif
	}

	return angle;
}


/*
========================
CG_AddWeaponWithPowerups
========================
*/
static void CG_AddWeaponWithPowerups( refEntity_t *gun, int powerups ) {
	// add powerup effects
	if ( powerups & ( 1 << PW_INVIS ) ) {
		gun->customShader = cgs.media.invisShader;
		trap_R_AddRefEntityToScene( gun );
	} else {
		trap_R_AddRefEntityToScene( gun );
		
		if ( powerups & ( 1 << PW_BATTLESUIT ) ) {
			gun->customShader = cgs.media.battleWeaponShader;
			trap_R_AddRefEntityToScene( gun );
		}
		if ( powerups & ( 1 << PW_QUAD ) ) {
			gun->customShader = cgs.media.quadWeaponShader;
			trap_R_AddRefEntityToScene( gun );
		}
	}
}


/*
=============
CG_AddPlayerWeapon

Used for both the view weapon (ps is valid) and the world modelother character models (ps is NULL)
The main player will have this called for BOTH cases, so effects like light and
sound should only be done on the world model case.
=============
*/
void CG_AddPlayerWeapon( refEntity_t *parent, playerState_t *ps, centity_t *cent, int team, refEntity_t *gun ) {
	refEntity_t		barrel;
	refEntity_t		flash;
	vec3_t			angles;
	weapon_t		weaponNum;
	weaponInfo_t	*weapon;
	centity_t		*nonPredictedCent;
	qboolean 		show_flash;
	qboolean 		mySelf;
	qboolean 		grapple_firing;
	vec3_t 			vr_controller_axis[3];
	const			clientInfo_t	*ci;
	int 			radius;
	vec3_t			gun_delta_axis;
	int				renderfx;
	int				vrFlags;

	qboolean directView;
#ifdef USE_LASER_SIGHT
	qboolean laserNeeded;
#endif
#ifdef USE_WEAPON_WHEEL
	qboolean weapon_select;
#endif

	mySelf = (cent->currentState.number == cg.predictedPlayerState.clientNum);
	vrFlags = VR_get_ps_vrFlags( ps, mySelf );

#ifdef USE_WEAPON_WHEEL
	weapon_select = (vrFlags & EF_WEAPON_WHEEL);
#endif


/*
#ifdef USE_WEAPON_WHEEL
#ifdef USE_NATIVE_HACK
	weapon_select = vrinf_o->weapon_select;
#endif
#ifdef USE_VR_QVM
	if ( mySelf )
		weapon_select = (cg.predictedPlayerState.vrFlags & EF_WEAPON_WHEEL);
	else
		weapon_select = (ps && (ps->vrFlags & EF_WEAPON_WHEEL));
#endif
#endif*/

	//weapon_select = VR_get_weapon_select(ps, cent);

	ci = &cgs.clientinfo[ cent->currentState.clientNum ];

	weaponNum = cent->currentState.weapon;
	CG_RegisterWeapon( weaponNum );
	weapon = &cg_weapons[weaponNum];

	directView = (!ps && !cg.renderingThirdPerson) || cg.renderingThirdPerson;

	//=============================
	// add the weapon
	//=============================
	VectorCopy( parent->lightingOrigin, gun->lightingOrigin );
	gun->shadowPlane = parent->shadowPlane;

	renderfx = parent->renderfx;

	gun->renderfx = renderfx;

	// set custom shading for railgun refire rate
	if ( ps ) {
		if ( cg.predictedPlayerState.weapon == WP_RAILGUN
			&& cg.predictedPlayerState.weaponstate == WEAPON_FIRING ) {
			float	f;
			f = ( 1.0f - ((float)cg.predictedPlayerState.weaponTime / 1500.0f) );//q3e
			//int scale = 255 * (cg.time - cent->pe.railFireTime) / 1500;
			gun->shaderRGBA[0] = 255 * ci->color1[0] * f; // optimized, to try : ( ci->color1[0] * f ) >> 8
			gun->shaderRGBA[1] = 255 * ci->color1[1] * f;
			gun->shaderRGBA[2] = 255 * ci->color1[2] * f;
		} else {
			gun->shaderRGBA[0] = 255 * ci->color1[0];
			gun->shaderRGBA[1] = 255 * ci->color1[1];
			gun->shaderRGBA[2] = 255 * ci->color1[2];
			if ( gun->shaderRGBA[1] < 64 )
				gun->shaderRGBA[1] = 64;
		}
		gun->shaderRGBA[3] = 255;
	}

	gun->hModel = weapon->weaponModel;
	if ( !gun->hModel ) {
		return;
	}

	if ( !ps ) {
		// add weapon ready sound
		cent->pe.lightningFiring = qfalse;
		if ( (cent->currentState.eFlags & EF_FIRING) && weapon->firingSound ) {
			// lightning gun and gauntlet make a different sound when fire is held down
			trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, weapon->firingSound );
			cent->pe.lightningFiring = qtrue;
		}
		else if ( weapon->readySound ) {
			trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, weapon->readySound );
		}
	}

	// =========================================================
	// We now have weapon origin and axis
	// ( gun->origin & gun->axis )
	// =========================================================
#ifdef USE_VR
	if ( cg.vr_controller_type >= 2 )
	{
		orientation_t lerped;
		trap_R_LerpTag( &lerped, parent->hModel, parent->oldframe, parent->frame,
			1.0 - parent->backlerp, "tag_weapon" );
		VectorCopy( parent->origin, gun->origin );

		VectorMA( gun->origin, lerped.origin[0], parent->axis[0], gun->origin );

		// Make weapon appear left-handed for 2 and centered for 3
		if (ps && cg_drawGun.integer == 2)
			VectorMA( gun->origin, -lerped.origin[1], parent->axis[1], gun->origin );
		else if (!ps || cg_drawGun.integer != 3)
			VectorMA( gun->origin, lerped.origin[1], parent->axis[1], gun->origin );

		VectorMA( gun->origin, lerped.origin[2], parent->axis[2], gun->origin );

		MatrixMultiply( lerped.axis, ((refEntity_t *)parent)->axis, gun->axis );
	}

	// copy infos in our structures, overwright the axis (from cg_player.c) who only contained the ROLL axis when 3DOF
	if ( mySelf ) {
		//VectorCopy( gun->origin, client_weapon.origin ); // no more used, keep it cause it could be usefull
		AxisCopy( gun->axis, client_weapon.axis );
	}

	gun->backlerp = parent->backlerp;
#else
	CG_PositionEntityOnTag( gun, parent, parent->hModel, "tag_weapon" );
#endif

#ifdef USE_WEAPON_WHEEL
	if ( weapon_select && directView )
		CG_DrawWeaponSelector( cent );

	if ( !weapon_select )
#endif
		CG_AddWeaponWithPowerups( gun, cent->currentState.powerups );

	//=============================
	// make sure we aren't looking at cg.predictedPlayerEntity for LG
	nonPredictedCent = &cg_entities[cent->currentState.number];

	// if the index of the nonPredictedCent is not the same as the clientNum
	// then this is a fake player (like on the single player podiums), so
	// go ahead and use the cent
	if ( (nonPredictedCent - cg_entities) != cent->currentState.clientNum ) {
		nonPredictedCent = cent;
	}

	//=============================
	// add the spinning barrel
	//=============================
	if ( weapon->barrelModel && !weapon_select ) {
		// no barrel if weapon is grapplingHook and it's firing: this makes the grapple disappear when launched
#ifdef USE_GRAPPLING_HOOK
		// detect if grapple had been fire
		grapple_firing = (( weaponNum == WP_GRAPPLING_HOOK ) && (nonPredictedCent->currentState.eFlags & EF_FIRING));
#else
		grapple_firing = qfalse;
#endif

		if ( !grapple_firing ) {
			memset( &barrel, 0, sizeof(barrel) );
			VectorCopy( parent->lightingOrigin, barrel.lightingOrigin );
			barrel.shadowPlane = parent->shadowPlane;
			barrel.renderfx = renderfx;

			barrel.hModel = weapon->barrelModel;
			angles[YAW] = 0;
			angles[PITCH] = 0;
			angles[ROLL] = CG_MachinegunSpinAngle(cent);
			AnglesToAxis(angles, barrel.axis);

			CG_PositionRotatedEntityOnTag( &barrel, gun, weapon->weaponModel, "tag_barrel" );

			CG_AddWeaponWithPowerups( &barrel, cent->currentState.powerups );
		}
	}

	//=============================
	// add the flash
	//=============================
	memset(&flash, 0, sizeof(flash));
	flash.hModel = weapon->flashModel;
	if (!flash.hModel) {//if there is no weapon muzzle
		if ( mySelf) {
			VectorCopy( gun->origin, client_weapon.muzzle );//not tested
		}
		return;
	}

	// fixme: quick fix, or the lightning gun always appeared
	if ( (weaponNum == WP_LIGHTNING) && !(nonPredictedCent->currentState.eFlags & EF_FIRING) )
		return;

	// no continuous flash with grappling hook
	if ( ( weaponNum == WP_LIGHTNING || weaponNum == WP_GAUNTLET /*|| weaponNum == WP_GRAPPLING_HOOK*/)
		&& ( nonPredictedCent->currentState.eFlags & EF_FIRING) )
	{
		// continuous flash
		show_flash = qtrue;
	} else {
		// impulse flash
		show_flash = qtrue;
		if ( cg.time - cent->muzzleFlashTime > MUZZLE_FLASH_TIME ) {
			show_flash = qfalse;
		}
	}

	if ( show_flash ) {
		VectorCopy( parent->lightingOrigin, flash.lightingOrigin );
		flash.shadowPlane = parent->shadowPlane;
		flash.renderfx = renderfx;

		angles[YAW] = 0;
		angles[PITCH] = 0;
		angles[ROLL] = crandom() * 10;
		AnglesToAxis( angles, flash.axis );

		// colorize the railgun blast
		if ( weaponNum == WP_RAILGUN ) {
			flash.shaderRGBA[0] = 255 * ci->color1[0];
			flash.shaderRGBA[1] = 255 * ci->color1[1];
			flash.shaderRGBA[2] = 255 * ci->color1[2];
			flash.shaderRGBA[3] = 255;
		}
	}

	CG_PositionRotatedEntityOnTag( &flash, gun, weapon->weaponModel, "tag_flash" );

	//=========================================================
	//=   We now have the weapon muzzle point: flash.origin   =
	//=========================================================
#ifdef USE_VR
	if ( mySelf && cg.vr_controller_type ) {
		VectorCopy(flash.origin, client_weapon.muzzle);
	}
#endif

#ifdef USE_NATIVE_HACK
	if ( mySelf && cg.vr_controller_type == 1 ) {
		VectorCopy(client_weapon.axis[0], client_weapon.vr_controller_3axis_smooth);// GUNNM needed ?
	}
#endif

	if ( mySelf && (ps || cg.renderingThirdPerson) )
	{
		if ( cg.vr_controller_type /*== 1*/ )
		{
			if (cg.refdefVR_RightAngles[0] != 0.0f) {
				AnglesToAxis(cg.refdefVR_RightAngles, vr_controller_axis);
				VectorSubtract(gun->axis[0], vr_controller_axis[0], gun_delta_axis);
			}
			// keep in client_weapon struct for later use
			AnglesToAxis(cg.refdefVR_RightAngles, vr_controller_axis);
			VectorAdd(vr_controller_axis[0], gun_delta_axis, client_weapon.vr_controller_3axis_smooth);
		}

		//===================================
		// send laser beam origin and angles to client
		// in order to fire from weapon muzzle point in 'game' VM
		// and for intersection with virtual menu (cursor)
		//===================================
#ifdef USE_NATIVE_HACK
		// keep laser beam origin
		VectorScale(flash.origin, 1000.0f, vrinfo->ray_origin);

		// keep laser beam orientation
		if (cent->currentState.eFlags & EF_TALK)
			VectorCopy(gun->axis[0], vrinfo->ray_orientation);
#endif
#ifdef USE_VR_QVM
		// keep laser beam origin
		trap_VR_keepRightMuzzlePos( (int)(flash.origin[0] * 1000.0f), (int)(flash.origin[1] * 1000.0f), (int)(flash.origin[2] * 1000.0f) );

		// keep laser beam orientation
		if (cent->currentState.eFlags & EF_TALK)
			trap_VR_KeepRightAngles(gun->axis[0]);
#endif
	} // myself

#ifdef USE_LASER_SIGHT
	//===================================
	//		Draw the laser beam
	//===================================
	laserNeeded = CG_LaserNeeded( cent, qfalse );

	if ( laserNeeded && mySelf && cg.vr_controller_type ) {
		if ( cg.renderingThirdPerson  )
			laserNeeded = qtrue;
		else if ( !ps && !cg.renderingThirdPerson )
			laserNeeded = qfalse;
	}

	if ( laserNeeded )
	{
		trace_t trace;
		static qboolean lb_init = qfalse;
		static byte		client_beam_RGBA[4];
		byte			colour[4];
		vec3_t 			ctrl_axis;
		vec3_t 			endpos;
#ifdef USE_VR_QVM
		char 			lbStabstr[1];
		qboolean 		laserBeamStabilized;
		trap_Cvar_VariableStringBuffer("laserBeamStabilized", lbStabstr, sizeof(lbStabstr));
		laserBeamStabilized = atof(lbStabstr);
		if ( laserBeamStabilized && mySelf )
			VectorCopy(client_weapon.vr_controller_3axis_smooth, ctrl_axis);
		else
#endif
			VectorCopy(gun->axis[PITCH], ctrl_axis);

		//=============================
		// find the target point
		// (endpoint of the laser beam)
		//=============================
		// in menu, the endpoint is the menu plane depth
		if ((cent->currentState.eFlags & EF_TALK) && mySelf && cgs.cursorZ != 0)
			VectorMA(client_weapon.muzzle, cgs.cursorZ, ctrl_axis, endpos);
		else
			VectorMA(client_weapon.muzzle, /*maxdist*/4096, ctrl_axis, endpos);

		CG_Trace(&trace, client_weapon.muzzle, NULL, NULL, endpos, cg.predictedPlayerState.clientNum, MASK_SOLID);

		if ( mySelf ) {
			if (!lb_init) {
				char *laserBeamRGBA = "";
				trap_Cvar_VariableStringBuffer("laserBeamRGBA", laserBeamRGBA, sizeof(char) * 9);
				hex_to_color( laserBeamRGBA, client_beam_RGBA );
				lb_init = qtrue;
			}
		} else {
			memcpy(client_beam_RGBA, ci->c3RGBA, sizeof(client_beam_RGBA));
			// TODO check other players laser color in multiplayer game
		}

		memcpy(colour, client_beam_RGBA, sizeof(colour) );

		if ( cg_debugWeaponAiming.integer ) {
			if ( !ps ) {
				colour[0] = 0x00;
				colour[1] = 0xff;
				colour[2] = 0xff;
				colour[3] = 0xff;
			}
		}

		CG_LaserSight(client_weapon.muzzle, trace.endpos, colour, 1.0f);
	}
#endif // USE_LASER_SIGHT

	if ( show_flash )
		trap_R_AddRefEntityToScene( &flash );

	if ( ps || cg.renderingThirdPerson || !mySelf ) {

		// add lightning bolt
		CG_LightningBolt( nonPredictedCent, flash.origin );

		// add rail trail
		CG_SpawnRailTrail( cent, flash.origin );

		// use our own muzzle point as dlight origin 
		// and put it a bit closer to vieworigin to avoid bad normals near walls
		if ( ps && cent->currentState.number == cg.predictedPlayerState.clientNum ) {
			vec3_t	start, end, muzzle, forward, up;
			trace_t	tr;
			AngleVectors( cg.refdefViewAngles, forward, NULL, up );
			VectorMA( cg.refdef.vieworg, 14, forward, muzzle );
			if ( weaponNum == WP_LIGHTNING )
				VectorMA( muzzle, -8, up, muzzle );
			else
				VectorMA( muzzle, -6, up, muzzle );
			VectorMA( cg.refdef.vieworg, 14, forward, start );
			VectorMA( cg.refdef.vieworg, 28, forward, end );
			CG_Trace( &tr, start, NULL, NULL, end, cent->currentState.number, MASK_SHOT | CONTENTS_TRANSLUCENT );
			if ( tr.fraction != 1.0 ) {
				VectorMA( muzzle, -13.0 * ( 1.0 - tr.fraction ), forward, flash.origin );
			} else {
				VectorCopy( muzzle, flash.origin );
			}
		}

		if ( !show_flash )
			return;

		if ( weaponNum == WP_MACHINEGUN ) // make it a bit less annoying
			radius = MG_FLASH_RADIUS + (rand() & WEAPON_FLASH_RADIUS_MOD);
		else
			radius = WEAPON_FLASH_RADIUS + (rand() & WEAPON_FLASH_RADIUS_MOD);

		if ( weapon->flashDlightColor[0] || weapon->flashDlightColor[1] || weapon->flashDlightColor[2] ) {
			trap_R_AddLightToScene( flash.origin, radius, 
				weapon->flashDlightColor[0], weapon->flashDlightColor[1], weapon->flashDlightColor[2] );
		}
	}
}


/*
==============
CG_AddViewWeapon

Add the weapon, flash and laser beam 
for the player's view (the 'fake FPS view')
==============
*/
void CG_AddViewWeapon( playerState_t *ps ) {
	refEntity_t			hand;
	centity_t			*cent;
	const clientInfo_t	*ci;
	const weaponInfo_t	*weapon;
	vec3_t				angles;
	refEntity_t			gun;
#ifndef USE_VR
	vec3_t				fovOffset;
#endif

#ifdef USE_VR
	float	scale;
	int vrFlags = VR_get_client_vrFlags();
	//int vrFlags = VR_get_anyPlayer_vrFlags( ps, qtrue );
#endif

#ifdef USE_VR_ZOOM
	qboolean weapon_zoomed;
	weapon_zoomed = (vrFlags & EF_WEAPON_ZOOM);
#endif

	if ( ps->persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
		return;
	}

	if ( ps->pm_type == PM_INTERMISSION ) {
		return;
	}

	// no gun if in third person view or a camera is active
	//if ( cg.renderingThirdPerson || cg.cameraMode) {
	if ( cg.renderingThirdPerson ) {
		return;
	}

	// don't draw if testing a gun model
	if ( cg.testGun ) {
		return;
	}

#ifdef USE_VR_ZOOM
	// do not draw weapon model with enabled weapon scope
	if ( weapon_zoomed ) {
		return;
	}
#endif

	// allow the gun to be completely removed
	if ( !cg_drawGun.integer ) {
		vec3_t origin;

		if ( cg.predictedPlayerState.eFlags & EF_FIRING ) {
			// special hack for lightning gun...
			VectorCopy( cg.refdef.vieworg, origin );
			VectorMA( origin, -8, cg.refdef.viewaxis[2], origin );
			CG_LightningBolt( &cg_entities[ps->clientNum], origin );
		}
		return;
	}

	// drop gun lower at higher fov
#ifndef USE_VR
	if ( cgs.fov > 90.0 ) {
		fovOffset[0] = 0;
		fovOffset[2] = -0.2 * ( cgs.fov - 90.0 );
	} else {
		// move gun forward at lowerer fov
		fovOffset[0] = -0.2 * ( cgs.fov - 90.0 );
		fovOffset[2] = 0;
	}
#endif

	cent = &cg.predictedPlayerEntity;

	CG_RegisterWeapon(ps->weapon);
	weapon = &cg_weapons[ps->weapon];

	memset(&hand, 0, sizeof(hand));
	memset(&gun, 0, sizeof(gun));

	// set up gun position
#ifdef USE_VR
	if ( cg.vr_controller_type == 1 )
		CG_CalculateWeaponPosition_VR_3Dof( &gun );
	else if ( cg.vr_controller_type >= 2 )
		CG_CalculateWeaponPosition_VR_6Dof( hand.origin, angles );
	else
#endif
		CG_CalculateWeaponPosition( hand.origin, angles );

#ifdef USE_VR
	if ( cg.vr_controller_type >= 2 )
	{
		//Scale / Move gun etc
		scale = 1.0f;
		if ( !( (cg.snap->ps.pm_flags & PMF_FOLLOW) && (vrFlags & EF_FM_FIRSTPERSON ) ))
		{
			char cvar_name[64];
			char weapon_adjustment[256];

			Com_sprintf(cvar_name, sizeof(cvar_name), "vr_weapon_adjustment_%i", ps->weapon);
			trap_Cvar_VariableStringBuffer(cvar_name, weapon_adjustment, 256);

			if (strlen(weapon_adjustment) > 0) {
				vec3_t offset;
				vec3_t adjust;
				vec3_t temp_offset;
				matrix4x4 m1, m2, m3;
				vec3_t zero;
				vec3_t forward, right, up;

				VectorClear(temp_offset);
				VectorClear(adjust);

				Q_sscanf(weapon_adjustment, "%f,%f,%f,%f,%f,%f,%f", &scale,
					&(temp_offset[0]), &(temp_offset[1]), &(temp_offset[2]),
					&(adjust[PITCH]), &(adjust[YAW]), &(adjust[ROLL]));
				VectorScale(temp_offset, scale, offset);

				if ( vrFlags & EF_LEFT_HANDED )
				{
					//yaw needs to go in the other direction as left handed model is reversed
					adjust[YAW] *= -1.0f;
				}

				//Adjust angles for weapon models that aren't aligned very well
				VectorClear(zero);
				Matrix4x4_CreateFromEntity(m1, angles, zero, 1.0);
				Matrix4x4_CreateFromEntity(m2, adjust, zero, 1.0);

				Matrix4x4_Concat(m3, m1, m2);

				Matrix4x4_ConvertToEntity(m3, angles, zero);

				//Now move weapon closer to proper origin
				AngleVectors(angles, forward, right, up);
				VectorMA(hand.origin, offset[2], forward, hand.origin);
				VectorMA(hand.origin, offset[1], up, hand.origin);

				if ( !(vrFlags & EF_LEFT_HANDED) ) {
					VectorMA(hand.origin, offset[0], right, hand.origin);
				} else {
					VectorMA(hand.origin, -offset[0], right, hand.origin);
				}
			}
		}
	}
#endif

#ifdef USE_VR
	VectorMA(hand.origin, cg_gun_x.value, cg.refdef.viewaxis[0], hand.origin);
	VectorMA(hand.origin, cg_gun_y.value, cg.refdef.viewaxis[1], hand.origin);
	VectorMA(hand.origin, cg_gun_z.value, cg.refdef.viewaxis[2], hand.origin);
#else
	VectorMA(hand.origin, (cg_gun_x.value + fovOffset[0]), cg.refdef.viewaxis[0], hand.origin);
	VectorMA(hand.origin, cg_gun_y.value, cg.refdef.viewaxis[1], hand.origin);
	VectorMA(hand.origin, (cg_gun_z.value + fovOffset[2]), cg.refdef.viewaxis[2], hand.origin);
#endif

	AnglesToAxis(angles, hand.axis);

	// map torso animations to weapon animations
	if ( cg_gun_frame.integer ) {
		// development tool
		hand.frame = hand.oldframe = cg_gun_frame.integer;
		hand.backlerp = 0;
	} else {
		// get clientinfo for animation map
		ci = &cgs.clientinfo[ cent->currentState.clientNum ];
		hand.frame = CG_MapTorsoToWeaponFrame( ci, cent->pe.torso.frame );
		hand.oldframe = CG_MapTorsoToWeaponFrame( ci, cent->pe.torso.oldFrame );
		hand.backlerp = cent->pe.torso.backlerp;
	}

	hand.hModel = weapon->handsModel;
	hand.renderfx = RF_FIRST_PERSON | RF_MINLIGHT;
#ifndef USE_VR
	if( !cg.vr_controller_type )
		hand.renderfx |= RF_DEPTHHACK;
#endif

	// add everything onto the hand
	CG_AddPlayerWeapon( &hand, ps, &cg.predictedPlayerEntity, ps->persistant[PERS_TEAM], &gun );
}

/*
==============================================================================

WEAPON SELECTION

==============================================================================
*/


/*
===================
CG_DrawWeaponSelect
===================
*/
#ifdef USE_NEOHUD
static void CG_DrawWeaponSelect(item_t *itm) {
	int			i;
	int			bits;
	int			count;
	int			weaponSelect;
	const char	*name;
	//float		*forecolor;
	float		*fadeColor;
	vec4_t		forecolor;

	char		buf[16];
	float		icoX, icoY;
	qhandle_t	shader;
	qboolean	SelectedColExist;
	rectangle_t r;
	item_t		ico;
	item_t		icoS;
	/*qboolean	showWeaponWheel;
#ifdef USE_WEAPON_WHEEL
#ifdef USE_NATIVE_HACK
	showWeaponWheel = vrinf_o->weapon_select;
#endif
#ifdef USE_VR_QVM
	// if ( mySelf )
	showWeaponWheel = (cg.predictedPlayerState.vrFlags & EF_WEAPON_WHEEL);
	//else
	//	showWeaponWheel = (cg.predictedPlayerState.vrFlags & EF_WEAPON_WHEEL);
#endif
	// don't display when weapon wheel is opened
	if ( showWeaponWheel ) {
		return;
	}
#endif // USE_WEAPON_WHEEL
	*/

	if ( cg_drawWeaponSelect.integer == 0 ) {
		return;
	}

	if ( !CG_HUDItemVisible(itm) ) {
		return;
	}

	// don't draw if dead or the scoreboard is being explicitly shown
	if ( cg.showScores || !cg.snap->ps.stats[STAT_HEALTH] > 0 ) {
		return;
	}

	ico = dyn_itemArray[IcoWeapList_idx];
	icoS = dyn_itemArray[IcoWeapListSel_idx];

	weaponSelect = abs(cg_drawWeaponSelect.integer);

	// color of text (ammo counters/selected name)
	HUD_color(itm, &itm->forecolor, &forecolor, colorWhite);

	fadeColor = CG_FadeColor(cg.weaponSelectTime, itm->time, forecolor);
	if ( !fadeColor ) {
		return;
	}

	trap_R_SetColor(fadeColor);

	// showing weapon select clears pickup item display, but not the blend blob
	cg.itemPickupTime = 0;

	// count the number of weapons owned
	bits = cg.snap->ps.stats[STAT_WEAPONS];
	count = 0;
	for ( i = WP_GAUNTLET; i < MAX_WEAPONS; i++ ) {
		if ( bits & (1 << i) ) {
			count++;
		}
	}

	// pos & size according to anchor & margins
	HUD_Update_Anchors(itm, &r);
	//CG_Update_Margin(itm, &r);

	// horizontal ammo counters
	if ( weaponSelect < 3 ) {
		icoX = itm->rect.x - count * icoS.rect.w * 0.5;
		icoY = itm->rect.y + cgs.screenYmin;
	}
	else {// vertical ammo counters
		icoX = itm->rect.x + cgs.screenXmin;
		//icoY = itm->rect.y - count * icoS.rect.h * 0.5;
		//CG_Update_Valign(itm, &r); // TODO

		if (itm->propFlags & PROP_VALIGN_TOP)
			icoY = itm->rect.y;
		else if (itm->propFlags & PROP_VALIGN_MIDDLE)
			icoY = itm->rect.y - count * icoS.rect.h * 0.5;
		else if (itm->propFlags & PROP_VALIGN_BOTTOM)
			icoY = itm->rect.y - count * icoS.rect.h;
	}

	r.x = icoX;
	r.y = icoY;
	r.w = count * icoS.rect.w;
	r.h = icoS.rect.h;

	HUD_Update_finalRect(itm, r.x, r.y, r.w, r.h);

	// is selected color defined in HUD file?
	SelectedColExist = (icoS.backcolor.colorflags & C_COLOR_RGBA);//TOOD use HUD_Getbackcolor

	shader = CG_HUDShader(&icoS, cgs.media.selectShader);

	for ( i = WP_GAUNTLET; i < MAX_WEAPONS; i++ ) {
		if ( !(bits & (1 << i)) ) {
			continue;
		}

		CG_RegisterWeapon(i);

		// draw weapon icon
		CG_DrawPic( icoX, icoY, ico.rect.w, ico.rect.h, cg_weapons[i].weaponIcon );

		// draw selection marker
		if ( i == cg.weaponSelect ) {

			if ( SelectedColExist ) {
				trap_R_SetColor(icoS.backcolor.color);
			}

			if ( icoS.param == 1 ) { // allow a better control of the selection mark
				CG_DrawPic( icoX + icoS.rect.x, icoY + icoS.rect.y, icoS.rect.w, icoS.rect.h, shader );
			}
			else {
				int icoSX = icoX - (icoS.rect.w - ico.rect.w) * 0.5f;
				int icoSY = icoY - (icoS.rect.h - ico.rect.h) * 0.5f;

				CG_DrawPic(icoSX, icoSY, icoS.rect.w, icoS.rect.h, shader);
			}

			if ( SelectedColExist ) {
				trap_R_SetColor(NULL);
			}
		}

		// no-ammo cross on top
		if ( !cg.snap->ps.ammo[i] ) {
			CG_DrawPic(icoX, icoY, ico.rect.w, ico.rect.h, cgs.media.noammoShader);
		}
		else if ( weaponSelect > 1 && cg.snap->ps.ammo[i] > 0 ) {
			item_t WpNameP = dyn_itemArray[WeapListSelName_idx];

			// ammo counter
			BG_sprintf(buf, "%i", cg.snap->ps.ammo[i]);

			if ( weaponSelect == 2 ) {
				// horizontal ammo counters
				CG_DrawString(icoX + ico.rect.w / 2, icoY - icoS.rect.h*0.5, buf, fadeColor,
					WpNameP.fontsize.w, WpNameP.fontsize.h, 0, WpNameP.text.styleflags);// DS_CENTER | DS_PROPORTIONAL );
			}
			else {
				// vertical ammo counters
				if ( icoS.param == 1 ) {
					int x = icoX + ico.rect.w;

					if ( WpNameP.text.styleflags & DS_RIGHT )
						x += (3 * WpNameP.fontsize.w);

					CG_DrawString( x, icoY + (ico.rect.h - WpNameP.fontsize.h) / 2, buf, fadeColor,
						WpNameP.fontsize.w, WpNameP.fontsize.h, 0, WpNameP.text.styleflags );// DS_RIGHT );
				}
				else {
					CG_DrawString( icoX + icoS.rect.w - 1 + (3 * WpNameP.fontsize.w), icoY + (ico.rect.h - WpNameP.fontsize.h) / 2, buf, fadeColor,
						WpNameP.fontsize.w, WpNameP.fontsize.h, 0, WpNameP.text.styleflags );// DS_RIGHT );
				}

			}
		}

		if ( weaponSelect < 3 )
			icoX += icoS.rect.w;
		else
			icoY += icoS.rect.h + itm->margin.top;
	}

	// draw selected weapon name
	if (cg_weapons[cg.weaponSelect].item && weaponSelect == 1) {
		name = cg_weapons[cg.weaponSelect].item->pickup_name;
		if ( name ) {
			item_t WpNameP = dyn_itemArray[WeapListSelName_idx];

			CG_DrawString( itm->rect.x, icoY - (WpNameP.fontsize.h + 6), name, fadeColor,
				WpNameP.fontsize.w, WpNameP.fontsize.h, 0, WpNameP.text.styleflags | DS_FORCE_COLOR );// DS_SHADOW | DS_PROPORTIONAL | DS_CENTER | DS_FORCE_COLOR);
		}
	}
	trap_R_SetColor( NULL );
}

// horizontal ammo
void CG_DrawWeaponSelect_H( item_t *itm ) {
	if (abs(cg_drawWeaponSelect.integer) < 3) {
		CG_DrawWeaponSelect(itm);
	}
}

// vertical ammo
void CG_DrawWeaponSelect_V( item_t *itm ) {
	if (abs(cg_drawWeaponSelect.integer) >= 3) {
		CG_DrawWeaponSelect(itm);
	}
}
#else
#define AMMO_FONT_SIZE 12
void CG_DrawWeaponSelect( void ) {
	int		i;
	int		bits;
	int		count;
	int		x, y;
	int		dx, dy;
	int		weaponSelect;
	const char *name;
	float	*color;
	char	buf[16];

	// don't display if dead
	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 || cg_drawWeaponSelect.integer == 0 ) {
		return;
	}

	if ( cg_drawWeaponSelect.integer < 0 ) {
		color = colorWhite;
	} else {
		color = CG_FadeColor( cg.weaponSelectTime, WEAPON_SELECT_TIME );
		if ( !color ) {
			return;
		}
	}
	trap_R_SetColor( color );

	weaponSelect = abs( cg_drawWeaponSelect.integer );

	// showing weapon select clears pickup item display, but not the blend blob
	cg.itemPickupTime = 0;

	// count the number of weapons owned
	bits = cg.snap->ps.stats[STAT_WEAPONS];
	count = 0;
	for ( i = WP_GAUNTLET; i < MAX_WEAPONS; i++ ) {
		if ( bits & (1 << i) ) {
			count++;
		}
	}

	if ( weaponSelect < 3 ) {
		x = 320 - count * 20;
		y = cgs.screenYmax + 1 - 100; // - STATUSBAR_HEIGHT - 40
		dx = 40;
		dy = 0;
	} else {
		x = cgs.screenXmin + 6;
		y = 240 - count * 20;
		dx = 0;
		dy = 40;
	}

	for ( i = WP_GAUNTLET; i < MAX_WEAPONS; i++ ) {
		if ( !(bits & (1 << i)) ) {
			continue;
		}

		CG_RegisterWeapon(i);

		// draw weapon icon
		CG_DrawPic( x, y, 32, 32, cg_weapons[i].weaponIcon );

		// draw selection marker
		if ( i == cg.weaponSelect ) {
			CG_DrawPic( x - 4, y - 4, 32 + 8, 32 + 8, cgs.media.selectShader );
		}

		// no ammo cross on top
		if ( !cg.snap->ps.ammo[i] ) {
			CG_DrawPic( x, y, 32, 32, cgs.media.noammoShader );
		}
		else if ( weaponSelect > 1 && cg.snap->ps.ammo[i] > 0 ) {
			// ammo counter
			BG_sprintf(buf, "%i", cg.snap->ps.ammo[i]);
			if ( weaponSelect == 2 ) {
				// horizontal ammo counters
				CG_DrawString( x + 32 / 2, y - 20, buf, color, AMMO_FONT_SIZE, AMMO_FONT_SIZE, 0, DS_CENTER | DS_PROPORTIONAL );
			}
			else {
				// vectical ammo counters
				CG_DrawString( x + 39 + (3 * AMMO_FONT_SIZE), y + (32 - AMMO_FONT_SIZE) / 2, buf, color, AMMO_FONT_SIZE, AMMO_FONT_SIZE, 0, DS_RIGHT );
			}
		}

		x += dx;
		y += dy;
	}

	// draw the selected name
	if ( cg_weapons[cg.weaponSelect].item && weaponSelect == 1 ) {
		name = cg_weapons[cg.weaponSelect].item->pickup_name;
		if ( name ) {
			CG_DrawString( 320, y - 22, name, color, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_PROPORTIONAL | DS_CENTER | DS_FORCE_COLOR );
		}
	}

	trap_R_SetColor( NULL );
}
#endif


/*
===============
CG_WeaponSelectable
===============
*/
static qboolean CG_WeaponSelectable( int i ) {
	if ( !cg.snap->ps.ammo[i] ) {
		return qfalse;
	}
	if ( ! (cg.snap->ps.stats[ STAT_WEAPONS ] & ( 1 << i ) ) ) {
		return qfalse;
	}

	return qtrue;
}


/*
===============
CG_NextWeapon_f
===============
*/
void CG_NextWeapon_f( void ) {
	int		i;
	int		original;

	if ( !cg.snap ) {
		return;
	}

	cg.weaponSelectTime = cg.time;

	if ( cg.snap->ps.pm_flags & PMF_FOLLOW || cg.demoPlayback ) {
		return;
	}

	original = cg.weaponSelect;

	for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
		cg.weaponSelect++;
		if ( cg.weaponSelect == MAX_WEAPONS ) {
			cg.weaponSelect = 0;
		}
		if ( cg.weaponSelect == WP_GAUNTLET && !cg.vr_controller_type ) {
			continue; // never cycle to gauntlet (except VR because of limited amount of buttons)
		}
		if ( CG_WeaponSelectable( cg.weaponSelect ) ) {
			break;
		}
	}
	if ( i == MAX_WEAPONS ) {
		cg.weaponSelect = original;
	}
}


/*
===============
CG_PrevWeapon_f
===============
*/
void CG_PrevWeapon_f( void ) {
	int		i;
	int		original;

	if ( !cg.snap ) {
		return;
	}

	cg.weaponSelectTime = cg.time;

	if ( cg.snap->ps.pm_flags & PMF_FOLLOW || cg.demoPlayback ) {
		return;
	}

	original = cg.weaponSelect;

	for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
		cg.weaponSelect--;
		if ( cg.weaponSelect == -1 ) {
			cg.weaponSelect = MAX_WEAPONS - 1;
		}
		if ( cg.weaponSelect == WP_GAUNTLET && !cg.vr_controller_type ) {
			continue; // never cycle to gauntlet, except in VR
		}
		if ( CG_WeaponSelectable( cg.weaponSelect ) ) {
			break;
		}
	}
	if ( i == MAX_WEAPONS ) {
		cg.weaponSelect = original;
	}
}


/*
===============
CG_Weapon_f
===============
*/
void CG_Weapon_f( void ) {
	int		num;

	if ( !cg.snap ) {
		return;
	}

	cg.weaponSelectTime = cg.time;

	if ( cg.snap->ps.pm_flags & PMF_FOLLOW || cg.demoPlayback ) {
		return;
	}

	num = atoi( CG_Argv( 1 ) );

	if ( num < 1 || num > MAX_WEAPONS-1 ) {
		return;
	}
#ifdef USE_VR
	if ( ! ( cg.snap->ps.stats[STAT_WEAPONS] & ( 1 << num ) ) ) {
		if ( num != WP_VR_CONTROLLER ) // VR Controller still selectable for the menu
			return;		// don't have the weapon
	}
#endif
	cg.weaponSelect = num;
}

#ifdef USE_WEAPON_WHEEL
//Selects the currently selected weapon (if one _is_ selected)
void CG_WeaponSelectorSelect_f(void)
{
	cg.weaponSelectorTime = 0;

	if (cg.weaponSelectorSelection == WP_NONE ||
		cg.weaponSelect == cg.weaponSelectorSelection)
	{
		return;
	}

	cg.weaponSelectTime = cg.time;
	cg.weaponSelect = cg.weaponSelectorSelection;
	cg.weaponSelectorSelection = WP_NONE;
}

void CG_DrawWeaponSelector( centity_t *cent )
{
	vec3_t controllerOrigin, controllerAngles, selectorOrigin;
	vec3_t wheelAngles, wheelOrigin, beamOrigin, wheelForward, wheelRight, wheelUp;

	const int selectorMode = (int)trap_Cvar_VariableValue("vr_weaponSelectorMode");

	float dist = 10.0f;
	float radius = 4.0f;// 4.0f;
	float scale = 0.05f;
	float frac;

	const int switchThumbsticks = (int)trap_Cvar_VariableValue("vr_switchThumbsticks");
	const int thumb = switchThumbsticks != 0 ? THUMB_LEFT : THUMB_RIGHT;
	
	float thumbstickValue;
	float thumbstickAxisX = 0.0f;
	float thumbstickAxisY = 0.0f;
	float a;
	float x = 0.0f;
	float y = 0.0f;
	float len;
	int weaponId;
	float weaponAngles;
	qboolean selected = qfalse;
	int angleIndex = 0;

#ifdef USE_VR
	vec3_t ctrlAngles, ctrlPos, ctrlOffset, HMDposition;
	// GUNNM TODO avoid the use of VR_get_client_xxx() functions,
	// if you want to show other players selector
	VR_get_cent_controller_angles( cent, ctrlAngles, SideRIGHT );
	VR_get_client_controller_position( SideRIGHT, ctrlPos);
	VR_get_client_controller_offset( SideRIGHT, ctrlOffset);
	VR_get_client_HMD_position( HMDposition ); 
#endif

	if ( cg.weaponSelectorTime == 0 ) {
		cg.weaponSelectorTime = cg.time;

#ifdef USE_NATIVE_HACK
		VectorCopy(ctrlAngles,   cg.weaponSelectorAngles);
		VectorCopy(ctrlPos, cg.weaponSelectorOrigin);
		VectorCopy(ctrlOffset, cg.weaponSelectorOffset);
#endif

#ifdef USE_VR_QVM
		VectorCopy(ctrlAngles, cg.weaponSelectorAngles);
		VectorCopy(ctrlPos, cg.weaponSelectorOrigin);
		VectorCopy(ctrlOffset, cg.weaponSelectorOffset);
#endif
	}

	if ( selectorMode == WS_HMD ) // HMD locked
	{
#ifdef USE_NATIVE_HACK
		VectorCopy(vrinfo->hmdinfo.angles.actual, cg.weaponSelectorAngles);
#else
		VectorCopy(cg.predictedPlayerState.viewangles, cg.weaponSelectorAngles);
#endif
		VectorCopy(HMDposition, cg.weaponSelectorOrigin);

		VectorClear(cg.weaponSelectorOffset);
		dist = (trap_Cvar_VariableValue("vr_hudDepth") + 3) * 3;
		radius = dist / 3.0f;
		scale = 0.04f + 0.01f * (trap_Cvar_VariableValue("vr_hudDepth") + 1);
	}

	frac = (cg.time - cg.weaponSelectorTime) / 100.0f;
	if (frac > 1.0f) frac = 1.0f;

	CG_CalculateWeaponPosition_VR_6Dof( controllerOrigin, controllerAngles );

	VectorSubtract(ctrlPos, cg.weaponSelectorOrigin, ctrlOffset);

	if ( selectorMode == WS_ROLL) {
#ifdef USE_NATIVE_HACK
		CG_CalculateVRPositionInWorld(ctrlPos/*, ctrlOffset*/, ctrlAngles, wheelOrigin, wheelAngles);
#else
		CG_CalculateVRPositionInWorld(ctrlPos/*, ctrlOffset*/, ctrlAngles, wheelOrigin, wheelAngles);
#endif
	}
	else {
		CG_CalculateVRPositionInWorld(cg.weaponSelectorOrigin/*, cg.weaponSelectorOffset*/, cg.weaponSelectorAngles, wheelOrigin, wheelAngles);
	}

	AngleVectors(wheelAngles, wheelForward, wheelRight, wheelUp);

	if (selectorMode == WS_CONTROLLER)
	{
		VectorCopy(controllerOrigin, wheelOrigin);
	}
	else
	{
		// Do not shift weapon wheel down in order to fit inside comfort vignette
		//VectorMA(wheelOrigin, -3.0f, wheelUp, wheelOrigin);
	}

	if ( cg.vr_controller_type == 1 && selectorMode == WS_ROLL) {
		VectorCopy(client_weapon.muzzle, wheelOrigin);
		dist = 1.0f;
	}

	VectorCopy(wheelOrigin, beamOrigin);
	VectorMA(wheelOrigin, (dist * ((selectorMode == WS_CONTROLLER) ? frac : 1.0f)), wheelForward, wheelOrigin);
	VectorCopy(wheelOrigin, selectorOrigin);

#ifdef USE_NATIVE_HACK
	a = atan2(vrinfo->thumbstick_location[thumb][0], vrinfo->thumbstick_location[thumb][1]);
	thumbstickValue = math_length(vrinfo->thumbstick_location[thumb][0], vrinfo->thumbstick_location[thumb][1]);
#else
	// GUNNM TODO thumbstick_location is not sent in snapshot at the moment
	a = 0.0f;
	thumbstickValue = 0.0f;
#endif

	if (thumbstickValue > 0.95f)
	{
		thumbstickAxisX = sinf(a) * 0.95f;
		thumbstickAxisY = cosf(a) * 0.95f;
	}

	if ( selectorMode == WS_CONTROLLER )
	{
		x = (sinf(DEG2RAD(wheelAngles[YAW] - controllerAngles[YAW])) / sinf(DEG2RAD(22.5f)));
		y = ((wheelAngles[PITCH] - controllerAngles[PITCH]) / 22.5f);

		len = math_length(x, y);
		if (len > 1.0f)
		{
			x *= (1.0f / len);
			y *= (1.0f / len);
		}
	}
	else //selectorMode == WS_HMD
	{
		x = thumbstickAxisX;
		y = thumbstickAxisY;
	}

	VectorMA(selectorOrigin, radius * x, wheelRight, selectorOrigin);
	VectorMA(selectorOrigin, radius * y, wheelUp, selectorOrigin);

	// Add the central sphere
	if ( selectorMode != WS_ROLL)
	{
		refEntity_t		blob;
		memset(&blob, 0, sizeof(blob));
		VectorCopy(selectorOrigin, blob.origin);
		AnglesToAxis(vec3_origin, blob.axis);
		VectorScale(blob.axis[0], scale - 0.01f, blob.axis[0]);
		VectorScale(blob.axis[1], scale - 0.01f, blob.axis[1]);
		VectorScale(blob.axis[2], scale - 0.01f, blob.axis[2]);
		blob.nonNormalizedAxes = qtrue;
		blob.hModel = cgs.media.smallSphereModel;
		trap_R_AddRefEntityToScene(&blob);
	}

#ifdef USE_LASER_SIGHT
	if ( selectorMode == WS_CONTROLLER )
	{
		byte colour[4];
		colour[0] = 0x00;
		colour[1] = 0x00;
		colour[2] = 0xff;
		colour[3] = 0x40;
		CG_LaserSight(beamOrigin, selectorOrigin, colour, 0.1f);
	}
#endif

	//===========================
	// draw a needle in center
	//===========================
	if ( selectorMode == WS_ROLL )
	{
		refEntity_t		needleSprite;
		float anglesCursor;
		vec3_t angles, iconOrigin, iconBackground, iconForeground;
		vec3_t forward, up;

		memset(&needleSprite, 0, sizeof(needleSprite));

		VectorClear(angles);
		angles[YAW]		= wheelAngles[YAW];
		angles[PITCH]	= wheelAngles[PITCH];
		angles[ROLL]	= ctrlAngles[ROLL];
		anglesCursor	= -angles[ROLL] * 4.0f;
		AngleVectors(angles, forward, NULL, up);

		VectorCopy(wheelOrigin, iconOrigin);
		VectorMA(iconOrigin, 0.2f, forward, iconBackground);
		VectorMA(iconOrigin, -0.2f, forward, iconForeground);
		VectorCopy(iconForeground, needleSprite.origin);
	
		needleSprite.rotation = anglesCursor;
		needleSprite.reType = RT_SPRITE;
		needleSprite.customShader = cgs.media.needle;
		needleSprite.radius = 3.0f;
		needleSprite.shaderRGBA[0] = 255;
		needleSprite.shaderRGBA[1] = 255;
		needleSprite.shaderRGBA[2] = 255;
		needleSprite.shaderRGBA[3] = 255;
		trap_R_AddRefEntityToScene(&needleSprite);
	}

	weaponAngles = 360 / (WP_NUM_WEAPONS - 2);

	for ( weaponId = WP_GAUNTLET; weaponId < WP_NUM_WEAPONS; ++weaponId )
	{
		float anglesCursor;

		if (weaponId == WP_VR_CONTROLLER)
			continue;

		//increment now we know we aren't looking at an invalid weapon id

		CG_RegisterWeapon(weaponId);

		{
			vec3_t angles, iconOrigin, iconBackground, iconForeground;
			vec3_t forward, up;
			qboolean selectable = CG_WeaponSelectable(weaponId) && cg.snap->ps.ammo[weaponId];

			//first calculate wheel slot position
			VectorClear(angles);
			angles[YAW]		= wheelAngles[YAW];
			angles[PITCH]	= wheelAngles[PITCH];
			angles[ROLL]	= weaponAngles * angleIndex;

			AngleVectors(angles, forward, NULL, up);

			VectorMA(wheelOrigin, (radius*frac), up, iconOrigin);
			VectorMA(iconOrigin, 0.2f, forward, iconBackground);
			VectorMA(iconOrigin, -0.2f, forward, iconForeground);

			if ( selectorMode == WS_CONTROLLER )
			{
				float length;
				vec3_t diff;
				VectorSubtract(selectorOrigin, iconOrigin, diff);
				length = VectorLength(diff);
				if ( length <= 1.4f && frac == 1.0f && selectable )
				{
					if ( cg.weaponSelectorSelection != weaponId )
					{
						cg.weaponSelectorSelection = weaponId;
#ifdef USE_HAPTIC
						trap_HapticEvent("selector_icon", 0, 0, 100, 0, 0);
#endif
					}
					selected = qtrue;
				}
			}
			if ( selectorMode == WS_ROLL ) {
				anglesCursor = (int)(ctrlAngles[ROLL] * 4.0f) % 360;

				if (anglesCursor < 0)
					anglesCursor = 360 + anglesCursor;

				if (anglesCursor >= angles[ROLL] - 5 && anglesCursor <= angles[ROLL] + 5) {
					if (cg.weaponSelectorSelection != weaponId)
					{
						sfxHandle_t wheelSound = trap_S_RegisterSound("sound/weapwheel/light_switch.wav", qtrue);

						cg.weaponSelectorSelection = weaponId;
#ifdef USE_HAPTIC
						trap_HapticEvent("selector_icon", 0, 0, 100, 0, 0);
#endif
						// Play a sound
						trap_S_StartSound(wheelOrigin, ENTITYNUM_NONE, CHAN_AUTO, wheelSound);
					}
				}
			}
			else
			{
				//For HMD selector, the weapon can be selected before the selector has finished
				//its opening animation, use angles to identify the selected weapon, rather than
				//the position of the selector pointer
				float angle = AngleNormalize360(RAD2DEG(a));
				float angle360 = angle + 360; // HACK - Account for the icon at the top
				float low = (((weaponAngles * (angleIndex - 1)) + (weaponAngles * angleIndex)) / 2.0f);
				float high = ((weaponAngles * angleIndex + (weaponAngles * (angleIndex + 1))) / 2.0f);

#ifdef USE_NATIVE_HACK
				if (((angle > low && angle <= high) || (angle360 > low && angle360 <= high)) &&
					(math_length(vrinfo->thumbstick_location[thumb][0], vrinfo->thumbstick_location[thumb][1]) > 0.5f) &&
					selectable)
#else
				// GUNNM TODO if thumbstick_location is sent
				if (//((angle > low && angle <= high) || (angle360 > low && angle360 <= high)) &&
					//(length(vrinfo->thumbstick_location[thumb][0], vrinfo->thumbstick_location[thumb][1]) > 0.5f) &&
					selectable)
#endif
				{
					if ( cg.weaponSelectorSelection != weaponId )
					{
						cg.weaponSelectorSelection = weaponId;
#ifdef USE_HAPTIC
						trap_HapticEvent("selector_icon", 0, 0, 100, 0, 0);
#endif
					}

					selected = qtrue;
				}
			}

			//===========================
			// Add the "selected" sprite
			//===========================
			if ( cg.weaponSelectorSelection == weaponId || (cg.weaponSelect == weaponId && !cg.weaponSelectorSelection))
			{
				refEntity_t		sprite;
				memset(&sprite, 0, sizeof(sprite));
				sprite.reType = RT_SPRITE;

				if ( selectorMode == WS_ROLL ) {
					VectorCopy(selectorOrigin, sprite.origin);
					//VectorMA(selectorOrigin, -1.4f, forward, sprite.origin);
					sprite.rotation = 180-angles[ROLL];

					if ( selectable ) {
						sprite.shaderRGBA[0] = 255;
						sprite.shaderRGBA[1] = 181;
						sprite.shaderRGBA[2] = 10;
						sprite.shaderRGBA[3] = 255;
						sprite.customShader = cgs.media.wheelHollow;
						cg.weaponSelectorSelection = weaponId; // select the weapon
					}
					else
					{
						sprite.shaderRGBA[0] = 200;
						sprite.shaderRGBA[1] = 200;
						sprite.shaderRGBA[2] = 200;
						sprite.shaderRGBA[3] =  50;
						sprite.customShader = cgs.media.timerSlices[1]; // 0 = slice_5 / 1 = slice_7 / 2 = slice_12 / 3 = slice_24
					}
					sprite.radius = radius + 1.8f;
				}
				else {
					VectorCopy(iconOrigin, sprite.origin);
					sprite.origin[2] += 2.5f + (0.5f * sinf(DEG2RAD(AngleNormalize360((cg.time - cg.weaponSelectorTime) / 4))));
					
					sprite.shaderRGBA[0] = 255;
					sprite.shaderRGBA[1] = 255;
					sprite.shaderRGBA[2] = 255;
					sprite.shaderRGBA[3] = 255;
					sprite.customShader = cgs.media.friendShader;
					sprite.radius = 0.5f;
				}
				trap_R_AddRefEntityToScene(&sprite);
			}

			//==================
			// 3D weapons icons
			//==================
			if ( !cg_weaponSelectorSimple2DIcons.integer )
			{
				refEntity_t ent;
				vec3_t iconAngles;
				float weaponScale;
				memset(&ent, 0, sizeof(ent));
				VectorCopy(iconOrigin, ent.origin);

				//Shift model a bit
				/*VectorMA(ent.origin,  0.3f, wheelForward, ent.origin);
				VectorMA(ent.origin, -0.2f, wheelRight, ent.origin);
				VectorMA(ent.origin,  0.1f, wheelUp, ent.origin);*/

				VectorCopy(wheelAngles, iconAngles);
				iconAngles[PITCH] = 10;
				iconAngles[YAW] -= 145.0f;

				if ( selectorMode == WS_ROLL)
					iconAngles[ROLL] = 0.0f;
				if ( weaponId == WP_GAUNTLET )
					iconAngles[ROLL] -= 90.0f;

				weaponScale = ((scale + 0.02f)*frac) + (cg.weaponSelectorSelection == weaponId ? 0.04f : 0);

				if (selectorMode == WS_ROLL)
					weaponScale = ((scale + 0.02f)*frac);

				AnglesToAxis(iconAngles, ent.axis);
				VectorScale(ent.axis[0], weaponScale, ent.axis[0]);
				VectorScale(ent.axis[1], weaponScale, ent.axis[1]);
				VectorScale(ent.axis[2], weaponScale, ent.axis[2]);
				ent.nonNormalizedAxes = qtrue;

				if (weaponId == WP_RAILGUN) {
					clientInfo_t *ci = &cgs.clientinfo[cg.predictedPlayerState.clientNum];
					if (cg.predictedPlayerState.weaponTime + 1500 > cg.time) {
						int scale = 255 * (cg.time - cg.predictedPlayerState.weaponTime) / 1500;
						ent.shaderRGBA[0] = (ci->c3RGBA[0] * scale) >> 8;
						ent.shaderRGBA[1] = (ci->c3RGBA[1] * scale) >> 8;
						ent.shaderRGBA[2] = (ci->c3RGBA[2] * scale) >> 8;
						ent.shaderRGBA[3] = 255;
					}
					else {
						Byte4Copy(ci->c3RGBA, ent.shaderRGBA);
					}
				}

				ent.hModel = cg_weapons[weaponId].weaponModel;
				if (!selectable)
				{
					ent.customShader = cgs.media.invisShader;
				}
				trap_R_AddRefEntityToScene(&ent);

				if (cg_weapons[weaponId].barrelModel)
				{
					vec3_t barrelAngles;
					refEntity_t barrel;
					memset(&barrel, 0, sizeof(barrel));
					barrel.hModel = cg_weapons[weaponId].barrelModel;
					
					VectorClear(barrelAngles);
					barrelAngles[ROLL] = AngleNormalize360((cg.time - cg.weaponSelectorTime) * 0.9f);
					AnglesToAxis(barrelAngles, barrel.axis);
					CG_PositionRotatedEntityOnTag(&barrel, &ent, cg_weapons[weaponId].weaponModel, "tag_barrel");
					if (!selectable)
					{
						barrel.customShader = cgs.media.invisShader;
					}
					trap_R_AddRefEntityToScene(&barrel);
				}
			}
			else
			{
				//==================
				// 2D weapons icons
				//==================
				float sRadius;
				refEntity_t		sprite;
				memset(&sprite, 0, sizeof(sprite));

				sRadius = 0.7f + (0.2f * (trap_Cvar_VariableValue("vr_hudDepth") - 1));

				VectorCopy(iconOrigin, sprite.origin);
				sprite.reType = RT_SPRITE;
				sprite.customShader = cg_weapons[weaponId].weaponIcon;
				sprite.radius = sRadius * 0.9f * (cg.weaponSelectorSelection == weaponId ? 1.1f : 1.0);
				sprite.shaderRGBA[0] = 255;
				sprite.shaderRGBA[1] = 255;
				sprite.shaderRGBA[2] = 255;
				sprite.shaderRGBA[3] = 255;
				trap_R_AddRefEntityToScene(&sprite);

				//And now the selection background
				memset(&sprite, 0, sizeof(sprite));
				VectorCopy(iconBackground, sprite.origin);
				sprite.reType = RT_SPRITE;
				sprite.customShader = cgs.media.selectShader;
				sprite.radius = sRadius * (cg.weaponSelectorSelection == weaponId ? 1.1f : 1.0);
				sprite.shaderRGBA[0] = 255;
				sprite.shaderRGBA[1] = 255;
				sprite.shaderRGBA[2] = 255;
				sprite.shaderRGBA[3] = 255;
				trap_R_AddRefEntityToScene(&sprite);

				if (!selectable)
				{
					memset(&sprite, 0, sizeof(sprite));
					VectorCopy(iconForeground, sprite.origin);
					sprite.reType = RT_SPRITE;
					sprite.customShader = cgs.media.noammoShader;
					sprite.radius = sRadius;
					sprite.shaderRGBA[0] = 255;
					sprite.shaderRGBA[1] = 255;
					sprite.shaderRGBA[2] = 255;
					sprite.shaderRGBA[3] = 255;
					trap_R_AddRefEntityToScene(&sprite);
				}
			}
		}
		++angleIndex;
	}

	//Only reset selection if using controller pointer
	if ( !selected && selectorMode == WS_CONTROLLER )
	{
		cg.weaponSelectorSelection = WP_NONE;
	}

#ifdef USE_NATIVE_HACK
	// In case was invoked by thumbstick axis and thumbstick is centered
	// select weapon (if any selected) and close the selector
	if ( vrinfo->weapon_select_autoclose && frac > 0.25f ) {
		if ( thumbstickValue < 0.1f ) {
			if ( selected ) {
				cg.weaponSelect = cg.weaponSelectorSelection;
			}
			vrinfo->weapon_select = qfalse;
			vrinfo->weapon_select_autoclose = qfalse;
			vrinfo->weapon_select_using_thumbstick = qfalse;
		}
	}
#endif
}
#endif
/*
===================
CG_OutOfAmmoChange

The current weapon has just run out of ammo
===================
*/
void CG_OutOfAmmoChange( void ) {
	int		i;

	cg.weaponSelectTime = cg.time;

	if ( cg.snap->ps.pm_flags & PMF_FOLLOW || cg.demoPlayback ) {
		return;
	}

	for ( i = MAX_WEAPONS-1 ; i > 0 ; i-- ) {
		if ( CG_WeaponSelectable( i ) ) {
			cg.weaponSelect = i;
			break;
		}
	}
}


/*
===================================================================================================

WEAPON EVENTS

===================================================================================================
*/

/*
================
CG_FireWeapon

Caused by an EV_FIRE_WEAPON event
================
*/
void CG_FireWeapon( centity_t *cent ) {
	entityState_t *ent;
	int				c;
	weaponInfo_t	*weap;

	ent = &cent->currentState;
	if ( ent->weapon == WP_NONE ) {
		return;
	}
	if ( ent->weapon >= WP_NUM_WEAPONS ) {
		CG_Error( "CG_FireWeapon: ent->weapon >= WP_NUM_WEAPONS" );
		return;
	}
	weap = &cg_weapons[ ent->weapon ];

	if ( ent->number >= 0 && ent->number < MAX_CLIENTS && cent != &cg.predictedPlayerEntity ) {
		// point from external event to client entity
		cent = &cg_entities[ ent->number ];
	}

	// mark the entity as muzzle flashing, so when it is added it will
	// append the flash to the weapon model
	cent->muzzleFlashTime = cg.time;

	// lightning gun only does this this on initial press
	if ( ent->weapon == WP_LIGHTNING ) {
		if ( cent->pe.lightningFiring ) {
			return;
		}
	}

	// play quad sound if needed
	if ( cent->currentState.powerups & ( 1 << PW_QUAD ) ) {
		trap_S_StartSound (NULL, cent->currentState.number, CHAN_ITEM, cgs.media.quadSound );
	}

	// play a sound
	for ( c = 0; c < ARRAY_LEN( weap->flashSound ); c++ ) {
		if ( !weap->flashSound[c] ) {
			break;
		}
	}
	if ( c > 0 ) {
		c = rand() % c;
		if ( weap->flashSound[c] )
		{
			trap_S_StartSound( NULL, ent->number, CHAN_WEAPON, weap->flashSound[c] );
		}
	}

	// do brass ejection
	if ( weap->ejectBrassFunc && cg_brassTime.integer > 0 ) {
		weap->ejectBrassFunc( cent );
	}

#ifdef USE_HAPTIC
	//Are we the player?
	if (cent->currentState.number == cg.predictedPlayerState.clientNum)
	{
		//int vrFlags = VR_get_anyPlayer_vrFlags( NULL, qtrue );
		int vrFlags = VR_get_client_vrFlags();
		qboolean weapon_stabilised = (vrFlags & EF_WEAPON_STABILISED);
		qboolean right_handed = (vrFlags & EF_LEFT_HANDED);

		int position = weapon_stabilised ? 4 : (right_handed ? 1 : 2);

		static int haptic_skip = 0;
		// This is to adjust the excessive fire rate of the plasma-gun/machine-gun, everything else fires slower (or has haptics that compensate)
		// so this will just fire every other time for the affected weapons
		++haptic_skip;

		//Haptics
		switch (ent->weapon) {
		case WP_GAUNTLET:
			trap_HapticEvent("chainsaw_fire", position, 0, 50, 0, 0);
			break;
		case WP_MACHINEGUN:
			if (haptic_skip & 1) {
				trap_HapticEvent("machinegun_fire", position, 0, 100, 0, 0);
			}
			break;
		case WP_SHOTGUN:
			trap_HapticEvent("shotgun_fire", position, 0, 100, 0, 0);
			break;
		case WP_GRENADE_LAUNCHER:
			trap_HapticEvent("handgrenade_fire", position, 0, 80, 0, 0);
			break;
		case WP_ROCKET_LAUNCHER:
			trap_HapticEvent("rocket_fire", position, 0, 100, 0, 0);
			break;
		case WP_LIGHTNING:
			trap_HapticEvent("RTCWQuest:fire_tesla", position, 0, 100, 0, 0);
			break;
		case WP_RAILGUN:
			trap_HapticEvent("RTCWQuest:fire_sniper", position, 0, 100, 0, 0);
			break;
		case WP_PLASMAGUN:
			if (haptic_skip & 1) {
				trap_HapticEvent("plasmagun_fire", position, 0, 100, 0, 0);
			}
			break;
		case WP_BFG:
			trap_HapticEvent("bfg_fire", position, 0, 100, 0, 0);
			break;
		case WP_GRAPPLING_HOOK:
			trap_HapticEvent("chainsaw_fire", position, 0, 100, 0, 0);
			break;
#ifdef MISSIONPACK
		case WP_NAILGUN:
			trap_HapticEvent("shotgun_fire", position, 0, 100, 0, 0);
			break;
		case WP_PROX_LAUNCHER:
			trap_HapticEvent("handgrenade_fire", position, 0, 100, 0, 0);
			break;
		case WP_CHAINGUN:
			if (haptic_skip & 1) {
				trap_HapticEvent("chaingun_fire", position, 0, 100, 0, 0);
			}
			break;
#endif
		}

	}
#endif
}


/*
=================
CG_MissileHitWall

Caused by an EV_MISSILE_MISS event, or directly by local bullet tracing
=================
*/
void CG_MissileHitWall( weapon_t weapon, int clientNum, vec3_t origin, vec3_t dir, impactSound_t soundType ) {
	qhandle_t		mod;
	qhandle_t		mark;
	qhandle_t		shader;
	sfxHandle_t		sfx;
	float			radius;
	float			light;
	vec3_t			lightColor;
	localEntity_t	*le;
	int				r;
	qboolean		alphaFade;
	qboolean		isSprite;
	int				duration;
	vec3_t			sprOrg;
	vec3_t			sprVel;

	mark = 0;
	radius = 32;
	sfx = 0;
	mod = 0;
	shader = 0;
	light = 0;
	lightColor[0] = 1;
	lightColor[1] = 1;
	lightColor[2] = 0;

	// set defaults
	isSprite = qfalse;
	duration = 600;

	switch ( weapon ) {
	default:
#ifdef MISSIONPACK
	case WP_NAILGUN:
		if( soundType == IMPACTSOUND_FLESH ) {
			sfx = cgs.media.sfx_nghitflesh;
		} else if( soundType == IMPACTSOUND_METAL ) {
			sfx = cgs.media.sfx_nghitmetal;
		} else {
			//sfx = cgs.media.sfx_nghit;// q3A
			sfx = cgs.sfx_nghitmetal;// I prefere it louder
		}
		mark = cgs.media.holeMarkShader;
		radius = 12;
		break;
#endif
	case WP_LIGHTNING:
		// no explosion at LG impact, it is added with the beam
		r = rand() & 3;
		if ( r < 2 ) {
			sfx = cgs.media.sfx_lghit2;
		} else if ( r == 2 ) {
			sfx = cgs.media.sfx_lghit1;
		} else {
			sfx = cgs.media.sfx_lghit3;
		}
		mark = cgs.media.holeMarkShader;
		radius = 12;
		break;
#ifdef MISSIONPACK
	case WP_PROX_LAUNCHER:
		mod = cgs.media.dishFlashModel;
		shader = cgs.media.grenadeExplosionShader;
		sfx = cgs.media.sfx_proxexp;
		mark = cgs.media.burnMarkShader;
		radius = 64;
		light = 300;
		isSprite = qtrue;
		break;
#endif

#ifdef USE_GRAPPLING_HOOK
	case WP_GRAPPLING_HOOK:
		if( soundType == IMPACTSOUND_FLESH ) {
			sfx = cgs.media.sfx_nghitflesh;
		} else if( soundType == IMPACTSOUND_METAL ) {
			sfx = cgs.media.sfx_nghitmetal;
		} else {
			//sfx = cgs.media.sfx_nghit;// q3A
			sfx = cgs.media.sfx_nghitmetal;// louder
		}
		mod = cgs.media.bulletFlashModel;
		shader = cgs.media.bulletExplosionShader;
		mark = cgs.media.bulletMarkShader;//cgs.media.holeMarkShader;
		radius = 4;
		break;
#endif

	case WP_GRENADE_LAUNCHER:
		mod = cgs.media.dishFlashModel;
		shader = cgs.media.grenadeExplosionShader;
		sfx = cgs.media.sfx_rockexp;
		mark = cgs.media.burnMarkShader;
		radius = 64;
		light = GL_EXPLOSION_RADIUS;
		isSprite = qtrue;
		break;
	case WP_ROCKET_LAUNCHER:
		mod = cgs.media.dishFlashModel;
		shader = cgs.media.rocketExplosionShader;
		sfx = cgs.media.sfx_rockexp;
		mark = cgs.media.burnMarkShader;
		radius = 64;
		light = RL_EXPLOSION_RADIUS;
		isSprite = qtrue;
		duration = 1000;
		lightColor[0] = 1.0;
		lightColor[1] = 0.75;
		lightColor[2] = 0.0;
		if (cg_oldRocket.integer == 0) {
			// explosion sprite animation
			VectorMA( origin, 24, dir, sprOrg );
			VectorScale( dir, 64, sprVel );

			CG_ParticleExplosion( "explode1", sprOrg, sprVel, 1400, 20, 30 );
		}
		break;
	case WP_RAILGUN:
		mod = cgs.media.ringFlashModel;
		shader = cgs.media.railExplosionShader;
		sfx = cgs.media.sfx_plasmaexp;
		mark = cgs.media.energyMarkShader;
		radius = 24;
		break;
	case WP_PLASMAGUN:
		mod = cgs.media.ringFlashModel;
		shader = cgs.media.plasmaExplosionShader;
		sfx = cgs.media.sfx_plasmaexp;
		mark = cgs.media.energyMarkShader;
		radius = 16;
		break;
	case WP_BFG:
		mod = cgs.media.dishFlashModel;
		shader = cgs.media.bfgExplosionShader;
		sfx = cgs.media.sfx_rockexp;
		mark = cgs.media.burnMarkShader;
		radius = 32;
		light = BFG_EXPLOSION_RADIUS;
		lightColor[0] = 0.2f;
		lightColor[1] = 1.0f;
		lightColor[2] = 0.2f;
		isSprite = qtrue;
		break;
	case WP_SHOTGUN:
		mod = cgs.media.bulletFlashModel;
		shader = cgs.media.bulletExplosionShader;
		mark = cgs.media.bulletMarkShader;
		sfx = 0;
		radius = 4;
		break;

#ifdef MISSIONPACK
	case WP_CHAINGUN:
		mod = cgs.media.bulletFlashModel;
		if( soundType == IMPACTSOUND_FLESH ) {
			sfx = cgs.media.sfx_chghitflesh;
		} else if( soundType == IMPACTSOUND_METAL ) {
			sfx = cgs.media.sfx_chghitmetal;
		} else {
			sfx = cgs.media.sfx_chghit;
		}
		mark = cgs.media.bulletMarkShader;

		r = rand() & 3;
		if ( r < 2 ) {
			sfx = cgs.media.sfx_ric1;
		} else if ( r == 2 ) {
			sfx = cgs.media.sfx_ric2;
		} else {
			sfx = cgs.media.sfx_ric3;
		}

		radius = 8;
		break;
#endif

	case WP_MACHINEGUN:
		mod = cgs.media.bulletFlashModel;
		shader = cgs.media.bulletExplosionShader;
		mark = cgs.media.bulletMarkShader;

		r = rand() & 3;
		if ( r == 0 ) {
			sfx = cgs.media.sfx_ric1;
		} else if ( r == 1 ) {
			sfx = cgs.media.sfx_ric2;
		} else {
			sfx = cgs.media.sfx_ric3;
		}

		radius = 8;
		break;
	}

	if ( sfx ) {
		trap_S_StartSound( origin, ENTITYNUM_WORLD, CHAN_AUTO, sfx );
	}

	//
	// create the explosion
	//
	if ( mod ) {
		le = CG_MakeExplosion( origin, dir, mod, shader, duration, isSprite );
		le->light = light;
		VectorCopy( lightColor, le->lightColor );
		if ( weapon == WP_RAILGUN ) {
			// colorize with client color
			VectorCopy( cgs.clientinfo[clientNum].color1, le->color );
			le->refEntity.shaderRGBA[0] = le->color[0] * 255;
			le->refEntity.shaderRGBA[1] = le->color[1] * 255;
			le->refEntity.shaderRGBA[2] = le->color[2] * 255;
			le->refEntity.shaderRGBA[3] = 255;
		}
	}

	//
	// impact mark
	//
	alphaFade = (mark == cgs.media.energyMarkShader);	// plasma fades alpha, all others fade color
	if ( weapon == WP_RAILGUN ) {
		float	*color;

		// colorize with client color
		color = cgs.clientinfo[ clientNum ].color1; // was color2

		CG_ImpactMark( mark, origin, dir, random()*360, color[0], color[1], color[2], 1.0, alphaFade, radius, qfalse );
	} else {
		CG_ImpactMark( mark, origin, dir, random()*360, 1.0, 1.0, 1.0, 1.0, alphaFade, radius, qfalse );
	}
}


/*
=================
CG_MissileHitPlayer
=================
*/
void CG_MissileHitPlayer( int weapon, vec3_t origin, vec3_t dir, int entityNum ) {
	CG_Bleed( origin, entityNum );

#ifdef USE_HAPTIC
	// GUNNM TODO detect 'mySelf' with non native QVM
	if ( entityNum == vrinfo->clientNum ) {
		trap_HapticEvent("fireball", 0, 0, 80, 0, 0);
	}
#endif

	// some weapons will make an explosion with the blood, while
	// others will just make the blood
	switch ( weapon ) {
	case WP_GRENADE_LAUNCHER:
	case WP_ROCKET_LAUNCHER:
	case WP_PLASMAGUN:
	case WP_BFG:
#ifdef USE_GRAPPLING_HOOK
	case WP_GRAPPLING_HOOK:
#endif
#ifdef MISSIONPACK
	case WP_NAILGUN:
	case WP_CHAINGUN:
	case WP_PROX_LAUNCHER:
#endif
		CG_MissileHitWall( weapon, 0, origin, dir, IMPACTSOUND_FLESH );
		break;
	default:
		break;
	}
}



/*
============================================================================

SHOTGUN TRACING

============================================================================
*/

/*
================
CG_ShotgunPellet
================
*/
static void CG_ShotgunPellet( vec3_t start, vec3_t end, int skipNum ) {
	trace_t		tr;
	int sourceContentType, destContentType;

	CG_Trace( &tr, start, NULL, NULL, end, skipNum, MASK_SHOT );

	sourceContentType = CG_PointContents( start, 0 );
	destContentType = CG_PointContents( tr.endpos, 0 );

	// FIXME: should probably move this cruft into CG_BubbleTrail
	if ( sourceContentType == destContentType ) {
		if ( sourceContentType & CONTENTS_WATER ) {
			CG_BubbleTrail( start, tr.endpos, 32 );
		}
	} else if ( sourceContentType & CONTENTS_WATER ) {
		trace_t trace;

		trap_CM_BoxTrace( &trace, end, start, NULL, NULL, 0, CONTENTS_WATER );
		CG_BubbleTrail( start, trace.endpos, 32 );
	} else if ( destContentType & CONTENTS_WATER ) {
		trace_t trace;

		trap_CM_BoxTrace( &trace, start, end, NULL, NULL, 0, CONTENTS_WATER );
		CG_BubbleTrail( tr.endpos, trace.endpos, 32 );
	}

	if (  tr.surfaceFlags & SURF_NOIMPACT ) {
		return;
	}

	if ( cg_entities[tr.entityNum].currentState.eType == ET_PLAYER ) {
		CG_MissileHitPlayer( WP_SHOTGUN, tr.endpos, tr.plane.normal, tr.entityNum );
	} else {
		if ( tr.surfaceFlags & SURF_NOIMPACT ) {
			// SURF_NOIMPACT will not make a flame puff or a mark
			return;
		}
		if ( tr.surfaceFlags & SURF_METALSTEPS ) {
			CG_MissileHitWall( WP_SHOTGUN, 0, tr.endpos, tr.plane.normal, IMPACTSOUND_METAL );
		} else {
			CG_MissileHitWall( WP_SHOTGUN, 0, tr.endpos, tr.plane.normal, IMPACTSOUND_DEFAULT );
		}
	}
}

/*
================
CG_ShotgunPattern

Perform the same traces the server did to locate the
hit splashes
================
*/
static void CG_ShotgunPattern( vec3_t origin, vec3_t origin2, int seed, int otherEntNum ) {
	int			i;
	float		r, u;
	vec3_t		end;
	vec3_t		forward, right, up;

	// derive the right and up vectors from the forward vector, because
	// the client won't have any other information
	VectorNormalize2( origin2, forward );
	PerpendicularVector( right, forward );
	CrossProduct( forward, right, up );

	// generate the "random" spread pattern
	for ( i = 0 ; i < DEFAULT_SHOTGUN_COUNT ; i++ ) {
		r = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
		u = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
		VectorMA( origin, 8192 * 16, forward, end);
		VectorMA (end, r, right, end);
		VectorMA (end, u, up, end);

		CG_ShotgunPellet( origin, end, otherEntNum );
	}
}

/*
==============
CG_ShotgunFire
==============
*/
void CG_ShotgunFire( entityState_t *es ) {
	vec3_t	v;
	int		contents;

	VectorSubtract( es->origin2, es->pos.trBase, v );
	VectorNormalize( v );
	VectorScale( v, 32, v );
	VectorAdd( es->pos.trBase, v, v );
	if ( cgs.glconfig.hardwareType != GLHW_RAGEPRO ) {
		// ragepro can't alpha fade, so don't even bother with smoke
		vec3_t			up;

		contents = CG_PointContents( es->pos.trBase, 0 );
		if ( !( contents & CONTENTS_WATER ) ) {
			VectorSet( up, 0, 0, 8 );
			CG_SmokePuff( v, up, 32, 1, 1, 1, 0.33f, 900, cg.time, 0, LEF_PUFF_DONT_SCALE, cgs.media.shotgunSmokePuffShader );
		}
	}
	CG_ShotgunPattern( es->pos.trBase, es->origin2, es->eventParm, es->otherEntityNum );
}

/*
============================================================================

BULLETS

============================================================================
*/


/*
===============
CG_Tracer
===============
*/
void CG_Tracer( vec3_t source, vec3_t dest ) {
	vec3_t		forward, right;
	polyVert_t	verts[4];
	vec3_t		line;
	float		len, begin, end;
	vec3_t		start, finish;
	vec3_t		midpoint;

	// tracer
	VectorSubtract( dest, source, forward );
	len = VectorNormalize( forward );

#ifdef USE_VR
	if ( cg.vr_controller_type ) {
		// start at muzzle point in VR
		begin = 0;
	}
	else
#endif
	{
		// non VR users have the fake FPS view, we have to
		// start at least a little ways from the muzzle
		if ( len < 100 ) {
			return;
		}
		begin = 50 + random() * (len - 60);
	}

	end = begin + cg_tracerLength.value;
	if ( end > len ) {
		end = len;
	}
	VectorMA( source, begin, forward, start );
	VectorMA( source, end, forward, finish );

#ifdef USE_VR
	if ( cg.vr_controller_type ) {
		line[0] = DotProduct(forward, client_weapon.axis[1]);
		line[1] = DotProduct(forward, client_weapon.axis[2]);

		VectorScale(client_weapon.axis[1], line[1], right);
		VectorMA(right, -line[0], client_weapon.axis[2], right);
	}
	else
#endif
	{
		line[0] = DotProduct( forward, cg.refdef.viewaxis[1] );
		line[1] = DotProduct( forward, cg.refdef.viewaxis[2] );

		VectorScale( cg.refdef.viewaxis[1], line[1], right );
		VectorMA( right, -line[0], cg.refdef.viewaxis[2], right );
	}

	VectorNormalize( right );

	VectorMA( finish, cg_tracerWidth.value, right, verts[0].xyz );
	verts[0].st[0] = 0;
	verts[0].st[1] = 1;
	verts[0].modulate[0] = 255;
	verts[0].modulate[1] = 255;
	verts[0].modulate[2] = 255;
	verts[0].modulate[3] = 255;

	VectorMA( finish, -cg_tracerWidth.value, right, verts[1].xyz );
	verts[1].st[0] = 1;
	verts[1].st[1] = 0;
	verts[1].modulate[0] = 255;
	verts[1].modulate[1] = 255;
	verts[1].modulate[2] = 255;
	verts[1].modulate[3] = 255;

	VectorMA( start, -cg_tracerWidth.value, right, verts[2].xyz );
	verts[2].st[0] = 1;
	verts[2].st[1] = 1;
	verts[2].modulate[0] = 255;
	verts[2].modulate[1] = 255;
	verts[2].modulate[2] = 255;
	verts[2].modulate[3] = 255;

	VectorMA( start, cg_tracerWidth.value, right, verts[3].xyz );
	verts[3].st[0] = 0;
	verts[3].st[1] = 0;
	verts[3].modulate[0] = 255;
	verts[3].modulate[1] = 255;
	verts[3].modulate[2] = 255;
	verts[3].modulate[3] = 255;

	trap_R_AddPolyToScene( cgs.media.tracerShader, 4, verts );

	midpoint[0] = ( start[0] + finish[0] ) * 0.5;
	midpoint[1] = ( start[1] + finish[1] ) * 0.5;
	midpoint[2] = ( start[2] + finish[2] ) * 0.5;

	// add the tracer sound
	trap_S_StartSound( midpoint, ENTITYNUM_WORLD, CHAN_AUTO, cgs.media.tracerSound );

}


/*
======================
CG_CalcMuzzlePoint
======================
*/
static qboolean	CG_CalcMuzzlePoint( int entityNum, vec3_t muzzle ) {
	vec3_t		forward;
	centity_t	*cent;
	int			anim;
	qboolean 	myself;
	int 		vr_controller_type;

	myself = ( entityNum == cg.snap->ps.clientNum );

	if ( myself ) {
		//==================================
		// cent is client player
		//==================================
#ifdef USE_VR_QVM
		if ( cg.vr_controller_type ) {
			// VR client
			VectorCopy(cg.predictedPlayerState.right_muzzle_position, muzzle);
		}
		else
#endif
#ifdef USE_NATIVE_HACK
		if ( cg.vr_controller_type )
		{
			VectorCopy(client_weapon.muzzle, muzzle);
		}
		else
#endif
		{
			// not a VR client
			VectorCopy( cg.snap->ps.origin, muzzle );
			muzzle[2] += cg.snap->ps.viewheight;
			AngleVectors( cg.snap->ps.viewangles, forward, NULL, NULL );

			VectorMA(muzzle, 14, forward, muzzle);
		}
		
		return qtrue;
	}

	//==================================
	// cent is another player's entity
	//==================================
	cent = &cg_entities[entityNum];
	if ( !cent->currentValid ) {
		return qfalse;
	}

	vr_controller_type = VR_get_cent_controller_type( cent );

#ifdef USE_VR_QVM
	// VR client
	if ( vr_controller_type > 0) {
		//right hand origin
		VectorCopy(cent->currentState.rmpos.trBase, muzzle);
		//right hand angles
		AngleVectors(cent->currentState.rapos.trBase, forward, NULL, NULL);
		// left hand weapon
		//AngleVectors(cent->currentState.lapos.trBase, forward, NULL, NULL);
	}
	else
#endif
	// Not a VR client
	{
		//view origin
		VectorCopy(cent->currentState.pos.trBase, muzzle);
		//view angles
		AngleVectors(cent->currentState.apos.trBase, forward, NULL, NULL);
	}

	anim = cent->currentState.legsAnim & ~ANIM_TOGGLEBIT;
	if ( anim == LEGS_WALKCR || anim == LEGS_IDLECR ) {
#ifdef USE_VR
		muzzle[2] += cg.heightCrouch;
#else
		muzzle[2] += CROUCH_VIEWHEIGHT;
#endif
	} else {
#ifdef USE_VR
		muzzle[2] += cg.heightStand;
#else
		muzzle[2] += DEFAULT_VIEWHEIGHT;
#endif
	}

	VectorMA( muzzle, 14, forward, muzzle );

	return qtrue;

}

/*
======================
CG_Bullet

Renders bullet effects.
======================
*/
void CG_Bullet( vec3_t end, int sourceEntityNum, vec3_t normal, qboolean flesh, int fleshEntityNum ) {
	trace_t trace;
	int sourceContentType, destContentType;
	vec3_t		start;

	// if the shooter is currently valid, calc a source point and possibly
	// do trail effects
	if ( sourceEntityNum >= 0 && cg_tracerChance.value > 0 ) {
		if ( CG_CalcMuzzlePoint( sourceEntityNum, start ) ) {
			sourceContentType = CG_PointContents( start, 0 );
			destContentType = CG_PointContents( end, 0 );

			// do a complete bubble trail if necessary
			if ( ( sourceContentType == destContentType ) && ( sourceContentType & CONTENTS_WATER ) ) {
				CG_BubbleTrail( start, end, 32 );
			}
			// bubble trail from water into air
			else if ( ( sourceContentType & CONTENTS_WATER ) ) {
				trap_CM_BoxTrace( &trace, end, start, NULL, NULL, 0, CONTENTS_WATER );
				CG_BubbleTrail( start, trace.endpos, 32 );
			}
			// bubble trail from air into water
			else if ( ( destContentType & CONTENTS_WATER ) ) {
				trap_CM_BoxTrace( &trace, start, end, NULL, NULL, 0, CONTENTS_WATER );
				CG_BubbleTrail( trace.endpos, end, 32 );
			}

			// draw a tracer
			if ( random() < cg_tracerChance.value ) {
				CG_Tracer( start, end );
			}
		}
	}

	// impact splash and mark
	if ( flesh ) {
		CG_Bleed( end, fleshEntityNum );
	} else {
		CG_MissileHitWall( WP_MACHINEGUN, 0, end, normal, IMPACTSOUND_DEFAULT );
	}

}
