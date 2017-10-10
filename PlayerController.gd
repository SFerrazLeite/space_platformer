extends RigidBody2D

const JumpSpeed = 800
const MoveSpeed = 300

var player
var feet_left
var feet_right
var death_line

var desired_speed = 0

func _ready():
	set_process(true)
	set_contact_monitor(true)
	set_max_contacts_reported(100)
	feet_left = get_node("FeetLeft")
	feet_right = get_node("FeetRight")
	feet_left.add_exception(self)
	feet_right.add_exception(self)
	death_line = get_parent().get_node("DeathLine")

func _process(delta):
	if is_feet_colliding() and Input.is_action_pressed("ui_up"):
		set_linear_velocity(Vector2(0,-JumpSpeed))

	var move_speed = 0
	if Input.is_action_pressed("ui_right"):
		if is_feet_colliding():
			move_speed = MoveSpeed
	if Input.is_action_pressed("ui_left"):
		if is_feet_colliding():
			move_speed = -MoveSpeed
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
		set_axis_velocity(Vector2(move_speed, 0))
	else:
		desired_speed = get_linear_velocity().x
		
	if is_feet_colliding():
		print(str(delta) + " colliding")
	
	if death_line in get_colliding_bodies():
		get_tree().reload_current_scene()
		
func is_feet_colliding():
	return feet_left.is_colliding() or feet_right.is_colliding()