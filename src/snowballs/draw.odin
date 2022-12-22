package snowballs


//= Imports
import "vendor:raylib"

import "../gamedata"
import "../graphics/sprites"


//= Procedures
draw :: proc() {
	using gamedata
	
	for i:=0;i<len(gamedata.snowballs);i+=1 {
		//raylib.DrawTextureEx(
		//	gamedata.snowballSpr,
		//	gamedata.snowballs[i].position-4,
		//	gamedata.snowballs[i].rotation,
		//	gamedata.snowballs[i].scale,
		//	raylib.WHITE,
		//)
		raylib.DrawTexturePro(
			gamedata.snowballSpr,
			{
				0, 0,
				8, 8,
			},
			{
				gamedata.snowballs[i].position.x, gamedata.snowballs[i].position.y,
				8 * gamedata.snowballs[i].scale, 8 * gamedata.snowballs[i].scale,
			},
			{4,4},
			gamedata.snowballs[i].rotation,
			raylib.WHITE,
		)
		raylib.DrawBoundingBox(
			gamedata.snowballs[i].bounds,
			raylib.PURPLE,
		)
	}
}