package states;

import flixel.FlxObject;
import flixel.effects.FlxFlicker;

class randomBg extends MusicBeatState
{
  public static var randomBg:Array<String> = ['sam', 'tim'];
	public static var selected_flashColor:String = 'Demo';

	public static function addMenuBg(color:String,flashColor:String):flixel.system.FlxAssets.FlxGraphicAsset
	{
    var chance:Int = FlxG.random.int(0, randomBg.length - 1);
		return Paths.image(randomBg[chance]);
    
    if (!ClientPrefs.darkMode) { 
      if (flashColor && color) 
      {
        selected_flashColor = '0xFF' + flashColor;
        selected_Color = '0xFF';
      }
      else 
      {
        selected_flashColor = 0xFFfd719b;
      }
    }
    else {
      if (bg != null && magenta != null) {
        bg.alpha = 0.5;
        magenta.alpha = 0.5;
      }
      if (flashColor && color) 
      {
          selected_flashColor = flashColor;
      }
      else 
      {
        selected_flashColor = '0xFF' + flashColor;
      }
    }

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('randomBackgrounds/' + randomBGevent()));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		bg.scrollFactor.set(0, yScroll);
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		magenta = new FlxSprite(-80).loadGraphic(bg.graphic);
		magenta.antialiasing = ClientPrefs.data.antialiasing;
		magenta.scrollFactor.set(0, yScroll);
		magenta.setGraphicSize(Std.int(magenta.width * 1.175));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.color = 0xFFfd719b;
		add(magenta);
	}
}