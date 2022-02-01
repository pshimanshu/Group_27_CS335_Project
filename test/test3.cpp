
#include <iostream>
using namespace std;


int ulog (int m){
    if(m==1 ) return 0;
    return 1+ulog(m/2);
};

int main (){
    int n;
    cin  >> n;
    int l = ulog (n);
    cout << l;
    return 0;
}
