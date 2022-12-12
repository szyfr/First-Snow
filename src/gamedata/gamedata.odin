package gamedata


//= Imports
import "vendor:raylib"


//= Constants
DEBUG :: true
SCREEN_WIDTH  :: 1080
SCREEN_HEIGHT ::  720


//= Globals
player         : ^Player

snowballs      : [dynamic]Snowball

snowballSpr    : raylib.Texture2D

ui_healthbar_1 : raylib.Texture2D
ui_healthbar_2 : raylib.Texture2D
ui_snowball    : raylib.Texture2D
ui_snowgather  : raylib.Texture2D