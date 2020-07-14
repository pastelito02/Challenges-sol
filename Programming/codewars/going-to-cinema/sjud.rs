//sjud
fn movie(card: i32, ticket: i32, perc: f64) -> i32 {
  let mut sum = card as f64;
  let ticket = ticket as f64;
  for n in 1..{
      sum += ticket * perc.powf(n as f64);
      if sum.ceil() < ticket * n as f64{return n;}
  } 0
}
