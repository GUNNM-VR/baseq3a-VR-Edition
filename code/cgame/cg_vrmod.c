#include "cg_local.h"

client_weapon_t	client_weapon;

#ifdef USE_VR
#include "vr_helper.h" 
#endif

/*
=================
CG_ChangeFrameResolution
=================
*/
void CG_ChangeFrameResolution(int vidWidth, int vidHeight) {
	cgs.glconfig.vidWidth  = vidWidth;
	cgs.glconfig.vidHeight = vidHeight;

	cgs.screenXBias = 0.0;
	cgs.screenYBias = 0.0;

	if (cgs.glconfig.vidWidth * 480 > cgs.glconfig.vidHeight * 640) {
		// wide screen, scale by height
		cgs.screenXScale = cgs.screenYScale = cgs.glconfig.vidHeight * (1.0 / 480.0);
		cgs.screenXBias = 0.5 * (cgs.glconfig.vidWidth - (cgs.glconfig.vidHeight * (640.0 / 480.0)));
	}
	else {
		// no wide screen, scale by width
		cgs.screenXScale = cgs.screenYScale = cgs.glconfig.vidWidth * (1.0 / 640.0);
		cgs.screenYBias = 0.5 * (cgs.glconfig.vidHeight - (cgs.glconfig.vidWidth * (480.0 / 640.0)));
	}

	cgs.screenXmin = 0.0 - (cgs.screenXBias / cgs.screenXScale);
	cgs.screenXmax = 640.0 + (cgs.screenXBias / cgs.screenXScale);

	cgs.screenYmin = 0.0 - (cgs.screenYBias / cgs.screenYScale);
	cgs.screenYmax = 480.0 + (cgs.screenYBias / cgs.screenYScale);

	cgs.cursorScaleR = 1.0 / cgs.screenXScale;
	if (cgs.cursorScaleR < 0.5) {
		cgs.cursorScaleR = 0.5;
	}
}


/*
=============
CG_GetPlayerWeaponAxis()
because we need to subtract the gun matrix from the torso matrix
=============
*/
#ifdef USE_VR
void CG_GetPlayerWeaponAxis(refEntity_t *torso, playerState_t *ps, centity_t *cent, refEntity_t *gun) {
	orientation_t	lerped;
	qboolean myself = (cent->currentState.number == cg.snap->ps.clientNum);

	int vr_controller_type;

	if ( myself )
		vr_controller_type = VR_get_client_controller_type();
#ifdef USE_VR_QVM
	else if ( ps )
		vr_controller_type = ps->vr_controller_type;
	else if( cent )
		vr_controller_type = VR_get_cent_controller_type( cent );
#endif

	// lerp the tag
	trap_R_LerpTag(&lerped, torso->hModel, torso->oldframe, torso->frame, 1.0 - torso->backlerp, "tag_weapon");

	VectorCopy(torso->origin, gun->origin);

	VectorMA(gun->origin, lerped.origin[0], torso->axis[PITCH], gun->origin);

	// Make weapon appear left-handed for 2 and centered for 3
	if (ps && cg_drawGun.integer == 2) {
		VectorMA(gun->origin, -lerped.origin[1], torso->axis[YAW], gun->origin);
	}
	else if (!ps || cg_drawGun.integer != 3) {
		VectorMA(gun->origin, lerped.origin[1], torso->axis[YAW], gun->origin);
	}

	VectorMA(gun->origin, lerped.origin[2], torso->axis[ROLL], gun->origin);

	if (!ps || !vr_controller_type) {
		// had to cast away the const to avoid compiler problems...
		// Not VR client
		MatrixMultiply(lerped.axis, ((refEntity_t *)torso)->axis, gun->axis);
	}
	else {
		// VR client
		// for weapon roll effect
		MatrixMultiply(client_weapon.axis, lerped.axis, client_weapon.axis);
		MatrixMultiply(client_weapon.axis, ((refEntity_t *)torso)->axis, gun->axis); // client_weapon has now roll axis based on VR controller
	}
}
#endif // USE_VR

