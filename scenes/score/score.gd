extends Control


@onready var left_score = $MC/VBoxContainer/HB/LeftScore
@onready var right_score = $MC/VBoxContainer/HB/RightScore
@onready var scored_label = $MC/VBoxContainer/ScoredLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.scored.connect(_score_update)
	left_score.text = str(ScoreManager.score_left)
	right_score.text = str(ScoreManager.score_right)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _score_update(name):
	if name == "barrier_score_right":
		ScoreManager.score_left += 1
		left_score.text = str(ScoreManager.score_left)
		scored_label.text = "left player scored!"
		scored_label.show()
	
	else:
		ScoreManager.score_right += 1
		right_score.text = str(ScoreManager.score_right)
		scored_label.text = "right player scored!"
		scored_label.show()
