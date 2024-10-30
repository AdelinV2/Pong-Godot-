extends Node2D

@onready var timer = $Timer
@onready var score = $Score
@onready var paddle_left = $paddle_left
@onready var paddle_right = $paddle_right



func _ready():
	SignalManager.scored.connect(_restart)


func _process(delta):
	pass


func _physics_process(delta):
	move_paddle(delta)
	

func move_paddle(delta):
	if Input.is_action_pressed("w"):
		paddle_left.move_up(delta)
		
	elif Input.is_action_pressed("s"):
		paddle_left.move_down(delta)
	
	else:
		paddle_left.velocity.y = 0
	
	if Input.is_action_pressed("up"):
		paddle_right.move_up(delta)
		
	elif Input.is_action_pressed("down"):
		paddle_right.move_down(delta)
	
	else:
		paddle_right.velocity.y = 0
		
	paddle_left.move_and_slide()
	paddle_right.move_and_slide()
	

func _restart(name):
	score.scored_label.show()
	timer.start()


func _on_timer_timeout():
	get_tree().reload_current_scene()
	score.scored_label.hide()
