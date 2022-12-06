section .text
    global _start

_start:
    ; Ask for the number of users
    mov eax, 4       ; syscall number for "write"
    mov ebx, 1       ; file descriptor 1 = standard output
    mov ecx, prompt1 ; address of the prompt message
    mov edx, len1    ; length of the prompt message
    int 0x80         ; invoke the kernel

    ; Read the number of users from the standard input
    mov eax, 3       ; syscall number for "read"
    mov ebx, 0       ; file descriptor 0 = standard input
    mov ecx, num_users ; address of the variable where we will store the number of users
    mov edx, 4       ; length of the input (4 bytes for a 32-bit integer)
    int 0x80         ; invoke the kernel

    ; Ask for the amount contributed by each user
    mov eax, 4       ; syscall number for "write"
    mov ebx, 1       ; file descriptor 1 = standard output
    mov ecx, prompt2 ; address of the prompt message
    mov edx, len2    ; length of the prompt message
    int 0x80         ; invoke the kernel

    ; Read the amount contributed by each user from the standard input
    mov eax, 3       ; syscall number for "read"
    mov ebx, 0       ; file descriptor 0 = standard input
    mov ecx, amt_contributed ; address of the variable where we will store the amount contributed
    mov edx, 4       ; length of the input (4 bytes for a 32-bit integer)
    int 0x80         ; invoke the kernel

    ; Ask for the total number of gallons of ice cream acquired
    mov eax, 4       ; syscall number for "write"
    mov ebx, 1       ; file descriptor 1 = standard output
    mov ecx, prompt3 ; address of the prompt message
    mov edx, len3    ; length of the prompt message
    int 0x80         ; invoke the kernel

    ; Read the total number of gallons of ice cream acquired from the standard input
    mov eax, 3       ; syscall number for "read"
    mov ebx, 0       ; file descriptor 0 = standard input
    mov ecx, total_ice_cream ; address of the variable where we will store the total number of gallons of ice cream
    mov edx, 4       ; length of the input (4 bytes for a 32-bit integer)
    int 0x80         ; invoke the kernel

    ; Calculate the number of gallons of ice cream each person will receive
    mov eax, [total_ice_cream]   ; move the total number of gallons into eax
    mov ebx, [num_users]         ; move the number of users into ebx
    cdq                        ; sign-extend eax into edx:eax
    idiv ebx                    ; divide edx:eax by ebx and store the result in eax
    mov [gallons_per_person], eax ; store the result in the "gallons_per_person" variable

    ; Print the number of gallons of ice cream each person will receive
    mov eax, 4       ; syscall number for "write"
    mov ebx, 1       ; file descriptor 1 = standard output
    mov ecx, message ; address of the output message
    mov edx, len4    ; length of the output message
    int 0x80         ; invoke the kernel

    mov eax, 1       ; syscall number for "exit"
    xor ebx, ebx     ; exit code 0 = success
    int 0x80         ; invoke the kernel
