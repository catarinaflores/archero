extends Control

@onready var skill: Label = %Skill
@onready var name_char: Label = %Name
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var level_text: Label = %LevelText
@onready var select_button: Button = %SelectButton
@onready var upgrade_button: Button = %UpgradeButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animate_char_name()
	animate_skill()
	animate_level()
	animate_buttons()

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

func animate_buttons() -> void:
	var button_tween := create_tween().set_ease(Tween.EASE_IN_OUT). \
		set_trans(Tween.TRANS_CUBIC)
	button_tween.set_loops()
	
	button_tween.tween_property(select_button, "position:y", select_button.position.y - 10, 0.5)
	button_tween.tween_property(select_button, "position:y", select_button.position.y, 0.2)
	
	button_tween.tween_property(upgrade_button, "position:y", upgrade_button.position.y - 10, 0.5)
	button_tween.tween_property(upgrade_button, "position:y", upgrade_button.position.y, 0.2)
