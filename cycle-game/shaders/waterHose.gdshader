shader_type canvas_item;

uniform float speed : hint_range(-10,10) = 1.0;

void fragment() {
    vec2 uv = UV; // normalized texture coordinates
    uv.x += TIME * speed;
    uv.x = fract(uv.x); // wrap around
    COLOR = texture(TEXTURE, uv);
}