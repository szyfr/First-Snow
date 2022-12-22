package enemies


//= Imports
import "vendor:raylib"

import "../gamedata"


//= Procedures
update :: proc() {
	for i:=0;i<len(gamedata.enemies);i+=1 {
		//* Check health
		if gamedata.enemies[i].health <= 0 do remove(i)

		//* Check distance to player

		//* If can see player, move to range
	}
}

remove :: proc(
	index : int,
) {
	newArr : [dynamic]gamedata.Enemy = make([dynamic]gamedata.Enemy)

	for i:=0;i<len(gamedata.enemies);i+=1 {
		if i != index do append(&newArr, gamedata.enemies[i])
	}

	delete(gamedata.enemies)
	gamedata.enemies = newArr
}