/*
=================
CG_VR_Menu
Creates an entity menu in front of the current position
(use simple geometry, as seen in tr_surface)
=================
*/
#ifdef USE_VIRTUAL_MENU
void CG_VR_Menu( centity_t *cent ) {
	refEntity_t ent;
	vec3_t		menuAngles;

	// don't update the menu angle each time, in order to obtain a steady menu angle
	if ( !(cent->currentState.eFlags & EF_TALK) ) {
		cent->currentState.menuYaw = -1;// reset angle when user quits menu
		return;
	}
	else {
		// the menu is create from the player origin and view angles.
		// a fixe yaw axis is kept in centity_t otherwise menu follows view.
		if ( cent->currentState.menuYaw == -1 ) {
			cent->currentState.menuYaw = cent->lerpAngles[1];
		}
		//cent->currentState.menuAngleYaw = cent->lerpAngles[1]; // if user want the menu always in front of him

		memset(&ent, 0, sizeof(ent));
		ent.reType = RT_VR_MENU;
		ent.customShader = cgs.media.menu_texture_shader;

		// fixme: with RF_DEPTHHACK laser beam is behing menu / without menu can be hide inside a wall.
		// TODO RF_DEPTHHACK on laser beam, but only in menu?
		ent.renderfx = /*RF_DEPTHHACK |*/ RF_NOSHADOW | RF_LIGHTING_ORIGIN;

		// menu origin
		VectorCopy( cent->lerpOrigin, ent.origin );
		ent.origin[2] += cg.heightStand;

		// menu angles
		menuAngles[0] = 0; // pitch
		menuAngles[1] = cent->currentState.menuYaw; // yaw
		menuAngles[2] = 0; //roll

		if (!vr_controller_type.integer) { // Not a VR client
			menuAngles[1] = cent->lerpAngles[1]; // follow the view in all axes, fixme not perfect
			//VectorCopy(cent->lerpAngles, menuAngles); // follow the view in all axes
		}

		//ent.rotation = menuAngles[1]; // the 3D menu need yaw angle
		ent.rotation = cent->currentState.menuYaw; // the 3D menu need yaw angle

		AnglesToAxis( menuAngles, ent.axis );

		//Move in front of player
		VectorMA(ent.origin, menu_distance.value, ent.axis[0], ent.origin); // distance

		trap_R_AddRefEntityToScene( &ent );
	}
}
#endif
/*
=================
CG_VR_Keyboard
Draw only when cvar showVirtualKeyboard is qtrue
Creates an entity keyboard in front of the current position
(use simple geometry, as seen in tr_surface)
=================
*/
#ifdef USE_VIRTUAL_KEYBOARD
void CG_VR_Keyboard( centity_t *cent ) {
	refEntity_t ent;
	vec3_t		vkbAngles;

	// update angle menu if menu was close
	if (cent->currentState.menuYaw == -1) {
		cent->currentState.menuYaw = cent->lerpAngles[1];
	}

	memset(&ent, 0, sizeof(ent));
	ent.reType = RT_VR_KEYBOARD;
	ent.customShader = trap_R_RegisterShaderNoMip("menu/keyboard_tex.tga");

	VectorCopy(cent->lerpOrigin, ent.origin);
	ent.origin[2] += cg.heightStand;

	// keyboard use menu angles
	vkbAngles[0] = 0; // pitch
	vkbAngles[1] = cent->currentState.menuYaw; // yaw
	vkbAngles[2] = 0; //roll
	ent.rotation = cent->currentState.menuYaw;

	//========================================================
	// If want the keyboard to follow the view
	// VectorCopy(cent->lerpAngles, vkbAngles); // follow the view, à virer
	// vkbAngles[0] = vkbAngles[2] = 0;//à virer
	// ent.rotation = cent->lerpAngles[1];//à virer
	//========================================================

	AnglesToAxis(vkbAngles, ent.axis);

	trap_R_AddRefEntityToScene(&ent);
}
#endif


/*
===============
CG_GetModelHeight
call once at first spawn, or model change
get the model head height when crouch or stand up
arg: position 0 => stand / position 1 => crouch
===============
*/
void CG_GetModelHeight( int position ) {
	clientInfo_t	*ci;
	refEntity_t		legs;
	refEntity_t		torso;
	refEntity_t		head;
	//vec3_t origin = {-1156.339355, -1150.098389, 20.125000 }; // to see result in q3dm0
	vec3_t origin = { 0.0f, 0.0f, 0.0f };
	vec3_t angle = { 0.0f, 0.0f, 0.0f };
	vec3_t angle_leg = { 0.0f, 270.0f, 0.0f };

	ci = &cgs.clientinfo[cg.clientNum];

	memset(&legs, 0, sizeof(legs));
	memset(&torso, 0, sizeof(torso));
	memset(&head, 0, sizeof(head));

	if (position == 0) {
		legs.frame = ci->animations[LEGS_IDLE].firstFrame;
	}
	else {
		legs.frame = ci->animations[LEGS_IDLECR].firstFrame;
	}
	torso.frame = ci->animations[TORSO_STAND].firstFrame;

	//=============================
	//		add the legs
	//=============================
	legs.hModel = ci->legsModel;
	legs.customSkin = ci->legsSkin;
	VectorCopy(origin, legs.origin);
	AnglesToAxis(angle_leg, legs.axis);
	//trap_R_AddRefEntityToScene( &legs ); // to see result
	//=============================
	//	   add the torso
	//=============================
	torso.hModel = ci->torsoModel;
	torso.customSkin = ci->torsoSkin;
	AnglesToAxis(angle, torso.axis);
	/*if (!torso.hModel) { // TODO ckeck what happened when Orbb
		CG_Printf( "[CG_GetModelHeight()] torso.hModel error !!" );
	}*/
	CG_PositionRotatedEntityOnTag(&torso, &legs, ci->legsModel, "tag_torso");
	//trap_R_AddRefEntityToScene( &torso ); // to see result

	//=============================
	//		add the head
	//=============================
	head.hModel = ci->headModel;
	head.customSkin = ci->headSkin;
	AnglesToAxis(angle, head.axis);
	CG_PositionRotatedEntityOnTag(&head, &torso, ci->torsoModel, "tag_head");
	//trap_R_AddRefEntityToScene( &head ); // to see result

	if (position == 0)
		cg.heightStand = head.origin[2];
	else
		cg.heightCrouch = head.origin[2];
}
