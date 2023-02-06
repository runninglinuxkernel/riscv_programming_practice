# 1 "src/printk.c"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_8\\lab8-1\\benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/printk.c"
# 1 "include/stdarg.h" 1







typedef __builtin_va_list va_list;
# 2 "src/printk.c" 2
# 1 "src/../include/uart.h" 1



void uart_init ( void );
char uart_recv ( void );
void uart_send ( char c );
void uart_send_string(char* str);
int putchar(int c);
# 3 "src/printk.c" 2
# 1 "include/string.h" 1







# 1 "include/types.h" 1







typedef signed char s8_t;
typedef unsigned char u8_t;

typedef signed short s16_t;
typedef unsigned short u16_t;

typedef signed int s32_t;
typedef unsigned int u32_t;

typedef signed long long s64_t;
typedef unsigned long long u64_t;

typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;

typedef signed long long ptrdiff_t;
typedef signed long long intptr_t;
typedef unsigned long long uintptr_t;

typedef unsigned long long size_t;
typedef signed long long ssize_t;

typedef signed long off_t;
typedef signed long long loff_t;

typedef signed int bool_t;
typedef unsigned long irq_flags_t;

typedef unsigned long long virtual_addr_t;
typedef unsigned long long virtual_size_t;
typedef unsigned long long physical_addr_t;
typedef unsigned long long physical_size_t;

typedef struct {
 volatile int counter;
} atomic_t;

typedef struct {
 volatile int lock;
} spinlock_t;
# 9 "include/string.h" 2

void * memset(void * s, int c, size_t n);
void * memcpy(void * dest, const void * src, size_t len);
size_t strlen(const char *s);
# 4 "src/printk.c" 2
# 1 "include/asm/sbi.h" 1
# 31 "include/asm/sbi.h"
static inline void sbi_set_timer(unsigned long stime_value)
{
 ({ register unsigned long a0 asm ("a0") = (unsigned long)(stime_value); register unsigned long a1 asm ("a1") = (unsigned long)(0); register unsigned long a2 asm ("a2") = (unsigned long)(0); register unsigned long a7 asm ("a7") = (unsigned long)(0); asm volatile ("ecall" : "+r" (a0) : "r" (a1), "r" (a2), "r" (a7) : "memory"); a0; });
}

static inline void sbi_putchar(unsigned char c)
{
 ({ register unsigned long a0 asm ("a0") = (unsigned long)(c); register unsigned long a1 asm ("a1") = (unsigned long)(0); register unsigned long a2 asm ("a2") = (unsigned long)(0); register unsigned long a7 asm ("a7") = (unsigned long)(0x1); asm volatile ("ecall" : "+r" (a0) : "r" (a1), "r" (a2), "r" (a7) : "memory"); a0; });
}

static inline void sbi_put_string(char *str)
{
 int i;

 for (i = 0; str[i] != '\0'; i++)
  sbi_putchar((char) str[i]);
}
# 5 "src/printk.c" 2




static char print_buf[256];




static char log_buf[(1 << 8)];

enum printk_status {
 PRINTK_STATUS_DOWN,
 PRINTK_STATUS_READY,
};

static enum printk_status g_printk_status = PRINTK_STATUS_DOWN;
static char *g_record = log_buf;
static unsigned long g_record_len;
# 43 "src/printk.c"
static const char *scan_number(const char *string, int *number)
{
 int tmp = 0;

 while (((*string) >= '0' && (*string) <= '9')) {
  tmp *= 10;
  tmp += *(string++) - '0';
 }

 *number = tmp;
 return string;
}

