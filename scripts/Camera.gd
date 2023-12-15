extends Camera3D
var destination = Vector3(0, 0, 0)

func _physics_process(delta):
    destination = $'../Steve'.position + Vector3(0, 5, 5)
    position = lerp(position, destination, 0.1)
    
