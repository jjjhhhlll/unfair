
// these uniforms are passed in

// float timer
// float uIntensity
// float uOpacity 
// float uContrast 

void main() {
    vec4 base = texture(InputTexture, TexCoord);
    vec3 lumCoeff = vec3(0.299, 0.587, 0.114);
    float lum = dot(lumCoeff, base.rgb);
    vec3 blend = lum.rrr;

    float L = min(1, max(0, uIntensity*(lum - uContrast)));

    vec3 result1 = 2.0 * base.rgb * blend;
    // need clamp because blend can get too large causing white to change to blue/black
    // archville, plasma, bfg, etc...
    vec3 result2 =  1.0 - (2.0 * (1.0 - clamp(blend, 0.0, 0.799)) * (1.0 - base.rgb));
    vec3 newColor = mix(result1, result2, L);

    float A2 = uOpacity * base.a;
    vec3 mixRgb = A2 * newColor.rgb;
    mixRgb += ((1.0 - A2) * base.rgb);

    // add pulsating effect
    mixRgb *= 1.25 + 0.17 * sin(0.88 * timer);

    FragColor = vec4(mixRgb, base.a);
}
