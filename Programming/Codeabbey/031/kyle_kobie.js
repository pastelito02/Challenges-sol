//Author kyle_kobie
var repeat=parseInt(input());
for(i=0;i<repeat;i++){
    var data=input().split(' ');
    data[1]=data[1].split('');
    if(parseInt(data[0])>0){
        var handle=data[1].splice(0,parseInt(data[0]));
        output(data[1].join('')+handle.join('')+' ');
    }
    else{
        var handle=data[1].splice(parseInt(data[0]),parseInt(data[0])*-1)
        output(handle.join('')+data[1].join('')+' ');
    }
}