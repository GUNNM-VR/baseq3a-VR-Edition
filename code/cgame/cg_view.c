// Copyright (C) 1999-2000 Id Software, Inc.
//
// cg_view.c -- setup all the parameters (position, angle, etc)
// for a 3D rendering
#include "cg_local.h"

#ifdef USE_VR
#include "../../../Quake3e-master/code/vrmod/VRMOD_input.h"

#include "vr_helper.h"
#endif
#ifdef USE_NATIVE_HACK
extern vr_clientinfo_t* vrinfo;
#endif

/*
=============================================================================

  MODEL TESTING

The viewthing and gun positioning tools from Q2 have been integrated and
enhanced into a single model testing facility.

Model viewing can begin with either "testmodel <modelname>" or "testgun <modelname>".

The names must be the full pathname after the basedir, like 
"models/weapons/v_launch/tris.md3" or "players/male/tris.md3"

Testmodel will create a fake entity 100 units in front of the current view
position, directly facing the viewer.  It will remain immobile, so you can
move around it to view it from different angles.

Testgun will cause the model to follow the player around and suppress the real
view weapon model.  The default frame 0 of most guns is completely off screen,
so you will probably have to cycle a couple frames to see it.

"nextframe", "prevframe", "nextskin", and "prevskin" commands will change the
frame or skin of the testmodel.  These are bound to F5, F6, F7, and F8 in
q3default.cfg.

If a gun is being tested, the "gun_x", "gun_y", and "gun_z" variables will let
you adjust the positioning.

Note that none of the model testing features update while the game is paused, so
it may be convenient to test with deathmatch set to 1 so that bringing down the
console doesn't pause the game.

=============================================================================
*/

//#define	NECK_LENGTH		6  // neck
//#define	NECK_LENGTH		8  // q3a & q3e
//#define	NECK_LENGTH		10 // torso
//#define	NECK_LENGTH		3  // weapon
#define		NECK_LENGTH		20

/*
=================
CG_TestModel_f

Creates an entity in front of the current position, which
can then be moved around
=================
*/
void CG_TestModel_f (void) {
	vec3_t		angles;

	memset( &cg.testModelEntity, 0, sizeof(cg.testModelEntity) );
	if ( trap_Argc() < 2 ) {
		return;
	}

	Q_strncpyz (cg.testModelName, CG_Argv( 1 ), MAX_QPATH );
	cg.testModelEntity.hModel = trap_R_RegisterModel( cg.testModelName );

	if ( trap_Argc() == 3 ) {
		cg.testModelEntity.backlerp = atof( CG_Argv( 2 ) );
		cg.testModelEntity.frame = 1;
		cg.testModelEntity.oldframe = 0;
	}

	if ( !cg.testModelEntity.hModel ) {
		CG_Printf( "Can't register model '%s'.\n", cg.testModelName );
		return;
	}

	VectorMA( cg.refdef.vieworg, 100, cg.refdef.viewaxis[0], cg.testModelEntity.origin );

	angles[PITCH] = 0;
	angles[YAW] = 180 + cg.refdefViewAngles[1];
	angles[ROLL] = 0;

	AnglesToAxis( angles, cg.testModelEntity.axis );
	cg.testGun = qfalse;
}

/*
=================
CG_TestGun_f

Replaces the current view weapon with the given model
=================
*/
void CG_TestGun_f (void) {
	CG_TestModel_f();
	cg.testGun = qtrue;
	cg.testModelEntity.renderfx = RF_MINLIGHT | RF_DEPTHHACK | RF_FIRST_PERSON;
}


void CG_TestModelNextFrame_f (void) {
	cg.testModelEntity.frame++;
	CG_Printf( "frame %i\n", cg.testModelEntity.frame );
}

void CG_TestModelPrevFrame_f (void) {
	cg.testModelEntity.frame--;
	if ( cg.testModelEntity.frame < 0 ) {
		cg.testModelEntity.frame = 0;
	}
	CG_Printf( "frame %i\n", cg.testModelEntity.frame );
}

void CG_TestModelNextSkin_f (void) {
	cg.testModelEntity.skinNum++;
	CG_Printf( "skin %i\n", cg.testModelEntity.skinNum );
}

void CG_TestModelPrevSkin_f (void) {
	cg.testModelEntity.skinNum--;
	if ( cg.testModelEntity.skinNum < 0 ) {
		cg.testModelEntity.skinNum = 0;
	}
	CG_Printf( "skin %i\n", cg.testModelEntity.skinNum );
}

static void CG_AddTestModel (void) {
	int		i;

	// re-register the model, because the level may have changed
	cg.testModelEntity.hModel = trap_R_RegisterModel( cg.testModelName );
	if (! cg.testModelEntity.hModel ) {
		CG_Printf ("Can't register model\n");
		return;
	}

	// if testing a gun, set the origin relative to the view origin
	if ( cg.testGun ) {
		VectorCopy( cg.refdef.vieworg, cg.testModelEntity.origin );
		VectorCopy( cg.refdef.viewaxis[0], cg.testModelEntity.axis[0] );
		VectorCopy( cg.refdef.viewaxis[1], cg.testModelEntity.axis[1] );
		VectorCopy( cg.refdef.viewaxis[2], cg.testModelEntity.axis[2] );

		// allow the position to be adjusted
		for (i=0 ; i<3 ; i++) {
			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[0][i] * cg_gun_x.value;
			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[1][i] * cg_gun_y.value;
			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[2][i] * cg_gun_z.value;
		}
	}

	trap_R_AddRefEntityToScene( &cg.testModelEntity );
}



//============================================================================


