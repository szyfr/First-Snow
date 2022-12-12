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

	//* Check for enemy collisions
}