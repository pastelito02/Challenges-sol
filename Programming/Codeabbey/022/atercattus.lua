--Author atercattus
for cnt = io.read('*n'), 1, -1 do
    local X, Y, N = io.read('*n'), io.read('*n'), io.read('*n')

    local yf, yt, y = 1, N, 1
    while math.abs(yf - yt) > 0.1 do
        y = (yf + yt) / 2
        local f = (N - y) * X - y * Y

        if f < 0 then
            yt = y
        else
            yf = y
        end
    end

    yf, yt = math.floor(y), math.ceil(y)
    io.write(
        math.min(
            math.max(X*(N - yf), Y*yf),
            math.max(X*(N - yt), Y*yt)
        ),
        ' '
    )
end