package snowballs


//= Imports
import "core:fmt"
import "core:math"

import "vendor:raylib"

import "../gamedata"
import "../graphics/sprites"
import "../utilities"


//= Procedures
update :: proc() {
	using gamedata
	
	for i:=0;i<len(gamedata.snowballs);i+=1 {
		member := &gamedata.snowballs[i]

		result : bool = false

		if member.lob {
			//* Rotation
			member.rotation += 4
			if member.rotation > 360 do member.rotation = 0

			//* Scale
			ratio := utilities.distance(member.position, member.target) / utilities.distance(member.starting, member.target)
			if ratio < 0.5 do member.scale -= 0.01
			if ratio > 0.5 do member.scale += 0.01

			//* Movement
			member.position, result = utilities.moveto(member.starting, member.position, member.target, 0.01)

			//* Updating bounds
			if utilities.distance(member.position, member.target) <= 2 {
				member.bounds = {
					{member.position.x-4.5,member.position.y-2.5,0},
					{member.position.x+0  ,member.position.y+3  ,0},
				}
			} else {
				member.bounds = {}
			}
		} else {
			//* Movement
			member.position, result = utilities.moveto(member.starting, member.position, member.target, 0.02)

			//* Updating bounds
			member.bounds = {
				{member.position.x-3.5,member.position.y-3.5,0},
				{member.position.x+2  ,member.position.y+2  ,0},
			}
		}

		collision_checks(i)

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