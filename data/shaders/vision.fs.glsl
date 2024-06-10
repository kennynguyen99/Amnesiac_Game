#version 330

uniform sampler2D screen_texture;
uniform float time;
uniform float vision_radius;
uniform float x_pos;
uniform float y_pos;

in vec2 texcoord;

layout(location = 0) out vec4 color;

vec4 color_shift(vec4 in_color)
{
	in_color = vec4(in_color.x, in_color.y*0.95, in_color.z*0.8, 0);
	return in_color;
}

vec4 fog_of_war(vec4 in_color, vec2 uv)
{
	float vis_rad_mod = vision_radius - 0.01*sin(time/8);
	float dist = sqrt(pow(uv.x-x_pos, 2.0) + pow((uv.y-y_pos)*0.7, 2.0));
	float delta = dist - vis_rad_mod;
	float threshold = vis_rad_mod;
	float grad = 1-(threshold+delta)*(1/threshold);
	if (delta >= 0) 
	{
		in_color = vec4(0, 0, 0, 0);
	}
	else if (delta >= -1*threshold)
	{
		in_color = vec4(in_color.x*grad, in_color.y*grad, in_color.z*grad, 0);
	}
	return in_color;
}

void main()
{
	vec4 in_color = texture(screen_texture, texcoord);
	color = color_shift(in_color);
	color = fog_of_war(color, texcoord);
	color = color * 1.2;
}