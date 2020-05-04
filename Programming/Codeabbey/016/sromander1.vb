'Author sromander1
Public Class Form1
  Private Sub Button1_Click(sender As Object, e As EventArgs) Handles butCalc.Click
    Dim sum As Integer
    Dim average As Integer
    Dim size As Integer
    Dim listArray() As String

    ReDim listArray(ListBox1.Items.Count - 1)
    ListBox1.Items.CopyTo(listArray, 0)

    For Each item In listArray
      Dim stringArray() As String = Split(item)
      size = stringArray.Length - 1
      For Each place In stringArray
        sum += place
      Next
      average = sum / size
      TextBox1.Text += average & " "
      sum = 0
    Next
  End Sub
End Class
