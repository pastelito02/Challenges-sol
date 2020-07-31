int better_than_average(int class_points[], int class_size, int your_points) {
  // Your code here :)
  // Note: class_size is the length of class_points.
  int i = 0, avarage = 0;

  for (i; i < class_size; i++) {
    avarage += class_points[i];
  }

  return your_points > avarage / class_size;
}
