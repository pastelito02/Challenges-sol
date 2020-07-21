char *to_alternating_case(const char *s) {
int i=0;
char* res = strdup(s);
for(i=0; i<strlen(res);i++){
    if(res[i]<='z' && res[i]>='a'){
      *(res+i)-=32;
       }
      else if(res[i] <='Z' && res[i] >='A'){
      *(res+i) +=32;
       }
     else{}
  }
  return res;
}
