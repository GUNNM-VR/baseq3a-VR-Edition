/*
=======================================================================
VR CONFIGURATION MENU
=======================================================================
*/
#include "ui_local.h"

#define ART_BACK0			"menu/art/back_0"
#define ART_BACK1			"menu/art/back_1"
#define ART_FRAMEL			"menu/art/frame2_l"
#define ART_FRAMER			"menu/art/frame1_r"

typedef struct
{
	char*	name;
	float	defaultvalue;
	float	value;	
} configcvar_t;

#define ART_FX_BASE			"menu/art/fx_base"
#define ART_FX_BLUE			"menu/art/fx_blue"
#define ART_FX_CYAN			"menu/art/fx_cyan"
#define ART_FX_GREEN		"menu/art/fx_grn"
#define ART_FX_RED			"menu/art/fx_red"
#define ART_FX_TEAL			"menu/art/fx_teal"
#define ART_FX_WHITE		"menu/art/fx_white"
#define ART_FX_YELLOW		"menu/art/fx_yel"

// VR config sections
#define C_MENUPLANE			0
#define C_BEAM				1
#define C_HUD				2
#define C_MODEL				3
#define C_MAX				4

#define ID_BEAM				100
#define ID_MENUPLANE		101
#define ID_HUD				102
#define ID_MODEL			103

// 3D Menu
#define ID_DISTANCE			10
#define ID_PLANESNUMBER		11
#define ID_MENU_H_RADIUS	12
#define ID_MENU_V_RADIUS	13

// Laser beam
#define ID_BEAM_ENABLE		20
#define ID_BEAM_STABILIZED	21
#define ID_BEAM_COLOR		22
#define ID_BEAM_ALPHA 		23
#define ID_laserBeamOthers 	24

// Player model
#define ID_HIDE_TORSO		40
#define ID_ANGLE_HIDE_TORSO	41

#define ID_BACK				106

typedef struct
{
	menuframework_s		menu;

	menutext_s			banner;
	menubitmap_s		framel;
	menubitmap_s		framer;

	int					section;
	menutext_s			menuplane;
	menutext_s			beam;
	menutext_s			hud;
	menutext_s			model;
	//===================
	// 3D Menu
	//===================
	menuslider_s 		distance;
	menuslider_s 		planesNumber;
	menuslider_s 		menu_Hradius;
	menuslider_s 		menu_Vradius;

	//===================
	// Laser beam
	//===================
	menuradiobutton_s	beam_enable;
	menuradiobutton_s	beam_stabilized;
	menulist_s			beam_color;
	qhandle_t			fxBasePic;
	qhandle_t			fxPic[7];
	int					current_fx;
	menuslider_s 		beam_alpha;
	menuradiobutton_s	laserBeamOthers;

	//===================
	// HUD
	//===================
	//menulist_s  		hud_align;
	//menuslider_s 		hud_align_dist;

	//===================
	// MODEL
	//===================
	menuradiobutton_s	hide_torso;
	menuslider_s		angle_hide_torso;

	//===================
	// ToolsBar
	//===================
	//menuradiobutton_s	toolsbar_enable;
	qboolean			changesmade;
	qboolean			waitingforkey;
	menubitmap_s		back;
} controls_t; 	

static controls_t s_vrconf;

static const char *align_name[] =
{
	"No HUD",
	"Left",
	"Right",
	"Top",
	"Bottom",
	NULL
};

static configcvar_t g_configcvars2[] =
{
	//===================
	// 3d menu
	//===================
	{"menu_distance",		80,			80},
	{"menu_planes_nb",		10,			10},
	{"menu_h_radius",		31.5f,		31.5f},
	{"menu_v_radius",		16.5f,		16.5f},
	//===================
	// Laser beam
	//===================
	{"laserBeamPlayer",		1,			1},
	{"laserBeamStabilized",	1,			1},
	// beam_color & beam_alpha are not real cvar. They will be combined into RGBA laserBeamRGBA
	//{"beam_color",		3,			3}, 
	//{"beam_alpha",		125,		125},
	{"laserBeamOthers",		1,			1}, 
	//===================
	// HUD
	//===================
	// GUNNM TODO do we need those ?
	//{"hud_align",			1,			1}, 	// 0: no HUD, 1: left, 2: right, 3: top, 4: bottom
	//{"hud_align_dist",	110,		110}, 
	//===================
	// MODEL
	//===================
	{"VR_hide_torso",		1,			1},
	{"VR_angle_hide_torso",	5,			5},

	{NULL,					0,			0}
};

static menucommon_s *g_menuplane_vrconf[] = {
	(menucommon_s *)&s_vrconf.distance,
	(menucommon_s *)&s_vrconf.planesNumber,
	(menucommon_s *)&s_vrconf.menu_Hradius,
	(menucommon_s *)&s_vrconf.menu_Vradius,
	NULL
};

static menucommon_s *g_beam_vrconf[] =
{
	(menucommon_s *)&s_vrconf.beam_enable,
	(menucommon_s *)&s_vrconf.beam_stabilized,
	(menucommon_s *)&s_vrconf.beam_color,
	(menucommon_s *)&s_vrconf.beam_alpha,
	(menucommon_s *)&s_vrconf.laserBeamOthers,
	NULL
};

/*static menucommon_s *g_hud_vrconf[] = {
	(menucommon_s *)&s_vrconf.hud_align,
	(menucommon_s *)&s_vrconf.hud_align_dist,
	NULL
};*/

static menucommon_s *g_model_vrconf[] = {
	(menucommon_s *)&s_vrconf.hide_torso,
	(menucommon_s *)&s_vrconf.angle_hide_torso,
	NULL
};

