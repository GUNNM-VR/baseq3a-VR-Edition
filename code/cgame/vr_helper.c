#include "vr_helper.h"

float trap_Cvar_VariableValue(const char *var_name) {
	char buf[128];
	trap_Cvar_VariableStringBuffer(var_name, buf, sizeof(buf));
	return atof(buf);
}

#ifdef Q3_VM
float sinf(float _X) {
	return (float)sin(_X);
}
float cosf(float _X)
{
	return (float)cos(_X);
}
#endif


//========================================
// get the VR value from the client
//		standard QVM | native VM
//========================================

//
// HMD position and angles
//
void VR_get_client_HMD_position( vec3_t HMDposition ) {
#ifdef USE_NATIVE_HACK
	VectorCopy(vrinfo->hmdinfo.position.actual, HMDposition);
#endif
#ifdef USE_VR_QVM
	VectorCopy(cg.predictedPlayerState.HMD_raw_origin, HMDposition);
#endif
}

void VR_get_client_HMD_angles( vec3_t HMDangles ) {
#ifdef USE_NATIVE_HACK
	VectorCopy(vrinfo->hmdinfo.angles.actual, HMDangles);
#else
	VectorCopy(cg.predictedPlayerState.viewangles, HMDangles);
#endif
}

//
// controller type, position, angles, offset
//
qboolean VR_get_client_controller_type( void ) {
#ifdef USE_NATIVE_HACK
	return vrinfo->vr_controller_type;
#endif
#ifdef USE_VR_QVM
	return cg.vr_controller_type;
#endif
}

void VR_get_client_controller_position( int side, vec3_t pos ) {
#ifdef USE_NATIVE_HACK
	VectorCopy(vrinfo->controllers[side].position.actual, pos );
#endif
#ifdef USE_VR_QVM
	if ( side == SideRIGHT )
		VectorCopy(cg.predictedPlayerState.right_hand_position, pos);
	else
		VectorCopy(cg.predictedPlayerState.left_hand_position, pos);
#endif
}

/*void VR_get_client_controller_angles( int side, vec3_t angles ) {
#ifdef USE_NATIVE_HACK
	VectorCopy(vrinfo->controllers[side].angles.actual, angles);
#endif
#ifdef USE_VR_QVM
	if ( side == SideRIGHT )
		VectorCopy(cg.predictedPlayerState.right_hand_angles, angles);
	else
		VectorCopy(cg.predictedPlayerState.left_hand_angles, angles);
#endif
}*/

void VR_get_client_controller_offset( int side, vec3_t controllerOffset ) {
#ifdef USE_NATIVE_HACK
	VectorCopy(vrinfo->controllers[side].hmd_ctrl_offset, controllerOffset);
#endif
#ifdef USE_VR_QVM
	if ( side == SideRIGHT )
		VectorSubtract(cg.predictedPlayerState.HMD_raw_origin, cg.predictedPlayerState.right_hand_position, controllerOffset);
	else
		VectorSubtract(cg.predictedPlayerState.HMD_raw_origin, cg.predictedPlayerState.left_hand_position, controllerOffset);
#endif
}

//
// Get player info
//
qboolean VR_get_client_vrFlags( void ) {
#ifdef USE_NATIVE_HACK
	return vrinfo->vrFlags;
#endif

#ifdef USE_VR_QVM
	return cg.predictedPlayerState.vrFlags;
#endif
}

#ifdef USE_VR_ZOOM
float VR_get_client_weapon_zoomLevel( void ) {
#ifdef USE_NATIVE_HACK
	return vrinfo->weapon_zoomLevel;
#endif
#ifdef USE_VR_QVM
	return 1.0f; //GUNNM TODO create a cvar as we don't have access to vrinfo in non-native QVM
#endif
}
#endif


//========================================
// get the VR value of any other player
//		standard QVM | native VM
//========================================
qboolean VR_get_ps_vrFlags( playerState_t *ps, qboolean mySelf ) {
#ifdef USE_NATIVE_HACK
	if ( mySelf )
		return vrinfo->vrFlags;
	else
		return 0;
#endif

#ifdef USE_VR_QVM
	if ( mySelf )
		return cg.predictedPlayerState.vrFlags;
	else if ( ps )
		return ps->vrFlags;
	else
		return 0;
#endif
}

