extern printf

section .text
section .data 
    formato db "a: %f y  b: %f y c: %f", 10, 0
    num_a dq 0,0
    num_b dq 0,0
    num_c dq 0,0


global calculeSquareRoot

calculeSquareRoot:
    ;write your code here
    push ebp
    mov ebp, esp

    fld dword[ebp + 8]
    fst qword[num_a]

    fld dword[ebp + 12]
    fst qword[num_b]

    fld dword[ebp + 16]
    fst qword[num_c]



    push dword[num_a + 4]
    push dword[num_a]


  
    push dword[num_c + 4]
    push dword[num_c]

    push dword[num_b + 4]
    push dword[num_b]

    push dword[num_a + 4]
    push dword[num_a]



    push formato
    
    call printf
    add esp, 12
    
    mov esp, ebp
    pop ebp
    
    ret