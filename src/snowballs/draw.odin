package snowballs


//= Imports
import "vendor:raylib"

import "../gamedata"
import "../graphics/sprites"


//= Procedures
draw :: proc() {
	using gamedata
	
	for i:=0;i<len(gamedata.snowballs);i+=1 {
		raylib.DrawTextureEx(
			gamedata.snowballSpr,
			gamedata.snowballs[i].position-4,
			gamedata.snowballs[i].rotation,
			gamedata.snowballs[i].scale,
			raylib.WHITE,
		)
		raylib.DrawBoundingBox(
			gamedata.snowballs[i].bounds,
			raylib.PURPLE,
		)
	}
}