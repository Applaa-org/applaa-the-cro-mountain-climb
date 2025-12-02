extends Area2D

@export var damage: int = 50
@export var speed: float = 50.0  # Speed of movement, e.g., falling

func _ready():
	body_entered.connect(_on_body_entered)

func _process(delta: float):
	# Make the hazard move down (falling landslide effect)
	position.y += speed * delta
	# Optional: Reset or remove when off-screen
	if position.y > 650:
		position.y = -50  # Reset to top for continuous falling

func _on_body_entered(body):
	if body.name == "Player":
		body._on_hazard_hit(damage)