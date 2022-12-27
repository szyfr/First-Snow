package arena


//= Imports
import "core:fmt"
import "core:math/rand"
import "core:strings"
import "vendor:raylib"
import "../gamedata"


//= Constants
NUMBER_OF_MAPS :: 5


//= Procedures

update :: proc() {
	//* Check for zero health
	if gamedata.player.healthCur == 0 {
		choose_new_map(true)
		return
	}
	//* check for no enemies
	if len(gamedata.enemies) == 0 {
		choose_new_map(false)
		return
	}
}

choose_new_map :: proc(
	reset : bool,
) {
	random := rand.float32_range(0,NUMBER_OF_MAPS)

	//* Clear Snowballs
	delete(gamedata.snowballs)
	gamedata.snowballs = make([dynamic]gamedata.Snowball)
	//* Clear enemies
	delete(gamedata.enemies)
	gamedata.enemies = make([dynamic]gamedata.Enemy)
	//* Clear walls
	delete(gamedata.walls)
	gamedata.walls = make([dynamic]gamedata.Wall)

	//* Reset Player
	if reset do gamedata.player.healthCur = gamedata.PLAYER_HEALTH_MAX
	gamedata.player.snowballCount         = gamedata.PLAYER_SNOWBALL_START
	if !reset do gamedata.player.rounds += 1
	else      do gamedata.player.rounds  = 1


	if gamedata.player.rounds < 5 {
		builder : strings.Builder
		str := fmt.sbprintf(&builder, "data/maps/map_%i.png", i32(random))
		create(raylib.LoadImage(strings.clone_to_cstring(str)))
	} else if gamedata.player.rounds == 5 {
		create(raylib.LoadImage("data/maps/map_6.png"))
	} else if gamedata.player.rounds == 6 {
		gamedata.win = true
	}
}