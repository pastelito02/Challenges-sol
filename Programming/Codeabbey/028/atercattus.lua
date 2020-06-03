--Author atercattus
local function BMI(weight, height)
    return weight / math.pow(height, 2)
end

local bmi_table = {
    {'under',  18.5},
    {'normal', 25.0},
    {'over',   30.0},
    {'obese',  math.huge}
}

for cnt = io.read('*n'), 1, -1 do
    local weight, height = io.read('*n'), io.read('*n')
    local bmi = BMI(weight, height)

    for _,v in ipairs(bmi_table) do
        if bmi < v[2] then
            io.write(v[1], ' ')
            break
        end
    end
end