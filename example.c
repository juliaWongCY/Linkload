/*
 * This shows a procedure call with a single parameter.
 * It looks simple enough, but at high optimisation levels 
 * produces some pretty weird code.
 */

int i;
int a[100];
int b=42;

void f(int c){
  for (i = 1; i < 100-2*25; i = i + 1){
    a[i] = c*3+10;
  }
}

int main(){
  f(b);
  return 0;
}
