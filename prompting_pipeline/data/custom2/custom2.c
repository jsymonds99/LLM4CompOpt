#include <stdio.h>
#include <stdlib.h>


double find_max(double a, double b, double c){
    // find max from -10 to 10 of a*x^2 + b*x + c
    double max = -1000000000;
    for (int i = -10; i <= 10; i++){
        double val = a*i*i + b*i + c;
        if (val > max){
            max = val;
        }
    }
    return max;
}

double find_min(double a, double b, double c){
    // find min from -10 to 10 of a*x^2 + b*x + c
    double min = 1000000000;
    for (int i = -10; i <= 10; i++){
        double val = a*i*i + b*i + c;
        if (val < min){
            min = val;
        }
    }
    return min;
}


int main() {

    int j = 15;
    int k = 10;
    for(int i = 0; i < j; i++){
        if(i % 2 == 0){
            j+=2;
            k*=3;
        }
        else{
            j-=1;
            k /= 5;
        }
        for(int l = 0; l < k; l++){
            if(l % 2 == 0){
                j+=2;
                k*=3;
            }
            else{
                j-=1;
                k /= 5;
            }
            printf("max %f\n", find_max(l, j, k));
            printf("min %f\n", find_min(l, j, k));
        }
        
    }


    return 0;
}