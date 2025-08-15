shader_type canvas_item;

float circle( in vec2 uv, in float radius ) {
	vec2 l = uv-vec2(0,5);
	return 1.-smoothstep(radius-(radius*0.01),
						 radius+(radius*0.01),
						 dot(l,l)*4.0);
}

vec2 tiling( vec2 uv, float tiling_amount) {
	uv *= tiling_amount;
	uv = fract(uv);
	return uv;
}

void fragment() {
	//vec2 u_resolution = 1.0 / SCREEN_PIXEL_SIZE;
	//vec2 st = FRAGCOORD.xy / u_resolution;
	vec2 st = tiling( UV, 5.0);

	vec3 color = vec3(st, 0.0);
	//vec3 color = vec3(circle(st, 1.5));

	COLOR = vec4(color, 1.0);
}
