-- Author atercattus
cnt = io.read('*n')
io.read('*line')

for cnt = cnt, 1, -1 do
  local str = io.read('*line'):lower():gsub('[^a-z]+', '')
  io.write(str == str:reverse() and 'Y' or 'N', ' ')
end
