extends CharacterBody3D
var isTouching = false
var firstTouchXY = Vector2(0, 0)
const SPEED = 5


func _physics_process(delta):
    if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
        if not isTouching:
            firstTouchXY = get_viewport().get_mouse_position()
            isTouching = true
        else:
            var currentTouchXY = get_viewport().get_mouse_position()
            if currentTouchXY != firstTouchXY:
                var angle = firstTouchXY.angle_to_point(currentTouchXY)
                velocity.x = cos(angle) * SPEED
                velocity.z = sin(angle) * SPEED
            
    else:
        velocity = lerp(velocity, Vector3(0, 0, 0), 0.2)
        isTouching = false
    move_and_slide()
    $Sphere.rotate_z(-velocity.x / scale.x * 2 * delta)
    $Sphere.rotate_x(velocity.z / scale.x * 2 * delta)


func _on_enemy_body_entered(body):
    if body.name == 'Steve':
        get_tree().change_scene_to_file('res://gameover.tscn')








