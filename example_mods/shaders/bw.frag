//SHADERTOY PORT FIX
#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define iChannel1 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main
//****MAKE SURE TO remove the parameters from mainImage.
//SHADERTOY PORT FIX

void mainImage()
{
    // Normalize pixel coordinates
    vec2 uv = fragCoord.xy / iResolution.xy;

    // Sample texture and calculate alpha
    vec4 tex_color = texture(iChannel0, uv);
    float alpha = tex_color.a;
    
    // Apply effect only to opaque pixels
    if (alpha > 0.0) {
        // Calculate edge intensity
        float edge = length(dFdx(uv.yx) + dFdy(uv.yx)) * 10.0;
        
        // Convert to black and white
        float gray = dot(tex_color.rgb, vec3(0.299, 0.587, 0.114));
        
        // Combine edge and gray values
        fragColor = vec4(vec3(1.0 - edge) * gray, alpha);
    } else {
        // Leave transparent pixels unchanged
        fragColor = tex_color;
    }
}
