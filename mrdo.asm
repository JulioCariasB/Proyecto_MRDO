start:
    push 145 ;frutas
    push 10
    push 10
    call show_mr_do
    add esp, 12
    #stop
 
; dword [ebp+ 8] => Row
; dword [ebp+12] => Colum
show_mr_do:
    push ebp
    mov ebp, esp
    sub esp, 4 

    mov ecx, 0xb800
for_field:
    cmp ecx, 0xcabf
    je end_for_field
    mov dword [ecx], 0xa22ea22e
    inc ecx
    jmp for_field

end_for_field:
    mov ecx, 2
    mov edx, 2

fruit_outer1:
    cmp ecx, 8
    jge end_fruit_outer1
fruit_inner1:
    cmp edx, 8
    je end_fruit_inner1
    mov esi, ecx ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800
    
    mov ebx, 0xa411a411 ;FRUta
    mov dword [esi], ebx
    inc edx
    jmp fruit_inner1
end_fruit_inner1:
    inc ecx
    mov edx, 2
    jmp fruit_outer1

end_fruit_outer1:
    mov ecx, 2
    mov edx, 60

fruit_outer2:
    cmp ecx, 10
    jge end_fruit_outer2
fruit_inner2:
    cmp edx, 66
    je end_fruit_inner2
    mov esi, ecx ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800
    
    mov ebx, 0xa411a411 ;FRUta
    mov dword [esi], ebx
    inc edx
    jmp fruit_inner2
end_fruit_inner2:
    inc ecx
    mov edx, 60
    jmp fruit_outer2

end_fruit_outer2:
    mov ecx, 18
    mov edx, 56

fruit_outer3:
    cmp ecx, 22
    jge end_fruit_outer3
fruit_inner3:
    cmp edx, 70
    je end_fruit_inner3
    mov esi, ecx ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800
    
    mov ebx, 0xa411a411 ;FRUta
    mov dword [esi], ebx
    inc edx
    jmp fruit_inner3
end_fruit_inner3:
    inc ecx
    mov edx, 56
    jmp fruit_outer3

end_fruit_outer3:
    mov ecx, 22
    mov edx, 12

fruit_outer4:
    cmp ecx, 26
    jge end_fruit_outer4
fruit_inner4:
    cmp edx, 24
    je end_fruit_inner4
    mov esi, ecx ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800
    
    mov ebx, 0xa411a411 ;FRUta
    mov dword [esi], ebx
    inc edx
    jmp fruit_inner4
end_fruit_inner4:
    inc ecx
    mov edx, 12
    jmp fruit_outer4

end_fruit_outer4:
    mov ecx, 0

upper:
    mov ecx, 14 ;row
    mov edx, 0  ;col

bottom:
    cmp edx, 159
    je end_bottom
    mov esi, ecx ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800
    
    mov ebx, 0
    mov dword [esi], ebx
    inc edx
    jmp bottom

end_bottom:
    mov ecx, 0 ;row
    mov edx, 39  ;col

middle:
    cmp ecx, 30
    je end_middle
    mov esi, ecx ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800
    
    mov ebx, 0
    mov dword [esi], ebx
    inc ecx
    jmp middle

end_middle:

    mov dword [ebp-4], 0x03020301 ; Current mr_do mitad arriba
    mov dword [ebp-8], 0x03040303 ; Current mr_do mitad abajo
    mov ecx, dword[ebp+8]
    mov dword [ebp-12], ecx ;ultima row
    mov ecx, dword[ebp+12]
    mov dword [ebp-20], 0 ;row enemigo 1
    mov dword [ebp-24], 0 ;direccion 0 abajo 1 arriba
    mov dword [ebp-28], 10 ;row enemigo 2
    mov dword [ebp-32], 0 ;direccion 0 abajo 1 arriba    
    mov dword [ebp-36], 20 ;row enemigo 3
    mov dword [ebp-40], 0 ;direccion 0 abajo 1 arriba
    mov dword [ebp-44], 0 ;col enemigo 4
    mov dword [ebp-48], 0 ;direccion 0 abajo 1 arriba
    mov dword [ebp-52], 10 ;col enemigo 5
    mov dword [ebp-56], 0 ;direccion 0 abajo 1 arriba
    mov dword [ebp-60], 20 ;col enemigo 6
    mov dword [ebp-64], 0 ;direccion 0 abajo 1 arriba

   
