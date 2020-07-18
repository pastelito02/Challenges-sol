#illusory_monad
function firstnonconsecutive(arr)
  for i in 2:length(arr)
    arr[i] != 1 + arr[i-1] && return arr[i]
  end
  nothing
end
