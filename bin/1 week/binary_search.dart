binarysearch(List arr, int target) {
  int firstidx = 0;
  int lastidx = arr.length - 1;
  while (firstidx <= lastidx) {
    int rounded = ((firstidx + lastidx) / 2).floor();

    if (target == arr[rounded]) {
      return rounded;
    }
    if (target < arr[rounded]) {
      lastidx = rounded - 1;
    } else {
      firstidx = rounded + 1;
    }
  }
  return -1;
}

main() {
  List arr = [234, 56, 312, 756, 32, 54, 3];
  print(binarysearch(arr, 756));
}
