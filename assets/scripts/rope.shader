
rope
{
	sort nearest
	cull none
	{
		map gfx/misc/rope.tga
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		tcMod turb 0 0.2 0 1
	}
}

grapplingChain
{
	nopicmip
	//novlcollapse
	cull disable
	{
		map gfx/misc/grapplingchain.tga
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
		depthFunc equal
	}
}