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
		newPosition  : raylib.Vector2     = player.position
		newCollision : raylib.BoundingBox = {}
		result       : bool               = true
		if raylib.IsKeyDown(raylib.KeyboardKey.W) do newPosition -= {0,0.8}
		if raylib.IsKeyDown(raylib.KeyboardKey.S) do newPosition += {0,0.8}
		if raylib.IsKeyDown(raylib.KeyboardKey.A) do newPosition -= {0.8,0}
		if raylib.IsKeyDown(raylib.KeyboardKey.D) do newPosition += {0.8,0}
		newCollision = {
			{newPosition.x-4, newPosition.y-4, 0},
			{newPosition.x+4, newPosition.y+4, 0},
		}

		for i:=0;i<len(gamedata.walls);i+=1 {
			if raylib.CheckCollisionBoxes(newCollision, gamedata.walls[i].bounds) do result = false
		}

		if result do player.position = newPosition

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