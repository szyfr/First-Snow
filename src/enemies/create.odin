package enemies


//= Imports
import "../gamedata"


//= Procedures
create :: proc() -> gamedata.Enemy {
	enemy : gamedata.Enemy = {
		position = {10,0},
		health = 2,
	}
	enemy.bounds = {
		{enemy.position.x-4, enemy.position.y-4, 0},
		{enemy.position.x+4, enemy.position.y+4, 0},
	}

	return enemy
}