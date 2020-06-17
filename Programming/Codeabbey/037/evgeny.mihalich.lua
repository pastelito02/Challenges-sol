--Author evgeny.mihalich
summ, percent, month = io.read("*n", "*n", "*n")

m_perc = percent/100/12
k = (1 + m_perc)^month
m_payment = summ * m_perc * k / (k - 1)

print(math.ceil(m_payment))