
	.section .payload, "ax", %progbits
	.globl payload_bin
payload_bin:
	.incbin	"benos.bin"

