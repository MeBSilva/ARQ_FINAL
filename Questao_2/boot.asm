org 0x7c00

bits 16

start: 
	
	cli ;

	int 0x13

	mov ah, 0x02
	mov al, 1
	mov cl, 2
	mov dh, 0
	mov ch, 0
	mov bx, 0x7e00

	int 0x13

reset:
	mov si, mat

decrisp: 
	mov al, [bx]
	or al, al
	jz fim

	mov dl, [si]
	cmp dl, 10
	je reset

	sub al, dl

	mov ah, 0x0e
	int 0x10

	inc si 
	inc bx

	jmp decrisp
mat: 
	db 4 , 1 , 2 , 8 , 1 , 8 , 10

fim: 
	hlt
	times 510 - ($-$$) db 0
	dw 0xaa55