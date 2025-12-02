extends CharacterBody2D

const SPEED: float = 200.0
const JUMP_VELOCITY: float = -400.0
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var health_label = $"../CanvasLayer/HealthLabel"
@onready var score_label = $"../CanvasLayer/ScoreLabel"

func _ready():
	update_ui()

func _physics_process(delta: float):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_collectible_collected():
	Global.add_score(10)
	update_ui()

func _on_hazard_hit(damage: int):
	Global.take_damage(damage)
	update_ui()

func update_ui():
	health_label.text = "Health: %d" % Global.player_health
	score_label.text = "Score: %d" % Global.score