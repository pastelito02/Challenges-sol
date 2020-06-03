//Author Phocisticks
const fs = require('fs');
const readline = require('readline');

const rl = readline.createInterface({
  input: fs.createReadStream('input.txt'),
  crlfDelay: Infinity
});

rl.on('line', (line) => {
  // console.log(`Line from file: ${line}`);

  var args = line.split(' ');

  if(args.length > 2){
    const [printer1Time, printer2Time, pages] = args;

    var timestep = 1;
    var curPages = 0;

    while(curPages < pages)
    {
      if(timestep % printer1Time === 0){
        curPages++;
      }
      if(timestep % printer2Time === 0){
        curPages++;
      }
      
      timestep++;
    }
    console.log(timestep-1)
  }
});


