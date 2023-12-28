shader_type canvas_item;


uniform float sway = 5;
uniform float speed = 10;


void vertex() {
	if (VERTEX.x > 0.0) {
		VERTEX += vec2(0, sin(TIME * speed) * sway);
	}
}