/*
=================
CG_CalcVrect

Sets the coordinates of the rendered window
=================
*/
static void CG_CalcVrect (void) {
	int		size;

	// the intermission should allways be full screen
	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
		size = 100;
	} else {
		// bound normal viewsize
		if (cg_viewsize.integer < 30) {
			trap_Cvar_Set ("cg_viewsize","30");
			size = 30;
		} else if (cg_viewsize.integer > 100) {
			trap_Cvar_Set ("cg_viewsize","100");
			size = 100;
		} else {
			size = cg_viewsize.integer;
		}

	}
	cg.refdef.width = cgs.glconfig.vidWidth*size/100;
	cg.refdef.width &= ~1;

	cg.refdef.height = cgs.glconfig.vidHeight*size/100;
	cg.refdef.height &= ~1;

	cg.refdef.x = (cgs.glconfig.vidWidth - cg.refdef.width)/2;
	cg.refdef.y = (cgs.glconfig.vidHeight - cg.refdef.height)/2;
}

//==============================================================================


/*
===============
CG_OffsetVRThirdPersonView

===============
*/
#ifdef USE_DEATHCAM
static void CG_OffsetVRThirdPersonView(void) {
	float scale = 1.0f;
	vec3_t position;
	playerState_t	*ps;
	ps = &cg.predictedPlayerState;

	VR_get_client_HMD_position(position);

	//Follow mode 1
	if (cg.demoPlayback || CG_IsFollowMode( EF_FM_THIRDPERSON_1 ))
	{
		vec3_t current;
		scale *= SPECTATOR_WORLDSCALE_MULTIPLIER;
		//Check to see if the followed player has moved far enough away to mean we should update our location
		VectorSubtract(cg.refdef.vieworg, cg.vr_vieworigin, current);
		current[2] = 0;
		if (VectorLength(current) > 400)
		{
			vec3_t angles, forward, right, up;
			VectorCopy(cg.refdef.vieworg, cg.vr_vieworigin);

			//Move behind the player
#ifdef USE_NATIVE_HACK
			VectorCopy(vrinfo->clientviewangles, angles);
#else
			VectorCopy(ps->viewangles, angles);
#endif
			angles[PITCH] = 0;
			AngleVectors(angles, forward, right, up);
			VectorMA(cg.vr_vieworigin, -60, forward, cg.vr_vieworigin);
		}
	}
	//Death or follow mode 2
	else if ( CG_IsDeathCam() || CG_IsFollowMode(EF_FM_THIRDPERSON_2) )
	{
		vec3_t angles, forward, right, up;
		float deltaYaw;
		float thumbstick_location[2];

		scale *= SPECTATOR2_WORLDSCALE_MULTIPLIER;

		deltaYaw = CG_IsDeathCam() ? SHORT2ANGLE(ps->delta_angles[YAW]) : 0.0f;

#ifdef USE_NATIVE_HACK
		VectorCopy(vrinfo->controllers[SideLEFT].angles.actual, angles);
		angles[YAW] += deltaYaw + (vrinfo->clientviewangles[YAW] - vrinfo->hmdinfo.angles.actual[YAW]);

		thumbstick_location[0] = vrinfo->thumbstick_location[THUMB_LEFT][0];
		thumbstick_location[1] = vrinfo->thumbstick_location[THUMB_LEFT][1];
#endif

#ifdef USE_VR_QVM
		VectorCopy(ps->right_hand_angles, angles);
		angles[YAW] += deltaYaw + (cg.refdefViewAngles[YAW] - cg.predictedPlayerState.viewangles[YAW]);

		// GUNNM TODO
		// thumbstick control can't be accessed in non-native VM, to avoid sending 2 float, not essentials, in the snapshot.
		// we could convert x/y to 2 shorts, sent as one integer, using a byte offset.
		thumbstick_location[0] = 0.0f;
		thumbstick_location[1] = 0.0f;
#endif

		AngleVectors(angles, forward, right, up);

		//Move camera if the user is pushing thumbstick
		VectorMA(cg.vr_vieworigin, thumbstick_location[1] * 5.0f, forward, cg.vr_vieworigin);
		VectorMA(cg.vr_vieworigin, thumbstick_location[0] * 5.0f, right, cg.vr_vieworigin);
	}

	
	CG_ConvertFromVR(position, NULL, position);
	position[2] = 0;
	VectorScale(position, scale, position);
	VectorAdd(cg.vr_vieworigin, position, cg.refdef.vieworg);
}
#endif


/*
===============
CG_OffsetThirdPersonView

===============
*/
#define	FOCUS_DISTANCE	512
static void CG_OffsetThirdPersonView( void ) {
	vec3_t		forward, right, up;
	vec3_t		view;
	vec3_t		focusAngles;
	trace_t		trace;
	static vec3_t	mins = { -4, -4, -4 };
	static vec3_t	maxs = { 4, 4, 4 };
	vec3_t		focusPoint;
	float		focusDist;
	float		forwardScale, sideScale;

	cg.refdef.vieworg[2] += cg.predictedPlayerState.viewheight;

	VectorCopy( cg.refdefViewAngles, focusAngles );

#ifndef USE_DEATHCAM
	// if dead, look at killer
	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) {
		focusAngles[YAW] = cg.predictedPlayerState.stats[STAT_DEAD_YAW];
		cg.refdefViewAngles[YAW] = cg.predictedPlayerState.stats[STAT_DEAD_YAW];
	}
