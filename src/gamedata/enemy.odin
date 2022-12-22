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

	health : u32,
}