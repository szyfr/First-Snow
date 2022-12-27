package snowballs


//= Imports
import "vendor:raylib"

import "../gamedata"


//= Procedures
collision_checks :: proc(
	index : int,
) {
	member := &gamedata.snowballs[index]

	//* Check for player collision
	if !member.player {
		if raylib.CheckCollisionBoxes(member.bounds, gamedata.player.bounds) {
			remove(index)
			gamedata.player.healthCur -= 1
		}
	}

	//* Check for wall collisions
	for i:=0;i<len(gamedata.walls);i+=1 {
		if raylib.CheckCollisionBoxes(member.bounds, gamedata.walls[i].bounds) {
			remove(index)
		}
	}

	//* Check for enemy collisions
	if member.player {
		for i:=0;i<len(gamedata.enemies);i+=1 {
			if raylib.CheckCollisionBoxes(member.bounds, gamedata.enemies[i].bounds) {
				remove(index)
				gamedata.enemies[i].health -= 1
			}
		}
	}
}