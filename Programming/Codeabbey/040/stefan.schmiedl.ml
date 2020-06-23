(*Author stefan.schmiedl*)
type floor =
  | Start
  | Open
  | Blocked
  | Finish

type cell = {
  kind: floor;
  mutable pc:   int
}

type grid = {
  rows:  int;
  cols:  int;
  cells: cell array array
}

let id x = x

let read_grid rows cols : grid =
  let read_cell row col = { pc = 0;
                            kind = match Scanf.scanf "%c " id with
                              | '+' -> Open
                              | 'X' -> Blocked
                              | '@' -> Start
                              | '$' -> Finish
                              | _   -> raise (Invalid_argument "grid problem") } in
  let read_row r = Array.init cols (read_cell r) in
  { rows; cols; cells = Array.init rows read_row }


let walk_grid grid = 

  let pathcount r c =
    if r < 0 || r >= grid.rows || c < 0 || c >= grid.cols
    then 0
    else grid.cells.(r).(c).pc in

  let update r c =
    if 0 <= r && r < grid.rows
       && 0 <= c && c < grid.cols
       && grid.cells.(r).(c).kind <> Blocked
    then grid.cells.(r).(c).pc <- pathcount (r-1) c + (pathcount r (c-1)) in

  let rec link_slice (llr,llc) = function
    | -1 -> ()
    | i -> begin
        update (llr-i) (llc+i);
        link_slice (llr,llc) (i-1)
      end in

  let count = max grid.rows grid.cols in

  grid.cells.(0).(0).pc <- 1;
  for i = 1 to grid.rows - 1 do
    link_slice (i,0) count
  done;
  for i = 1 to grid.cols - 1 do
    link_slice (grid.rows-1,i) count
  done


let () =
  let grid = Scanf.scanf "%d %d " read_grid in
  walk_grid grid;
  Printf.printf "%d\n" grid.cells.(grid.rows-1).(grid.cols-1).pc
