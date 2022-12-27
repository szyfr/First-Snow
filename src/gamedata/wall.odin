package gamedata


//= Imports
import "vendor:raylib"


//= Structures
Wall :: struct {
	position : raylib.Vector2,
	bounds   : raylib.BoundingBox,
}