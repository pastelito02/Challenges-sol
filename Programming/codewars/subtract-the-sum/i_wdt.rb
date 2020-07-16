#i_wdt
FRUITS = %w[kiwi pear kiwi banana melon banana melon pineapple apple pineapple cucumber pineapple cucumber orange grape orange grape apple grape cherry pear cherry pear kiwi banana kiwi apple melon banana melon pineapple melon pineapple cucumber orange apple orange grape orange grape cherry pear cherry pear apple pear kiwi banana kiwi banana melon pineapple melon apple cucumber pineapple cucumber orange cucumber orange grape cherry apple cherry pear cherry pear kiwi pear kiwi banana apple banana melon pineapple melon pineapple cucumber pineapple cucumber apple grape orange grape cherry grape cherry pear cherry apple kiwi banana kiwi banana melon banana melon pineapple apple pineapple]

def subtract_sum(number)
  sum = number.digits.sum
  number = number - sum

  return FRUITS[number - 1] || subtract_sum(number)
end
