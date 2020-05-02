--Author atercattus
for cnt = io.read('*n'), 1, -1 do
  local A, B, N = io.read('*n'), io.read('*n'), io.read('*n')
  local S = (2*A + (N - 1)*B) * N / 2
  io.write(S, ' ')
end
