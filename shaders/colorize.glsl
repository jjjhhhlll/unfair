
void main() {
    vec4 color = texture(InputTexture, TexCoord);
    /* sepia tone */
    vec3 lum = vec3(0.299, 0.587, 0.114);
    float bw = dot(color.rgb, lum);
    //FragColor = vec4(bw * vec3(1.0, 0.8, 0.4), color.a);
    FragColor = vec4(bw * vec3(abs(sin(timer)), 0.8, 0.4), color.a);

    /* normal 
    FragColor = color;
    */
}
