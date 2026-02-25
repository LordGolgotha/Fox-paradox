extends Node

var rng = RandomNumberGenerator.new() 
var seed = hash("FoxParadox")
var passes = [] 

func generate_passes(word: String = "", quantity: int = 5):
	if word:
		seed = hash(word)
	rng.seed = seed
	for i in range(0, quantity):
		var l = []
		for j in range(0,4):
			l.append(rng.randi_range(0,5))
		passes.append(l)
	return passes
