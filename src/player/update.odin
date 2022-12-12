package player


//= Imports
import "core:fmt"
import "core:math"
import "vendor:raylib"

import "../gamedata"


//= Procedures
update :: proc() {
	using gamedata

	if player.snowGather == 0 {
		//* Movement
		if raylib.IsKeyDown(raylib.KeyboardKey.W) do player.position -= {0,0.4}
		if raylib.IsKeyDown(raylib.KeyboardKey.S) do player.position += {0,0.4}
		if raylib.IsKeyDown(raylib.KeyboardKey.A) do player.position -= {0.4,0}
		if raylib.IsKeyDown(raylib.KeyboardKey.D) do player.position += {0.4,0}

		//* Straight throw snowball
		if raylib.IsMouseButtonPressed(raylib.MouseButton.LEFT) {
			if player.snowballCount > 0 {
				sb : Snowball = {
					player.position,
					player.position,
					player.pointer,
					0,
					0.75,
					true,
					false,
					{},
				}
				append(&snowballs, sb)
				player.snowballCount -= 1
			}
		}
		//* Lob snowball
		if raylib.IsMouseButtonPressed(raylib.MouseButton.RIGHT) {
			if player.snowballCount > 0 {
				sb : Snowball = {
					player.position,
					player.position,
					player.pointer,
					0,
					0.75,
					true,
					true,
					{},
				}
				append(&snowballs, sb)
				player.snowballCount -= 1
			}
		}
	}

	//* Gather snow
	if raylib.IsKeyDown(raylib.KeyboardKey.LEFT_SHIFT) &&
	   player.snowballCount != PLAYER_SNOWBALL_MAX {
		player.snowGather += 1
		
		if player.snowballCount != PLAYER_SNOWBALL_MAX &&
		   player.snowGather    >= PLAYER_SNOWGATHER_TOTAL {
			player.snowballCount += 1
			player.snowGather     = 0
		}
	}
	if raylib.IsKeyReleased(raylib.KeyboardKey.LEFT_SHIFT) {
		player.snowGather     = 0
	}

	//* Update bounding box
	player.bounds = {
		{player.position.x-4, player.position.y-4, 0},
		{player.position.x+4, player.position.y+4, 0},
	}
	
	//* Update camera and pointer position
	player.camera.target = player.position
	player.pointer = player.position + (raylib.GetMousePosition() - {SCREEN_WIDTH/2, SCREEN_HEIGHT/2})/3
}