package enemies


//= Imports
import "vendor:raylib"

import "../gamedata"
import "../utilities"


//= Procedures
update :: proc() {
	for i:=0;i<len(gamedata.enemies);i+=1 {
		enemy := &gamedata.enemies[i]

		//* Update bounds
		enemy.bounds = {
			{enemy.position.x-4, enemy.position.y-4, 0},
			{enemy.position.x+4, enemy.position.y+4, 0},
		}

		//* Check health
		if enemy.health <= 0 do remove(i)

		distance := utilities.distance(
			enemy.position,
			gamedata.player.position,
		)

		#partial switch enemy.behaviour {
			case gamedata.EnemyBehaviour.stand:
				if enemy.attackCooldown <= 0 {
					sb : gamedata.Snowball = {
						enemy.position,
						enemy.position,
						utilities.rotate_point(
							{enemy.position.x - 100, enemy.position.y},
							enemy.position,
							enemy.rotation,
						),
						0,
						0.75,
						false,
						enemy.lob,
						{},
					}
					append(&gamedata.snowballs, sb)
					enemy.attackCooldown = enemy.attackSpeed
				} else do enemy.attackCooldown -= 1
			case gamedata.EnemyBehaviour.watch:
				if distance < 240 && enemy.attackCooldown <= 0 {
					sb : gamedata.Snowball = {
						enemy.position,
						enemy.position,
						gamedata.player.position,
						0,
						0.75,
						false,
						enemy.lob,
						{},
					}
					append(&gamedata.snowballs, sb)
					enemy.attackCooldown = enemy.attackSpeed
				} else do enemy.attackCooldown -= 1
			case gamedata.EnemyBehaviour.approach:
				if distance >= 60 && distance < 120 {
					result : bool
					enemy.position, result = utilities.moveto(
						enemy.position,
						enemy.position,
						gamedata.player.position,
						0.01,
					)
				}
				if distance < 60 && enemy.attackCooldown <= 0 {
					sb : gamedata.Snowball = {
						enemy.position,
						enemy.position,
						gamedata.player.position,
						0,
						0.75,
						false,
						enemy.lob,
						{},
					}
					append(&gamedata.snowballs, sb)
					enemy.attackCooldown = enemy.attackSpeed
				} else do enemy.attackCooldown -= 1
		}
	}
}

remove :: proc(
	index : int,
) {
	newArr : [dynamic]gamedata.Enemy = make([dynamic]gamedata.Enemy)

	for i:=0;i<len(gamedata.enemies);i+=1 {
		if i != index do append(&newArr, gamedata.enemies[i])
	}

	delete(gamedata.enemies)
	gamedata.enemies = newArr
}