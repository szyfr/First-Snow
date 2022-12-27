package gamedata


//= Imports
import "vendor:raylib"


//= Constants
DEBUG :: false
SCREEN_WIDTH  :: 1280
SCREEN_HEIGHT ::  720


//= Globals
player         : ^Player

snowballs      : [dynamic]Snowball
snowballSpr    : raylib.Texture2D

enemies        : [dynamic]Enemy
enemyTexture   : raylib.Texture2D

walls          : [dynamic]Wall
wallTexture    : raylib.Texture2D

ui_healthbar_1 : raylib.Texture2D
ui_healthbar_2 : raylib.Texture2D
ui_snowball    : raylib.Texture2D
ui_snowgather  : raylib.Texture2D

win : bool