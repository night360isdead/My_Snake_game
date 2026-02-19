extends CharacterBody2D



var direction = Vector2.RIGHT
var tile_size = 32

var snake_position = []
var snake_segment = []

var segment_number = 2


@export var snakebodyscene: PackedScene


@export var applescene : PackedScene
var apple


@onready var game_manager: Node = %GameManager











#the starting growth function
func growth ():
	for i in range(segment_number):
		
		
		var segment = snakebodyscene.instantiate()
		
		%bodyparts.add_child(segment)
		
		
		
		
		var new_position = position - Vector2((i + 1) *     tile_size, 0)
		
		
		 
		snake_position.append(new_position)
		snake_segment.append(segment)
		segment.position = new_position





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	
	#apple spawning
	apple = applescene.instantiate()
	
	%AppleSpawning.add_child(apple)
	
	apple.spawn(snake_position)
	
	
	
	
	
	
	
	snake_position.append(position)
	
	snake_segment.append(self)
	
	
	
	
	
	#create two extra body parts
	growth()
	
	
	





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	
	#Movement controls and input
	if Input.is_action_just_pressed("up") and direction != Vector2.DOWN:
		direction = Vector2.UP
	elif Input.is_action_just_pressed("down")and direction != Vector2.UP:
		direction = Vector2.DOWN
	elif Input.is_action_just_pressed("right")and direction != Vector2.LEFT:
		direction = Vector2.RIGHT
	elif Input.is_action_just_pressed("left")and direction != Vector2.RIGHT:
		direction = Vector2.LEFT
	
	
	
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()

func _on_timer_timeout() -> void:
	
	
	
	
	
	
	
	
	#apple eating stuff
	
	if apple.position == snake_position[0]:
		
		apple.spawn(snake_position)
		segment_number += 1
		
		var segment = snakebodyscene.instantiate()
		
		%bodyparts.add_child(segment)
		
		var new_position = position - Vector2((segment_number + 1) *     tile_size, 0)
		 
		snake_position.append(new_position)
		snake_segment.append(segment)
		segment.position = new_position
		
		
		#adding score
		game_manager.add_score()
		
	
	
	
	
	
	
	
	
	#calculates the head position and stores it in the array. move_and_collide moves the snake
	var new_head_position = snake_position[0] +  direction * tile_size
	var collision = move_and_collide(direction * tile_size)
	
	
	
	snake_position.insert(0, new_head_position)
	
	snake_position.pop_back()
	
	#body movement
	
	for i in range(snake_position.size()):
		snake_segment[i].position = snake_position[i]
	
	
	if collision:
		print("YOU ARE DEAD")
		$Timer.stop()
		
		get_tree().change_scene_to_file("res://scene/death_screen.tscn")
	
	
	


	
	
	
	
