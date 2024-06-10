#version 330

// From vertex shader
in vec2 texcoord;

// Application data
uniform sampler2D sampler0;
uniform vec3 fcolor;
uniform int damage_light;
uniform float time;
uniform int totalXFrames;
uniform int currentXFrame;
uniform int currentYFrame;
uniform int totalYFrames;


// Output color
layout(location = 0) out  vec4 color;

void main()
{
	vec2 pos = vec2(currentXFrame % totalXFrames, currentYFrame % totalXFrames);
	color = vec4(fcolor, 1.0) * texture(sampler0, vec2((texcoord.x / totalXFrames) + pos.x * (1.0 / totalXFrames), 
	(texcoord.y / totalYFrames) + pos.y * (1.0 / totalYFrames)));
	
	//color = vec4(fcolor, 1.0) * texture(sampler0, vec2(texcoord.x, texcoord.y));
	
	if (damage_light == 1) {
		//color.xyz += 0.2 * vec3(1.0, 0.0, 0.0);
		float blink = step(0.5, fract(time * 2.5));
		color.xyz += blink * 0.3 * vec3(1.0, 0.0, 0.0);
	}
}
