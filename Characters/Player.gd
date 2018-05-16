extends KinematicBody2D

var direction = Vector2()

var speed = 20
const ACCELERATION = 20
const MAX_SPEED = 200
var motion = Vector2()


func _physics_process(delta):
	direction = Vector2()

	if Input.is_action_pressed("move_left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
	elif Input.is_action_pressed("move_right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
	else:
		motion.x = 0
	if Input.is_action_pressed("move_up"):
		motion.y = max(motion.y-ACCELERATION, -MAX_SPEED)
	elif Input.is_action_pressed("move_down"):
		motion.y = min(motion.y+ACCELERATION, MAX_SPEED)
	else:
		motion.y = 0

	

#	if direction != Vector2():
#		speed = MAX_SPEED
#	else:
#		speed = 0


	move_and_slide(motion)