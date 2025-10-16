package options;

import flixel.addons.ui.FlxUI;
import backend.Controls;
import flixel.graphics.FlxGraphic;
import flixel.input.keyboard.FlxKey;
class MiscSettingSubState extends BaseOptionsMenu
{

	public function new()
	{
		title = 'Misc. options';
		rpcTitle = 'Misc. Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Dark Mode',
			"It's pretty explainable. Menu Bg and window will be dark except Freeplay.\nGame will restart after selecting this option.",
			'darkMode',
			'bool');
		addOption(option);
		//option.onChange = onChangeDarkMode;
		super();
	}

	function onChangeDarkMode()
	{
		var i:Int = -1;
		var messages = [
			"Looks like you change this option.\nDo you want to restart now?"
		];
    var nextMessage:Void->Void = null;

    nextMessage = function() {
        i++;
      if (i >= messages.length) {
				FlxG.resetGame();
      } 
			else {
        openSubState(new substates.Prompt(messages[i], 0, function() {nextMessage();}, null, false, "Yes", "No"));
      }
    }
		nextMessage();
	}

	override function changeSelection(change:Int = 0)
	{
		super.changeSelection(change);
	}
}