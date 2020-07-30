def get_grade(a, b, c)
  mean = (a + b + c) / 3
  if mean >= 90
    return 'A'
  end
  if mean >= 80
    return 'B'
  end
  if mean >= 70
    return 'C'
  end
  if mean >= 60
    return 'D'
  end
  return 'F'
end
