char get_grade(int a, int b, int c) {
  switch ((a + b + c) / 30) {
    case 10:
    case 9: return 'A';
    case 8: return 'B';
    case 7: return 'C';
    case 6: return 'D';
    default: return 'F';
  }
}
