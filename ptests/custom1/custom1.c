#include <stdio.h>
#include <stdlib.h>

int recursive_factorial(int n) {
    if (n == 0) {
        return 1;
    }
    return n * recursive_factorial(n - 1);
}

int normal_factorial(int n) {
    int result = 1;
    for (int i = 1; i <= n; i++) {
        result *= i;
    }
    return result;
}

int doing_something(int a, int b) {

    int s = 0;
    for (int i = 0; i < a; i++){
        s += i;
        for(int j = 0; j < b; j++){
            s -= j;
            int x = recursive_factorial(i);
            int y = normal_factorial(j);
            s += x - y;
        } 
    }

    return s;
}


int main(int argc, char *argv[]) {

    // list of 5 numbers
    int as[5] = {1, 6, 2, 9, 10};
    int bs[5] = {2, 3, 4, 5, 6};

    for (int i = 0; i < 5; i++) {
        printf("%d choose %d = %d\n", as[i], bs[i], doing_something(as[i], bs[i]));
    }

    return 0;
}