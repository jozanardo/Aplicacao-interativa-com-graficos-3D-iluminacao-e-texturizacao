#version 300 es

precision mediump float;

layout(location = 0) in vec3 inPosition;

uniform vec4 color;
uniform mat4 modelMatrix;
uniform mat4 viewMatrix;
uniform mat4 projMatrix;

uniform vec3 lightPosition;  // Posição da luz
out vec3 FragPos;            // Posição do fragmento
out vec3 Normal;             // Vetor normal do fragmento

out vec4 fragColor;

void main() {
  vec4 posEyeSpace = viewMatrix * modelMatrix * vec4(inPosition, 1);

  FragPos = vec3(modelMatrix * vec4(inPosition, 1.0));  // Transforma a posição para coordenadas do mundo
  Normal = mat3(transpose(inverse(modelMatrix))) * inPosition;

  float i = 1.0 - (-posEyeSpace.z / 100.0);
  fragColor = vec4(i, i, i, 1) * color;

  gl_Position = projMatrix * posEyeSpace;
}
