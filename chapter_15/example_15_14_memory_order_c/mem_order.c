/*
 *    Thread0	                   Thread1
 *	CPU0		             CPU1
 *	------------------------------------------
 *     shared_data = 55           WAIT(flag == 1)
 *	flag = 1;		   readout shared_data
 *
 *	在runninglinuxkernel_5.15中运行和测试，可能需要很长
 *	时间才能触发memory order issue。
 *
 *	$ ./run_debian_riscv.sh run
 *
 *	# make
 *	# ./test
 */

#define _GNU_SOURCE
#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <sched.h>
#include <sys/types.h>
#include <unistd.h>

#define smp_mb() \
__asm__ __volatile__("fence rw, rw" : : : "memory")

unsigned long shared_data;
unsigned long flag;

#define DEFAULT_VALUE 0x55

extern unsigned long run_thread0(unsigned long *data, unsigned long *flag, unsigned long value);
extern unsigned long run_thread1(unsigned long *data, unsigned long *flag);

void* thread0(void *data)
{
	cpu_set_t set;

	/* 运行在CPU0 */
	CPU_ZERO(&set);
	CPU_SET(0, &set);
	if (sched_setaffinity(0, sizeof(set), &set) == -1) {
		perror("sched_setaffinity fail");
		return NULL;
	}

	run_thread0(&shared_data, &flag, DEFAULT_VALUE);

	return NULL;
}

void* thread1(void *d)
{
	unsigned long data;
	cpu_set_t set;

	/* 运行在CPU0 */
	CPU_ZERO(&set);
	CPU_SET(1, &set);
	if (sched_setaffinity(0, sizeof(set), &set) == -1) {
		perror("sched_setaffinity fail");
		return NULL;
	}

	data = run_thread1(&shared_data, &flag);
	if (data !=  DEFAULT_VALUE) {
		printf("found memory order issue, data: 0x%lx\n", data);
		exit(1);
	}
	return NULL;
}

int main(void)
{
	pthread_t pid0, pid1;

	for (;;) {
		if (pthread_create(&pid0, NULL, thread0, NULL)) {
			perror("pthread_create:p0");
			exit(1);
		}
		if (pthread_create(&pid1, NULL, thread1, NULL)) {
			perror("pthread_create:p1");
			exit(1);
		}
		if (pthread_join(pid0, NULL)) {
			perror("pthread_join:p0");
			exit(1);
		}
		if (pthread_join(pid1, NULL)) {
			perror("pthread_join:p1");
			exit(1);
		}

		shared_data = 0;
		flag = 0;
		/* 确保在下一轮运行时候shared_data和flag都重置为0 */
		smp_mb();
	}
}
