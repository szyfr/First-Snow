package main


//= Imports
import "vendor:raylib"

import "gamedata"
import "player"


//= Procedures

//* Initialization
main_initialization :: proc() {
	//* Raylib
	if !gamedata.DEBUG do raylib.SetTraceLogLevel(raylib.TraceLogLevel.NONE)
	raylib.InitWindow(
		gamedata.SCREEN_WIDTH,
		gamedata.SCREEN_HEIGHT,
		"First Snowfall",
	)
	raylib.SetTargetFPS(60)

	//* Player
	player.init()

	//* Misc graphics
	gamedata.snowballSpr    = raylib.LoadTexture("data/sprites/snowball.png")

	//* UI
	gamedata.ui_healthbar_1 = raylib.LoadTexture("data/sprites/hpbar_1.png")
	gamedata.ui_healthbar_2 = raylib.LoadTexture("data/sprites/hpbar_2.png")
	gamedata.ui_snowball    = raylib.LoadTexture("data/sprites/snowball_ui.png")

	snowballTest : gamedata.Snowball = {
		{0,0},
		{0,0},
		{100,40},
		0,
		0.75,
		false,
		false,
	}
	append(&gamedata.snowballs, snowballTest)
}

//* Free
main_free :: proc() {
	raylib.CloseWindow()
}