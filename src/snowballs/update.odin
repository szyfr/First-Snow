package snowballs


//= Imports
import "core:fmt"
import "core:math"

import "vendor:raylib"

import "../gamedata"
import "../graphics/sprites"


//= Procedures
update :: proc() {
	using gamedata
	
	for i:=0;i<len(gamedata.snowballs);i+=1 {
		member := &gamedata.snowballs[i]

		result : bool = false

		if !member.lob {
			//* Rotation
			member.rotation += 4
			if member.rotation > 360 do member.rotation = 0

			//* Scale
			ratio := distance(member.position, member.target) / distance(member.starting, member.target)
			if ratio < 0.5 do member.scale -= 0.01
			if ratio > 0.5 do member.scale += 0.01

			//* Movement
			member.position, result = moveto(member.starting, member.position, member.target, 0.01)
		} else {
			//* Movement
			member.position, result = moveto(member.starting, member.position, member.target, 0.02)
		}

		if result {
			remove(i)
		}
	}
}

remove :: proc(index : int) {
	newArr : [dynamic]gamedata.Snowball = make([dynamic]gamedata.Snowball)

	for i:=0;i<len(gamedata.snowballs);i+=1 {
		if i != index do append(&newArr, gamedata.snowballs[i])
	}

	delete(gamedata.snowballs)
	gamedata.snowballs = newArr
}

distance :: proc(
	pos1,pos2 : raylib.Vector2,
) -> f32 {
	value : f32 = math.sqrt(math.pow(pos2.x - pos1.x, 2) + math.pow(pos2.y - pos1.y, 2))

	return value
}

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