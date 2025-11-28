package states;

import flixel.FlxObject;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = 'Demo'; // This is also used for Discord RPC
	public static var curSelected:Int = 0;
	public static var devBuild:Bool = false; // enable for, you know, developer shit.

	var menuItems:FlxTypedGroup<FlxSprite>;

	var optionShit:Array<String> = [
		'story_mode',
		'freeplay',
		'discord',
		'credits',
		'options'
	];

	public static var bgPaths:Array<String> = ['sam', 'tim', 'stinko', 'koiko', 'Eggy_in_Space', 'stinko-2']; // shoutout to T5mpler, took this from the DnB 3.0 source archive.
	public static var menuBg:FlxSprite;

	var magenta:FlxSprite;
	var pig:FlxSprite;
	var pigJumpscare:FlxSprite;

	var camFollow:FlxObject;

	override function create()
	{
		var ewie:Float = FlxG.random.int(1, 3);

		
		#if MODS_ALLOWED
		Mods.pushGlobalMods();
		#end
		Mods.loadTopMod();

		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		menuBg = new FlxSprite(-80).loadGraphic(randomizeBG());
		menuBg.antialiasing = ClientPrefs.data.antialiasing;
		menuBg.scrollFactor.set(0, yScroll);
		menuBg.setGraphicSize(Std.int(menuBg.width * 1.175));
		menuBg.updateHitbox();
		menuBg.screenCenter();
		if (ClientPrefs.data.darkMode) {
			menuBg.color = 0xff4e6fac;
		}
		else {
			menuBg.color = 0xffc4748f;
		}
		add(menuBg);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		magenta = new FlxSprite(-80).loadGraphic(menuBg.graphic);
		magenta.antialiasing = ClientPrefs.data.antialiasing;
		magenta.scrollFactor.set(0, yScroll);
		magenta.setGraphicSize(Std.int(magenta.width * 1.175));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;

		if (ClientPrefs.data.darkMode) {
			magenta.color = 0xff1db6a9;
		}
		else{
			magenta.color = 0xffe01c57;
		}
		add(magenta);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		for (i in 0...optionShit.length)
		{
			var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(0, (i * 140) + offset);
			menuItem.antialiasing = ClientPrefs.data.antialiasing;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			if (optionShit.length < 6)
				scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.updateHitbox();
			menuItem.screenCenter(X);
		}

		/*var discordButton = new FlxButton(0,0, "Discord Server", onButtonClicked); // opens a link leading to the discord 
		discordButton.screenCenter();
		discordButton.x = 720;
		add(discordButton);
		discordButton.loadGraphic("assets/images/mainmenu/discordButton.png");*/

		var silliVer:FlxText = new FlxText(12, FlxG.height - 64, 0, "Silliverse " + psychEngineVersion, 12);
		silliVer.scrollFactor.set();
		silliVer.setFormat(Paths.font('vcr.ttf'), 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(silliVer);
		var psychVer:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine v0.7.3", 12);
		psychVer.scrollFactor.set();
		psychVer.setFormat(Paths.font('vcr.ttf'), 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(psychVer);
		var fnfVer:FlxText = new FlxText(12, FlxG.height - 24, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		fnfVer.scrollFactor.set();
		fnfVer.setFormat(Paths.font('vcr.ttf'), 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(fnfVer);
		changeItem();
		
		pig = new FlxSprite().loadGraphic(Paths.image('mainmenu/pig'));
		pig.x = (FlxG.width / 2) - (pig.width / 2);
		pig.alpha = 0.8;

		if (ewie != 1)
			pig.visible = false;
		else 
			FlxG.mouse.visible = true;

		pig.antialiasing = false;
		pig.scrollFactor.set(0, 0);
		add(pig);

		pigJumpscare = new FlxSprite().loadGraphic(Paths.image('mainmenu/pigJumpscare'));
		pigJumpscare.antialiasing = false;
		pigJumpscare.scrollFactor.set(0, 0);
		pigJumpscare.setGraphicSize(Std.int(pigJumpscare.width * 1.3));
		
		pigJumpscare.screenCenter();
		


		//magenta.visible = false;

		#if ACHIEVEMENTS_ALLOWED
		// Unlocks "Freaky on a Friday Night" achievement if it's a Friday and between 18:00 PM and 23:59 PM
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18)
			Achievements.unlock('friday_night_play');

		#if MODS_ALLOWED
		Achievements.reloadList();
		#end
		#end

		super.create();

		FlxG.camera.follow(camFollow, null, 9);
	}

	var selectedSomethin:Bool = false;

	function onButtonClicked()
	{
		trace('Opening Discord Server');
		CoolUtil.browserLoad('https://discord.gg/YjkApuGjmD');
		FlxG.sound.play(Paths.sound('confirmMenu'));
	}

	override function update(elapsed:Float)
	{
		if (FlxG.mouse.overlaps(pig) && FlxG.mouse.justPressed && (pig.visible == true))
		{
			add(pigJumpscare);
			FlxG.sound.play(Paths.sound('scream'));
			new FlxTimer().start(0.5, function(tmr:FlxTimer)
				{
					Sys.exit(0);
				});
		}
		if (pigJumpscare != null) {
			pigJumpscare.offset.x = FlxG.random.int(-12, 12);
			pigJumpscare.offset.y = FlxG.random.int(-12, 12);
			pigJumpscare.angle = FlxG.random.int(-7, 7);
		}
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * elapsed;
			if (FreeplayState.vocals != null)
				FreeplayState.vocals.volume += 0.5 * elapsed;
		}

		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
				changeItem(-1);

			if (controls.UI_DOWN_P)
				changeItem(1);

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'));
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else if (optionShit[curSelected] == 'discord')
				{
					CoolUtil.browserLoad('https://discord.gg/YjkApuGjmD');
					trace('Opening Discord Server');
				}
				else
				{
					selectedSomethin = true;

					if (ClientPrefs.data.flashing)
						FlxFlicker.flicker(magenta, 1.1, 0.15, false);

					FlxFlicker.flicker(menuItems.members[curSelected], 1, 0.06, false, false, function(flick:FlxFlicker)
					{
						switch (optionShit[curSelected])
						{
							case 'story_mode':
								MusicBeatState.switchState(new StoryMenuState());
							case 'freeplay':
								MusicBeatState.switchState(new FreeplayState());

							#if MODS_ALLOWED
							case 'mods':
								MusicBeatState.switchState(new ModsMenuState());
							#end

							#if ACHIEVEMENTS_ALLOWED
							case 'awards':
								MusicBeatState.switchState(new AchievementsMenuState());
							#end

							case 'credits':
								MusicBeatState.switchState(new CreditsState());
							case 'options':
								MusicBeatState.switchState(new OptionsState());
								OptionsState.onPlayState = false;
								if (PlayState.SONG != null)
								{
									PlayState.SONG.arrowSkin = null;
									PlayState.SONG.splashSkin = null;
									PlayState.stageUI = 'normal';
								}
						}
					});

					for (i in 0...menuItems.members.length)
					{
						if (i == curSelected)
							continue;
						FlxTween.tween(menuItems.members[i], {alpha: 0}, 0.4, {
							ease: FlxEase.quadOut,
							onComplete: function(twn:FlxTween)
							{
								menuItems.members[i].kill();
							}
						});
					}
				}
			}
			if (devBuild) {
			#if desktop
			if (controls.justPressed('debug_1'))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
			}
		}

		super.update(elapsed);
	}

	function changeItem(huh:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'));
		menuItems.members[curSelected].animation.play('idle');
		menuItems.members[curSelected].updateHitbox();
		menuItems.members[curSelected].screenCenter(X);

		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.members[curSelected].animation.play('selected');
		menuItems.members[curSelected].centerOffsets();
		menuItems.members[curSelected].screenCenter(X);

		camFollow.setPosition(menuItems.members[curSelected].getGraphicMidpoint().x,
			menuItems.members[curSelected].getGraphicMidpoint().y - (menuItems.length > 4 ? menuItems.length * 8 : 0));
	}
	public static function randomizeBG()
	{
		var chance:Int = FlxG.random.int(0, bgPaths.length - 1);
		return Paths.image('backgrounds/${bgPaths[chance]}');
	}
}
