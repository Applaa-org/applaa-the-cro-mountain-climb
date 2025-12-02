extends Area2D

@export var damage: int = 50

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		body._on_hazard_hit(damage)