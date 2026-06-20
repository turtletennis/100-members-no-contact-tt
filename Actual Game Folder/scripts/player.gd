extends RigidBody2D

# TODO:
# Add collision shape for the player

# Can be part of a power up later
# What's the mechanic like? I'm not sure about the core mechanic right now
# Is player going to control the beyblade? Against who? It could be speedrun type game.

@export var starting_spin_velocity:float = 30;

@onready var spin_bar: ProgressBar = $CanvasLayer/SpinBar

var default_velocity: float = 20;
var spin_velocity: float = starting_spin_velocity
var player_died: bool = false

func _physics_process(delta: float) -> void:
	$Sprite2D.rotate(spin_velocity * delta)
	if spin_velocity > 0:
		spin_velocity -= delta
	else:
		player_died = true

	spin_bar.value = (spin_velocity / starting_spin_velocity) * 100.0

	var current_velocity = Vector2(0, 0);

	if Input.is_action_pressed("left"):
		current_velocity[0] -= default_velocity;

	if Input.is_action_pressed("right"):
		current_velocity[0] += default_velocity;

	if Input.is_action_pressed("up"):
		current_velocity[1] -= default_velocity;

	if Input.is_action_pressed("down"):
		current_velocity[1] += default_velocity;

	apply_force(current_velocity * spin_velocity) #Just proprtional to spin velocity rn, some physics guy please make cleaner logic idk how beyblades work

	pass
