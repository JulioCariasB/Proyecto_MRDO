start:
    push 10
    push 10
    call show_mr_do
    add esp, 8
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
    mov dword [ebp-4], 0x44024401 ; Current mr_do mitad arriba
    mov dword [ebp-8], 0x44024401 ; Current mr_do mitad abajo
    mov ecx, dword[ebp+8]
    mov dword [ebp-12], ecx ;ultima row
    mov ecx, dword[ebp+12]
    mov dword [ebp-16], ecx ;ultima Column
    
   
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
 
    push 50
    call delay
    add esp, 4
   
$test_keys:
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
    
    mov dword [ebp-4], 0x44024401 ; mr_do left mitad arriba
    mov dword [ebp-8], 0x44024401 ; mr_do left mitad abajo
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
   
    mov dword [ebp-4], 0x44024401 ; mr_do right mitad arriba
    mov dword [ebp-8], 0x44024401 ; mr_do right mitad abajo
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
   
    mov dword [ebp-4], 0x44024401 ; mr_do up mitad arriba
    mov dword [ebp-8], 0x44024401 ; mr_do up mitad abajo
    cmp dword [ebp+ 8], 29  ; collipsion upper wall
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
   
    mov dword [ebp-4], 0x44024401 ; mr_do dpwn mitad arriba
    mov dword [ebp-8], 0x44024401 ; mr_do dpwn mitad abajo
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