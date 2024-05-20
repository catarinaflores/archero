shader_type canvas_item;

uniform float sway = 5;
uniform float sway2 = -5;
uniform float speed = 15;


void vertex() {
	if (VERTEX.y < 0.0) {
		VERTEX += vec2(sin(TIME * speed) * sway2, 0);
	}
}
