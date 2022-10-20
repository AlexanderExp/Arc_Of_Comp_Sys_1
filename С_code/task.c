int task(const int array[], int size, int x, int *B) {
    int j = 0;
    for (int i = 0; i < size; ++i) {
        if (array[i] != x) {
            B[j++] = array[i];
        }
    }
    return j;
}