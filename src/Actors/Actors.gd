extends KinematicBody2D
class_name Actor

const FLOOR_NORMAL : = Vector2.UP

var _velocity: = Vector2.ZERO
export var speed = Vector2(300.0,1000.0)
export var gravity: = 4000.0

func _physics_process(delta : float) -> void:
	 _velocity.y += gravity * delta
	 

