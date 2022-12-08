#!/bin/bash

### Picom with custom shader:
### Does not work with experimential backends,
### currently (https://github.com/yshui/picom/issues/386).
### Experimential backends are required for kawase
#picom --config $HOME/.config/picom/picom.conf --detect-rounded-corners  \
#   --glx-fshader-win "uniform float opacity;
#uniform bool invert_color;
#uniform sampler2D tex;
#
#void main() {
#	vec4 c = texture2D(tex, gl_TexCoord[0].xy);
#	{
#		vec4 vdiff = abs(vec4(1.0, 1.0, 1.0, 1.0) - c);
#		float diff = max(max(max(vdiff.r, vdiff.g), vdiff.b), vdiff.a);
#	  c *= (diff + 9.0) / 10.0;
#	}
#	gl_FragColor = c;
#}"


picom --config $HOME/.config/picom/picom.conf
# --corner-radius $(expr $GDK_SCALE \* 10)


# More shaders: https://github.com/yshui/picom/wiki/Shader-Shop




