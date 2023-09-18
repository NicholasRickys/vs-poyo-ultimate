package states;

import objects.Character;

typedef CharacterData = {
	name:String,
	facts:Array<String>,
	char:Null<Character>,
	offset_x:Float,
	offset_y:Float
}

class CharacterSelect extends MusicBeatState
{
	var curSelected = 0;

	final POYO:Int = 1;
	final NAFRI:Int = 2;
	final BF:Int = 0;

	var coloredfront:FlxSprite;

	var characters:Array<CharacterData> = [
		{
			name: "Boyfriend (PhantomArcade)",
			facts: [
				'The original style! Play with this skin if you got the Newgrounds soul.',
				'...There\'s nothing new with this guy, he\'s the same Boyfriend you know.'
			],
			//TODO: still gotta add facts text in the bottom left
			char: null,

			offset_x: 0,
			offset_y: 0
		},
		{
			name: "Poyo \"BLACK\" Oyop",
			facts: [
				'He doesn\'t have the best brain, but manages to bring it all together.',
				'His favorite drink is Coca-Cola.',
				'His father taught him to fight at the age of 8, due to his crazy mother.',
				'He\'s adopted!'
			],
			//TODO: still gotta add facts text in the bottom left
			char: null,

			offset_x: -250,
			offset_y: -150
		},
		{
			name: "Nafri IDKHISFULLNAME",
			facts: [
				'He is Poyo\'s best friend.',
				'He used to be the best at singing, until Poyo was trained by Boyfriend.',
				"He's a homosexual gay gay homosexua lfrklhfah hjk"
			],
			char: null,

			offset_x: -125,
			offset_y: -65
		}
	];

	var nameText:FlxText;
	var factsText:FlxText;

	function initializeCharacters()
	{
		characters[POYO].char = new Character(0,0,'poyoing-payer', true);
		characters[NAFRI].char = new Character(0,0,'nafri',false);
		characters[BF].char = new Character(0,0,'bf',true);

		for (i in [POYO, NAFRI, BF])
		{
			var char = characters[i].char;

			char.scale.x -= 0.25;
			char.scale.y -= 0.25;
			char.updateHitbox();

			add(char);

			char.screenCenter();

			char.x += characters[i].offset_x;
			char.y += characters[i].offset_y;
		}

		return true;
	}

	function setCharShit():Void
	{
		for (i in 0...characters.length)
		{
			var char = characters[i].char;
			var visibility = false;

			if (curSelected == i)
			{
				visibility = true;
				nameText.text = characters[i].name;

				factsText.text = "Facts:\n";
				for (v in 0...characters[i].facts.length)
				{
					var fact = characters[i].facts[v];
					factsText.text += '		$fact\n';
				}

				factsText.updateHitbox();
				factsText.y = FlxG.height - factsText.height;
			}

			char.visible = visibility;
		}
	}

	function changeCharacter(changeBy:Int):Void
	{
		var nextValue = curSelected + changeBy;
		trace(nextValue);

		if (nextValue >= characters.length)
			nextValue = 0;

		if (nextValue < 0)
			nextValue = characters.length-1;

		curSelected = nextValue;

		setCharShit();
	}

	override function create()
	{
		super.create();

		persistentDraw = persistentUpdate = true;

		var bg = new FlxSprite(0,0);
		bg.loadGraphic(Paths.image('menuDesat'));
		add(bg);

		initializeCharacters();

		factsText = new FlxText(4, 0, FlxG.width - 4, '* nothing yet\n* this is just for testing', 16);
		factsText.setFormat(null, 16, FlxColor.WHITE, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		factsText.borderSize = 2;
		add(factsText);

		coloredfront = new FlxSprite(0,0);
		coloredfront.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(coloredfront);

		nameText = new FlxText(0,(FlxG.height/2)-32,FlxG.width,'Choose your Character!',64);
		nameText.setFormat(null, 64, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		nameText.borderSize = 8;
		add(nameText);

		Conductor.bpm = 125;
		FlxG.sound.playMusic(Paths.music('characterSelect'));
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	
		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;
	
		if (controls.UI_LEFT_P)
			changeCharacter(-1);
		else if (controls.UI_RIGHT_P)
			changeCharacter(1);

		if (controls.ACCEPT)
		{
			PlayState.chosenCharacter = characters[curSelected].char.curCharacter;
			LoadingState.loadAndSwitchState(new PlayState());
		}
	}

	var hasGivenBack:Bool = false;

	override function beatHit()
	{
		super.beatHit();

		if (curBeat >= 2 && !hasGivenBack)
		{
			coloredfront.makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
			
			FlxTween.tween(coloredfront, {alpha: 0}, 1, {ease: FlxEase.linear});
			FlxTween.tween(nameText, {y: 0}, 1, {ease: FlxEase.cubeOut});
			setCharShit();

			hasGivenBack = true;
		}

		for (data in characters)
			data.char.dance();
	}
}