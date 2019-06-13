org 0x7c00

bits 16

start:
	
	cli
	mov ax, 0

	mov al, 0x13
	int 0x10

	mov ax, 0xa000
	mov es, ax
	
	mov cx, 0

stroke:	
	
	mov ax, 0
	int 0x16

reset_stroke:
	
	mov cx, 0

pinta:

	mov di, cx
	mov [es:di], al
	cmp cx, 65535
	je stroke

	inc cx
	
	jmp pinta



times 510 -($-$$) db 0
dw 0xaa55