
#ifndef __VR_HELPER_H
#define __VR_HELPER_H

#include "cg_local.h"

#define PLAYER_HEIGHT           48

#define M_PI2		(float)6.28318530717958647692

float trap_Cvar_VariableValue(const char *var_name);

//========================================
// get the VR value from the client
//		standard QVM | native VM
//========================================
qboolean VR_get_client_controller_type( void );

void VR_get_client_HMD_position( vec3_t HMDposition );

void VR_get_client_HMD_angles( vec3_t HMDangles );

void VR_get_client_controller_position( int side, vec3_t HMDpos );

void VR_get_client_controller_offset( int side, vec3_t controllerOffset );

qboolean VR_get_client_vrFlags( void );

//========================================
// get the VR value of any other player
//		standard QVM | native VM
//========================================
qboolean VR_get_ps_vrFlags( playerState_t *ps, qboolean isMySelf );

qboolean VR_get_cent_vrFlags( centity_t *cent, qboolean mySelf );

void VR_get_ps_controller_angles( int side, playerState_t *ps, vec3_t angles );

void VR_get_cent_controller_angles( centity_t *cent, vec3_t ctrlAngles, int side );

int VR_get_cent_controller_type( centity_t *cent );

int VR_get_ps_controller_type( playerState_t *ps );

//========================================
// other usefull fonctions
//========================================

// Math
void Matrix4x4_CreateFromEntity(matrix4x4 out, const vec3_t angles, const vec3_t origin, float scale);

void Matrix4x4_Concat(matrix4x4 out, /*const*/ matrix4x4 in1, /*const*/ matrix4x4 in2);

void Matrix4x4_ConvertToEntity(vec4_t *in, vec3_t angles, vec3_t origin);

float math_length(float x, float y);


void CG_CalculateWeaponPosition_VR_6Dof(vec3_t origin, vec3_t angles);

void CG_CalculateWeaponPosition_VR_3Dof(refEntity_t *gun);

void CG_CalculateVRPositionInWorld(vec3_t in_position/*, vec3_t in_offset*/, vec3_t in_orientation, vec3_t origin, vec3_t angles);

void CG_ConvertFromVR(vec3_t in, vec3_t offset, vec3_t out);

#ifdef USE_NATIVE_HACK
void rotateAboutOrigin(float x, float y, float rotation, vec2_t out);
#endif

qboolean CG_IsFollowMode( int followMode );

qboolean CG_IsThirdPersonFollowMode_Query( void );

qboolean CG_IsDeathCam( void );

#endif // __VR_HELPER_H