static char *number(char *str, unsigned long num, int base, int size, int precision
 , int type)
{
 char c, sign = 0, tmp[128];
 long snum;

 const char *digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
 int i;

 if (type & 64)
  digits = "0123456789abcdefghijklmnopqrstuvwxyz";
 if (type & 16)
  type &= ~1;
 if (base < 2 || base > 36)
  return 0;

 c = (type & 1) ? '0' : ' ';

 if (type & 2) {
  snum = (long)num;
  if (snum < 0) {
   sign = '-';
   num = -snum;
  } else if (type & 4) {
   sign = '+';
   size--;
  } else if (type & 8) {
   sign = ' ';
   size--;
  }
 }

 if (type & 32) {
  if (base == 16)
   size -= 2;
  else if (base == 8)
   size--;
 }

 i = 0;
 if (num == 0)
  tmp[i++] = '0';
 else
  while (num != 0)
   tmp[i++] = digits[({ unsigned int __base = (base); unsigned int __rem; __rem = ((unsigned long)(num)) % __base; (num) = ((unsigned long)(num)) / __base; __rem; })];
 if (i > precision)
  precision = i;
 size -= precision;
 if (!(type&(1 +16)))
  while (size-- > 0)
   *str++ = ' ';
 if (sign)
  *str++ = sign;

 if (type & 32) {
  if (base == 8)
   *str++ = '0';
  else if (base == 16) {
   *str++ = '0';
   *str++ = digits[33];
  }
 }

 if (!(type & 16))
  while (size-- > 0)
   *str++ = c;
 while (i < precision--)
  *str++ = '0';
 while (i-- > 0)
  *str++ = tmp[i];
 while (size-- > 0)
  *str++ = ' ';

 return str;
}
# 147 "src/printk.c"
int myprintf(char *string, unsigned int size,
  const char *fmt, va_list arg)
{
 char *pos;
 int flags;
 int field_width;
 int precision;
 int qualifier;
 char *ip;
 char *s;
 int i;
 int len;
 unsigned long num;
 int base;

 pos = string;

 for (; *fmt; fmt++) {
  if (*fmt != '%') {
   *pos++ = *fmt;
   continue;
  }


  flags = 0;
repeat:
  ++fmt;
  switch (*fmt) {
  case '-':
   flags |= 16;
   goto repeat;
  case '+':
   flags |= 4;
   goto repeat;
  case ' ':
   flags |= 8;
   goto repeat;
  case '#':
   flags |= 32;
   goto repeat;
  case '0':
   flags |= 1;
   goto repeat;
  }


  field_width = -1;
  if (((*fmt) >= '0' && (*fmt) <= '9')) {
   fmt = scan_number(fmt, &field_width);
  } else if (*fmt == '*') {
   field_width = __builtin_va_arg(arg, int);
   if (field_width < 0) {
    field_width = -field_width;
    flags |= 16;
   }
  }


  precision = -1;
  if (*fmt == '.') {
   ++fmt;
   if (((*fmt) >= '0' && (*fmt) <= '9'))
    fmt = scan_number(fmt, &precision);
   else if (*fmt == '*')
    precision = __builtin_va_arg(arg, int);
   if (precision < 0)
    precision = 0;
  }





  qualifier = -1;
  if (*fmt == 'h' || *fmt == 'l' || *fmt == 'L') {
   qualifier = *fmt;
   ++fmt;

   if (qualifier == 'l' && *fmt == 'l') {
    qualifier = 'L';
    ++fmt;
   }
  }

  switch (*fmt) {

  case 'c':
   if (!(flags & 16))
    while (--field_width > 0)
     *pos++ = ' ';
   *pos++ = (unsigned char)__builtin_va_arg(arg, int);
   while (--field_width > 0)
    *pos++ = ' ';

   continue;


  case 's':
   s = __builtin_va_arg(arg, char *);
   if (!s)
    s = "<NULL>";
   len = strlen(s);
   if (precision < 0)
    precision = len;
   else if (len > precision)
    len = precision;

   if (!(flags & 16))
    while (len < field_width--)
     *pos++ = ' ';
   for (i = 0; i < len; i++)
    *pos++ = *s++;
   while (len < field_width--)
    *pos++ = ' ';
   continue;





  case 'n':
   ip = (char *)__builtin_va_arg(arg, int *);
   *ip = (pos - string);
   continue;




  case 'p':
   if (field_width == -1) {
    field_width = 2 * sizeof(void *);
    flags |= 1;
   }
   pos = number(pos,
    (unsigned long)__builtin_va_arg(arg, void *),
    16, field_width, precision, flags);
   continue;


  case 'o':
   base = 8;
   break;

  case 'x':
   flags |= 64;
  case 'X':
   base = 16;
   break;

  case 'd':
  case 'i':
   flags |= 2;

  case 'u':
   base = 10;
   break;

  default:
   if (*fmt != '%')
    *pos++ = '%';
   if (*fmt)
    *pos++ = *fmt;
   else
    --fmt;
   break;
  }

  if (qualifier == 'L') {
   if (flags & 2)
    num = __builtin_va_arg(arg, long);
   else
    num = __builtin_va_arg(arg, long);
  } else if (qualifier == 'h') {
   if (flags & 2)
    num = (short)__builtin_va_arg(arg, int);
   else
    num = (unsigned short)__builtin_va_arg(arg, unsigned int);
  } else if (qualifier == 'l') {
   if (flags & 2)
    num = __builtin_va_arg(arg, long);
   else
    num = __builtin_va_arg(arg, unsigned long);
  } else {
   if (flags & 2)
    num = (int)__builtin_va_arg(arg, int);
   else
    num = __builtin_va_arg(arg, unsigned int);
  }
  pos = number(pos, num, base, field_width, precision, flags);
 }

 *pos = '\0';
 return pos - string;
}

void init_printk_done(void)
{
 unsigned long i;

 g_printk_status = PRINTK_STATUS_READY;

 for (i = 0; i < g_record_len; i++)
  sbi_putchar(log_buf[i]);

 g_record = log_buf;
 g_record_len = 0;
}

int printk(const char *fmt, ...)
{
 va_list arg;
 int len;
 int i;

 __builtin_va_start(arg, fmt);
 len = myprintf(print_buf, sizeof(print_buf), fmt, arg);
 __builtin_va_end(arg);


 if (g_printk_status == PRINTK_STATUS_DOWN) {
  memcpy(g_record, print_buf, len);
  g_record = log_buf + len;
  g_record_len += len;

  return 0;
 }

 for (i = 0; i < len; i++) {
        if (print_buf[i] == '\n')
            sbi_putchar('\r');
  sbi_putchar(print_buf[i]);
  if (i > sizeof(print_buf))
   break;
 }
 return len;
}
