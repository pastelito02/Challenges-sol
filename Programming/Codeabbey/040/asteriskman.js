//Author asteriskman
const [rows, cols] = input().split` `.map( v => v|0 );
let grid = [];
for (let i = 0; i < rows; i++) {
  let row = input().split` `;
  grid.push(row);
}

console.log(grid);


function takeStep(x, y) {
  if (x >= cols || y >= rows) {return 0;}
  const symbol = grid[y][x];
  
  switch (symbol) {
      case 'X': return 0;
      case '@':
      case '+': return takeStep(x + 1, y) + takeStep(x, y + 1);
      case '$': return 1;
  }
}

const paths = takeStep(0, 0);

console.log(paths);

output(paths);