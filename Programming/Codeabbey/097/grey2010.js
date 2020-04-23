//Author grey2010
const girlsAndPigs = (arr)=>{
  arr = arr.map(item => item.split(' ').map(Number));
  let girl, counter, result = [];
  for(let i=0;i<arr.length;i++){
    girl = 1;
    counter = 0;
    if(!(arr[i][0]%4)) girl++;
    while (arr[i][0]-girl*2>=4){
      if(!((arr[i][1]-girl*2)/((arr[i][0]-girl*2)/4)%2)) counter++;
      girl+=2;
    }
    result.push(counter);
  }
  return result.join(' ');
}
