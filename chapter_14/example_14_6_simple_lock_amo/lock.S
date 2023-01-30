/*
   get_lock(lock)
*/

.global get_lock
get_lock:
	li a2, 1
retry:
	amomax.w a1, a2, (a0)  
	bnez a1, retry

	ret

/*
   free_lock(lock)
*/
.global free_lock
free_lock:
	sw x0, (a0)
