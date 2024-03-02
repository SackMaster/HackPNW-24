extends Node2D

class_name Question

var problem
var answers

func _init(problem, answers):
	self.problem = problem
	self.answers = answers
