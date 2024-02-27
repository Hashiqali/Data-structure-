main() {
  List arr = [23, 1, 345, 56, 67, 86, 34];
  print('insertion :${insertionsort(arr)}');
  print('bubble    :${bubblesort(arr)}');
  print('selection :${selectionsort(arr)}');
  print('quick     :${quicksort(arr)}');
  print('merge     :${mergesort(arr)}');
}

insertionsort(List arr) {
  for (int i = 0; i < arr.length; i++) {
    int temp = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > temp) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = temp;
  }
  return arr;
}

bubblesort(List arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = 0; j < arr.length - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j + 1];
        arr[j + 1] = arr[j];
        arr[j] = temp;
      }
    }
  }
  return arr;
}

selectionsort(List arr) {
  for (int i = 0; i < arr.length; i++) {
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[i] > arr[j]) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }
  }
  return arr;
}

quicksort(List arr) { ///   0(nlogn)TS
  sort(arr, 0, arr.length - 1);
  return arr;
}

sort(List arr, int firstidx, int lastidx) {
  if (firstidx >= lastidx) {
    return;
  }
  int pivot = firstidx;
  int first = firstidx + 1;
  int last = lastidx;
  while (first <= last) {
    if (arr[last] < arr[pivot] && arr[first] > arr[pivot]) {
      swap(arr, first, last);
      first++;
      last--;
    }
    if (arr[first] <= arr[pivot]) {
      first++;
    }
    if (arr[last] >= arr[pivot]) {
      last--;
    }
    swap(arr, last, pivot);
    sort(arr, firstidx, lastidx - 1);
    sort(arr, firstidx + 1, lastidx);
  }
}

swap(List arr, int i, int j) {
  int temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}

mergesort(List arr) { //o(nlogn)TS
  if (arr.length <= 1) {
    return arr;
  }
  int mid = (arr.length / 2).floor();
  List firsthalf = arr.sublist(0, mid);
  List lasthalf = arr.sublist(mid, arr.length);
  return join(mergesort(firsthalf), mergesort(lasthalf));
}

join(List firsthalf, List lasthalf) {
  List newlist = [];
  while (firsthalf.isNotEmpty && lasthalf.isNotEmpty) {
    if (firsthalf[0] <= lasthalf[0]) {
      newlist.add(firsthalf.removeAt(0));
    } else {
      newlist.add(lasthalf.removeAt(0));
    }
  }
  List result = [...newlist, ...firsthalf, ...lasthalf];
  return result;
}
