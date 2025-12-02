extends Control

func _ready():
	$ScoreLabel.text = "Score: %d" % Global.score
	$RestartButton.pressed.connect(_on_restart_pressed)
	$MainMenuButton.pressed.connect(_on_main_menu_pressed)
	$CloseButton.pressed.connect(_on_close_pressed)

func _on_restart_pressed():
	Global.reset_score()
	Global.reset_health()
	get_tree().change_scene_to_file("res://scenes/Main.tscn")

func _on_main_menu_pressed():
	Global.reset_score()
	Global.reset_health()
	get_tree().change_scene_to_file("res://scenes/StartScreen.tscn")

func _on_close_pressed():
	get_tree().quit()