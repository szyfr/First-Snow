package gamedata


//= Imports
import "vendor:raylib"


//= Structures
Enemy :: struct {
	position       : raylib.Vector2,
	movementTarget : raylib.Vector2,
	attackTarget   : raylib.Vector2,
	rotation       : f32,
	bounds         : raylib.BoundingBox,
	behaviour      : EnemyBehaviour,
	lob            : bool,

	attackSpeed    : i32,
	attackCooldown : i32,

	health : u32,
}

EnemyBehaviour :: enum {
	null,     // Does nothing
	stand,    // Stands still and fires in set direction
	watch,    // Stands still but fires at player
	approach, // Approaches player
}