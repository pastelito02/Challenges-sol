//Author emmanuelle
#include <stdio.h>

int main()
{
  FILE *input = fopen("input/collatz.txt", "r");
  if(!input) return 1;

  int num_qty;

  // Read in amount of numbers
  fscanf(input, "%d", &num_qty);

  int nums[num_qty];
  int next_num, counter;

  // Read in actual values
  for(int i = 0; i < num_qty; i++)
  {
    fscanf(input, "%d", &nums[i]);
  }

  // Not gonna use it again anyways
  fclose(input);

  for(int i = 0; i < num_qty; i++)
  {
    counter = 0;
    next_num = nums[i];

    do
    {
      next_num = (next_num & 1) == 0 ? next_num / 2
                       : 3 * next_num + 1;

      counter++;
    }
    while(next_num != 1);

    printf("%d ", counter);
  }
}
