var shaderName = 'citynight'; 

game.initLuaShader(shaderName);
var shaderThing = game.createRuntimeShader(shaderName);

function onCreatePost(){
    game.camGame.setFilters([new ShaderFilter(shaderThing)]);
}

function onUpdatePost(){
    shaderThing.setFloat('iTime', Conductor.songPosition * 2);
}