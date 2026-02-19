extends Node


var point = 0

@onready var score: Label = $score


func add_score():
	point += 1
	
	
	score.text = "Score:\n" + str(point) + " points"
	print(point)
