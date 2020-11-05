%include "io.inc"
extern printf
section .data
    arr dq 1.0, 2.0, 3.1, 0.0, 0
    size dd 4, 0
    tmp dq 0.0,0
    format db "El resultado de la suma es %f", 10,0 
    

section .text
global CMAIN

CMAIN:
    mov ebp, esp; for correct debugging
    mov ebp, esp; for correct debugging
    mov ebp, esp; for correct debugging

    mov ebx, dword[size] ;guardo el tamaño del arreglo en ebx
    mov eax, 0 ;Seteo eax en 0, para usarlo como contador en el ciclo
    mov edx, arr ;guardo la dirección de memoria en edx para luego poder iterar
    
    jmp condition ;salto a la condicion

    
condition:
    cmp eax, ebx; comparo el contador(eax) con el tamaño del arreglo
    jl calculate ; Si el contador es menor salto a la etiqueta calculate
    
    push dword[tmp+4]
    push dword[tmp]
    
    push format
    call printf
    add esp, 12
      
    ret
calculate:
    fld qword[tmp] ;Cargo el valo de la suma
    fld qword[edx + (eax * 8)] ;Accedo a un elemento del array
    fadd ;sumo
    fst qword[tmp] ;guardo el resultado de la suma
    finit ;reseteo st0 para evitar un  Nan
    
    inc eax
    jmp condition

 