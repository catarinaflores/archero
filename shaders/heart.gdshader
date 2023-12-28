shader_type canvas_item;

uniform float sway = 5;
uniform float speed = 3;
uniform float sway2 = -5;

void vertex() {
	if (VERTEX.x > 0.0) {
		VERTEX += vec2(0, sin(TIME * speed) * sway2);
	}
	if (VERTEX.x < 0.0) {
		VERTEX += vec2(0, sin(TIME * speed) * sway);
	}
	if (VERTEX.y < 0.0) {
		VERTEX += vec2(0, sin(TIME * speed) * sway2);
	}
	if (VERTEX.y > 0.0) {
		VERTEX += vec2(0, sin(TIME * speed) * sway);
	}
}