$loop:
    ;borrado mitad arriba
    mov esi, dword [ebp-12] ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword [ebp-16] ; Col
    shl esi, 1
    add esi, 0xb800
    
    mov ebx, 0
    mov dword [esi], ebx

    ;borrado mitad abajo
    mov esi, dword [ebp-12] ; Row
    inc esi
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword [ebp-16] ; Col
    shl esi, 1
    add esi, 0xb800
    
    mov ebx, 0
    mov dword [esi], ebx

    ;revisar si hay una fruta ahi

    mov esi, dword [ebp+8] ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword [ebp+12] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, dword [esi]

    cmp ebx,0xa411a411
    jne check_down
    sub dword [ebp+16], 1
    cmp dword [ebp+16], 0
    je restart_mrdo

check_down:
    mov esi, dword [ebp+8] ; Row
    inc esi
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword [ebp+12] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, dword [esi]

    cmp ebx,0xa411a411
    jne check_left_upper
    sub dword [ebp+16], 1
    cmp dword [ebp+16], 0
    je restart_mrdo

check_left_upper:
    mov esi, dword [ebp+8] ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword [ebp+12] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, dword [esi]
    shr ebx, 16

    cmp bx,0xa411
    jne check_left_bottom
    sub dword [ebp+16], 1
    cmp dword [ebp+16], 0
    je restart_mrdo
check_left_bottom:
    mov esi, dword [ebp+8] ; Row
    inc esi
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword [ebp+12] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, dword [esi]
    shl ebx, 16

    cmp bx,0xa411
    jne check_right_upper
    sub dword [ebp+16], 1
    cmp dword [ebp+16], 0
    je restart_mrdo

check_right_upper:
    mov esi, dword [ebp+8] ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword [ebp+12] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, dword [esi]

    cmp bx,0xa411
    jne check_right_bottom
    sub dword [ebp+16], 1
    cmp dword [ebp+16], 0
    je restart_mrdo
check_right_bottom:
    mov esi, dword [ebp+8] ; Row
    inc esi
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword [ebp+12] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, dword [esi]

    cmp bx,0xa411
    jne render_mrdo
    sub dword [ebp+16], 1
    cmp dword [ebp+16], 0
    je restart_mrdo

render_mrdo:
    ;mitad arriba
    mov esi, dword [ebp+8] ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword [ebp+12] ; Col
    shl esi, 1
    add esi, 0xb800
    
    mov ebx, dword [ebp-4]
    mov dword [esi], ebx

    ;mitad abajo
    mov esi, dword [ebp+8] ; Row
    inc esi
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword [ebp+12] ; Col
    shl esi, 1
    add esi, 0xb800
    
    mov ebx, dword [ebp-8]
    mov dword [esi], ebx
   
$test_keys:
    push 50
    call delay
    add esp, 4
;BORRAR ENEMIGO 1
    mov esi, dword[ebp-20] ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0
    mov dword [esi], ebx
    
    mov esi, dword[ebp-20] ; Row
    inc esi
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0
    mov dword [esi], ebx

    cmp dword[ebp-24], 1
    je enemy_to_up
    cmp dword[ebp-20], 28
    je change_dir_up_1
    add dword[ebp-20], 1
    jmp draw_enemy_1
change_dir_up_1:
    mov dword[ebp-24], 1
enemy_to_up:
    cmp dword[ebp-20], 0
    je change_dir_down_1
    sub dword[ebp-20], 1
    jmp draw_enemy_1
change_dir_down_1:
    mov dword[ebp-24], 0 

draw_enemy_1:
    mov esi, dword[ebp-20] ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0x0f130f12
    mov dword [esi], ebx
    
    mov esi, dword[ebp-20] ; Row
    inc esi
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0x0f150f14
    mov dword [esi], ebx

;BORRAR ENEMIGO 2
    mov esi, dword[ebp-28] ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0
    mov dword [esi], ebx
    
    mov esi, dword[ebp-28] ; Row
    inc esi
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0
    mov dword [esi], ebx

    cmp dword[ebp-32], 1
    je enemy_to_up_2
    cmp dword[ebp-28], 28
    je change_dir_up_2
    add dword[ebp-28], 1
    jmp draw_enemy_2
change_dir_up_2:
    mov dword[ebp-32], 1
enemy_to_up_2:
    cmp dword[ebp-28], 0
    je change_dir_down_2
    sub dword[ebp-28], 1
    jmp draw_enemy_2
change_dir_down_2:
    mov dword[ebp-32], 0 

