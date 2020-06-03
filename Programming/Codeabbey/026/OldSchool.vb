'Author OldSchool
Dim a(19) As String

Sub start()

Dim in_string As String
Dim i As Integer

a(1) = "4692 1632"
a(2) = "9 2934"
a(3) = "1820 60"
a(4) = "240 750"
a(5) = "8 88"
a(6) = "23 528"
a(7) = "6106 3408"
a(8) = "5467 5852"
a(9) = "546 3"
a(10) = "2814 4200"
a(11) = "64 6"
a(12) = "8370 1710"
a(13) = "33 9"
a(14) = "6799 1"
a(15) = "6468 3108"
a(16) = "1872 2304"
a(17) = "2272 538"
a(18) = "696 97"
a(19) = "7 8"

For i = 1 To 19
   result_ = result_ & rnd_cyclic_steps_count(a(i)) & " "
Next i
Debug.Print result_

End Sub

Function rnd_cyclic_steps_count(in_string As String) As String

Dim out_result As String
Dim x1 As Integer
Dim x2 As Integer
Dim nums() As Long

If Right(Trim(in_string), 1) <> "" Then in_string = Trim(in_string) & " "
c = Len(in_string) - Len(Replace(in_string, " ", ""))
    
If c > 0 Then
   ReDim Preserve nums(c)
   x1 = 1
   x2 = 1
   For i = 1 To c
      x2 = InStr(x1, in_string, " ")
      nums(i) = Val(Mid(in_string, x1, x2 - x1))
      x1 = x2 + 1
   Next i
   
   min_value = 0
   cyclic_counter = 0
   num_1 = nums(1)
   num_2 = nums(2)
   Do While min_value = 0
    DoEvents
    cyclic_counter = cyclic_counter + 1
    If cyclic_counter > 100000 Then Exit Do '
      If nums(1) > nums(2) Then
        nums(1) = nums(1) - nums(2)
      Else
        If nums(1) = nums(2) Then
           min_value = nums(1)
        Else
           nums(2) = nums(2) - nums(1)
        End If
      End If
    'Debug.Print cyclic_counter, nums(1), nums(2)
   Loop
End If
out_result = "(" & Trim(Str(min_value)) & " " & Trim(Str((num_1 * num_2) / min_value)) & ")"
rnd_cyclic_steps_count = out_result

End Function