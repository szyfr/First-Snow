package player


//= Imports
import "vendor:raylib"

import "../gamedata"
import "../graphics/sprites"
import "../graphics/sprites/animations"


//= Procedures
init :: proc() {
	using gamedata
	player = new(gamedata.Player)

	player.camera = {
		offset = {SCREEN_WIDTH/2, SCREEN_HEIGHT/2},
		target = {0,0},
		rotation = 0,
		zoom = 3,
	}
	player.position   = {0,0}
	player.pointer    = {0,0}
	player.charSpr    = sprites.create_sprite(
		"data/sprites/player.png",
		raylib.Vector2{8,8},
	)
	animations.add_animation(&player.charSpr, {0})
	player.pointerSpr = sprites.create_sprite(
		"data/sprites/target.png",
		raylib.Vector2{8,8},
	)
	animations.add_animation(&player.pointerSpr, {0})

	player.healthCur     = PLAYER_HEALTH_MAX
	player.snowballCount = 2
}