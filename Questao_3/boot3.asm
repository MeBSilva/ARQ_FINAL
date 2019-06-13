org 0x7c00

bits 16

start: 
	
	mov ax, 0
	mov ds, ax
	mov cx, ax

stroke: 
	mov ax, 0
	int 0x16
	mov ah, 0x0e
	int 0x10

	push ax
	inc cx

	cmp al, 13
	je reverse_stroke

	jmp stroke

desce_linha:

	mov al, 10
	int 0x10

reverse_stroke:

	pop ax
	int 0x10

	dec cx
	jz finish

	jmp reverse_stroke

finish:

	hlt
	times 510 - ($-$$) db 0
	dw 0xaa55
