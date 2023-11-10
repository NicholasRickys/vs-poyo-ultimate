function onCreate()
{
    game.skipCountdown = true;
}

function onCreatePost()
{
    game.camGame.alpha = 0.001;

    game.camHUD.alpha = 0.001;
    FlxTween.tween(game.camHUD, {alpha: 1}, Conductor.crochet/1000);
    // what the fuck am i doing WHAT IS THE TIMEI  NEED TO SET FOR THE TWEEN
}