--Author atercattus
local function primes_list(sieve_len)
    local half_len = math.ceil(math.sqrt(sieve_len))

    local sieve = {}
    sieve[2] = true
    sieve[3] = true

    for i = 1, half_len do
        local i2 = i * i
        for j = 1, half_len do
            local j2 = j * j

            local n = 4 * i2 + j2
            if n <= sieve_len and (n % 12 == 1 or n % 12 == 5) then
                sieve[n] = not sieve[n]
            end

            n = n - i2
            if n <= sieve_len and n % 12 == 7 then
                sieve[n] = not sieve[n]
            end

            n = n - 2 * j2
            if i > j and n <= sieve_len and n % 12 == 11 then
                sieve[n] = not sieve[n]
            end
        end
    end

    for i = 5, half_len do
        if sieve[i] then
            local i2 = i * i
            for j = i2, sieve_len, i2 do
                sieve[j] = false
            end
        end
    end

    local primes = {2, 3, 5}

    for i = 6, sieve_len do
        if i % 3 ~= 0 and i % 5 ~= 0 and sieve[i] then
            table.insert(primes, i)
        end
    end

    return primes
end

local ab, min, max = {}, math.huge, -math.huge
for cnt = io.read('*n'), 1, -1 do
    local a, b = io.read('*n'), io.read('*n')
    table.insert(ab, {a, b})
    min = math.min(min, a)
    max = math.max(max, b)
end

local primes = primes_list(max)

local function find_prime_idx(val)
    if val == primes[1] then
        return 1
    elseif val == primes[#primes] then
        return #primes
    end

    local f, t, prev_p = 1, #primes, nil
    while f ~= t do
        local p = math.floor((f + t) / 2 + 0.5)
        local prime = primes[p]
        if val == prime then
            return p
        elseif val < prime then
            t = p
        else
            f = p
        end

        if prev_p ~= nil then
            if prev_p == p then
                break
            end
        end
        prev_p = p
    end
    return nil
end

for _,ab in ipairs(ab) do
    local ai, bi = find_prime_idx(ab[1]), find_prime_idx(ab[2])
    io.write(bi - ai + 1, ' ')
end