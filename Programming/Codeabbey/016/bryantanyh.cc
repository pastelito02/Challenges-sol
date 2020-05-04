//Author bryantanyh
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char** argv){
  if (argc != 3){
    printf("please enter input and output\n");
    return 0;
  }

  char* input_file = argv[1];
  char* output_file = argv[2];

  FILE* fd = fopen(input_file, "r");
  FILE* fdw = fopen(output_file, "w");

  int N;
  fscanf(fd, "%d", &N);

  for(int i = 0; i < N; i++){
    int C;
    int stor = 0;
    int n = 0;
    do{
      fscanf(fd, "%d", &C);
      stor += C;
      n += 1;
      printf("%d ", stor);
      printf("%d ", n);
      } while(C != 0);
    int ans = (int) round((float) stor/(float) (n-1));
    fprintf(fdw, "%d ", ans);
    printf("%d ", ans);
  }

  fclose(fd);
  fclose(fdw);
  return 0;
}
