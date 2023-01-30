#ifndef	_PRINTK_H
#define	_PRINTK_H

void init_printk_done(void (*fn)(char c));
int printk(const char *fmt, ...);

#endif /*_PRINTK_H*/

