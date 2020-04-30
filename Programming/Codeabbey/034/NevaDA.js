//Author NevaDA
N=parseInt(input(1));
sum="";
for (n=0;n<N;n++){
  InV=input(2+n).split(' ');
  A=parseFloat(InV[0]);
  B=parseFloat(InV[1]);
  C=parseFloat(InV[2]);
  D=parseFloat(InV[3]);
  a=0; b=100; eps=1E-7;
  while ((b-a)>eps){
    x=(a+b)/2;
    y=A * x + B * Math.sqrt(Math.pow(x,3)) - C * Math.exp(-x / 50) - D;
    if (y>0){
      b=x;
    }else{
      a=x;
    }
  }
  if (n>0){sum+=" ";}
  sum+=x;
}
output(sum);
