//Author stanispos
      let arr = string.split('\n');
      let newArray = arr.map((item, index) => {
        if (count > index) {
          let a = Number(item.slice(0, item.indexOf(' ')));
          let b = Number(item.slice(item.indexOf(' '), item.length));
          let c = a * b;
          while (c != 0) {
            if ((b % c == 0) && (a % c == 0)) {
              return (`(${c} ${(a * b) / c})`);
            }
            c--;
          }
        }
      }).join(' ')
      console.log(newArray)
