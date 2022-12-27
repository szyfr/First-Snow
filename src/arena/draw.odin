package arena


//= Imports
import "core:fmt"
import "vendor:raylib"
import "../gamedata"


//= Procedures

draw :: proc() {
	for i:=0;i<len(gamedata.walls);i+=1 {
		raylib.DrawTextureEx(
			gamedata.wallTexture,
			gamedata.walls[i].position-{f32(gamedata.wallTexture.width),f32(gamedata.wallTexture.height)},
			0,
			2.5,
			raylib.WHITE,
		)
	//	raylib.DrawBoundingBox(
	//		gamedata.walls[i].bounds,
	//		raylib.PURPLE,
	//	)
	}
}