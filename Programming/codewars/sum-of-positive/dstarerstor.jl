#dstarerstor
function positivesum(arr::Array{Int})
  # your code here
  sum(filter(x -> x > 0, arr))
end
