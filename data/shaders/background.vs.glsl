#version 330

// Input attributes
in vec3 in_position;
in vec2 in_texcoord;

// Passed to fragment shader
out vec2 texcoord;

// Application data
uniform mat3 transform;
uniform mat3 view;
uniform mat3 projection;
uniform float parallax_factor;
uniform float x_scale;


void main()
{
	texcoord = in_texcoord;
	float time = view[2][0] / 200.0;
	
	float parallaxed_x = mod(parallax_factor * - view[2][0], x_scale);

	mat3 parallax_view = mat3(1.0);
	parallax_view[2][0] = - parallaxed_x;

	vec3 pos = projection * parallax_view * transform * vec3(in_position.xy, 1.0);
	gl_Position = vec4(pos.xy, in_position.z, 1.0);
}

