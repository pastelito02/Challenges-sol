getGrade = (s1, s2, s3) ->
  mean = (s1 + s2 + s3) / 3
  if mean >= 90
    return 'A'
  if mean >= 80
    return 'B'
  if mean >= 70
    return 'C'
  if mean >= 60
    return 'D'
  return 'F'