#endif
	if ( focusAngles[PITCH] > 45 ) {
		focusAngles[PITCH] = 45;		// don't go too far overhead
	}
	AngleVectors( focusAngles, forward, NULL, NULL );

	VectorMA( cg.refdef.vieworg, FOCUS_DISTANCE, forward, focusPoint );

	VectorCopy( cg.refdef.vieworg, view );

	view[2] += 8;

	cg.refdefViewAngles[PITCH] *= 0.5;

	AngleVectors( cg.refdefViewAngles, forward, right, up );

	forwardScale = cos( cg_thirdPersonAngle.value / 180 * M_PI );
	sideScale = sin( cg_thirdPersonAngle.value / 180 * M_PI );
	VectorMA( view, -cg_thirdPersonRange.value * forwardScale, forward, view );
	VectorMA( view, -cg_thirdPersonRange.value * sideScale, right, view );

	// trace a ray from the origin to the viewpoint to make sure the view isn't
	// in a solid block.  Use an 8 by 8 block to prevent the view from near clipping anything

	if (!cg_cameraMode.integer) {
		CG_Trace( &trace, cg.refdef.vieworg, mins, maxs, view, cg.predictedPlayerState.clientNum, MASK_SOLID );

		if ( trace.fraction != 1.0 ) {
			VectorCopy( trace.endpos, view );
			view[2] += (1.0 - trace.fraction) * 32;
			// try another trace to this position, because a tunnel may have the ceiling
			// close enough that this is poking out

			CG_Trace( &trace, cg.refdef.vieworg, mins, maxs, view, cg.predictedPlayerState.clientNum, MASK_SOLID );
			VectorCopy( trace.endpos, view );
		}
	}


	VectorCopy( view, cg.refdef.vieworg );

	// select pitch to look at focus point from vieword
	VectorSubtract( focusPoint, cg.refdef.vieworg, focusPoint );
	focusDist = sqrt( focusPoint[0] * focusPoint[0] + focusPoint[1] * focusPoint[1] );
	if ( focusDist < 1 ) {
		focusDist = 1;	// should never happen
	}
	cg.refdefViewAngles[PITCH] = -180 / M_PI * atan2( focusPoint[2], focusDist );
	cg.refdefViewAngles[YAW] -= cg_thirdPersonAngle.value;
}


// this causes a compiler bug on mac MrC compiler
static void CG_StepOffset( void ) {
	int		timeDelta;
	
	// smooth out stair climbing
	timeDelta = cg.time - cg.stepTime;
	if ( timeDelta < STEP_TIME ) {
		cg.refdef.vieworg[2] -= cg.stepChange 
			* (STEP_TIME - timeDelta) / STEP_TIME;
	}
}

/*
===============
CG_OffsetFirstPersonView

===============
*/
static void CG_OffsetFirstPersonView( void ) {
	float			*origin;
	float			*angles; // head / view Angles
	float			bob;
	float			ratio;
	float			delta;
	float			speed;
	float			f;
	vec3_t			predictedVelocity;
	int				timeDelta;
	float			hitRollCoeff = 1.0f;

	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
		return;
	}

	origin = cg.refdef.vieworg;
	angles = cg.refdefViewAngles;

#ifndef USE_DEATHCAM
	// if dead, fix the angle and don't add any kick
	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) {
		if ( !cg.vr_controller_type )
		{
			// not VR client
			angles[ROLL] = 40;
			angles[PITCH] = -15;
			angles[YAW] = cg.snap->ps.stats[STAT_DEAD_YAW];
			origin[2] += cg.predictedPlayerState.viewheight;
		}
		else {
			// VR client
			VectorCopy(cg.vr_vieworigin, origin);
			//GUNNM TODO remove the "cg.refdef.vieworg[2] += cg.predictedPlayerState.viewheight;" at the begining of CG_OffsetThirdPersonView ?
			origin[2] -= cg.predictedPlayerState.viewheight;
		}
		return;
	}
#endif
	
#ifdef USE_DEATHCAM
	hitRollCoeff = trap_Cvar_VariableValue("vr_rollWhenHit");
#endif

	// add angles based on weapon kick
	VectorAdd( angles, cg.kick_angles, angles );

	// add angles based on damage kick
#ifdef USE_VR
	if ( !cg.vr_controller_type )
#endif
	{
		//--------------
		// not VR client
		//--------------
		if ( cg.damageTime ) {
			ratio = cg.time - cg.damageTime;
			if ( ratio < DAMAGE_DEFLECT_TIME ) {
				ratio /= DAMAGE_DEFLECT_TIME;
				angles[PITCH] += ratio * cg.v_dmg_pitch * hitRollCoeff;
				angles[ROLL] += ratio * cg.v_dmg_roll * hitRollCoeff;
			} else {
				ratio = 1.0 - ( ratio - DAMAGE_DEFLECT_TIME ) / DAMAGE_RETURN_TIME;
				if ( ratio > 0 ) {
					angles[PITCH] += ratio * cg.v_dmg_pitch * hitRollCoeff;
					angles[ROLL] += ratio * cg.v_dmg_roll * hitRollCoeff;
				}
			}
		}

		// add pitch based on fall kick
#if 0
		ratio = ( cg.time - cg.landTime) / FALL_TIME;
		if (ratio < 0)
			ratio = 0;
		angles[PITCH] += ratio * cg.fall_value;
#endif

		// add angles based on velocity
		VectorCopy( cg.predictedPlayerState.velocity, predictedVelocity );

		delta = DotProduct ( predictedVelocity, cg.refdef.viewaxis[0]);
		angles[PITCH] += delta * cg_runpitch.value;

		delta = DotProduct ( predictedVelocity, cg.refdef.viewaxis[1]);
		angles[ROLL] -= delta * cg_runroll.value;

		// add angles based on bob

		// make sure the bob is visible even at low speeds
		speed = cg.xyspeed > 200 ? cg.xyspeed : 200;

		delta = cg.bobfracsin * cg_bobpitch.value * speed;
		if ( cg.predictedPlayerState.pm_flags & PMF_DUCKED )
			delta *= 3;		// crouching
		angles[PITCH] += delta;
		delta = cg.bobfracsin * cg_bobroll.value * speed;
		if ( cg.predictedPlayerState.pm_flags & PMF_DUCKED )
			delta *= 3;		// crouching accentuates roll
		if ( cg.bobcycle & 1 )
			delta = -delta;
		angles[ROLL] += delta;
	}

	// add view height
