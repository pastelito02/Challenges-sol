//Author dissonantdev
let size = Number(input());

let array = input().split(' ').map(str => Number(str));

while(size > 1) {
    let [maxIndex, sorted] = getMaxValueIndex(array, size);
    
    output(maxIndex + " ");
    
    if(sorted) {
        break;
    }
    
    let temp = array[size-1];
    array[size-1] = array[maxIndex];
    array[maxIndex] = temp;
    
    size--;
}

function getMaxValueIndex(arr, size) {
    let maxIndex = 0;
    let sorted = true;
    
    for(var i = 1; i < size; i++) {
        sorted = sorted && arr[i] < arr[i-1];
        maxIndex = arr[i] > arr[maxIndex]? i : maxIndex;
    }
    
    return [maxIndex, sorted];
}