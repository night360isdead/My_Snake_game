extends Area2D

var tile_size = 32

var grid_width = 30
var grid_height = 20    

func spawn(snake_position):
	var valid_position = false
	
	while not valid_position:
		var random_x = randi() % grid_width
		var random_y = randi() % grid_height
		
		var new_position = Vector2 ((random_x * tile_size),(random_y * tile_size))
		
		
		if new_position not in snake_position:
			position = new_position
			valid_position = true