#ifdef USE_VR
	if ( cg.vr_controller_type > 0 )
	{
		//--------------
		// VR client
		//--------------
		// add view height calculated from model's head height, in cg_view.c/CG_GetModelHeight()
		if ( cg.predictedPlayerState.pm_flags & PMF_DUCKED ) {
			//origin[2] = CROUCH_VIEWHEIGHT;
			origin[2] += cg.heightCrouch;
		}
		else {
			origin[2] += cg.heightStand;
		}

		// adjust to be in head (only Sarge was tested)
		origin[2] += 8; //5 is more eyes level, but shoulders are anoying
	}
	else
#endif
	{
		//--------------
		// not VR client
		//--------------
		origin[2] += cg.predictedPlayerState.viewheight;
	}

	// smooth out duck height changes
	timeDelta = cg.time - cg.duckTime;

	// fixme: use cg.heightCrouch
	if ( timeDelta < DUCK_TIME ) {
#ifdef USE_VR
		if ( !cg.vr_controller_type )
			// VR client
			origin[2] -= cg.duckChange
				* (DUCK_TIME - timeDelta) / DUCK_TIME;
		else
#endif
			// not VR client
			cg.refdef.vieworg[2] -= cg.duckChange
				* (DUCK_TIME - timeDelta) / DUCK_TIME;
	}

	// add bob height
	bob = cg.bobfracsin * cg.xyspeed * cg_bobup.value;
	if (bob > 6) {
		bob = 6;
	}

	origin[2] += bob;

	// add fall height
	delta = cg.time - cg.landTime;
	if (delta < LAND_DEFLECT_TIME) {
		f = delta / LAND_DEFLECT_TIME;

#ifdef USE_VR
		// VR client
		if ( cg.vr_controller_type > 0)
			origin[2] += cg.landChange * f;
		else
#endif
			// Not VR client
			cg.refdef.vieworg[2] += cg.landChange * f;
	}
	else if ( delta < LAND_DEFLECT_TIME + LAND_RETURN_TIME ) {
		delta -= LAND_DEFLECT_TIME;
		f = 1.0 - ( delta / LAND_RETURN_TIME );
		
#ifdef USE_VR
		if ( cg.vr_controller_type > 0 )
			// VR client
			origin[2] += cg.landChange * f;
		else
#endif
			// not VR client
			cg.refdef.vieworg[2] += cg.landChange * f;

	}

	// add step offset
	CG_StepOffset();

	// add kick offset
	VectorAdd (origin, cg.kick_origin, origin);

	// pivot the eye based on a neck length
#if 0
	{
	vec3_t			forward, up;

	cg.refdef.vieworg[2] -= NECK_LENGTH;
	AngleVectors( cg.refdefViewAngles, forward, NULL, up );
	VectorMA( cg.refdef.vieworg, 3, forward, cg.refdef.vieworg );
	VectorMA( cg.refdef.vieworg, NECK_LENGTH, up, cg.refdef.vieworg );
	}
#endif
}

//======================================================================

void CG_ZoomDown_f( void ) { 
	if ( cg.zoomed ) {
		return;
	}
	cg.zoomed = qtrue;
	cg.zoomTime = cg.time;
}

void CG_ZoomUp_f( void ) { 
	if ( !cg.zoomed ) {
		return;
	}
	cg.zoomed = qfalse;
	cg.zoomTime = cg.time;
}


/*
====================
CG_CalcFov

Fixed fov at intermissions, otherwise account for fov variable and zooms.
====================
*/
#define	WAVE_AMPLITUDE	1
#define	WAVE_FREQUENCY	0.4

static int CG_CalcFov( void ) {
	int		contents;
	int		inwater;
#ifndef USE_VR_FOV
	float	x;
	//float	phase;
	float	v;
	float	fov_x, fov_y;
	float	zoomFov;
	float	f;

	cgs.fov = cg_fov.value;
	if ( cgs.fov < 1.0 )
		cgs.fov = 1.0;
	else if ( cgs.fov > 160.0 )
		cgs.fov = 160.0;

	cgs.zoomFov = cg_zoomFov.value;
	if ( cgs.zoomFov < 1.0 )
		cgs.zoomFov = 1.0;
	else if ( cgs.zoomFov > 160.0 )
		cgs.zoomFov = 160.0;

	if ( cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
		// if in intermission, use a fixed value
		fov_x = 90;
	} else {
		// user selectable
		fov_x = cgs.fov;

		// account for zooms
		zoomFov = cgs.zoomFov;

		if ( cg.zoomed ) {
			f = ( cg.time - cg.zoomTime ) / (float)ZOOM_TIME;
			if ( f > 1.0 ) {
				fov_x = zoomFov;
			} else {
				fov_x = fov_x + f * ( zoomFov - fov_x );
			}
		} else {
			f = ( cg.time - cg.zoomTime ) / (float)ZOOM_TIME;
			if ( f > 1.0 ) {
				//fov_x = fov_x;
			} else {
				fov_x = zoomFov + f * ( fov_x - zoomFov );
			}
		}
	}

	if ( cg_fovAdjust.integer ) {
		// Based on LordHavoc's code for Darkplaces
		// http://www.quakeworld.nu/forum/topic/53/what-does-your-qw-look-like/page/30
		const float baseAspect = 0.75f; // 3/4
		const float aspect = (float)cg.refdef.width/(float)cg.refdef.height;
		const float desiredFov = fov_x;

		fov_x = atan2( tan( desiredFov * M_PI / 360.0f ) * baseAspect * aspect, 1 ) * 360.0f / M_PI;
	}

	x = cg.refdef.width / tan( fov_x / 360 * M_PI );
	fov_y = atan2( cg.refdef.height, x );
	fov_y = fov_y * 360 / M_PI;
#endif
	// warp if underwater
	contents = CG_PointContents( cg.refdef.vieworg, -1 );
	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ){
		//phase = cg.time / 1000.0 * WAVE_FREQUENCY * M_PI * 2;
		//v = WAVE_AMPLITUDE * sin( phase );
#ifndef USE_VR_FOV
		v = WAVE_AMPLITUDE * sin( (cg.time % 16419587) / 397.87735f ); // result is very close to original
		fov_x += v;
		fov_y -= v;
#endif
		inwater = qtrue;
	}
	else {
		inwater = qfalse;
	}

