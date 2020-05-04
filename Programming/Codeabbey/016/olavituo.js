//Author olavituo
var a = input()
var ans = []

for(i=0;i<a;i++){
  x = input().split(" ").map(Number)
  len = x.length-1
  sum = 0
  for(j=0;j<len;j++){
    sum += x[j]
  }
  ans[i] = [Math.round(sum/len)+" "]
}

output(ans.join(" "))
