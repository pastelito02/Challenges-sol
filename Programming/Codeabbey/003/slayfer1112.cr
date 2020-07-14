#! /usr/bin/crystal

# $ ameba --all --fail-level Convention slayfer1112.cr
# Inspecting 1 file.
# .
# Finished in 8.92 milliseconds
# $ crystal build --error-trace --error-on-warnings \
# --threads 1 --no-codegen slayfer1112.cr

cases = gets


def sum(arr)
  sums = 0
  arr.each do |x|
    x = x.is_a?(String) ? x.try &.to_i : x
    sums += x
  end
  sums
end

if cases
  cases = cases.is_a?(String) ? cases.try &.to_i : cases
  0.step(to:cases,by:1) do |_|
    args = gets
    if args
      args = args.split
      printf "#{sum(args)} "
    end
  end
end
puts

# $ cat DATA.lst | crystal slayfer1112.cr
# 27098
