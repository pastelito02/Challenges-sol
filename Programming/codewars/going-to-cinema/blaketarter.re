//blaketarter
let movie = (card: int, ticket: int, perc: float): int => {
  let rec calcCosts =
          (
            last_card_total: float,
            last_card_ticket_price: float,
            iteration: int,
          )
          : int => {
    let current_card_ticket_price = last_card_ticket_price *. perc;
    let current_card_total = last_card_total +. current_card_ticket_price;
    let current_iteration = iteration + 1;
    let current_ticket_price = float_of_int(ticket * current_iteration);

    ceil(current_card_total) < current_ticket_price ?
      current_iteration :
      calcCosts(
        current_card_total,
        current_card_ticket_price,
        current_iteration,
      );
  };
  calcCosts(float_of_int(card), float_of_int(ticket), 0);
};
