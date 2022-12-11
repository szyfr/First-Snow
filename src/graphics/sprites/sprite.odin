package sprites


//= Imports
import "vendor:raylib"


//= Structures
Sprite :: struct {
	using texture : raylib.Texture2D,
	color         : raylib.Color,
	dim           : raylib.Vector2,
	flipped       : bool,
	rotation      : f32,

	spriteCount   : i32,

	//* Animation variables
	currentAnimation : u32,
	animationList    : [dynamic]Animation,
}