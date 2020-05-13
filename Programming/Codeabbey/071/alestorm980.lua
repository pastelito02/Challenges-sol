--Author alestorm980
--[[
Code to solve the problem Fibonacci Divisibility Advanced
from codeabbey in lua
]]

function find_divisor(mod)
  --[[
  method to find first divisor using modular arithmetic
  using modular arithmetic addition
  ( a + b ) % c == (( a % c ) + ( b % c)) % c
  ]]
  -- var to store F(n-2) term of Fibonacci sequence module value to search
  local a = 0 % mod
  -- var to store F(n-1) term of Fibonacci sequence module value to search
  local b = 1 % mod
  -- current Fibonacci term
  local fibo = ( a + b ) % mod
  -- var to count current Fibonacci position
  local count = 1

 -- iterate until the current fibo=0, that means the current number is divisible
  while fibo ~= 0 do
      -- calculate current Fibonacci number
    fibo = (( a % mod ) + ( b % mod ))%mod
    -- update F(n-2)
    a = b
    -- update F(n-1)
    b = fibo
    -- update counter
    count =  count + 1
  end

  -- return value
  return count
end


test_cases = io.read("*n")

local solution = ""

for i = 1, test_cases do
  number = io.read("*n")
  solution = solution .. find_divisor(number) .. " "
end

print(solution)
