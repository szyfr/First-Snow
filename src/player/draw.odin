package player


//= Imports
import "vendor:raylib"

import "../gamedata"
import "../graphics/sprites"


//= Procedures
draw :: proc() {
	using gamedata
	
	sprites.draw_sprite(&player.charSpr, player.position)
	sprites.draw_sprite(&player.pointerSpr, player.pointer)
}