extends RayCast

onready var Player = get_node("/root/Game/Player")

func _physics_process(_delta):
	if is_colliding():
		Player.target = get_collider()
		var pos = get_collision_point()
		$Reticule.scale.x = 0.3
		$Reticule.scale.y = 0.3
		$Reticule.scale.z = 0.3
		$Reticule.global_transform.origin = pos
	elif $Reticule.translation != Vector3(0,0,50):
		$Reticule.scale.x = 1
		$Reticule.scale.y = 1
		$Reticule.scale.z = 1
		$Reticule.translation = Vector3(0,0,50)
		Player.target = null
		
