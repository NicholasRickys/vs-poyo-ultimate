package states.stages;

import shaders.PyoyShader;
import openfl.filters.ShaderFilter;


class PoyoBackground extends BaseStage
{

	var shaderThing1:PyoyShader = new PyoyShader();


	override function create()
	{
		add(new BGSprite('backgrounds/poyocity/bg', -600, -250));
	}
	#if !mac
	override function createPost()
	{
		game.camGame.setFilters([new ShaderFilter(shaderThing1)]);
	}
	#end
}
