export Com_Clamp
code
proc Com_Clamp 0 0
file "..\..\..\..\code\game\q_shared.c"
line 7
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// q_shared.c -- stateless support routines that are included in each code dll
;4:#include "q_shared.h"
;5:
;6:// TODO move me in math.c ?
;7:float Com_Clamp( float min, float max, float value ) {
line 8
;8:	if ( value < min ) {
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $22
line 9
;9:		return min;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $21
JUMPV
LABELV $22
line 11
;10:	}
;11:	if ( value > max ) {
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $24
line 12
;12:		return max;
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $21
JUMPV
LABELV $24
line 14
;13:	}
;14:	return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $21
endproc Com_Clamp 0 0
proc hex2int 20 0
line 19
;15:}
;16:
;17:#ifdef USE_LASER_SIGHT
;18:static unsigned int hex2int(const char *str)
;19:{
line 21
;20:	int i;
;21:	int len = 2;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 22
;22:	unsigned long val = 0;
ADDRLP4 8
CNSTU4 0
ASGNU4
line 24
;23:
;24:	for (i = 0; i < len; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $30
JUMPV
LABELV $27
line 25
;25:		if (str[i] <= 57)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 57
GTI4 $31
line 26
;26:			val += (str[i] - '0')*(1 << (4 * (len - 1 - i)));
ADDRLP4 8
ADDRLP4 8
INDIRU4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 1
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
LSHI4
MULI4
CVIU4 4
ADDU4
ASGNU4
ADDRGP4 $32
JUMPV
LABELV $31
line 28
;27:		else
;28:			val += (str[i] - 'A' + 10)*(1 << (4 * (len - 1 - i)));
ADDRLP4 8
ADDRLP4 8
INDIRU4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 65
SUBI4
CNSTI4 10
ADDI4
CNSTI4 1
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
LSHI4
MULI4
CVIU4 4
ADDU4
ASGNU4
LABELV $32
LABELV $28
line 24
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $30
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $27
line 30
;29:
;30:	return val;
ADDRLP4 8
INDIRU4
RETU4
LABELV $26
endproc hex2int 20 0
export hex_to_color
proc hex_to_color 20 12
line 33
;31:}
;32:
;33:void hex_to_color(const char *str, byte *color_rgba) {
line 36
;34:	char tmp[2];
;35:
;36:	memcpy(tmp, &str[0], sizeof(tmp));
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 37
;37:	color_rgba[0] = (byte)hex2int(tmp);
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 hex2int
CALLU4
ASGNU4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRU4
CVUU1 4
ASGNU1
line 39
;38:
;39:	memcpy(tmp, &str[2], sizeof(tmp));
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 40
;40:	color_rgba[1] = (byte)hex2int(tmp);
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 hex2int
CALLU4
ASGNU4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ADDRLP4 8
INDIRU4
CVUU1 4
ASGNU1
line 42
;41:
;42:	memcpy(tmp, &str[4], sizeof(tmp));
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 43
;43:	color_rgba[2] = (byte)hex2int(tmp);
ADDRLP4 0
ARGP4
ADDRLP4 12
ADDRGP4 hex2int
CALLU4
ASGNU4
ADDRFP4 4
INDIRP4
CNSTI4 2
ADDP4
ADDRLP4 12
INDIRU4
CVUU1 4
ASGNU1
line 45
;44:
;45:	memcpy(tmp, &str[6], sizeof(tmp));
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 46
;46:	color_rgba[3] = (byte)hex2int(tmp);
ADDRLP4 0
ARGP4
ADDRLP4 16
ADDRGP4 hex2int
CALLU4
ASGNU4
ADDRFP4 4
INDIRP4
CNSTI4 3
ADDP4
ADDRLP4 16
INDIRU4
CVUU1 4
ASGNU1
line 47
;47:}
LABELV $33
endproc hex_to_color 20 12
export COM_SkipPath
proc COM_SkipPath 4 0
line 56
;48:#endif
;49:
;50:/*
;51:============
;52:COM_SkipPath
;53:============
;54:*/
;55:char *COM_SkipPath (char *pathname)
;56:{
line 59
;57:	char	*last;
;58:	
;59:	last = pathname;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $36
JUMPV
LABELV $35
line 61
;60:	while (*pathname)
;61:	{
line 62
;62:		if (*pathname=='/')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $38
line 63
;63:			last = pathname+1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $38
line 64
;64:		pathname++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 65
;65:	}
LABELV $36
line 60
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $35
line 66
;66:	return last;
ADDRLP4 0
INDIRP4
RETP4
LABELV $34
endproc COM_SkipPath 4 0
export COM_StripExtension
proc COM_StripExtension 12 12
line 74
;67:}
;68:
;69:/*
;70:============
;71:COM_StripExtension
;72:============
;73:*/
;74:void COM_StripExtension( const char *in, char *out, int destsize ) {
line 77
;75:	int             length;
;76:
;77:	Q_strncpyz(out, in, destsize);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 79
;78:
;79:	length = strlen(out)-1;
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $42
JUMPV
LABELV $41
line 81
;80:	while (length > 0 && out[length] != '.')
;81:	{
line 82
;82:		length--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 83
;83:		if (out[length] == '/')
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $44
line 84
;84:			return;		// no extension
ADDRGP4 $40
JUMPV
LABELV $44
line 85
;85:	}
LABELV $42
line 80
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $46
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $41
LABELV $46
line 86
;86:	if ( length )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $47
line 87
;87:		out[ length ] = '\0';
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $47
line 88
;88:}
LABELV $40
endproc COM_StripExtension 12 12
export COM_DefaultExtension
proc COM_DefaultExtension 76 20
line 96
;89:
;90:
;91:/*
;92:==================
;93:COM_DefaultExtension
;94:==================
;95:*/
;96:void COM_DefaultExtension (char *path, int maxSize, const char *extension ) {
line 104
;97:	char	oldPath[MAX_QPATH];
;98:	char    *src;
;99:
;100://
;101:// if path doesn't have a .EXT, append extension
;102:// (extension should include the .)
;103://
;104:	src = path + strlen(path) - 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 68
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 -1
ADDP4
ASGNP4
ADDRGP4 $51
JUMPV
LABELV $50
line 106
;105:
;106:	while (*src != '/' && src != path) {
line 107
;107:		if ( *src == '.' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $53
line 108
;108:			return;                 // it has an extension
ADDRGP4 $49
JUMPV
LABELV $53
line 110
;109:		}
;110:		src--;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 111
;111:	}
LABELV $51
line 106
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
EQI4 $55
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $50
LABELV $55
line 113
;112:
;113:	Q_strncpyz( oldPath, path, sizeof( oldPath ) );
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 114
;114:	Com_sprintf( path, maxSize, "%s%s", oldPath, extension );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $56
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 115
;115:}
LABELV $49
endproc COM_DefaultExtension 76 20
export COM_BeginParseSession
proc COM_BeginParseSession 0 16
line 133
;116:
;117:
;118:/*
;119:============================================================================
;120:
;121:PARSING
;122:
;123:============================================================================
;124:*/
;125:
;126:static	char	com_token[MAX_TOKEN_CHARS];
;127:static	char	com_parsename[MAX_TOKEN_CHARS];
;128:static	int		com_lines;
;129:static	int		com_tokenline;
;130:static	int		is_separator[ 256 ];
;131:
;132:void COM_BeginParseSession( const char *name )
;133:{
line 134
;134:	com_lines = 1;
ADDRGP4 com_lines
CNSTI4 1
ASGNI4
line 135
;135:	com_tokenline = 0;
ADDRGP4 com_tokenline
CNSTI4 0
ASGNI4
line 136
;136:	Com_sprintf(com_parsename, sizeof(com_parsename), "%s", name);
ADDRGP4 com_parsename
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $58
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 137
;137:}
LABELV $57
endproc COM_BeginParseSession 0 16
export COM_GetCurrentParseLine
proc COM_GetCurrentParseLine 0 0
line 141
;138:
;139:
;140:int COM_GetCurrentParseLine( void )
;141:{
line 142
;142:	if ( com_tokenline )
ADDRGP4 com_tokenline
INDIRI4
CNSTI4 0
EQI4 $60
line 143
;143:	{
line 144
;144:		return com_tokenline;
ADDRGP4 com_tokenline
INDIRI4
RETI4
ADDRGP4 $59
JUMPV
LABELV $60
line 147
;145:	}
;146:
;147:	return com_lines;
ADDRGP4 com_lines
INDIRI4
RETI4
LABELV $59
endproc COM_GetCurrentParseLine 0 0
export COM_Parse
proc COM_Parse 4 8
line 151
;148:}
;149:
;150:char *COM_Parse( char **data_p )
;151:{
line 152
;152:	return COM_ParseExt( data_p, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $62
endproc COM_Parse 4 8
bss
align 1
LABELV $64
skip 4096
export COM_ParseError
code
proc COM_ParseError 4 16
line 160
;153:}
;154:
;155:
;156:extern int ED_vsprintf( char *buffer, const char *fmt, va_list argptr );
;157:
;158:
;159:void COM_ParseError( char *format, ... )
;160:{
line 164
;161:	va_list argptr;
;162:	static char string[4096];
;163:
;164:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 165
;165:	ED_vsprintf (string, format, argptr);
ADDRGP4 $64
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 166
;166:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 168
;167:
;168:	Com_Printf("ERROR: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $66
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $64
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 169
;169:}
LABELV $63
endproc COM_ParseError 4 16
bss
align 1
LABELV $68
skip 4096
export COM_ParseWarning
code
proc COM_ParseWarning 4 16
line 173
;170:
;171:
;172:void COM_ParseWarning( char *format, ... )
;173:{
line 177
;174:	va_list argptr;
;175:	static char string[4096];
;176:
;177:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 178
;178:	ED_vsprintf (string, format, argptr);
ADDRGP4 $68
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 179
;179:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 181
;180:
;181:	Com_Printf("WARNING: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $70
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $68
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 182
;182:}
LABELV $67
endproc COM_ParseWarning 4 16
proc SkipWhitespace 8 0
line 197
;183:
;184:
;185:/*
;186:==============
;187:COM_Parse
;188:
;189:Parse a token out of a string
;190:Will never return NULL, just empty strings
;191:
;192:If "allowLineBreaks" is qtrue then an empty
;193:string will be returned if the next token is
;194:a newline.
;195:==============
;196:*/
;197:static char *SkipWhitespace( char *data, qboolean *hasNewLines ) {
ADDRGP4 $73
JUMPV
LABELV $72
line 200
;198:	int c;
;199:
;200:	while( (c = *data) <= ' ') {
line 201
;201:		if( !c ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $75
line 202
;202:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $71
JUMPV
LABELV $75
line 204
;203:		}
;204:		if( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $77
line 205
;205:			com_lines++;
ADDRLP4 4
ADDRGP4 com_lines
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 206
;206:			*hasNewLines = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 207
;207:		}
LABELV $77
line 208
;208:		data++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 209
;209:	}
LABELV $73
line 200
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32
LEI4 $72
line 211
;210:
;211:	return data;
ADDRFP4 0
INDIRP4
RETP4
LABELV $71
endproc SkipWhitespace 8 0
export COM_Compress
proc COM_Compress 44 0
line 215
;212:}
;213:
;214:
;215:int COM_Compress( char *data_p ) {
line 218
;216:	char *in, *out;
;217:	int c;
;218:	qboolean newline = qfalse, whitespace = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
line 220
;219:
;220:	in = out = data_p;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 221
;221:	if (in) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $80
ADDRGP4 $83
JUMPV
LABELV $82
line 222
;222:		while ((c = *in) != 0) {
line 224
;223:			// skip double slash comments
;224:			if ( c == '/' && in[1] == '/' ) {
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $85
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $85
ADDRGP4 $88
JUMPV
LABELV $87
line 225
;225:				while (*in && *in != '\n') {
line 226
;226:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 227
;227:				}
LABELV $88
line 225
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $90
ADDRLP4 24
INDIRI4
CNSTI4 10
NEI4 $87
LABELV $90
line 229
;228:			// skip /* */ comments
;229:			} else if ( c == '/' && in[1] == '*' ) {
ADDRGP4 $86
JUMPV
LABELV $85
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $91
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $91
ADDRGP4 $94
JUMPV
LABELV $93
line 231
;230:				while ( *in && ( *in != '*' || in[1] != '/' ) ) 
;231:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $94
line 230
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $96
ADDRLP4 28
INDIRI4
CNSTI4 42
NEI4 $93
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $93
LABELV $96
line 232
;232:				if ( *in ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $92
line 233
;233:					in += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 235
;234:                        // record when we hit a newline
;235:                        } else if ( c == '\n' || c == '\r' ) {
ADDRGP4 $92
JUMPV
LABELV $91
ADDRLP4 4
INDIRI4
CNSTI4 10
EQI4 $101
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $99
LABELV $101
line 236
;236:                            newline = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 237
;237:                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 239
;238:                        // record when we hit whitespace
;239:                        } else if ( c == ' ' || c == '\t') {
ADDRGP4 $100
JUMPV
LABELV $99
ADDRLP4 4
INDIRI4
CNSTI4 32
EQI4 $104
ADDRLP4 4
INDIRI4
CNSTI4 9
NEI4 $102
LABELV $104
line 240
;240:                            whitespace = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 241
;241:                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 243
;242:                        // an actual token
;243:			} else {
ADDRGP4 $103
JUMPV
LABELV $102
line 245
;244:                            // if we have a pending newline, emit it (and it counts as whitespace)
;245:                            if (newline) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $105
line 246
;246:                                *out++ = '\n';
ADDRLP4 32
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI1 10
ASGNI1
line 247
;247:                                newline = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 248
;248:                                whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 249
;249:                            } else if (whitespace) {
ADDRGP4 $106
JUMPV
LABELV $105
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $107
line 250
;250:                                *out++ = ' ';
ADDRLP4 32
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI1 32
ASGNI1
line 251
;251:                                whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 252
;252:                            }
LABELV $107
LABELV $106
line 255
;253:                            
;254:                            // copy quoted strings unmolested
;255:                            if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $109
line 256
;256:                                    *out++ = c;
ADDRLP4 32
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 257
;257:                                    in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $112
JUMPV
LABELV $111
line 258
;258:                                    while (1) {
line 259
;259:                                        c = *in;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 260
;260:                                        if (c && c != '"') {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $113
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $113
line 261
;261:                                            *out++ = c;
ADDRLP4 40
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 262
;262:                                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 263
;263:                                        } else {
line 264
;264:                                            break;
LABELV $115
line 266
;265:                                        }
;266:                                    }
LABELV $112
line 258
ADDRGP4 $111
JUMPV
LABELV $113
line 267
;267:                                    if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $110
line 268
;268:                                        *out++ = c;
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 269
;269:                                        in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 270
;270:                                    }
line 271
;271:                            } else {
ADDRGP4 $110
JUMPV
LABELV $109
line 272
;272:                                *out = c;
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 273
;273:                                out++;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 274
;274:                                in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 275
;275:                            }
LABELV $110
line 276
;276:			}
LABELV $103
LABELV $100
LABELV $92
LABELV $86
line 277
;277:		}
LABELV $83
line 222
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $82
line 278
;278:	}
LABELV $80
line 279
;279:	*out = 0;
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 280
;280:	return out - data_p;
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
RETI4
LABELV $79
endproc COM_Compress 44 0
export COM_ParseExt
proc COM_ParseExt 28 8
line 285
;281:}
;282:
;283:
;284:char *COM_ParseExt( char **data_p, qboolean allowLineBreaks )
;285:{
line 286
;286:	int c = 0, len;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 287
;287:	qboolean hasNewLines = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 290
;288:	char *data;
;289:
;290:	data = *data_p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 291
;291:	len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 292
;292:	com_token[0] = '\0';
ADDRGP4 com_token
CNSTI1 0
ASGNI1
line 293
;293:	com_tokenline = 0;
ADDRGP4 com_tokenline
CNSTI4 0
ASGNI4
line 296
;294:
;295:	// make sure incoming data is valid
;296:	if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $122
line 297
;297:	{
line 298
;298:		*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 299
;299:		return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $118
JUMPV
LABELV $121
line 303
;300:	}
;301:
;302:	while ( 1 )
;303:	{
line 305
;304:		// skip whitespace
;305:		data = SkipWhitespace( data, &hasNewLines );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ADDRGP4 SkipWhitespace
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 306
;306:		if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $124
line 307
;307:		{
line 308
;308:			*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 309
;309:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $118
JUMPV
LABELV $124
line 311
;310:		}
;311:		if ( hasNewLines && !allowLineBreaks )
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $126
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $126
line 312
;312:		{
line 313
;313:			*data_p = data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 314
;314:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $118
JUMPV
LABELV $126
line 317
;315:		}
;316:
;317:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 320
;318:
;319:		// skip double slash comments
;320:		if ( c == '/' && data[1] == '/' )
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $128
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $128
line 321
;321:		{
line 322
;322:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $131
JUMPV
LABELV $130
line 323
;323:			while (*data && *data != '\n') {
line 324
;324:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 325
;325:			}
LABELV $131
line 323
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $133
ADDRLP4 20
INDIRI4
CNSTI4 10
NEI4 $130
LABELV $133
line 326
;326:		}
ADDRGP4 $129
JUMPV
LABELV $128
line 328
;327:		// skip /* */ comments
;328:		else if ( c == '/' && data[1] == '*' ) 
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $123
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $123
line 329
;329:		{
line 330
;330:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $137
JUMPV
LABELV $136
line 332
;331:			while ( *data && ( *data != '*' || data[1] != '/' ) ) 
;332:			{
line 333
;333:				if ( *data == '\n' )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $139
line 334
;334:				{
line 335
;335:					com_lines++;
ADDRLP4 20
ADDRGP4 com_lines
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 336
;336:				}
LABELV $139
line 337
;337:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 338
;338:			}
LABELV $137
line 331
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $141
ADDRLP4 24
INDIRI4
CNSTI4 42
NEI4 $136
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $136
LABELV $141
line 339
;339:			if ( *data ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $135
line 340
;340:			{
line 341
;341:				data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 342
;342:			}
line 343
;343:		}
line 345
;344:		else
;345:		{
line 346
;346:			break;
LABELV $135
LABELV $129
line 348
;347:		}
;348:	}
LABELV $122
line 302
ADDRGP4 $121
JUMPV
LABELV $123
line 350
;349:
;350:	com_tokenline = com_lines;
ADDRGP4 com_tokenline
ADDRGP4 com_lines
INDIRI4
ASGNI4
line 353
;351:
;352:	// handle quoted strings
;353:	if ( c == '"' )
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $144
line 354
;354:	{
line 355
;355:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $147
JUMPV
LABELV $146
line 357
;356:		while ( 1 )
;357:		{
line 358
;358:			c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 359
;359:			if ( c == '"' || c == '\0' )
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $151
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $149
LABELV $151
line 360
;360:			{
line 361
;361:				if ( c == '"' )
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $152
line 362
;362:					data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $152
line 364
;363:
;364:				com_token[ len ] = '\0';
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 365
;365:				*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 366
;366:				return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $118
JUMPV
LABELV $149
line 368
;367:			}
;368:			data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 369
;369:			if ( c == '\n' )
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $154
line 370
;370:			{
line 371
;371:				com_lines++;
ADDRLP4 20
ADDRGP4 com_lines
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 372
;372:			}
LABELV $154
line 373
;373:			if ( len < MAX_TOKEN_CHARS-1 )
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $156
line 374
;374:			{
line 375
;375:				com_token[ len ] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 376
;376:				len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 377
;377:			}
LABELV $156
line 378
;378:		}
LABELV $147
line 356
ADDRGP4 $146
JUMPV
line 379
;379:	}
LABELV $144
LABELV $158
line 383
;380:
;381:	// parse a regular word
;382:	do
;383:	{
line 384
;384:		if ( len < MAX_TOKEN_CHARS - 1 )
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $161
line 385
;385:		{
line 386
;386:			com_token[ len ] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 387
;387:			len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 388
;388:		}
LABELV $161
line 389
;389:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 390
;390:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 391
;391:	} while ( c > ' ' );
LABELV $159
ADDRLP4 4
INDIRI4
CNSTI4 32
GTI4 $158
line 393
;392:
;393:	com_token[ len ] = '\0';
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 395
;394:
;395:	*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 396
;396:	return com_token;
ADDRGP4 com_token
RETP4
LABELV $118
endproc COM_ParseExt 28 8
export COM_MatchToken
proc COM_MatchToken 12 16
line 405
;397:}
;398:
;399:
;400:/*
;401:==================
;402:COM_MatchToken
;403:==================
;404:*/
;405:void COM_MatchToken( char **buf_p, char *match ) {
line 408
;406:	char	*token;
;407:
;408:	token = COM_Parse( buf_p );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 409
;409:	if ( strcmp( token, match ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $164
line 410
;410:		Com_Error( ERR_DROP, "MatchToken: %s != %s", token, match );
CNSTI4 1
ARGI4
ADDRGP4 $166
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 411
;411:	}
LABELV $164
line 412
;412:}
LABELV $163
endproc COM_MatchToken 12 16
export SkipBracedSection
proc SkipBracedSection 12 8
line 424
;413:
;414:
;415:/*
;416:=================
;417:SkipBracedSection
;418:
;419:The next token should be an open brace.
;420:Skips until a matching close brace is found.
;421:Internal brace depths are properly skipped.
;422:=================
;423:*/
;424:void SkipBracedSection( char **program ) {
line 428
;425:	char			*token;
;426:	int				depth;
;427:
;428:	depth = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $168
line 429
;429:	do {
line 430
;430:		token = COM_ParseExt( program, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 431
;431:		if( token[1] == 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $171
line 432
;432:			if( token[0] == '{' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $173
line 433
;433:				depth++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 434
;434:			}
ADDRGP4 $174
JUMPV
LABELV $173
line 435
;435:			else if( token[0] == '}' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $175
line 436
;436:				depth--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 437
;437:			}
LABELV $175
LABELV $174
line 438
;438:		}
LABELV $171
line 439
;439:	} while( depth && *program );
LABELV $169
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $177
ADDRFP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $168
LABELV $177
line 440
;440:}
LABELV $167
endproc SkipBracedSection 12 8
export SkipRestOfLine
proc SkipRestOfLine 12 0
line 448
;441:
;442:
;443:/*
;444:=================
;445:SkipRestOfLine
;446:=================
;447:*/
;448:void SkipRestOfLine( char **data ) {
line 452
;449:	char	*p;
;450:	int		c;
;451:
;452:	p = *data;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 454
;453:
;454:	if ( !*p )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $182
line 455
;455:		return;
ADDRGP4 $178
JUMPV
LABELV $181
line 457
;456:
;457:	while ( (c = *p) != '\0' ) {
line 458
;458:		p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 459
;459:		if ( c == '\n' ) {
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $184
line 460
;460:			com_lines++;
ADDRLP4 8
ADDRGP4 com_lines
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 461
;461:			break;
ADDRGP4 $183
JUMPV
LABELV $184
line 463
;462:		}
;463:	}
LABELV $182
line 457
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $181
LABELV $183
line 465
;464:
;465:	*data = p;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 466
;466:}
LABELV $178
endproc SkipRestOfLine 12 0
export Com_InitSeparators
proc Com_InitSeparators 0 0
line 470
;467:
;468:
;469:void Com_InitSeparators( void )
;470:{
line 471
;471:	is_separator['\n']=1;
ADDRGP4 is_separator+40
CNSTI4 1
ASGNI4
line 472
;472:	is_separator[';']=1;
ADDRGP4 is_separator+236
CNSTI4 1
ASGNI4
line 473
;473:	is_separator['=']=1;
ADDRGP4 is_separator+244
CNSTI4 1
ASGNI4
line 474
;474:	is_separator['{']=1;
ADDRGP4 is_separator+492
CNSTI4 1
ASGNI4
line 475
;475:	is_separator['}']=1;
ADDRGP4 is_separator+500
CNSTI4 1
ASGNI4
line 476
;476:}
LABELV $186
endproc Com_InitSeparators 0 0
export SkipTillSeparators
proc SkipTillSeparators 12 0
line 480
;477:
;478:
;479:void SkipTillSeparators( char **data )
;480:{
line 484
;481:	char	*p;
;482:	int	c;
;483:
;484:	p = *data;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 486
;485:
;486:	if ( !*p )
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $196
line 487
;487:		return;
ADDRGP4 $192
JUMPV
LABELV $195
line 490
;488:
;489:	while ( (c = *p) != '\0' ) 
;490:	{
line 491
;491:		p++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 492
;492:		if ( is_separator[ c ] )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 is_separator
ADDP4
INDIRI4
CNSTI4 0
EQI4 $198
line 493
;493:		{
line 494
;494:			if ( c == '\n' )
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $197
line 495
;495:			{
line 496
;496:				com_lines++;
ADDRLP4 8
ADDRGP4 com_lines
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 497
;497:			}
line 498
;498:			break;
ADDRGP4 $197
JUMPV
LABELV $198
line 500
;499:		}
;500:	}
LABELV $196
line 489
ADDRLP4 8
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $195
LABELV $197
line 502
;501:
;502:	*data = p;
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRP4
ASGNP4
line 503
;503:}
LABELV $192
endproc SkipTillSeparators 12 0
export COM_ParseSep
proc COM_ParseSep 28 8
line 507
;504:
;505:
;506:char *COM_ParseSep( char **data_p, qboolean allowLineBreaks )
;507:{
line 508
;508:	int c = 0, len;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 509
;509:	qboolean hasNewLines = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 512
;510:	char *data;
;511:
;512:	data = *data_p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 513
;513:	len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 514
;514:	com_token[0] = '\0';
ADDRGP4 com_token
CNSTI1 0
ASGNI1
line 515
;515:	com_tokenline = 0;
ADDRGP4 com_tokenline
CNSTI4 0
ASGNI4
line 518
;516:
;517:	// make sure incoming data is valid
;518:	if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $206
line 519
;519:	{
line 520
;520:		*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 521
;521:		return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $202
JUMPV
LABELV $205
line 525
;522:	}
;523:
;524:	while ( 1 )
;525:	{
line 527
;526:		// skip whitespace
;527:		data = SkipWhitespace( data, &hasNewLines );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ADDRGP4 SkipWhitespace
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 528
;528:		if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $208
line 529
;529:		{
line 530
;530:			*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 531
;531:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $202
JUMPV
LABELV $208
line 533
;532:		}
;533:		if ( hasNewLines && !allowLineBreaks )
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $210
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $210
line 534
;534:		{
line 535
;535:			*data_p = data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 536
;536:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $202
JUMPV
LABELV $210
line 539
;537:		}
;538:
;539:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 542
;540:
;541:		// skip double slash comments
;542:		if ( c == '/' && data[1] == '/' )
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $212
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $212
line 543
;543:		{
line 544
;544:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $215
JUMPV
LABELV $214
line 545
;545:			while (*data && *data != '\n') {
line 546
;546:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 547
;547:			}
LABELV $215
line 545
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $217
ADDRLP4 20
INDIRI4
CNSTI4 10
NEI4 $214
LABELV $217
line 548
;548:		}
ADDRGP4 $213
JUMPV
LABELV $212
line 550
;549:		// skip /* */ comments
;550:		else if ( c == '/' && data[1] == '*' ) 
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $207
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $207
line 551
;551:		{
line 552
;552:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $221
JUMPV
LABELV $220
line 554
;553:			while ( *data && ( *data != '*' || data[1] != '/' ) ) 
;554:			{
line 555
;555:				if ( *data == '\n' )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $223
line 556
;556:				{
line 557
;557:					com_lines++;
ADDRLP4 20
ADDRGP4 com_lines
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 558
;558:				}
LABELV $223
line 559
;559:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 560
;560:			}
LABELV $221
line 553
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $225
ADDRLP4 24
INDIRI4
CNSTI4 42
NEI4 $220
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $220
LABELV $225
line 561
;561:			if ( *data ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $219
line 562
;562:			{
line 563
;563:				data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 564
;564:			}
line 565
;565:		}
line 567
;566:		else
;567:		{
line 568
;568:			break;
LABELV $219
LABELV $213
line 570
;569:		}
;570:	}
LABELV $206
line 524
ADDRGP4 $205
JUMPV
LABELV $207
line 572
;571:
;572:	com_tokenline = com_lines;
ADDRGP4 com_tokenline
ADDRGP4 com_lines
INDIRI4
ASGNI4
line 575
;573:
;574:	// handle quoted strings
;575:	if ( c == '"' )
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $228
line 576
;576:	{
line 577
;577:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $231
JUMPV
LABELV $230
line 579
;578:		while ( 1 )
;579:		{
line 580
;580:			c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 581
;581:			if ( c == '"' || c == '\0' )
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $235
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $233
LABELV $235
line 582
;582:			{
line 583
;583:				if ( c == '"' )
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $236
line 584
;584:					data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $236
line 586
;585:
;586:				com_token[ len ] = '\0';
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 587
;587:				*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 588
;588:				return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $202
JUMPV
LABELV $233
line 590
;589:			}
;590:			data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 591
;591:			if ( c == '\n' )
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $238
line 592
;592:			{
line 593
;593:				com_lines++;
ADDRLP4 20
ADDRGP4 com_lines
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 594
;594:			}
LABELV $238
line 595
;595:			if ( len < MAX_TOKEN_CHARS-1 )
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $240
line 596
;596:			{
line 597
;597:				com_token[ len ] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 598
;598:				len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 599
;599:			}
LABELV $240
line 600
;600:		}
LABELV $231
line 578
ADDRGP4 $230
JUMPV
line 601
;601:	}
LABELV $228
line 604
;602:
;603:	// special case for separators
;604: 	if ( is_separator[ c ]  )  
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 is_separator
ADDP4
INDIRI4
CNSTI4 0
EQI4 $242
line 605
;605:	{
line 606
;606:		com_token[ len ] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 607
;607:		len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 608
;608:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 609
;609:	} 
ADDRGP4 $243
JUMPV
LABELV $242
LABELV $244
line 612
;610:	else // parse a regular word
;611:	do
;612:	{
line 613
;613:		if ( len < MAX_TOKEN_CHARS - 1 )
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $247
line 614
;614:		{
line 615
;615:			com_token[ len ] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 616
;616:			len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 617
;617:		}
LABELV $247
line 618
;618:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 619
;619:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 620
;620:	} while ( c > ' ' && !is_separator[ c ] );
LABELV $245
ADDRLP4 4
INDIRI4
CNSTI4 32
LEI4 $249
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 is_separator
ADDP4
INDIRI4
CNSTI4 0
EQI4 $244
LABELV $249
LABELV $243
line 622
;621:
;622:	com_token[ len ] = '\0';
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 624
;623:
;624:	*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 625
;625:	return com_token;
ADDRGP4 com_token
RETP4
LABELV $202
endproc COM_ParseSep 28 8
export Com_Split
proc Com_Split 20 0
line 635
;626:}
;627:
;628:
;629:/*
;630:============
;631:Com_Split
;632:============
;633:*/
;634:int Com_Split( char *in, char **out, int outsz, int delim ) 
;635:{
line 637
;636:	int c;
;637:	char **o = out, **end = out + outsz;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ASGNP4
line 639
;638:	// skip leading spaces
;639:	if ( delim >= ' ' ) {
ADDRFP4 12
INDIRI4
CNSTI4 32
LTI4 $251
ADDRGP4 $254
JUMPV
LABELV $253
line 641
;640:		while( (c = *in) != '\0' && c <= ' ' ) 
;641:			in++; 
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $254
line 640
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $256
ADDRLP4 0
INDIRI4
CNSTI4 32
LEI4 $253
LABELV $256
line 642
;642:	}
LABELV $251
line 643
;643:	*out = in; out++;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRGP4 $258
JUMPV
line 644
;644:	while( out < end ) {
LABELV $260
line 646
;645:		while( (c = *in) != '\0' && c != delim ) 
;646:			in++; 
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $261
line 645
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $263
ADDRLP4 0
INDIRI4
ADDRFP4 12
INDIRI4
NEI4 $260
LABELV $263
line 647
;647:		*in = '\0';
ADDRFP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 648
;648:		if ( !c ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $264
line 650
;649:			// don't count last null value
;650:			if ( out[-1][0] == '\0' ) 
ADDRFP4 4
INDIRP4
CNSTI4 -4
ADDP4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $275
line 651
;651:				out--;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 -4
ADDP4
ASGNP4
line 652
;652:			break;
ADDRGP4 $275
JUMPV
LABELV $264
line 654
;653:		}
;654:		in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 656
;655:		// skip leading spaces
;656:		if ( delim >= ' ' ) {
ADDRFP4 12
INDIRI4
CNSTI4 32
LTI4 $268
ADDRGP4 $271
JUMPV
LABELV $270
line 658
;657:			while( (c = *in) != '\0' && c <= ' ' ) 
;658:				in++; 
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $271
line 657
ADDRLP4 16
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $273
ADDRLP4 0
INDIRI4
CNSTI4 32
LEI4 $270
LABELV $273
line 659
;659:		}
LABELV $268
line 660
;660:		*out = in; out++;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
line 661
;661:	}
LABELV $258
line 644
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
LTU4 $261
ADDRGP4 $275
JUMPV
LABELV $274
line 664
;662:	// sanitize last value
;663:	while( (c = *in) != '\0' && c != delim ) 
;664:		in++; 
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $275
line 663
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $277
ADDRLP4 0
INDIRI4
ADDRFP4 12
INDIRI4
NEI4 $274
LABELV $277
line 665
;665:	*in = '\0';
ADDRFP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 666
;666:	c = out - o;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 4
DIVI4
ASGNI4
ADDRGP4 $279
JUMPV
LABELV $278
line 668
;667:	// set remaining out pointers
;668:	while( out < end ) {
line 669
;669:		*out = in; out++;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
line 670
;670:	}
LABELV $279
line 668
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
LTU4 $278
line 671
;671:	return c;
ADDRLP4 0
INDIRI4
RETI4
LABELV $250
endproc Com_Split 20 0
export Parse1DMatrix
proc Parse1DMatrix 16 8
line 675
;672:}
;673:
;674:
;675:void Parse1DMatrix (char **buf_p, int x, float *m) {
line 679
;676:	char	*token;
;677:	int		i;
;678:
;679:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $282
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 681
;680:
;681:	for (i = 0 ; i < x ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $286
JUMPV
LABELV $283
line 682
;682:		token = COM_Parse(buf_p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 683
;683:		m[i] = atof(token);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 684
;684:	}
LABELV $284
line 681
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $286
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $283
line 686
;685:
;686:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $287
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 687
;687:}
LABELV $281
endproc Parse1DMatrix 16 8
export Parse2DMatrix
proc Parse2DMatrix 8 12
line 689
;688:
;689:void Parse2DMatrix (char **buf_p, int y, int x, float *m) {
line 692
;690:	int		i;
;691:
;692:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $282
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 694
;693:
;694:	for (i = 0 ; i < y ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $292
JUMPV
LABELV $289
line 695
;695:		Parse1DMatrix (buf_p, x, m + i * x);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 12
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse1DMatrix
CALLV
pop
line 696
;696:	}
LABELV $290
line 694
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $292
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $289
line 698
;697:
;698:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $287
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 699
;699:}
LABELV $288
endproc Parse2DMatrix 8 12
export Parse3DMatrix
proc Parse3DMatrix 12 16
line 701
;700:
;701:void Parse3DMatrix (char **buf_p, int z, int y, int x, float *m) {
line 704
;702:	int		i;
;703:
;704:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $282
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 706
;705:
;706:	for (i = 0 ; i < z ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $297
JUMPV
LABELV $294
line 707
;707:		Parse2DMatrix (buf_p, y, x, m + i * x*y);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse2DMatrix
CALLV
pop
line 708
;708:	}
LABELV $295
line 706
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $297
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $294
line 710
;709:
;710:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $287
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 711
;711:}
LABELV $293
endproc Parse3DMatrix 12 16
lit
export locase
align 1
LABELV locase
byte 1 0
byte 1 1
byte 1 2
byte 1 3
byte 1 4
byte 1 5
byte 1 6
byte 1 7
byte 1 8
byte 1 9
byte 1 10
byte 1 11
byte 1 12
byte 1 13
byte 1 14
byte 1 15
byte 1 16
byte 1 17
byte 1 18
byte 1 19
byte 1 20
byte 1 21
byte 1 22
byte 1 23
byte 1 24
byte 1 25
byte 1 26
byte 1 27
byte 1 28
byte 1 29
byte 1 30
byte 1 31
byte 1 32
byte 1 33
byte 1 34
byte 1 35
byte 1 36
byte 1 37
byte 1 38
byte 1 39
byte 1 40
byte 1 41
byte 1 42
byte 1 43
byte 1 44
byte 1 45
byte 1 46
byte 1 47
byte 1 48
byte 1 49
byte 1 50
byte 1 51
byte 1 52
byte 1 53
byte 1 54
byte 1 55
byte 1 56
byte 1 57
byte 1 58
byte 1 59
byte 1 60
byte 1 61
byte 1 62
byte 1 63
byte 1 64
byte 1 97
byte 1 98
byte 1 99
byte 1 100
byte 1 101
byte 1 102
byte 1 103
byte 1 104
byte 1 105
byte 1 106
byte 1 107
byte 1 108
byte 1 109
byte 1 110
byte 1 111
byte 1 112
byte 1 113
byte 1 114
byte 1 115
byte 1 116
byte 1 117
byte 1 118
byte 1 119
byte 1 120
byte 1 121
byte 1 122
byte 1 91
byte 1 92
byte 1 93
byte 1 94
byte 1 95
byte 1 96
byte 1 97
byte 1 98
byte 1 99
byte 1 100
byte 1 101
byte 1 102
byte 1 103
byte 1 104
byte 1 105
byte 1 106
byte 1 107
byte 1 108
byte 1 109
byte 1 110
byte 1 111
byte 1 112
byte 1 113
byte 1 114
byte 1 115
byte 1 116
byte 1 117
byte 1 118
byte 1 119
byte 1 120
byte 1 121
byte 1 122
byte 1 123
byte 1 124
byte 1 125
byte 1 126
byte 1 127
byte 1 128
byte 1 129
byte 1 130
byte 1 131
byte 1 132
byte 1 133
byte 1 134
byte 1 135
byte 1 136
byte 1 137
byte 1 138
byte 1 139
byte 1 140
byte 1 141
byte 1 142
byte 1 143
byte 1 144
byte 1 145
byte 1 146
byte 1 147
byte 1 148
byte 1 149
byte 1 150
byte 1 151
byte 1 152
byte 1 153
byte 1 154
byte 1 155
byte 1 156
byte 1 157
byte 1 158
byte 1 159
byte 1 160
byte 1 161
byte 1 162
byte 1 163
byte 1 164
byte 1 165
byte 1 166
byte 1 167
byte 1 168
byte 1 169
byte 1 170
byte 1 171
byte 1 172
byte 1 173
byte 1 174
byte 1 175
byte 1 176
byte 1 177
byte 1 178
byte 1 179
byte 1 180
byte 1 181
byte 1 182
byte 1 183
byte 1 184
byte 1 185
byte 1 186
byte 1 187
byte 1 188
byte 1 189
byte 1 190
byte 1 191
byte 1 192
byte 1 193
byte 1 194
byte 1 195
byte 1 196
byte 1 197
byte 1 198
byte 1 199
byte 1 200
byte 1 201
byte 1 202
byte 1 203
byte 1 204
byte 1 205
byte 1 206
byte 1 207
byte 1 208
byte 1 209
byte 1 210
byte 1 211
byte 1 212
byte 1 213
byte 1 214
byte 1 215
byte 1 216
byte 1 217
byte 1 218
byte 1 219
byte 1 220
byte 1 221
byte 1 222
byte 1 223
byte 1 224
byte 1 225
byte 1 226
byte 1 227
byte 1 228
byte 1 229
byte 1 230
byte 1 231
byte 1 232
byte 1 233
byte 1 234
byte 1 235
byte 1 236
byte 1 237
byte 1 238
byte 1 239
byte 1 240
byte 1 241
byte 1 242
byte 1 243
byte 1 244
byte 1 245
byte 1 246
byte 1 247
byte 1 248
byte 1 249
byte 1 250
byte 1 251
byte 1 252
byte 1 253
byte 1 254
byte 1 255
export Q_isprint
code
proc Q_isprint 4 0
line 760
;712:
;713:
;714:/*
;715:============================================================================
;716:
;717:					LIBRARY REPLACEMENT FUNCTIONS
;718:
;719:============================================================================
;720:*/
;721:
;722:const byte locase[ 256 ] =
;723:{
;724:	0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,
;725:	0x08,0x09,0x0a,0x0b,0x0c,0x0d,0x0e,0x0f,
;726:	0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,
;727:	0x18,0x19,0x1a,0x1b,0x1c,0x1d,0x1e,0x1f,
;728:	0x20,0x21,0x22,0x23,0x24,0x25,0x26,0x27,
;729:	0x28,0x29,0x2a,0x2b,0x2c,0x2d,0x2e,0x2f,
;730:	0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,
;731:	0x38,0x39,0x3a,0x3b,0x3c,0x3d,0x3e,0x3f,
;732:	0x40,0x61,0x62,0x63,0x64,0x65,0x66,0x67,
;733:	0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f,
;734:	0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77,
;735:	0x78,0x79,0x7a,0x5b,0x5c,0x5d,0x5e,0x5f,
;736:	0x60,0x61,0x62,0x63,0x64,0x65,0x66,0x67,
;737:	0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f,
;738:	0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77,
;739:	0x78,0x79,0x7a,0x7b,0x7c,0x7d,0x7e,0x7f,
;740:	0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,
;741:	0x88,0x89,0x8a,0x8b,0x8c,0x8d,0x8e,0x8f,
;742:	0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,
;743:	0x98,0x99,0x9a,0x9b,0x9c,0x9d,0x9e,0x9f,
;744:	0xa0,0xa1,0xa2,0xa3,0xa4,0xa5,0xa6,0xa7,
;745:	0xa8,0xa9,0xaa,0xab,0xac,0xad,0xae,0xaf,
;746:	0xb0,0xb1,0xb2,0xb3,0xb4,0xb5,0xb6,0xb7,
;747:	0xb8,0xb9,0xba,0xbb,0xbc,0xbd,0xbe,0xbf,
;748:	0xc0,0xc1,0xc2,0xc3,0xc4,0xc5,0xc6,0xc7,
;749:	0xc8,0xc9,0xca,0xcb,0xcc,0xcd,0xce,0xcf,
;750:	0xd0,0xd1,0xd2,0xd3,0xd4,0xd5,0xd6,0xd7,
;751:	0xd8,0xd9,0xda,0xdb,0xdc,0xdd,0xde,0xdf,
;752:	0xe0,0xe1,0xe2,0xe3,0xe4,0xe5,0xe6,0xe7,
;753:	0xe8,0xe9,0xea,0xeb,0xec,0xed,0xee,0xef,
;754:	0xf0,0xf1,0xf2,0xf3,0xf4,0xf5,0xf6,0xf7,
;755:	0xf8,0xf9,0xfa,0xfb,0xfc,0xfd,0xfe,0xff
;756:};
;757:
;758:
;759:int Q_isprint( int c )
;760:{
line 761
;761:	if ( c >= 0x20 && c <= 0x7E )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $299
ADDRLP4 0
INDIRI4
CNSTI4 126
GTI4 $299
line 762
;762:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $298
JUMPV
LABELV $299
line 763
;763:	return ( 0 );
CNSTI4 0
RETI4
LABELV $298
endproc Q_isprint 4 0
export Q_islower
proc Q_islower 4 0
line 768
;764:}
;765:
;766:
;767:int Q_islower( int c )
;768:{
line 769
;769:	if (c >= 'a' && c <= 'z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $302
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $302
line 770
;770:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $301
JUMPV
LABELV $302
line 771
;771:	return ( 0 );
CNSTI4 0
RETI4
LABELV $301
endproc Q_islower 4 0
export Q_isupper
proc Q_isupper 4 0
line 776
;772:}
;773:
;774:
;775:int Q_isupper( int c )
;776:{
line 777
;777:	if (c >= 'A' && c <= 'Z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $305
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $305
line 778
;778:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $304
JUMPV
LABELV $305
line 779
;779:	return ( 0 );
CNSTI4 0
RETI4
LABELV $304
endproc Q_isupper 4 0
export Q_isalpha
proc Q_isalpha 8 0
line 784
;780:}
;781:
;782:
;783:int Q_isalpha( int c )
;784:{
line 785
;785:	if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $311
ADDRLP4 0
INDIRI4
CNSTI4 122
LEI4 $310
LABELV $311
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 65
LTI4 $308
ADDRLP4 4
INDIRI4
CNSTI4 90
GTI4 $308
LABELV $310
line 786
;786:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $307
JUMPV
LABELV $308
line 787
;787:	return ( 0 );
CNSTI4 0
RETI4
LABELV $307
endproc Q_isalpha 8 0
export Q_strrchr
proc Q_strrchr 12 0
line 792
;788:}
;789:
;790:
;791:char* Q_strrchr( const char* string, int c )
;792:{
line 793
;793:	char cc = c;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 795
;794:	char *s;
;795:	char *sp=(char *)0;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 797
;796:
;797:	s = (char*)string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $314
JUMPV
LABELV $313
line 800
;798:
;799:	while (*s)
;800:	{
line 801
;801:		if (*s == cc)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI1
CVII4 1
NEI4 $316
line 802
;802:			sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $316
line 803
;803:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 804
;804:	}
LABELV $314
line 799
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $313
line 805
;805:	if (cc == 0)
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $318
line 806
;806:		sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $318
line 808
;807:
;808:	return sp;
ADDRLP4 8
INDIRP4
RETP4
LABELV $312
endproc Q_strrchr 12 0
export Q_strncpyz
proc Q_strncpyz 0 12
line 820
;809:}
;810:
;811:
;812:/*
;813:=============
;814:Q_strncpyz
;815: 
;816:Safe strncpy that ensures a trailing zero
;817:=============
;818:*/
;819:void Q_strncpyz( char *dest, const char *src, int destsize ) 
;820:{
line 821
;821:	if ( !dest ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $321
line 822
;822:		Com_Error( ERR_FATAL, "Q_strncpyz: NULL dest" );
CNSTI4 0
ARGI4
ADDRGP4 $323
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 823
;823:	}
LABELV $321
line 825
;824:
;825:	if ( !src ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $324
line 826
;826:		Com_Error( ERR_FATAL, "Q_strncpyz: NULL src" );
CNSTI4 0
ARGI4
ADDRGP4 $326
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 827
;827:	}
LABELV $324
line 829
;828:
;829:	if ( destsize < 1 ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $327
line 830
;830:		Com_Error(ERR_FATAL,"Q_strncpyz: destsize < 1" ); 
CNSTI4 0
ARGI4
ADDRGP4 $329
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 831
;831:	}
LABELV $327
line 833
;832:
;833:	strncpy( dest, src, destsize-1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 834
;834:	dest[ destsize-1 ] = '\0';
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 835
;835:}
LABELV $320
endproc Q_strncpyz 0 12
export Q_stricmpn
proc Q_stricmpn 24 0
line 838
;836:
;837:                 
;838:int Q_stricmpn( const char *s1, const char *s2, int n ) {
line 841
;839:	int	c1, c2;
;840:
;841:	if ( s1 == NULL ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $331
line 842
;842:		if ( s2 == NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $333
line 843
;843:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $330
JUMPV
LABELV $333
line 845
;844:		else
;845:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $330
JUMPV
LABELV $331
line 846
;846:	} else if ( s2 == NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $335
line 847
;847:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $330
JUMPV
LABELV $335
LABELV $337
line 849
;848:	
;849:	do {
line 850
;850:		c1 = *s1; s1++;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 851
;851:		c2 = *s2; s2++;
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 853
;852:
;853:		if ( !n-- ) {
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $340
line 854
;854:			return 0; // strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $330
JUMPV
LABELV $340
line 857
;855:		}
;856:		
;857:		if ( c1 != c2 ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $342
line 858
;858:			if (c1 >= 'a' && c1 <= 'z') {
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $344
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $344
line 859
;859:				c1 -= ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 860
;860:			}
LABELV $344
line 861
;861:			if (c2 >= 'a' && c2 <= 'z') {
ADDRLP4 4
INDIRI4
CNSTI4 97
LTI4 $346
ADDRLP4 4
INDIRI4
CNSTI4 122
GTI4 $346
line 862
;862:				c2 -= ('a' - 'A');
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 863
;863:			}
LABELV $346
line 864
;864:			if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $348
line 865
;865:				return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $351
ADDRLP4 20
CNSTI4 -1
ASGNI4
ADDRGP4 $352
JUMPV
LABELV $351
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $352
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $330
JUMPV
LABELV $348
line 867
;866:			}
;867:		}
LABELV $342
line 868
;868:	} while (c1);
LABELV $338
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $337
line 870
;869:	
;870:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $330
endproc Q_stricmpn 24 0
export Q_strncmp
proc Q_strncmp 16 0
line 874
;871:}
;872:
;873:
;874:int Q_strncmp( const char *s1, const char *s2, int n ) {
LABELV $354
line 877
;875:	int		c1, c2;
;876:	
;877:	do {
line 878
;878:		c1 = *s1; s1++;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 879
;879:		c2 = *s2; s2++;
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 881
;880:
;881:		if (!n--) {
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $357
line 882
;882:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $353
JUMPV
LABELV $357
line 885
;883:		}
;884:		
;885:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $359
line 886
;886:			return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $362
ADDRLP4 12
CNSTI4 -1
ASGNI4
ADDRGP4 $363
JUMPV
LABELV $362
ADDRLP4 12
CNSTI4 1
ASGNI4
LABELV $363
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $353
JUMPV
LABELV $359
line 888
;887:		}
;888:	} while (c1);
LABELV $355
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $354
line 890
;889:	
;890:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $353
endproc Q_strncmp 16 0
export Q_stricmp
proc Q_stricmp 16 0
line 895
;891:}
;892:
;893:
;894:int Q_stricmp( const char *s1, const char *s2 ) 
;895:{
line 898
;896:	unsigned char c1, c2;
;897:
;898:	if ( s1 == NULL ) 
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $365
line 899
;899:	{
line 900
;900:		if ( s2 == NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $367
line 901
;901:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $364
JUMPV
LABELV $367
line 903
;902:		else
;903:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $364
JUMPV
LABELV $365
line 905
;904:	}
;905:	else if ( s2 == NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $369
line 906
;906:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $364
JUMPV
LABELV $369
LABELV $371
line 909
;907:	
;908:	do 
;909:	{
line 910
;910:		c1 = *s1; s1++;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
ASGNU1
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 911
;911:		c2 = *s2; s2++;
ADDRLP4 1
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
ASGNU1
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 913
;912:
;913:		if ( c1 != c2 ) 
ADDRLP4 0
INDIRU1
CVUI4 1
ADDRLP4 1
INDIRU1
CVUI4 1
EQI4 $374
line 914
;914:		{
line 915
;915:			if ( c1 <= 'Z' && c1 >= 'A' )
ADDRLP4 4
ADDRLP4 0
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 90
GTI4 $376
ADDRLP4 4
INDIRI4
CNSTI4 65
LTI4 $376
line 916
;916:				c1 += ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
LABELV $376
line 918
;917:
;918:			if ( c2 <= 'Z' && c2 >= 'A' )
ADDRLP4 8
ADDRLP4 1
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 90
GTI4 $378
ADDRLP4 8
INDIRI4
CNSTI4 65
LTI4 $378
line 919
;919:				c2 += ('a' - 'A');
ADDRLP4 1
ADDRLP4 1
INDIRU1
CVUI4 1
CNSTI4 32
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
LABELV $378
line 921
;920:
;921:			if ( c1 != c2 ) 
ADDRLP4 0
INDIRU1
CVUI4 1
ADDRLP4 1
INDIRU1
CVUI4 1
EQI4 $380
line 922
;922:				return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRU1
CVUI4 1
ADDRLP4 1
INDIRU1
CVUI4 1
GEI4 $383
ADDRLP4 12
CNSTI4 -1
ASGNI4
ADDRGP4 $384
JUMPV
LABELV $383
ADDRLP4 12
CNSTI4 1
ASGNI4
LABELV $384
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $364
JUMPV
LABELV $380
line 923
;923:		}
LABELV $374
line 924
;924:	}
LABELV $372
line 925
;925:	while ( c1 != '\0' );
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 0
NEI4 $371
line 927
;926:
;927:	return 0;
CNSTI4 0
RETI4
LABELV $364
endproc Q_stricmp 16 0
export Q_strlwr
proc Q_strlwr 12 4
line 932
;928:}
;929:
;930:
;931:char *Q_strlwr( char *s1 ) 
;932:{
line 935
;933:    char	*s;
;934:
;935:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $387
JUMPV
LABELV $386
line 936
;936:	while ( *s ) {
line 937
;937:		*s = tolower(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 938
;938:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 939
;939:	}
LABELV $387
line 936
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $386
line 940
;940:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $385
endproc Q_strlwr 12 4
export Q_strupr
proc Q_strupr 12 4
line 944
;941:}
;942:
;943:
;944:char *Q_strupr( char *s1 ) {
line 947
;945:    char	*s;
;946:
;947:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $391
JUMPV
LABELV $390
line 948
;948:	while ( *s ) {
line 949
;949:		*s = toupper(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 950
;950:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 951
;951:	}
LABELV $391
line 948
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $390
line 952
;952:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $389
endproc Q_strupr 12 4
export Q_strcat
proc Q_strcat 12 12
line 957
;953:}
;954:
;955:
;956:// never goes past bounds or leaves without a terminating 0
;957:void Q_strcat( char *dest, int size, const char *src ) {
line 960
;958:	int		l1;
;959:
;960:	l1 = strlen( dest );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 961
;961:	if ( l1 >= size ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $394
line 962
;962:		Com_Error( ERR_FATAL, "Q_strcat: already overflowed" );
CNSTI4 0
ARGI4
ADDRGP4 $396
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 963
;963:	}
LABELV $394
line 964
;964:	Q_strncpyz( dest + l1, src, size - l1 );
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 965
;965:}
LABELV $393
endproc Q_strcat 12 12
export Q_PrintStrlen
proc Q_PrintStrlen 12 0
line 968
;966:
;967:
;968:int Q_PrintStrlen( const char *string ) {
line 972
;969:	int			len;
;970:	const char	*p;
;971:
;972:	if( !string ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $398
line 973
;973:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $397
JUMPV
LABELV $398
line 976
;974:	}
;975:
;976:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 977
;977:	p = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $401
JUMPV
LABELV $400
line 978
;978:	while( *p ) {
line 979
;979:		if( Q_IsColorString( p ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $403
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $403
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $403
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $403
line 980
;980:			p += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 981
;981:			continue;
ADDRGP4 $401
JUMPV
LABELV $403
line 983
;982:		}
;983:		p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 984
;984:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 985
;985:	}
LABELV $401
line 978
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $400
line 987
;986:
;987:	return len;
ADDRLP4 4
INDIRI4
RETI4
LABELV $397
endproc Q_PrintStrlen 12 0
export Q_CleanStr
proc Q_CleanStr 20 0
line 991
;988:}
;989:
;990:
;991:char *Q_CleanStr( char *string ) {
line 996
;992:	char*	d;
;993:	char*	s;
;994:	int		c;
;995:
;996:	s = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 997
;997:	d = string;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $407
JUMPV
LABELV $406
line 998
;998:	while ((c = *s) != '\0' ) {
line 999
;999:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $409
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $409
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $409
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $409
line 1000
;1000:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1001
;1001:		}
ADDRGP4 $410
JUMPV
LABELV $409
line 1002
;1002:		else if ( c >= ' ' && c <= '~' ) {
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $411
ADDRLP4 4
INDIRI4
CNSTI4 126
GTI4 $411
line 1003
;1003:			*d = c; d++;
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1004
;1004:		}
LABELV $411
LABELV $410
line 1005
;1005:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1006
;1006:	}
LABELV $407
line 998
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $406
line 1007
;1007:	*d = '\0';
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 1009
;1008:
;1009:	return string;
ADDRFP4 0
INDIRP4
RETP4
LABELV $405
endproc Q_CleanStr 20 0
export Com_sprintf
proc Com_sprintf 12 16
line 1013
;1010:}
;1011:
;1012:
;1013:int QDECL Com_sprintf( char *dest, int size, const char *fmt, ... ) {
line 1017
;1014:	va_list argptr;
;1015:	int len;
;1016:
;1017:	va_start( argptr, fmt );
ADDRLP4 4
ADDRFP4 8+4
ASGNP4
line 1018
;1018:	len = ED_vsprintf( dest, fmt, argptr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 ED_vsprintf
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1019
;1019:	va_end( argptr );
ADDRLP4 4
CNSTP4 0
ASGNP4
line 1021
;1020:
;1021:	if ( len >= size ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $415
line 1022
;1022:		Com_Error( ERR_FATAL, "Com_sprintf: overflow of %i in %i\n", len, size );
CNSTI4 0
ARGI4
ADDRGP4 $417
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 1023
;1023:	}
LABELV $415
line 1025
;1024:
;1025:	return len;
ADDRLP4 0
INDIRI4
RETI4
LABELV $413
endproc Com_sprintf 12 16
bss
align 1
LABELV $419
skip 64000
data
align 4
LABELV $420
byte 4 0
export va
code
proc va 12 12
line 1039
;1026:}
;1027:
;1028:
;1029:/*
;1030:============
;1031:va
;1032:
;1033:does a varargs printf into a temp buffer, so I don't need to have
;1034:varargs versions of all text functions.
;1035:FIXME: make this buffer size safe someday
;1036:============
;1037:*/
;1038:char * QDECL va( const char *format, ... ) 
;1039:{
line 1045
;1040:	va_list		argptr;
;1041:	static char		string[2][32000];	// in case va is called by nested functions
;1042:	static int		index = 0;
;1043:	char	*buf;
;1044:
;1045:	buf = string[ index ];
ADDRLP4 4
ADDRGP4 $420
INDIRI4
CNSTI4 32000
MULI4
ADDRGP4 $419
ADDP4
ASGNP4
line 1046
;1046:	index ^= 1;
ADDRLP4 8
ADDRGP4 $420
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 1048
;1047:
;1048:	va_start( argptr, format );
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 1049
;1049:	ED_vsprintf( buf, format, argptr );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 1050
;1050:	va_end( argptr );
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1052
;1051:
;1052:	return buf;
ADDRLP4 4
INDIRP4
RETP4
LABELV $418
endproc va 12 12
proc Q_strkey 12 0
line 1066
;1053:}
;1054:
;1055:
;1056:/*
;1057:=====================================================================
;1058:
;1059:  INFO STRINGS
;1060:
;1061:=====================================================================
;1062:*/
;1063:
;1064:
;1065:static qboolean Q_strkey( const char *str, const char *key, int key_len )
;1066:{
line 1069
;1067:	int i;
;1068:
;1069:	for ( i = 0; i < key_len; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $426
JUMPV
LABELV $423
line 1070
;1070:	{
line 1071
;1071:		if ( locase[ (byte)str[i] ] != locase[ (byte)key[i] ] )
ADDRLP4 8
ADDRGP4 locase
ASGNP4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
CVUI4 1
ADDRLP4 8
INDIRP4
ADDP4
INDIRU1
CVUI4 1
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
CVUI4 1
ADDRLP4 8
INDIRP4
ADDP4
INDIRU1
CVUI4 1
EQI4 $427
line 1072
;1072:		{
line 1073
;1073:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $422
JUMPV
LABELV $427
line 1075
;1074:		}
;1075:	}
LABELV $424
line 1069
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $426
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $423
line 1077
;1076:
;1077:	return qtrue;
CNSTI4 1
RETI4
LABELV $422
endproc Q_strkey 12 0
bss
align 1
LABELV $430
skip 16384
data
align 4
LABELV $431
byte 4 0
export Info_ValueForKey
code
proc Info_ValueForKey 52 12
line 1089
;1078:}
;1079:
;1080:
;1081:/*
;1082:===============
;1083:Info_ValueForKey
;1084:
;1085:Searches the string for the given
;1086:key and returns the associated value, or an empty string.
;1087:===============
;1088:*/
;1089:char *Info_ValueForKey( const char *s, const char *key ) {
line 1097
;1090:	static	char value[2][BIG_INFO_VALUE];	// use two buffers so compares
;1091:											// work without stomping on each other
;1092:	static	int	valueindex = 0;
;1093:	const char *v, *pkey;
;1094:	char	*o, *o2;
;1095:	int		klen, len;
;1096:
;1097:	if ( !s || !key || !*key )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $435
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $435
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $432
LABELV $435
line 1098
;1098:		return "";
ADDRGP4 $436
RETP4
ADDRGP4 $429
JUMPV
LABELV $432
line 1100
;1099:
;1100:	klen = (int)strlen( key );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 1102
;1101:
;1102:	if ( *s == '\\' )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $440
line 1103
;1103:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $440
JUMPV
LABELV $439
line 1106
;1104:
;1105:	while (1)
;1106:	{
line 1107
;1107:		pkey = s;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $443
JUMPV
LABELV $442
line 1109
;1108:		while ( *s != '\\' )
;1109:		{
line 1110
;1110:			if ( *s == '\0' )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $445
line 1111
;1111:				return "";
ADDRGP4 $436
RETP4
ADDRGP4 $429
JUMPV
LABELV $445
line 1112
;1112:			++s;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1113
;1113:		}
LABELV $443
line 1108
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $442
line 1114
;1114:		len = (int)(s - pkey);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 1115
;1115:		s++; // skip '\\'
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1117
;1116:
;1117:		v = s;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $448
JUMPV
LABELV $447
line 1119
;1118:		while ( *s != '\\' && *s !='\0' )
;1119:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $448
line 1118
ADDRLP4 32
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 92
EQI4 $450
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $447
LABELV $450
line 1121
;1120:
;1121:		if ( len == klen && Q_strkey( pkey, key, klen ) )
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $451
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 Q_strkey
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $451
line 1122
;1122:		{
line 1123
;1123:			o = o2 = value[ valueindex ];
ADDRLP4 44
ADDRGP4 $431
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $430
ADDP4
ASGNP4
ADDRLP4 20
ADDRLP4 44
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 44
INDIRP4
ASGNP4
line 1124
;1124:			valueindex ^= 1;
ADDRLP4 48
ADDRGP4 $431
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 1125
;1125:			if ( (int)(s - v) >= BIG_INFO_STRING )
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 8192
LTI4 $457
line 1126
;1126:			{
line 1127
;1127:				Com_Error( ERR_DROP, "Info_ValueForKey: oversize infostring value" );
CNSTI4 1
ARGI4
ADDRGP4 $455
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1128
;1128:			}
ADDRGP4 $454
JUMPV
line 1130
;1129:			else 
;1130:			{
LABELV $456
line 1132
;1131:				while ( v < s )
;1132:				{
line 1133
;1133:					*o = *v;
ADDRLP4 4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 1134
;1134:					++o; ++v;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1135
;1135:				}
LABELV $457
line 1131
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
LTU4 $456
line 1136
;1136:			}
LABELV $454
line 1137
;1137:			*o = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1138
;1138:			return o2;
ADDRLP4 20
INDIRP4
RETP4
ADDRGP4 $429
JUMPV
LABELV $451
line 1141
;1139:		}
;1140:
;1141:		if ( *s == '\0' )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $459
line 1142
;1142:			break;
ADDRGP4 $441
JUMPV
LABELV $459
line 1144
;1143:
;1144:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1145
;1145:	}
LABELV $440
line 1105
ADDRGP4 $439
JUMPV
LABELV $441
line 1147
;1146:
;1147:	return "";
ADDRGP4 $436
RETP4
LABELV $429
endproc Info_ValueForKey 52 12
export Info_NextPair
proc Info_NextPair 12 0
line 1158
;1148:}
;1149:
;1150:
;1151:/*
;1152:===================
;1153:Info_NextPair
;1154:
;1155:Used to itterate through all the key/value pairs in an info string
;1156:===================
;1157:*/
;1158:const char *Info_NextPair( const char *s, char *key, char *value ) {
line 1161
;1159:	char *o;
;1160:
;1161:	if ( *s == '\\' ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $462
line 1162
;1162:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1163
;1163:	}
LABELV $462
line 1165
;1164:
;1165:	key[0] = '\0';
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1166
;1166:	value[0] = '\0';
ADDRFP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 1168
;1167:
;1168:	o = key;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRGP4 $465
JUMPV
LABELV $464
line 1169
;1169:	while ( *s != '\\' ) {
line 1170
;1170:		if ( *s == '\0' ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $467
line 1171
;1171:			*o = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1172
;1172:			return s;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $461
JUMPV
LABELV $467
line 1174
;1173:		}
;1174:		*o++ = *s++;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI1
ASGNI1
line 1175
;1175:	}
LABELV $465
line 1169
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $464
line 1176
;1176:	*o = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1177
;1177:	s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1179
;1178:
;1179:	o = value;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $470
JUMPV
LABELV $469
line 1180
;1180:	while ( *s != '\\' && *s != '\0' ) {
line 1181
;1181:		*o++ = *s++;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI1
ASGNI1
line 1182
;1182:	}
LABELV $470
line 1180
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 92
EQI4 $472
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $469
LABELV $472
line 1183
;1183:	*o = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1185
;1184:
;1185:	return s;
ADDRFP4 0
INDIRP4
RETP4
LABELV $461
endproc Info_NextPair 12 0
proc Info_RemoveKey 36 12
line 1194
;1186:}
;1187:
;1188:
;1189:/*
;1190:===================
;1191:Info_RemoveKey
;1192:===================
;1193:*/
;1194:static int Info_RemoveKey( char *s, const char *key ) {
line 1199
;1195:	char	*start;
;1196:	char 	*pkey;
;1197:	int		key_len, len;
;1198:
;1199:	key_len = (int) strlen( key );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRGP4 $475
JUMPV
LABELV $474
line 1202
;1200:
;1201:	while ( 1 )
;1202:	{
line 1203
;1203:		start = s;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
line 1204
;1204:		if ( *s == '\\' )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $477
line 1205
;1205:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $477
line 1206
;1206:		pkey = s;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $480
JUMPV
LABELV $479
line 1208
;1207:		while ( *s != '\\' )
;1208:		{
line 1209
;1209:			if ( *s == '\0' )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $482
line 1210
;1210:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $473
JUMPV
LABELV $482
line 1211
;1211:			++s;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1212
;1212:		}
LABELV $480
line 1207
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $479
line 1214
;1213:
;1214:		len = (int)(s - pkey);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 1215
;1215:		++s; // skip '\\'
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $485
JUMPV
LABELV $484
line 1218
;1216:
;1217:		while ( *s != '\\' && *s != '\0' )
;1218:			++s;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $485
line 1217
ADDRLP4 20
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 92
EQI4 $487
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $484
LABELV $487
line 1220
;1219:
;1220:		if ( len == key_len && Q_strkey( pkey, key, key_len ) )
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $488
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 Q_strkey
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $488
line 1221
;1221:		{
line 1222
;1222:			memmove( start, s, strlen( s ) + 1 ); // remove this part
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1223
;1223:			return (int)(s - start);
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
RETI4
ADDRGP4 $473
JUMPV
LABELV $488
line 1226
;1224:		}
;1225:
;1226:		if ( *s == '\0' )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $490
line 1227
;1227:			break;
ADDRGP4 $476
JUMPV
LABELV $490
line 1228
;1228:	}
LABELV $475
line 1201
ADDRGP4 $474
JUMPV
LABELV $476
line 1230
;1229:
;1230:	return 0;
CNSTI4 0
RETI4
LABELV $473
endproc Info_RemoveKey 36 12
export Info_Validate
proc Info_Validate 8 0
line 1243
;1231:}
;1232:
;1233:
;1234:/*
;1235:==================
;1236:Info_ValidateKeyValue
;1237:
;1238:Some characters are illegal in info strings because they
;1239:can mess up the server's parsing
;1240:==================
;1241:*/
;1242:qboolean Info_Validate( const char *s )
;1243:{
line 1244
;1244:	for ( ;; )
LABELV $493
line 1245
;1245:	{
line 1246
;1246:		switch ( *s )
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 34
EQI4 $501
ADDRLP4 0
INDIRI4
CNSTI4 34
GTI4 $503
LABELV $502
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $500
ADDRGP4 $497
JUMPV
LABELV $503
ADDRLP4 0
INDIRI4
CNSTI4 59
EQI4 $501
ADDRGP4 $497
JUMPV
line 1247
;1247:		{
LABELV $500
line 1249
;1248:		case '\0':
;1249:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $492
JUMPV
LABELV $501
line 1252
;1250:		case '\"':
;1251:		case ';':
;1252:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $492
JUMPV
LABELV $497
line 1254
;1253:		default:
;1254:			++s;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1255
;1255:			continue;
line 1244
ADDRGP4 $493
JUMPV
LABELV $492
endproc Info_Validate 8 0
export Info_ValidateKeyValue
proc Info_ValidateKeyValue 12 0
line 1267
;1256:		}
;1257:	}
;1258:}
;1259:
;1260:
;1261:/*
;1262:==================
;1263:Info_ValidateKeyValue
;1264:==================
;1265:*/
;1266:qboolean Info_ValidateKeyValue( const char *s )
;1267:{
line 1268
;1268:	for ( ;; )
LABELV $505
line 1269
;1269:	{
line 1270
;1270:		switch ( *s )
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 34
EQI4 $513
ADDRLP4 0
INDIRI4
CNSTI4 34
GTI4 $515
LABELV $514
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $512
ADDRGP4 $509
JUMPV
LABELV $515
ADDRLP4 0
INDIRI4
CNSTI4 59
EQI4 $513
ADDRLP4 0
INDIRI4
CNSTI4 59
LTI4 $509
LABELV $516
ADDRLP4 0
INDIRI4
CNSTI4 92
EQI4 $513
ADDRGP4 $509
JUMPV
line 1271
;1271:		{
LABELV $512
line 1273
;1272:		case '\0':
;1273:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $504
JUMPV
LABELV $513
line 1277
;1274:		case '\\':
;1275:		case '\"':
;1276:		case ';':
;1277:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $504
JUMPV
LABELV $509
line 1279
;1278:		default:
;1279:			++s;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1280
;1280:			continue;
line 1268
ADDRGP4 $505
JUMPV
LABELV $504
endproc Info_ValidateKeyValue 12 0
export Info_SetValueForKey
proc Info_SetValueForKey 1060 20
line 1293
;1281:		}
;1282:	}
;1283:}
;1284:
;1285:
;1286:/*
;1287:==================
;1288:Info_SetValueForKey
;1289:
;1290:Changes or adds a key/value pair
;1291:==================
;1292:*/
;1293:qboolean Info_SetValueForKey( char *s, const char *key, const char *value ) {
line 1297
;1294:	char	newi[MAX_INFO_STRING+2];
;1295:	int		len1, len2;
;1296:
;1297:	len1 = (int)strlen( s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1036
INDIRI4
ASGNI4
line 1298
;1298:	if ( len1 >= MAX_INFO_STRING ) {
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $518
line 1299
;1299:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $520
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1300
;1300:	}
LABELV $518
line 1302
;1301:
;1302:	if ( !Info_ValidateKeyValue( key ) || *key == '\0' ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValidateKeyValue
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $523
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $521
LABELV $523
line 1303
;1303:		Com_Printf( S_COLOR_YELLOW "Invalid key name: '%s'\n", key );
ADDRGP4 $524
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1304
;1304:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $517
JUMPV
LABELV $521
line 1307
;1305:	}
;1306:
;1307:	if ( !Info_ValidateKeyValue( value ) ) {
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValidateKeyValue
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $525
line 1308
;1308:		Com_Printf( S_COLOR_YELLOW "Invalid value name: '%s'\n", value );
ADDRGP4 $527
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1309
;1309:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $517
JUMPV
LABELV $525
line 1312
;1310:	}
;1311:
;1312:	len1 -= Info_RemoveKey( s, key );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 Info_RemoveKey
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 1048
INDIRI4
SUBI4
ASGNI4
line 1313
;1313:	if ( !value || !*value )
ADDRLP4 1052
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $530
ADDRLP4 1052
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $528
LABELV $530
line 1314
;1314:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $517
JUMPV
LABELV $528
line 1316
;1315:
;1316:	len2 = Com_sprintf( newi, sizeof( newi ), "\\%s\\%s", key, value );
ADDRLP4 4
ARGP4
CNSTI4 1026
ARGI4
ADDRGP4 $531
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 Com_sprintf
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1056
INDIRI4
ASGNI4
line 1318
;1317:	
;1318:	if ( len1 + len2 >= MAX_INFO_STRING )
ADDRLP4 0
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
CNSTI4 1024
LTI4 $532
line 1319
;1319:	{
line 1320
;1320:		Com_Printf( S_COLOR_YELLOW "Info string length exceeded\n" );
ADDRGP4 $534
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1321
;1321:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $517
JUMPV
LABELV $532
line 1324
;1322:	}
;1323:
;1324:	strcpy( s + len1, newi );
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1325
;1325:	return qtrue;
CNSTI4 1
RETI4
LABELV $517
endproc Info_SetValueForKey 1060 20
export Info_SetValueForKey_Big
proc Info_SetValueForKey_Big 8228 20
line 1336
;1326:}
;1327:
;1328:
;1329:/*
;1330:==================
;1331:Info_SetValueForKey_Big
;1332:
;1333:Changes or adds a key/value pair
;1334:==================
;1335:*/
;1336:qboolean Info_SetValueForKey_Big( char *s, const char *key, const char *value ) {
line 1340
;1337:	char	newi[BIG_INFO_STRING+2];
;1338:	int		len1, len2;
;1339:
;1340:	len1 = (int)strlen( s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8204
INDIRI4
ASGNI4
line 1341
;1341:	if ( len1 >= BIG_INFO_STRING ) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $536
line 1342
;1342:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $520
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1343
;1343:	}
LABELV $536
line 1345
;1344:
;1345:	if ( !Info_ValidateKeyValue( key ) || *key == '\0' ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8208
ADDRGP4 Info_ValidateKeyValue
CALLI4
ASGNI4
ADDRLP4 8208
INDIRI4
CNSTI4 0
EQI4 $540
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $538
LABELV $540
line 1346
;1346:		Com_Printf( S_COLOR_YELLOW "Invalid key name: '%s'\n", key );
ADDRGP4 $524
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1347
;1347:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $535
JUMPV
LABELV $538
line 1350
;1348:	}
;1349:
;1350:	if ( !Info_ValidateKeyValue( value ) ) {
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8212
ADDRGP4 Info_ValidateKeyValue
CALLI4
ASGNI4
ADDRLP4 8212
INDIRI4
CNSTI4 0
NEI4 $541
line 1351
;1351:		Com_Printf( S_COLOR_YELLOW "Invalid value name: '%s'\n", value );
ADDRGP4 $527
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1352
;1352:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $535
JUMPV
LABELV $541
line 1355
;1353:	}
;1354:
;1355:	len1 -= Info_RemoveKey( s, key );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8216
ADDRGP4 Info_RemoveKey
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8216
INDIRI4
SUBI4
ASGNI4
line 1356
;1356:	if ( !value || !*value )
ADDRLP4 8220
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8220
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $545
ADDRLP4 8220
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $543
LABELV $545
line 1357
;1357:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $535
JUMPV
LABELV $543
line 1359
;1358:
;1359:	len2 = Com_sprintf( newi, sizeof( newi ), "\\%s\\%s", key, value );
ADDRLP4 4
ARGP4
CNSTI4 8194
ARGI4
ADDRGP4 $531
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8224
ADDRGP4 Com_sprintf
CALLI4
ASGNI4
ADDRLP4 8200
ADDRLP4 8224
INDIRI4
ASGNI4
line 1361
;1360:
;1361:	if ( len1 + len2 >= BIG_INFO_STRING )
ADDRLP4 0
INDIRI4
ADDRLP4 8200
INDIRI4
ADDI4
CNSTI4 8192
LTI4 $546
line 1362
;1362:	{
line 1363
;1363:		Com_Printf( S_COLOR_YELLOW "BIG Info string length exceeded\n" );
ADDRGP4 $548
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1364
;1364:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $535
JUMPV
LABELV $546
line 1367
;1365:	}
;1366:
;1367:	strcpy( s + len1, newi );
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1368
;1368:	return qtrue;
CNSTI4 1
RETI4
LABELV $535
endproc Info_SetValueForKey_Big 8228 20
bss
align 4
LABELV is_separator
skip 1024
align 4
LABELV com_tokenline
skip 4
align 4
LABELV com_lines
skip 4
align 1
LABELV com_parsename
skip 1024
align 1
LABELV com_token
skip 1024
import Com_Printf
import Com_Error
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_ReadToken
import trap_PC_SourceFileAndLine
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
LABELV $548
byte 1 94
byte 1 51
byte 1 66
byte 1 73
byte 1 71
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $534
byte 1 94
byte 1 51
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $531
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $527
byte 1 94
byte 1 51
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $524
byte 1 94
byte 1 51
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $520
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $455
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $436
byte 1 0
align 1
LABELV $417
byte 1 67
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 102
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $396
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 99
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $329
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 60
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $326
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 115
byte 1 114
byte 1 99
byte 1 0
align 1
LABELV $323
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $287
byte 1 41
byte 1 0
align 1
LABELV $282
byte 1 40
byte 1 0
align 1
LABELV $166
byte 1 77
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 84
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 33
byte 1 61
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $70
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $66
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $58
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $56
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
