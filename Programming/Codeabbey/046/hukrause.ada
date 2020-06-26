--Author hukrause
with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;

use Ada.Text_IO;
use Ada.Integer_Text_IO;
use Ada.Strings.Unbounded;

procedure codeabby46 is
  count,position : Positive;
  result : Unbounded_String;
  type bitset is mod 512;
  type win is array (1..8) of bitset;
  wins : win := (448,56,7,273,84,292,146,73);
  type player is 
    record
      draws : bitset := 0;
      wins : Boolean;
      position : Positive;
    end record;
  playera,playerb : player;

  function is_wining (player : bitset) return Boolean is
    temp : bitset;
  begin
    for i in wins'Range loop
      temp := player and wins(i);
      if temp = wins(i) then
    return True;
      end if;
    end loop;
    return False;
  end is_wining;

begin
  Get(count);
  Skip_Line;
  for i in 1..count loop
    playera.draws := 0;
    playerb.draws := 0;
    draws : for i in 1..9 loop
      Get(position);
      if i mod 2 = 0 then
    playerb.draws := playerb.draws or bitset(2 ** (position -1));
    playerb.position := i;
    playerb.wins := is_wining(playerb.draws);
    exit draws when playerb.wins;
      else
    playera.draws := playera.draws or bitset(2 ** (position -1));
    playera.position := i;
    playera.wins := is_wining(playera.draws);
    exit draws when playera.wins;
      end if;
    end loop draws;
    Skip_Line;
    if playera.wins then
      Append(result, Positive'Image(playera.position));
    elsif playerb.wins then
      Append(result, Positive'Image(playerb.position));
    else
      Append(result, " 0");
    end if;
  end loop;
  Put_Line(To_String(result));
end codeabby46;
