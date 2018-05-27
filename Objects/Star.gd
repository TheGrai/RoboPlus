extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#func _ready():
#
#	# Called every time the node is added to the scene.
#	# Initialization here
#	pass

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	if bodies != []:
			print(bodies)
	for body in bodies:
		if body.name == "Player":
			print("MATH")