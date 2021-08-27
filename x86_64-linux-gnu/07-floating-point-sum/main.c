#include <stdio.h>
//
#include "sum.h"

typedef double real;

int main(void) {
  real numbers[] = {1.9, 2.8, 3.7, 4.6, 5.5};
  const size_t numbers_size = sizeof(numbers) / sizeof(real);

  printf("%20.7f\n", sum(numbers, numbers_size));

  return 0;
}
