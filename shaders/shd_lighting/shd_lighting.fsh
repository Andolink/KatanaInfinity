//
// LIGHTING FRAGMENT SHADER
//
varying vec2 v_vTexcoord;
varying vec2 v_vPosition;
varying vec4 v_vColour;

uniform vec3 col_light;		// RGB
uniform vec2 light_pos;		// Room coords
uniform vec2 texel_size;
uniform float steps;		// or effect distance. Pass in as integer > 0

#define MAX_BRIGHTNESS 0.2
#define BRIGHTNESS_RANGE 256.0
void main()
{
    vec4 base_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	float dis = length(v_vPosition - light_pos);
	vec2 light_vec = (v_vPosition - light_pos) / dis * texel_size;

	float neighbor_light_alpha = 1.0; float neighbor_dark_alpha  = 1.0;
	for (float i = 1.0; i <= steps; i++) {
		neighbor_light_alpha	+= texture2D( gm_BaseTexture, v_vTexcoord - i * light_vec).a;
		//neighbor_dark_alpha		+= texture2D( gm_BaseTexture, v_vTexcoord + i * light_vec).a;
	}
	neighbor_light_alpha /= steps;
	
	if (dis > 100.0)
	{
		neighbor_light_alpha *= dis / 100.0;
	}
	
	if (neighbor_light_alpha > 1.0)
	{
		gl_FragColor = vec4(0.0,0.0,0.0,0.0);
	}
	//if (neighbor_light_alpha > 1.0)
	//{
	//	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	//}
	//else if (base_col.r + base_col.g + base_col.b < 0.14)
	//{
	//	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	//}
	else
	{
		float brightness = max(MAX_BRIGHTNESS - dis/BRIGHTNESS_RANGE, 0.0);
		//base_col.rgb = mix(col_light + brightness, base_col.rgb, neighbor_light_alpha);
		base_col.rgb = col_light + brightness;
		base_col.a = (1.0-neighbor_light_alpha)*base_col.a;
		//base_col.rgb *= col_light+brightness
		//base_col.rgb *= neighbor_light_alpha
		
		gl_FragColor = base_col;
	}
}
