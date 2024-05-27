#include "file1.h"
#include "file2.h"
#include "file3.h"
#include <stdio.h>
#include <stdlib.h>

int main(void){
  float s1 = 3.0f,s2 = 4.0f;
  float s3 = f1_func1(s1,s2);
  float s4 = s3+power2(s3);
  float s5 = s4+power3(s4);
  printf("the target is %.2f\n",s5);
  
  return 0;
}
