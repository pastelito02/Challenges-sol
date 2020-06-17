'Author Guy Gervais
Sub Main
    
    dim loan = 700000
    dim intr = .10 / 12
    dim mnts = 162

    dim pay = Math.Ceiling(loan * ( intr * (1 + intr)^mnts ) / ( (1 + intr)^mnts - 1))

    pay.dump


End Sub