/*static menucommon_s *g_toolsbar_vrconf[] = {
	(menucommon_s *)&s_vrconf.toolsbar_enable, 
	NULL
};*/

static menucommon_s **g_section[] = {
	g_menuplane_vrconf,
	g_beam_vrconf,
	//g_hud_vrconf,
	g_model_vrconf/*,
	g_toolsbar_vrconf*/
};

/*
=================
PlayerSettings_DrawEffects
=================
*/
static void VR_Conf_DrawBeam_color( void *self ) {
	menulist_s		*item;
	qboolean		focus;
	int				style;
	float			*color;

	item = (menulist_s *)self;
	focus = (item->generic.parent->cursor == item->generic.menuPosition);

	style = UI_LEFT|UI_SMALLFONT;
	color = text_color_normal;

	if( focus ) {
		style |= UI_PULSE;
		color = text_color_highlight;
	}

	UI_DrawString( item->generic.x -64, item->generic.y, "color", style, color );
	UI_DrawHandlePic( item->generic.x /*+ 64*/, item->generic.y /*+ PROP_HEIGHT*/ + 8, 128, 8, s_vrconf.fxBasePic );
	UI_DrawHandlePic( item->generic.x /*+ 64*/ + item->curvalue * 16 + 8, item->generic.y /*+ PROP_HEIGHT*/ + 6, 16, 12, s_vrconf.fxPic[item->curvalue] );
}

/*
=================
VRconf_InitCvars
=================
*/
static void VRconf_InitCvars( void )
{
	int				i;
	configcvar_t*	cvarptr;

	cvarptr = g_configcvars2;
	for (i=0; ;i++,cvarptr++)
	{
		if (!cvarptr->name)
			break;

		// get current value
		cvarptr->value = trap_Cvar_VariableValue( cvarptr->name );

		// get default value
		trap_Cvar_Reset( cvarptr->name );
		cvarptr->defaultvalue = trap_Cvar_VariableValue( cvarptr->name );

		// restore current value
		trap_Cvar_SetValue( cvarptr->name, cvarptr->value );
	}
}

/*
=================
VRconf_GetCvarDefault
=================
*/
static float VRconf_GetCvarDefault( char* name )
{
	configcvar_t*	cvarptr;
	int				i;

	cvarptr = g_configcvars2;
	for (i=0; ;i++,cvarptr++)
	{
		if (!cvarptr->name)
			return (0);

		if (!strcmp(cvarptr->name, name))
			break;
	}

	return (cvarptr->defaultvalue);
}

/*
=================
VRconf_GetCvarValue
=================
*/
static float VRconf_GetCvarValue( char* name )
{
	configcvar_t*	cvarptr;
	int				i;

	cvarptr = g_configcvars2;
	for (i=0; ;i++,cvarptr++)
	{
		if (!cvarptr->name)
			return (0);

		if (!strcmp(cvarptr->name,name))
			break;
	}

	return (cvarptr->value);
}

