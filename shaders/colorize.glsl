
//const vec2 iResolution = vec2(1280,720);
const vec2 iResolution = vec2(640,480);

void main() {
    vec4 color = texture(InputTexture, TexCoord);
    vec3 col = color.rgb;

    // sepia tone 
    /*
    vec3 lum = vec3(0.299, 0.587, 0.114);
    float bw = dot(col, lum);
    col = bw * vec3(1.0, 0.8, 0.4);
    col = bw * vec3(1.0, 0.4, 0.15);
    */


    /* normal 
    FragColor = color;
    */

    // scanline
    float scans = clamp( 
        0.35 + 0.18 * sin(6.0 * timer + TexCoord.y * iResolution.y*1.5),
        0.0, 
        1.0
    );
    float s = pow(scans, 0.07);
    col = col*vec3(s);

    // flicker
    col *= 1.0 + 0.02 * sin(200.0 * timer);



    FragColor = vec4(col, color.a);
}