int VR_get_cent_controller_type( centity_t *cent ) {
	int clientNum = cent->currentState.clientNum;
	if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
		clientInfo_t *ci = &cgs.clientinfo[clientNum];
		if ( ci->infoValid ) {
			return ci->vr_controller_type;
		}
	}
	return 0;
}

int VR_get_ps_controller_type( playerState_t *ps ) {
#ifdef USE_NATIVE_HACK
	return vrinfo->vr_controller_type;
#endif
#ifdef USE_VR_QVM
	if ( ps )
		return ps->vr_controller_type;
	else
		return 0;
#endif
}


void VR_get_ps_controller_angles( int side, playerState_t *ps, vec3_t angles ) {
#ifdef USE_NATIVE_HACK
	VectorCopy(vrinfo->controllers[side].angles.actual, angles);
#endif
#ifdef USE_VR_QVM
	if ( side == SideRIGHT )
		//VectorCopy(cg.snap->ps.right_hand_angles, angles);
		VectorCopy(ps->right_hand_angles, angles);//non!!!!!!!!!!!
	else
		VectorCopy(ps->left_hand_angles, angles);
#endif
}

qboolean VR_get_cent_vrFlags(centity_t *cent, qboolean mySelf) {
#ifdef USE_NATIVE_HACK
	if ( mySelf )
		return vrinfo->vrFlags;
	else
		return 0;
#endif
	
#ifdef USE_VR_QVM
	if ( mySelf )
		return cg.predictedPlayerState.vrFlags;
	else if ( cent )
		return cent->currentState.vrFlags;
	else
		return 0;
#endif
}

void VR_get_cent_controller_angles( centity_t *cent, vec3_t ctrlAngles, int side ) {
	qboolean mySelf = (cent->currentState.number == cg.predictedPlayerState.clientNum);

#ifdef USE_VR_QVM
	if ( mySelf ) {
		// get span Yaw angle
		float spawn_yaw = cg.predictedPlayerState.viewangles[YAW] - cg.refdefViewAngles[YAW];

		if ( side == SideRIGHT )
			VectorCopy(cg.predictedPlayerState.right_hand_angles, ctrlAngles);
		else
			VectorCopy(cg.predictedPlayerState.left_hand_angles, ctrlAngles);

		// Add span Yaw angle
		ctrlAngles[YAW] -= spawn_yaw;
	}
	else {
		if ( side == SideRIGHT )
			VectorCopy(cent->currentState.s_rightAngles, ctrlAngles);
		else
			VectorCopy(cent->currentState.s_leftAngles, ctrlAngles);
	}
	//else // TODO not a vr player
	//	VectorCopy(cent->lerpAngles, ctrlAngles);
#endif

#ifdef USE_NATIVE_HACK
	if ( mySelf ) {
		VectorCopy(vrinfo->controllers[SideRIGHT].angles.actual, ctrlAngles);

		// Add span Yaw angle
		//if (cg.vr_controller_type == 1)
		{
			float spawn_yaw = vrinfo->hmdinfo.angles.actual[YAW] - cg.refdefViewAngles[YAW];
			ctrlAngles[YAW] -= spawn_yaw;
		}
	}
	else
		VectorCopy(cent->lerpAngles, ctrlAngles);
#endif
}


/*
=================
length
=================
*/
float math_length(float x, float y) {
#if defined USE_NATIVE_HACK && defined _MSC_VER
	return sqrtf(powf(x, 2.0f) + powf(y, 2.0f));
#else
	return Q_rsqrt(x * x + y * y);
#endif
}

/*
=================
SinCos
=================
*/
void SinCos(float radians, float *sine, float *cosine)
{
#if _MSC_VER == 1200
	_asm
	{
		fld	dword ptr[radians]
		fsincos

		mov edx, dword ptr[cosine]
		mov eax, dword ptr[sine]

		fstp dword ptr[edx]
		fstp dword ptr[eax]
	}
#else
	// I think, better use math.h function, instead of ^
#if defined (__linux__) && !defined (__ANDROID__)
	sincosf(radians, sine, cosine);
#else
	*sine = sinf(radians);
	*cosine = cosf(radians);
#endif
#endif
}

