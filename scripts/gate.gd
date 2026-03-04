extends Area2D

signal gate_switched(polarity: String)
signal enemy_blocked(points: int)
signal enemy_passed(points_loss: int)

@export var switch_cooldown: float = 1.0

var current_polarity: String = "A"
var can_switch: bool = true

@onready var sprite: Sprite2D = $Sprite2D
@onready var glow: Polygon2D = $PolarityGlow
@onready var cooldown_timer: Timer = $CooldownTimer
@onready var particles_a: GPUParticles2D = $ParticlesA
@onready var particles_b: GPUParticles2D = $ParticlesB

@onready var audio_switch: AudioStreamPlayer2D = $AudioSwitch
@onready var audio_block: AudioStreamPlayer2D = $AudioBlock
@onready var audio_wrong: AudioStreamPlayer2D = $AudioWrong
@onready var audio_combo: AudioStreamPlayer2D = $AudioCombo

const SCORE_BLOCK := 12
const SCORE_WRONG := -10
const SCORE_NEUTRAL := -8

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	cooldown_timer.wait_time = switch_cooldown
	cooldown_timer.timeout.connect(_on_cooldown_timer_timeout)
	_update_visual()
	gate_switched.emit(current_polarity)

func switch_gate() -> void:
	if not can_switch:
		return

	can_switch = false
	cooldown_timer.start()

	current_polarity = "B" if current_polarity == "A" else "A"
	_update_visual()
	audio_switch.play()
	gate_switched.emit(current_polarity)

func _on_cooldown_timer_timeout() -> void:
	can_switch = true

func _on_body_entered(body: Node) -> void:
	if not body.is_in_group("enemies"):
		return

	var enemy_type: String = body.type

	if enemy_type == "N":
		enemy_passed.emit(SCORE_NEUTRAL)
		audio_wrong.play()
		body.queue_free()
		return

	if enemy_type == current_polarity:
		_play_block_particles(enemy_type, body.global_position)
		audio_block.play()
		enemy_blocked.emit(SCORE_BLOCK)
		body.queue_free()
	else:
		enemy_passed.emit(SCORE_WRONG)
		audio_wrong.play()
		body.queue_free()

func _update_visual() -> void:
	if current_polarity == "A":
		sprite.modulate = Color(0.75, 0.92, 1.0)
		glow.color = Color(0.45, 0.75, 1.0, 0.58)
	else:
		sprite.modulate = Color(1.0, 0.82, 0.86)
		glow.color = Color(1.0, 0.42, 0.55, 0.58)

func _play_block_particles(enemy_type: String, pos: Vector2) -> void:
	var p := particles_a if enemy_type == "A" else particles_b
	p.global_position = pos
	p.emitting = true
