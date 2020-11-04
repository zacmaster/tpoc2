extern printf
section .data
    format db "x1 es %f y x2 es %f", 10,0
    num_a dq 1.0, 0
    num_b dq 4.0, 0
    num_c dq 0.0, 0
    
    ac4 dq 0.0, 0
    bpow2 dq 0, 0
    a2 dq 0, 0
    b_negative dq 0, 0
    
    
    x1 dq 0, 0
    x2 dq 0, 0
    tmp_data dq 0, 0
    
    two dq 2.0, 0
    four dq 4.0, 0

section .text
global calculeSquareRoot
calculeSquareRoot:

    push ebp
    mov ebp, esp; for correct debugging
    ;write your code here

    
    fld qword[num_a]
    fld qword[num_c]
    fmul st0,st1
    fld qword[four]
    fmul st0, st1
    fst qword[ac4] ;4ac
    
    
    fld qword[num_b]
    fmul st0, st0
    fst qword[bpow2];b^2
    
    fld qword[num_a]
    fld qword[two]
    fmul st0,st1 
    fst qword[a2];2a
    
    fld qword[num_b] 
    fchs 
    fst qword[b_negative];-b
    
    finit   
    fld qword[ac4]
    fld qword[bpow2]
    fsub st0, st1 ;b^2 -4ac   
    fsqrt;(b^2-4ac)^1/2
    fst qword[tmp_data]
    
    
    finit
    fld qword[tmp_data]
    fld qword[b_negative]
    fadd st0, st1 ;-b + (b^2-4ac)^1/2 ;st1 is tmp_data
    
    fld qword[a2]
    fdiv ;(-b + (b^2-4ac)^1/2) /2a
    
    fst qword[x1];Almaceno el valor de x1
    
    finit
    
    fld qword[tmp_data]
    fld qword[b_negative]
    fsub st0,st1  ;-b - (b^2-4ac)^1/2
    fld qword[a2]
    fdiv;
    
    fst qword[x2]
    
    push dword[num_c + 4]
    push dword[num_c]
    
    push dword[x2 + 4]
    push dword[x2]
    
    push dword[x1 + 4]
    push dword[x1]


    push format
    
    call printf
    add esp, 12
    
    mov esp, ebp
    pop ebp
    
    ret