draw_enemy_2:

    mov esi, dword[ebp-28] ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0x0f130f12
    mov dword [esi], ebx
    
    mov esi, dword[ebp-28] ; Row
    inc esi
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0x0f150f14
    mov dword [esi], ebx

;BORRAR ENEMIGO 3
    mov esi, dword[ebp-36] ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0
    mov dword [esi], ebx
    
    mov esi, dword[ebp-36] ; Row
    inc esi
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0
    mov dword [esi], ebx

    cmp dword[ebp-40], 1
    je enemy_to_up_3
    cmp dword[ebp-36], 28
    je change_dir_up_3
    add dword[ebp-36], 1
    jmp draw_enemy_3
change_dir_up_3:
    mov dword[ebp-40], 1
enemy_to_up_3:
    cmp dword[ebp-36], 0
    je change_dir_down_3
    sub dword[ebp-36], 1
    jmp draw_enemy_3
change_dir_down_3:
    mov dword[ebp-40], 0 

draw_enemy_3:

    mov esi, dword[ebp-36] ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0x0f130f12 ;ENEMIGO
    mov dword [esi], ebx
    
    mov esi, dword[ebp-36] ; Row
    inc esi
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, edx ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0x0f150f14
    mov dword [esi], ebx

;BORRAR ENEMIGO 4
    mov esi, 14 ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword[ebp-44] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0
    mov dword [esi], ebx
    
    mov esi, 14 ; Row
    inc esi
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword[ebp-44] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0
    mov dword [esi], ebx

    cmp dword[ebp-48], 1
    je enemy_to_up_4
    cmp dword[ebp-44], 78
    je change_dir_up_4
    add dword[ebp-44], 1
    jmp draw_enemy_4
change_dir_up_4:
    mov dword[ebp-48], 1
enemy_to_up_4:
    cmp dword[ebp-44], 0
    je change_dir_down_4
    sub dword[ebp-44], 1
    jmp draw_enemy_4
change_dir_down_4:
    mov dword[ebp-48], 0 

draw_enemy_4:

    mov esi, 14 ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword[ebp-44] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0x0f130f12 ;ENEMIGO
    mov dword [esi], ebx
    
    mov esi, 14 ; Row
    inc esi
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword[ebp-44] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0x0f150f14
    mov dword [esi], ebx

;BORRAR ENEMIGO 5
    mov esi, 14 ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword[ebp-52] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0
    mov dword [esi], ebx
    
    mov esi, 14 ; Row
    inc esi
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword[ebp-52] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0
    mov dword [esi], ebx

    cmp dword[ebp-56], 1
    je enemy_to_up_5
    cmp dword[ebp-52], 78
    je change_dir_up_5
    add dword[ebp-52], 1
    jmp draw_enemy_5
change_dir_up_5:
    mov dword[ebp-56], 1
enemy_to_up_5:
    cmp dword[ebp-52], 0
    je change_dir_down_5
    sub dword[ebp-52], 1
    jmp draw_enemy_5
change_dir_down_5:
    mov dword[ebp-56], 0 

draw_enemy_5:

    mov esi, 14 ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword[ebp-52] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0x0f130f12 ;ENEMIGO
    mov dword [esi], ebx
    
    mov esi, 14 ; Row
    inc esi
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword[ebp-52] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0x0f150f14
    mov dword [esi], ebx

;BORRAR ENEMIGO 6
    mov esi, 14 ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword[ebp-60] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0
    mov dword [esi], ebx
    
    mov esi, 14 ; Row
    inc esi
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword[ebp-60] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0
    mov dword [esi], ebx

    cmp dword[ebp-64], 1
    je enemy_to_up_6
    cmp dword[ebp-60], 78
    je change_dir_up_6
    add dword[ebp-60], 1
    jmp draw_enemy_6
change_dir_up_6:
    mov dword[ebp-64], 1
enemy_to_up_6:
    cmp dword[ebp-60], 0
    je change_dir_down_6
    sub dword[ebp-60], 1
    jmp draw_enemy_6
change_dir_down_6:
    mov dword[ebp-64], 0 

draw_enemy_6:

    mov esi, 14 ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword[ebp-60] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0x0f130f12 ;ENEMIGO
    mov dword [esi], ebx
    
    mov esi, 14 ; Row
    inc esi
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword[ebp-60] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, 0x0f150f14
    mov dword [esi], ebx
check_enemy_down:
    mov esi, dword [ebp+8] ; Row
    inc esi
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword [ebp+12] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, dword [esi]

    cmp ebx,0x0f130f12
    jne check_enemy_up
    je lose

