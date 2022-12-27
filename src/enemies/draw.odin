package enemies


//= Imports
import "vendor:raylib"

import "../gamedata"


//= Procedures
draw :: proc() {
	for i:=0;i<len(gamedata.enemies);i+=1 {
		enemy := &gamedata.enemies[i]

		raylib.DrawTexturePro(
			gamedata.enemyTexture,
			{
				8, 0,
				8, 8,
			},
			{
				enemy.position.x, enemy.position.y,
				8, 8,
			},
			{4,4},
			0,
			raylib.WHITE,
		)
	//	raylib.DrawBoundingBox(
	//		enemy.bounds,
	//		raylib.PURPLE,
	//	)
	}
}