void Matrix4x4_Concat(matrix4x4 out, /*const*/ matrix4x4 in1, /*const*/ matrix4x4 in2)
{
	out[0][0] = in1[0][0] * in2[0][0] + in1[0][1] * in2[1][0] + in1[0][2] * in2[2][0] + in1[0][3] * in2[3][0];
	out[0][1] = in1[0][0] * in2[0][1] + in1[0][1] * in2[1][1] + in1[0][2] * in2[2][1] + in1[0][3] * in2[3][1];
	out[0][2] = in1[0][0] * in2[0][2] + in1[0][1] * in2[1][2] + in1[0][2] * in2[2][2] + in1[0][3] * in2[3][2];
	out[0][3] = in1[0][0] * in2[0][3] + in1[0][1] * in2[1][3] + in1[0][2] * in2[2][3] + in1[0][3] * in2[3][3];
	out[1][0] = in1[1][0] * in2[0][0] + in1[1][1] * in2[1][0] + in1[1][2] * in2[2][0] + in1[1][3] * in2[3][0];
	out[1][1] = in1[1][0] * in2[0][1] + in1[1][1] * in2[1][1] + in1[1][2] * in2[2][1] + in1[1][3] * in2[3][1];
	out[1][2] = in1[1][0] * in2[0][2] + in1[1][1] * in2[1][2] + in1[1][2] * in2[2][2] + in1[1][3] * in2[3][2];
	out[1][3] = in1[1][0] * in2[0][3] + in1[1][1] * in2[1][3] + in1[1][2] * in2[2][3] + in1[1][3] * in2[3][3];
	out[2][0] = in1[2][0] * in2[0][0] + in1[2][1] * in2[1][0] + in1[2][2] * in2[2][0] + in1[2][3] * in2[3][0];
	out[2][1] = in1[2][0] * in2[0][1] + in1[2][1] * in2[1][1] + in1[2][2] * in2[2][1] + in1[2][3] * in2[3][1];
	out[2][2] = in1[2][0] * in2[0][2] + in1[2][1] * in2[1][2] + in1[2][2] * in2[2][2] + in1[2][3] * in2[3][2];
	out[2][3] = in1[2][0] * in2[0][3] + in1[2][1] * in2[1][3] + in1[2][2] * in2[2][3] + in1[2][3] * in2[3][3];
	out[3][0] = in1[3][0] * in2[0][0] + in1[3][1] * in2[1][0] + in1[3][2] * in2[2][0] + in1[3][3] * in2[3][0];
	out[3][1] = in1[3][0] * in2[0][1] + in1[3][1] * in2[1][1] + in1[3][2] * in2[2][1] + in1[3][3] * in2[3][1];
	out[3][2] = in1[3][0] * in2[0][2] + in1[3][1] * in2[1][2] + in1[3][2] * in2[2][2] + in1[3][3] * in2[3][2];
	out[3][3] = in1[3][0] * in2[0][3] + in1[3][1] * in2[1][3] + in1[3][2] * in2[2][3] + in1[3][3] * in2[3][3];
}

