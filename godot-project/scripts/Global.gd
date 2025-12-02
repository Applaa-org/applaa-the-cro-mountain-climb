extends Node

var score: int = 0
var player_health: int = 100

func add_score(points: int):
	score += points

func reset_score():
	score = 0

func take_damage(damage: int):
	player_health -= damage
	if player_health <= 0:
		player_health = 0
		get_tree().change_scene_to_file("res://scenes/DefeatScreen.tscn")

func reset_health():
	player_health = 100