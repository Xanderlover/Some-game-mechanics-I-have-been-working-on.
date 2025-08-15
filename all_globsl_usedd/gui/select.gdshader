shader_type canvas_item;

uniform vec4 color : source_color;
uniform vec2 frequency = vec2(2.0);
uniform float amplitude = 2.0;
uniform float speed = 5.0;

void vertex() {
	VERTEX.x += cos(VERTEX.y * frequency.x + TIME * speed) * amplitude;
	VERTEX.y += sin(VERTEX.x * frequency.y + TIME * speed) * amplitude;
}

void fragment() {
	COLOR = color;
}
