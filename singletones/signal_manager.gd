extends Node


signal scored(name)


func emit_scored(name):
	emit_signal("scored", name)
