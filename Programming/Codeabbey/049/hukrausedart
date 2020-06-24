//Author hukrause
with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO;


use Ada;

procedure codeabby49 is
  count,last,n : Positive;
  input,result : Strings.Unbounded.Unbounded_String;
  pair : String(1..2);
  type winner is 
    record
      player1, player2 : Natural := 0;
    end record;

  whowins : winner;
  function win (pair : String) return Natural is
  begin
    if pair = "RS" then
      return 1;
    elsif pair = "SP" then
      return 1;
    elsif pair = "PR" then
      return 1;
    elsif pair = "RR" then
      return 0;
    elsif pair = "SS" then
      return 0;
    elsif pair = "PP" then
      return 0;
    else 
      return 2;
    end if;
  end win;
  
begin
  Integer_Text_IO.Get(count);
  Text_IO.Skip_Line;
  for i in 1..count loop
    Strings.Unbounded.Text_IO.Get_Line(input);
    last := Strings.Unbounded.Length(input);
    n := 1;
    while n <= last loop
      pair := Strings.Unbounded.Slice(input,n,n+1);
      n := n + 3;
      if win(pair) = 2 then
    whowins.player2 := whowins.player2 + 1;
      else
    whowins.player1 := whowins.player1 + win(pair);
      end if;
    end loop;
    if whowins.player2 > whowins.player1 then
      Strings.Unbounded.Append(result,"2 ");
    else
      Strings.Unbounded.Append(result,"1 ");
    end if;
    whowins.player2 := 0;
    whowins.player1 := 0;
  end loop;
  Strings.Unbounded.Text_IO.Put_Line(result);
end codeabby49;