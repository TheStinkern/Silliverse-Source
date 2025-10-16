package shaders;

// STOLEN FROM HAXEFLIXEL DEMO LOL
import flixel.system.FlxAssets.FlxShader;

class ShakeEffect
{
	public var shader(default, null):ShakeShader = new ShakeShader();
	public var shakeIntensity(default, set):Float = 0;
	public var shakeInterval(default, set):Float = 0;

	public function update(elapsed:Float):Void
	{
		shader.iTime.value[0] += elapsed;
	}

	public function setValue(value:Float):Void
	{
		shader.iTime.value[0] = value;
	}

	function set_shakeIntensity(shakeIntensity:Float):Float
	{
		//shakeIntensity = shakeIntensity;
		shader.strength.value = [shakeIntensity];
		return shakeIntensity;
	}

	function set_shakeInterval(shakeInterval:Float):Float
	{
		//shakeInterval = shakeInterval;
		shader.interval.value = [shakeInterval];
		return shakeInterval;
	}
	public function new()
	{
		shader.iTime.value = [0, 0, 0];
	}
}

class ShakeShader extends FlxShader
{
	@:glFragmentSource("
// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header

// Parameters
uniform float interval = 0.01;    // How often the shake offset updates (in seconds)
uniform float strength = 0.02;    // Maximum shake offset strength (in UV coordinates)

// Simple 1D pseudo-random function based on sine
float rand(float x) {
    return fract(sin(x * 12.9898 + 78.233) * 43758.5453);
}

vec3 scene(vec2 uv) {
    return texture(iChannel0, uv).rgb;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    // Normalized pixel coordinates [0,1]
    vec2 uv = fragCoord / iResolution.xy;
    
    // Calculate a time-based seed, updating every 'interval' seconds
    float timeSeed = floor(iTime / interval);
    
    // Generate pseudo-random offsets for X and Y using different seeds
    float offsetX = rand(timeSeed) - 0.5;
    float offsetY = rand(timeSeed + 40.0) - 0.5;
    
    // Apply strength to the offset to control shake magnitude
    vec2 offset = vec2(offsetX, offsetY) * strength;
    
    // Add offset to UV coordinates to create shaking effect
    vec2 shakedUV = uv + offset;
    
    // Clamp coordinates to avoid sampling outside texture bounds
    shakedUV = clamp(shakedUV, 0.0, 1.0);
    
    // Sample the scene texture at the shaken coordinates
    vec3 col = scene(shakedUV);
    
    fragColor = vec4(col, texture(iChannel0, fragCoord / iResolution.xy).a);
}


void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}")
	public function new()
	{
		super();
	}
}