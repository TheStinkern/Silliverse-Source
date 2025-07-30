package shaders;

import defaultShaderFuncions;

class BlockedGlitchEffect
{
    public var shader(default, null):BlockedGlitchShader = new BlockedGlitchShader();

    public var time(default, set):Float = 0;
    public var resolution(default, set):Float = 0;
    public var colorMultiplier(default, set):Float = 0;
    public var hasColorTransform(default, set):Bool = false;

    public function new(res:Float, time:Float, colorMultiplier:Float, colorTransform:Bool):Void
    {
        set_time(time);
        set_resolution(res);
        set_colorMultiplier(colorMultiplier);
        set_hasColorTransform(colorTransform);
        PlayState.instance.shaderUpdates.push(update);
    }
    public function update(elapsed:Float):Void
    {
        shader.time.value[0] += elapsed;
    }
    public function set_resolution(v:Float):Float
    {
        resolution = v;
        shader.screenSize.value = [resolution];
        return this.resolution;
    }
	function set_hasColorTransform(value:Bool):Bool {
		this.hasColorTransform = value;
        shader.hasColorTransform.value = [hasColorTransform];
        return hasColorTransform;
	}

	function set_colorMultiplier(value:Float):Float {
        this.colorMultiplier = value;
        shader.colorMultiplier.value = [value];
        return this.colorMultiplier;
    }

	function set_time(value:Float):Float {
        this.time = value;
        shader.time.value = [value];
        return this.time;
    }
}

class BlockedGlitchShader extends FlxShader
{
    // https://www.shadertoy.com/view/MlVSD3
    @:glFragmentSource('
    #pragma header

    // ---- gllock required fields -----------------------------------------------------------------------------------------
    #define RATE 0.75
    uniform float time;
    uniform float end;
    uniform sampler2D imageData;
    uniform vec2 screenSize;
    // ---------------------------------------------------------------------------------------------------------------------

    float rand(vec2 co){
      return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453) * 2.0 - 1.0;
    }

    float offset(float blocks, vec2 uv) {
      float shaderTime = time*RATE;
      return rand(vec2(shaderTime, floor(uv.y * blocks)));
    }

    void main(void) {
      vec2 uv = openfl_TextureCoordv;
      gl_FragColor = flixel_texture2D(bitmap, uv);
      gl_FragColor.r = flixel_texture2D(bitmap, uv + vec2(offset(64.0, uv) * 0.03, 0.0)).r;
      gl_FragColor.g = flixel_texture2D(bitmap, uv + vec2(offset(64.0, uv) * 0.03 * 0.16666666, 0.0)).g;
      gl_FragColor.b = flixel_texture2D(bitmap, uv + vec2(offset(64.0, uv) * 0.03, 0.0)).b;
    }
    ')

    public function new()
    {
        super();
    }
}