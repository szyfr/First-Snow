package enemies


//= Imports
import "core:math/rand"
import "vendor:raylib"
import "../gamedata"


//= Procedures
create :: proc(
	setposition  : raylib.Vector2 = {0,0},
	setdirection : f32            =   0,
	setspeed     : i32            = 1000,
	setbehaviour : gamedata.EnemyBehaviour,
	setlob       : bool           = false,
) -> gamedata.Enemy {
	enemy : gamedata.Enemy = {
		position    = setposition,
		rotation    = setdirection,
		behaviour   = setbehaviour,
		attackSpeed = setspeed,
		lob         = setlob,
		health      = 2,
	}
	enemy.bounds = {
		{enemy.position.x-4, enemy.position.y-4, 0},
		{enemy.position.x+4, enemy.position.y+4, 0},
	}

	#partial switch setbehaviour {
		case gamedata.EnemyBehaviour.stand:    enemy.attackSpeed = 75
		case gamedata.EnemyBehaviour.watch:    enemy.attackSpeed = i32(rand.float32_range(200,300))
		case gamedata.EnemyBehaviour.approach: enemy.attackSpeed = i32(rand.float32_range(100,200))
	}

	return enemy
}