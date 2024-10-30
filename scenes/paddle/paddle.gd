extends CharacterBody2D


@onready var sprite_2d = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(0.0, 0.0)


func move_up(delta):
	velocity.y = -GameManager.PADDLE_SPEED * delta


func move_down(delta):
	velocity.y = GameManager.PADDLE_SPEED * delta


func _physics_process(delta):
	var screen_size = get_viewport_rect().size
	position.y = clamp(position.y, 0, screen_size.y - sprite_2d.texture.get_size().y)
	move_and_slide()

