org 0x7c00

bits 16

start:

	cli

	mov ax, 0
	mov bx, 0
	mov cx, 0
	mov dx, 0

	mov al, 0x13
	int 0x10

	mov ax, 0xa000
	mov es, ax
	mov ax, 0

	mov dl, 0

reset_cont:
	mov cx, 0
	mov bx, 0


pinta:
	mov di, cx
	mov [es:di], dl
	inc cx
	cmp bx, 64000
	je tela_final

	inc bx
	inc dl
	
	jmp pinta

tela_final:
	mov dx, ax
	inc dl
	inc ax

	jmp reset_cont



times 510 - ($-$$) db 0
dw 0xaa55