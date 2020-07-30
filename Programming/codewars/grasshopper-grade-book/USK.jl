function getgrade(a, b, c)
  score = +(a,b,c)/3
  score<60 ? 'F' : score<70 ? 'D' : score<80 ? 'C' : score<90 ? 'B' : 'A'
end
