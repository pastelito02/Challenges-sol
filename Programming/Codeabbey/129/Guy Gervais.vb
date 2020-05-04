'Author Guy Gervais
Sub Main ' LINQPad 4
  for each line in input.Split(vbLf)
    dim nums = line.split(" "c).tolist.select(function(x) clng(x))
    dim N = nums(0), K = nums(1), I = nums(2)
    dim Nth = new Combination(N, K).Element(I)
    debug.write(Nth.toString & " ")
  next
End Sub

class Combination 'http://msdn.microsoft.com/en-us/library/aa289166(v=vs.71).aspx

  private _digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

   private _N as long = 0
  private _K as long = 0
  private _Arr() as long = nothing

  Public Sub New(N As Long, K As Long)
    _N = N : _K = K : _Arr = New Long(_K - 1) {}
    For i = 0 To _K - 1
      _Arr(i) = i
    Next
  End Sub

  Public Sub New(N As Long, K As Long, a() As Long)
    _N = N : _K = K : _Arr = New Long(_K - 1) {}
    For i = 0 To a.Length - 1
      _Arr(i) = a(i)
    Next
  End Sub

  Public Function Element(Nth As Long) As Combination
    Dim ans = New Long(_K - 1) {}
    Dim a = _N, b = _K, x = (Choose(_N, _K) - 1) - Nth
    For i = 0 To _K - 1
      ans(i) = LargestV(a, b, x)
      x = x - Choose(ans(i), b)
      a = ans(i)
      b = b - 1
    Next

    For i = 0 To _K - 1
      ans(i) = (_N - 1) - ans(i)
    Next

    Return New Combination(_N, _K, ans)

  End Function

  Shared Function Choose(N As Long, K As Long) As Long
    If N < K Then Return 0
    If N = K Then Return 1
    Dim delta As Long, iMax As Long
    If k < n - k Then
      delta = n - k
      iMax = k
    Else
      delta = k
      iMax = n - k
    End if
    Dim ans = delta + 1
    For i = 2 To iMax
      ans = (ans * (delta + i)) / i
    Next
    Return ans
  End Function

  Shared Function LargestV(a As Long, b As Long, x As Long) As Long
    Dim v = a - 1
    do while Choose(v, b) > x
      v -= 1
    loop
    Return v
  End Function

  Overrides Function ToString() As String
    Dim s = ""
    For i = 0 To _K - 1
      s &= _digits(_Arr(i))
    Next
    Return s
  End Function

end class
