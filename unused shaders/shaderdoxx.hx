var shaderName1 = 'doxx'; 

game.initLuaShader(shaderName1);

var shaderThing1 = game.createRuntimeShader(shaderName1);

function onCreatePost(){
    game.camGame.setFilters([new ShaderFilter(shaderThing1)]);
}

function onUpdatePost(){
    shaderThing1.setFloat('iTime', Conductor.songPosition * 2);
}