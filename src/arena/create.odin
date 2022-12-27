package arena


//= Imports
import "vendor:raylib"

import "../gamedata"
import "../enemies"


//= Procedure

create :: proc(
	image : raylib.Image,
) {
	color : raylib.Color
	for i:=0;i<int(image.width*image.height);i+=1 {
		//* Get color
		color = raylib.GetImageColor(
			image,
			i32(i % int(image.width)),
			i32(i / int(image.width)),
		)

		//* Ignore white
		if color == {255,255,255,255} do continue

		//* Walls
		if color == {0,0,0,255} {
			wall : gamedata.Wall = {
				position = {
					f32(i % int(image.width))*20,
					f32(i / int(image.width))*20,
				},
			}
			wall.bounds = {
				{wall.position.x-8, wall.position.y-8, 0},
				{wall.position.x+12, wall.position.y+12, 0},
			}
			append(&gamedata.walls,wall)
			continue
		}

		//* Player
		if color.r == 200 {
			gamedata.player.position = {
				f32(i % int(image.width))*20,
				f32(i / int(image.width))*20,
			}
			continue
		}

		//* Enemies
		enemyPosition : raylib.Vector2 = {
			f32(i % int(image.width))*20,
			f32(i / int(image.width))*20,
		}
		enemyBehaviour : gamedata.EnemyBehaviour = gamedata.EnemyBehaviour.null
		if color.r     ==  50 do enemyBehaviour = gamedata.EnemyBehaviour.stand
		if color.r     == 100 do enemyBehaviour = gamedata.EnemyBehaviour.watch
		if color.r     == 150 do enemyBehaviour = gamedata.EnemyBehaviour.approach
		enemyRotation  := f32(color.g * 5)
		enemyLob       := (color.b == 1) ? true : false
		append(
			&gamedata.enemies,
			enemies.create(
				setposition  = enemyPosition,
				setdirection = enemyRotation,
				setbehaviour = enemyBehaviour,
				setlob       = enemyLob,
			),
		)
	}
	raylib.UnloadImage(image)
}