// Struct Test
typedef struct MyStruct {
    int p;
    int q;
    int r;
    double d;
} mystruct;

int main(int argc, char **argv) {
    static mystruct sample = {4, 8, 10, 10.0};
    const int p = sample.p;
    int q = sample.q;
    int r = sample.r;
    double d = sample.d;
    return 1;
}