#ifndef USE_VR_FOV
	// set it
	cg.refdef.fov_x = fov_x;
	cg.refdef.fov_y = fov_y;
#else
	//GUNNM TODO : native / qvm / OpenXR

	// ioq3Quest
	//cg.refdef.fov_x = vrinfo->fov_x;
	//cg.refdef.fov_y = vrinfo->fov_y;

	// OpenXR
	//cg.refdef.fov_x = vr_info.hmdinfo.fov_x;
	//cg.refdef.fov_y = vr_info.hmdinfo.fov_y;

	// 2D
	cg.refdef.fov_x = 90.;
	cg.refdef.fov_y = 90;
#endif

	if ( !cg.zoomed ) {
		cg.zoomSensitivity = 1;
	} else {
		cg.zoomSensitivity = cg.refdef.fov_y / 75.0;
	}

	return inwater;
}



/*
===============
CG_DamageBlendBlob

===============
*/
static void CG_DamageBlendBlob( void ) {
	int			t;
	int			maxTime;
	refEntity_t		ent;

	if (!cg_blood.integer) {
		return;
	}

	if ( !cg.damageValue ) {
		return;
	}

	//if (cg.cameraMode) {
	//	return;
	//}

	// ragePro systems can't fade blends, so don't obscure the screen
	if ( cgs.glconfig.hardwareType == GLHW_RAGEPRO ) {
		return;
	}

	maxTime = DAMAGE_TIME;
	t = cg.time - cg.damageTime;
	if ( t <= 0 || t >= maxTime ) {
		return;
	}


	memset( &ent, 0, sizeof( ent ) );
	ent.reType = RT_SPRITE;
	ent.renderfx = RF_FIRST_PERSON;

	VectorMA( cg.refdef.vieworg, 8, cg.refdef.viewaxis[0], ent.origin );
	VectorMA( ent.origin, cg.damageX * -8, cg.refdef.viewaxis[1], ent.origin );
	VectorMA( ent.origin, cg.damageY * 8, cg.refdef.viewaxis[2], ent.origin );

	ent.radius = cg.damageValue * 3;
	ent.customShader = cgs.media.viewBloodShader;
	ent.shaderRGBA[0] = 255;
	ent.shaderRGBA[1] = 255;
	ent.shaderRGBA[2] = 255;
	ent.shaderRGBA[3] = 200 * ( 1.0 - ((float)t / maxTime) );
	trap_R_AddRefEntityToScene( &ent );
}


/*
===============
CG_CalcViewValues

Sets cg.refdef view values

===============
*/

// GUNNM TODO : CG_CalcViewValues() is in a very early process
// the #ifdef USE_NATIVE_HACK and USE_VR_QVM should be refactorised.

