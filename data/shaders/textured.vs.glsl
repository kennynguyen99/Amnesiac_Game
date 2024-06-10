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


void main()
{
	int spritesheet_total_x_frame = 2;
	int spritesheet_current_x_frame = 1;
	vec2 normalizedTexcoord = in_texcoord;
	//normalizedTexcoord.x = normalizedTexcoord.x * spritesheet_total_x_frame;

	//normalizedTexcoord.x += spritesheet_current_x_frame / spritesheet_total_x_frame;
	texcoord = normalizedTexcoord;
	//texcoord = in_texcoord;
	vec3 pos = projection * view * transform * vec3(in_position.xy, 1.0);
	gl_Position = vec4(pos.xy, in_position.z, 1.0);
}