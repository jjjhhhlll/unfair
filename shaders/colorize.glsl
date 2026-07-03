
// these uniforms are passed in

// float timer
// float uIntensity
// float uOpacity 
// float uContrast 

void main() {
    vec4 color = texture(InputTexture, TexCoord);
    vec3 col = color.rgb;

    // bleach bypass style effect that raises contrast and blends with original colors
    vec3 lum = vec3(0.299, 0.587, 0.114);
    float bw = dot(col, lum);
    vec3 bwVec = vec3(bw);

    float contrast = min(1.0, max(0.0, uIntensity * (bw - uContrast)));

    vec3 result1 = 2.0 * color.rgb * bwVec;
    vec3 result2 = 1.0 - 2.0 * (1.0 - bwVec) * (1.0 - color.rgb);
    col = mix(result1, result2, contrast);

    float opacity = uOpacity * color.a;
    col = opacity * col.rgb + ((1.0 - opacity) * color.rgb);

    // flicker slowly (subtle light level change)
    col *= 1.25 + 0.15 * sin(0.8 * timer);

    FragColor = vec4(col, color.a);
}
