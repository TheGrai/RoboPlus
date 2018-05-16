extends KinematicBody2D

var direction = Vector2()

var speed = 20
const ACCELERATION = 20
const MAX_SPEED = 200
var motion = Vector2()


func _physics_process(delta):
	direction = Vector2()
	
	var frictionx = false
	var frictiony = false 

	if Input.is_action_pressed("move_left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
	elif Input.is_action_pressed("move_right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
	else:
		frictionx = true
	
	if Input.is_action_pressed("move_up"):
		motion.y = max(motion.y-ACCELERATION, -MAX_SPEED)
	elif Input.is_action_pressed("move_down"):
		motion.y = min(motion.y+ACCELERATION, MAX_SPEED)
	else:
		frictiony = true
	
	if frictionx == true:
		motion.x = lerp(motion.x, 0, 0.5)
	if frictiony == true:
		motion.y = lerp(motion.y, 0, 0.5)

	move_and_slide(motion)