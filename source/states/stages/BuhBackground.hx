package states.stages;


import states.stages.objects.*;
import flixel.system.FlxAssets.FlxShader;
import shaders.DoxxShader;
import openfl.filters.ShaderFilter;


class BuhBackground extends BaseStage
{
	var shaderThing1:DoxxShader = new DoxxShader();

	override function create()
	{
		add(new BGSprite('backgrounds/buh/bg', -600, -250));
	}

	override function createPost()
	{
		game.camGame.setFilters([new ShaderFilter(shaderThing1)]);
	}
	
}
