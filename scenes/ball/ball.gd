extends CharacterBody2D


@onready var sound = $Sound
@onready var score_sound = $ScoreSound
@onready var sprite_2d = $Sprite2D


const speed_inc: int = 20
const barrier = ["barrier_down", "barrier_up"]
const paddle = ["paddle_left", "paddle_right"]
const perete = ["barrier_down", "barrier_up", "paddle_left", "paddle_right"]

var direction = [-1, 1]

func _ready():
	velocity = Vector2(direction.pick_random() * GameManager.BALL_SPEED,
		direction.pick_random() * GameManager.BALL_SPEED)
	

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision != null:
		check_collision(collision)


func check_collision(collision):
	var body = collision.get_collider()
		
	if body.name in paddle:
		velocity = velocity.normalized() * (velocity.length() + speed_inc)
		sound.play()
	
	if body.name in perete:
		velocity = velocity.bounce(collision.get_normal())
	
	if body.name == "barrier_score_left":
		score_sound.play()
		ball_scored(body.name)
		
	if body.name == "barrier_score_right":
		score_sound.play()
		ball_scored(body.name)
		

func ball_scored(name: String):
	set_physics_process(false)
	SignalManager.emit_signal("scored", name)