void Matrix4x4_CreateFromEntity(matrix4x4 out, const vec3_t angles, const vec3_t origin, float scale)
{
	float	angle, sr, sp, sy, cr, cp, cy;

	if (angles[ROLL])
	{
#ifdef XASH_VECTORIZE_SINCOS
		SinCosFastVector3(DEG2RAD(angles[YAW]), DEG2RAD(angles[PITCH]), DEG2RAD(angles[ROLL]),
			&sy, &sp, &sr,
			&cy, &cp, &cr);
#else
		angle = angles[YAW] * (M_PI2 / 360.0f);
		SinCos(angle, &sy, &cy);
		angle = angles[PITCH] * (M_PI2 / 360.0f);
		SinCos(angle, &sp, &cp);
		angle = angles[ROLL] * (M_PI2 / 360.0f);
		SinCos(angle, &sr, &cr);
#endif

		out[0][0] = (cp*cy) * scale;
		out[0][1] = (sr*sp*cy + cr * -sy) * scale;
		out[0][2] = (cr*sp*cy + -sr * -sy) * scale;
		out[0][3] = origin[0];
		out[1][0] = (cp*sy) * scale;
		out[1][1] = (sr*sp*sy + cr * cy) * scale;
		out[1][2] = (cr*sp*sy + -sr * cy) * scale;
		out[1][3] = origin[1];
		out[2][0] = (-sp) * scale;
		out[2][1] = (sr*cp) * scale;
		out[2][2] = (cr*cp) * scale;
		out[2][3] = origin[2];
		out[3][0] = 0.0f;
		out[3][1] = 0.0f;
		out[3][2] = 0.0f;
		out[3][3] = 1.0f;
	}
	else if (angles[PITCH])
	{
#ifdef XASH_VECTORIZE_SINCOS
		SinCosFastVector2(DEG2RAD(angles[YAW]), DEG2RAD(angles[PITCH]),
			&sy, &sp,
			&cy, &cp);
#else
		angle = angles[YAW] * (M_PI2 / 360.0f);
		SinCos(angle, &sy, &cy);
		angle = angles[PITCH] * (M_PI2 / 360.0f);
		SinCos(angle, &sp, &cp);
#endif

		out[0][0] = (cp*cy) * scale;
		out[0][1] = (-sy) * scale;
		out[0][2] = (sp*cy) * scale;
		out[0][3] = origin[0];
		out[1][0] = (cp*sy) * scale;
		out[1][1] = (cy)* scale;
		out[1][2] = (sp*sy) * scale;
		out[1][3] = origin[1];
		out[2][0] = (-sp) * scale;
		out[2][1] = 0.0f;
		out[2][2] = (cp)* scale;
		out[2][3] = origin[2];
		out[3][0] = 0.0f;
		out[3][1] = 0.0f;
		out[3][2] = 0.0f;
		out[3][3] = 1.0f;
	}
	else if (angles[YAW])
	{
		angle = angles[YAW] * (M_PI2 / 360.0f);
		SinCos(angle, &sy, &cy);

		out[0][0] = (cy)* scale;
		out[0][1] = (-sy) * scale;
		out[0][2] = 0.0f;
		out[0][3] = origin[0];
		out[1][0] = (sy)* scale;
		out[1][1] = (cy)* scale;
		out[1][2] = 0.0f;
		out[1][3] = origin[1];
		out[2][0] = 0.0f;
		out[2][1] = 0.0f;
		out[2][2] = scale;
		out[2][3] = origin[2];
		out[3][0] = 0.0f;
		out[3][1] = 0.0f;
		out[3][2] = 0.0f;
		out[3][3] = 1.0f;
	}
	else
	{
		out[0][0] = scale;
		out[0][1] = 0.0f;
		out[0][2] = 0.0f;
		out[0][3] = origin[0];
		out[1][0] = 0.0f;
		out[1][1] = scale;
		out[1][2] = 0.0f;
		out[1][3] = origin[1];
		out[2][0] = 0.0f;
		out[2][1] = 0.0f;
		out[2][2] = scale;
		out[2][3] = origin[2];
		out[3][0] = 0.0f;
		out[3][1] = 0.0f;
		out[3][2] = 0.0f;
		out[3][3] = 1.0f;
	}
}

void Matrix4x4_ConvertToEntity(vec4_t *in, vec3_t angles, vec3_t origin)
{
	float xyDist = sqrt(in[0][0] * in[0][0] + in[1][0] * in[1][0]);

	// enough here to get angles?
	if (xyDist > 0.001f)
	{
		angles[0] = RAD2DEG(atan2(-in[2][0], xyDist));
		angles[1] = RAD2DEG(atan2(in[1][0], in[0][0]));
		angles[2] = RAD2DEG(atan2(in[2][1], in[2][2]));
	}
	else	// forward is mostly Z, gimbal lock
	{
		angles[0] = RAD2DEG(atan2(-in[2][0], xyDist));
		angles[1] = RAD2DEG(atan2(-in[0][1], in[1][1]));
		angles[2] = 0.0f;
	}

	origin[0] = in[0][3];
	origin[1] = in[1][3];
	origin[2] = in[2][3];
}

