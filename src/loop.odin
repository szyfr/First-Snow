package main


//= Imports
import "core:fmt"
import "core:strings"
import "vendor:raylib"
import "gamedata"
import "player"
import "ui"
import "snowballs"
import "enemies"
import "arena"


//= Procedures

//* Update
update :: proc() {
	arena.update()
	player.update()
	snowballs.update()
	enemies.update()
}

//* Draw
draw :: proc() {
	using raylib

	BeginDrawing()
	ClearBackground({222,255,222,255})
	BeginMode2D(gamedata.player.camera)

	//* Draw
	arena.draw()
	enemies.draw()
	player.draw()
	snowballs.draw()

	EndMode2D()

	//* UI
	ui.draw()

	if gamedata.DEBUG {
		builder : strings.Builder = {}
		str : cstring = strings.clone_to_cstring(
			fmt.sbprintf(
				&builder,
				"%v\n%v",
				gamedata.player.camera.target,
				gamedata.player.pointer/2,
			),
		)
		DrawText(str, 10, 125, 20, raylib.BLACK)
	}
	if gamedata.win do DrawText(
		"YOU WIN!",
		(gamedata.SCREEN_WIDTH/2) - 100,
		gamedata.SCREEN_HEIGHT/2 - 20,
		40, raylib.BLACK,
	)

	EndDrawing()
}

//* Main Loop
main_loop :: proc() {
	for !raylib.WindowShouldClose() {
		update()
		draw()
	}
}