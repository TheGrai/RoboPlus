extends Node

var vt		## Virtual Terminal
var cv		## Camera View

var INTRODUCTORY_QUOTES = [
	"Hey!",
	"Who stole my ride?",
	"You better add up your skills!",
	"Is anyone there?",
	"I don't know about this.",
	"How do I know I can trust you?",
	"You look like you could'nt even count."
]

var NAMES = [
	"Jim",
	"Brad",
	"XRoosterBoy_31",
	"FireStorm",
	"Thaddeus",
	"Jack",
	"Beans",
	"1337hax0r",
	"EggBrown",
	"TwoologhtSpookle",
	"Fantastic_Bob",
	"The_Greatest_Enemy",
	"?",
	"ADDITION_SUBTRACTION",
	"DIVISIBLE_BY_ZERO",
	"SquishyPig",
	"CuttleFish",
	"Joan",
	"Dyllan_Pickle",
	"ExcitingBradtastic",
	"Bogus",
	"RoosterTooth",
	"Steak",
	"Bart",
	"Phillip",
	"Arnold",
	"Edna",
	"GrandmaJoe",
	"HipsterTadpole",
	"Yeee",
	"YOUR_BEST_DREAM",
	"YOUR_WORST_NIGHTMARE"
]


## This class is handles virtual terminals. It places a virtual terminal at 20, 20
## and provides useful features to interact with the player.
## Author: Isaac Leadbetter

class VTERM:
	var logged = []
	var errors = []
	var clabel = Label.new()
	var colourBG = ColorRect.new()
	var ttextlines = ["Console is ready."]
	func _init(vnode):
		colourBG.color = Color(0, 0, 0, 0.4)
		colourBG.set_position(Vector2(15,15))
		colourBG.set_size(Vector2(100, 50))
		vnode.call_deferred("add_child", colourBG)
		vnode.call_deferred("add_child", clabel)
		clabel.set_name("TTYLabel")
		clabel.set_position(Vector2(20,20))
		updateConsoleText()
	func printf(string):
		print(string)
		ttextlines.append(string)
		updateConsoleText()
	func print(string):
		ttextlines.append(string)
		updateConsoleText()
	func log(string):
		ttextlines.append("[ LOG     ] " + string)
		logged.append(string)
		updateConsoleText()
	func err(string):
		ttextlines.append("[ ERROR   ] " + string)
		errors.append(string)
		updateConsoleText()
	func updateConsoleText():
		clabel.set_text("")
		for msg in range(ttextlines.size()):
			if msg >= ttextlines.size() - 4:
				clabel.set_text(clabel.get_text() + ttextlines[msg])
				if msg != ttextlines.size() - 1:
					clabel.set_text(clabel.get_text() + "\n")
		colourBG.set_size(Vector2(clabel.get_size().x + 10, clabel.get_size().y + 10))

## This class handles Camera movement
## Author: Isaac Leadbetter

class CameraView:
	var CameraV = Camera2D.new();
	var Position = [0, 0]
	func _init(vnode, ix, iy):
		vnode.call_deferred("add_child", CameraV);
		CameraV.make_current()
		Position[0] = ix
		Position[1] = iy
	func translate(x, y):
		CameraV.translate(Vector2(x, y))
	func setZoom(zx, zy):
		CameraV.zoom = Vector2(zx, zy)
	func smoothTranslate(x, y, spd):		## I don't expect this to work.
		CameraV.smoothing_enabled = true
		CameraV.smoothing_speed = spd
		CameraV.translate(Vector2(x, y, spd))
		CameraV.smoothing_enabled = false

var i = 0
func _console_test():
	i += 1
	vt.printf("Console message " + str(i))
	cv.translate(10,20)

## Executes when scene is loaded.

func _ready():
	vt = VTERM.new($HUD)