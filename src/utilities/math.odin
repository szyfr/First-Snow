package utilities


//= Imports
import "core:math"
import "vendor:raylib"


//= Procedures

//* Calculate distance between two Vector2s
distance :: proc(
	pos1,pos2 : raylib.Vector2,
) -> f32 {
	value : f32 = math.sqrt(math.pow(pos2.x - pos1.x, 2) + math.pow(pos2.y - pos1.y, 2))

	return value
}

//* Lerp between two points. Returns true when arriving.
moveto :: proc(
	starting, position, target : raylib.Vector2,
	speed : f32 = 0.2,
) -> (raylib.Vector2, bool) {
	value  : raylib.Vector2 = position
	result : bool           = false

	value = position + (speed * (target - starting))

	if  value.x < target.x + 0.5 &&
		value.x > target.x - 0.5 &&
		value.y < target.y + 0.5 &&
		value.y > target.y - 0.5 {
			result = true
	}

	return value, result
}