package states.stages;

import states.stages.objects.*;
import flixel.system.FlxAssets.FlxShader;
import shaders.NafriShader;
import openfl.filters.ShaderFilter;

class NafriBackground extends BaseStage
{
	var shaderThing1:NafriShader = new NafriShader();
	
	override function create()
	{
		add(new BGSprite('backgrounds/nafricity/sky', -1200, -850, 0.25, 0.25));
		add(new BGSprite('backgrounds/nafricity/bouttafuckinnut', -1200, -850, 0.55, 0.55));
		add(new BGSprite('backgrounds/nafricity/crowd', -1200, -850, 0.75, 0.75));
		add(new BGSprite('backgrounds/nafricity/buss', -1200, -850));
	}
	
	override function createPost()
		{
			game.camGame.setFilters([new ShaderFilter(shaderThing1)]);
		}
	

}