#include <stdio.h>
//
#include "fibonacci.h"

int main(void) {
  for (int i = 0; i < 40; ++i)
    printf("fibonacci(%3i) = %10i\n", i, fibonacci(i));
}