static int CG_CalcViewValues( void ) {
	playerState_t		*ps;
	vec3_t viewAngles;

	// GUNNM TODO : refactorisation is needed since the adding of ioq3quest 6Dof

#ifdef USE_VR
	vec3_t weaponangles, hmdAngles, clientviewangles, calculated_weaponangles;
#endif

#if defined USE_VR || defined USE_VR_ZOOM
	int vrFlags;
#endif

	// Recover variables from native structure vr_clientinfo_t
	// or from the last usercommand for classic QVM

	memset( &cg.refdef, 0, sizeof( cg.refdef ) );

	// strings for in game rendering
	// Q_strncpyz( cg.refdef.text[0], "Park Ranger", sizeof(cg.refdef.text[0]) );
	// Q_strncpyz( cg.refdef.text[1], "19", sizeof(cg.refdef.text[1]) );

	// calculate size of 3D view
	CG_CalcVrect();

	ps = &cg.predictedPlayerState;

#ifdef USE_VR
	VR_get_ps_controller_angles( SideRIGHT, ps, weaponangles );
#endif

#if defined USE_VR || defined USE_VR_ZOOM
	vrFlags = VR_get_client_vrFlags();
#endif

#if 0
if (cg.cameraMode) {
		vec3_t origin, angles;
		if (trap_getCameraInfo(cg.time, &origin, &angles)) {
			VectorCopy(origin, cg.refdef.vieworg);
			angles[ROLL] = 0;
			VectorCopy(angles, cg.refdefViewAngles);
			AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
			return CG_CalcFov();
		} else {
			cg.cameraMode = qfalse;
		}
	}
#endif

	//====================
	// get hmd & ctrl info
	//====================
	cg.vr_controller_type = VR_get_ps_controller_type( ps );

#ifdef USE_NATIVE_HACK
	VectorCopy(vrinfo->clientviewangles, clientviewangles);
	VectorCopy(vrinfo->hmdinfo.angles.actual, hmdAngles);
	VectorCopy(vrinfo->calculated_weaponangles, calculated_weaponangles);
#endif
#ifdef USE_VR_QVM
	//VectorCopy(ps->viewangles, clientviewangles);
	//VectorCopy(cg.refdefViewAngles, hmdAngles);
	//VectorCopy(vrinfo->calculated_weaponangles, calculated_weaponangles);
#endif

	//====================
	// intermission view
	//====================
	if ( ps->pm_type == PM_INTERMISSION )
	{
		// Update viewOrg
		VectorCopy( ps->origin, cg.refdef.vieworg );

#ifdef USE_VR
		if ( cg.vr_controller_type >= 2 )
		{
			static vec3_t	mins = { -1, -1, -1 };
			static vec3_t	maxs = { 1, 1, 1 };
			trace_t			trace;
			vec3_t			forward, end;

			AngleVectors(ps->viewangles, forward, NULL, NULL);
			VectorMA(ps->origin, -80, forward, end);
			CG_Trace(&trace, ps->origin, mins, maxs, end, cg.predictedPlayerState.clientNum, MASK_SOLID);
			VectorCopy(trace.endpos, cg.refdef.vieworg);
			// Update ViewAngles
			VectorCopy(hmdAngles, cg.refdefViewAngles);
			cg.refdefViewAngles[YAW] += ps->viewangles[YAW];
		}

#ifdef USE_VR_QVM
		VectorCopy( ps->viewangles, cg.refdefViewAngles );
		if ( cg.vr_controller_type ) {
			// VR client
			//realign right arm with view
			VectorCopy(ps->viewangles, cg.refdefVR_RightAngles);
			cg.refdefVR_RightAngles[0] -= ps->right_hand_angles[0];
		}
#endif

#endif // USE_VR
		AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
		return CG_CalcFov();
	} // PM_INTERMISSION

	cg.bobcycle = ( ps->bobCycle & 128 ) >> 7;
	cg.bobfracsin = fabs( sin( ( ps->bobCycle & 127 ) / 127.0 * M_PI ) );
	cg.xyspeed = sqrt( ps->velocity[0] * ps->velocity[0] +
		ps->velocity[1] * ps->velocity[1] );

	VectorCopy( ps->origin, cg.refdef.vieworg );
	VectorCopy( ps->viewangles, cg.refdefViewAngles );

#ifdef USE_VR_QVM
	if ( cg.vr_controller_type ) {
		cg.refdefVR_RightAngles[0] -= ps->right_hand_angles[0];
	}
#endif

	if ( cg_cameraOrbit.integer ) {
		if (cg.time > cg.nextOrbitTime) {
			cg.nextOrbitTime = cg.time + cg_cameraOrbitDelay.integer;
			if ( !cg.vr_controller_type ) // if not VR client
				cg_thirdPersonAngle.value += cg_cameraOrbit.value;
		}
	}
	// add error decay
	if ( cg_errorDecay.value > 0 ) {
		int		t;
		float	f;

		t = cg.time - cg.predictedErrorTime;
		f = ( cg_errorDecay.value - t ) / cg_errorDecay.value;
		if ( f > 0 && f < 1 ) {
			VectorMA( cg.refdef.vieworg, f, cg.predictedError, cg.refdef.vieworg );
		} else {
			cg.predictedErrorTime = 0;
		}
	}

#ifdef USE_DEATHCAM
	if ( CG_IsDeathCam() || cg.demoPlayback || CG_IsThirdPersonFollowMode_Query() )
	{
		//If dead, or spectating, view the map from above
		CG_OffsetVRThirdPersonView();
	}
	else
#endif
	{
#ifdef USE_VR
		if ( cg.renderingThirdPerson && !cg.vr_controller_type )
#else
		if ( cg.renderingThirdPerson )
#endif
		{
			// back away from character
			CG_OffsetThirdPersonView();
		}
		else
		{
			// offset for local bobbing and kicks
			CG_OffsetFirstPersonView();
		}

		// Reset this in case we die or follow
		if ( cg.vr_controller_type )
			VectorCopy(cg.refdef.vieworg, cg.vr_vieworigin);
	}


#ifdef USE_NATIVE_HACK
	if ( cg.vr_controller_type >= 2 )
	{
		//=====================================
		//				6 Dof
		//=====================================
		vec3_t weaponorigin, weapon_angles;
		vec3_t forward, end, dir;
		trace_t trace;

		CG_CalculateWeaponPosition_VR_6Dof( weaponorigin, weapon_angles );
		AngleVectors( weapon_angles, forward, NULL, NULL );
		VectorMA( weaponorigin, 4096, forward, end );
		CG_Trace( &trace, weaponorigin, NULL, NULL, end, cg.predictedPlayerState.clientNum, MASK_SOLID );

#if defined USE_LASER_SIGHT
		if ( cg_debugWeaponAiming.integer )
		{
			byte colour_yellow[4];
			colour_yellow[0] = 0xff;
			colour_yellow[1] = 0xff;
			colour_yellow[2] = 0x00;
			colour_yellow[3] = 0x40;

			CG_LaserSight( weaponorigin, trace.endpos, colour_yellow, 1.0f );
		}
#endif

		if ( cg.predictedPlayerState.pm_flags == PM_SPECTATOR )
		{
			//=====================================
			//				Spectating
			// just take the weapon angles directly
			//=====================================
			VectorCopy(weapon_angles, calculated_weaponangles);
		}
		else
		{
			//=====================================
			//				Playing
			//=====================================
			vec3_t origin;
			vec3_t forward2, end2;
			trace_t trace2;
			float deltaYaw;
			int timeDelta = cg.time - cg.duckTime;

			VectorSubtract(trace.endpos, cg.refdef.vieworg, dir);
			vectoangles(dir, calculated_weaponangles);

			VectorCopy(ps->origin, origin);
			origin[2] += cg.predictedPlayerState.viewheight;
			
			if (timeDelta < DUCK_TIME) {
				origin[2] -= cg.duckChange * (DUCK_TIME - timeDelta) / DUCK_TIME;
			}

			AngleVectors(calculated_weaponangles, forward2, NULL, NULL);

			VectorMA(origin, 4096, forward2, end2);

			CG_Trace(&trace2, cg.refdef.vieworg, NULL, NULL, end2, cg.predictedPlayerState.clientNum, MASK_SOLID);

#if defined USE_LASER_SIGHT && defined USE_WEAPON_WHEEL
			if (cg_debugWeaponAiming.integer)
			{
				byte colour_green[4];
				colour_green[0] = 0x00;
				colour_green[1] = 0xff;
				colour_green[2] = 0x00;
				colour_green[3] = 0x40;

				CG_LaserSight(cg.refdef.vieworg, trace2.endpos, colour_green, 1.0f);
			}
#endif
			//=====================================
			// convert to real-world angles
			// should be very close to real weapon angles
			//=====================================
			deltaYaw = SHORT2ANGLE(cg.predictedPlayerState.delta_angles[YAW]);
			calculated_weaponangles[YAW] -= (deltaYaw + (clientviewangles[YAW] - hmdAngles[YAW]));
		}


#ifdef USE_NATIVE_HACK
		VectorCopy(calculated_weaponangles, vrinfo->calculated_weaponangles);
#endif

	// position eye relative to origin
#ifdef USE_VR_ZOOM
		if ( vrFlags & EF_WEAPON_ZOOM ) {
			//If we are zoomed, then we use the refdefViewANgles (which are the weapon angles)
			VectorCopy(cg.refdefViewAngles, viewAngles);
			viewAngles[ROLL] = hmdAngles[ROLL];
		}
		else
#endif

#ifdef USE_DEATHCAM
		if ( cg.demoPlayback || CG_IsThirdPersonFollowMode_Query() )
		{
			//=======================
			// Following someone
			// ( or watching demo )
			//=======================
			VectorCopy(hmdAngles, viewAngles);
			viewAngles[YAW] = clientviewangles[YAW];
		}
		else
#endif

//#ifdef USE_VR
		if ( !(cg.snap->ps.pm_flags & PMF_FOLLOW && (vrFlags & EF_FM_FIRSTPERSON) ) )
		{
			//=======================
			//		Playing VR
			//=======================
			//We are connected to a multiplayer server, so make the appropriate adjustment to the view
			//angles as we send orientation to the server that includes the weapon angles
			float deltaYaw;
			VectorCopy(hmdAngles, viewAngles);
			deltaYaw = SHORT2ANGLE(cg.predictedPlayerState.delta_angles[YAW]);
			viewAngles[YAW] = deltaYaw + clientviewangles[YAW];
		}
		else
//#endif
		{
			//=======================
			//		Playing 2D
			//=======================
			VectorCopy(cg.refdefViewAngles, viewAngles);
		}
	} // 6dof
	else
#endif // USE_NATIVE_HACK
	{
		//=====================================
		//				3 Dof
		//=====================================
#ifdef USE_VR_ZOOM
		if ( vrFlags & EF_WEAPON_ZOOM ) {
			viewAngles[ROLL] = hmdAngles[ROLL];
			viewAngles[PITCH] = weaponangles[PITCH];
			viewAngles[YAW] = (cg.refdefViewAngles[YAW] - hmdAngles[YAW]) + weaponangles[YAW];
		}
		else
#endif
#ifdef USE_DEATHCAM
		if ( cg.demoPlayback || CG_IsThirdPersonFollowMode_Query() )
		{
			//If we're following someone,
			VectorCopy(hmdAngles, viewAngles);
			viewAngles[YAW] = clientviewangles[YAW];
		}
		else
#endif
		{
			VectorCopy(cg.refdefViewAngles, viewAngles);
		}
	}

	AnglesToAxis( viewAngles, cg.refdef.viewaxis );

	if ( cg.hyperspace ) {
		cg.refdef.rdflags |= RDF_NOWORLDMODEL | RDF_HYPERSPACE;
	}

	// field of view
	return CG_CalcFov();
}


