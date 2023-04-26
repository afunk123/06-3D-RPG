extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = [
	"So you actually made it here...? (Press E to continue)"
	, "You are the last of the fighters"
	, "We were all such fools to believe we could win"
	, "After the base fell, the Schrödinger Star cracked into 10 pieces and scattered."
	, "Those 10 pieces are just fallen stars by themselves, ready to burn out"
	, "But maybe if you collected all 10 you might be able to stop the calamity from ever happening!"
	, "Please, you must collect all 10 pieces before the monsters make their last crusade"
	, "Hurry they have already started tp appear!"
	, "Collect the 10 pieces of the Schrödinger Star and then defeat the enemey drone!"
]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")

func _on_Area_body_entered(body):
	if body.name == "Player":
		Dialogue.start_dialogue(dialogue)

func _on_Area_body_exited(body):
	if body.name == "Player":
		Dialogue.hide_dialogue()

func finished():
	get_node("/root/Game/Star_Container").show()
	Global.timer = 600
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()
