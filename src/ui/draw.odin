package ui


//= Imports
import "vendor:raylib"

import "../gamedata"


//= Procedures
draw :: proc() {
	//* Health bar
	raylib.DrawTexturePro(
		gamedata.ui_healthbar_1,
		{
			0, 0,
			f32(gamedata.ui_healthbar_1.width),
			f32(gamedata.ui_healthbar_1.height),
		},
		{
			5, 5,
			f32(gamedata.ui_healthbar_1.width)*2,
			f32(gamedata.ui_healthbar_1.height)*2,
		},
		{0,0},
		0,
		raylib.BLACK,
	)

	ratio := f32(gamedata.player.healthCur) / f32(gamedata.PLAYER_HEALTH_MAX)
	col   : raylib.Color = {99,206,8,255}
	if ratio < .75 do col = {255,255,58,255}
	if ratio < .50 do col = {247,82,49,255}

	raylib.DrawTexturePro(
		gamedata.ui_healthbar_2,
		{
			0, 0,
			f32(gamedata.ui_healthbar_2.width)*ratio,
			f32(gamedata.ui_healthbar_2.height),
		},
		{
			5, 5,
			(f32(gamedata.ui_healthbar_2.width)*2)*ratio,
			f32(gamedata.ui_healthbar_2.height)*2,
		},
		{0,0},
		0,
		col,
	)

	//* Snowballs
	pos := raylib.Vector2{10,40}
	for i:=0;i<int(gamedata.player.snowballCount);i+=1 {
		raylib.DrawTexturePro(
			gamedata.ui_snowball,
			{
				0, 0,
				f32(gamedata.ui_snowball.width),
				f32(gamedata.ui_snowball.height),
			},
			{
				pos.x, pos.y,
				f32(gamedata.ui_snowball.width)*2,
				f32(gamedata.ui_snowball.height)*2,
			},
			{0,0},
			0,
			raylib.WHITE,
		)
		pos += {f32((gamedata.ui_snowball.width*2)+5),0}
	}
}