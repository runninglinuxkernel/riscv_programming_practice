.text
.balign 4

/*
   void *memcpy(void* dest, const void* src, size_t n)
   a0=dest, a1=src, a2=n
*/
.global my_memcpy_4b
my_memcpy_4b:
	mv a3, a0 # Copy destination
loop:
	vsetvli t0, a2, e32, m1        # Vectors of 32b
	vle32.v v0, (a1)               # Load bytes
	slli t0, t0, 2
	add a1, a1, t0              # Bump pointer
	sub a2, a2, t0              # Decrement count
	vse32.v v0, (a3)               # Store bytes
	add a3, a3, t0              # Bump pointer
	bnez a2, loop               # Any more?

	ret                         # Return
