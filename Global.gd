extends Node

var timer = 0
var score = 0
var health = 20
var star_numbers = 0

func _ready():
	update_score(0)

func reset():
	timer = 0
	score = 0
	health = 20
	star_numbers = 0
	update_score(0)

func _unhandled_input(_event):
	if Input.is_action_pressed("menu"):
		get_tree().quit()

func update_score(s):
	score += s
	var Score = get_node_or_null("/root/Game/UI/Score")
	if Score != null:
		Score.text = "Score: " + str(score)

func update_time():
	var t_m = floor(timer / 60.0)
	var t_s = timer % 60
	var t = "Time: %02d" % t_m
	t += ":%02d" % t_s
	get_node("/root/Game/UI/Time").text = t
	
func decrease_health(h):
	health -= h
	get_node("/root/Game/UI/Health").text = "Health: 20 / " + str(health)
	if health <= 0:
		get_tree().change_scene("res://UI/Lose_Screen")

func star_count():
	if get_node("/root/Game/Star_Container").is_visible():
		var star = get_node("/root/Game/Star_Container")
		var star_number = star.get_child_count()
		if star_number == 10:
			star_numbers += 1
			get_node("/root/Game/UI/Stars").text = "Stars: " + str(star_numbers) + " " + "/" + " " + "10"
		elif star_number == 9:
			star_numbers += 1
			get_node("/root/Game/UI/Stars").text = "Stars: " + str(star_numbers) + " " + "/" + " " + "10"
		elif star_number == 8:
			star_numbers += 1
			get_node("/root/Game/UI/Stars").text = "Stars: " + str(star_numbers) + " " + "/" + " " + "10"
		elif star_number == 7:
			star_numbers += 1
			get_node("/root/Game/UI/Stars").text = "Stars: " + str(star_numbers) + " " + "/" + " " + "10"
		elif star_number == 6:
			star_numbers += 1
			get_node("/root/Game/UI/Stars").text = "Stars: " + str(star_numbers) + " " + "/" + " " + "10"
		elif star_number == 5:
			star_numbers += 1
			get_node("/root/Game/UI/Stars").text = "Stars: " + str(star_numbers) + " " + "/" + " " + "10"
		elif star_number == 4:
			star_numbers += 1
			get_node("/root/Game/UI/Stars").text = "Stars: " + str(star_numbers) + " " + "/" + " " + "10"
		elif star_number == 3:
			star_numbers += 1
			get_node("/root/Game/UI/Stars").text = "Stars: " + str(star_numbers) + " " + "/" + " " + "10"
		elif star_number == 2:
			star_numbers += 1
			get_node("/root/Game/UI/Stars").text = "Stars: " + str(star_numbers) + " " + "/" + " " + "10"
		elif star_number == 1:
			star_numbers += 1
			get_node("/root/Game/UI/Stars").text = "Stars: " + str(star_numbers) + " " + "/" + " " + "10"
		elif star_number == 0:
			star_numbers += 1
			get_node("/root/Game/UI/Stars").text = "Stars: " + str(star_numbers) + " " + "/" + " " + "10"
		
