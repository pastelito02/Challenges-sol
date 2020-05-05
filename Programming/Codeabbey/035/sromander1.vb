'Author sromander1
Public Class Form1
  Private Sub ButCalc_Click(sender As Object, e As EventArgs) Handles ButCalc.Click
    Dim listArray() As String
    Dim a As Decimal
    Dim b As Decimal
    Dim c As Decimal
    Dim years As Integer
    ReDim listArray(ListBox1.Items.Count - 1)
    ListBox1.Items.CopyTo(listArray, 0)

    For Each item In listArray
      Dim stringArray() As String = Split(item)
      Decimal.TryParse(stringArray(0), a)
      Decimal.TryParse(stringArray(1), b)
      Decimal.TryParse(stringArray(2), c)
      Do While a < b
        a += (Math.Floor(a * c)) / 100
        years += 1
      Loop
      TextBox2.Text += years & " "
      years = 0
    Next
  End Sub
End Class
