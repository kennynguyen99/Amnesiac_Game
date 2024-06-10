#version 330

// From vertex shader
in vec2 texcoord;

// Application data
uniform sampler2D sampler0;
uniform vec3 fcolor;
uniform int totalXFrames;
uniform int currentXFrame;
uniform int currentYFrame;
uniform int totalYFrames;


// Output color
layout(location = 0) out  vec4 color;

void main()
{
	vec2 pos = vec2(currentXFrame % totalXFrames, currentYFrame % totalXFrames);
	float alpha = 1.0 - float(currentXFrame) / float(totalXFrames);
	color = vec4(fcolor, alpha) * texture(sampler0, vec2((texcoord.x / totalXFrames) + pos.x * (1.0 / totalXFrames), 
	(texcoord.y / totalYFrames) + pos.y * (1.0 / totalYFrames)));
}
