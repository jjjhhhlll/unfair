
// these uniforms are passed in

// float timer
// float uIntensity
// float uOpacity 
// float uContrast 
// float uTemperature
// float uTemperatureStrength

// adapted from https://www.shadertoy.com/view/4sc3D7
vec3 colorTemperatureToRGB(const in float temperature){
  // Values from: http://blenderartists.org/forum/showthread.php?270332-OSL-Goodness&p=2268693&viewfull=1#post2268693   
  mat3 m = (temperature <= 6500.0) ? mat3(vec3(0.0, -2902.1955373783176, -8257.7997278925690),
	                                      vec3(0.0, 1669.5803561666639, 2575.2827530017594),
	                                      vec3(1.0, 1.3302673723350029, 1.8993753891711275)) : 
	 								 mat3(vec3(1745.0425298314172, 1216.6168361476490, -8257.7997278925690),
   	                                      vec3(-2666.3474220535695, -2173.1012343082230, 2575.2827530017594),
	                                      vec3(0.55995389139931482, 0.70381203140554553, 1.8993753891711275)); 
  return mix(clamp(vec3(m[0] / (vec3(clamp(temperature, 1000.0, 40000.0)) + m[1]) + m[2]), vec3(0.0), vec3(1.0)), vec3(1.0), smoothstep(1000.0, 0.0, temperature));
}

void main() {
    vec4 base = texture(InputTexture, TexCoord);
    vec3 lumCoeff = vec3(0.299, 0.587, 0.114);
    float lum = dot(lumCoeff, base.rgb);
    vec3 blend = lum.rrr;

    float L = min(1, max(0, uIntensity*(lum - uContrast)));

    vec3 result1 = 2.0 * base.rgb * blend;
    // need clamp because blend can get too large causing white to change to blue/black
    // archville, plasma, bfg, etc...
    vec3 result2 =  1.0 - (2.0 * (1.0 - clamp(blend, 0.0, 0.742)) * (1.0 - base.rgb));
    vec3 newColor = mix(result1, result2, L);

    float A2 = uOpacity * base.a;
    vec3 mixRgb = A2 * newColor.rgb;
    mixRgb += ((1.0 - A2) * base.rgb);

    // add pulsating effect
    mixRgb *= 1.25 + (L * 0.13) * sin(0.9 * timer);

    vec3 outColor = mix(mixRgb, mixRgb * colorTemperatureToRGB(uTemperature), uTemperatureStrength);

    FragColor = vec4(outColor, base.a);
}