void rotateAboutOrigin(float x, float y, float rotation, vec2_t out)
{
	out[0] = cosf(DEG2RAD(-rotation)) * x + sinf(DEG2RAD(-rotation)) * y;
	out[1] = cosf(DEG2RAD(-rotation)) * y - sinf(DEG2RAD(-rotation)) * x;
}

void CG_ConvertFromVR(vec3_t in, vec3_t offset, vec3_t out)
{
	vec2_t r;
	vec3_t vrSpace, temp;

#ifdef USE_VR
	float angleYaw, deltaYaw;
#endif

	VectorSet(vrSpace, in[2], in[0], in[1]);

#ifdef USE_VR
	// adjust to the view angles
	deltaYaw = SHORT2ANGLE(cg.predictedPlayerState.delta_angles[YAW]);

	if ( cg.snap->ps.pm_flags & PMF_FOLLOW ) {
		//Don't include delta if following another player
		deltaYaw = 0.0f;
	}
#endif

#ifdef USE_NATIVE_HACK
	angleYaw = deltaYaw + (vrinfo->clientviewangles[YAW] - vrinfo->hmdinfo.angles.actual[YAW]);
#endif

#ifdef USE_VR_QVM
	angleYaw = deltaYaw + cg.refdefViewAngles[YAW] - cg.predictedPlayerState.viewangles[YAW];
#endif

#ifdef USE_VR
	rotateAboutOrigin(vrSpace[0], vrSpace[1], angleYaw, r);
#endif

	vrSpace[0] = -r[0];
	vrSpace[1] = -r[1];

	VectorScale(vrSpace, cg.worldscale, temp);

	if (offset) {
		VectorAdd(temp, offset, out);
	}
	else {
		VectorCopy(temp, out);
	}
}

// TODO create and use preprocessor #define WORDSCALE 32 in q_shared
static void CG_CalculateVRPositionInWorld(vec3_t in_position, vec3_t in_orientation, vec3_t origin, vec3_t angles) {
	float deltaYaw;
	//Use absolute position for the faked 6DoF
	vec3_t hmdOrigin, offset, tmp;

	// get hmd origin in real world
#ifdef USE_NATIVE_HACK
	VectorCopy(vrinfo->hmdorigin, hmdOrigin);
#endif
#ifdef USE_VR_QVM
	VectorCopy(cg.predictedPlayerState.HMD_raw_origin, hmdOrigin);
#endif

	VectorSubtract(in_position, hmdOrigin, offset);
	offset[1] = 0; // up/down is index 1 in this case
	CG_ConvertFromVR(offset, cg.refdef.vieworg, origin);
	//origin[2] -= PLAYER_HEIGHT;
	//origin[2] -= cg.heightStand;
	origin[2] += in_position[1] * cg.worldscale;

	VectorCopy(in_orientation, angles);

	// re-calculate angle considering spawnpoint angles
	deltaYaw = SHORT2ANGLE(cg.predictedPlayerState.delta_angles[YAW]);

#ifdef USE_NATIVE_HACK
	angles[YAW] += deltaYaw + (vrinfo->clientviewangles[YAW] - vrinfo->hmdinfo.angles.actual[YAW]);
#endif

#ifdef USE_VR_QVM
	// GUNNM FIXME native and non-native VM should use deltaYaw in the same way
	angles[YAW] += AngleMod( /*deltaYaw +*/ (cg.refdefViewAngles[YAW] - cg.predictedPlayerState.viewangles[YAW]));
#endif
}

void CG_CalculateVROffHandPosition(vec3_t origin, vec3_t angles)
{
#ifdef USE_NATIVE_HACK
	vrController_t ctrl = vrinfo->controllers[SideLEFT];
	CG_CalculateVRPositionInWorld(ctrl.position.actual, ctrl.angles.actual, origin, angles);
#else
	CG_CalculateVRPositionInWorld(cg.snap->ps.left_hand_position, cg.snap->ps.left_hand_angles, origin, angles);
#endif
}

