#Author pearl_barley
@a = split(/\s+/, <STDIN>);
$n = $a[0];
@res = (0) x $a[1];
@s = split(/\s+/, <STDIN>);
for ($i = 0; $i < $n; $i++) {
  $res[$s[$i] - 1] += 1;
}
print join(" ", @res);
