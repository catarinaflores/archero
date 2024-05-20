shader_type canvas_item;

uniform float strength: hint_range(0., 1.) = 0.3;
uniform float speed: hint_range(0., 10.) = 0.5;
uniform float angle: hint_range(0., 360.) = 0.;


// option 1
void fragment() {
	float hue = UV.x * cos(radians(angle)) - UV.y * sin(radians(angle));
	hue = fract(hue + fract(TIME  * speed));
	float x = 1. - abs(mod(hue / (1./ 6.), 2.) - 1.);
	vec3 rainbow;
	if(hue < 1./6.){
		rainbow = vec3(1., x, 0.);
	} else if (hue < 1./3.) {
		rainbow = vec3(x, 1., 0);
	} else if (hue < 0.5) {
		rainbow = vec3(0, 1., x);
	} else if (hue < 2./3.) {
		rainbow = vec3(0., x, 1.);
	} else if (hue < 5./6.) {
		rainbow = vec3(x, 0., 1.);
	} else {
		rainbow = vec3(1., 0., x);
	}
	vec4 color = texture(TEXTURE, UV);
	COLOR = mix(color, vec4(rainbow, color.a), strength);
}

// uniform vec3 cat_color: source_color;


// option 2
// void fragment() {
	// float b = step(1.19, length(COLOR.rgb * vec3(1, 1, 0)));
	// COLOR.rgb = b * COLOR.rgb + (1.0 - b) * COLOR.b * cat_color;
// }


// option 3
// void fragment() {
	// vec3 color_without_blue = COLOR.rgb * vec3(1, 1, 0);
	// float amount_of_red_and_green = length(color_without_blue);
	// float red_and_green_mask = step(0.32, amount_of_red_and_green);
	// vec3 retained_color = COLOR.rgb * red_and_green_mask;
	// float blue_mask = (1.0 - red_and_green_mask) * COLOR.b;
	// vec3 masked_detail_color = detail_color * blue_mask;
	// vec3 final_color = retained_color + masked_detail_color;
	// COLOR.rgb = retained_color + masked_detail_color;
// }