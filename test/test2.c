int max (int num1 , int num2){
	if(num1>=num2){
		return num1;
	}else{
		return num2;
	}
}

int main(){
	int a = 200;
	int b = 300;
	int result = max(a,b);
	printf("Maximum num is %d \n ", &result );

	return 0;
}