#include <stdio.h>

extern void get_lock(volatile unsigned int *lock);
extern void free_lock(volatile unsigned int *lock);

static int check_get_lock(volatile unsigned int *lock)
{
	return (*(volatile unsigned int *)lock) == 1;
}

#if 0
static void free_lock(volatile unsigned int *lock)
{
	*(volatile unsigned int *)lock = 0;
}
#endif

int main()
{
	volatile unsigned int lock = 0;
	get_lock(&lock);
	if (check_get_lock(&lock))
		printf("got lock: 0x%x\n", lock);
	
	free_lock(&lock);
	get_lock(&lock);
	if (check_get_lock(&lock))
		printf("got lock: 0x%x\n", lock);
}
