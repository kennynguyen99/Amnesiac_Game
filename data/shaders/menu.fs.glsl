#version 330

#define M_PI 3.1415926535897932384626433832795
uniform sampler2D screen_texture;
uniform float time;

in vec2 texcoord;

layout(location = 0) out vec4 color;

vec2 distort(vec2 uv) 
{
	float wave_x = sin(uv.y * 10.0 + time / 2.0) / 2.0 + 0.5;
	float wave_y = sin(uv.x * 10.0 + time / 2.0) / 2.0 + 0.5;

	uv.x = uv.x * (1 - 0.01 * wave_x);
	uv.y = uv.y * (1 - 0.01 * wave_y);

	return uv;
}

void main()
{
	vec2 coord = distort(texcoord);
	coord = texcoord;
	vec4 in_color = texture(screen_texture, coord);
	color = in_color;
}