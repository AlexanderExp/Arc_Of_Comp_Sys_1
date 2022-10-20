#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define max_size 10

extern int task(const int array[], int size, int x, int *B);

int main(int argc, char* argv[]) {
    int A[max_size];
    int B[max_size];
    int length;
    int lengthB;
    int i;
    int x;
    int input_option;
    FILE *input, *output;

    if (argc == 1) {
        printf("Choose an option for input:\n"
               "1. Console Input\n"
               "2. Random\n");
        scanf("%d", &input_option);
        printf("X = ");
        scanf("%d", &x);
        if (input_option == 1) {
            printf("Input length (0 < length <= %d): ", max_size);
            scanf("%d", &length);
            if (length < 1 || length > max_size) {
                printf("Incorrect length = %d\n", length);
                return 1;
            }
            for (i = 0; i < length; ++i) {
                printf("A[%d] = ", i);
                scanf("%d", A + i);
            }
        } else if (input_option == 2) {
            srand(time(NULL));
            length = 0;
            while (length < 1 || length > max_size) {
                length = rand();
            }
            for (int j = 0; j < length; ++j) {
                A[j] = rand() % 99;
                if (A[j] % 7 == 0) {
                    A[j] *= -1;
                }
            }
            printf("Array A: ");
            for (int j = 0; j < length; ++j) {
                printf("%d ", A[j]);
            }
            printf("\n");
        } else {
            printf("Incorrect input");
        }
    } else if (argc == 2) {
        x = atoi(argv[1]);
        input = fopen("input.txt", "r");
        fscanf(input, "%d", &length);
        if (length < 1 || length > max_size) {
            printf("Incorrect length = %d\n", length);
            return 1;
        }
        for (int j = 0; j < length; ++j) {
            fscanf(input, "%d", A + j);
        }
        fclose(input);
    }

    lengthB = task(A, length, x, B);

    if (argc == 2) {
        output = fopen("output.txt", "w");
        fprintf(output, "Array B: ");
        for (int j = 0; j < lengthB; ++j) {
            fprintf(output, "%d ", B[j]);
        }
        fclose(output);
        return 0;
    }
    printf("Array B: ");
    for (int j = 0; j < lengthB; ++j) {
        printf("%d ", B[j]);
    }
}