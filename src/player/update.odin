package player


//= Imports
import "core:fmt"
import "core:math"
import "vendor:raylib"

import "../gamedata"


//= Procedures
update :: proc() {
	using gamedata

	if raylib.IsKeyDown(raylib.KeyboardKey.W) {
		player.position -= {0,0.4}
	}
	if raylib.IsKeyDown(raylib.KeyboardKey.S) {
		player.position += {0,0.4}
	}
	if raylib.IsKeyDown(raylib.KeyboardKey.A) {
		player.position -= {0.4,0}
	}
	if raylib.IsKeyDown(raylib.KeyboardKey.D) {
		player.position += {0.4,0}
	}

	if raylib.IsMouseButtonPressed(raylib.MouseButton.LEFT) {
		sb : Snowball = {
			player.position,
			player.position,
			player.pointer,
			0,
			0.75,
			true,
			false,
		}
		append(&snowballs, sb)
	}
	if raylib.IsMouseButtonPressed(raylib.MouseButton.RIGHT) {
		sb : Snowball = {
			player.position,
			player.position,
			player.pointer,
			0,
			0.75,
			true,
			true,
		}
		append(&snowballs, sb)
	}
	
	player.camera.target = player.position
	player.pointer = player.position + (raylib.GetMousePosition() - {SCREEN_WIDTH/2, SCREEN_HEIGHT/2})/3
}