package states.stages;

import states.stages.objects.*;

class PoyoBackground extends BaseStage
{
	override function create()
	{
		add(new BGSprite('backgrounds/poyocity/bg', -600, -250));
	}
}