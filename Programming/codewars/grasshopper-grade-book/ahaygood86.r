get_grade <- function(a, b, c) {
  grade <- mean(c(a, b, c))
  if (grade >= 90) { 'A' }
  else if (grade < 90 & grade >= 80) { 'B' }
  else if (grade < 80 & grade >= 70) { 'C' }
  else if (grade < 70 & grade >= 60) { 'D' }
  else if (grade < 60) { 'F' }
}
