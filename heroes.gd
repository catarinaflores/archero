extends Control

@onready var skill: Label = %Skill
@onready var name_char: Label = %Name
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var level_text: Label = %LevelText


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animate_char_name()
	animate_skill()
	animate_level()

func animate_level() -> void:
	var tween_progress = create_tween().set_ease(Tween.EASE_IN_OUT). \
		set_trans(Tween.TRANS_CUBIC)
	progress_bar.modulate.a = 0.0
	tween_progress.tween_property(progress_bar, "modulate:a", 1.0, 2.5)
	var level_text_tween = create_tween().set_ease(Tween.EASE_IN_OUT). \
		set_trans(Tween.TRANS_LINEAR)
	level_text_tween.tween_property(level_text, "visible_ratio", 1.0, 2.0). \
		from(0.0)

func animate_char_name() -> void:
	name_char.visible_ratio = 0.0
	var name_tween = create_tween().set_ease(Tween.EASE_IN_OUT). \
		set_trans(Tween.TRANS_LINEAR)
	name_tween.tween_property(name_char, "visible_ratio", 1.0, 1.0).from(0.0). \
		set_delay(0.5)

func animate_skill() -> void:
	skill.visible_ratio = 0.0
	var skill_tween = create_tween().set_ease(Tween.EASE_IN_OUT). \
		set_trans(Tween.TRANS_LINEAR)
	skill_tween.tween_property(skill, "visible_ratio", 1.0, 1.0).from(0.0).set_delay(0.5)