check_enemy_up:
    mov esi, dword [ebp+8] ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword [ebp+12] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, dword [esi]

    cmp ebx,0x0f150f14 
    jne check_enemy_up_1
    je lose

check_enemy_up_1:
    mov esi, dword [ebp+8] ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword [ebp+12] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, dword [esi]

    cmp ebx,0x0f130f12
    jne check_enemy_up_2
    je lose

check_enemy_up_2:
    mov esi, dword [ebp+8] ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword [ebp+12] ; Col
    shl esi, 1
    add esi, 0xb800
    mov ebx, dword [esi]

    cmp ebx,0x0f130f12
    je lose
    ;inc ecx

    mov ah, byte [0xffff0004] ; Keypad
    mov al, ah

    ; Left key
    and al, 0x1
    test al, al
    jz $test_right

    mov ecx, dword[ebp+8]
    mov dword [ebp-12], ecx ;ultima row
    mov ecx, dword[ebp+12]
    mov dword [ebp-16], ecx ;ultima Column
    
    mov dword [ebp-4], 0x030e030d ; mr_do left mitad arriba
    mov dword [ebp-8], 0x0310030f ; mr_do left mitad abajo
    cmp dword [ebp+ 12], 0  ; collipsion left wall
    je $loop

    sub dword [ebp+ 12], 1
    jmp $loop
       
$test_right:
    mov al, ah
    and al, 0x2
    test al, al
    jz $test_down

    mov ecx, dword[ebp+8]
    mov dword [ebp-12], ecx ;ultima row
    mov ecx, dword[ebp+12]
    mov dword [ebp-16], ecx ;ultima Column
   
    mov dword [ebp-4], 0x030a0309 ; mr_do right mitad arriba
    mov dword [ebp-8], 0x030c030b ; mr_do right mitad abajo
    cmp dword [ebp+ 12], 79  ; collipsion right wall
    je $loop
    add dword [ebp+ 12], 1
    jmp $loop
 
$test_down:
    mov al, ah
    and al, 0x4
    test al, al
    jz $test_up
    
    mov ecx, dword[ebp+8]
    mov dword [ebp-12], ecx ;ultima row
    mov ecx, dword[ebp+12]
    mov dword [ebp-16], ecx ;ultima Column
   
    mov dword [ebp-4], 0x03020301 ; mr_do up mitad arriba
    mov dword [ebp-8], 0x03040303 ; mr_do up mitad abajo
    cmp dword [ebp+ 8], 28  ; collipsion upper wall
    je $loop
    add dword [ebp+ 8], 1
    jmp $loop
 
$test_up:
    mov al, ah
    and al, 0x8
    test al, al
    jz $test_q
    
    mov ecx, dword[ebp+8]
    mov dword [ebp-12], ecx ;ultima row
    mov ecx, dword[ebp+12]
    mov dword [ebp-16], ecx ;ultima Column
   
    mov dword [ebp-4], 0x03060305 ; mr_do dpwn mitad arriba
    mov dword [ebp-8], 0x03080307 ; mr_do dpwn mitad abajo
    cmp dword [ebp+ 8], 0  ; collipsion down wall
    je $loop
    sub dword [ebp+ 8], 1
    jmp $loop
 
$test_q:
    mov al, ah
    and al, 0x10
    test al, al
    
    mov ecx, dword[ebp+8]
    mov dword [ebp-12], ecx ;ultima row
    mov ecx, dword[ebp+12]
    mov dword [ebp-16], ecx ;ultima Column

    jnz $end_loop
   
    jmp $test_keys
 
$end_loop:
    #show al binary
    mov esp, ebp
    pop ebp
    ret   
delay:
    mov eax, dword [0xffff0008]
    add eax, dword [esp + 4]
$delay_loop:
    cmp dword [0xffff0008], eax
    jl $delay_loop
    ret

;RESTART GAMEEEEEE
lose:
    mov ecx, 0xb800
for_lose:
    cmp ecx, 0xcabf
    je end_for_lose
    mov dword [ecx], 0x442e442e
    inc ecx
    jmp for_lose

end_for_lose:   
    push 1000
    call delay
    add esp, 4
    mov ecx, 2
    mov edx, 2

restart_mrdo:
    mov dword [ebp+8], 10 ;RESTART ROW
    mov dword [ebp+12], 10 ;RESTART ROW
    mov dword [ebp+16], 120 ;COUNT FRUIT
    mov ecx, 0xb800
    jmp for_field
