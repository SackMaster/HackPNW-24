extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var queList 
	var curAns
	#1
	curAns = [Answer.new("9.2", true), Answer.new("-1.2", false), Answer.new("8.2", false), Answer.new("9.8", false)]
	queList.push_back(Question.new("What is 4 + 5.2?", curAns))
		#2
	curAns = [Answer.new("their", true), Answer.new("they're", false), Answer.new("there", false)]
	queList.push_back(Question.new("It is _____ car", curAns))
	#2
	curAns = [Answer.new("their", true), Answer.new("they're", false), Answer.new("there", false)]
	queList.push_back(Question.new("What is the capitol of Washington State?", curAns))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
