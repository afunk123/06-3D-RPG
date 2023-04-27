extends Area

func _on_StellatedCollectable_body_entered(body):
	if body.name == "Player":
		Global.update_score(10)
		Global.star_count()
		get_node("/root/Game/Star_Sound").play()
		queue_free()

func _ready():
	$Tween1.interpolate_property(self, "translation:y", self.global_transform.origin.y, self.global_transform.origin.y-1, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween1.start()

func _on_Tween1_tween_all_completed():
	$Tween2.interpolate_property(self, "translation:y", self.global_transform.origin.y, self.global_transform.origin.y+1, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween2.start()

func _on_Tween2_tween_all_completed():
	$Tween1.interpolate_property(self, "translation:y", self.global_transform.origin.y, self.global_transform.origin.y-1, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween1.start()
