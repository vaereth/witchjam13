extends CanvasLayer

@onready var score_label: Label = $scorelabel
@onready var wave_label: Label = $wavelabel
@onready var last_label: Label = $lastlabel
@onready var gate_a_icon: TextureRect = $Polarity/A
@onready var gate_b_icon: TextureRect = $Polarity/B
@onready var cooldown_bar: TextureProgressBar = $cooldown

var current_score: int = 0

func _ready() -> void:
	cooldown_bar.min_value = 0.0
	cooldown_bar.max_value = 1.0
	cooldown_bar.value = 0.0

func _process(_delta: float) -> void:
	var main = get_tree().current_scene
	if main == null:
		return
	var gate = main.get_node_or_null("Gate")
	if gate and not gate.can_switch:
		var t: Timer = gate.get_node("CooldownTimer")
		cooldown_bar.value = 1.0 - (t.time_left / gate.switch_cooldown)
	else:
		cooldown_bar.value = 0.0

func update_score(score: int) -> void:
	current_score = score
	score_label.text = "WYNIK: " + str(current_score)

func update_wave(wave: int) -> void:
	wave_label.text = "FALA: " + str(wave)

func update_polarity(polarity: String) -> void:
	gate_a_icon.modulate = Color(1, 1, 1, 1) if polarity == "A" else Color(0.35, 0.35, 0.35, 1)
	gate_b_icon.modulate = Color(1, 1, 1, 1) if polarity == "B" else Color(0.35, 0.35, 0.35, 1)

func update_last_event(text_value: String) -> void:
	last_label.text = text_value