/*
=================
VRconf_Update
=================
*/
static void VRconf_Update( void ) {
	int		i;
	int		j;
	int		y;
	menucommon_s	**controls;
	menucommon_s	*control;

	// disable all controls in all groups
	for( i = 0; i < C_MAX; i++ ) {
		controls = g_section[i];
		for( j = 0;  (control = controls[j]) ; j++ ) {
			control->flags |= (QMF_HIDDEN|QMF_INACTIVE);
		}
	}

	controls = g_section[s_vrconf.section];

	// enable controls in active group (and count number of items for vertical centering)
	for( j = 0;  (control = controls[j]) ; j++ ) {
		control->flags &= ~(QMF_GRAYED|QMF_HIDDEN|QMF_INACTIVE);
	}

	// position controls
	y = ( SCREEN_HEIGHT - j * SMALLCHAR_HEIGHT ) / 2;
	for( j = 0;	(control = controls[j]) ; j++, y += SMALLCHAR_HEIGHT ) {
		control->x      = 320;
		control->y      = y;
		control->left   = 320 - 19*SMALLCHAR_WIDTH;
		control->right  = 320 + 21*SMALLCHAR_WIDTH;
		control->top    = y;
		control->bottom = y + SMALLCHAR_HEIGHT;
	}

	if( s_vrconf.waitingforkey ) {
		// disable everybody
		for( i = 0; i < s_vrconf.menu.nitems; i++ ) {
			((menucommon_s*)(s_vrconf.menu.items[i]))->flags |= QMF_GRAYED;
		}

		// enable action item
		((menucommon_s*)(s_vrconf.menu.items[s_vrconf.menu.cursor]))->flags &= ~QMF_GRAYED;

		// don't gray out player's name
		//s_vrconf.name.generic.flags &= ~QMF_GRAYED;

		return;
	}

	// enable everybody
	for( i = 0; i < s_vrconf.menu.nitems; i++ ) {
		((menucommon_s*)(s_vrconf.menu.items[i]))->flags &= ~QMF_GRAYED;
	}

	// makes sure flags are right on the group selection controls
	s_vrconf.menuplane.generic.flags 	&= ~(QMF_GRAYED|QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
	s_vrconf.beam.generic.flags 		&= ~(QMF_GRAYED|QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
	s_vrconf.hud.generic.flags 			&= ~(QMF_GRAYED|QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
	s_vrconf.model.generic.flags 		&= ~(QMF_GRAYED|QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);

	s_vrconf.menuplane.generic.flags 	|= QMF_PULSEIFFOCUS;
	s_vrconf.beam.generic.flags 		|= QMF_PULSEIFFOCUS;
	s_vrconf.hud.generic.flags     		|= QMF_PULSEIFFOCUS;
	s_vrconf.model.generic.flags     	|= QMF_PULSEIFFOCUS;

	//deactivate some of them
	//s_vrconf.beam_stabilized.generic.flags 	|= QMF_GRAYED;
	//s_vrconf.laserBeamOthers.generic.flags 	|= QMF_GRAYED;

	// set buttons
	switch( s_vrconf.section ) {
	case C_MENUPLANE:
		s_vrconf.menuplane.generic.flags 	&= ~QMF_PULSEIFFOCUS;
		s_vrconf.menuplane.generic.flags 	|= (QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
		break;
	case C_BEAM:
		s_vrconf.beam.generic.flags 		&= ~QMF_PULSEIFFOCUS;
		s_vrconf.beam.generic.flags 		|= (QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
		break;	
	case C_HUD:
		s_vrconf.hud.generic.flags 			&= ~QMF_PULSEIFFOCUS;
		s_vrconf.hud.generic.flags 			|= (QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
		break;
	case C_MODEL:
		s_vrconf.model.generic.flags 		&= ~QMF_PULSEIFFOCUS;
		s_vrconf.model.generic.flags 		|= (QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
		break;
	}
}

/*
=================
VRconf_StatusBar
=================
*/
static void VRconf_StatusBar( void *self )
{
	//UI_DrawString(SCREEN_WIDTH * 0.50, SCREEN_HEIGHT * 0.80, "Use Arrow Keys or CLICK to change", UI_SMALLFONT|UI_CENTER, colorWhite );
}


int stringHexToQ3Color(char * rgba)
{
	int res = 0;
	char *rgb = "0x000000";
	strncpy(rgb, rgba, 8);
	if 	   (strcmp(rgb, "0xFF0000") == 0) // red
		res = 0;
	else if(strcmp(rgb, "0xFFD800") == 0) // yellow
		res = 1;
	else if(strcmp(rgb, "0x00FF00") == 0) // light green
		res = 2;
	else if(strcmp(rgb, "0x00FFFF") == 0) // light blue
		res = 3;
	else if(strcmp(rgb, "0x0000FF") == 0) // dark blue
		res = 4;
	else if(strcmp(rgb, "0xFF00FF") == 0) // purple
		res = 5;
	else if(strcmp(rgb, "0xFFFFFF") == 0) // white
		res = 6;
	return res;
}


/*
=================
VRconf_GetConfig
=================
*/
static void VRconf_GetConfig( void )
{
	//int		i;
	//int clamp = SCREEN_WIDTH;

	char * laserBeamRGBA = UI_Cvar_VariableString("laserBeamRGBA");
	//char * laserBeamRGB;
	char * alpha = "0000FFC0";// alloc with the final size

	// get alpha from laserBeamRGBA
	memcpy(alpha, &laserBeamRGBA[8], sizeof(alpha)); 
	
	//===================
	// 3D Menu
	//===================
	s_vrconf.distance.curvalue 			= UI_ClampCvar( 15, 150,		VRconf_GetCvarValue( "menu_distance" ) );
	s_vrconf.planesNumber.curvalue 		= UI_ClampCvar( 0, 30,			VRconf_GetCvarValue( "menu_planes_nb" ) );
	s_vrconf.menu_Hradius.curvalue 		= UI_ClampCvar( -20.0f, 40.0f,	VRconf_GetCvarValue( "menu_h_radius" ) );
	s_vrconf.menu_Vradius.curvalue 		= UI_ClampCvar( -20.0, 40.0f,	VRconf_GetCvarValue( "menu_v_radius" ) );

	//===================
	// Laser beam
	//===================
	s_vrconf.beam_enable.curvalue 		= UI_ClampCvar( 0, 1, VRconf_GetCvarValue( "laserBeamPlayer" ) );
	s_vrconf.beam_stabilized.curvalue 	= UI_ClampCvar( 0, 1, VRconf_GetCvarValue( "laserBeamStabilized" ) );
	s_vrconf.beam_color.curvalue 		= stringHexToQ3Color(laserBeamRGBA);
	s_vrconf.beam_alpha.curvalue = 255;// strtol(alpha, NULL, 16);// TODO strtol



	// others ?
	s_vrconf.laserBeamOthers.curvalue 	= UI_ClampCvar( 0, 1, VRconf_GetCvarValue( "laserBeamOthers" ) );
	//===================
	// HUD
	//===================
	// hud_align 0: no HUD, 1: left, 2: right, 3: top, 4: bottom
	//s_vrconf.hud_align.curvalue 		= UI_ClampCvar( 0, 4, VRconf_GetCvarValue( "hud_align" ) );

	/*if (s_vrconf.hud_align.curvalue == 3 || s_vrconf.hud_align.curvalue == 4)
		clamp = SCREEN_HEIGHT;*/
	//s_vrconf.hud_align_dist.curvalue 	= UI_ClampCvar( 0, 128, VRconf_GetCvarValue( "hud_align_dist" ) );
	//===================
	// MODEL
	//===================
	s_vrconf.hide_torso.curvalue 		= UI_ClampCvar( 0, 1, VRconf_GetCvarValue( "VR_hide_torso" ) );
	s_vrconf.angle_hide_torso.curvalue 	= UI_ClampCvar( 0, 45, VRconf_GetCvarValue( "VR_angle_hide_torso" ) );
}


char * intColorToHexString( int q3Color, int alpha )
{
	char * alphaStr = "FF";
	char * res = "0xFFFFFF";

	switch ( q3Color )
	{
	case 0: // red
		res = "0xFF0000";
		break;
	case 1: // yellow
		res = "0xFFD8008";
		break;
	case 2: // light green
		res = "0x00FF00";
		break;
	case 3: // light blue
		res = "0x00FFFF";
		break;
	case 4: // dark blue
		res = "0x0000FF";
		break;
	case 5: // purple
		res = "0xFF00FF";
		break;
	case 6: // white
		res = "0xFFFFFF";
		break;
	default:// default red
		res = "0xFF0000";
		break;
	}

	//add alpha
	BG_sprintf(alphaStr, "%x", alpha);

	strcat(res, alphaStr);
	return res;
}

/*
=================
VRconf_SetConfig
=================
*/

static void VRconf_SetConfig( void )
{
	/*char * rgba_buf;
	//===================
	// 3D Menu
	//===================
	trap_Cvar_SetValue( "menu_distance", s_vrconf.distance.curvalue );
	trap_Cvar_SetValue( "menu_planes_nb", s_vrconf.planesNumber.curvalue );
	trap_Cvar_SetValue( "menu_h_radius", s_vrconf.menu_Hradius.curvalue );
	trap_Cvar_SetValue( "menu_v_radius", s_vrconf.menu_Vradius.curvalue );

	//===================
	// Laser beam
	//===================
	trap_Cvar_SetValue( "laserBeamPlayer", s_vrconf.beam_enable.curvalue );
	trap_Cvar_SetValue( "laserBeamStabilized", s_vrconf.beam_stabilized.curvalue );

	// Beam color
	rgba_buf = intColorToHexString( s_vrconf.beam_color.curvalue, s_vrconf.beam_alpha.curvalue );
	trap_Cvar_Set( "laserBeamRGBA", rgba_buf );
	trap_Cvar_SetValue( "laserBeamOthers", s_vrconf.laserBeamOthers.curvalue );

	//===================
	// HUD
	//===================
	trap_Cvar_SetValue( "hud_align", s_vrconf.hud_align.curvalue );
	trap_Cvar_SetValue( "hud_align_dist", UI_ClampCvar( 0, 128, s_vrconf.hud_align_dist.curvalue ) );

	trap_Cmd_ExecuteText( EXEC_APPEND, "in_restart\n" );*/
}

/*
=================
VRconf_SetDefaults
=================
*/
static void VRconf_SetDefaults( void )
{
	//===================
	// menu
	//===================
	s_vrconf.distance.curvalue 			= VRconf_GetCvarDefault( "menu_distance" );
	s_vrconf.planesNumber.curvalue 		= VRconf_GetCvarDefault( "menu_planes_nb" );
	s_vrconf.menu_Hradius.curvalue 		= VRconf_GetCvarDefault( "menu_h_radius" );
	s_vrconf.menu_Vradius.curvalue 		= VRconf_GetCvarDefault( "menu_v_radius" );

	//===================
	// beam
	//===================
	s_vrconf.beam_enable.curvalue 		= VRconf_GetCvarDefault( "laserBeamPlayer" );
	s_vrconf.beam_stabilized.curvalue 	= VRconf_GetCvarDefault( "laserBeamStabilized" );
	s_vrconf.beam_color.curvalue 		= VRconf_GetCvarDefault( "laserBeamRGBA" );
	s_vrconf.laserBeamOthers.curvalue 	= VRconf_GetCvarDefault( "laserBeamOthers" );

	//===================
	// HUD
	//===================
	//s_vrconf.hud_align.curvalue 		= VRconf_GetCvarDefault( "hud_align" );

	//===================
	// MODEL
	//===================
	s_vrconf.hide_torso.curvalue 		= VRconf_GetCvarDefault( "VR_hide_torso" );
	s_vrconf.angle_hide_torso.curvalue 	= VRconf_GetCvarDefault( "VR_angle_hide_torso" );
}

/*
=================
VRconf_MenuKey
=================
*/
static sfxHandle_t VRconf_MenuKey( int key )
{
	//int			id;
	//int			i;
	qboolean	found;
	found = qfalse;

	if (!s_vrconf.waitingforkey)
	{
		switch (key)
		{
			case K_BACKSPACE:
			case K_DEL:
			case K_KP_DEL:
				key = -1;
				break;
		
			case K_MOUSE2:
			case K_ESCAPE:
				if (s_vrconf.changesmade)
				{
					VRconf_SetConfig();
				}
				goto ignorekey;	

			default:
				goto ignorekey;
		}
	}
	else
	{
		if (key & K_CHAR_FLAG)
			goto ignorekey;

		switch (key)
		{
			case K_ESCAPE:
				s_vrconf.waitingforkey = qfalse;
				VRconf_Update();
				return (menu_out_sound);
	
			case '`':
				goto ignorekey;
		}
	}

	s_vrconf.changesmade = qtrue;
	s_vrconf.waitingforkey = qfalse;

	if (found)
	{	
		VRconf_Update();
		return (menu_out_sound);
	}

ignorekey:
	return Menu_DefaultKey( &s_vrconf.menu, key );
}

/*
=================
VRconf_ResetDefaults_Action
=================
*/
static void VRconf_ResetDefaults_Action( qboolean result ) {
	if( !result ) {
		return;
	}

	s_vrconf.changesmade = qtrue;
	VRconf_SetDefaults();
	VRconf_Update();
}

/*
=================
VRconf_ResetDefaults_Draw
=================
*/
static void VRconf_ResetDefaults_Draw( void ) {
	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 0, "WARNING: This will reset all", UI_CENTER|UI_SMALLFONT, color_yellow );
	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 1, "controls to their default values.", UI_CENTER|UI_SMALLFONT, color_yellow );
}

/*
=================
VRconf_MenuEvent
=================
*/
static void VRconf_MenuEvent( void* ptr, int event )
{
	char * rgba_buf;

	if (event == QM_ACTIVATED)
	{
		s_vrconf.changesmade = qtrue;
		switch (((menucommon_s*)ptr)->id)
		{
			//======================================
			// SECTION
			//======================================
			case ID_MENUPLANE:
				s_vrconf.section = C_MENUPLANE; 
				VRconf_Update();
				break;
			case ID_BEAM:
				s_vrconf.section = C_BEAM; 
				VRconf_Update();
				break;
			case ID_HUD:
				s_vrconf.section = C_HUD; 
				VRconf_Update();
				break;
			case ID_MODEL:
				s_vrconf.section = C_MODEL; 
				VRconf_Update();
				break;
			case ID_BACK:
				if (s_vrconf.changesmade)
				{
					VRconf_SetConfig();
				}
				UI_PopMenu();
				break;
			/*case ID_DEFAULTS:
				UI_ConfirmMenu( "SET TO DEFAULTS?", VRconf_ResetDefaults_Draw, VRconf_ResetDefaults_Action );
				break;
			case ID_SAVEANDEXIT:
				VRconf_SetConfig();
				UI_PopMenu();
				break;
			case ID_EXIT:
				UI_PopMenu();
				break;*/
			//======================================
			// SUB SECTION
			//======================================
			//===================
			// 3D Menu
			//===================
			case ID_DISTANCE:
				s_vrconf.changesmade = qtrue;
				trap_Cvar_SetValue( "menu_distance", s_vrconf.distance.curvalue );
				break;
			case ID_PLANESNUMBER:
				s_vrconf.changesmade = qtrue;
				trap_Cvar_SetValue( "menu_planes_nb", s_vrconf.planesNumber.curvalue );
				break;
			case ID_MENU_H_RADIUS:
				s_vrconf.changesmade = qtrue;
				trap_Cvar_SetValue( "menu_h_radius", s_vrconf.menu_Hradius.curvalue );
				break;
			case ID_MENU_V_RADIUS:
				s_vrconf.changesmade = qtrue;
				trap_Cvar_SetValue( "menu_v_radius", s_vrconf.menu_Vradius.curvalue );
				break;
			//===================
			// Laser beam
			//===================
			case ID_BEAM_ENABLE:
				s_vrconf.changesmade = qtrue;
				trap_Cvar_SetValue( "laserBeamPlayer", s_vrconf.beam_enable.curvalue );
				break;
			case ID_BEAM_STABILIZED:
				s_vrconf.changesmade = qtrue;
				trap_Cvar_SetValue( "laserBeamStabilized", s_vrconf.beam_stabilized.curvalue );
				break;
			case ID_BEAM_COLOR:
				s_vrconf.changesmade = qtrue;
				rgba_buf = intColorToHexString( s_vrconf.beam_color.curvalue, s_vrconf.beam_alpha.curvalue );
				trap_Cvar_Set( "laserBeamRGBA", rgba_buf );
				break;
			case ID_BEAM_ALPHA:
				s_vrconf.changesmade = qtrue;
				rgba_buf = intColorToHexString( s_vrconf.beam_color.curvalue, s_vrconf.beam_alpha.curvalue );
				trap_Cvar_Set( "laserBeamRGBA", rgba_buf );
				break;
			case ID_laserBeamOthers:
				s_vrconf.changesmade = qtrue;
				trap_Cvar_SetValue( "laserBeamOthers", s_vrconf.laserBeamOthers.curvalue );
				break;
			//===================
			// HUD
			//===================
			/*case ID_HUD_ALIGN:
				s_vrconf.changesmade = qtrue;
				trap_Cvar_SetValue( "hud_align", s_vrconf.hud_align.curvalue );
				break;
			case ID_HUD_ALIGN_DIST:
				s_vrconf.changesmade = qtrue;*/
				//VRconf_SetConfig();
			/*	trap_Cvar_SetValue( "hud_align_dist", UI_ClampCvar( 0, 128, s_vrconf.hud_align_dist.curvalue ) );
				break;*/
			//===================
			// MODEL
			//===================
			case ID_HIDE_TORSO:
				s_vrconf.changesmade = qtrue;
				trap_Cvar_SetValue( "VR_hide_torso", s_vrconf.hide_torso.curvalue );
				break;
			case ID_ANGLE_HIDE_TORSO:
				s_vrconf.changesmade = qtrue;
				trap_Cvar_SetValue( "VR_angle_hide_torso", UI_ClampCvar( 0, 45, s_vrconf.angle_hide_torso.curvalue ) );
				break;
		}
	}
}

/*
=================
VRconf_MenuInit
=================
*/
static void VRconf_MenuInit( void )
{
	static char playername[32];
	int x, y;
	// zero set all our globals
	memset( &s_vrconf, 0 ,sizeof(controls_t) );

	VRconf_Cache();

	s_vrconf.menu.key        	= VRconf_MenuKey;
	s_vrconf.menu.wrapAround 	= qtrue;
	s_vrconf.menu.fullscreen 	= qtrue;

	//==========================================================================
	// 							Title & Background
	//==========================================================================

	s_vrconf.banner.generic.type	= MTYPE_BTEXT;
	s_vrconf.banner.generic.flags	= QMF_CENTER_JUSTIFY;
	s_vrconf.banner.generic.x		= 320;
	s_vrconf.banner.generic.y		= 16;
	s_vrconf.banner.string 			= "VR configuration";
	s_vrconf.banner.color			= color_white;
	s_vrconf.banner.style			= UI_CENTER;


	s_vrconf.framel.generic.type 	= MTYPE_BITMAP;
	s_vrconf.framel.generic.name 	= ART_FRAMEL;
	s_vrconf.framel.generic.flags 	= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
	s_vrconf.framel.generic.x 		= 0;
	s_vrconf.framel.generic.y 		= 78;
	s_vrconf.framel.width 			= 256;
	s_vrconf.framel.height  	    = 329;


	s_vrconf.framer.generic.type 	= MTYPE_BITMAP;
	s_vrconf.framer.generic.name 	= ART_FRAMER;
	s_vrconf.framer.generic.flags 	= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
	s_vrconf.framer.generic.x 		= 376;
	s_vrconf.framer.generic.y 		= 76;
	s_vrconf.framer.width 			= 256;
	s_vrconf.framer.height 			= 334;

	//==========================================================================
	// 							3D Menu
	//==========================================================================
	// Section
	s_vrconf.menuplane.generic.type     = MTYPE_PTEXT;
	s_vrconf.menuplane.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
	s_vrconf.menuplane.generic.id	    = ID_MENUPLANE;
	s_vrconf.menuplane.generic.callback	= VRconf_MenuEvent;
	s_vrconf.menuplane.generic.x	    = 152;
	s_vrconf.menuplane.generic.y	    = 240 - 2 * PROP_HEIGHT;
	s_vrconf.menuplane.string			= "MENU";
	s_vrconf.menuplane.style			= UI_RIGHT;
	s_vrconf.menuplane.color			= color_red;

	//Sub-Section
	s_vrconf.distance.generic.type 			= MTYPE_SLIDER;
	s_vrconf.distance.generic.x	 			= SCREEN_WIDTH/2;
	s_vrconf.distance.generic.flags 		= QMF_SMALLFONT;
	s_vrconf.distance.generic.name 			= "distance";
	s_vrconf.distance.generic.id 			= ID_DISTANCE;
	s_vrconf.distance.generic.callback 		= VRconf_MenuEvent;
	s_vrconf.distance.minvalue 				= 30;
	s_vrconf.distance.maxvalue 				= 150;
	s_vrconf.distance.generic.statusbar 	= VRconf_StatusBar;

	s_vrconf.planesNumber.generic.type 		= MTYPE_SLIDER;
	s_vrconf.planesNumber.generic.x 		= SCREEN_WIDTH/2;
	s_vrconf.planesNumber.generic.flags 	= QMF_SMALLFONT;
	s_vrconf.planesNumber.generic.name 		= "planes number";
	s_vrconf.planesNumber.generic.id 		= ID_PLANESNUMBER;
	s_vrconf.planesNumber.generic.callback 	= VRconf_MenuEvent;
	s_vrconf.planesNumber.minvalue 			= 1;
	s_vrconf.planesNumber.maxvalue 			= 30;
	s_vrconf.planesNumber.generic.statusbar = VRconf_StatusBar;

	s_vrconf.menu_Hradius.generic.type 		= MTYPE_SLIDER;
	s_vrconf.menu_Hradius.generic.x 		= SCREEN_WIDTH/2;
	s_vrconf.menu_Hradius.generic.flags 	= QMF_SMALLFONT;
	s_vrconf.menu_Hradius.generic.name 		= "h radius";
	s_vrconf.menu_Hradius.generic.id 		= ID_MENU_H_RADIUS;
	s_vrconf.menu_Hradius.generic.callback 	= VRconf_MenuEvent;
	s_vrconf.menu_Hradius.minvalue 			= 0.0f;
	s_vrconf.menu_Hradius.maxvalue 			= 40.0f;
	s_vrconf.menu_Hradius.generic.statusbar = VRconf_StatusBar;

	s_vrconf.menu_Vradius.generic.type 		= MTYPE_SLIDER;
	s_vrconf.menu_Vradius.generic.x 		= SCREEN_WIDTH/2;
	s_vrconf.menu_Vradius.generic.flags 	= QMF_SMALLFONT;
	s_vrconf.menu_Vradius.generic.name 		= "v radius";
	s_vrconf.menu_Vradius.generic.id 		= ID_MENU_V_RADIUS;
	s_vrconf.menu_Vradius.generic.callback 	= VRconf_MenuEvent;
	s_vrconf.menu_Vradius.minvalue 			= 0.0f;
	s_vrconf.menu_Vradius.maxvalue 			= 40.0f;
	s_vrconf.menu_Vradius.generic.statusbar = VRconf_StatusBar;

	//==========================================================================
	// 							Laser beam
	//==========================================================================
	// Section
	s_vrconf.beam.generic.type 			= MTYPE_PTEXT;
	s_vrconf.beam.generic.flags 		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
	s_vrconf.beam.generic.id 			= ID_BEAM;
	s_vrconf.beam.generic.callback 		= VRconf_MenuEvent;
	s_vrconf.beam.generic.x 			= 152;
	s_vrconf.beam.generic.y 			= 240 - PROP_HEIGHT;
	s_vrconf.beam.string 				= "Beam";
	s_vrconf.beam.style 				= UI_RIGHT;
	s_vrconf.beam.color 				= color_red;

	//Sub-Section
	s_vrconf.beam_enable.generic.type 		= MTYPE_RADIOBUTTON;
	s_vrconf.beam_enable.generic.flags 		= QMF_SMALLFONT;
	s_vrconf.beam_enable.generic.x 			= SCREEN_WIDTH/2;
	s_vrconf.beam_enable.generic.name 		= "enable";
	s_vrconf.beam_enable.generic.id 		= ID_BEAM_ENABLE;
	s_vrconf.beam_enable.generic.callback 	= VRconf_MenuEvent;
	s_vrconf.beam_enable.generic.statusbar 	= VRconf_StatusBar;

	s_vrconf.beam_stabilized.generic.type 	= MTYPE_RADIOBUTTON;
	s_vrconf.beam_stabilized.generic.flags 	= QMF_SMALLFONT;
	s_vrconf.beam_stabilized.generic.x 		= SCREEN_WIDTH/2;
	s_vrconf.beam_stabilized.generic.name 	= "stabilized";
	s_vrconf.beam_stabilized.generic.id 	= ID_BEAM_STABILIZED;
	s_vrconf.beam_stabilized.generic.callback 	= VRconf_MenuEvent;
	s_vrconf.beam_stabilized.generic.statusbar 	= VRconf_StatusBar;

	y = 170;
	y += 3 * PROP_HEIGHT;
	x= 0;
	s_vrconf.beam_color.generic.type		= MTYPE_SPINCONTROL;
	s_vrconf.beam_color.generic.flags		= QMF_NODEFAULTINIT;
	s_vrconf.beam_color.generic.id			= ID_BEAM_COLOR;
	s_vrconf.beam_color.generic.ownerdraw	= VR_Conf_DrawBeam_color;
	s_vrconf.beam_color.generic.x			= x;
	s_vrconf.beam_color.generic.y			= y;
	s_vrconf.beam_color.generic.left		= x;
	s_vrconf.beam_color.generic.top 		= y - 8;
	s_vrconf.beam_color.generic.right		= x + 200;
	s_vrconf.beam_color.generic.bottom		= y;
	s_vrconf.beam_color.numitems			= 7;
	s_vrconf.beam_color.generic.callback 	= VRconf_MenuEvent;


	s_vrconf.beam_alpha.generic.type 		= MTYPE_SLIDER;
	s_vrconf.beam_alpha.generic.x 			= SCREEN_WIDTH/2;
	s_vrconf.beam_alpha.generic.flags 		= QMF_SMALLFONT;
	s_vrconf.beam_alpha.generic.name 		= "transparency";
	s_vrconf.beam_alpha.generic.id 			= ID_BEAM_ALPHA;
	s_vrconf.beam_alpha.generic.callback 	= VRconf_MenuEvent;
	s_vrconf.beam_alpha.minvalue 			= 0;
	s_vrconf.beam_alpha.maxvalue 			= 255;
	s_vrconf.beam_alpha.generic.statusbar 	= VRconf_StatusBar;


	s_vrconf.laserBeamOthers.generic.type 		= MTYPE_RADIOBUTTON;
	s_vrconf.laserBeamOthers.generic.flags 		= QMF_SMALLFONT;
	s_vrconf.laserBeamOthers.generic.x 			= SCREEN_WIDTH/2;
	s_vrconf.laserBeamOthers.generic.name 		= "Others players'beam";// (when server allow it)";
	s_vrconf.laserBeamOthers.generic.id 		= ID_laserBeamOthers;
	s_vrconf.laserBeamOthers.generic.callback 	= VRconf_MenuEvent;
	s_vrconf.laserBeamOthers.generic.statusbar 	= VRconf_StatusBar;

	//==========================================================================
	// 							HUD
	//==========================================================================
	// Section
	s_vrconf.hud.generic.type 			= MTYPE_PTEXT;
	s_vrconf.hud.generic.flags 			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
	s_vrconf.hud.generic.id 			= ID_HUD;
	s_vrconf.hud.generic.callback 		= VRconf_MenuEvent;
	s_vrconf.hud.generic.x 				= 152;
	s_vrconf.hud.generic.y	    		= 240;
	s_vrconf.hud.string 				= "HUD";
	s_vrconf.hud.style 					= UI_RIGHT;
	s_vrconf.hud.color 					= color_red;

	//Sub-Section
	/*y = BIGCHAR_HEIGHT+2;
	s_vrconf.hud_align.generic.type 	= MTYPE_SPINCONTROL;
	s_vrconf.hud_align.generic.id 		= ID_HUD_ALIGN;
	s_vrconf.hud_align.generic.name 	= "HUD align:";
	s_vrconf.hud_align.generic.flags 	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_vrconf.hud_align.generic.x 		= 400;
	s_vrconf.hud_align.generic.y 		= y;
	s_vrconf.hud_align.itemnames 		= align_name;
	s_vrconf.hud_align.generic.callback	= VRconf_MenuEvent;


	s_vrconf.hud_align_dist.generic.type 	= MTYPE_SLIDER;
	s_vrconf.hud_align_dist.generic.id 		= ID_HUD_ALIGN_DIST;
	s_vrconf.hud_align_dist.generic.name 	= "Border distance:";
	s_vrconf.hud_align_dist.generic.flags 	= QMF_SMALLFONT;
	s_vrconf.hud_align_dist.generic.x 		= SCREEN_WIDTH/2;
	s_vrconf.hud_align_dist.generic.callback= VRconf_MenuEvent;
	s_vrconf.hud_align_dist.minvalue 		= 2;
	s_vrconf.hud_align_dist.maxvalue 		= 128;//SCREEN_WIDTH/4;
	s_vrconf.hud_align_dist.generic.statusbar = VRconf_StatusBar;*/

	//==========================================================================
	// 							MODEL
	//==========================================================================
	// Section
	s_vrconf.model.generic.type 		= MTYPE_PTEXT;
	s_vrconf.model.generic.flags 		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
	s_vrconf.model.generic.id 			= ID_MODEL;
	s_vrconf.model.generic.callback 	= VRconf_MenuEvent;
	s_vrconf.model.generic.x 			= 152;
	s_vrconf.model.generic.y	    	= 240 + PROP_HEIGHT;
	s_vrconf.model.string 				= "MODEL";
	s_vrconf.model.style 				= UI_RIGHT;
	s_vrconf.model.color 				= color_red;

	//Sub-Section
	s_vrconf.hide_torso.generic.type 	= MTYPE_RADIOBUTTON;
	s_vrconf.hide_torso.generic.flags 	= QMF_SMALLFONT;
	s_vrconf.hide_torso.generic.x 		= SCREEN_WIDTH/2;
	s_vrconf.hide_torso.generic.name 	= "Hide torso";
	s_vrconf.hide_torso.generic.id 		= ID_HIDE_TORSO;
	s_vrconf.hide_torso.generic.callback = VRconf_MenuEvent;
	s_vrconf.hide_torso.generic.statusbar = VRconf_StatusBar;

	s_vrconf.angle_hide_torso.generic.type 	= MTYPE_SLIDER;
	s_vrconf.angle_hide_torso.generic.id 	= ID_ANGLE_HIDE_TORSO;
	s_vrconf.angle_hide_torso.generic.name 	= "Auto Hide torso";
	s_vrconf.angle_hide_torso.generic.flags = QMF_SMALLFONT;
	s_vrconf.angle_hide_torso.generic.x 	= SCREEN_WIDTH/2;
	s_vrconf.angle_hide_torso.generic.callback = VRconf_MenuEvent;
	s_vrconf.angle_hide_torso.minvalue 		= 0;
	s_vrconf.angle_hide_torso.maxvalue 		= 45;
	s_vrconf.angle_hide_torso.generic.statusbar = VRconf_StatusBar;

	//==========================================================================
	// 							Back Button
	//==========================================================================
	s_vrconf.back.generic.type 			= MTYPE_BITMAP;
	s_vrconf.back.generic.name 			= ART_BACK0;
	s_vrconf.back.generic.flags 		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
	s_vrconf.back.generic.x 			= 0;
	s_vrconf.back.generic.y 			= 480-64;
	s_vrconf.back.generic.id 			= ID_BACK;
	s_vrconf.back.generic.callback 		= VRconf_MenuEvent;
	s_vrconf.back.width 				= 128;
	s_vrconf.back.height 				= 64;
	s_vrconf.back.focuspic 				= ART_BACK1;

	// add title & background
	Menu_AddItem( &s_vrconf.menu, &s_vrconf.banner );
	Menu_AddItem( &s_vrconf.menu, &s_vrconf.framel );
	Menu_AddItem( &s_vrconf.menu, &s_vrconf.framer );

	// add section
	Menu_AddItem( &s_vrconf.menu, &s_vrconf.menuplane );
	Menu_AddItem( &s_vrconf.menu, &s_vrconf.beam );
	Menu_AddItem( &s_vrconf.menu, &s_vrconf.hud );
	Menu_AddItem( &s_vrconf.menu, &s_vrconf.model );
	//Menu_AddItem( &s_vrconf.menu, &s_vrconf.toolsbar );

	// 3D Menu subsections
	Menu_AddItem( &s_vrconf.menu, &s_vrconf.distance );
	Menu_AddItem( &s_vrconf.menu, &s_vrconf.planesNumber );
	Menu_AddItem( &s_vrconf.menu, &s_vrconf.menu_Hradius );
	Menu_AddItem( &s_vrconf.menu, &s_vrconf.menu_Vradius );

	// Laser Beam subsections
	Menu_AddItem( &s_vrconf.menu, &s_vrconf.beam_enable );
	Menu_AddItem( &s_vrconf.menu, &s_vrconf.beam_stabilized );
	Menu_AddItem( &s_vrconf.menu, &s_vrconf.beam_color );
	Menu_AddItem( &s_vrconf.menu, &s_vrconf.beam_alpha );
	Menu_AddItem( &s_vrconf.menu, &s_vrconf.laserBeamOthers );

	// HUD subsections
	//Menu_AddItem( &s_vrconf.menu, &s_vrconf.hud_align );
	//Menu_AddItem( &s_vrconf.menu, &s_vrconf.hud_align_dist );

	// MODEL subsections
	Menu_AddItem( &s_vrconf.menu, &s_vrconf.hide_torso );
	Menu_AddItem( &s_vrconf.menu, &s_vrconf.angle_hide_torso );

	Menu_AddItem( &s_vrconf.menu, &s_vrconf.back );

	// initialize the configurable cvars
	VRconf_InitCvars();

	// initialize the current config
	VRconf_GetConfig();

	// initial default section
	s_vrconf.section = C_MENUPLANE;

	// update the ui
	VRconf_Update();
}

/*
=================
VRconf_Cache
=================
*/
void VRconf_Cache( void ) {
	trap_R_RegisterShaderNoMip( ART_BACK0 );
	trap_R_RegisterShaderNoMip( ART_BACK1 );
	trap_R_RegisterShaderNoMip( ART_FRAMEL );
	trap_R_RegisterShaderNoMip( ART_FRAMER );

	s_vrconf.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
	s_vrconf.fxPic[0] = trap_R_RegisterShaderNoMip( ART_FX_RED );
	s_vrconf.fxPic[1] = trap_R_RegisterShaderNoMip( ART_FX_YELLOW );
	s_vrconf.fxPic[2] = trap_R_RegisterShaderNoMip( ART_FX_GREEN );
	s_vrconf.fxPic[3] = trap_R_RegisterShaderNoMip( ART_FX_TEAL );
	s_vrconf.fxPic[4] = trap_R_RegisterShaderNoMip( ART_FX_BLUE );
	s_vrconf.fxPic[5] = trap_R_RegisterShaderNoMip( ART_FX_CYAN );
	s_vrconf.fxPic[6] = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
}

/*
=================
UI_VRconfMenu
=================
*/
void UI_VRconfMenu( void ) {
	VRconf_MenuInit();
	UI_PushMenu( &s_vrconf.menu );
}
