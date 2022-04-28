//recursion for factorial

int factorial(int n){
	if(n==0){
		return 0;
	}else if(n==1){
		return 1;
	}else{
		return n * factorial(n-1);
	}
}

int main(){
	int n = 10;
	ans = factorial(n);
	printf("factorial of n is %d \n", &n);
	return 0;

}