/*
=====================
CG_PowerupTimerSounds
=====================
*/
static void CG_PowerupTimerSounds( void ) {
	int		i;
	int		t;

	// powerup timers going away
	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
		t = cg.snap->ps.powerups[i];
		if ( t <= cg.time ) {
			continue;
		}
		if ( t - cg.time >= POWERUP_BLINKS * POWERUP_BLINK_TIME ) {
			continue;
		}
		if ( ( t - cg.time ) / POWERUP_BLINK_TIME != ( t - cg.oldTime ) / POWERUP_BLINK_TIME ) {
			trap_S_StartSound( NULL, cg.snap->ps.clientNum, CHAN_ITEM, cgs.media.wearOffSound );
		}
	}
}

/*
=====================
CG_AddBufferedSound
=====================
*/
void CG_AddBufferedSound( sfxHandle_t sfx ) {
	if ( !sfx )
		return;

	// clear all buffered sounds
	if ( sfx == -1 ) {
		cg.soundBufferIn = 0;
		cg.soundBufferOut = 0;
		memset( cg.soundBuffer, 0, sizeof( cg.soundBuffer ) );
		return;
	}

	cg.soundBuffer[cg.soundBufferIn] = sfx;
	cg.soundBufferIn = (cg.soundBufferIn + 1) % MAX_SOUNDBUFFER;
	if (cg.soundBufferIn == cg.soundBufferOut) {
		//cg.soundBufferOut++;
		cg.soundBufferOut = (cg.soundBufferOut + 1) % MAX_SOUNDBUFFER;
	}
}

/*
=====================
CG_PlayBufferedSounds
=====================
*/
static void CG_PlayBufferedSounds( void ) {
	if ( cg.soundTime < cg.time ) {
		if (cg.soundBufferOut != cg.soundBufferIn && cg.soundBuffer[cg.soundBufferOut]) {
			cg.soundPlaying = cg.soundBuffer[cg.soundBufferOut];
			trap_S_StartLocalSound( cg.soundPlaying, CHAN_ANNOUNCER );
			cg.soundBuffer[cg.soundBufferOut] = 0;
			cg.soundBufferOut = (cg.soundBufferOut + 1) % MAX_SOUNDBUFFER;
			cg.soundTime = cg.time + 750;
		} else {
			cg.soundPlaying = 0;
		}
	}
}

//=========================================================================


/*
=================
CG_FirstFrame

Called once on first rendered frame
=================
*/
static void CG_FirstFrame( void )
{
	CG_SetConfigValues();

	cgs.voteTime = atoi( CG_ConfigString( CS_VOTE_TIME ) );
	cgs.voteYes = atoi( CG_ConfigString( CS_VOTE_YES ) );
	cgs.voteNo = atoi( CG_ConfigString( CS_VOTE_NO ) );
	Q_strncpyz( cgs.voteString, CG_ConfigString( CS_VOTE_STRING ), sizeof( cgs.voteString ) );

	if ( cgs.voteTime )
		cgs.voteModified = qtrue;
	else
		cgs.voteModified = qfalse;
}


