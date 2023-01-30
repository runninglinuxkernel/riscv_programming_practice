#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

static inline unsigned long cmpxchg(volatile void *ptr, unsigned long old, unsigned long new)
{
	unsigned long tmp;
	unsigned long result;

	asm volatile(
"1:	lr.d	%[result], (%[ptr])\n"
"       bne  %[result], %[old], 2f\n"
"	sc.d  %[tmp], %[new], (%[ptr])\n"
"	bnez	%[tmp], 1b\n"
"       2:\n"
	: [result]"+r" (result), [tmp]"+r" (tmp), [ptr]"+r" (ptr)
	: [new]"r" (new), [old]"r"(old)
	: "memory");

	return result;
}

struct node {
	struct node *next;
	unsigned long val;
};

struct node head;

static struct node *new_node(unsigned long val)
{
	struct node *node = malloc(sizeof(*node));
	if (!node)
		return NULL;

	node->next = NULL;
	node->val = val;

	return node;
}

void free_node(struct node *node)
{
	free(node);
}

static int add_node(struct node *head, unsigned long val)
{
	struct node *new = new_node(val);
	struct node *next = head->next;

	printf("adding %d\n", val);

	/* 如果链表里没有元素，直接加入链表尾 */
	if (cmpxchg(&head->next, (unsigned long)NULL, (unsigned long)new)
			== (unsigned long)NULL) {
		return 0;
	}

	for (;;) {
		/* 如果最末尾元素next->next为空，那么用cmpxchg设置new到next->next */
		if (next->next == NULL &&
				cmpxchg(&next->next, (unsigned long)NULL,
					(unsigned long)new) == (unsigned long)NULL)
			break;

		next = next->next;
	}

	return 0;
}

static void print_list(struct node *head)
{
	struct node *node = head->next;

	printf("===== print list ==========\n");

	while (node) {
		printf("val = %d, node =0x%lx\n", node->val, node);
		node = node->next;
	}
}

static int del_node(struct node *head)
{
	struct node *next = head->next;
	struct node *prev = head;

	/* 如果链表里没有元素 */
	if (next == NULL)
		return 0;

	for (;;) {
		/* 如果最末尾元素next->next为空并且prev不为空，
		 * 直接通过cmpxchg设置prev->next为空来释放末尾的元素
		 */
		if (next->next == NULL && prev &&
				cmpxchg(&prev->next, (unsigned long)next,
					(unsigned long)NULL) == (unsigned long)next)
			break;

		prev = next;
		next = next->next;
	}

	printf("del node %d\n", next->val);

	return 0;
}

static void *add_list_thread(void *arg)
{
	while (1) {
		add_node(&head, rand() & 0xffff);

		usleep(200 * 1000);
	}
}

static void *del_list_thread(void *arg)
{
	while (1) {
		del_node(&head);

		usleep(500 * 1000);
	}
}

static void *print_list_thread(void *arg)
{
	while (1) {
		print_list(&head);

		usleep(900 * 1000);
	}
}

int main(void)
{
	pthread_t t1;
	pthread_t t2;
	pthread_t t3;
	pthread_t t4;

	/* 初始化链表头 */
	head.next = NULL;

	pthread_create(&t1, NULL, &add_list_thread, NULL);
	pthread_create(&t2, NULL, &del_list_thread, NULL);
	pthread_create(&t3, NULL, &print_list_thread, NULL);
	pthread_create(&t4, NULL, &add_list_thread, NULL);

	pthread_join(t1, NULL);
	pthread_join(t2, NULL);
	pthread_join(t3, NULL);
	pthread_join(t4, NULL);

	return 0;
}
