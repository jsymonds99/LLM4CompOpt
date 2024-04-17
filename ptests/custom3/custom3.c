#include <stdio.h>
#include <stdlib.h>

#define SIZE 5

void printMatrix(int matrix[SIZE][SIZE]) {
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            printf("%d\t", matrix[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

void manipulateMatrix(int matrix[SIZE][SIZE]) {
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            for (int k = 0; k < SIZE; k++) {
                matrix[i][j] += k;  // Add index k to each element
                for (int l = 0; l < SIZE; l++) {
                    matrix[i][j] *= l + 1;  // Multiply by index l+1
                    for (int m = 0; m < SIZE; m++) {
                        matrix[i][j] -= m * (i + j);  // Subtract product of m, i, and j
                        for (int n = 0; n < SIZE; n++) {
                            if (n % 2 == 0) {
                                matrix[i][j] += n;  // Add n if it's even
                            } else {
                                matrix[i][j] -= n;  // Subtract n if it's odd
                            }
                        }
                    }
                }
            }
        }
    }
}

int main() {
    int matrix[SIZE][SIZE];

    // Initialize matrix with random values
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            matrix[i][j] = rand() % 10;
        }
    }

    printf("Original Matrix:\n");
    printMatrix(matrix);

    manipulateMatrix(matrix);

    printf("Manipulated Matrix:\n");
    printMatrix(matrix);

    return 0;
}