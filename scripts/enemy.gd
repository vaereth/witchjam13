extends CharacterBody2D

const TEX_A: Texture2D = preload("res://assets/images/Bez tytułu2.png")
const TEX_B: Texture2D = preload("res://assets/images/Bez tytułu.png")

var type: String = "A"
var speed: float = 120.0

@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	add_to_group("enemies")

	match type:
		"A":
			sprite.texture = TEX_A
			sprite.modulate = Color(1, 1, 1, 1)
			sprite.scale = Vector2(0.5, 0.5)
		"B":
			sprite.texture = TEX_B
			sprite.modulate = Color(1, 1, 1, 1)
			sprite.scale = Vector2(0.5, 0.5)
		"N":
			# Na razie neutralny to wariant B (mniejszy i jaśniejszy),
			# dopóki nie dodamy trzeciego sprite'a z pliku.
			sprite.texture = TEX_B
			sprite.modulate = Color(0.9, 0.9, 1.0, 1)
			sprite.scale = Vector2(0.42, 0.42)

func _physics_process(_delta: float) -> void:
	velocity = Vector2.LEFT * speed
	move_and_slide()

	if global_position.x < -120:
		queue_free()