/*
=================
CG_DrawActiveFrame

Generates and draws a game scene and status information at the given time.
=================
*/
void CG_DrawActiveFrame( int serverTime, stereoFrame_t stereoView, qboolean demoPlayback ) {
	int		inwater;

	cg.time = serverTime;
	cg.demoPlayback = demoPlayback;

#ifdef USE_VR
	cg.stereoView = stereoView;
	cg.worldscale = trap_Cvar_VariableValue("vr_worldscale");
#endif

	// update cvars
	CG_UpdateCvars();

#ifdef USE_DEATHCAM
	//HACK!! - should change this to a renderer function call
	//Indicate to renderer whether we are in deathcam mode, We don't want sky in death cam mode
	trap_Cvar_Set("vr_thirdPersonSpectator", (CG_IsDeathCam() || cg.demoPlayback || CG_IsThirdPersonFollowMode_Query()) ? "1" : "0"	);
#endif

	// if we are only updating the screen as a loading
	// pacifier, don't even try to read snapshots
	if ( cg.infoScreenText[0] != 0 ) {
#ifdef USE_NEOHUD
		CG_ChangeFrameResolution( cgs.glconfig.menuWidth, cgs.glconfig.menuHeight );
#endif
		CG_DrawInformation();
		return;
	}

	// any looped sounds will be respecified as entities
	// are added to the render list
	trap_S_ClearLoopingSounds(qfalse);

	// clear all the render lists
	trap_R_ClearScene();

	// set up cg.snap and possibly cg.nextSnap
	CG_ProcessSnapshots();

	// if we haven't received any snapshots yet, all
	// we can draw is the information screen
	if ( !cg.snap || ( cg.snap->snapFlags & SNAPFLAG_NOT_ACTIVE ) ) {
		CG_ChangeFrameResolution(cgs.glconfig.menuWidth, cgs.glconfig.menuHeight);
		CG_DrawInformation();
		return;
	}

	// let the client system know what our weapon and zoom settings are
	trap_SetUserCmdValue( cg.weaponSelect, cg.zoomSensitivity );

	if ( cg.clientFrame == 0 )
		CG_FirstFrame();

	// update cg.predictedPlayerState
	//if ( cg.stereoView == STEREO_LEFT ) // TODO or not?
	CG_PredictPlayerState();

	// decide on third person view
#ifndef USE_DEATHCAM
	cg.renderingThirdPerson = cg_thirdPerson.integer || (cg.snap->ps.stats[STAT_HEALTH] <= 0);
#else
	cg.renderingThirdPerson = cg.predictedPlayerState.pm_type == PM_SPECTATOR ||
		cg.demoPlayback || CG_IsThirdPersonFollowMode_Query() || cg_thirdPerson.integer;
#endif

	CG_TrackClientTeamChange();

	// follow killer
	if ( cg.followTime && cg.followTime < cg.time ) {
		cg.followTime = 0;
		if ( !cg.demoPlayback ) {
			trap_SendConsoleCommand( va( "follow %i\n", cg.followClient ) );
		}
	}

	// build cg.refdef
	inwater = CG_CalcViewValues();

	// first person blend blobs, done after AnglesToAxis
	if ( !cg.renderingThirdPerson ) {
		CG_DamageBlendBlob();
	}

	// build the render lists
	if ( !cg.hyperspace ) {
		CG_AddPacketEntities(); // alter calcViewValues, so predicted player state is correct
		CG_AddMarks();
		CG_AddParticles ();
		CG_AddLocalEntities();
	}
	CG_AddViewWeapon( &cg.predictedPlayerState );

	// add buffered sounds
	CG_PlayBufferedSounds();

#ifdef MISSIONPACK
	// play buffered voice chats
	CG_PlayBufferedVoiceChats();
#endif

	// finish up the rest of the refdef
	if ( cg.testModelEntity.hModel ) {
		CG_AddTestModel();
	}
	cg.refdef.time = cg.time;
	memcpy( cg.refdef.areamask, cg.snap->areamask, sizeof( cg.refdef.areamask ) );

	// warning sounds when powerup is wearing off
	CG_PowerupTimerSounds();

	// update audio positions
	trap_S_Respatialize( cg.snap->ps.clientNum, cg.refdef.vieworg, cg.refdef.viewaxis, inwater );

	// make sure the lagometerSample and frame timing isn't done twice when in stereo
	if ( stereoView != STEREO_RIGHT ) {
		cg.frametime = cg.time - cg.oldTime;
		if ( cg.frametime < 0 ) {
			cg.frametime = 0;
		}
		cg.oldTime = cg.time;
		CG_AddLagometerFrameInfo();
	}
	if (cg_timescale.value != cg_timescaleFadeEnd.value) {
		if (cg_timescale.value < cg_timescaleFadeEnd.value) {
			cg_timescale.value += cg_timescaleFadeSpeed.value * ((float)cg.frametime) / 1000;
			if (cg_timescale.value > cg_timescaleFadeEnd.value)
				cg_timescale.value = cg_timescaleFadeEnd.value;
		}
		else {
			cg_timescale.value -= cg_timescaleFadeSpeed.value * ((float)cg.frametime) / 1000;
			if (cg_timescale.value < cg_timescaleFadeEnd.value)
				cg_timescale.value = cg_timescaleFadeEnd.value;
		}
		if (cg_timescaleFadeSpeed.value) {
			trap_Cvar_Set("timescale", va("%f", cg_timescale.value));
		}
	}

	// actually issue the rendering calls
	CG_DrawActive( stereoView );

	// this counter will be bumped for every valid scene we generate
	cg.clientFrame++;

	if ( cg_stats.integer ) {
		CG_Printf( "cg.clientFrame:%i\n", cg.clientFrame );
	}
}
