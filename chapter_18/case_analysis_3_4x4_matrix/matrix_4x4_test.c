#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

typedef float_t float32_t; 

extern void matrix_multiply_4x4_asm(float32_t *A, float32_t *B, float32_t *D);

static void matrix_multiply_c(float32_t *A, float32_t *B, float32_t *C)
{
        for (int i_idx=0; i_idx<4; i_idx++) {
                for (int j_idx=0; j_idx<4; j_idx++) {
                        C[4*j_idx + i_idx] = 0;
                        for (int k_idx=0; k_idx<4; k_idx++) {
                                C[4*j_idx + i_idx] += A[4*k_idx + i_idx]*B[4*j_idx + k_idx];
                        }
                }
        }
}

static void print_matrix(float32_t *M)
{
        for (int i=0; i<4; i++) {
                for (int j=0; j<4; j++) {
                        printf("%f ", M[j*4 + i]);
                }
                printf("\n");
        }
        printf("\n");
}

static void matrix_init_rand(float32_t *M, uint32_t numvals)
{
        for (int i=0; i<numvals; i++) {
                M[i] = (float)rand()/(float)(RAND_MAX);
        }
}

static bool f32comp_noteq(float32_t a, float32_t b)
{
        if (fabs(a-b) < 0.000001) {
                return false;
        }
        return true;
}

static bool matrix_comp(float32_t *A, float32_t *B)
{
        float32_t a;
        float32_t b;
        for (int i=0; i<4; i++) {
                for (int j=0; j<4; j++) {
                        a = A[4*j + i];
                        b = B[4*j + i];      
                        
                        if (f32comp_noteq(a, b)) {
                                printf("i=%d, j=%d, A=%f, B=%f\n", i, j, a, b);
                                return false;
                        }
                }
        }
        return true;
}

int main()
{
        float32_t A[16];
        float32_t B[16];
        float32_t C[16];
        float32_t D[16];
        
        bool c_eq_asm;

        matrix_init_rand(A, 16);
        matrix_init_rand(B, 16);
	
	printf("Matrix A data:\n");
	print_matrix(A);
	
	printf("Matrix B data:\n");
	print_matrix(B);
        
	matrix_multiply_c(A, B, C);
        printf("C code result:\n");
        print_matrix(C);

	matrix_multiply_4x4_asm(A, B, D);
        printf("asm result:\n");
        print_matrix(D);
	
        c_eq_asm = matrix_comp(C, D);
        printf("Asm equal to C:  %s\n", c_eq_asm ? "yes" : "no");

	return 0;
}
