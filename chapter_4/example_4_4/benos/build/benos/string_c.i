# 1 "src/string.c"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_4\\example_4_4\\benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/string.c"

typedef unsigned long long size_t;

size_t strlen(const char *s)
{
 const char *sc;

 for (sc = s; *sc != '\0'; ++sc)
  ;

 return sc - s;
}

void *memcpy(void *dest, const void *src, size_t count)
{
 char *tmp = dest;
 const char *s = src;

 while (count--)
  *tmp++ = *s++;
 return dest;
}
