#version 300 es

precision mediump float;

in vec4 fragColor;
out vec4 outColor;

in vec3 FragPos;  // Posição do fragmento
in vec3 Normal;   // Vetor normal do fragmento

uniform vec3 lightPosition;  // Posição da luz
uniform vec3 lightColor;     // Cor da luz
uniform vec3 objectColor;    // Cor do objeto
uniform float ambientStrength;
uniform float specularStrength;
uniform float shininess;

void main() { 
    outColor = fragColor; 

    // Iluminação ambiente
    vec3 ambient = ambientStrength * lightColor;

    // Iluminação difusa
    vec3 norm = normalize(Normal);
    vec3 lightDir = normalize(lightPosition - FragPos);
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = diff * lightColor;

    // Iluminação especular
    vec3 viewDir = normalize(-FragPos);
    vec3 reflectDir = reflect(-lightDir, norm);

    float spec = pow(max(dot(viewDir, reflectDir), 0.0), shininess);
    vec3 specular = specularStrength * spec * lightColor;

    vec3 result = (ambient + diffuse + specular) * objectColor;
    outColor = vec4(result, 1.0);
}
