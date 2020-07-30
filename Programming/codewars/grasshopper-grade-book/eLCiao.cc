char getGrade(int a, int b, int c) {
  auto score = (a + b + c) / 3;
  if (score >= 90) return 'A';
  if (score >= 80) return 'B';
  if (score >= 70) return 'C';
  if (score >= 60) return 'D';
  return 'F';
}
