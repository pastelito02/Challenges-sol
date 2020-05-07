//Author Marinovsky
#include <bits/stdc++.h>

using namespace std;

int main(){
  int q;
  double dx=0.5;
  double dy=sqrt(0.75);
  double X,Y;
  string s="";
  vector<double> res;
  cin>>q;
  while(q--){
    X=0;Y=0;
    cin>>s;
    for(auto c: s){
      switch(c){
        case 'A':
          X++;
          break;
        case 'B':
          Y+=dy;
          X+=dx;
          break;
        case 'C':
          Y+=dy;
          X-=dx;
          break;
        case 'D':
          X--;
          break;
        case 'E':
          Y-=dy;
          X-=dx;
          break;
        case 'F':
          Y-=dy;
          X+=dx;
          break;
      };
      //cout<<X<<" "<<Y<<endl;
    }
    res.push_back(sqrt(pow(X,2)+ pow(Y,2)));

  }
  for(auto c: res){
    cout << fixed << showpoint;
    cout<<setprecision(8);
    cout<<c<<" ";
  }
  return 0;
}
