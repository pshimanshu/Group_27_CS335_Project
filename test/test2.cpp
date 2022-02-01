
#include <iostream>

using namespace std;

int factorial(int m){
    if(m==1 || m==0) return 1;
    return m*factorial(m-1);
};

int main (){
    int n;
    cin  >> n;
    int f = factorial (n);
    cout << f;
   return 0;
}
