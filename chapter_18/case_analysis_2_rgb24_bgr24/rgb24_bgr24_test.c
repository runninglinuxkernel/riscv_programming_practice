#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <riscv_vector.h>

static void rgb24_bgr24_c(unsigned char *src, unsigned char *dst, unsigned long count)
{
	unsigned long i;

	for (i = 0; i < count/3; i++) {
		dst[3 * i] = src[3 * i +2];
		dst[3 * i + 1] = src[3*i + 1];
		dst[3 * i + 2] = src[3*i];
	}
}

#if 0
static void rgb24_bgr24_intr(unsigned char *src, unsigned char *dst, unsigned long count)
{
	size_t vl;
	vuint8m1x3_t rgb;
	vuint8m1x3_t bgr;

	while(count) {
		vl = vsetvl_e8m1(count);
		rgb = vlseg3e8_v_u8m1x3(src, vl);

		bgr.val[2] = vmv_v_v_u8m1(rgb.val[0], vl);
		bgr.val[0] = vmv_v_v_u8m1(rgb.val[2], vl);
		bgr.val[1] = vmv_v_v_u8m1(rgb.val[1], vl);

		vsseg3e8_v_u8m1x3(dst, bgr, vl);

		count -= 3 * vl;
		src += 3 * vl;
		dst += 3 * vl;
	}
}
#endif

static void rgb24_bgr24_intr(unsigned char *src, unsigned char *dst, unsigned long count)
{
	size_t vl;
	vuint8m1_t rgb_r, rgb_g, rgb_b;

	while(count) {
		vl = vsetvl_e8m1(count);
		
		vlseg3e8_v_u8m1(&rgb_r, &rgb_g, &rgb_b, src, vl);
		vsseg3e8_v_u8m1(dst, rgb_b, rgb_g, rgb_r, vl);
		
		count -= 3 * vl;
		src += 3 * vl;
		dst += 3 * vl;
	}
}

#define IMAGE_SIZE (800*600)
#define PIXEL_SIZE (IMAGE_SIZE * 3)

int main(int argc, char* argv[])
{
	unsigned long i;

	unsigned char *rgb24_src = malloc(PIXEL_SIZE);
	if (!rgb24_src)
		return 0;
	memset(rgb24_src, 0, PIXEL_SIZE);

	unsigned char *bgr24_c = malloc(PIXEL_SIZE);
	if (!bgr24_c)
		return 0;
	memset(bgr24_c, 0, PIXEL_SIZE);

	unsigned char *bgr24_asm = malloc(PIXEL_SIZE);
	if (!bgr24_asm)
		return 0;
	memset(bgr24_asm, 0, PIXEL_SIZE);

	unsigned char *bgr24_intr = malloc(PIXEL_SIZE);
	if (!bgr24_intr)
		return 0;
	memset(bgr24_asm, 0, PIXEL_SIZE);

	for (i = 0; i < PIXEL_SIZE; i++) {
		rgb24_src[i] = rand() & 0xff;
	}

	rgb24_bgr24_c(rgb24_src, bgr24_c, PIXEL_SIZE);	

	rgb24_bgr24_asm(rgb24_src, bgr24_asm, PIXEL_SIZE);

	rgb24_bgr24_intr(rgb24_src, bgr24_intr, PIXEL_SIZE);

	if (memcmp(bgr24_c, bgr24_asm, PIXEL_SIZE))
		printf("error on bgr24_asm data\n");
	else
		printf("bgr24_c (%ld) is idential with bgr24_asm\n", PIXEL_SIZE);

	if (memcmp(bgr24_c, bgr24_intr, PIXEL_SIZE))
		printf("error on bgr24_intr data\n");
	else
		printf("bgr24_c (%ld) is idential with bgr24_intr\n", PIXEL_SIZE);

	free(rgb24_src);
	free(bgr24_c);
	free(bgr24_asm);
	free(bgr24_intr);

	return 0;
}
