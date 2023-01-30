
/*
   run_thread0(shared_data, flag)
 */
.global run_thread0
run_thread0:
	li t0, 1

	//sd  t0, (a1) //更新flags为1通知CPU1数据已经准备好
	sd  a2, (a0) //写新数据
	sd  t0, (a1) //更新flags为1通知CPU1数据已经准备好

	ret


/*
   run_thread1(shared_data, flag)
 */
.global run_thread1
run_thread1:
	li t1, 1

       //等待CPU0更新flags 	
loop:
	ld t0, (a1)
	bne t0, t1, loop

	// read-out shared data
	ld a0, (a0)

	ret

