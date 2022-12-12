package player


//= Imports
import "vendor:raylib"

import "../gamedata"
import "../graphics/sprites"


//= Procedures
draw :: proc() {
	using gamedata
	
	//* Player and pointer
	sprites.draw_sprite(&player.charSpr, player.position)
	sprites.draw_sprite(&player.pointerSpr, player.pointer)

	//* Snow gather bar
	ratio := f32(player.snowGather) / f32(PLAYER_SNOWGATHER_TOTAL)
	raylib.DrawTexturePro(
		gamedata.ui_snowgather,
		{
			0, 0,
			f32(gamedata.ui_snowgather.width)*ratio,
			f32(gamedata.ui_snowgather.height),
		},
		{
			player.position.x-4, player.position.y-12,
			(f32(gamedata.ui_snowgather.width))*ratio,
			f32(gamedata.ui_snowgather.height),
		},
		{0,0},
		0,
		raylib.GREEN,
	)
	raylib.DrawBoundingBox(
		player.bounds,
		raylib.PURPLE,
	)
}