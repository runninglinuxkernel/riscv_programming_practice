/*
   get_lock(lock)
*/

.global get_lock
get_lock:
	li a2, 1
retry:
	lr.w a1, (a0)  //独占地访问lock
	beq a1, a2, retry //如果lock为1，说明锁已经被其他CPU持有，只能不断地尝试

	/* 锁已经释放，尝试去获取lock */
	sc.w a1, a2, (a0) //往lock写1，以获取锁
	bnez a1, retry ////若a1寄存器的值不为0，说明独占访问失败，只能跳转到retry处

	ret