void CG_CalculateWeaponPosition_VR_6Dof(vec3_t origin, vec3_t angles)
{
	if (cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW))
	{
		CG_CalculateWeaponPosition(origin, angles);
		return;
	}

#ifdef USE_NATIVE_HACK
	{
		vrController_t ctrl = vrinfo->controllers[SideRIGHT];
		CG_CalculateVRPositionInWorld(ctrl.position.actual, ctrl.angles.actual, origin, angles);
	}
#else
	{

		CG_CalculateVRPositionInWorld(cg.predictedPlayerState.right_hand_position, cg.predictedPlayerState.right_hand_angles, origin, angles);
		//CG_CalculateVRPositionInWorld(cg.snap->ps.right_hand_position, cg.snap->ps.right_hand_angles, origin, angles); // TODO if others players
	}
#endif
}


void CG_CalculateWeaponPosition_VR_3Dof(refEntity_t *gun) {
	centity_t			*cent;
	const clientInfo_t	*ci;

	//==================
	//		3 Dof
	//==================
	vec3_t legsAngles, torsoAngles;
	vec3_t res_axis;
	vec3_t vr_controller_axis[3];
	refEntity_t legs;
	refEntity_t hand;
	vec3_t rightAngles;

	memset(&legs, 0, sizeof(legs));

	cent = &cg.predictedPlayerEntity;

	ci = &cgs.clientinfo[cent->currentState.clientNum];

	legs.hModel = ci->legsModel;
	hand.hModel = ci->torsoModel;

	legs.frame = ci->animations[LEGS_IDLE].firstFrame;
	hand.frame = ci->animations[TORSO_STAND].firstFrame;

	VectorClear(legsAngles);
	AnglesToAxis(legsAngles, legs.axis);

	VectorCopy(cent->lerpOrigin, legs.origin);
	VectorCopy(legs.origin, legs.oldorigin);	// don't positionally lerp at all

	VR_get_cent_controller_angles( cent, rightAngles, SideRIGHT );

	VectorCopy(rightAngles, torsoAngles);
	torsoAngles[ROLL] = 0;

	AnglesToAxis(torsoAngles, hand.axis);
	CG_PositionRotatedEntityOnTag(&hand, &legs, ci->legsModel, "tag_torso");

	// get the weapon angle, from torso placement and axis. we will later remove these angles from the torso matrix
	CG_GetPlayerWeaponAxis(&hand, NULL, cent, gun);

	AnglesToAxis(rightAngles, vr_controller_axis);

	// Remove VR controller axis part from gun axis
	VectorSubtract(gun->axis[PITCH], vr_controller_axis[PITCH], res_axis);

	// add the [PITCH] axis
	VectorAdd(hand.axis[PITCH], res_axis, hand.axis[PITCH]);

	memcpy(gun->axis, vr_controller_axis, 36);
}


qboolean CG_IsFollowMode( int followMode ) {
	if (!cg.snap)
		return qfalse;
	else {
		int vrFlags = VR_get_client_vrFlags();
		return ((cg.snap->ps.pm_flags & PMF_FOLLOW) && (vrFlags & followMode));
	}
}

qboolean CG_IsThirdPersonFollowMode_Query( void ) {
	if ( !cg.snap )
		return qfalse;
	else {
		int vrFlags = VR_get_client_vrFlags();
		return ((cg.snap->ps.pm_flags & PMF_FOLLOW) && ((vrFlags & EF_FM_THIRDPERSON_1) || (vrFlags & EF_FM_THIRDPERSON_2)));
	}
}

qboolean CG_IsDeathCam( void ) {
	return 	( (cg.predictedPlayerState.stats[STAT_HEALTH] <= 0) &&
		(cg.predictedPlayerState.pm_type != PM_INTERMISSION) );
}


/* // not used anymore?
qboolean IsMenu( playerState_t *ps )
{
	//intermission is never full screen
	if ( ps->pm_type == PM_INTERMISSION )
		return qtrue;

	{
		int currentCatcher = trap_Key_GetCatcher();
		if ( currentCatcher & (KEYCATCH_UI | KEYCATCH_CONSOLE) || !cg.snap )
			return qtrue;
	}

	return qfalse;
}*/


